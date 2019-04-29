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

//定义接口类型
Cookie( 'api_login_type' , $apiLoginType ,'0');
//获得当前域名
Cookie( 'api_login_domain' , $_SERVER['SERVER_NAME']  ,'0');

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
	require_once($autoLoadFile);
}
switch ($apiLoginType)
{
	//qq登录
	case "qqlogin":
		$qc = new QC();
		//传入网站接口信息，跳转登录
		$qc->qq_login($appid,$apikey,$backurl);
		break;

	//百度登录
	case "bdlogin":
		$baidu = new Baidu($apikey, $secretkey, $backurl, new BaiduCookieStore($apikey));
		//获得登录地址并且跳转
		$loginurl = $baidu->getLoginUrl('', 'popup');
		header("Location:".$loginurl);
		break;

	//微博登录
	case "weibologin":
		$o = new SaeTOAuthV2($apikey,$secretkey);
		//获得登录地址并且跳转
		$loginurl = $o->getAuthorizeURL($backurl);
		header("Location:".$loginurl);
		break;

	//支付宝登录
	case "alipaylogin":
		$alipaySubmit = new AlipaySubmit($alipay_config);
		$loginurl = $alipaySubmit->alipay_gateway_new.$alipaySubmit->buildRequestParaToString($parameter);
		header("Location:".$loginurl);
		break;

	//微信登录
	case "wxlogin":
		$weixin = new WeiXin($appid , $apikey , $secretkey);
		$loginurl = $weixin->CreateLoginUrl($backurl);
		header("Location:".$loginurl);
		break;
}
exit;
?>