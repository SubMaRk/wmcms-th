<?php
/**
* 小说分卷模型
*
* @version        $Id: volume.model.php 2017年1月7日 15:17  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class VolumeModel
{
	//分卷表
	public $volumeTable = '@novel_volume';
	//小说表
	public $novelTable = '@novel_novel';

	
	/**
	 * 构造函数
	 */
	function __construct(){}
	
	
	/**
	 * 插入小说信息
	 * @param 参数1，必须，条件
	 */
	function Insert( $data )
	{
		return wmsql::Insert($this->volumeTable, $data);
	}
	
	/**
	 * 修改小说内容
	 * @param 参数1，必须，修改的内容
	 */
	function Update($data , $whereArr)
	{
		if( !is_array($whereArr) )
		{
			$where['volume_id'] = $whereArr;
		}
		else
		{
			$where = $whereArr;
		}

		return wmsql::Update($this->volumeTable, $data, $where);
	}

	/**
	 * 删除一条数据
	 */
	function Delete($where)
	{
		if( !is_array($where) )
		{
			$wheresql['volume_id'] = $where;
		}
		else
		{
			$wheresql = $where;
		}
		return wmsql::Delete($this->volumeTable , $wheresql);
	}
	
	
	
	/**
	 * 检查小说名字是否存在
	 * @param 参数1，必须，小说的名字
	 * @param 参数2，选填，小说的id
	 */
	function CheckName( $name , $id = '0' )
	{
		$where['volume_name'] = $name;
		if( $id > 0 )
		{
			$where['volume_id'] = array( '<>' , $id);
		}
		return $this->GetCount($where);
	}
	
	
	/**
	 * 获得数据条数
	 * @param 参数1，必须，查询条件
	 */
	function GetCount($where)
	{
		$wheresql['table'] = $this->volumeTable;
		$wheresql['where'] = $where;
		return wmsql::GetCount($wheresql);
	}

	/**
	 * 获得一条数据
	 * @param 参数1，必须，查询条件
	 */
	function GetOne($where)
	{
		$wheresql['table'] = $this->volumeTable;
		$wheresql['left'][$this->novelTable] = 'volume_nid=novel_id';
		if( is_array($where) )
		{
			$wheresql['where'] = $where;
		}
		else
		{
			$wheresql['where']['volume_id'] = $where;
		}
		return wmsql::GetOne($wheresql);
	}
}
?>