<?php
/**
* 保存用户个人资料操作处理
*
* @version        $Id: upbasic.php 2016年5月17日 10:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//是否登录了
str::EQ( user::GetUid() , 0 , $lang['user']['no_login'] );

$nickname = str::DelHtml(str::IsEmpty( Post('nickname') , $lang['user']['nickname_no']));
$nickname = str::trim($nickname);
$email = str::DelHtml(str::IsEmpty( Post('email') , $lang['user']['email_no']));
$sex = str::Int( Post('sex') , null ,1);
$birthday = str::IsTime( Post('birthday') , $lang['user']['birthday_err']);
$sign = str::DelHtml(str::IsEmpty( Post('sign') , $lang['user']['sign_no']));
$tel = str::IsTel( Post('tel') , $lang['user']['tel_err'] ,1);
$qq = str::Int( Post('qq') , $lang['user']['qq_err']);

//昵称长度
str::CheckLen( $nickname , '2,16' , $lang['user']['nickname_len']  );
//邮箱格式
str::CheckEmail($email , $lang['user']['email_err']);
//签名长度
str::CheckLen( $sign , '10,200' , $lang['user']['sign_len']  );

//保留词判断
CheckShield( $nickname , $lang['user']['shield_err'] , 'shield' );
//禁用词判断
CheckShield( $sign , $lang['user']['disable_err'] , 'disable' );


//检查昵称是否存在
$where['user_nickname'] = $nickname;
$where['user_id'] = array('<>',user::GetUid());
$count = $userMod->GetCount($where);
//如果昵称存在
str::RT($count, 0, $lang['user']['nickname_exist']);


//邮箱是否存在
unset($where['user_nickname']);
$where['user_email'] = $nickname;
$count = $userMod->GetCount($where);
//如果邮箱存在
str::RT($count, 0, $lang['user']['email_exist']);


//如果没认证可以修改邮箱
if( user::GetEmailTrue() == '0' )
{
	$data['user_email'] = $email;
}
//设置修改数据
$data['user_nickname'] = $nickname;
$data['user_sex'] = $sex;
$data['user_birthday'] = $birthday;
$data['user_sign'] = $sign;
$data['user_tel'] = $tel;
$data['user_qq'] = $qq;
//保存数据
$result = $userMod->Save($data);

//保存成功
if( $result )
{
	ReturnData( $lang['user']['operate']['upbasic']['success'] , $ajax , 200);
}
else
{
	ReturnData( $lang['user']['operate']['upbasic']['fail'] , $ajax);
}
?>