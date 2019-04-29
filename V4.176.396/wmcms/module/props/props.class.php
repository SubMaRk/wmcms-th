<?php
/**
* 道具功能模块类文件
*
* @version        $Id: props.class.php 2017年3月17日 18:20  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
class props
{
	static $typeTable = '@props_type';
	static $propsTable = '@props_props';
	
	/**
	* 根据所得到的条件查询数据
	* @param 参数1，字符串，type为列表页数据获取，content为内容页数据获取
	* @param 参数2，传递的sql条件
	* @param 参数3，选填，没有数据的提示字符串
	**/
	static function GetData( $type , $where='' , $errInfo='' )
	{
		$wheresql = self::GetWhere($where);
		//type为列表页数据获取
		switch ($type)
		{
			//content为内容页数据获取
			case 'content':
				$wheresql['table'] = self::$typeTable;
				$wheresql['left'][self::$propsTable] = 'type_id=props_type_id';
				$wheresql['where']['props_status'] = '1';
				break;

			default:
				tpl::ErrInfo( C('system.module.getdata_no' , null , 'lang' ) );
				break;
		}

		$data = wmsql::GetAll($wheresql);

		//如果数组为空并且错误提示不为空则输出错误提示。
		if( !$data && $errInfo != '' )
		{
			tpl::ErrInfo($errInfo);
		}
		return $data;
	}


	/**
	* 获得字符串中的条件sql
	* 返回值字符串
	* @param 参数1：需要查询的字符串。
	**/
	static function GetWhere($where)
	{
		//设置需要替换的字段
		$arr = array(
			'tid' =>'type_id',
			'type_id' =>'type_id',
			'分类' =>'type_id',
			'分类排序' =>'type_order',
			'分类顺序' =>'type_order',
			'分类倒序' =>'type_order desc',
			'父级分类' =>'type_topid',
			'模块' =>'type_module',
			'小说' =>'novel',
	
			'顺序' =>'props_order',
			'道具' =>'props_order desc',
		);
		return tpl::GetWhere($where,$arr);
	}
}
?>