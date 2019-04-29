<?php
/**
* 资金变更记录控制器文件
*
* @version        $Id: finance.finance.list.php 2017年4月3日 14:24  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$config = GetModuleConfig('user');
$logMod = NewModel('user.finance_log');

//接受post数据
$name = Request('name');

//获取列表条件
$where['table'] = '@user_finance_log';
$where['field'] = '@user_finance_log.*,user_nickname';
$where['left']['@user_user'] = 'log_user_id=user_id';
if( $orderField == '' )
{
	$where['order'] = 'log_id desc';
}


//数据条数
$total = wmsql::GetCount($where);

//当前页的数据
$where = array_merge($where , GetListWhere($where));
$dataArr = wmsql::GetAll($where);
?>