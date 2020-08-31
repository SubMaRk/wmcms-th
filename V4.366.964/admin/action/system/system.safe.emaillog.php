<?php
/**
* 邮件日志处理器
*
* @version        $Id: system.safe.emaillog.php 2017年6月27日 16:19  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$emailMod = NewModel('system.email');
$table = '@system_email_log';

//删除登录记录
if ( $type == 'del' )
{
	$where['log_id'] = GetDelId();
	$emailMod->LogDel($where);

	//写入操作记录
	SetOpLog( 'ลบบันทึกการส่งอีเมล์' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกการส่งอีเมล์สำเร็จ!');
}
//清空登录记录
else if ( $type == 'clear' )
{
	$emailMod->LogDel();
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการส่งอีเมล์' , 'system' , 'delete');
	Ajax('ล้างบันทึกการส่งอีเมล์สำเร็จ!');
}
?>