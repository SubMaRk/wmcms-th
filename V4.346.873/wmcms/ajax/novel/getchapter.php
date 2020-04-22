<?php
/**
* 获得小说的章节的信息
*
* @version        $Id: getchapter.php 2016年12月31日 22:00  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cid = Request('cid');
$istxt = Request('istxt' , 0);
$code = 500;
$data = array();
$chapterMod = NewModel('novel.chapter');
$authorMod = NewModel('author.author');
$applyMod = NewModel('system.apply');


//根据小说父级分类查询
if( $cid > 0 )
{
	$code = 200;
	$data = $chapterMod->GetById( str::Int($cid) );
	if( !$data )
	{
		$code = 201;
	}
	else
	{
		$novelLang = GetModuleLang('novel');
		$data['chapter_type'] = $novelLang['novel']['par']['chapter_type_'.$data['chapter_ispay']];

		//如果作者存在，并且为自己就
		if( $data['chapter_status'] != 1 && $data['is_content'] == false)
		{
			$author = $authorMod->GetAuthor();
			if( $author )
			{
				$where['apply_module'] = 'author';
				$where['apply_type'] = array('or','novel_editchapter');
				$where['apply_cid'] = $cid;
				$applyData = $applyMod->GetOne($where);
				$applyData = unserialize($applyData['apply_option']);
				$data['content'] = $applyData['content'];
			}
		}
		if( $istxt == 1)
		{
			$data['content'] = str::ToTxt($data['content']);
		}
	}
	$info = $lang['system']['operate']['success'];
}
else
{
	$info = $lang['system']['par']['err'];
}

ReturnData($info , $ajax , $code , $data);
?>