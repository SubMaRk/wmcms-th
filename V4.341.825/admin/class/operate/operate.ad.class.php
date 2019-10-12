<?php
/**
 * 广告的类文件
 *
 * @version        $Id: operate.ad.class.php 2016年5月7日 14:00  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class OperateAd
{
	public $table = '@ad_ad';
	public $filePath = '../files/ajs/';
	

	/**
	 * 获取搜索的类型
	 * @param 参数1，选填，获取搜索的类型
	 */
	function GetStatus( $k = '' )
	{
		$arr = array(
			'1'=>'แสดง',
			'0'=>'ซ่อน',
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

	
	/**
	 * 获取广告类型
	 * @param 参数1，选填，指定的广告
	 */
	function GetType( $k = '' )
	{
		$arr = array(
			'1'=>'ข้อความโฆษณา',
			'2'=>'รูปภาพโฆษณา',
			'3'=>'JS โฆษณา',
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
	
	
	/**
	 * 获取广告类型
	 * @param 参数1，选填，指定的广告
	 */
	function GetPt( $k = '' )
	{
		$arr = array(
			'4'=>'คอมพิวเตอร์',
			'3'=>'รุ่นสัมผัส',
			'2'=>'รุ่น 3G',
			'1'=>'มือถือ',
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
	
	
	/**
	 * 创建广告js文件
	 * @param 参数1，必须，数组
	 */
	function CreateAdFile( $data )
	{
		//如果是js广告就生成一个js广告文件
		$file = $this->filePath.$data['ad_id'].'.js';
		//文字广告
		if( $data['ad_type'] == '1' )
		{
			$content = "document.write(\"<a target='_blank' href='{$data['ad_url']}'>{$data['ad_name']}</a>\");";
		}
		//图片广告
		else if( $data['ad_type'] == '2' )
		{
			$content = "document.write(\"<a target='_blank' href='{$data['ad_url']}'><img height='{$data['ad_img_height']}' width='{$data['ad_img_width']}' src='{$data['ad_img']}' alt='{$data['ad_name']}' /></a>\");";
		}
		//js广告
		else if( $data['ad_type'] == '3' )
		{
			$content = str::Escape($data['ad_js']);
		}
		//如果是限制时间的广告
		if( $data['ad_time_type'] == '1')
		{
			$content = 'var startTime='.$data['ad_start_time'].';var endTime='.$data['ad_end_time'].';var nowTime= Date.parse(new Date())/1000;if( nowTime<startTime){document.write("ขออภัย! โฆษณานี้ยังไม่เปิดให้เข้าชมในตอนนี้");}else if( endTime<nowTime ){document.write("ขออภัย! โฆษณานี้หมดอายุและหยุดการแสดงแล้ว");}else{'.$content.'}';
		}
		file::CreateFile($file, str::Escape($content) , '1');
	}
	
	
	/**
	 * 删除广告文件
	 */
	function DelAdFile( $ids )
	{
		if( is_array($ids) )
		{
			$ids = $ids[1];
		}
		$idArr = explode(',' , $ids);
		foreach ($idArr as $k=>$v)
		{
			file::DelFile($this->filePath.$v.'.js');
		}
	}
	
	/**
	 * 删除广告文件夹
	 */
	function DelAdDir()
	{
		file::DelDir($this->filePath);
	}
}
?>