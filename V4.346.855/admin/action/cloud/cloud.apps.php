<?php
/**
* 应用中心处理器
*
* @version        $Id: cloud.apps.php 2019年02月23日 12:00  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cloudSer = NewClass('cloud');

//安装应用
if ( $type == 'install' )
{
	$id = Get('id');
	if( $id == '' )
	{
		Ajax('ไอดีแอปฯ ที่ใช้ในการติดตั้งต้องไม่ว่าง!',300);
	}
	else
	{
		//购买应用
		$rs = $cloudSer->AppBuy($id);
		if( $rs['code'] != '200' )
		{
			Ajax($rs['msg'],300);
		}
		//下载应用
		else
		{
			if( $rs['data']['type'] == 'template' || $rs['data']['type'] == 'wxapp')
			{
				$filePath = WMTEMPLATE;
			}
			else if( $rs['data']['type'] == 'plugin' )
			{
				$filePath = WMPLUGIN.'apps/';
			}
			//本地保存文件名字
			$localFile = $filePath.$id.'.zip';
			//下载文件
			file::DownloadFile($rs['data']['file'] , $id , $filePath , 'apps_down');
			//下载完成
			$cloudSer->APPDownSuccess($rs['data']['file']);
			//解压缩到当前文件夹
			$zip = NewClass('pclzip',$localFile);
			if ( $zip->extract(PCLZIP_OPT_PATH, $filePath) )
			{
				file::DelFile($localFile);
				Ajax('ดาวน์โหลดแอปฯ เสร็จแล้ว โปรดทำการติดตั้งมันด้วยตนเอง!',200,array('id'=>$id));
			}
			else
			{
				Ajax('แตกไฟล์แอปฯ ล้มเหลว โปรดทำการแตกไฟล์ด้วยตนเอง '.$filePath,300);
			}
		}
	}
}
//更新应用
else if ( $type == 'update' )
{
	$id = Get('id');
	$ver = Get('ver');
	if( empty($id) || empty($ver) )
	{
		Ajax('ไอดีปลั๊กอินหรือหมายเลขเวอร์ชั่นที่ใช้อัปเดทต้องไม่ว่าง!',300);
	}
	else
	{
		//获得更新文件的md5
		$rs = $cloudSer->APPUpdate($id,$ver);
		if( $rs['code'] != '200' )
		{
			Ajax($rs['msg'],300);
		}
		//开始更新
		else
		{
			if( $rs['data']['type'] == 'template' || $rs['data']['type'] == 'wxapp')
			{
				$filePath = WMTEMPLATE;
			}
			else if( $rs['data']['type'] == 'plugin' )
			{
				$filePath = WMPLUGIN.'apps/';
			}
			//本地保存文件名字
			$localFile = $filePath.$id.'.zip';
			//下载文件
			$downRs = file::DownloadFile($rs['data']['url'] , $id , $filePath , 'apps_update','zip');
			$cloudSer->APPDownSuccess($rs['data']['md5']);
			if( isset($downRs['code']) )
			{
				Ajax($downRs['msg'],300);
			}
			else
			{
				//将更新包解压缩到当前文件夹
				$zip = NewClass('pclzip',$localFile);
				if ( $zip->extract(PCLZIP_OPT_PATH, $filePath) )
				{
					//删除本地下载文件
					file::DelFile($localFile);
					//修改copyright.xml的版本信息
					$copyData['ver'] = 'V'.$rs['data']['version'];
					$copyData['time'] = $rs['data']['time'];
					UpdateCopyRight($filePath.$id,$copyData);
					//如果是插件就额外修改数据库的版本信息
					if( $rs['data']['type'] == 'plugin' )
					{
						$pluginMod = NewModel('plugin.plugin');
						$pluginMod->UpdateVersion($id,'V'.$rs['data']['version']);
					}
					Ajax('อัปเดทสำเร็จ!');
				}
				else
				{
					Ajax('แยกไฟล์ปลั๊กอินล้มเหลว โปรดแยกไฟล์ด้วยตนเองแล้วแทนที่ : '.$localFile,300);
				}
			}
		}
	}
}
?>