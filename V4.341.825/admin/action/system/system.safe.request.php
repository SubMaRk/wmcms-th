<?php
/**
* 管理员请求记录处理器
*
* @version        $Id: system.safe.request.php 2016年4月9日 16:41  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@manager_request';

//删除请求记录
if ( $type == 'del' )
{
	$where['request_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบบันทึกคำร้อง' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกคำร้องสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);
	//写入操作记录
	SetOpLog( 'ล้างบันทึกคำร้อง' , 'system' , 'delete');
	Ajax('ล้างบันทึกคำร้องสำเร็จ!');
}
?>