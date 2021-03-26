<?php
/**
* 微信自动回复处理器
*
* @version        $Id: operate.weixin.autoreply.php 2019年03月09日 15:34  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$platformSer = NewClass('weixin_platform');
$replyMod = NewModel('operate.weixin_autoreply');
$table = '@weixin_reply';

//编辑自动回复信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['autoreply'], 'e' );
	$where = $post['id'];
	
	if ( $data['autoreply_name'] == '' || $data['autoreply_key'] == '' || $data['autoreply_content'] == '')
	{
		Ajax('ขออภัย! ต้องกรอกชื่อบ็อทโต้ตอบ คำหลักที่ตรงกัน และการตอบสนองก่อน',300);
	}
	else if( !str::Number(GetKey($data,'autoreply_account_id')) )
	{
		Ajax('ขออภัย! ต้องเลือกหมายเลขสาธารณะก่อน',300);
	}
	else if( $data['autoreply_default'] > 0 && $replyMod->CheckExists(array(
			'autoreply_account_id'=>$data['autoreply_account_id'],
			'autoreply_default'=>$data['autoreply_default']
			) , $where['autoreply_id']) )
	{
		Ajax('ขออภัย! บ็อทโต้ตอบสามารถกำหนดกับหมายเลขสาธารณะเพียงหมายเลขเดียวเท่านั้น หากคุณต้องการแทนที่ โปรดยกเลิกการตั้งค่าปัจจุบันก่อน',300);
	}
	
	//获取模版内容
	if( $data['autoreply_type'] == 'text' )
	{
		$tempData = $data['autoreply_content'];
	}
	else
	{
		$tempData = $data['autoreply_media_id'];
	}
	$data['autoreply_temp'] = $platformSer->ResponseGetTemp($data['autoreply_type'],$tempData);
	//新增数据
	if( $type == 'add' )
	{
		$opType = 'insert';
		$info = 'เพิ่มบ็อทโต้ตอบ'.$data['autoreply_name'];
		$where['autoreply_id'] = $replyMod->Insert($data);
	}
	//修改分类
	else
	{
		$opType = 'update';
		$info = 'แก้ไขบ็อทโต้ตอบ'.$data['autoreply_name'];
		$replyMod->Update($data,$where['autoreply_id']);
	}
	//写入操作记录
	SetOpLog( $info, 'system' , $opType , $table , $where , $data );
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['autoreply_id'] = GetDelId();
	$replyMod->Del($where);
	//写入操作记录
	SetOpLog( 'ลบบ็อทโต้ตอบ' , 'system' , 'delete' , $table , $where);
	Ajax('ลบบ็อทโต้ตอบสำเร็จ!');
}
//复制
else if ( $type == 'copy' )
{
	$rid = Request('rid/i');
	$aid = Request('aid/i');
	$data = $replyMod->GetById($rid);
	if( $data  && $data['autoreply_type'] != '1' )
	{
		Ajax('ไม่สามารถคัดลอกคำตอบที่ไม่ใช่ข้อความได้!',300);
	}
	else if( $data )
	{
		$saveData['autoreply_status'] = $data['autoreply_status'];
		$saveData['autoreply_account_id'] = $aid;
		$saveData['autoreply_name'] = 'คัดลอก - '.$data['autoreply_name'];
		$saveData['autoreply_key'] = $data['autoreply_key'];
		$saveData['autoreply_match'] = $data['autoreply_match'];
		$saveData['autoreply_content'] = $data['autoreply_content'];
		$saveData['autoreply_type'] = $data['autoreply_type'];
		$where['autoreply_id'] = $replyMod->Insert($saveData);
		SetOpLog( 'คัดลอกบ็อท' , 'system' , 'insert' , $table , $where);
	}
	Ajax('คัดลอกบ็อทสำเร็จ!');
}
?>