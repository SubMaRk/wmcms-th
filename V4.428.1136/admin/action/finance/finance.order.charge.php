<?php
/**
* 充值订单处理器
*
* @version        $Id: finance.order.charge.php 2017年4月3日 20:24  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$logTable = '@finance_order_charge';

//删除记录
if ( $type == 'del'  )
{
	$where['charge_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบคำสั่งซื้อ' , 'finance' , 'delete' , $logTable , $where);
	wmsql::Delete($logTable , $where);
	
	Ajax('ลบคำสั่งซื้อสำเร็จ!');
}
//清空数据记录
else if ( $type == 'clear')
{
	SetOpLog( 'ล้างคำสั่งซื้อ' , 'finance' , 'delete' , $logTable);
	wmsql::Delete($logTable);
	Ajax('ล้างคำสั่งซื้อสำเร็จ!');
}
?>