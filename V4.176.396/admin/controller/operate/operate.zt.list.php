<?php
/**
* 专题页面列表控制器文件
*
* @version        $Id: operate.zt.list.php 2016年5月9日 22:12  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$ztSer = AdminNewClass('operate.zt');

//接受post数据
$name = Request('name');

if( $orderField == '' )
{
	$where['order'] = 'zt_id desc';
}

//获取列表条件
$where['table'] = '@zt_zt';

//判断是否搜索标题
if( $name != '' )
{
	$where['where']['zt_name'] = array('like',$name);
}


//数据条数
$total = wmsql::GetCount($where , 'zt_id');

//当前页的数据
$where = GetListWhere($where);
$dataArr = wmsql::GetAll($where);
?>