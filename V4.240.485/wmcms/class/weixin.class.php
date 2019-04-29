<?php
/**
* 微信父类方法
*
* @version        $Id: weixin.class.php 2017年8月3日 22:27  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
class WeiXin {
	//基本配置
	protected $appid;
	protected $apikey;
	protected $secret;
	protected $host = '0.0.0.0';
	protected $port = 0;
	
	/**构造函数**/
	function __construct($data = array())
	{
		if(!empty($data))
		{
			$this->appid = @$data['appid'];
			$this->apikey = @$data['apikey'];
			$this->secret = @$data['secret'];
		}
	}

	
	/**
	 * 请求接口数据
	 * @param string $url ，请求的url
	 */
	protected function __GetUrl($url)
	{
		//初始化curl
		$ch = curl_init();
		//设置超时
		curl_setopt($ch, CURLOPT_TIMEOUT, 10);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		if($this->host != "0.0.0.0" && $this->port != 0){
			curl_setopt($ch,CURLOPT_PROXY, $this->host);
			curl_setopt($ch,CURLOPT_PROXYPORT, $this->port);
		}
		//运行curl，结果以jason形式返回
		$res = curl_exec($ch);
		curl_close($ch);
		//取出openid
		$data = json_decode($res,true);
		return $data;
	}
}
?>