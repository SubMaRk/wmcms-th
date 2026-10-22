<?php
/**
* 网站伪静态设置处理器
*
* @version        $Id: system.seo.rewrite.php 2016年4月6日 10:32  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@seo_urls';
$status = 200;
$msg = 'ดึงข้อมูลสำเร็จ';

//修改关键词信息
if ( $type == 'edit' || $type == "add"  )
{
	$post = str::Escape($post , 'e');
	
	//如果是修改URL信息
	if ( $type == 'edit' )
	{
		//设置where条件
		$where['urls_id'] = $post['urls_id'];
		unset($post['urls_id']);

		//写入操作记录
		SetOpLog( 'แก้ไขข้อมูลลิ้งก์ SEO' , 'system' , 'update' , $table, $where , $post );
		WMSql::Update($table, $post, $where);
		Ajax('อัปเดทลิ้งก์แบบคงที่สำเร็จ! โปรดคลิ๊กอัปเดทแคชเพื่อแสดงผลบน Header');
	}
	//如果是增加页面
	else
	{
		Ajax('ไม่ได้เปิดใช้งานฟังก์ชั่นปรับเปลี่ยนลิ้งก์',300);
	}
}
//生成静态文件
else if ( $type == 'config' )
{
	$seoSer = AdminNewClass('system.seo');
	$seoSer->UpConfig();

	//写入操作记录
	SetOpLog( 'สร้างแคชลิ้งก์ SEO' , 'system' , 'update' );
	Ajax('สร้างแคชลิ้งก์ SEO สำเร็จ!');
}
?>