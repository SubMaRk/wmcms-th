<?php
/**
* 短信模版控制器文件
*
* @version        $Id: system.set.sms.php 2021年03月17日 14:09  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$smsMod = NewModel('system.sms');
$logMod = NewModel('system.smslog');
$smsList = $smsMod->GetAll();

$where['table'] = $logMod->table;
//数据条数
$total = wmsql::GetCount($where);
//数据列表
if( $orderField == '' )
{
	$where['order'] = 'log_id desc';
}
$logList = $logMod->GetAll(GetListWhere($where));
?>