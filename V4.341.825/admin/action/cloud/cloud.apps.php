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
?>