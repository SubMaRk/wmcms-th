<?php
/**
* 文件作用：定义系统常量
*
* @version        $Id: define.config.php 2015年12月2日 14:59  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime 		  2017年8月4日 10:51
*
**/
define('WMROOT', str_ireplace('/wmcms/inc/', '/', WMINC));
$docRoot = str_ireplace($_SERVER['DOCUMENT_ROOT'], '', WMROOT);
if( substr($docRoot, -1) == '/' )
{
	$docRoot = substr($docRoot,0,-1);
}
define('DOCROOT', $docRoot);
define('WMAPI',str_ireplace('/inc/', '/api/', WMINC));
define('WMMODULE',str_ireplace('/wmcms/inc/', '/module/', WMINC));
define('WMSYSMODULE',str_ireplace('/inc/', '/module/', WMINC));
define('WMMODELS',str_ireplace('/inc/', '/models/', WMINC));
define('WMTEMPLATE',str_ireplace('/wmcms/inc/', '/templates/', WMINC));
define('WMPLUGIN',str_ireplace('/wmcms/inc/', '/plugin/', WMINC));
define('WMLANG',str_ireplace('/inc/', '/lang/', WMINC));
define('WMFILE',str_ireplace('/wmcms/inc/', '/files/', WMINC));
define('WMCLASS',str_ireplace('/inc/', '/class/', WMINC));
define('WMDB',str_ireplace('/inc/', '/db/', WMINC));
//专题、单页静态资源路径
define('WMSTATIC',str_ireplace('/wmcms/inc/', '/files/static/', WMINC));
//不使用的module
define('NOTMODULE','about,app,article,author,bbs,diy,down,editor,link,message,picture,replay,search,user,zt');
//版本号、版本类型、发布时间
define('WMVER','4.446.1257');
define('WMVER_TYPE','0');
define('WMVER_TIME','20231230');
//是否允许程序连回官方服务器（版本检查、应用商店、BUG 上报、安装统计）。
//默认关闭：官方通道走 http 明文，会把 appid / apikey / secret 和域名一起发出去。
if( !defined('CLOUD_ENABLE') )
{
	define('CLOUD_ENABLE', false);
}
//是否允许模版里的 {php} 标签执行原生 PHP。
//模版文件等同于服务器上的代码，只有在你确实需要时才打开：
//默认关闭，模版里写了 {php} 也只会按文本显示，不会执行。
if( !defined('TPL_PHP_ALLOW') )
{
	define('TPL_PHP_ALLOW', false);
}
//程序包名
define('WMCMS','WMCMS');
//主域名
define('WMDOMAIN','weimengcms.com');
//论坛
define('WMBBS','http://bbs.'.WMDOMAIN);
//官网
define('WMURL','http://www.'.WMDOMAIN);
//标签中心
define('WMLABEL','http://label.'.WMDOMAIN);
//帮助中心
define('WMHELP','http://help.'.WMDOMAIN);
//程序服务地址
//cloud 通道已移除，用户端只剩这个常量，保留是为了兼容旧插件
define('WMSERVER','http://server.'.WMDOMAIN);
//是否位于可信反向代理之后（启用后才采信 X-Forwarded-For，默认关闭）
define('TRUST_PROXY',false);
//开启运行日志文件记录
define('RUNLOG',true);
//开启debug模式
//只有调试时才打开：打开后页面会显示错误位置、SQL 语句和模版内容
define('DEBUG',false);
//开发者模式
define('DEVELOPER',false);
//错误级别，TRUE为全部报错停止，FALSE为警告提示
define('ERR',false);
//循环标签的前缀
define('L','v.');
//404页面统计
define('NOTFOUND',true);
//500错误页面统计
define('SERVERER',true);
//蜘蛛爬行统计
define('SPIDER',true);
?>