<?php
/**
* 网站关键词处理器
*
* @version        $Id: system.seo.keys.php 2016年4月3日 10:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@seo_keys';
$status = 200;
$msg = 'ดึงข้อมูลสำเร็จ';

//修改关键词信息
if ( $type == 'edit' || $type == "add"  )
{
	$post = str::Escape($post , 'e');
	
	//如果是修改seo信息
	if ( $type == 'edit' )
	{
		//设置where条件
		$where['keys_id'] = $post['keys_id'];
		unset($post['keys_id']);

		//写入操作记录
		SetOpLog( 'แก้ไขข้อมูลคำค้น' , 'system' , 'update' , $table  , $where , $post );
		//修改数据
		WMSql::Update($table, $post, $where);
		Ajax('แก้ไขคำค้นสำเร็จ! โปรดคลิ๊กอัปเดทแคชเพื่อแสดงผลบน Header');
	}
	//如果是增加页面
	else
	{
		Ajax('โมดูลหน้าเดี่ยวไม่ได้เปิดใช้งาน',300);
	}
}
//生成静态文件
else if ( $type == 'config' )
{
	$seoSer = AdminNewClass('system.seo');
	$seoSer->UpConfig();

	//写入操作记录
	SetOpLog( 'สร้างแคชคำค้น SEO' , 'system' , 'update' );
	Ajax('สร้างแคชคำค้น SEO สำเร็จ!');
}
?>