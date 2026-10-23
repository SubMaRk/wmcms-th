<?php
/**
* 删除错误记录处理器
*
* @version        $Id: system.seo.errpage.php 2017年6月8日 21:11  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@seo_errpage';

//删除登录记录
if ( $type == 'del' )
{
	$where['errpage_id'] = GetDelId();

	//写入操作记录
	SetOpLog( '删除了错误页面记录' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกหน้าข้อผิดพลาดสำเร็จ!');
}
//清空登录记录
else if ( $type == 'clear' )
{
	wmsql::Exec('TRUNCATE TABLE `@'.$table.'`');
	//写入操作记录
	SetOpLog( '清空了错误页面记录' , 'system' , 'delete');
	Ajax('ล้างข้อมูลบันทึกหน้าข้อผิดพลาดทั้งหมดสำเร็จ!');
}
?>