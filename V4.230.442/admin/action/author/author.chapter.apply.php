<?php
/**
* 章节编辑审核处理器
*
* @version        $Id: author.chpater.apply.php 2017年1月26日 10:56  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_apply';
$applyMod = NewModel('system.apply' ,'author');
$chapterMod = NewModel('novel.chapter');
$novelMod = NewModel('novel.novel');


//删除数据
if ( $type == 'del' )
{
	//配置文件，删除数据方式是否是直接删除
	$where['apply_id'] = GetDelId();
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_editchapter';
	//获得数据
	$data = $applyMod->GetAll($where);
	if( $data )
	{
		//写入操作记录
		SetOpLog( '删除了章节修改申请' , 'system' , 'delete' , $table , $where);
		$applyMod->Delete($where);
	}
	
	Ajax('章节修改申请删除成功!');
}
//清空记录
else if ( $type == 'clear' )
{
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_editchapter';
	$applyMod->Delete($where);
	//写入操作记录
	SetOpLog( '清空了章节申请记录' , 'system' , 'delete');
	Ajax('所有章节申请记录成功清空！');
}
//审核数据
else if ( $type == 'status' )
{
	$status = Request('status');
	if( $status == 0)
	{
		Ajax('对不起，不能变更为未审核状态！');
	}
	else if( $status == 1)
	{
		$novelConfig = GetModuleConfig('novel');
		$authorConfig = GetModuleConfig('author');
		
		$data['apply_status'] = $status;
		$where['apply_id'] = GetDelId();
		$where['apply_module'] = 'author';
		$where['apply_type'] = 'novel_editchapter';
		
		$dataList = $applyMod->GetAll($where);
		if( $dataList )
		{
			$htmlMod = NewModel('system.html' , array('module'=>'novel'));
			foreach ($dataList as $k=>$v)
			{
				if( $v['apply_cid'] > 0 && $v['apply_status'] == 0)
				{
					$lastId = $v['apply_cid'];
					$option = unserialize($v['apply_option']);
					$content = $option['content'];
					$nid = @$option['chapter_nid'];
					$number = $option['chapter_number'];
					$title = $option['chapter_name'];
					$option['chapter_status'] = 1;
					unset($option['content']);
					//获得小说的数据
					$novelData = $novelMod->GetOne($nid);
					
					//获得现有的章节数据
					$chapterData = $chapterMod->GetOne($lastId);
					//现在的章节字数
					$wordNumber = $chapterData['chapter_number'];
					
					//章节是否修改还是编辑
					switch (@$option['type'])
					{
						case 'edit':
							$wordNumber = $chapterData['chapter_number'];
							$st = 'edit';
							break;
							
						default:
							$wordNumber = 0;
							$st = 'add';
							break;
					}
					unset($option['type']);
					
					//修改现在的章节数据
					$chapterMod->Update($option , $lastId);

					//创建小说文章内容
					$chapterMod->CreateChapter( $st , $nid , $lastId , $content);
					//更新小说字数
					$novelMod->UpWordNumber($nid , $novelData['novel_wordnumber'] , $wordNumber , $number);
					//更新小说的最新章节信息
					$novelMod->UpNewChapter($novelData , $lastId,$title);
					//创建HTML
					$htmlMod->CreateContentHtml($v['apply_cid']);
					
					//插入消息和修改申请记录
					$applyMod->HandleApply('novel_editchapter' , $v['apply_uid'] , $v['apply_cid'] , $data['apply_status']);
				}
			}
	
			//写入操作记录
			$msg = '取消审核';
			if( Request('status') == '1')
			{
				$msg = '审核通过';
			}
			SetOpLog( $msg.'了小说修改申请' , 'system' , 'update' , $table , $where);
			Ajax('小说修改申请'.$msg.'成功!');
		}
		else
		{
			Ajax('对不起，小说修改申请不存在！');
		}
	}
}
?>