<?php
/**
* 卡号使用记录处理器
*
* @version        $Id: user.cardlog.php 2017年4月3日 19:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@user_card_log';

//删除数据
if ( $type == 'del')
{
	$where['log_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบบันทึกการใช้บัตร' , 'user' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
	
	Ajax('ลบบันทึกการใช้บัตรสำเร็จ!');
}
//清空数据
else if ( $type == 'clear')
{
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการใช้บัตร' , 'user' , 'delete' , $table);
	wmsql::Delete($table);
	Ajax('ล้างบันทึกการใช้บัตรสำเร็จ!');
}
?>