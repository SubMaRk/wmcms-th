<?php
/**
* 用户处理器
*
* @version        $Id: user.sign.php 2016年5月11日 10:39  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@user_sign';

//删除数据
if ( $type == 'del')
{
	$where['user_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบบันทึกการเช็คชื่อผู้ใช้' , 'user' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
	
	Ajax('ลบบันทึกการเช็คชื่อผู้ใช้สำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างบันทึกการเช็คชื่อผู้ใช้' , 'user' , 'delete');
	Ajax('ล้างบันทึกการเช็คชื่อผู้ใช้สำเร็จ!');
}
?>