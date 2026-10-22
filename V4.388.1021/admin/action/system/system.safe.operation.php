<?php
/**
* 管理员操作记录处理器
*
* @version        $Id: system.safe.operation.php 2016年4月10日 14:48  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@manager_operation';

//删除请求记录
if ( $type == 'del' )
{
	$where['operation_id'] = GetDelId();
	
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกการดำเนินการสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);
	
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการดำเนินการ' , 'system' , 'delete');
	Ajax('ล้างบันทึกการดำเนินการสำเร็จ!');
}
?>