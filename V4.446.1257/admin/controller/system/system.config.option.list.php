<?php
/**
* 配置选项列表制器文件
*
* @version        $Id: system.config.option.list.php 2016年4月23日 17:12  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$configSer = AdminNewClass('system.config');

//所有模块分类
$moduleArr = $configSer->GetModule();

//接受post数据
$module = Request('module');
$name = Request('name');


//获取列表条件
//原实现用 group by c.config_id 去重，但 wm_config_config 的主键是联合主键，
//MySQL 5.7.5+ 默认开启的 ONLY_FULL_GROUP_BY 不能确定依赖关系，会直接报 1055。
//这里改用 distinct 去重，对任何 sql_mode 都成立。
$where['field'] = 'distinct c.*,g.group_id,g.group_remark';
$where['table'] = '@config_option as o';
$where['left']['@config_config as c'] = array('inner','o.config_id=c.config_id');
$where['left']['@config_group as g'] = array('left','c.group_id=g.group_id');


if( $orderField == '' )
{
	$where['order'] = 'c.config_id desc';
}

//判断搜索的类型
if( $name != '' )
{
	$where['where']['config_name'] = array('like',array('val'=>$name,'field'=>'config_title'));
}
else
{
	$name = 'ค้นหาชื่อพารามิเตอร์';
}
if( $module != '' )
{
	$where['where']['config_module'] = $module;
}
else
{
	$where['where']['config_module'] = array('lnin',NOTMODULE);
}

//数据条数
//已经改用 distinct，计数也要对应地去重
$total = wmsql::GetCount($where, 'distinct c.config_id');

//当前页的数据
$where = array_merge($where , GetListWhere($where));
$optionArr = wmsql::GetAll($where);
?>