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
	Ajax('ขออภัย! พารามิเตอร์ไม่ถูกต้อง',300);
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
				'novel_process'=>'ดำเนินการ','novel_type'=>'ประเภท','type_id'=>'หมวดหมู่','novel_info'=>'ข้อมูล',
				'novel_name'=>'ชื่อ','novel_pinyin'=>'พินอิน','novel_author'=>'นามแฝง','author_id'=>'ไอดีนักเขียน',
				'novel_createtime'=>'วันที่สร้าง','novel_uptime'=>'วันที่อัปเดท','novel_tags'=>'ป้ายกำกับ','novel_status'=>'สถานะ',
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
				'chapter_number'=>'จำนวนคำ','chapter_name'=>'ชื่อบท','content'=>'เนื้อหา',
				'chapter_ispay'=>'จำเป็นต้องซื้อ','chapter_nid'=>'ไอดีหนังสือ','chapter_vid'=>'ไอดีเล่ม','chapter_cid'=>'ไอดีบท',
				'chapter_order'=>'ลำดับ','chapter_time'=>'วันที่สร้าง',
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
				'article_simg'=>'ปก','article_name'=>'ชื่อ','article_cname'=>'ชื่อย่อ','type_id'=>'หมวดหมู่',
				'article_source'=>'แหล่งที่มา','article_tags'=>'ป้ายกำกับ','article_info'=>'สรุปย่อ','article_content'=>'เนื้อหา',
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
