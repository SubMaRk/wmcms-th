<?php
/**
* API登录请求处理
*
* @version        $Id: apilogin.php 2016年5月28日 22:06  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//检查类型
$apiLoginType = str::IsEmpty( Request('api') , $lang['user']['no_type']);
//已经登录了
str::RT( user::GetUid() , 0 , $lang['user']['islogin'] );


//接口文件是否存在，存在就引入
if( !file_exists(WMCONFIG.'api.config.php') )
{
	tpl::ErrInfo($lang['user']['api_no']);
}

//接口参数设置
$appid = C('config.api.'.$apiLoginType.'.api_appid');
$apikey = C('config.api.'.$apiLoginType.'.api_apikey');
$secretkey = C('config.api.'.$apiLoginType.'.api_secretkey');
$open = C('config.api.'.$apiLoginType.'.api_open');
if( $open == '0' )
{
	tpl::ErrInfo($lang['user']['api_close']);
}

//定义回调地址
$backurl = DOMAIN.'/wmcms/notify/apilogin.php';
//引如登录自动加载sdk
$autoLoadFile = WMAPI.'login/'.$apiLoginType.'/autoload.php';
if( file_exists($autoLoadFile) )
{
	ClearApiLogin();
	//保存接口类型
	Session('api_login_type' , $apiLoginType);
	
	require_once($autoLoadFile);
	//默认参数
	$data['appid'] = $appid;
	$data['apikey'] = $apikey;
	$data['secret'] = $secretkey;
	$data['backurl'] = $backurl;
	//new一个第三方登录类
	$loginSer = new OtherLogin($data);
	//获得跳转地址
	$loginUrl = $loginSer->GetJumpUrl();
	//如果不是跳转地址
	if( $loginUrl === false )
	{
		switch ($apiLoginType)
		{
			//微信小程序登录
			case "wxapplogin":
				$rs = $loginSer->GetSessionKey(Request('jscode'));
				if( isset($data['errcode']) )
				{
					ReturnJson($rs['errmsg'],500);
				}
				break;
		}
		
		//返回账号绑定或者生成方式
		$userConfig = GetModuleConfig('user');
		$rs['api_login_bind'] = $userConfig['api_login_bind'];
		
		//如果openid存在就查询是否绑定过了
		if( isset($rs['openid']) )
		{
			$userMod = NewModel('user.user');
			$userData = $userMod->GetUserByApi($apiLoginType , $rs['openid']);
			$rs['user'] = ProcessReturnUser($userData);
		}
		ReturnJson('请求成功！',200,$rs);
	}
	else
	{
		header("Location:".$loginUrl);
	}
	die();
}
else
{
	ReturnJson($lang['user']['api_type_no'],500);
}
?>