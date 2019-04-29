<?php
/**
* 充值订单控制器文件
*
* @version        $Id: finance.order.charge.php 2017年4月3日 19:56  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$config = GetModuleConfig('user');
$chargeMod = NewModel('finance.finance_charge');

//接受post数据
$name = Request('name');

//获取列表条件
$where['table'] = '@finance_order_charge';
$where['field'] = '@finance_order_charge.*,user_nickname';
$where['left']['@user_user'] = 'charge_user_id=user_id';
if( $orderField == '' )
{
	$where['order'] = 'charge_id desc';
}


//数据条数
$total = wmsql::GetCount($where);

//当前页的数据
$where = array_merge($where , GetListWhere($where));
$dataArr = wmsql::GetAll($where);
?>