<?php
/**
* 留言 处理器
*
* @version        $Id: operate.message.php 2016年5月7日 17:24  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@message_message';


//删除数据
if ( $type == 'del' )
{
	$where['message_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบข้อความ' , 'message' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
		
	Ajax('ลบข้อความสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างข้อความ' , 'message' , 'delete');
	Ajax('ล้างข้อความสำเร็จ');
}
//审核数据
else if ( $type == 'status' )
{
	$data['message_status'] = Request('status');
	$where['message_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ตรวจสอบ';
	}
	else
	{
		$msg = 'ละทิ้ง';
	}
	//写入操作记录
	SetOpLog( $msg.'ข้อความ' , 'message' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('ข้อความถูก'.$msg.'แล้ว!');
}
?>