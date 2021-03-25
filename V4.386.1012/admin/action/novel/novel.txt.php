<?php
/**
* 小说导入TXT处理器
*
* @version        $Id: novel.txt.php 2019年02月20日 18:05  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$txtMod = NewModel('novel.txt');
$novelSer = AdminNewClass('novel.novel');
$chapterSer = AdminNewClass('novel.chapter');
$novelMod = NewModel('novel.novel');
$chapterMod = NewModel('novel.chapter');

//初始化TXT
if ( $type == 'init' )
{
	$path = Post('path');
	$expType = Post('exp_type');
	$expStr = Post('exp_str');
	if( !file_exists(WMROOT.$path) )
	{
		Ajax('对不起，需要导入的TXT不存在！',300);
	}
	else
	{
		$matches = $txtMod->ExpChapter(WMROOT.$path,'file',$expType,$expStr);
		Ajax('TXT初始化成功!',200,array('count'=>count($matches[0])));
	}
}
//删除TXT
else if ( $type == 'del' )
{
	$path = Post('path');
	if( file::DelFile(WMROOT.$path) == false )
	{
		Ajax('对不起，需要删除的TXT不存在或已被删除！',300);
	}
	else
	{
		Ajax('TXT删除成功!');
	}
}
//导入txt操作
else if ( $type == 'import' )
{
	$path = Post('path');
	$nid = Post('nid');
	$fileName = Post('file_name');
	$expType = Post('exp_type');
	$expStr = Post('exp_str');
	
	if( !file_exists(WMROOT.$path) )
	{
		Ajax('对不起，该TXT已经导入或者文件不存在！',300);
	}
	else
	{
		$matches = $txtMod->ExpChapter(WMROOT.$path,'file',$expType,$expStr);
		
		if( count($matches[0]) < 1 )
		{
			//删除小说
			file::DelFile(WMROOT.$path);
			Ajax('对不起，导入的TXT无法读取章节！',300);
		}
		else
		{
			//取消时间限制
			set_time_limit(0);
			$novelConfig = AdminInc('novel');
			$htmlMod = NewModel('system.html' , array('module'=>$curModule));
			$isTxt = $novelConfig['data_type'];
			//小说书籍信息
			$novelData = $novelMod->GetOne($nid);
			$wordNumber = $novelData['novel_wordnumber'];
			
			//循环匹配到的章节
			foreach ($matches[0] as $k=>$v)
			{
				$contentArr = explode("\n",$v);
				$title = $contentArr[0];
				unset($contentArr[0]);
				$content = implode("\r\n",$contentArr);
				
				$data['chapter_istxt'] = $isTxt;
				$data['chapter_number'] = str::StrLen(str::DelSymbol($content));
				$data['chapter_name'] = $title;
				$data['chapter_nid'] = $nid;
				$data['chapter_time'] = time();
				$data['chapter_order'] = $k+1;
				//插入章节
				$insertId = $chapterMod->Insert($data);
				
				//创建小说文章内容
				$chapterMod->CreateChapter( 'add' , $nid , $insertId , $content);
				//创建HTML
				$htmlMod->CreateContentHtml($insertId);
				//更新小说主txt文件存储地址
				$chapterMod->SaveChapterPath($novelData['type_id'],$nid,$insertId);
	
				//计算累积字数
				$wordNumber += $data['chapter_number'];
				//第一章的id
				if( $k == 0 )
				{
					$firstId = $insertId;
					$firstTitle = $title;
				}
				$lastId = $insertId;
				$lastTitle = $title;
			}
			
			//更新小说字数
			if( $novelData['novel_startcid'] == '0'  )
			{
				$novelUpdate['novel_startcid'] = $firstId;
				$novelUpdate['novel_startcname'] = $firstTitle;
			}
			$novelUpdate['novel_newcid'] = $lastId;
			$novelUpdate['novel_newcname'] = $lastTitle;
			$novelUpdate['novel_chapter'] = array('+',count($matches[0]));
			$novelUpdate['novel_wordnumber'] = array('+',$wordNumber);
			$novelUpdate['novel_uptime'] = time();
			$novelMod->Update($novelUpdate, $nid);
		}
		
		//删除TXT
		file::DelFile(WMROOT.$path);
		//写入操作记录
		SetOpLog( '新增了导入了小说'.$fileName , 'novel' , 'insert');
		Ajax('恭喜您，TXT导入成功！');
	}
}
?>