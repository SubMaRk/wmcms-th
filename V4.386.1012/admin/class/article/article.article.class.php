<?php
/**
 * 文章的类文件
 *
 * @version        $Id: article.article.class.php 2016年4月19日 14:37  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class ArticleArticle
{
	public $table = '@article_article';
	
	/**
	 * 获得所有文章属性分类
	 */
	function GetAttr()
	{
		$arr = array(
			'rec'=>'แนะนำ',
			'head'=>'พาดหัว',
			'strong'=>'ตัวหนา',
		);
		
		return $arr;
	}
	
	
	/**
	 * 获得所有文章作者和来源分类
	 * @param 参数1，选填，如果k不为空就返回出指定的值
	 */
	function GetAuthor( $k = '')
	{
		$arr = array(
			'a'=>'ผู้เขียน',
			's'=>'แหล่งที่มา',
			'e'=>'แก้ไข',
		);
		
		if( $k != '' )
		{
			return $arr[$k];
		}
		else
		{
			return $arr;
		}
	}
}
?>