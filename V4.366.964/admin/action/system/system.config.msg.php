<?php
/**
* 系统消息模版处理器
*
* @version        $Id: system.config.msg.php 2020年05月28日 11:07  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$msgMod = NewModel('system.msg');
$table = $msgMod->table;

//编辑消息模版
if ( $type == 'edit' || $type == "add"  )
{
	$data = $post['data'];
	$where = Post('id/a');
	
	if( $data['temp_name'] == '' || $data['temp_module'] == '' || $data['temp_key'] == '' || $data['temp_content'] == '' )
	{
		Ajax('ขออภัย! จำเป้นต้องกรอกตัวเลือกทั้งหมด',300);	
	}
	
	//如果是新增
	if ( $type == 'add' )
	{
		if( $msgMod->GetByKey($data['temp_key']) )
		{
			Ajax('ขออภัย! ไอดีเทมเพลตข้อความปัจจุบันไม่มีอยู่',300);	
		}
		//插入记录
		$where['temp_id'] = $msgMod->Insert($data);
		//写入操作记录
		SetOpLog( 'เพิ่มเทมเพลตข้อความ'.$data['temp_name'] , 'system' , 'insert' , $table , $where , $data );
		Ajax('เพิ่มเทมเพลตข้อความแล้ว!');
	}
	//如果是增加页面
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขเทมเพลตข้อความ' , 'system' , 'update' , $table  , $where , $data );
		//修改数据
		$msgMod->Update($data,$where);
		Ajax('แก้ไขเทมเพลตข้อความแล้ว!');
	}
}
//删除消息模版
else if ( $type == 'del' )
{
	$where['temp_id'] = GetDelId();
	$msgMod->Delete($where);
	SetOpLog( 'ลบเทมเพลตข้อความ' , 'system' , 'delete' , $table , $where);
	Ajax('ลบเทมเพลตข้อความแล้ว!');
}
?>