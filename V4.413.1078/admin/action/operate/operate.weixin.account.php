<?php
/**
* 微信公众号处理器
*
* @version        $Id: operate.weixin.account.php 2019年03月09日 11:22  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$platformSer = NewClass('weixin_platform');
$accountMod = NewModel('operate.weixin_account');
$table = '@weixin_account';

//编辑公众号信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['account'], 'e' );
	$where = $post['id'];
	
	if ( $data['account_name'] == '' || $data['account_account'] == '' || $data['account_gid'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อสาธารณะ หมายเลขบัญชี และไอดีเดิมก่อน',300);
	}
	else if( !str::Number(GetKey($data,'account_type')) || !str::Number(GetKey($data,'account_auth')) 
		|| !str::Number(GetKey($data,'account_main')) || !str::Number(GetKey($data,'account_follow')))
	{
		Ajax('ขออภัย! ต้องเลือกรูปแบบหมายเลขสาธารณะ ประเภทการยืนยัน และการกำหนดเป็นหมายเลขหลักก่อน',300);
	}
	else if( $accountMod->CheckExists(array(
			'account_name'=>$data['account_name'],
			'account_type'=>$data['account_type']
			) , $where['account_id']) )
	{
		Ajax('ขออภัย! มีหมายเลขสาธารณะนี้อยู่แล้ว',300);
	}
	
	//获取模版内容
	$data['account_welcome_temp'] = $platformSer->ResponseGetTemp('text',$data['account_welcome']);
	$data['account_default_temp'] = $platformSer->ResponseGetTemp('text',$data['account_default']);
	
	//新增数据
	if( $type == 'add' )
	{
		$opType = 'insert';
		$info = 'เพิ่มหมายเลขสาธารณะ'.$data['account_name'];
		$where['account_id'] = $accountMod->Insert($data);
	}
	//修改分类
	else
	{
		$opType = 'update';
		$info = 'แก้ไขหมายเลขสาธารณะ'.$data['account_name'];
		$accountMod->Update($data,$where['account_id']);
	}
	//写入操作记录
	SetOpLog( $info, 'system' , $opType , $table , $where , $data );
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['account_id'] = GetDelId();
	$accountMod->Del($where);
	//写入操作记录
	SetOpLog( 'ลบหมายเลขสาธารณะ' , 'system' , 'delete' , $table , $where);
	Ajax('ลบหมายเลขสาธารณะสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$msg = 'ซ่อน';
	$where['account_id'] = GetDelId();
	$data['account_status'] = Request('status/i');
	if( Request('status') == '1')
	{
		$msg = 'แสดง';
	}
	$accountMod->Update($data,$where['account_id']);
	//写入操作记录
	SetOpLog( $msg.'หมายเลขสาธารณะ' , 'system' , 'update' , $table , $where);
	Ajax('หมายเลขสาธารณะถูก'.$msg.'แล้ว!');
}
//设为主号
else if ( $type == 'main' )
{
	$id = Request('id/i');
	$where['account_id'] = $id;
	$data['account_main'] = Request('main/i');
	if( $accountMod->GetOne(array('account_main'=>1,'account_id'=>array('!=',$id))) )
	{
		Ajax('ขออภัย! สามารถกำหนดเป็นหมายเลขหลักได้เพียงหนึ่งหมายเลขเท่านั้น หากคุณต้องการกำหนดหมายเลขปัจจุบันเป็นหมายเลขหลัก โปรดยกเลิกหมายเลขหลักก่อนหน้านี้ก่อน',300);
	}
	else
	{
		$accountMod->Update($data,$id);
		//写入操作记录
		SetOpLog( 'กำหนดหหมายเลขสาธารณะหลัก' , 'system' , 'update' , $table , $where);
		Ajax('กำหนด/ยกเลิกหมายเลขสาธารณะหลักสำเร็จ!');
	}
	
}
//接入检查
else if ( $type == 'check' )
{
	Ajax('ตรวจสอบหลังจากก่อนที่อยู่และพารามิเตอร์ในพื้นหลังของหมายเลขสาธารณะโดยอัตโนมัติ!');
}
?>