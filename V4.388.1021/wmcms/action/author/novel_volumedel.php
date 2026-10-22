<?php
/**
* 删除分卷操作处理
*
* @version        $Id: novel_volumedel.php 2017年1月7日 15:15  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$vid = str::Int( Request('vid') , $lang['author']['novel_vid_err'] );
$nid = str::Int( Request('nid') , $lang['author']['novel_nid_err'] );
if( $vid == 1 )
{
	ReturnData( $lang['author']['novel_vid_err'] , $ajax);
}

$authorMod = NewModel('author.author');
$volumeMod = NewModel('novel.volume');
$chapterMod = NewModel('novel.chapter');

//是否是作者
$author = $authorMod->CheckAuthor($lang['user']['no_login'] , $lang['author']['author_no'] , $ajax);


//设置消息的条件,查询这条数据是否存在
$where['novel_id'] = $nid;
$where['volume_id'] = $vid;
$where['author_id'] = $author['author_id'];
$volumeData = $volumeMod->GetOne($where);
//数据不存在
if( !$volumeData )
{
	ReturnData( $lang['author']['volume_nid_err'] , $ajax);
}
//当前分卷存在数据不能删除
else if( $chapterMod->GetCount(array('chapter_vid'=>$vid,'chapter_nid'=>$nid)) > 0 )
{
	ReturnData( $lang['author']['volume_chapter_exist'] , $ajax);
}
else
{
	//删除一条数据
	$result = $volumeMod->Delete($vid);
	
	if( $result )
	{
		ReturnData( $lang['author']['operate']['novel_volume_del']['success'] , $ajax , 200);
	}
	else
	{
		ReturnData( $lang['author']['operate']['novel_volume_del']['fail'] , $ajax);
	}
}
?>