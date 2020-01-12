<?php
/**
* 开发者配置处理器
*
* @version        $Id: system.dev.addpage.php 2017年6月4日 20:33  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//如果请求信息存在
if( $type == 'add'  )
{
	$fileName= Post('filename');
	$module = Post('module');
	$url = Post('url');
	$seo = Post('seo');
	$urlOpen = Post('urlOpen');
	$seoOpen = Post('seoOpen');
	$page = Post('page');
	$name = Post('name');
	
	if( $fileName == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อไฟล์ก่อน',300);
	}
	else if( ($urlOpen == '1' || $seoOpen == '1') && (Post('page') == '' || Post('name') == '') )
	{
		Ajax('ขออภัย! ต้องกรอกคำหลักและชื่อหน้าเว็บก่อน',300);
	}
	else if( $urlOpen == '1' && ($url['url1'] == '' || $url['url2'] == '') )
	{
		Ajax('ขออภัย! ต้องกรอกลิ้งก์แบบเปลี่ยนแปลงและแบบคงที่ก่อน',300);
	}
	else if( $seoOpen == '1' && ($seo['title'] == '' || $seo['key'] == '' || $seo['desc'] == '') )
	{
		Ajax('ขออภัย! ต้องการข้อมูลเพื่อเพิ่มประสิทธิภาพ SEO ก่อน',300);
	}
	else
	{
		$seoMod = NewModel('system.seo');
		$devMod = NewModel('system.dev');
		//创建文件
		$data['file_name'] = $fileName;
		$data['module'] = $module;
		$data['name'] = $name;
		$data['page'] = $page;
		if( $devMod->Create($data) === false)
		{
			Ajax('对不起，该文件名的控制器已经存在，请更换名字！',300);
		}
		
		//url是否存在。
		if($urlOpen=='1')
		{
			if( $seoMod->GetUrlByPage($module,$page) )
			{
				Ajax('ขออภัย! ชื่อไฟล์ที่ใช้มีอยู่แล้ว โปรดเปลี่ยนเป็นชื่อใหม่',300);
			}
			else
			{
				$urlData['urls_module'] = $module;
				$urlData['urls_page'] = $page;
				$urlData['urls_pagename'] = $name;
				$urlData['urls_url1'] = $url['url1'];
				$urlData['urls_url2'] = $url['url2'];
				$urlData['urls_url3'] = $url['url3'];
				$urlData['urls_url4'] = $url['url4'];
				$urlData['urls_url5'] = $url['url5'];
				$urlData['urls_url6'] = $url['url6'];
				$seoMod->AddUrl($urlData);
			}
		}

		//seo是否存在。
		if($urlOpen=='1')
		{
			if( $seoMod->GetSeoByPage($module,$page) )
			{
				Ajax('ขออภัย! มีข้อมูล SEO ของโมดูลหน้าเว็บนี้อยู่แล้ว',300);
			}
			else
			{
				$keyData['keys_module'] = $module;
				$keyData['keys_page'] = $page;
				$keyData['keys_pagename'] = $name;
				$keyData['keys_title'] = $seo['title'];
				$keyData['keys_key'] = $seo['key'];
				$keyData['keys_desc'] = $seo['desc'];
				$seoMod->AddKey($keyData);
			}
		}
	}
	

	//写入操作记录
	SetOpLog( 'เพิ่มหน้า'.$name.'：'.$fileName , 'system' , 'insert' );
	Ajax();
}
?>