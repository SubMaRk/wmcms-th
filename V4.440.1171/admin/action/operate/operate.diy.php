<?php
/**
* diy页面处理器
*
* @version        $Id: operate.diy.php 2016年5月7日 21:56  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@diy_diy';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['diy'], 'e' );
	$where = $post['id'];

	if( $data['diy_title'] == '' )
	{
		$data['diy_title'] = $data['diy_name'];
	}
	if( $data['diy_key'] == '' )
	{
		$data['diy_key'] = $data['diy_name'];
	}
	if( $data['diy_desc'] == '' )
	{
		$data['diy_desc'] = $data['diy_name'];
	}
	
	if ( $data['diy_name'] == '' || GetKey($data,'diy_content') == '' )
	{
		Ajax('ขออภัย! ชื่อหน้าเดี่ยวและเนื้อหาต้องไม่ว่าง',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$data['diy_time'] = time();
		$info = 'ยินดีด้วย! เพิ่มหน้าเดี่ยวสำเร็จ';
		$where['diy_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มหน้าเดี่ยว'.$data['diy_name'] , 'diy' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขหน้าเดี่ยวสำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขหน้าเดี่ยว'.$data['diy_name'] , 'diy' , 'update' , $table , $where , $data );
	}
	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor','operate_diy' , $where['diy_id']);
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['diy_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบหน้าเดี่ยว' , 'diy' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
		
	Ajax('ลบหน้าเดี่ยวสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างหน้าเดี่ยว' , 'diy' , 'delete');
	Ajax('ล้างหน้าเดี่ยวสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['diy_status'] = Request('status');
	$where['diy_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'แสดง';
	}
	else
	{
		$msg = 'ซ่อน';
	}
	//写入操作记录
	SetOpLog( $msg.'หน้าเดี่ยว' , 'diy' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('หน้าเดี่ยวถูก'.$msg.'แล้ว!');
}
?>