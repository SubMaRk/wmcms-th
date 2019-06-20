<?php
/**
* 时间数据操作类
*
* @version        $Id: time.class.php 2018年1月6日 13:31  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
class time{
	
	/**
	 * 根据列表数据循环出时间数据
	 * @param 参数1，必须，列表数据
	 * @param 参数2，需要进行数据操作的字段。
	 * @param 参数2，data：需要操作的键值。
	 * @param 擦数2，time：时间字段
	 */
	function GetListTimeData($list,$filedArr)
	{
		$data['all'] = $data['today'] = $data['yesterday'] = 0;
		if($list)
		{
			foreach ($list as $k=>$v)
			{					//今天
				if( date('Y-m-d',$v[$filedArr[1]]) == date('Y-m-d',time()) )
				{						
					$data['today'] = __Opera( $data['today'] , $v[$filedArr[0]] );
					if( isset($data['todayTime'][date('G',$v[$filedArr[1]])]) )
					{
						$data['todayTime'][date('G',$v[$filedArr[1]])] += $v[$filedArr[0]];
					}
					else
					{
						$data['todayTime'][date('G',$v[$filedArr[1]])] = $v[$filedArr[0]];
					}
				}
				//昨天
				if( date('Y-m-d',$v[$filedArr[1]]) == date("Y-m-d",strtotime("-1 day")) )
				{
					$data['yesterday'] = __Opera( $data['yesterday'] , $v[$filedArr[0]] );
					if( isset($data['yesterdayTime'][date('G',$v[$filedArr[1]])]) )
					{
						$data['yesterdayTime'][date('G',$v[$filedArr[1]])] += $v[$filedArr[0]];
					}
					else
					{
						$data['yesterdayTime'][date('G',$v[$filedArr[1]])] = $v[$filedArr[0]];
					}
				}
				//总
				$data['all'] += $v[$filedArr[0]];
			}
		}

		//循环实时数据
		for($i=1;$i<=24;$i++){
			if( empty($data['todayTime'][$i]) )
			{
				$todayTime[$i]=0;
			}
			else
			{
				$todayTime[$i]=$data['todayTime'][$i];
			}
		
			if( empty($data['yesterdayTime'][$i]) )
			{
				$yesterdayTime[$i]=0;
			}
			else
			{
				$yesterdayTime[$i]=$data['yesterdayTime'][$i];
			}
		}
		$data['todayTime'] = $todayTime;
		$data['yesterdayTime'] = $yesterdayTime;
		
		return $data;
	}
}
?>