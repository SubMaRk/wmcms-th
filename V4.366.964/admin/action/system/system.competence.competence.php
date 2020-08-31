<?php
/**
* 权限处理器
*
* @version        $Id: system.competence.competence.php 2016年4月5日 13:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_competence';

if ( $type == 'edit' || $type == "add" )
{
	if ( $post['name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อสิทธิ์ก่อน',300);
	}
	//设置where条件
	$where['comp_id'] = $post['id'];
	//设置修改数据
	$data['comp_name'] = $post['name'];
	$data['comp_content'] = $post['comp'];
	$data['comp_site'] = $post['site'];
	$data = str::Escape($data , 'e');

	if( $data['comp_site'] == '' )
	{
		Ajax('ขออภัย! ต้องเลือกเว็บไซต์ก่อน',300);
	}
	else if( $data['comp_content'] == '' )
	{
		Ajax('ขออภัย! ต้องเลือกสิทธิ์ก่อน!',300);
	}
	
	//新增菜单
	if( $type == "add" )
	{
		//插入记录
		$where['comp_id'] = WMSql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มสิทธิ์'.$data['comp_name'] , 'system' , 'insert' , $table , $where , $data );
		
		Ajax('เพิ่มสิทธิ์สำเร็จ!');
	}
	//修改菜单
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขสิทธิ์'.$data['comp_name'] , 'system' , 'update' , $table , $where , $data );
		
		WMSql::Update($table, $data, $where);
		Ajax('แก้ไขสิทธิ์สำเร็จ!');
	}
}
else if ( $type == 'del' )
{
	$where['comp_id'] = $post['id'];
	
	//写入操作记录
	SetOpLog( 'ลบสิทธิ์' , 'system' , 'delete' , $table , $where);

	wmsql::Delete($table, $where);
	
	Ajax('ลบสิทธิ์สำเร็จ!');
}
?>