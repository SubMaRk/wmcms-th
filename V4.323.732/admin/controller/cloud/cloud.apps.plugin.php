<?php
/**
* 我的插件控制器
*
* @version        $Id: cloud.apps.plugin.php 2018年6月10日 9:50  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//插件根目录
$pluginPath = WMPLUGIN.'apps/';
//已经安装的插件
$installPlugin = array();
//未安装的插件列表
$pluginList = array();

//查询已安装的插件
$pluginMod = NewModel('plugin.plugin');
$pluginData = $pluginMod->GetList();
if( $pluginData )
{
	foreach ($pluginData as $k=>$v)
	{
		//查询所有插件是否完整
		if( file_exists($pluginPath.$v['plugin_floder'].'/copyright.xml') )
		{
			$installPlugin[$v['plugin_floder']] = $v;
			$copyRight = GetTempCopy( $v['plugin_floder'] , $pluginPath);
			$installPlugin[$v['plugin_floder']] = array_merge($installPlugin[$v['plugin_floder']],$copyRight);
		}
	}
}

//查询所有插件的文件夹
$floderArr = file::FloderList($pluginPath);
if( $floderArr )
{
	foreach ($floderArr as $k=>$v)
	{
		//不存在插件就写入未安装数组
		if( !isset($installPlugin[$v['file']]) )
		{
			//查询所有插件是否完整
			if( file_exists($pluginPath.$v['file'].'/copyright.xml') )
			{
				$pluginList[] = GetTempCopy( $v['file'] , $pluginPath);
			}
		}
	}
}
?>