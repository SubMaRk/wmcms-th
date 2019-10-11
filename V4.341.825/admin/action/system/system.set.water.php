<?php
/**
* 水印配置存处理器
*
* @version        $Id: system.set.water.php 2018年7月15日 16:33  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//水印设置
if ( $type == 'config' )
{
	$manager = AdminNewClass('manager');
	$configMod = NewModel('system.config');

	$configMod->UpdateToForm($post);

	//写入操作记录
	SetOpLog( 'แก้ไขการตั้งค่าลายน้ำ' , 'system' , 'update' );
	
	//更新配置文件
	$manager->UpConfig('web');
	
	Ajax('จัดเก็บการตั้งค่าลายน้ำสำเร็จ!');
}
//测试生成水印
else if( $type == 'water_test' )
{
	//水印测试背景图的根目录
	$waterRoot = WMFILE.'images/';
	$waterTestBg = 'watermark_test_bg.png';
	$waterTest = 'watermark_test.png';
	//测试背景图的地址和生成的水印图相对地址
	$bgSrc = str_replace(WMROOT, '/', $waterRoot.$waterTestBg);
	$src = str_replace(WMROOT, '/', $waterRoot.$waterTest);
	
	if( file_exists($waterRoot.$waterTestBg) )
	{
		//删除旧的图片
		@unlink($waterRoot.$waterTest);
		//复制新的图片
		file::CopyFile($waterRoot, $waterRoot,$waterTestBg,$waterTest);
		
		//图片加水印
		$imgSer = NewClass('img');
		$imgSer->WaterMark( $waterRoot.$waterTest );
		
		$data['src'] = $src.'?'.time();
		Ajax('สร้างสำเร็จ!',200,$data);
	}
	else
	{
		Ajax('ขออภัย! ไม่มีรูปภาพลายน้ำพื้นหลังอยู่ โปรดตรวจสอบว่ามีไฟล์ '.$bgSrc.' อยู่',300);
	}
}
?>