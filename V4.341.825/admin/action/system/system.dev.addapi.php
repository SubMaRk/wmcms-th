<?php
/**
* 新增api接口配置处理器
*
* @version        $Id: system.dev.addapi.php 2018年9月10日 21:48  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//如果请求信息存在
if( $type == 'add'  )
{
	$data = $post['data'];
	$base = $post['base'];
	$option = $post['option'];
	
	if( $data['api_title'] == '' || $data['api_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อและคำหลักของ API ก่อน',300);
	}
	else
	{
		if( !empty($option['name'][0]) )
		{
			print_r($option['name']);
			$optionArr = array();
			foreach ($option['name'] as $k=>$v)
			{
				$optionArr[$v] = array(
					'title'=>$option['title'][$k],
					'value'=>$option['value'][$k],
					'info'=>$option['info'][$k],
				);
			}
			print_r($optionArr);
			$optionStr = serialize($optionArr);
		}
		else 
		{
			$optionStr = '';
		}
		$data['api_base'] = serialize($base);
		$data['api_option'] = $optionStr;
		
		wmsql::Insert('@api_api', $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่ม API'.$data['api_title'], 'system' , 'insert' );
		Ajax('เพิ่ม API สำเร็จ!');
	}
	
}
?>