<?php
/**
* AJAX请求处理分解控制器
*
* @version        $Id: index.php 2016年6月15日 16:29  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime         2016年11月17日 21:27 weimeng
*
*/
//载入基本类文件
$C['module']['inc']['class'] = array('str','page','file');
$C['module']['inc']['module'] = array('user');

//引入公共文件
$siteCache = false;
require_once '../inc/common.inc.php';

//接受参数
$ajax = C('page.ajax' , 'yes');
//ajax的模版文件夹
$mark = Request('mark' , C('ua.mark'));
$action = str::IsEmpty( Request('action') , $lang['system']['action']['no_action'] );

//对方法参数进行分割，判断
$aArr = explode('.',$action);
if( count($aArr) > 1 )
{
	$action = strtr($aArr[0],array('/'=>'','.'=>'',':'=>''));
	$type = strtr($aArr[1],array('/'=>'','.'=>'',':'=>''));
	
	$file = $aArr[0].'/'.$aArr[1];
	$langPath = $aArr[0].'/lang/'.$C['config']['web']['lang'].'/system.php';
	if( file_exists($file.'.php') )
	{
		//设置ajax的模版文件夹
		C('ua.path','ajax/'.GetPtMark(C('ua.pt_int')));
		//语言包
		if(file_exists($langPath))
		{
			require_once $langPath;
		}
		require_once $file.'.php';
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