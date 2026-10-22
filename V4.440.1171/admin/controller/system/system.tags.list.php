<?php
/**
* 内容标签列表
*
* @version        $Id: system.tags.list.php 2022年04月01日 10:26  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$name = Request('name');
list($module,$st) = explode('_', $type);
if($module == '' )
{
	$module = 'novel';
}
$tagsMod = NewModel('system.tags');
//获取列表条件
$where['where']['tags_module'] = $module;
//判断搜索的类型
if( $name != '' )
{
	$where['where']['tags_name'] = array('like',$name);
}
//获取列表条件
if( $orderField == '' )
{
	$where['order'] = 'tags_data desc,tags_id desc';
}
//数据条数
$total = $tagsMod->GetCount($where);
//当前页的数据
$list = $tagsMod->GetAll(GetListWhere($where));
?>