<?php
/**
* 错误日志处理器
*
* @version        $Id: system.safe.errlog.php 2016年4月23日 22:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_errlog';

//删除登录记录
if ( $type == 'del' )
{
	$where['errlog_id'] = GetDelId();

	//写入操作记录
	SetOpLog( '删除了错误日志' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกข้อผิดพลาดสำเร็จ!');
}
//清空登录记录
else if ( $type == 'clear' )
{
	wmsql::Exec('TRUNCATE TABLE `@'.$table.'`');
	//写入操作记录
	SetOpLog( '清空了错误日志' , 'system' , 'delete');
	Ajax('ล้างข้อมูลบันทึกข้อผิดพลาดทั้งหมดสำเร็จ!');
}
//处理自动上传设置
else if ( $type == 'autoupload' )
{
	$val = str::CheckElse(Request('val'), 1 , 1, 0);
	
	$where['config_module'] = 'system';
	$where['config_name'] = 'err_auto_upload';
	wmsql::Update( '@config_config' , array('config_value'=>$val) , $where);
	
	//写入操作记录
	SetOpLog( '从错误列表修改自动上传设置' , 'system' , 'update');
	Ajax('แก้ไขบันทึกข้อผิดพลาดของการอัปโหลดอัตโนมัติสำเร็จ!');
}
//上传错误日志
else if ( $type == 'upload' )
{
	//上传到官方服务器的功能已移除，错误日志只保留在本机
	Ajax('ไม่รองรับการอัปโหลดบันทึกข้อผิดพลาดแล้ว กรุณาดูไฟล์ใน cache/log/' , 300);
}
?>