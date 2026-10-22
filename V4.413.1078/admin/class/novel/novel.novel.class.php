<?php
/**
 * 小说的类文件
 *
 * @version        $Id: novel.novel.class.php 2016年4月28日 10:37  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class NovelNovel
{
	public $table = '@novel_novel';
	
	//小说配置
	private $novelConfig;
	//保存路径
	private $novelSave;
	private $chapterSave;
	private $chapterMod;
	
	
	//构造函数
	public function __construct()
	{
		$this->chapterMod = NewModel('novel.chapter');
		
		//获取配置文件
		$this->novelConfig = AdminInc('novel');
		//保存路径
		$this->novelSave = '..'.$this->novelConfig['novel_save'];
		$this->chapterSave = '..'.$this->novelConfig['chapter_save'];
	}
	
	
	/**
	 * 获得所有小说所有推荐属性
	 */
	function GetRec()
	{
		$arr = array(
			'rec_icr'=>'แนะนำที่หน้าหลัก',
			'rec_ibr'=>'แนะนำพิเศษ',
			'rec_ir'=>'แนะนำที่หน้าหลัก',
			'rec_ccr'=>'แนะนำในหน้าหลักหมวดหมู่',
			'rec_cbr'=>'แนะนำในหมวดหมู่พิเศษ',
			'rec_cr'=>'แนะนำในหมวดหมู่',
		);
		
		return $arr;
	}

	
	/**
	 * 删除小说
	 * @param 参数1，必须，分类id
	 * @param 参数2，必须，小说id
	 */
	function DelNovelFile($tid,$nid)
	{
		$novelFile = $this->chapterMod->GetNovelFileName($tid , $nid);
		return file::DelDir($novelFile , 1);
	}
}
?>