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
if( Session('apilogin_openid') == '' || Session('apilogin_type') == '' )
{
	FormTokenCheck();
	FormCodeCheck('code_user_reg');
}

//判断是否开启注册
str::EQ( $userConfig['reg_open'], 0, $lang['user']['reg_close']);

//接受参数
$name = str::IsEmpty( Post('name') , $lang['user']['name_no'] );
$psw = str::IsEmpty( Post('psw') , $lang['user']['psw_no'] );
$repsw = str::IsEmpty( Post('repsw') , $lang['user']['repsw_no'] );
$sex = str::Int( Post('sex') , null , 1);
$email = '';
$apiReg = str::Int( Post('apireg') );


//账号长度和账号格式
str::CheckLen( $name , '4,16' , $lang['user']['name_len']  );
str::LN( $name, $lang['user']['name_err'] );
//密码长度和密码格式
str::CheckLen( $psw , '6,16' , $lang['user']['psw_len']  );
str::NCN( $psw, $lang['user']['psw_err'] );
//两次密码是否相等
str::NEQ( $psw, $repsw , $lang['user']['psw_repsw'] );


//查询账号是否被注册
user::CheckName( $name , $lang['user']['name_exist'] );

//如果不是api注册
if( $apiReg == '0' )
{
	//邮件是否正确
	$email = str::IsEmpty( Post('email') , $lang['user']['email_no'] );
	str::CheckEmail( $email , $lang['user']['email_err'] );
	//检查邮箱是否被注册
	user::CheckEmail( $email , $lang['user']['email_exist'] );
}


//是默认头像还是随机头像
$head = $userConfig['default_head'];
if( $userConfig['user_head'] == '1')
{
	$headMod = NewModel('user.head');
	$headData = $headMod->RandOne();
	if ( $headData )
	{
		$head = $headData['head_src'];
	}
}


//插入数据
$psw = str::E($psw);
$userMod->data['user_name'] = $name;
$userMod->data['user_nickname'] = $name;
$userMod->data['user_psw'] = $psw;
$userMod->data['user_status'] = $userConfig['reg_status'];
$userMod->data['user_email'] = $email;
$userMod->data['user_head'] = $head;
$userMod->data['user_sign'] = $userConfig['reg_sign'];
$userMod->data['user_sex'] = $sex;
$userMod->data['user_regip'] = GetIp();
$userMod->data['user_gold1'] = $userConfig['reg_gold1'];
$userMod->data['user_gold2'] = $userConfig['reg_gold2'];
$userMod->data['user_exp'] = $userConfig['reg_exp'];
$result = $userMod->Add();

//如果插入成功
if( $result )
{
	//插入财务信息
	$financeData['finance_user_id'] = $result;
	$financeMod = NewModel('user.finance');
	$financeMod->InsertFinance($financeData);
	//插入推荐票信息
	$ticketMod = NewModel('user.ticket');
	$ticketMod->RegInsert($result , $userConfig['reg_rec'] , $userConfig['reg_month'] , '1' , $lang['user']['ticket_reg_remark']);
	
	//如果是接口登录就绑定账号
	if( $apiReg == 1 )
	{
		$apiLoginOpenid = Session('apilogin_openid');
		$apiLoginType = Session('apilogin_type');
		Cookie('api_login_type' , 'delete');
		Cookie('api_login_domain' , 'delete');
		Cookie('apilogin_type_name' , 'delete');
		Session('apilogin_type' , 'delete');
		Session('apilogin_openid' , 'delete');
		Session('apilogin_nickname' , 'delete');
		if( $apiLoginOpenid == '' || $apiLoginType == '' )
		{
			ReturnData( '接口错误！' );
		}
		else
		{
			$userMod = NewModel('user.user');
			$userMod->InsertApiLogin($result , $apiLoginType , $apiLoginOpenid);
		}
	}
	
	//模拟登录,如果是正常状态
	if ( $userConfig['reg_status'] == '1' )
	{
		Cookie('user_account' , str::A($name, $psw) );
	}
	
	
	//发送邮件
	$emailMod = NewModel('system.email');
	$emailMod->SendMail($email , $name , 'reg');

	$info = GetInfo($lang['user']['operate']['reg'] , 'user_home');	
	$code = 200;
	
	//表单token删除
	FormDel();
}
else
{
	$info = $lang['user']['operate']['reg']['fail'];
	$code = 500;
}
//返回提示
ReturnData( $info , $ajax , $code );
?>