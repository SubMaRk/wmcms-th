<?php
/**
 * 道具的类文件
 *
 * @version        $Id: props.props.class.php 2017年3月6日 20:57  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class PropsProps
{
	/**
	 * 获得消费类型
	 */
	function GetCost($type)
	{
		$arr[1] = 'เงินในเว็บ';
		$arr[2] = 'เงินจริง';
		
		return $arr[$type];
	}
}
?>