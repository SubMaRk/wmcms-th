<?php
/**
* zt页面处理器
*
* @version        $Id: operate.zt.php 2016年5月7日 21:56  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@zt_zt';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['zt'], 'e' );
	$where = $post['id'];
	
	if ( $data['zt_name'] == '' )
	{
		Ajax('ขออภัย! ชื่อกระทู้ต้องไม่ว่าง',300);
	}
	else if( !str::Number(GetKey($data,'type_id')) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่กระทู้ก่อน',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$data['zt_time'] = time();
		$info = 'ยินดีด้วย! เพิ่มกระทู้สำเร็จ';
		$where['zt_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มกระทู้'.$data['zt_name'] , 'zt' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขกระทู้สำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขกระทู้'.$data['zt_name'] , 'zt' , 'update' , $table , $where , $data );
	}
	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor','operate_zt' , $where['zt_id']);
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['zt_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบกระทู้' , 'zt' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
		
	Ajax('ลบกระทู้สำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างกระทู้' , 'zt' , 'delete');
	Ajax('ล้างกระทู้สำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['zt_status'] = Request('status');
	$where['zt_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'แสดง';
	}
	else
	{
		$msg = 'ซ่อน';
	}
	//写入操作记录
	SetOpLog( $msg.'กระทู้พิเศษ' , 'zt' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('กระทู้พิเศษถูก'.$msg.'แล้ว!');
}
?>