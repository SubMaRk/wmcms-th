<?php
/**
* 专题分类列表
*
* @version        $Id: type.php 2015年8月9日 21:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime 		  2015年12月31日 14:50
*
*/
$ClassArr = array('page');
//引入模块公共文件
require_once 'zt.common.php';


//当前页面的参数检测
$page = str::Page( Get('page') );

C('page' ,  array(
	'pagetype'=>'zt_type',
	'tempid'=>'tempid',
	'dtemp'=>'zt/type.html',
	'label'=>'ztlabel',
	'label_fun'=>'TypeLabel',
	'page'=>$page,
	'listurl'=>tpl::url('zt_type',array('page'=>'{page}')),
));

//设置seo信息
tpl::GetSeo();


//创建模版并且输出
$tpl=new tpl();
$tpl->display();
?>