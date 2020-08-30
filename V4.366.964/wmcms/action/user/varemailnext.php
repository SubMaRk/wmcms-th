<?php
/**
* 验证邮箱点击链接后的操作处理
*
* @version        $Id: varemailnext.php 2016年5月28日 21:20  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//邮箱验证码
$dvarcode = str::IsEmpty( Get('dvarcode') , $lang['user']['dvarcode_no']);
$deCode = str::Encrypt( $dvarcode , 'D' , C('config.api.system.api_apikey'));
//session里面的验证码
$varcode = str::IsEmpty( Session('var_code') , $lang['user']['dvarcode_no'] );

//链接的代码和session的代码是否一致
str::NEQ($deCode , $varcode , $lang['user']['dvarcode_no'] );

//修改用户邮箱验证状态
$userMod->emailTrue = 1;
$result = $userMod->SaveEmailTrue();

//清空重置密码session
Session('var_code' , 'delete');
Session('var_name' , 'delete');
	
if( $result )
{
	$info = GetInfo($lang['user']['operate']['varemailnext'] , 'user_home');
	ReturnData( $info , $ajax, 200);
}
else
{
	ReturnData( $lang['user']['operate']['varemailnext']['fail'] , $ajax);
}
?>