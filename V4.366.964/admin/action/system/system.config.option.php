<?php
/**
* 网站配置选项处理器
*
* @version        $Id: system.config.option.php 2016年4月23日 17:18  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@config_option';

//修改网站配置选项
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape($post['data'], 'e');
	$where = Post('id/a');
	
	//如果是新增
	if ( GetKey($where,'option_id') == '' || $type == 'add' )
	{
		if( $data['config_id'] == '' )
		{
			Ajax('ขออภัย! โปรดเลือกการกำหนดค่าของคุณก่อน',300);	
		}
		
		//插入记录
		$where['option_id'] = WMSql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มตัวเลือกการกำหนดค่าเว็บไซต์'.$data['option_title'] , 'system' , 'insert' , $table , $where , $data );
		
		Ajax('เพิ่มตัวเลือกการกำหนดค่าเว็บไซต์สำเร็จ!');
	}
	//如果是增加页面
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขตัวเลือกการกำหนดค่าเว็บไซต์' , 'system' , 'update' , $table  , $where , $data );
		//修改数据
		WMSql::Update($table, $data, $where);
		Ajax('แก้ไขตัวเลือกการกำหนดค่าเว็บไซต์สำเร็จ!');
	}
}
//删除网站配置
else if ( $type == 'del' )
{
	$where['option_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบตัวเลือกการกำหนดค่าเว็บไซต์' , 'system' , 'delete' , $table , $where);

	wmsql::Delete($table, $where);
	
	Ajax('ลบตัวเลือกการกำหนดค่าเว็บไซต์สำเร็จ!');
}
?>