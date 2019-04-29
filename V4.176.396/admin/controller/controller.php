<?php
/**
* 后台控制器总文件
*
* @version        $Id: controller.php 2016年4月2日 14:34  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//检查控制器文件是否存在
if ( file_exists('controller/'.$cPath.'.php') )
{
	require 'controller/'.$cPath.'.php';
}
else if(DEBUG && ERR)
{
	die('ไฟล์ควบคุมพื้นหลัง : controller/'.$cPath.'.php ไม่มีอยู่!');
}
?>
