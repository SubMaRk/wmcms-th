<?php
/**
* 文件处理器
*
* @version        $Id: data.file.php 2016年5月12日 20:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//重命名文件或者文件夹操作
if ( $type == 'rename' )
{
	$path = str::ClearPath($post['path'],true);
	$oldName = $post['oldname'];
	$newName = $post['newname'];
	
	if( $oldName == '' || $newName == '' )
	{
		Ajax( 'ขออภัย! ต้องระบุชื่อไฟล์เดิมและชื่อไฟล์ใหม่ก่อน' , 300);
	}
	else if( str::in_string('../',$path,1) || str::in_string('..',$path,1))
	{
		Ajax('ขออภัย! ที่ตั้งไฟล์ไม่ถูกต้อง' , 300);
	}
	else
	{
		if( file_exists(WMROOT.$path.$newName) )
		{
			Ajax( 'ขออภัย! มีไฟล์หรือโฟลเดอร์ใช้ชื่อนี้อยู่' , 300);
		}
		else
		{
			rename(WMROOT.$path.str::EnCoding($oldName,'gb2312'),WMROOT.$path.$newName);
			Ajax( 'ยินดีด้วย! เปลี่ยนชื่อไฟล์หรือโฟลเดอร์สำเร็จ!');
		}
	}
}
//删除文件或者文件夹操作
else if( $type == 'del' )
{
	$path = str::ClearPath(Request('path'));
	$dt = Request('dt');

	if( str::in_string('../',$path,1) || str::in_string('..',$path,1))
	{
		Ajax('ขออภัย! ที่ตั้งไฟล์ไม่ถูกต้อง' , 300);
	}
	else
	{
		//删除文件夹
		if( $dt == 'folder' )
		{
			$path = str::ClearPath($path,true);
			file::DelDir(WMROOT.$path);
			Ajax( 'ยินดีด้วย! ลบโฟลเดอร์สำเร็จ');
		}
		//删除文件
		else
		{
			file::DelFile(WMROOT.$path);
			Ajax( 'ยินดีด้วย! ลบไฟล์สำเร็จ');
		}
	}
}
//创建文件夹
else if( $type == 'createfolder' )
{
	$path = str::ClearPath(Request('path'),true);
	$newName = Request('newname');
	
	if( str::in_string('../',$path,1) || str::in_string('..',$path,1))
	{
		Ajax('ขออภัย! ที่ตั้งไฟล์ไม่ถูกต้อง' , 300);
	}
	else
	{
		if( $newName == '' )
		{
			Ajax( 'ขออภัย! ต้องกรอกชื่อโฟลเดอร์ใหม่ก่อน' , 300);
		}
		//创建文件夹
		else
		{
			file::CreateFolder(WMROOT.$path.$newName);
			Ajax( 'ยินดีด้วย! สร้างโฟลเดอร์สำเร็จ');
		}
	}
}
//移动文件夹
else if( $type == 'movefile' )
{
	$oldPath = str::ClearPath(Request('oldpath'),true);
	$newPath = str::ClearPath(Request('newpath'),true);
	$fileName = Request('file');
	
	if( $newPath == '' )
	{
		Ajax( 'ขออภัย! ตำแหน่งที่จะย้ายต้องไม่ว่าง' , 300);
	}
	else if( str_replace('../', '', $newPath) != $newPath )
	{
		Ajax( 'ขออภัย! ไม่สามารถใช้สัญลักษณ์ ../ ได้' , 300);
	}
	//创建文件夹
	else
	{
		//如果新的目录不是以/开头
		if( substr( $newPath, 0, 1 ) != '/' )
		{
			$newPath = $oldPath.$newPath;
		}
		else
		{
			$newPath = ltrim($newPath, "/");
		}
		//如果最后不是以斜杠结尾
		if( substr($newPath, -1) != '/' )
		{
			$newPath = $newPath.'/';
		}
		
		file::MoveFile(WMROOT.$oldPath, WMROOT.$newPath, $fileName);
		Ajax( 'ยินดีด้วย! ย้ายไฟล์สำเร็จ');
	}
}
//创建文件
else if( $type == "create" || $type == "edit" )
{
	$path = str::ClearPath(Request('path'),true);
	$fileName = str::ClearPath(Request('filename'));
	$fileContent = stripslashes($_POST['content']);
	//如果保存的目录是以/开头，就替换掉
	if( substr( $path, 0, 1 ) == '/' )
	{
		$path = ltrim($path, "/");
	}

	if( $fileName == '' )
	{
		Ajax( 'ขออภัย! ชื่อต้องไม่ว่าง' , 300);
	}
	else if( str_replace('../', '', $path) != $path )
	{
		Ajax( 'ขออภัย! ไม่สามารถใช้ ../ ได้' , 300);
	}
	else if( file_exists(WMROOT.$path.$fileName) && $type == "create")
	{
		Ajax( 'ขออภัย! มีไฟล์ที่ใช้ชื่อเดียวกันอยู่แล้ว' , 300);
	}
	else if( !file_exists(WMROOT.$path.$fileName) && $type == "edit")
	{
		Ajax( 'ขออภัย! ไม่มีไฟล์นี้อยู่' , 300);
	}
	else
	{
		if( $type == 'create' )
		{
			file::CreateFile(WMROOT.$path.$fileName, $fileContent);
			Ajax( 'ยินดีด้วย! สร้างไฟล์สำเร็จ' );
		}
		else
		{
			file::CreateFile(WMROOT.$path.$fileName, $fileContent , '1');
			Ajax( 'ยินดีด้่วย! แก้ไขไฟล์สำเร็จ' );
		}
	}
}
//备份程序
else if( $type == 'backup' )
{
	$zip = NewClass('pclzip','../'.time().'.zip');
	if( $zip->create( WMROOT,PCLZIP_OPT_REMOVE_PATH,WMROOT) == 0)
	{
		Ajax( $zip->errorInfo(true) , 300 );
	}
	else
	{
		Ajax( 'สำรองข้อมูลสำเร็จ' );
	}
}
//下载文件
else if( $type == 'down' )
{
	$path = str::ClearPath(Request('path'),true);
	$fileName = str::ClearPath(Request('file'));
	
	Header( "Content-type:  application/octet-stream "); 
	Header( "Accept-Ranges:  bytes "); 
	Header( "Accept-Length: " .filesize(WMROOT.$path.$fileName));
	header( "Content-Disposition:  attachment;  filename= {$fileName}"); 
	readfile(WMROOT.$path.$fileName);
}
?>