<?php
/**
 * 幻灯片的类文件
 *
 * @version        $Id: operate.flash.class.php 2016年5月7日 14:00  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class OperateFlash
{
	public $table = '@flash_flash';
	
	/**
	 * 获取能设置预设模版的模块
	 * @param 参数1，选填，获取模块的键
	 */
	function GetModule( $k = '' )
	{
		$arr = GetModuleName();
		$arr['index'] = '全站首页';
	
		unset($arr['user']);
		unset($arr['all']);
		unset($arr['message']);
		unset($arr['down']);
		unset($arr['replay']);
	
		if( $k != '' )
		{
			return $arr[$k];
		}
		else
		{
			return $arr;
		}
	}
	

	/**
	 * 获取搜索的类型
	 * @param 参数1，选填，获取搜索的类型
	 */
	function GetStatus( $k = '' )
	{
		$arr = array(
			'1'=>'显示',
			'0'=>'隐藏',
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