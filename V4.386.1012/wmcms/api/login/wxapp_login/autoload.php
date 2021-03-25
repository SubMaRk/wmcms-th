<?php
require_once(WMCLASS.'weixin_account.class.php');
//wmcms整合微信APP登录类
class OtherLogin{
	private $wxappSer;
	private $auth;
	function __construct($data=array())
	{
		$this->appid = $data['appid'];
		$this->secret = $data['secret'];
		$this->auth = isset($data['auth'])?$data['auth']:array();
		$this->wxappSer = new WeiXin_Account($data);
	}

	//获得跳转登录的url。
	function GetJumpUrl()
	{
		return false;
	}

	
	//获得用户信息
	function GetUserInfo()
	{
		$token = $this->auth['access_token'];
		$openid = $this->auth['openid'];
		$result = $this->wxappSer->GetUserInfo($token,$openid);
		if( !isset($result['errmsg']) )
		{
			$data['type'] = '手机微信';
			$data['nickname'] = isset($result['nickName'])?$result['nickName']:$result['nickname'];
			$data['openid'] = isset($result['openId'])?$result['openId']:$result['openid'];
			return $data;
		}
		return $result;
	}
}