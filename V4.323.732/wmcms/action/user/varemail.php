<?php
/**
* 邮箱验证操作处理
*
* @version        $Id: varemail.php 2016年5月17日 10:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$email = user::GetEmail();
$name = user::GetName();
//参数验证
str::EQ( user::GetUid() , 0 , $lang['user']['no_login'] );
str::EQ( $email , '' , $lang['user']['email_no']);
str::EQ( user::GetEmailTrue() , '1' , $lang['user']['email_true']);


//发送邮件
$emailMod = NewModel('system.email');
$result = $emailMod->SendMail($email , $name , 'varemail');

if( $result )
{
	ReturnData( $lang['user']['operate']['varemail']['success'] , $ajax, 200);
}
else
{
	ReturnData( $lang['user']['operate']['varemail']['fail'] , $ajax);
}
?>