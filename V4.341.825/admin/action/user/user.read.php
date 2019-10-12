<?php
/**
* 用户阅读记录处理器
*
* @version        $Id: user.read.php 2017年7月11日 21:25  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@user_read';
$readMod = NewModel('user.read');
@list($module,$type) = explode('_', $type);

//检测参数
if( $module=='' || $type == '' )
{
	Ajax('ขออภัย! พารามิเตอร์ไม่ถูกต้อง',300);
}
//删除数据
else if ( $type == 'del')
{
	$where['read_id'] = GetDelId();
	$where['read_module'] = $module;
	$readMod->DelLog($where);
	//写入操作记录
	SetOpLog( 'ลบบันทึกการอ่าน' , 'user' , 'delete' , $table , $where);
	Ajax('ลบบันทึกการอ่านสำเร็จ!');
}
//清空数据
else if ( $type == 'clear')
{
	$where['read_module'] = $module;
	$readMod->DelLog($where);
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการอ่าน' , 'user' , 'delete' , $table);
	Ajax('ล้างบันทึกการอ่านสำเร็จ!');
}
?>