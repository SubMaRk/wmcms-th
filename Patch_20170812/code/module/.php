<?php
/**
 * 
 *
 * @version        $Id: .php 2017年08月02日 21:47  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
//引入模块公共文件
require_once '.common.php';

//获得页面的标题等信息
C('page' ,  array('pagetype'=>'_' ,'dtemp'=>'/.html',));

//设置seo信息
tpl::GetSeo();

//创建模版并且输出
$tpl=new tpl();
$tpl->display();
?>