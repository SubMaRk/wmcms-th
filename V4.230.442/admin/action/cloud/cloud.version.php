<?php
/**
* 版本请求处理器
*
* @version        $Id: cloud.version.php 2017年2月25日 13:57  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cloudSer = NewClass('cloud');

//获得下一版本
if ( $type == 'getnext' )
{
	$rs = $cloudSer->GetVersionNext(1);
	Ajax('คำขอสำเร็จ!',200,$rs);
}
//获得最新版本
else if ( $type == 'getnew' )
{
	$rs = $cloudSer->GetNewVer();
	Ajax('คำขอสำเร็จ!',200,$rs);
}
//开始升级
else if ( $type == 'update' )
{
	$adminPath = $C['config']['web']['admin_path'];

	if( $adminPath == '' )
	{
		Ajax('ขออภัย! โปรดตั้งไดเร็กทอรี่พื้นหลังในจัดการระบบ > ตั้งค่าเว็บไซต์ > ตั้งค่าทั่วไป มิเช่นนั้นจะไม่สามารถอัปเกรดได้',300);
	}
	else if( !is_dir(WMROOT.$adminPath) )
	{
		Ajax('ขออภัย! ไม่พบไดเร็กทอรี่พื้นหลังในการตั้งค่าระบบ ไม่สามารถอัปเกรดได้',300);
	}
	else
	{
		$rs = $cloudSer->GetVersionNext(1);
		if( isset($rs['data']) )
		{
			if( $rs['data']['version_down'] == '0' )
			{
				Ajax('ขออภัย! เวอร์ชั่นนี้ไม่รองรับการอัปเกรดผ่านพื้นหลัง โปรดไปที่เว็บไซต์ทางการเพื่อดาวน์โหลดอัปเดทด้วยตนเอง',300);
			}
			//总大小
			Session('update_size' , $rs['data']['version_size']);
			if( $rs['data']['version_down'] == 1 )
			{
				//获得文件的名字
				$file = str::GetLast($rs['data']['version_downurl'],'/');
				list($fileName,$fileExt) = explode('.', $file);
				$zipFilePath = WMROOT.'upload/update/'.$fileName;

				//检查是否下载过文件了,下载过就删除文件。
				if( !file_exists($zipFilePath) )
				{
					file::DelFile($zipFilePath);
				}
				//下载服务器升级补丁
					Session('update_downLen' , $rs['data']['version_size']);
					file::DownloadFile($rs['data']['version_downurl'],2,WMROOT.'upload/update','update');
				}

				$zip = NewClass('pclzip',$zipFilePath.'.'.$fileExt);
				//解压缩到当前id文件夹下面
				if ( $zip->extract(PCLZIP_OPT_PATH, $zipFilePath) )
				{
					//如果升级文件存在就执行sql。
					if( file_exists($zipFilePath.'/update.php') )
					{
						require_once $zipFilePath.'/update.php';
					}
					//列出code里面的文件并且移动
					file::FileAll($zipFilePath.'/code');
					foreach(file::$fileList as $k=>$v)
					{
						$mpath = str_replace($zipFilePath.'/code','',$v['path']);
						//如果是后台文件,并且当前文件夹不等于后台文件夹
						if( $adminPath != 'admin' && substr($mpath,0,6) == '/admin')
						{
							$mpath = str_replace('/admin',$adminPath,$mpath);
						}
						file::CopyFile($v['path'] , WMROOT.$mpath , $v['file']);
					}
					//修改版本
					SetVersion($rs['data']['version_number'],date('Ymd', strtotime($rs['data']['version_addtime'])));
				}

				$cloudSer->SetUpdateLog(WMVER,$rs['data']['version_number']);

				//写入操作记录
				SetOpLog( 'อัปเกรดระบบ' , 'system' , 'update' );
				Ajax('ยินดีด้วย! อัปเกรดระบบสำเร็จ โปรดออกจากระบบแล้วเข้าสู่ระบบใหม่อีกครั้งเพื่อสัมผัสประสบการณ์ของเวอร์ชั่นล่าสุด',200,$zipFilePath);

			}
			else
			{
				Ajax('ขออภัย! เวอร์ชั่นปัจจุบันไม่ต้องอัปเกรด',300);
			}
		}
		else
		{
			Ajax('ขออภัย! ไม่พบเวอร์ชั่นใหม่',300);
		}
	}
}
//升级进度查询
else if ( $type == 'getbarline' )
{
	//总大小
	$size = Session('update_size');
	$downSize = Session('update_downLen');

	if($size > 0 )
	{
		Session('update_size',0);
		Session('update_downLen',0);

		$data['success'] = 0;
		$data['barline'] = round($downSize/$size,2)*100;

		if( $downSize == $size)
		{
			$data['success'] = 1;
			Ajax('กำลังดาวน์โหลด...' , 201 , $data);
		}
		Ajax('กำลังดาวน์โหลด...' , 200 , $data);
	}
	else
	{
		Ajax('ดาวน์โหลดล้มเหลว!',300);
	}
}
?>
