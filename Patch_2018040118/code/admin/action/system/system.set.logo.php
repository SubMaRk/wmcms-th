<?php
/**
* 网站logo保存处理器
*
* @version        $Id: system.set.logo.php 2016年5月10日 21:59  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$manager = AdminNewClass('manager');
$table = '@config_config';

//如果请求信息存在
foreach ($post as $k=>$v)
{
	$where = array();
	$data = array();
	$where['config_id'] = $k;
	$data['config_value'] = $v;
	$data = str::Escape($data , 'e');

	wmsql::Update( $table , $data , $where);
}

//写入操作记录
SetOpLog( '修改网站logo' , 'system' , 'update' );

//更新配置文件
$manager->UpConfig('web');

Ajax('网站logo修改成功');
?>