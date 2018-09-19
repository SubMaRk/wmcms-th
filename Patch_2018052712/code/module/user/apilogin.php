<?php
/**
* 接口登录
*
* @version        $Id: apilogin.php 2016年5月4日 21:09  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//引入模块公共文件
require_once 'user.common.php';

//引入接口文件
require_once WMCONFIG.'api.config.php';

$appid = C('config.api.'.$api.'.api_appid');
$apikey = C('config.api.'.$api.'.api_apikey');
$secretkey = C('config.api.'.$api.'.api_secretkey');

//定义返回地址
$backUrl = DOMAIN.'/module/user/apilogin.php';

//检查类型
$type = Cookie('apilogin');

if( $type != '' )
{
	if( Session( $type.'_openid') <>'' )
	{
		$openId = Session( $type.'_openid');
	}
	else
	{
		switch ( $type )
		{
			//qq登录
			case "qqlogin":
				$loginType = 'QQ';
				//引入腾讯登录sdk
				require_once(WMAPI."login/qqlogin/qqConnectAPI.php");
				$qc = new QC();
				//获得access
				$access_token = $qc->qq_callback($appid,$apikey,$backurl);
				//获得openid
				$openId = $qc->get_openid($appid,$apikey,$backurl);
				//获取用户信息
				$qc = new QC($access_token,$openid,$appid);
				$infoarr = $qc->get_user_info();
				$nickName = $infoarr['nickname'];
				break;
		
			//百度登录
			case "bdlogin":
				$loginType = '百度';
				//引入百度登录sdk
				require_once(WMAPI.'login/bdlogin/baidu.php');
				$baidu = new Baidu($apikey, $secretkey, $backurl, new BaiduCookieStore($apikey));
				$user = $baidu->getLoggedInUser();

				$openId = $user['uid'];
				$nickName = $user['uname'];
				break;
				
			//新浪微博登录
			case "weibologin":
				$logintype='新浪微博';
				//引如新浪登录sdk
				require_once(WMAPI.'login/weibologin/saetv2.ex.class.php');
				$o = new SaeTOAuthV2($apikey,$secretkey);
			
				//通信获得openid
				if (isset($_REQUEST['code'])) {
					$keys = array();
					$keys['code'] = $_GET['code'];
					$keys['redirect_uri'] = $backurl;
					try {
						//获取openid
						$token = $o->getAccessToken('code',$keys);
						$openId = $token['uid'];
					} catch (OAuthException $e) {
						echo $e;
						exit;
					}
				}
				break;
				
			default:
				exit;
				break;
		}
		

		//保存session
		Session( $type.'_openid' , $openId);
		Session( $type.'_nickname' , $nickName);
		Session( 'apilogin_type' , $type);
	}

	//删除cookie
	Cookie('apilogin', 'delete');
	
	//处理数据
	if( $openId == '')
	{
		tpl::ErrInfo( C('openid_err' , null, 'user') );
	}
	else
	{
		//查询唯一OpenID是否存在本站数据库。
		$where['table'] = '@user_apilogin';
		$where['left']['@user_user'] = 'user_id=api_uid';
		$where['where']['api_type'] = $type;
		$where['where']['api_openid'] = $openId;
		$data = wmsql::GetOne($where);

		//存在登录接口信息
		if( $data)
		{
			//正确数据就记录cookie
			if( $data['user_id'] > 0)
			{
				Cookie('user_account' , str::A($data['user_name'], $data['user_psw']) , time()+60*60*24*30 );
				tpl::ErrInfo( C('login_success' , null, 'user') );
			}
			//不存在就删除已经绑定的信息
			else
			{
				$where['api_id'] = $data['api_id'];
				wmsql::Delete('@user_apilogin' , $where);
				tpl::ErrInfo( C('apilogin_err' , null, 'user') );
			}
		}
		//不存在就绑定
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
}
?>