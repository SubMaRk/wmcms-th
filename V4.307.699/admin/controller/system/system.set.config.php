<?php
/**
* 系统配置控制器文件
*
* @version        $Id: system.set.config.php 2016年3月24日 13:31  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$manager = AdminNewClass('manager');

$configArr = str::ArrRestKey($manager->GetConfig( 'system' ) , 'config_id');
$configCount = count($configArr);
?>