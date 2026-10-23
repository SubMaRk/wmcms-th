<?php
/**
* 计数器队列
*
* 小说页每次被打开都要给点击/推荐/收藏 +1，原来的做法是每个请求都对主表执行一次
* UPDATE。排行榜和首页会同时读这张表，写多了就会出现行锁等待。
* 这里把增量先记到文件队列里，过几秒再合并成一次 UPDATE，
* 读到的数字仍然是最新的（页面会把本次增量自己加上去）。
*
* @package        WMCMS
*/
class counter
{
	//同一个条目在多少秒内的增量合并成一次写入
	protected $window = 5;
	//队列文件最多累积多少条就强制合并
	protected $maxLines = 500;
	//计数器的周期字段：日、周、月、年、总
	protected $periodArr = array('today','week','month','year','all');

	/**
	 * 队列目录
	 */
	protected function QueueDir()
	{
		$dir = WMROOT.'cache/counter/';
		if( !is_dir($dir) )
		{
			@mkdir($dir, 0777, true);
		}
		return $dir;
	}

	/**
	 * 队列文件
	 * @param 参数1，必须，表名
	 */
	protected function QueueFile( $table )
	{
		return $this->QueueDir().preg_replace('/[^a-z0-9_]/i', '', $table).'.queue';
	}

	/**
	 * 累加一次计数
	 * @param 参数1，必须，表名，例如 novel_novel
	 * @param 参数2，必须，主键值
	 * @param 参数3，必须，计数器类型：click / rec / coll
	 * @param 参数4，选填，增量，默认 1
	 */
	function Bump( $table , $id , $type = 'click' , $num = 1 )
	{
		$id = (int)$id;
		if( $id <= 0 )
		{
			return false;
		}
		$file = $this->QueueFile($table);
		//第一次入队时记下开始时间，合并窗口从这里算起
		//（不能看队列文件的修改时间：每次追加都会把它刷新）
		$since = $file.'.since';
		if( !is_file($since) )
		{
			@file_put_contents($since, (string)time());
		}
		//一行一条，写入用追加+锁，多个进程同时写也不会丢
		$line = $id."\t".$type."\t".(int)$num."\n";
		$fp = @fopen($file, 'ab');
		if( $fp )
		{
			if( flock($fp, LOCK_EX) )
			{
				fwrite($fp, $line);
				flock($fp, LOCK_UN);
			}
			fclose($fp);
		}
		//文件超过窗口时间或行数就合并
		$this->MaybeFlush($table);
		return true;
	}

	/**
	 * 到达窗口就合并，否则什么都不做
	 * @param 参数1，必须，表名
	 */
	function MaybeFlush( $table )
	{
		$file = $this->QueueFile($table);
		if( !is_file($file) )
		{
			return false;
		}
		$since = @file_get_contents($file.'.since');
		$since = (int)$since;
		if( $since <= 0 )
		{
			//没有标记文件就直接合并，保证不会一直积压
			return $this->Flush($table);
		}
		if( time() - $since < $this->window )
		{
			return false;
		}
		return $this->Flush($table);
	}

	/**
	 * 合并队列并写入数据库
	 * @param 参数1，选填，只处理这一张表，留空处理全部
	 * @param 参数2，选填，是否强制（cron 用）
	 */
	function Flush( $table = '' , $force = false )
	{
		$tableArr = array();
		if( $table != '' )
		{
			$tableArr[] = $table;
		}
		else
		{
			$list = @scandir($this->QueueDir());
			if( $list )
			{
				foreach ($list as $name)
				{
					if( substr($name, -6) == '.queue' )
					{
						$tableArr[] = substr($name, 0, -6);
					}
				}
			}
		}
		$done = 0;
		foreach ($tableArr as $one)
		{
			$done += $this->FlushOne($one);
		}
		return $done;
	}

	/**
	 * 合并一张表的队列
	 * @param 参数1，必须，表名
	 */
	protected function FlushOne( $table )
	{
		$file = $this->QueueFile($table);
		if( !is_file($file) )
		{
			return 0;
		}
		//先把队列拿走，避免别的进程重复处理
		$doing = $file.'.'.getmypid().'.doing';
		if( !@rename($file, $doing) )
		{
			return 0;
		}
		$lines = @file($doing, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
		@unlink($doing);
		@unlink($file.'.since');
		if( !$lines )
		{
			return 0;
		}
		//按 主键 + 类型 汇总
		$sum = array();
		foreach ($lines as $line)
		{
			$part = explode("\t", $line);
			if( count($part) < 3 )
			{
				continue;
			}
			$key = (int)$part[0].'|'.preg_replace('/[^a-z]/', '', strtolower($part[1]));
			if( !isset($sum[$key]) )
			{
				$sum[$key] = 0;
			}
			$sum[$key] += (int)$part[2];
		}
		$done = 0;
		$byId = array();
		foreach ($sum as $key=>$num)
		{
			list($id, $type) = explode('|', $key);
			$byId[$id][$type] = $num;
		}
		$conf = $this->TableConf($table);
		if( $conf == false )
		{
			return 0;
		}
		$idField = $conf['id'];
		$done = 0;
		$byId = array();
		foreach ($sum as $key=>$num)
		{
			list($id, $type) = explode('|', $key);
			$byId[$id][$type] = $num;
		}
		foreach ($byId as $id=>$typeArr)
		{
			//读一次当前值：周期边界要拿原来的时间戳，才能决定是重置还是累加
			$selectField = array();
			foreach ($typeArr as $type=>$num)
			{
				if( !in_array($type, $conf['type']) )
				{
					continue;
				}
				foreach ($this->periodArr as $period)
				{
					$selectField[] = $conf['prefix'].$period.$type;
				}
				$selectField[] = $conf['prefix'].$type.'time';
			}
			if( empty($selectField) )
			{
				continue;
			}
			$where['table'] = '@'.$table;
			$where['field'] = implode(',', array_unique($selectField));
			$where['where'][$idField] = (int)$id;
			$row = wmsql::GetOne($where);
			if( !$row )
			{
				continue;
			}
			$update = array();
			$nowTime = time();
			foreach ($typeArr as $type=>$num)
			{
				if( !in_array($type, $conf['type']) )
				{
					continue;
				}
				$timeField = $conf['prefix'].$type.'time';
				$setTime = isset($row[$timeField]) ? (int)$row[$timeField] : 0;
				$update[$timeField] = $nowTime;
				foreach ($this->periodArr as $period)
				{
					$field = $conf['prefix'].$period.$type;
					$cur = isset($row[$field]) ? (int)$row[$field] : 0;
					//该周期已经翻页就从本次增量重新开始，否则累加
					if( $this->IsNewPeriod($period , $setTime , $nowTime) )
					{
						$update[$field] = $num;
					}
					else
					{
						$update[$field] = $cur + $num;
					}
				}
			}
			if( $update )
			{
				wmsql::Update('@'.$table, $update, array($idField=>(int)$id));
				$done++;
			}
		}
		return $done;
	}

	/**
	 * 某个周期是否已经翻页
	 * @param 参数1，必须，period：today/week/month/year/all
	 * @param 参数2，必须，上次统计时间
	 * @param 参数3，必须，当前时间
	 */
	protected function IsNewPeriod( $period , $setTime , $nowTime )
	{
		if( $period == 'all' )
		{
			return false;
		}
		if( $setTime <= 0 )
		{
			return true;
		}
		switch ($period)
		{
			case 'today':
				return date('Y-m-d', $setTime) !== date('Y-m-d', $nowTime);
			case 'week':
				return date('o-W', $setTime) !== date('o-W', $nowTime);
			case 'month':
				return date('Y-m', $setTime) !== date('Y-m', $nowTime);
			case 'year':
				return date('Y', $setTime) !== date('Y', $nowTime);
		}
		return false;
	}

	/**
	 * 表的计数配置：主键，以及每种计数器对应的字段前缀
	 * 小说表里字段是 novel_todayclick / novel_clicktime 这种形式
	 * @param 参数1，必须，表名
	 */
	protected function TableConf( $table )
	{
		$map = array(
			'novel_novel' => array(
				'id' => 'novel_id',
				//字段名形式：novel_ + 周期 + 类型，例如 novel_todayclick；时间字段 novel_clicktime
				'prefix' => 'novel_',
				'type' => array('click','rec','coll'),
			),
		);
		return isset($map[$table]) ? $map[$table] : false;
	}
}
?>
