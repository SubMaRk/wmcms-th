<?php
/**
* 处理器总文件
*
* @version        $Id: action.php 2016年4月2日 14:31  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//检查控制器文件是否存在
if ( file_exists('action/'.$cPath.'.php') )
{
	require 'action/'.$cPath.'.php';
	exit;
}
else
{
	die('后台处理器文件：action/'.$cPath.'.php 不存在！');
}
?>