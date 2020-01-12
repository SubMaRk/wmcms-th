<?php
/**
 * 用户的类文件
 *
 * @version        $Id: user.user.class.php 2016年5月5日 15:37  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class UserUser
{
	public $table = '@user_user';
	
	/**
	 * 获得所有文章属性分类
	 */
	function GetDisplay()
	{
		$arr = array(
			'1'=>'ปกติ',
			'0'=>'แบนถาวร',
			'2'=>'แบนชั่วคราว',
		);

		return $arr;
	}
}
?>