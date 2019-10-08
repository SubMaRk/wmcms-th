<?php
/**
* 插件管理处理器
*
* @version        $Id: cloud.apps.plugin.php 2018年6月10日 11:15  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cloudSer = NewClass('cloud');
$pluginMod = NewModel('plugin.plugin');

//安装和卸载插件
if ( $type == 'install' || $type == 'uninstall' )
{
	$path = Get('path');
	if( $path == '' )
	{
		Ajax('โฟลเดอร์ที่จำเป็นสำหรับการติดตั้งต้องไม่ว่างเปล่า!',300);
	}
	else if ( !file_exists(WMPLUGIN.'apps/'.$path.'/copyright.xml') )
	{
		Ajax('ขออภัย! ไม่มีไฟล์ลิขสิทธิ์',300);
	}
	else
	{
		//安装/卸载文件路径
		$installFile = WMPLUGIN.'apps/'.$path.'/install/install.php';
		$unInstallFile = WMPLUGIN.'apps/'.$path.'/install/uninstall.php';
		
		//获得插件版权信息
		$copyData = GetTempCopy( $path , WMPLUGIN.'apps/');
		//查询是否安装过了
		$data = $pluginMod->GetByFloder($path);
		
		//安装插件操作
		if( $type == 'install' )
		{
			//应用信息校正
			$rs = $cloudSer->APPInstall($path);
			if( $rs['code'] != '200' )
			{
				Ajax($rs['msg'],300);
			}
			else
			{
				//校正appid
				if( $rs['data']['online'] == '1' )
				{
					$copyData['appid'] = $rs['data']['appid'];
				}
				
				if( $data )
				{
					Ajax('ขออภัย! ปลั๊กอินถูกติดตั้งไปแล้ว',300);
				}
				else
				{
					//如果存在安装文件就执行
					if( file_exists($installFile) )
					{
						require_once $installFile;
					}
					
					$data['plugin_name'] = $copyData['name'];
					$data['plugin_floder'] = $path;
					$data['plugin_author'] = $copyData['author'];
					$data['plugin_version'] = $copyData['ver'];
					$pluginMod->Insert($data);
					
					//写入操作记录
					SetOpLog( 'ติดตั้งปลั๊กอิน'.$copyData['name'] , 'system' , 'insert' );
					
					Ajax('ติดตั้งปลั๊กอินสำเร็จแล้ว!');
				}
			}
		}
		//卸载插件操作
		else
		{
			if( !$data )
			{
				Ajax('ขออภัย! ปลั๊กอินยังไม่ติดตั้ง ไม่จำเป็นต้องถอนการติดตั้ง');
			}
			else
			{
				//执行卸载文件
				if( file_exists($unInstallFile) )
				{
					require_once $unInstallFile;
				}
				
				$pluginMod->DelById($data['plugin_id']);
				//写入操作记录
				SetOpLog( 'ถอนการติดตั้งปลั๊กอิน'.$data['plugin_name'] , 'system' , 'update' );
				Ajax('ถอนการติดตั้งปลั๊กอินสำเร็จแล้ว!');
			}
		}
	}
}
//修改插件配置
else if ( $type == 'config' )
{
	$id = Post('id');
	if( $id < 1 )
	{
		Ajax('ขออภัย! ไม่มีลำดับปลั๊กอิน',300);
	}
	else
	{
		//查询是否安装过了
		$pluginData = $pluginMod->GetById($id);
		//插件配置前缀
		$pluginConfigPre = 'plugin_'.$pluginData['plugin_floder'].'_';
		//post参数
		$data = Post();
		unset($data['id']);
		
		//安装插件操作
		if( !$pluginData )
		{
			Ajax('ขออภัย! ปลั๊กอินไม่ถูกติดตั้งหรือไม่มีอยู่',300);
		}
		//修改配置操作
		else
		{
			//获得当前插件已经存在的配置
			$configMod = NewModel('plugin.config');
			$configList = $configMod->GetList($id);
			$configList = str::ArrRestKey($configList,'config_key');
			
			if( $data )
			{
				foreach ($data as $k=>$v)
				{
					$key = $pluginConfigPre.$k;

					//当前配置不存在就设置添加参数
					if( empty($configList[$key]) )
					{
						$configMod->Insert($id,$key,$v);
					}
					//当前配置存在，并且值不相等就设置修改参数
					else if( $v != GetKey($configList,$key.',config_val') )
					{
						$configMod->Update($id,$key,$v);
					}
				}
			}

			//写入操作记录
			SetOpLog( 'แก้ไขการกำหนดค่าปลั๊กอิน'.$pluginData['plugin_name'].'กำหนดค่าระบบแล้ว！' , 'system' , 'update');
			Ajax('แก้ไขการกำหนดค่าปลั๊กอินสำเร็จแล้ว!');
		}
	}
}
?>