<?php
/**
* 邮件配置处理器
*
* @version        $Id: system.email.email.php 2017年6月26日 16:19  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_email';
$emailMod = NewModel('system.email');

//修改配置信息
if ( $type == 'edit' || $type == "add" )
{
	$data = str::Escape($post['data'] , 'e');
	$where['email_id'] = Request('email_id');
	
	if( $data['email_smtp'] == 'smtp.qq.com' )
	{
		Ajax('ขออภัย! บริการอีเมล์ QQ ส่วนตัว (smtp.qq.com) ไม่สามารถใช้งานได้ โปรดใช้บริการ QQ สำหรับองค์กร, NetEase หรือผู้ให้บริการอีเมล์อื่น',300);
	}

	//密码加密判断处理
	if ( str_replace('*','',$data['email_psw']) == '' )
	{
		unset($data['email_psw']);
	}
	else
	{
		$data['email_psw'] = str::Encrypt( $data['email_psw'] , 'E', C('config.api.system.api_apikey') );
	}
	//如果是新增
	if ( $type == 'add' )
	{
		//插入记录
		$where['email_id'] = $emailMod->EmailInsert($data);
		//写入操作记录
		SetOpLog( 'เพิ่มบริการอีเมล์' , 'system' , 'insert' , $table , $where , $data );
		Ajax('เพิ่มบริการอีเมล์สำเร็จ!');
	}
	//如果是增加页面
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขบริการอีเมล์' , 'system' , 'update' , $table  , $where , $data );
		//修改数据
		$emailMod->EmailUpdate($data,$where);
		Ajax('แก้ไขบริการอีเมล์สำเร็จ!');
	}
}
//删除邮件服务
else if ( $type == 'del' )
{
	$where['email_id'] = GetDelId();
	$emailMod->EmailDel($where);
	//写入操作记录
	SetOpLog( 'ลบบริการอีเมล์' , 'system' , 'delete' , $table , $where);
	Ajax('ลบบริการอีเมล์สำเร็จ!');
}
//使用禁用邮件服务
else if ( $type == 'status' )
{
	$data['email_status'] = Request('status');
	$where['email_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ใช้งาน';
	}
	else
	{
		$msg = 'เลิกใช้';
	}
	$emailMod->EmailUpdate($data,$where);
	
	//写入操作记录
	SetOpLog( 'บริการอีเมล์'.$msg , 'system' , 'update' , $table , $where);
	Ajax('บริการอีเมล์'.$msg'แล้ว');
}
//发送测试邮件
else if ( $type == 'test' )
{
	$data = $emailMod->EmailGetOne(Request('id'));
	if( $data )
	{
		$return = $emailMod->SendMail($data['email_name'],'admin','test',null,true);
		
		//写入操作记录
		SetOpLog( 'ส่งอีเมล์ทดสอบ' , 'system' , 'update' );
		
		if ( $return === true )
		{
			Ajax('ส่งอีเมล์สำเร็จ! โปรดไปที่ก่อลข้อความเพื่อดูรายละเอียด');
		}
		else
		{
			Ajax('ทดสอบส่งอีเมล์ล้มเหลว!'.$return,300);
		}
	}
	else
	{
		Ajax('ขออภัย! ไม่มีการกำหนดค่าอีเมล์นี้อยู่',300);
	}
}
?>