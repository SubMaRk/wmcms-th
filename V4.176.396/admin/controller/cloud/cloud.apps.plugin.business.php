<?php
/**
* 插件业务控制器
*
* @version        $Id: cloud.apps.plugin.business.php 2018年6月16日 09:15  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//管理的插件id
$id = Request('id');
$action = Request('action');
$pluginData = array();

if( !str::Number($id) )
{
	$errInfo = 'ขออภัย! ไอดีปลั๊กอินไม่ถูกต้อง';
}
else if( $action == '' )
{
	die('ขออภัย! การดำเนินการต้องไม่ว่าง');
}
else
{
	//查询已安装的插件
	$pluginMod = NewModel('plugin.plugin');
	$pluginData = $pluginMod->GetById($id);
	if( !$pluginData )
	{
		die('ขออภัย! ไม่มีปลั๊กอินอยู่');
	}
	else
	{
		$manager = AdminNewClass('manager');
		C('manager',$manager);

		//设置标签
		tpl::SetLabel('cFun', $cFun);
		tpl::SetLabel('id', $id);
		tpl::SetLabel('url', 'index.php?d=yes&c=cloud.apps.plugin.business&t=business&id='.$id.'&action='.$action);
		tpl::SetLabel('action', 'index.php?d=yes&c=cloud.apps.plugin.business&t=business&id='.$id.'&action=');
		//设置插件名
		$m = $pluginData['plugin_floder'];

		//引入插件管理
		require_once WMPLUGIN.'admin.php';
	}
}
?>
