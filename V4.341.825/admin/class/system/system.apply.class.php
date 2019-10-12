<?php
/**
 * 申请请求处理操作
 *
 * @version        $Id: system.apply.class.php 2017年4月15日 11:24  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class SystemApply
{
	private $authorTable = '@author_author';
	private $novelTable = '@novel_novel';
	private $chapterTable = '@novel_chapter';
	private $articleTable ='@article_article';
	

	/**
	 * 拒绝作者申请回调方法
	 * @param 参数1，必须，uid，用户id
	 * @param 参数2，必须，cid，内容id
	 */
	function applyRefuseCallBack($uid , $cid)
	{
		$data['author_status'] = 2;
		$where['author_id'] = $cid;
		$where['user_id'] = $uid;
		wmsql::Update($this->authorTable, $data, $where);
	
		$result['table'] = $this->authorTable;
		$result['where'] = $where;
		$result['data'] = $data;
		$result['info'] = 'ละทิ้งคำร้องผู้แต่งสำเร็จ!';
		return $result;
	}
	
	
	/**
	 * 拒绝封面申请的回调方法
	 * @param 参数1，必须，uid，用户id
	 * @param 参数2，必须，cid，内容id
	 */
	function novel_coverRefuseCallBack($uid , $cid)
	{
		$novelConfig = GetModuleConfig('novel');
		$data['novel_cover'] = $novelConfig['cover'];
		$where['novel_id'] = $cid;
		wmsql::Update($this->novelTable, $data, $where);
	
		$result['table'] = $this->novelTable;
		$result['where'] = $where;
		$result['data'] = $data;
		$result['info'] = 'ละทิ้งคำร้องปกสำเร็จ!';
		return $result;
	}
	
	
	/**
	 * 拒绝小说申请的回调方法
	 * @param 参数1，必须，uid，用户id
	 * @param 参数2，必须，cid，内容id
	 */
	function novel_editnovelRefuseCallBack($uid , $cid)
	{
		$data['novel_status'] = 2;
		$where['novel_id'] = $cid;
		wmsql::Update($this->novelTable, $data, $where);
	
		$result['table'] = $this->novelTable;
		$result['where'] = $where;
		$result['data'] = $data;
		$result['info'] = 'ละทิ้งคำร้องแก้ไขนิยายสำเร็จ!';
		return $result;
	}
	
	
	/**
	 * 拒绝章节编辑的回调方法
	 * @param 参数1，必须，uid，用户id
	 * @param 参数2，必须，cid，内容id
	 */
	function novel_editchapterRefuseCallBack($uid , $cid)
	{
		$data['chapter_status'] = 2;
		$where['chapter_id'] = $cid;
		wmsql::Update($this->chapterTable, $data, $where);
	
		$result['table'] = $this->chapterTable;
		$result['where'] = $where;
		$result['data'] = $data;
		$result['info'] = 'ละทิ้งคำร้องแก้ไขบทสำเร็จ!';
		return $result;
	}

	
	
	/**
	 * 拒绝文章投稿的回调方法
	 * @param 参数1，必须，uid，用户id
	 * @param 参数2，必须，cid，内容id
	 */
	function article_editarticleRefuseCallBack($uid , $cid)
	{
		$data['article_status'] = 2;
		$where['article_id'] = $cid;
		wmsql::Update($this->articleTable, $data, $where);
	
		$result['table'] = $this->articleTable;
		$result['where'] = $where;
		$result['data'] = $data;
		$result['info'] = 'ละทิ้งคำร้องแก้ไขการส่งบทความสำเร็จ!';
		return $result;
	}
}
?>