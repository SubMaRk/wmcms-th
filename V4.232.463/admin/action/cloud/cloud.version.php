

	
	
	
		
		
			
				
				
							$mpath = str_replace('/admin',$adminPath,$mpath);
						$mpath = str_replace($zipFilePath.'/code','',$v['path']);
						//如果是后台文件,并且当前文件夹不等于后台文件夹
						{
						}
						file::CopyFile($v['path'] , WMROOT.$mpath , $v['file']);
						if( $adminPath != 'admin' && substr($mpath,0,6) == '/admin')
						require_once $zipFilePath.'/update.php';
					//修改版本
					//列出code里面的文件并且移动
					//如果升级文件存在就执行sql。
					{
					{
					}
					}
					file::DelFile($zipFilePath);
					file::FileAll($zipFilePath.'/code');
					foreach(file::$fileList as $k=>$v)
					if( file_exists($zipFilePath.'/update.php') )
					SetVersion($rs['data']['version_number'],date('Ymd', strtotime($rs['data']['version_addtime'])));
				$cloudSer->SetUpdateLog(WMVER,$rs['data']['version_number']);
				$file = str::GetLast($rs['data']['version_downurl'],'/');
				$zip = NewClass('pclzip',$zipFilePath.'.'.$fileExt);
				$zipFilePath = WMROOT.'upload/update/'.$fileName;
				//获得文件的名字
				//解压缩到当前id文件夹下面
				//下载服务器升级补丁
				//写入操作记录
				//检查是否下载过文件了,下载过就删除文件。
				{
				{
				}
				}
				Ajax('ขออภัย! เวอร์ชั่นนี้ไม่รองรับการอัปเกรดผ่านพื้นหลัง โปรดไปที่เว็บไซต์ทางการเพื่อดาวน์โหลดอัปเดทด้วยตนเอง',300);
				Ajax('ขออภัย! เวอร์ชั่นปัจจุบันไม่ต้องอัปเกรด',300);
				Ajax('ยินดีด้วย! อัปเกรดระบบสำเร็จ โปรดออกจากระบบแล้วเข้าสู่ระบบใหม่อีกครั้งเพื่อสัมผัสประสบการณ์ของเวอร์ชั่นล่าสุด',200,$zipFilePath);
				file::DownloadFile($rs['data']['version_downurl'],2,WMROOT.'upload/update','update');
				if ( $zip->extract(PCLZIP_OPT_PATH, $zipFilePath) )
				if( file_exists($zipFilePath) )
				list($fileName,$fileExt) = explode('.', $file);
				Session('update_downLen' , $rs['data']['version_size']);
				SetOpLog( 'อัปเกรดระบบ' , 'system' , 'update' );
			$data['success'] = 1;
			//总大小
			{
			{
			{
			}
			}
			}
			Ajax('กำลังดาวน์โหลด...' , 201 , $data);
			Ajax('ขออภัย! ไม่พบเวอร์ชั่นใหม่',300);
			else
			if( $rs['data']['version_down'] == '0' )
			if( $rs['data']['version_down'] == 1 )
			Session('update_size' , $rs['data']['version_size']);
		$data['barline'] = round($downSize/$size,2)*100;
		$data['success'] = 0;
		$rs = $cloudSer->GetVersionNext(1);
		{
		{
		{
		}
		}
		}
		Ajax('กำลังดาวน์โหลด...' , 200 , $data);
		Ajax('ดาวน์โหลดล้มเหลว！',300);
		Ajax('ขออภัย! โปรดตั้งไดเร็กทอรี่พื้นหลังในจัดการระบบ > ตั้งค่าเว็บไซต์ > ตั้งค่าทั่วไป มิเช่นนั้นจะไม่สามารถอัปเกรดได้',300);
		Ajax('ขออภัย! ไม่พบไดเร็กทอรี่พื้นหลังในการตั้งค่าระบบ ไม่สามารถอัปเกรดได',300);
		else
		if( $downSize == $size)
		if( isset($rs['data']) )
		Session('update_downLen',0);
		Session('update_size',0);
	$adminPath = $C['config']['web']['admin_path'];
	$downSize = Session('update_downLen');
	$rs = $cloudSer->GetNewVer();
	$rs = $cloudSer->GetVersionNext(1);
	$size = Session('update_size');
	//总大小
	{
	{
	{
	{
	{
	}
	}
	}
	}
	}
	Ajax('คำขอสำเร็จ！',200,$rs);
	Ajax('คำขอสำเร็จ！',200,$rs);
	else
	else
	else if( !is_dir(WMROOT.$adminPath) )
	if( $adminPath == '' )
	if($size > 0 )
$cloudSer = NewClass('cloud');
*
*
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @package        WMCMS
* @version        $Id: cloud.version.php 2017年2月25日 13:57  weimeng
* 版本请求处理器
*/
/**
//获得下一版本
//获得最新版本
//升级进度查询
//开始升级
?>
{
{
{
{
}
}
}
}
<?php
else if ( $type == 'getbarline' )
else if ( $type == 'getnew' )
else if ( $type == 'update' )
if ( $type == 'getnext' )
