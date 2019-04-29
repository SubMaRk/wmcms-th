<?php
/**
* 用户列表控制器文件
*
* @version        $Id: user.user.list.php 2016年5月5日 17:10  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$configArr = AdminInc('user');
$userSer = AdminNewClass('user.user');
$userMod = NewModel('user.user');

//接受post数据
$name = Request('name');


if( $orderField == '' )
{
	$where['order'] = 'user_id desc';
}

//获取列表条件
$where['table'] = '@user_user';

//判断是否搜索标题
if( $name != '' )
{
	$where['where']['user_name'] = array('like',$name);
}
else
{
	$name = 'โปรดกรอกคำหลัก';
}


//数据条数
$total = wmsql::GetCount($where , 'user_id');

//当前页的数据
$where = array_merge($where , GetListWhere($where));
$where['left']['@user_level'] = 'user_exp>=level_start and user_exp<level_end';
$dataArr = wmsql::GetAll($where);
?>
