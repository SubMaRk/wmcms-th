<?php
/**
* 用户阅读记录操作模型
*
* @version        $Id: read.model.php 2017年7月10日 14:48  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class ReadModel
{
	public $table = '@user_read';
	public $userTable = '@user_user';
	public $logTable = '@user_read_log';
	public $novelTable = '@novel_novel';
	public $novelTypeTable = '@novel_type';
	public $chapterTable = '@novel_chapter';
	
	/**
	 * 构造函数
	 */
	function __construct()
	{
		global $tableSer;
		$this->moduleTable = $tableSer->GetTable(@$this->module);
	}
	
	
	/**
	 * 插入阅读记录操作
	 * @param 参数1，必须，需要插入的数据
	 */
	function Insert($data)
	{
		//不是蜘蛛才进行记录。
		if( !IsSpider() )
		{
			$data['read_uid'] = user::GetUid();
			
			$wheresql = $data;
			//移除标题
			unset($wheresql['read_title']);
			$where['table'] = $this->table;
			$where['where'] = $wheresql;
			if(!empty($data['read_nid']))
			{
				unset($where['where']['read_cid']);
			}
			$readData = wmsql::GetOne($where);
			
			//存在就要删除旧的阅读记录
			if( $readData && $data['read_cid'] != $readData['read_cid'] )
			{
				wmsql::Delete($this->table,array('read_id'=>$readData['read_id']));
			}
			
			//全部记录
			$data['read_time'] = time();
			wmsql::Insert($this->logTable, $data);
			//添加新的阅读记录
			if( !$readData || $data['read_cid'] != $readData['read_cid'] )
			{
				//最新记录
				return wmsql::Insert($this->table, $data);
			}
		}
	}
	
	
	/**
	 * 获得阅读记录列表
	 * @param 参数1，必须，查询条件
	 */
	function GetList($where)
	{
		$where['table'] = $this->table;
		$where['order'] = 'read_id desc';
		switch($where['where']['read_module'])
		{
			//外链接小说模块
			case 'novel':
				$where['left'][$this->chapterTable] = 'read_cid=chapter_id';
				$where['left'][$this->novelTable.' as n'] = 'chapter_nid=novel_id';
				$where['left'][$this->novelTypeTable.' as t'] = 'n.type_id=t.type_id';
				break;
		}
		return wmsql::GetAll($where);
	}
	
	
	
	/**
	 * 获得阅读日志记录行数
	 * @param 参数1，必须，查询条件
	 */
	function GetLogCount($where)
	{
		$where['table'] = $this->logTable;
		return wmsql::GetCount($where,'read_id');
	}
	
	/**
	 * 获得阅读日志记录
	 * @param 参数1，必须，查询条件
	 */
	function GetLogList($where)
	{
		$where['table'] = $this->logTable;
		$where['field'] = 'read_id,read_title,read_cid,read_time,read_uid,novel_name,user_nickname';
		$where['order'] = 'read_id desc';
		$where['left'][$this->userTable] = 'user_id=read_uid';
		switch($where['where']['read_module'])
		{
			//外链接小说模块
			case 'novel':
				$where['field'] .= ',novel_name';
				$where['left'][$this->novelTable] = 'novel_id=read_nid';
				break;
		}
		return wmsql::GetAll($where);
	}


	/**
	 * 删除日志记录行数
	 * @param 参数1，必须，查询条件
	 */
	function DelLog($where)
	{
		return wmsql::Delete($this->logTable,$where);
	}
}
?>