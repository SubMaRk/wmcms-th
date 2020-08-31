<?php
/**
* 添加插件处理器
*
* @version        $Id: system.dev.addplugin.php.php 2019年10月27日 11:29  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$pluginMod = NewModel('plugin.plugin');
$pluginConfigMod = NewModel('plugin.config');
require_once WMPLUGIN.'plugin.class.php';

//如果请求信息存在
if( $type == 'plugin_add'  )
{
	$data = Post('data/a');
	$url = Post('url');
	$pluginPath = WMPLUGIN.'apps/'.$data['plugin_floder'];
	
	if( $data['plugin_name'] == '' || $data['plugin_floder'] == '' || 
		$data['plugin_author'] == '' || $data['plugin_version'] == '' )
	{
		Ajax('ขออภัย! โปรดกรอกข้อมูลปลั๊ำกอินให้สมบูรณ์',300);
	}
	else if( $pluginMod->GetByFloder($data['plugin_floder']) || file_exists($pluginPath) )
	{
		Ajax('ขออภัย! โลโก้ปลั๊กอินถูกใช้งานอยู่ โปรดแทนที่ด้วยโลโก้ใหม่',300);
	}
	else
	{
		//插入插件信息
		if( $pluginMod->Insert($data) )
		{
			//创建插件文件夹
			file::CreateFolder($pluginPath);
			//将插件模版复制到模版文件夹
			file::CopyFile(WMTEMPLATE.'system/plugin', $pluginPath,'create.zip');
			//解压缩到当前文件夹下面
			$zip = NewClass('pclzip',$pluginPath.'/create.zip');
			$zip->extract(PCLZIP_OPT_PATH, $pluginPath);
			//删除模版文件
			file::DelFile($pluginPath.'/create.zip');
			//替换版权文件的占位标签
			$copyRight = file::GetFile($pluginPath.'/copyright.xml');
			$arr = array(
				'name'=>$data['plugin_name'],
				'author'=>$data['plugin_floder'],
				'ver'=>$data['plugin_author'],
				'time'=>$data['plugin_version'],
				'url'=>$url,
			);
			$copyRight = tpl::Rep($arr,$copyRight);
			file_put_contents($pluginPath.'/copyright.xml', $copyRight);

			//写入操作记录
			SetOpLog( 'เพิ่มปลั๊กอิน'.$data['plugin_name'].'：'.$data['plugin_floder'] , 'system' , 'insert' );
			Ajax();
		}
		else
		{
			Ajax('ขออภัย! ไม่สามารถเพิ่มปลั๊กอินได้',300);
		}
	}
}
else if( $type == 'config_add' )
{
	$pluginId = intval(Post('config_plugin_id'));
	$configKey = Post('config_key');
	$configVal = Post('config_val');
	//插件数据
	$pluginData = $pluginMod->GetById($pluginId);
	if( !$pluginData )
	{
		Ajax('ขออภัย! ไอดีปลั๊กอินไม่ถูกต้อง',300);
	}
	else if( $configKey == '' )
	{
		Ajax('ขออภัย! โปรดกรอกไอดีและชื่อของหน้าเว็บ',300);
	}
	else
	{
		Plugin::SetData($pluginData);
		if( Plugin::AddConfig($configKey, $configVal) )
		{
			//写入操作记录
			SetOpLog( 'เพิ่มการกำหนดค่าปลั๊กอิน '.$pluginData['plugin_name'].''.$configKey , 'system' , 'insert' );
			Ajax('เพิ่มการกำหนดค่าปลั๊กอินแล้ว!');
		}
		else
		{
			Ajax('ขออภัย! เพิ่มการกำหนดค่าปลั๊กอินล้มเหลว',300);
		}
	}
}
else if( $type == 'getpluginconfig' )
{
	$pluginData = $pluginMod->GetById(intval(Request('id')));
	if( $pluginData )
	{
		Plugin::SetData($pluginData);
		$newData = ToEasyJson(plugin::GetConfigList() , 'config_key' , 'config_key');
		Ajax(null , null , $newData);
	}
	else
	{
		Ajax('',200);
	}
}
else if( $type == 'config_del' )
{
	$configKey = Post('config_key');
	$configPluginId = Post('config_plugin_id');
	$pluginData = $pluginMod->GetById(intval($configPluginId));
	if( $pluginData )
	{
		if( $pluginConfigMod->Delete($configPluginId,$configKey) )
		{
			//写入操作记录
			SetOpLog( 'ลบการกำหนดค่าปลั๊กอิน '.$pluginData['plugin_name'].''.$configKey , 'system' , 'insert' );
			Ajax('ลบการกำหนดค่าปลั๊กอินแล้ว!');
		}
		else
		{
			Ajax('ขออภัย! ลบการกำหนดค่าปลั๊กอินล้มเหลว',300);
		}
	}
	else
	{
		Ajax('ขออภัย! ไม่พบไอดีปลั๊กอิน',300);
	}
}
?>