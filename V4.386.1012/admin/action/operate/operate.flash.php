<?php
/**
* 幻灯片处理器
*
* @version        $Id: operate.flash.php 2016年5月7日 14:24  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@flash_flash';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['flash'], 'e' );
	$where = $post['id'];
	
	if ( $data['flash_title'] == '' || $data['flash_url'] == '' )
	{
		Ajax('ขออภัย! ชื่อสไลด์และลิ้งก์ต้องไม่ว่าง',300);
	}
	else if( !str::Number(GetKey($data,'type_id')) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่สไลด์ก่อน',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$data['flash_time'] = time();
		$info = 'ยินดีด้วย! เพิ่มสไลด์สาเร็จ';
		$where['flash_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มสไลด์'.$data['flash_title'] , 'system' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขสไลด์สาเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขสไลด์'.$data['flash_title'] , 'system' , 'update' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['flash_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบสไลด์' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
		
	Ajax('ลบสไลด์สำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างสไลด์' , 'system' , 'delete' , $table);
	Ajax('ล้างสไลด์สำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['flash_status'] = Request('status');
	$where['flash_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'แสดง';
	}
	else
	{
		$msg = 'ซ่อน';
	}
	//写入操作记录
	SetOpLog( $msg.'สไลด์' , 'system' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('สไลด์ถูก'.$msg.'แล้ว!');
}
?>