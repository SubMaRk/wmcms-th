<?php
/**
* 评论模块模型
*
* @version        $Id: replay.model.php 2016年5月27日 10:31  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class ReplayModel
{
	public $table = '@replay_replay';
	//操作的模块
	public $module;
	//模块表
	public $moduleTable;
	//内容id
	public $cid;
	//排序方式
	public $order;
	
	/**
	 * 构造函数，初始化模块表
	 */
	function __construct( $data = '' )
	{
		global $tableSer;
		$this->module = GetKey($data, 'module');
		$this->cid = GetKey($data, 'cid');
		$this->moduleTable = $tableSer->GetTable($this->module);
	}



	/**
	 * 获得内容的条数
	 */
	function GetContentCount()
	{
		return GetContentCount($this->moduleTable['table'] , $this->moduleTable['id'] , $this->cid);
	}
	

	/**
	 * 获得上层楼的楼号
	 */
	function GetTopFloor()
	{
		$where['table'] = $this->table;
		$where['field'] = 'replay_floor';
		$where['where']['replay_module'] = $this->module;
		$where['where']['replay_cid'] = $this->cid;
		$where['order'] = 'replay_id desc';
		$data = wmsql::GetOne($where);
		if( $data )
		{
			return $data['replay_floor']+1;
		}
		else
		{
			return '1';
		}
	}
	
	
	/**
	 * 检查同一个ip上次评论的内容
	 * @param 参数1，必须，评论的模块
	 * @param 参数2，选填，传入的时间间隔秒。不为空则进行检测
	 */
	function CheckPre($module , $checkTime = 0 )
	{
		$where['table'] = '@replay_replay';
		$where['where']['replay_module'] = $module;
		$where['where']['replay_time'] = array( '>' , strtotime('today') );
		$where['where']['replay_ip'] = GetIp();
		$where['order'] = 'replay_id desc';
		$data = wmsql::GetOne($where);
		
		//检查参数大于0
		if( $checkTime > 0 )
		{
			//当前时间减上次评论的时间是否大于传入的时间
			$topTime =  time() - $data['replay_time'];
			if ( $topTime < $checkTime )
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		//否则直接返回数据
		else
		{
			return $data;
		}	
	}
	
	
	/**
	 * 获得今天评论的条数
	 */
	function GetTodayCount()
	{
		$where['table'] = $this->table;
		$where['where']['replay_module'] = $this->module;
		$where['where']['replay_time'] = array( '>' , strtotime(date('Y-m-d')) );
		$where['where']['replay_ip'] = GetIp();
		$todayCount = wmsql::GetCount( $where , 'replay_id' );
		return $todayCount;
	}
	
	

	/**
	 * 插入操作记录
	 */
	function Insert( $data )
	{
		$data['replay_module'] = $this->module;
		$data['replay_cid'] = $this->cid;
		$data['replay_time'] = time();
		$data['replay_ip'] = GetIp();
		
		$result = wmsql::Insert( $this->table , $data );
		return $result;
	}
	
	/**
	 * 删除数据
	 * @param 参数1，选填，评论的id
	 */
	function Del( $id = '')
	{
		if( $id == '' )
		{
			$where['replay_module'] = $this->module;
			$where['replay_cid'] = $this->cid;
		}
		else
		{
			$where['replay_id'] = $id;
		}
		wmsql::Delete($this->table , $where);
	}
	
	
	
	/**
	 * 内容表顶踩自增
	 */
	function ContentInc()
	{
		wmsql::Inc( $this->moduleTable['table'] , $this->moduleTable['field'].'replay' , $this->moduleTable['id'].'='.$this->cid);
	}
	
	
	
	/**
	 * 获得评论列表
	 * @param 参数1，选填，当前页数
	 * @param 参数2，选填，每页多少条
	 * @param 参数3，选填，查询的条件
	 */
	function GetList($page = '1', $pageCount = '10' , $wheresql='')
	{
		//查询数据总条数
		$where['table'] = $this->table;
		$where['left']['@user_user'] = 'replay_uid=user_id';
		$where['where'] = $wheresql;
		$where['where']['replay_module'] = $this->module;
		$where['where']['replay_cid'] = $this->cid;
		//参数总人数，总评论数量
		$sum = wmsql::GetCount( $where , 'replay_id' );
		//所有通过审核的数据条数
		$where['where']['replay_status'] = '1';
		$pageArr = page::Format( wmsql::GetCount( $where , 'replay_id' ), $pageCount , $page);
		$pageArr['sum'] = $sum;
		
		//查询数据列表
		$where['order'] = $this->order;
		$where['limit'] = $pageArr['limit'];
		$where['field'] = 'user_head,replay_id,replay_uid,replay_nickname,replay_content,replay_ding,replay_cai,replay_time,replay_ip';
		$pageArr['data'] = wmsql::GetAll($where);
		
		return $pageArr;
	}
	
	
	/**
	 * 替换评论内容中的表情
	 * @param 评论内容数组
	 * @param 用户中心地址
	 * @param 默认头像
	 */
	function RepReplayFace($data , $furl='' , $defaultHead='')
	{
		//寻找替换表情标签
		$faceArr = tpl::Tag('{face:[a]|[a]}', $data['replay_content']);
		if(empty($faceArr[0][0]))
		{
			$faceArr = tpl::Tag('&#123;face:[a]|[a]&#125;', $data['replay_content']);
		}
		
		//表情是否存在
		if ( isset($faceArr[0][0]) )
		{
			foreach ($faceArr[0] as $key=>$val)
			{
				$data['replay_content'] = str_replace($val, '<img src="/files/face/'.$faceArr[1][$key].'/'.$faceArr[2][$key].'.gif" style="max-height: 40px;max-width: 40px;display:inline" />', $data['replay_content']);
			}
		}
		
		if( $data['user_head'] == '' )
		{
			$data['user_head'] = $defaultHead;
		}
		if( $data['replay_uid'] != '0' )
		{
			$data['fhome'] = str_replace('{uid}', $data['replay_uid'], $furl);
		}
		else
		{
			$data['fhome'] = 'javascript:void(0);';
		}
		return $data;
	}
}
?>