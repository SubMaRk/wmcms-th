<?php
/**
* 申请数据详情控制器文件
*
* @version        $Id: system.apply.detail.php 2017年1月21日 15:58  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$module = Request('module');
$mt = Request('type');
$id = Request('id');
$data = '';
if( $module == '' || $mt == '' || $t == '' || !str::Number($id) )
{
	Ajax('对不起，参数错误',300);
}
else
{
	$applyMod = NewModel('system.apply');
	$where['apply_module'] = $module;
	$where['apply_type'] = $mt;
	$where['apply_id'] = $id;
	$applyData = $applyMod->GetOne($where);
	$newData = @unserialize($applyData['apply_option']);

	//如果存在新的数据
	if( $newData )
	{
		//获得旧的数据、小说
		if( $module == 'author' && $mt == 'novel_editnovel')
		{
			$novelMod = NewModel('novel.novel');
			$oldData = $novelMod->GetOne($applyData['apply_cid']);
			//获得语言包
			$lang = GetModuleLang('novel');
			//设置字段的名字
			$keyTitle=array(
				'novel_process'=>'书籍进程','novel_type'=>'小说类型','type_id'=>'小说分类','novel_info'=>'小说描述',
				'novel_name'=>'小说名字','novel_pinyin'=>'小说拼音','novel_author'=>'作者笔名','author_id'=>'作者id',
				'novel_createtime'=>'创建时间','novel_uptime'=>'更新时间','novel_tags'=>'小说标签','novel_status'=>'小说状态',
			);
		}
		else if($module == 'author' && $mt == 'novel_editchapter')
		{
			unset($newData['type']);
			$chapterMod = NewModel('novel.chapter');
			$oldData = $chapterMod->GetById($applyData['apply_cid']);
			unset($newData['chapter_istxt']);
			unset($newData['chapter_status']);
			if( $oldData['is_content'] == false )
			{
				$oldData['content'] = '';
			}
			//获得语言包
			$lang = GetModuleLang('novel');
			//设置字段的名字
			$keyTitle=array(
				'chapter_number'=>'章节字数','chapter_name'=>'章节标题','content'=>'章节内容',
				'chapter_ispay'=>'是否需要购买','chapter_nid'=>'书籍id','chapter_vid'=>'分卷id','chapter_cid'=>'章节id',
				'chapter_order'=>'章节排序','chapter_time'=>'创建时间',
			);
		}
		//获得旧的数据、文章
		else if( $module == 'author' && $mt == 'article_editarticle')
		{
			$articleMod = NewModel('article.article');
			$typeMod = NewModel('article.type');
			$oldData = $articleMod->GetOne($applyData['apply_cid']);
			//获得语言包
			$lang = GetModuleLang('novel');
			//设置字段的名字
			$keyTitle=array(
				'article_simg'=>'文章封面','article_name'=>'文章标题','article_cname'=>'文章短标题','type_id'=>'文章分类',
				'article_source'=>'文章来源','article_tags'=>'文章标签','article_info'=>'文章简介','article_content'=>'文章内容',
			);
		}
		
		foreach ($newData as $k=>$v)
		{
			$data[$k]['title'] = $keyTitle[$k];
			$data[$k]['old'] = $oldData[$k];
			$data[$k]['new'] = $v;
			
			//小说字段处理
			if( $module == 'author' && $mt == 'novel_editnovel')
			{
				switch ($k)
				{
					case 'novel_process':
						$data[$k]['old'] = $lang['novel']['par']['novel_process_'.$oldData[$k]];
						$data[$k]['new'] = $lang['novel']['par']['novel_process_'.$v];
						break;
					case 'novel_type':
						$data[$k]['old'] = $lang['novel']['par']['novel_type_'.$oldData[$k]];
						$data[$k]['new'] = $lang['novel']['par']['novel_type_'.$v];
						break;
					case 'type_id':
						$data[$k]['old'] = $oldData['type_name'];
						$data[$k]['new'] = $newData['type_name'];
						break;
					case 'novel_createtime':
						$data[$k]['old'] = date("Y-m-d H:i",$oldData['novel_createtime']);
						$data[$k]['new'] = date("Y-m-d H:i",$newData['novel_createtime']);
						break;
					case 'novel_uptime':
						$data[$k]['old'] = date("Y-m-d H:i",$oldData['novel_uptime']);
						$data[$k]['new'] = date("Y-m-d H:i",$newData['novel_uptime']);
						break;
					case 'novel_status':
						$data[$k]['old'] = $lang['novel']['par']['novel_status_'.$oldData[$k]];
						$data[$k]['new'] = $lang['novel']['par']['novel_status_'.$v];
						break;
						
				}
				unset($data['type_name']);
			}
			//章节字段处理
			if( $module == 'author' && $mt == 'novel_editchapter')
			{
				switch ($k)
				{
					case 'chapter_ispay':
						$data[$k]['old'] = $lang['novel']['par']['chapter_type_'.$oldData[$k]];
						$data[$k]['new'] = $lang['novel']['par']['chapter_type_'.$v];
						break;
					case 'chapter_time':
						$data[$k]['old'] = date("Y-m-d H:i",$oldData['chapter_time']);
						$data[$k]['new'] = date("Y-m-d H:i",$newData['chapter_time']);
						break;
						
				}
			}
			//文章字段处理
			if( $module == 'author' && $mt == 'article_edit')
			{
				switch ($k)
				{
					case 'type_id':
						$typeData = $typeMod->GetById($newData['type_id']);
						$data[$k]['old'] = $oldData['type_name'];
						$data[$k]['new'] = $typeData['type_name'];
						break;
				}
			}
		}
	}
}
?>