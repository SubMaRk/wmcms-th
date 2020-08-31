<?php
/**
* 广告处理器
*
* @version        $Id: operate.ad.php 2016年5月8日 10:14  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$adSer = AdminNewClass('operate.ad');

$table = '@ad_ad';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	
	$data = str::Escape( $post['ad'], 'e' );
	$where = $post['id'];
	
	if ( $data['ad_name'] == '')
	{
		Ajax('ขออภัย! ต้องกรอกชื่อโฆษณาก่อน',300);
	}
	$data['ad_start_time'] = strtotime($data['ad_start_time']);
	$data['ad_end_time'] = strtotime($data['ad_end_time']);
	
	//新增数据
	if( $type == 'add' )
	{
		$data['ad_time'] = time();
		$info = 'ยินดีด้วย! เพิ่มโฆษณาแล้ว';
		$where['ad_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มโฆษณา'.$data['ad_name'] , 'system' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขโฆษณาแล้ว';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขโฆษณา'.$data['ad_name'] , 'system' , 'update' , $table , $where , $data );
	}
	
	//创建广告js文件
	$data['ad_id'] = $where['ad_id'];
	$adSer->CreateAdFile( $data );
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['ad_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบโฆษณา' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);

	//删除广告文件
	$adSer->DelAdFile(GetDelId());
	
	Ajax('ลบโฆษณาสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);
	//删除广告文件夹
	$adSer->DelAdDir();
	
	//写入操作记录
	SetOpLog( 'ล้างโฆษณา' , 'system' , 'delete' , $table);
	Ajax('ล้างโฆษณาสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['ad_status'] = Request('status');
	$where['ad_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ตรวจสอบ';
	}
	else
	{
		$msg = 'ละทิ้ง';
	}
	//写入操作记录
	SetOpLog( $msg.'โฆษณา' , 'system' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('โฆษณาถูก'.$msg.'แล้ว!');
}
?>