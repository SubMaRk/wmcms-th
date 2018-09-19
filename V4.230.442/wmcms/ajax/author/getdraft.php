<?php
/**
* 获得草稿的信息
*
* @version        $Id: getdraft.php 2017年1月7日 22:40  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$did = str::Int(Request('did'));
$code = 500;
$data = '';

$authorMod = NewModel('author.author');
$draftMod = NewModel('author.draft');

//是否是作者
$author = $authorMod->CheckAuthor($lang['user']['no_login'] , $lang['author']['author_no'] , $ajax);


if( $did == 0 )
{
	$info = $lang['author']['draft_did_err'];;
}
else
{
	$code = 200;
	
	$where['draft_id'] = $did;
	$where['draft_author_id'] = $author['author_id'];
	$data = $draftMod->GetOne($where);
	if( !$data )
	{
		$code = 201;
	}
	else
	{
		$data['draft_option'] = unserialize($data['draft_option']);
	}
	$info = $lang['system']['operate']['success'];
}

ReturnData($info , $ajax , $code , $data);
?>