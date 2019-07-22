<?php
require_once(WMCLASS.'weixin_app.class.php');
//wmcms整合登录类
class OtherLogin{
	private $wxappSer;
	function __construct($data=array())
	{
		$this->appid = $data['appid'];
		$this->secret = $data['secret'];

		$this->wxappSer = new WeiXin_App($data);
	}

	//获得跳转登录的url，qq登录是直接跳转。
	function GetJumpUrl()
	{
		return false;
	}

	
	/**
	 * 获得sessionkey
	 * @param 参数1，必须，jscode
	 */
	function GetSessionKey($jsCode)
	{
		return $this->wxappSer->GetSessionKey($jsCode);
	}
	
	
	//获得用户信息
	function GetUserInfo()
	{
		$key = Post('wxapp_key');
		$encryptedData = Post('wxapp_data');
		$iv = Post('wxapp_iv');
		$data = $this->wxappSer->DecryptData($encryptedData, $key, $iv);
		if( !isset($data['errmsg']) )
		{
			$data['type'] = '微信小程序';
			$data['nickname'] = $data['nickName'];
			$data['openid'] = $data['openId'];
		}
		return $data;
	}
}