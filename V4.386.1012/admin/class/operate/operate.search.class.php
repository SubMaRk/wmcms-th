<?php
/**
 * 搜索的类文件
 *
 * @version        $Id: operate.search.class.php 2016年5月7日 11:00  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class OperateSearch
{
	public $table = '@search_search';
	
	/**
	 * 获取能设置预设模版的模块
	 */
	function GetModule()
	{
		$arr = GetModuleName();
	
		unset($arr['all']);
		unset($arr['user']);
		unset($arr['message']);
		unset($arr['down']);
		unset($arr['replay']);
		return $arr;
	}
	

	/**
	 * 获取搜索的类型
	 * @param 参数1，选填，获取搜索的类型
	 */
	function GetType( $k = '' )
	{
		$arr = array(
			'0'=>'ค้นหาทั้งหมด',
			'1'=>'ค้นหาจากชื่อ',
			'2'=>'ค้นหาจากผู้เขียน',
			'3'=>'ค้นหาจากป้ายกำกับ',
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