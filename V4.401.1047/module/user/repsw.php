<?php
/**
* 重置密码页面
*
* @version        $Id: repsw.php 2016年5月4日 15:35  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//引入模块公共文件
require_once 'user.common.php';

//获取参数
$type = str::IsEmpty( Get('type')  , $lang['user']['no_click'] );
$dvarcode = str::IsEmpty( Get('dvarcode') , $lang['user']['no_click'] );
$deCode = str::Encrypt( $dvarcode , 'D' , C('config.api.system.api_apikey'));
$varcode = str::IsEmpty( Session('var_code') , $lang['user']['no_click'] );

//检查参数
str::NEQ($type , 'repsw' , $lang['user']['no_click'] );
//链接的代码和session的代码是否一致
str::NEQ($deCode , $varcode , $lang['user']['no_click'] );


//获得页面的标题等信息
C('page' ,  array(
	'pagetype'=>'user_repsw' ,
	'dtemp'=>'user/repsw.html',
	'label'=>'userlabel',
	'label_fun'=>'RepswLabel',
	'dvarcode'=>$dvarcode,
));

//设置seo信息
tpl::GetSeo();


//创建模版并且输出
$tpl=new tpl();
$tpl->display();
?>