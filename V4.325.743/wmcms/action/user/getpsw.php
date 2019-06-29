<?php
/**
* 找回密码操作处理
*
* @version        $Id: getpsw.php 2016年5月29日 9:40  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
FormTokenCheck();
FormCodeCheck('code_user_getpsw');

$name = str::IsEmpty( Post('name') , $lang['user']['name_no']);
$email = str::IsEmpty( Post('email') , $lang['user']['email_no']);


//账号长度和账号格式
str::CheckLen( $name , '4,16' , $lang['user']['name_len']  );
str::LN( $name, $lang['user']['name_err'] );
//邮件是否正确
str::CheckEmail( $email , $lang['user']['email_err'] );


//查询账号
$where['user_name'] = $name;
$data = $userMod->GetOne($where);

//邮箱正确
if( $data['user_email'] == $email )
{
	//邮箱没有经过验证，无法提供找回密码服务
	if( $data['user_emailtrue'] =='0' )
	{
		ReturnData( $lang['user']['account_emailtrue'] );
	}

	//发送邮件
	$emailMod = NewModel('system.email');
	$result = $emailMod->SendMail($email , $name , 'getpsw');
	
	//发送成功
	if( $result )
	{
		//表单token删除
		FormDel();
		
		ReturnData( $lang['user']['operate']['getpsw']['success'] , $ajax, 200);
	}
	else
	{
		ReturnData( $lang['user']['operate']['getpsw']['fail'] , $ajax);
	}
}
else if( $data )
{
	ReturnData( $lang['user']['account_email'] );
}
else
{
	ReturnData( $lang['user']['account_no'] );
}
?>