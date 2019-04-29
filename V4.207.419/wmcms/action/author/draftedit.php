<?php
/**
* 编辑草稿操作处理
*
* @version        $Id: draftedit.php 2017年1月6日 20:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$did = str::Int( Request('did') , $lang['author']['draft_did_err'] );
$cid = str::Int( Request('contentid') , $lang['author']['draft_cid_err'] );
$module = Request('module');
$title = str::IsEmpty( Request('title') , $lang['author']['draft_title_err'] );
$content = str::IsEmpty( Request('content') , $lang['author']['draft_content_err'] );


$authorMod = NewModel('author.author');
$draftMod = NewModel('author.draft');
$novelMod = NewModel('novel.novel');

//是否是作者
$author = $authorMod->CheckAuthor($lang['user']['no_login'] , $lang['author']['author_no'] , $ajax);


//检查模块是否正确
switch ($module)
{
	case "novel":
		$option['vid'] = str::Int( Request('vid') , null , 1 );
		$option['pay'] = str::Int( Request('pay') , null , 0);

		//小说是否存在
		$novelWhere['novel_id'] = $cid;
		$novelWhere['author_id'] = $author['author_id'];
		$novelData = $novelMod->GetOne($novelWhere);
		if( !$novelData )
		{
			ReturnData($lang['system']['content']['no'] , $ajax);
		}
		break;

	case "article":
		$option['tid'] = str::Int( Request('tid') , $lang['author']['article_tid_err']);
		$option['cname'] = Request('cname');
		$option['source'] = Request('source');
		$option['tags'] = Request('tags');
		$option['info'] = Request('info');
		$option['simg'] = Request('simg');
		break;
		
	default:
		ReturnData($lang['system']['par']['module_err'] , $ajax);
		break;
}




//公共数组
$data['draft_title'] = $title;
$data['draft_content'] = $content;
$data['draft_number'] = str::StrLen($content);
$data['draft_option'] = serialize($option);

//新增草稿
if( $did == 0 )
{
	$data['draft_author_id'] = $author['author_id'];
	$data['draft_module'] = $module;
	$data['draft_cid'] = $cid;
	$data['draft_createtime'] = time();
	
	$result = $draftMod->Insert($data);
	if( $result )
	{
		ReturnData( $lang['author']['operate']['draftadd']['success'] , $ajax , 200);
	}
	else
	{
		ReturnData( $lang['author']['operate']['draftadd']['fail'] , $ajax);
	}
}
//编辑草稿
else
{
	//设置消息的条件,查询草稿是否存在
	$draftMod->draftId = $did;
	$draftMod->authorId = $author['author_id'];
	$draftData = $draftMod->GetOne();

	//如果草稿存在
	if ( $draftData )
	{
		//修改数据
		$result = $draftMod->Update($data ,$did);
		if( $result )
		{
			ReturnData( $lang['author']['operate']['draftedit']['success'] , $ajax , 200);
		}
		else
		{
			ReturnData( $lang['author']['operate']['draftedit']['fail'] , $ajax);
		}
	}
	//没有数据
	else
	{
		ReturnData( $lang['author']['draft_no'] , $ajax);
	}

}
?>