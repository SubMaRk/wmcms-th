<?php
/**
* 删除蜘蛛记录处理器
*
* @version        $Id: system.seo.spider.php 2017年6月8日 21:11  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@seo_spider';

//删除登录记录
if ( $type == 'del' )
{
	$where['spider_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบบันทึกการสำรวจข้อมูล' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกการสำรวจข้อมูลสำเร็จ!');
}
//清空登录记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการสำรวจข้อมูล' , 'system' , 'delete');
	Ajax('ล้างบันทึกการสำรวจข้อมูลสำเร็จ');
}
?>