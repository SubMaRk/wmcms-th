<?php
/**
* 文章信息模型
*
* @version        $Id: article.model.php 2017年2月11日 20:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class ArticleModel
{
	//分类表
	public $typeTable = '@article_type';
	//内容表
	public $articleTable = '@article_article';

	
	/**
	 * 构造函数
	 */
	function __construct(){}
	
	
	/**
	 * 插入小说信息
	 * @param 参数1，必须，条件
	 */
	function Insert( $data )
	{
		return wmsql::Insert($this->articleTable, $data);
	}
	
	/**
	 * 修改小说内容
	 * @param 参数1，必须，修改的内容
	 */
	function Update($data , $whereArr)
	{
		if( !is_array($whereArr) )
		{
			$where['article_id'] = $whereArr;
		}
		else
		{
			$where = $whereArr;
		}

		return wmsql::Update($this->articleTable, $data, $where);
	}
	
	
	/**
	 * 检查小说名字是否存在
	 * @param 参数1，必须，小说的名字
	 * @param 参数2，选填，小说的id
	 */
	function CheckName( $name , $id = '0' )
	{
		$where['article_name'] = $name;
		if( $id > 0 )
		{
			$where['article_id'] = array( '<>' , $id);
		}
		return $this->GetCount($where);
	}
	
	
	/**
	 * 获得数据条数
	 * @param 参数1，必须，查询条件
	 */
	function GetCount($where)
	{
		$wheresql['table'] = $this->articleTable;
		$wheresql['where'] = $where;
		return wmsql::GetCount($wheresql);
	}

	/**
	 * 获得一条数据
	 * @param 参数1，必须，查询条件
	 */
	function GetOne($where)
	{
		$wheresql['table'] = $this->articleTable.' as n';
		$wheresql['left'][$this->typeTable.' as t'] = 'n.type_id=t.type_id';
		if( is_array($where) )
		{
			$wheresql['where'] = $where;
		}
		else
		{
			$wheresql['where']['article_id'] = $where;
		}
		return wmsql::GetOne($wheresql);
	}
	

	/**
	 * 替换文章内容
	 * @param 参数1，必须，内容
	 * @param 参数3，必须，文章id
	 */
	function RepContent($content , $cid)
	{
		$downMod = NewModel('down.down');
		return $downMod->RepContent('editor','article',$content , $cid);
	}
}
?>