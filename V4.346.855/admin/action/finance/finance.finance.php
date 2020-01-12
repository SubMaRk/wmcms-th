<?php
/**
* 财务日志处理器
*
* @version        $Id: novel.fans.php 2017年3月29日 22:04  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$logTable = '@user_finance_log';

//删除记录
if ( $type == 'del'  )
{
	$where['log_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบยอดรางวัล' , 'finance' , 'delete' , $logTable , $where);
	wmsql::Delete($logTable , $where);
	
	Ajax('ลบบันทึกรางวัลสำเร็จ!');
}
//清空数据记录
else if ( $type == 'clear')
{
	SetOpLog( 'ล้างยอดรางวัล' , 'finance' , 'delete' , $logTable);
	wmsql::Delete($logTable);
	Ajax('ล้างยอดรางวัลทั้งหมดสำเร็จ!');
}
?>