<?php
/**
* 注册账号操作处理
*
* @version        $Id: reg.php 2016年5月29日 9:59  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$apiUser = unserialize(str::Encrypt(Post('apiuser'),'D'));
if( !is_array($apiUser) )
{
	$apiReg = 0;
	FormTokenCheck();
	FormCodeCheck('code_user_reg');
}
else
{
	$apiReg = 1;
}

//判断是否开启注册
str::EQ( $userConfig['reg_open'], 0, $lang['user']['reg_close']);

//接受参数
$name = str::IsEmpty( Post('name') , $lang['user']['name_no'] );
$psw = str::IsEmpty( Post('psw') , $lang['user']['psw_no'] );
$repsw = str::IsEmpty( Post('repsw') , $lang['user']['repsw_no'] );
$sex = str::Int( Post('sex') , null , 1);
$email = '';


//账号长度和账号格式
str::LN( $name, $lang['user']['name_err'] );
str::CheckLen( $name , '4,16' , $lang['user']['name_len']  );
//密码长度和密码格式
str::CheckLen( $psw , '6,16' , $lang['user']['psw_len']  );
str::NCN( $psw, $lang['user']['psw_err'] );
//两次密码是否相等
str::NEQ( $psw, $repsw , $lang['user']['psw_repsw'] );


//查询账号是否被注册
user::CheckName( $name , $lang['user']['name_exist'] );

//如果不是api注册
if( $apiReg == 0 )
{
	//邮件是否正确
	$email = str::IsEmpty( Post('email') , $lang['user']['email_no'] );
	str::CheckEmail( $email , $lang['user']['email_err'] );
	//检查邮箱是否被注册
	user::CheckEmail( $email , $lang['user']['email_exist'] );
}


$userMod = NewModel('user.user');
//设置数据
$data['name'] = $name;
$data['psw'] = $psw;
$data['salt'] = str::GetSalt();
$data['email'] = $email;
$data['sex'] = $sex;
$data['api'] = $apiReg;
$data['api_user'] = $apiUser;
if( isset($apiUser['api']) )
{
	$data['type'] = $apiUser['api'];
}
//插入数据
$result = $userMod->Reg($data);

//如果插入成功
if( $result )
{
	//模拟登录,如果是正常状态
	if ( $userConfig['reg_status'] == '1' )
	{
		Cookie('user_account' , str::A($name, str::E($psw,$data['salt'])));
	}
	
	//发送邮件
	$emailMod = NewModel('system.email');
	$emailMod->SendMail($email , $name , 'reg');

	$info = GetInfo($lang['user']['operate']['reg'] , 'user_home');	
	$code = 200;
	
	//表单token删除
	FormDel();
	//处理返回用户信息
	$data = ProcessReturnUser($userMod->GetOne($result));
}
else
{
	$data = '';
	$info = $lang['user']['operate']['reg']['fail'];
	$code = 500;
}
//返回提示
ReturnData( $info , $ajax , $code , $data);
?>