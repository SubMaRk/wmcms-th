<?php
/**
* 小说内容模型
*
* @version        $Id: content.model.php 2019年05月18日 10:56  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class ContentModel
{
	//分类表
	public $chapterTable = '@novel_chapter';
	//内容表
	public $contentTable = '@novel_content';
	
	//构造函数
	public function __construct()
	{
	}
	

	/**
	 * 删除小说的内容数据条数据
	 */
	function Delete($wherePar)
	{
		if( is_array($wherePar) )
		{
			$nid = $wherePar[1];
		}
		else
		{
			$nid = $wherePar;
		}
		//关闭检查子查询，临时允许进行子查询
		wmsql::$checkSql = false;
		
		$whereSql = 'content_id IN (SELECT chapter_cid FROM '.wmsql::CheckTable($this->chapterTable).' WHERE chapter_nid in('.$nid.'))';
		$where['content_id'] = array('string',$whereSql);
		return wmsql::Delete($this->contentTable , $where);
	}
}
?>