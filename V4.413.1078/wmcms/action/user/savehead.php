<?php
/**
* 保存用户头像请求处理
*
* @version        $Id: savehead.php 2015年8月15日 10:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime 		  2016年5月28日 14:37  weimeng
*
*/
//是否登录了
str::EQ( user::GetUid() , 0 , $lang['user']['no_login'] );
//头像不能为空
$src = str::IsEmpty( str::DelHtml(Post('src')) , $lang['user']['head_no']);
if( !str::IsImg($src) )
{
	ReturnData($lang['user']['head_no'],$ajax,500);
}
$userMod->head = $src;
$result = $userMod->SaveHead();

ReturnData( $lang['user']['operate']['savehead']['success'] , $ajax , 200);
?>