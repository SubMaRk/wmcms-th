<?php
/**
* 全系统功能请求处理分解控制器
*
* @version        $Id: index.php 2016年5月23日 15:22  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime         2016年11月17日 21:27 weimeng
*
*/
//载入基本类文件
$C['module']['inc']['class'] = array('str','page','file','img');
$C['module']['inc']['module'] = array('all');

//引入公共文件
$siteCache = false;
require_once '../inc/common.inc.php';

//接受参数
$ajax = str::IsTrue( Request('ajax') , 'yes' , 'page.ajax');
$action = str::IsEmpty( Request('action') , $lang['system']['action']['no_action'] );

/**
 * 获得提示信息的数组
 * @param 参数1，提示数组
 * @param 参数2，url名
 * @param 参数3，url的参数替换
 */
function GetInfo($infoArr , $urlName = '', $urlPar = '')
{
	$url = tpl::Url($urlName , $urlPar);
	$info['info'] = $infoArr['success'];
	$info['gourl'] = $url;
	$info['html'] = tpl::Rep(array('url'=>$url) , $infoArr['html']);
	return $info;
}


//对方法参数进行分割，判断
$aArr = explode('.',$action);
if( count($aArr) > 1 )
{
	if( file_exists($aArr[0].'/index.php') )
	{
		//引入方法文件
		$action = $aArr[0];
		$type = $aArr[1];
		if( @$aArr[2] != '' )
		{
			$type .= '.'.$aArr[2];
		}
		//语言包
		$langPath = $action.'/lang/'.$C['config']['web']['lang'].'/system.php';
		if( file_exists($langPath) )
		{
			require_once $langPath;
		}
		require_once $action.'/index.php';
	}
	//方法文件不存在
	else
	{
		tpl::ErrInfo($lang['system']['action']['no_file']);
	}
}
//方法参数错误
else
{
	tpl::ErrInfo($lang['system']['action']['no_action']);
}
?>