<?php
/**
* 云服务类
*
* @version        $Id: cloud.class.php 2017年2月22日 21:18  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
class cloud{
	private $httpSer;
	private $email;
	private $appid;
	private $domain;
	
	/**
	 * 构造函数
	 * @param 参数1，必须，请求类型
	 * @param 参数1，必须，请求类型
	 */
	function __construct()
	{
		global $_SERVER;
		$this->httpSer = NewClass('http');
		$this->email = C('config.web.email');
		$this->appid = C('config.api.system.api_appid');
		$this->apikey = C('config.api.system.api_apikey');
		$this->secret = C('config.api.system.api_secretkey');
		$this->domain = TCP_TYPE.'://'.@$_SERVER['HTTP_HOST'];
	}


	/**
	 * 请求获得参数
	 * @param 参数1，必须，请求参数
	 * @param 参数1，选填，附加请求数据
	 */
	function Request($url , $data = array())
	{
		$data['appid'] = $this->appid;
		$data['apikey'] = $this->apikey;
		$data['secret'] = $this->secret;
		$data['domain'] = $this->domain;
		$data['ver'] = WMVER;
		$htmlCode = $this->httpSer->GetUrl($url , $data);
		$code = @json_decode($htmlCode,true);
		return $code;
	}

	/**
	 * 获得最新的程序版本
	 * @param 参数1，必须，请求参数
	 */
	function GetNewVer()
	{
		return $this->Request(WMSERVER.'/index.php?m=version&c=version&a=getnew');
	}
	/**
	 * 获得程序版本列表
	 * @param 参数1，选填，是否是只查找能升级版本
	 */
	function GetVersionNext($isUpdate = 0)
	{
		$data['version'] = WMVER;
		return $this->Request(WMSERVER.'/index.php?m=version&c=version&a=getnext&isupdate='.$isUpdate , $data);
	}
	/**
	 * 写入升级记录
	 * @param 参数1，必填，旧的版本
	 * @param 参数2，必填，新的版本
	 */
	function SetUpdateLog($oldVer,$newVer)
	{
		$data['oldver'] = $oldVer;
		$data['newver'] = $newVer;
		return $this->Request(WMSERVER.'/index.php?m=version&c=version&a=setupdatelog' , $data);
	}
	function GetBasic()
	{
		$this->httpSer->timeout = 3600;
		$data = $this->Request(WMSERVER.'/index.php?m=site&c=site&a=detail');
		if( empty($data['data']['content']) )
		{
			return false;
		}
		else
		{
			return $data['data']['content'];
		}
	}
	
	

	/**
	 * 获得缓存的文件路径以及名字
	 * @param 参数1，必须，请求参数
	 */
	function ErrlogAdd($data)
	{
		$data['email'] = $this->email;
		$data['domain'] = $this->domain;
		return $this->Request(WMSERVER.'/index.php?m=errlog&c=errlog&a=add' , $data);
	}
	/**
	 * 获得BUG反馈的列表
	 * @param 参数1，必须，分类id，0为所有
	 * @param 参数2，选填，当前页数,默认为1
	 * @param 参数3，选填，每页数量。默认20
	 * @param 参数4，选填，是否只显示自己的数据
	 */
	function GetErrlogList($page=1,$pageCount = '20')
	{
		return $this->Request(WMSERVER.'/index.php?m=errlog&c=errlog&a=getlist&page='.$page.'&pagecount='.$pageCount);
	}
	

	/**
	 * 安装程序请求
	 */
	function Install()
	{
		return $this->Request(WMSERVER.'/index.php?m=tongji&c=install&version='.WMVER);
	}
	


	/**
	 * 获得BUG反馈的分类
	 */
	function GetMessageType()
	{
		return $this->Request(WMSERVER.'/index.php?m=message&c=messagetype&a=getlist');
	}
	/**
	 * 获得BUG反馈的列表
	 * @param 参数1，必须，分类id，0为所有
	 * @param 参数2，选填，当前页数,默认为1
	 * @param 参数3，选填，每页数量。默认20
	 * @param 参数4，选填，是否只显示自己的数据
	 */
	function GetMessageList($tid,$page=1,$pageCount = '20',$isUser=0)
	{
		return $this->Request(WMSERVER.'/index.php?m=message&c=message&a=getlist&page='.$page.'&tid='.$tid.'&pagecount='.$pageCount.'&isuser='.$isUser);
	}
	/**
	 * 获得BUG反馈的详情
	 * @param 参数1，必须，反馈ID
	 */
	function GetMessage($id)
	{
		return $this->Request(WMSERVER.'/index.php?m=message&c=message&a=getdetail&id='.$id);
	}
	/**
	 * 获得BUG反馈的详情
	 * @param 参数1，必须，反馈类型
	 * @param 参数2，必须，是否公开反馈
	 * @param 参数3，必须，反馈公开域名
	 * @param 参数4，必须，反馈内容
	 */
	function MessageAdd($tid,$open,$domainShow,$content)
	{
		$data['content'] = $content;
		$data['domain'] = $this->domain;
		$data['tid'] = $tid;
		$data['open'] = $open;
		$data['domainshow'] = $domainShow;
		
		return $this->Request(WMSERVER.'/index.php?m=message&c=message&a=add', $data);
	}
	
}
?>