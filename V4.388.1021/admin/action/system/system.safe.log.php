<?php
/**
* 登录记录处理器
*
* @version        $Id: system.safe.log.php 2016年4月6日 16:11  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@manager_login';

//删除登录记录
if ( $type == 'del' )
{
	$where['login_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบบันทึกการเข้าสู่ระบบ' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกการเข้าสู่ระบบสำเร็จ!');
}
//清空登录记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการเข้าสู่ระบบ' , 'system' , 'delete');
	Ajax('ล้างบันทึกการเข้าสู่ระบบสำเร็จ!');
}
?>