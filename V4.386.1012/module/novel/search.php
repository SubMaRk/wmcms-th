<?php
/**
* 小说搜索模块
*
* @version        $Id: search.php 2015年8月9日 21:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime		  2016年1月9日 10:18 weimeng
*
*/
$ClassArr = array('page');
//引入模块公共文件
require_once 'novel.common.php';
//检查防止重复刷新
CheckRefTime( $novelConfig['search_time'] );

//当前页面的参数检测
$key = str::IsEmpty( Get('key') , $lang['novel']['par']['key_no']);
$page = str::Page( Get('page') );
$type = str::In( Get('type') , array(array('0','1','2','3'),1) );

//参数长度验证
str::CheckLen( $key , '2,16' , $lang['novel']['par']['key_err'] );


C('page' ,  array(
	'pagetype'=>'novel_search' ,
	'dtemp'=>'novel/search.html',
	'label'=>'novellabel',
	'label_fun'=>'SearchLabel',
	'key'=>$key,
	'type'=>$type,
	'page'=>$page,
	'listurl'=>tpl::url('novel_search',array('type'=>$type,'key'=>$key)),
));

//设置seo信息
tpl::GetSeo();


//创建模版并且输出
$tpl=new tpl();
$tpl->display();
?>