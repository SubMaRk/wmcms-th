<?php
/**
* 模版管理处理器
*
* @version        $Id: system.templates.php 2016年3月30日 9:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cloudSer = NewClass('cloud');
$manager = AdminNewClass('manager');

//设置本处理器的表
$table = '@templates_templates';

//安装和卸载模版
if ( $type == 'install' || $type == 'uninstall')
{
	$path = Get('path');
	
	if( $path == '' )
	{
		Ajax('โฟลเดอร์เทมเพลตที่ต้องใช้ในการติดตั้งต้องไม่ว่าง',300);
	}
	else if ( !file_exists('../templates/'.$path.'/copyright.xml') )
	{
		Ajax('ขออภัย! ไม่มีข้อมูลลิขสิทธิ์เทมเพลตอยู่',300);
	}
	else
	{		
		//查询模版是否安装了
		$where['table'] = $table;
		$where['where']['templates_path'] = $path;
		$tempArr = wmsql::GetOne($where);
		//获得模版版权信息
		$copyData = GetTempCopy( $path );
		
		//安装模版操作
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
				
				//查询模版信息是否正确
				if ( count($copyData) != '9' || $copyData['name'] == '' || $copyData['author'] == '')
				{
					Ajax('ขออภัย! ข้อมูลลิขสิทธิ์เทมเพลตไม่ถูกต้อง',300);
				}
				//模版已经安装了
				else if ( $tempArr )
				{
					Ajax('ขออภัย! เทมเพลตนี้ถูกติดตั้งแล้ว',300);
				}
				else
				{
					$data['templates_path'] = $path;
					$data['templates_name'] = $copyData['name'];
					$data['templates_appid'] = $copyData['appid'];
					wmsql::Insert($table, $data);
					
					//写入操作记录
					SetOpLog( 'ติดตั้งเทมเพลต' , 'system' , 'update' );
					//更新模版配置文件
					UpTempConfig();
					Ajax('ติดตั้งเทมเพลตสำเร็จ! สามารถใช้ได้เลย');
				}
			}
		}
		//卸载模版操作
		else if( $type == 'uninstall' )
		{
			//模版没有安装
			if ( !$tempArr )
			{
				Ajax('ขออภัย! เทมเพลตยังไม่ถูกติดตั้ง ไม่สามารถถอนการติดตั้งได้',300);
			}
			else
			{
				wmsql::Delete($table, $where['where']);
				
				//更新模版配置文件
				UpTempConfig();

				//写入操作记录
				SetOpLog( 'ถอนการติดตั้งเทมเพลต' , 'system' , 'update' );
				
				Ajax('ถอนการติดตั้งเทมเพลตสำเร็จ!');
			}
		}
	}
}
else
{
	//如果请求信息存在
	if( $post )
	{
		$configMod = NewModel('system.config');
		$configMod->UpdateToForm($post);

		//写入操作记录
		SetOpLog( 'ใช้งานเทมเพลต' , 'system' , 'update' );
		
		//更新配置文件
		$manager->UpConfig('web');
		
		Ajax('ใช้งานเทมเพลตสำเร็จ!');
	}	
}

?>