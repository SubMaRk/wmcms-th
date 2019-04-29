<?php
class WeiXin
{
	private $appid;
	private $apikey;
	private $secretkey;
	
	function __construct($appid,$apikey,$secretkey)
	{
		$this->appid = $appid;
		$this->apikey = $apikey;
		$this->secretkey = $secretkey;
	}
	
	/**
	 * Make an HTTP request
	 *
	 * @return string API results
	 * @ignore
	 */
	function http($url, $data = array())
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		//如果是post请求
		if( is_array($data) )
		{
			curl_setopt($ch, CURLOPT_POST, 0);
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
		}
		$output = curl_exec($ch);
		curl_close($ch);
		return $output;
	}
	
	/**
	* 获得微信登录地址
	* @param 参数1，回调地址。
	*/
	function CreateLoginUrl($backurl)
	{
		return 'https://open.weixin.qq.com/connect/qrconnect?appid='.$this->appid.'&redirect_uri='.urlencode($backurl).'&scope=snsapi_login&response_type=code&state='.time();
	}
	
	
	/**
	* 获得access_token
	*/
	function GetToken()
	{
		$url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$this->appid.'&secret='.$this->secretkey.'&code='.$_GET['code'].'&grant_type=authorization_code';
		$data = json_decode($this->http($url),true);
		return $data;
	}
	
	/**
	* 获得用户信息
	*/
	function GetUserInfo()
	{
		$result = $this->GetToken();
		//验证成功
		if( !empty($result['access_token']) )
		{
			$url = 'https://api.weixin.qq.com/sns/userinfo?access_token='.$result['access_token'].'&openid='.$result['openid'].'&grant_type=snsapi_userinfo';
			$data = json_decode($this->http($url),true);
			return $data;
		}
		else
		{
			return $result;
		}
	}
}
