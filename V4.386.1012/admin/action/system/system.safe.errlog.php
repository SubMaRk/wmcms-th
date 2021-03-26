<?php
/**
* 错误日志处理器
*
* @version        $Id: system.safe.errlog.php 2016年4月23日 22:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_errlog';

//删除登录记录
if ( $type == 'del' )
{
	$where['errlog_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบบันทึกข้อผิดพลาด' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบบันทึกข้อผิดพลาดสำเร็จ!');
}
//清空登录记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);
	//写入操作记录
	SetOpLog( 'ล้างบันทึกข้อผิดพลาด' , 'system' , 'delete');
	Ajax('ล้างบันทึกข้อผิดพลาดสำเร็จ!');
}
//处理自动上传设置
else if ( $type == 'autoupload' )
{
	$val = str::CheckElse(Request('val'), 1 , 1, 0);
	
	$where['config_module'] = 'system';
	$where['config_name'] = 'err_auto_upload';
	wmsql::Update( '@config_config' , array('config_value'=>$val) , $where);
	
	//写入操作记录
	SetOpLog( 'แก้ไขการตั้งค่าอัปโหลดบันทึกข้อผิดพลาดอัตโนมัติ' , 'system' , 'update');
	Ajax('แก้ไขการตั้งค่าอัปโหลดบันทึกข้อผิดพลาดอัตโนมัติสำเร็จ!');
}
//上传错误日志
else if ( $type == 'upload' )
{
	$where['table'] = $table;
	$where['where']['errlog_id'] = str::Int(Request('id'));
	$data = wmsql::GetOne($where);
	if( $data && $data['errlog_status'] == '1' )
	{
		Ajax('ขออภัย! บันทึกข้อผิดพลาดถูกอัปโหลดไปแล้ว', 300);
	}
	else if( $data )
	{
		$cloudSer = NewClass('cloud');
		$rs = $cloudSer->ErrlogAdd($data);
		if( $rs['code'] == 200 )
		{
			//修改为已经上传状态
			wmsql::Update($table, array('errlog_status'=>1), array('errlog_id'=>$id));
			Ajax('อัปโหลดบันทึกข้อผิดพลาดสำเร็จ!');
		}
		else
		{
			Ajax($rs['msg'], 300);
		}
	}
	else
	{
		Ajax('ขออภัย! ไม่มีบันทึกข้อผิดพลาดนี้อยู่' , 300);
	}
}
?>