<?php
/**
* 新增/编辑小说操作处理
*
* @version        $Id: novel_noveledit.php 2016年12月25日 10:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$novelMod = NewModel('novel.novel');
$chapterMod = NewModel('novel.chapter');
$authorMod = NewModel('author.author');
$tagsMod = NewModel('system.tags');
$applyMod = NewModel('system.apply' , 'author');
$uploadMod = NewModel('upload.upload');
$fieldMod = NewModel('system.field');

//是否是作者
$author = $authorMod->CheckAuthor($lang['user']['no_login'] , $lang['author']['author_no'] , $ajax);

//参数获取
$id = str::Int( Post('id') , null , 0 );
$cover = Post('cover');
$process = str::Int( Post('process') , null , 1 );
$type = str::Int( Post('type') , null , 1 );
$tid = str::Int( Post('tid') , null , 0 );
$name = str::LNC( Post('name') , $lang['author']['novel_name_err'] , '1,20' );
$intro = str::LNC( Post('intro') , $lang['author']['novel_intro_err'] , '20,1000' );

//如果分类为0就提示错误
str::CheckElse($tid, 0 , $lang['author']['novel_tid_err']);
//如果不存在小说分类
$typeMod = NewModel('novel.type');
$typeData = $typeMod->GetById($tid);
if( !$typeData )
{
	ReturnData($lang['author']['novel_type_no']);
}

//封面是否是自动审核
if( $authorConfig['author_novel_uploadcover'] == 0 || $cover == '' )
{
	$cover = C('cover',null,'novelConfig');
}

//检查是否小说重名
if( $novelMod->CheckName($name , $id) > 0 )
{
	ReturnData($lang['author']['novel_novel_exist']);
}

//检查小说拼音是否重名
$pinyinClass = NewClass('pinyin');
$pinyin = $pinyinClass->topy($name);
$pinYinCount = $novelMod->CheckPinYin($pinyin , $id);
if( $pinYinCount > 0 )
{
	$pinyin = $pinyin.$author['author_id'];
}

//默认插入数据
$data['novel_cover'] = $cover;
$data['novel_process'] = $process;
$data['novel_type'] = $type;
$data['type_id'] = $tid;
$data['novel_info'] = $intro;
$data['novel_name'] = $name;
$data['novel_pinyin'] = $pinyin;

//新增小说
if( $id == 0 )
{
	$status = $authorConfig['author_novel_createnovel'];
	$data['author_id'] = $author['author_id'];
	$data['novel_author'] = $author['author_nickname'];
	$data['novel_createtime'] = time();
	$data['novel_uptime'] = time();
	$data['novel_status'] = $authorConfig['author_novel_createnovel'];
	$data['novel_tags'] = $name.','.$author['author_nickname'];
	//插入数据
	$id = $novelMod->Insert($data);
	
	
	//插入小说编辑申请记录
	$data['type_name'] = $typeData['type_name'];
	InserApply($status,$data,$id);

	//修改申请记录id和上传封面的id
	$applyMod->UpdateCid('novel_cover',$id);
	$uploadMod->UpdateCid('author','novel_cover',$id);

	//写入自定义字段
	$fieldMod->SetFieldOption('novel' , $data['type_id'] , $id , Post('field'));
	//标签插入
	$tagsMod->SetTags('novel' , $data['novel_tags']);
	
	ReturnData( $lang['author']['operate']['novel_add_'.$status]['success'] , $ajax , 200);
}
//编辑小说
else
{	
	$where['novel_id'] = $id;
	$where['author_id'] = $author['author_id'];
	$novelData = $novelMod->GetOne($where);
	if( !$novelData )
	{
		ReturnData( $lang['author']['novel_novel_no'] , $ajax);
	}
	else if($novelData['author_id'] != $author['author_id'])
	{
		ReturnData( $lang['author']['novel_noauthor'] , $ajax);
	}
	else
	{
		$status = $authorConfig['author_novel_editnovel'];
		//封面和原始封面一样
		if( $novelData['novel_cover'] == Post('cover') )
		{
			unset($data['novel_cover']);
		}
		
		//是自动审核才直接修改数据
		if( $status == 1 )
		{
			$result = $novelMod->Update($data , $id);
			//修改小说分类移动文件
			if( $result )
			{
				$novelMod->MoveNovelFolder($novelData['type_id'],$data['type_id'],$id);
			}
		}
		else
		{
			$applyLast = $applyMod->GetLastData('novel_editnovel' , $uid , $id);
			if( $applyLast && $applyLast['apply_status'] == 0 )
			{
				ReturnData($lang['author']['novel_apply_no'] , $ajax);
			}
		}
		
		//写入自定义字段
		$fieldMod->SetFieldOption('novel' , $data['type_id'] , $id , Post('field'));
		
		//插入小说编辑申请记录
		$data['type_name'] = $typeData['type_name'];
		InserApply($status,$data,$id);
		
		ReturnData( $lang['author']['operate']['novel_edit_'.$status]['success'] , $ajax , 200);
	}
}

//插入小说编辑申请记录
function InserApply($status,$novelData,$id)
{
	global $lang,$applyMod,$author,$uid;
	
	$data['apply_module'] = 'author';
	$data['apply_type'] = 'novel_editnovel';
	$data['apply_status'] = $status;
	$data['apply_uid'] = $uid;
	$data['apply_cid'] = $id;
	$data['apply_remark'] = $lang['author']['apply_remark_'.$status];
	//需要保存的数据
	unset($novelData['novel_cover']);
	$data['apply_option'] = $novelData;
	//如果是自动审核就插入时间
	if( $data['apply_status'] == '1' )
	{
		$data['apply_updatetime'] = time();
	}
	$applyMod->Insert($data , 0);
}
?>