<?php
/**
* 上传模型
*
* @version        $Id: upload.model.php 2016年5月28日 12:11  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class UploadModel
{
	public $table = '@upload';
	public $module;
	public $type;
	public $uploadData;
	public $data;
	public $where;
	
	/**
	 * 构造函数
	 */
	function __construct()
	{
	}
	
	
	/**
	 * 获得一条数据
	 */
	function GetOne($id=0)
	{
		$where['table'] = $this->table;
		if( $id > 0 )
		{
			$where['where']['upload_id'] = $id;
		}
		else
		{
			$where['where'] = $this->where;
		}
		$data = wmsql::GetOne($where);
		
		if( $data && $data['upload_alt'] == '' )
		{
			$data['upload_alt'] = basename($data['upload_img']);
		}
		
		return $data;
	}
	
	/**
	 * 随机一条数据
	 */
	function RandOne()
	{
		$where['table'] = $this->table;
		$where['where'] = $this->where;
		return wmsql::RandOne($where);
	}
	
	
	/**
	 * 插入上传记录
	 */
	function Insert()
	{
		$uid = 0;
		if( class_exists('user') )
		{
			$uid = user::GetUid();
		}
		$data['upload_module'] = $this->module;
		$data['upload_type'] = $this->type;
		$data['upload_ext'] = $this->uploadData['ext'];
		$data['upload_img'] = $this->uploadData['file'];
		$data['upload_alt'] = $this->uploadData['alt'];
		$data['user_id'] = $uid;
		$data['upload_size'] = $this->uploadData['size'];
		
		return WMSql::Insert($this->table, $data);
	}
	
	
	/**
	 * 修改附件信息
	 */
	function Save()
	{
		return wmsql::Update($this->table, $this->data, $this->where);
	}
	
	
	/**
	 * 更新上传的内容id
	 */
	function UpdateCid($module , $type , $cid)
	{
		$where['upload_module'] = $module;
		$where['upload_type'] = $type;
		$where['upload_cid'] = 0;
		$data['upload_cid'] = $cid;
		return wmsql::Update($this->table, $data, $where);
	}
}
?>