<?php
/**
* 小说推荐列表控制器文件
*
* @version        $Id: novel.novel.rec.php 2016年4月29日 16:38  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//接受post数据
$tid = Request('tid');
$name = Request('name');
$st = Request('st');
$tname = Request('tname');


if( $orderField == '' )
{
	$where['order'] = 'novel_id desc';
}

//获取列表条件
$where['table'] = '@novel_rec';
$where['left']['@novel_novel'] = 'rec_nid=novel_id';

//判断是否搜索标题
if( $name != '' )
{
	switch ($st)
	{
		case '1':
			$where['where']['novel_name'] = array('like',$name);
			break;
			
		case '2':
			$where['where']['novel_author'] = array('like',$name);
			break;
	}
}
else
{
	$name = '请输入搜索关键字';
}
//判断是否搜索分类
if( $tid != '' )
{
	$where['where']['n.type_id'] = $tid;
}


//数据条数
$total = wmsql::GetCount($where , 'rec_id');

//当前页的数据
$where = array_merge($where , GetListWhere($where));
$dataArr = wmsql::GetAll($where);
?>