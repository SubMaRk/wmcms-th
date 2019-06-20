<?php
/**
* 打赏记录日志模型
*
* @version        $Id: rewardlog.model.php 2018年1月7日 13:15  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class RewardLogModel
{
	//表
	public $logTable = '@novel_rewardlog';
	
	//构造函数
	public function __construct()
	{
	}


	/**
	 * 获得小说的小说记录离别
	 * @param 参数1，必须，小说id
	 */
	function GetByNid( $nid )
	{
		$where['table'] = $this->logTable;
		$where['where']['log_nid'] = $nid;
		return wmsql::GetAll($where);
	}
	
	/**
	 * 插入订阅日志
	 * @param 参数1，必须，条件
	 */
	function Insert( $data )
	{
		$data['log_time'] = time();
		return wmsql::Insert($this->logTable, $data);
	}
}
?>