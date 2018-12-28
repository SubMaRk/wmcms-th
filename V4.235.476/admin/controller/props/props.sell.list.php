<?php
/**
* 道具列表控制器文件
*
* @version        $Id: props.sell.list.php 2017年3月11日 20:36  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$config = GetModuleConfig('user');

//接受post数据
$name = Request('name');

//获取列表条件
$where['table'] = '@props_sell';
$where['left']['@props_props'] = 'props_id=sell_props_id';
$where['left']['@user_user'] = 'user_id=sell_user_id';
$where['left']['@novel_novel'] = 'sell_cid=novel_id';
$where['order'] = 'sell_id desc';

//判断是否搜索道具
if( $name != '' )
{
	$where['where']['props_name'] = array('like',$name);
}
else
{
	$name = '请输入道具关键字';
}


//数据条数
$total = wmsql::GetCount($where);

//当前页的数据
$where = array_merge($where , GetListWhere($where));
$dataArr = wmsql::GetAll($where);

//所有分类
$wheresql['table'] = '@props_type';
$typeArr = wmsql::GetAll($wheresql);
?>