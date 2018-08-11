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
//载入基本类文件
$C['module']['inc']['class'] = array('str','file');
$C['module']['inc']['module'] = array('all');

//引入公共文件
$siteCache = false;
require_once '../inc/common.inc.php';

//接口文件是否存在
if( !file_exists(WMCONFIG.'api.config.php') )
{
	tpl::ErrInfo($lang['user']['api_no']);
}

//定义接口类型
$apiLoginType = Cookie( 'api_login_type' );
//接口参数设置
$appid = C('config.api.'.$apiLoginType.'.api_appid');
$apikey = C('config.api.'.$apiLoginType.'.api_apikey');
$secretkey = C('config.api.'.$apiLoginType.'.api_secretkey');
$open = C('config.api.'.$apiLoginType.'.api_open');
$openid = '';
if( $open == '0' )
{
	tpl::ErrInfo('接口已经关闭！');
}

//已经存在sessIon
if( Session('apilogin_openid') <> '' )
{
	$openid = Session('apilogin_openid');
}
else if( $apiLoginType == '' )
{
	tpl::ErrInfo('请重新登录！');
}
else
{
	Session('apilogin_type' , $apiLoginType);
	//定义回调地址
	$backurl = DOMAIN.'/wmcms/notify/apilogin.php';
	//引如登录自动加载sdk
	require_once(WMAPI.'login/'.$apiLoginType.'/autoload.php');
	switch ($apiLoginType)
	{
		//qq登录
		case 'qqlogin':
			$qc = new QC();
			//获得access
			$access_token = $qc->qq_callback($appid,$apikey,$backurl);
			//获得openid
			$openid = $qc->get_openid($appid,$apikey,$backurl);
			//获取用户信息
			$qc = new QC($access_token,$openid,$appid);
			$infoarr = $qc->get_user_info();
			//保存session
			$typeName = 'QQ';
			$nickName = $infoarr['nickname'];
			break;
			
		//百度登录
		case 'bdlogin':
			$baidu = new Baidu($apikey, $secretkey, $backurl, new BaiduCookieStore($apikey));
			$user = $baidu->getLoggedInUser();
			$typeName = '百度';
			$openid = $user['uid'];
			$nickName = $user['uname'];
			break;
			
		//微博登录
		case 'weibologin':
			$o = new SaeTOAuthV2($apikey,$secretkey);
			//通信获得openid
			if (  isset($_REQUEST['code']) )
			{
				$keys = array();
				$keys['code'] = $_GET['code'];
				$keys['redirect_uri'] = $backurl;
				try
				{
					//获取openid
					$token = $o->getAccessToken('code',$keys);
					$typeName = '新浪微博';
					$openid = $nickName = $token['uid'];
				}
				catch (OAuthException $e)
				{
					tpl::ErrInfo($e);
					exit;
				}
			}
			break;
		
		//支付宝登录
		case 'alipaylogin':
			$alipayNotify = new AlipayNotify($alipay_config);
			$verify_result = $alipayNotify->verifyReturn();
			//验证成功
			if($verify_result)
			{
				$typeName = '支付宝';
				$openid = $_GET['user_id'];
				$nickName = $_GET['real_name'];
			}
			else
			{
				tpl::ErrInfo('验证失败！');
			}
			break;
		
		//微信登录
		case 'wxlogin':
			$weixin = new WeiXin($appid,$apikey,$secretkey);
			$result = $weixin->GetUserInfo();
			//验证成功
			if( @$result['openid'] != '' )
			{
				$typeName =  '微信';
				$openid = $result['openid'];
				$nickName = $result['nickname'];
			}
			else
			{
				tpl::ErrInfo($result['errmsg']);
			}
			break;
			
		default:
			tpl::ErrInfo($lang['user']['api_no']);
			break;
	}
	Cookie('apilogin_type_name' , $typeName ,'0');
	Session('apilogin_openid' , $openid);
	Session('apilogin_nickname' , $nickName);
}

//处理数据
if( trim($openid) <> '' )
{
	$userConfig = GetModuleConfig('user');
	//查询唯一OpenID是否存在本站数据库。
	$userMod = NewModel('user.user');
	$loginData = $userMod->GetApiLogin($apiLoginType , $openid);
	//如果已经接入过了
	if( $userConfig['api_login_bind'] == '0' || $loginData)
	{
		//不存在api登录信息就注册一个用户。
		if( !$loginData )
		{
			$data['name'] = $apiLoginType.md5_16($openid);
			$data['nickname'] = $typeName.$nickName;
			$data['psw'] = md5_16($apiLoginType.$openid);
			$data['type'] = $apiLoginType;
			$data['api'] = 1;
			$loginData['api_uid'] = $userMod->Reg($data);
		}
		Cookie('api_login_type' , 'delete');
		Cookie('api_login_domain' , 'delete');
		Cookie('apilogin_type_name' , 'delete');
		Session('apilogin_type' , 'delete');
		Session('apilogin_openid' , 'delete');
		Session('apilogin_nickname' , 'delete');
		$userData = $userMod->GetOne($loginData['api_uid']);

		if( $userData )
		{
			//写入登录属性，并且跳转到用户中心
			Cookie('user_account' , str::A($userData['user_name'], $userData['user_psw']) );
			header("Location:".tpl::url('user_home'));
		}
		else
		{
			//删除当前用户的所有api登陆了信息
			$userMod->DelApiLogin($uid);
			tpl::ErrInfo('对不起，没有该用户的信息!');
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
	Cookie('api_login_type' , 'delete');
	Cookie('api_login_domain' , 'delete');
	Cookie('apilogin_type_name' , 'delete');
	Session('apilogin_type' , 'delete');
	Session('apilogin_openid' , 'delete');
	Session('apilogin_nickname' , 'delete');
	tpl::ErrInfo("对不起，OPENID获取失败，重新登录！");
}
die();
?>