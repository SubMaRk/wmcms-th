<?php
/**
* API登录返回请求处理
*
* @version        $Id: apilogin.php 2017年4月8日 12:06  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//引入模块公共文件
require_once '../../module/user/user.common.php';

//是否登录了
str::RT( user::GetUid() , 0 , $lang['user']['islogin'] );

//是否是ajax请求
$ajax = str::IsTrue( Request('ajax') , 'yes' , 'page.ajax');
//获取使用登录接口类型
$apiLoginType = Session('api_login_type');
//如果session不存在就读取网页请求的api值
if( $apiLoginType == '' )
{
	$apiLoginType = Request('api');
}

//接口参数设置
$userInfo['openid'] = '';
$appid = C('config.api.'.$apiLoginType.'.api_appid');
$apikey = C('config.api.'.$apiLoginType.'.api_apikey');
$secretkey = C('config.api.'.$apiLoginType.'.api_secretkey');
$open = C('config.api.'.$apiLoginType.'.api_open');
//定义回调地址
$backurl = DOMAIN.'/wmcms/notify/apilogin.php';
//自动加载登录sdk文件路径
$autoLoadFile = WMAPI.'login/'.$apiLoginType.'/autoload.php';

if( $open != '1' )
{
	tpl::ErrInfo($lang['user']['api_close']);
}
//接口文件不存在
else if( !file_exists($autoLoadFile) )
{
	tpl::ErrInfo($lang['user']['api_type_no']);
}
//不存在用户信息
else if( Session('api_login_userinfo') == '' )
{
	Session('apilogin_type' , $apiLoginType);
	//引如登录自动加载sdk
	require_once(WMAPI.'login/'.$apiLoginType.'/autoload.php');

	//默认参数
	$apiConfig['appid'] = $appid;
	$apiConfig['apikey'] = $apikey;
	$apiConfig['secret'] = $secretkey;
	$apiConfig['backurl'] = $backurl;
	$loginSer = new OtherLogin($apiConfig);
	$userInfo = $loginSer->GetUserInfo();
	//接口返回错误
	if( isset($userInfo['errmsg']) )
	{
		ReturnData( $userInfo['errmsg'] , $ajax );
	}
	//信息不存在或者为空
	else if( !isset($userInfo['openid']) || !isset($userInfo['nickname']) 
		|| $userInfo['openid'] == '' || $userInfo['nickname'] == '' )
	{
		ReturnData( $lang['user']['api_data_err'] , $ajax );
	}
}
//存在保存的用户数据
else if( Session('api_login_userinfo') <> '' )
{
	$userInfo = unserialize(str::Encrypt(Session('api_login_userinfo'),'D'));
}
$userInfo['api'] = $apiLoginType;
Session('api_login_userinfo',str::Encrypt(serialize($userInfo)));


//处理数据
if( $userInfo )
{
	$userConfig = GetModuleConfig('user');
	//查询唯一OpenID是否存在本站数据库。
	$userMod = NewModel('user.user');
	$loginData = $userMod->GetApiLogin($apiLoginType , $userInfo['openid']);
	//如果已经接入过或者是自动接入生成账号
	if( $userConfig['api_login_bind'] == '0' || $loginData)
	{
		//不存在api登录信息就注册一个用户。
		if( !$loginData )
		{
			$data['name'] = $apiLoginType.md5_16($userInfo['openid']);
			$data['nickname'] = $userInfo['nickname'];
			$data['psw'] = md5_16($apiLoginType.$userInfo['openid']);
			$data['type'] = $apiLoginType;
			$data['api'] = 1;
			$data['api_user'] = $userInfo;
			$loginData['api_uid'] = $userMod->Reg($data);
		}
		//清除api登录数据
		ClearApiLogin();
		$userData = $userMod->GetOne($loginData['api_uid']);
		if( $userData )
		{
			//是ajax请求
			if( $ajax )
			{
				$userData = ProcessReturnUser($userData);
				ReturnData( '' , $ajax , 200 ,$userData);
			}
			//不是ajax请求
			else
			{
				//写入登录属性，并且跳转到用户中心
				Cookie('user_account' , str::A($userData['user_name'], $userData['user_psw']) );
				header("Location:".tpl::url('user_home'));
			}
		}
		else
		{
			//删除当前用户的所有api登陆了信息
			$userMod->DelApiLogin($uid);
			ReturnData( $lang['user']['no'] , $ajax );
		}
	}
	else
	{
		//获得页面的标题等信息
		C('page' ,  array(
			'pagetype'=>'user_apilogin' ,
			'dtemp'=>'user/apilogin.html',
			'label'=>'userlabel',
			'label_fun'=>'ApiLoginLabel',
			'user_info'=>$userInfo,
		));
		//设置seo信息
		tpl::GetSeo();
		
		//创建模版并且输出
		$tpl=new tpl();
		$tpl->display();
	}
}
else
{
	//清除api登录数据
	ClearApiLogin();
	ReturnData( $lang['user']['api_openid_err'] , $ajax );
}
die();
?>