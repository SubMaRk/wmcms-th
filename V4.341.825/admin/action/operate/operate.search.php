<?php
/**
* 搜索处理器
*
* @version        $Id: operate.search.php 2016年5月7日 11:24  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@search_search';

//删除记录
if ( $type == 'rec' )
{
	$data['search_rec'] = Request('rec');
	$where['search_id'] = GetDelId();

	if( Request('rec') == '1')
	{
		$msg = 'แนะนำ';
	}
	else
	{
		$msg = 'แนะนำ';
	}
	
	wmsql::Update($table, $data, $where);
	//写入操作记录
	SetOpLog( $msg.'คำค้น' , 'system' , 'update' , $table , $where);
	Ajax('คำค้นถูก'.$msg.'แล้ว!');
}
//删除记录
else if ( $type == 'del' )
{
	$where['search_id'] = GetDelId();
	
	wmsql::Delete($table, $where);
	SetOpLog( 'ลบประวัติการค้นหา' , 'system' , 'delete' , $table , $where);
	
	Ajax('ลบประวัติการค้นหาสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างประวัติการค้นหา' , 'system' , 'delete');
	Ajax('ล้างประวัติการค้นหาสำเร็จ!');
}
?>