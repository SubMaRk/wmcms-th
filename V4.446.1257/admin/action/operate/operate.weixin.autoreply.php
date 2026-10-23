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
$table = '@weixin_autoreply';

//编辑自动回复信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['autoreply'], 'e' );
	$where = $post['id'];
	
	if ( $data['autoreply_name'] == '' || $data['autoreply_key'] == '' || $data['autoreply_content'] == '')
	{
		Ajax('ต้องกรอกชื่อการตอบกลับอัตโนมัติ คำสำคัญที่ใช้จับคู่ และเนื้อหาการตอบกลับ!',300);
	}
	else if( !str::Number(GetKey($data,'autoreply_account_id')) )
	{
		Ajax('ต้องเลือกบัญชีทางการที่สังกัด!',300);
	}
	else if( $data['autoreply_default'] > 0 && $replyMod->CheckExists(array(
			'autoreply_account_id'=>$data['autoreply_account_id'],
			'autoreply_default'=>$data['autoreply_default']
			) , $where['autoreply_id']) )
	{
		Ajax('บัญชีทางการเดียวกันมีการตอบกลับอัตโนมัติหรือการตอบกลับค่าเริ่มต้นได้เพียงอย่างเดียว หากต้องการเปลี่ยนกรุณายกเลิกการตั้งค่าปัจจุบันก่อน!',300);
	}
	
	//获取模版内容
	if( $data['autoreply_type'] == 'image' )
	{
		$tempData = $data['autoreply_media_id'];
	}
	else
	{
		$tempData = $post['autoreply']['autoreply_content'];
	}
	$data['autoreply_temp'] = $platformSer->ResponseGetTemp($data['autoreply_type'],$tempData);
	//新增数据
	if( $type == 'add' )
	{
		$opType = 'insert';
		$info = '新增了自动回复'.$data['autoreply_name'];
		$where['autoreply_id'] = $replyMod->Insert($data);
	}
	//修改分类
	else
	{
		$opType = 'update';
		$info = '修改了自动回复'.$data['autoreply_name'];
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
	SetOpLog( '删除了自动回复' , 'system' , 'delete' , $table , $where);
	Ajax('ลบการตอบกลับอัตโนมัติสำเร็จ!');
}
//复制
else if ( $type == 'copy' )
{
	$rid = Request('rid/i');
	$aid = Request('aid/i');
	$data = $replyMod->GetById($rid);
	if( $data  && $data['autoreply_type'] == 'image' )
	{
		Ajax('ไม่สามารถคัดลอกการตอบกลับที่ไม่ใช่ข้อความ!',300);
	}
	else if( $data )
	{
		$saveData['autoreply_status'] = $data['autoreply_status'];
		$saveData['autoreply_account_id'] = $aid;
		$saveData['autoreply_name'] = '复制-'.$data['autoreply_name'];
		$saveData['autoreply_key'] = $data['autoreply_key'];
		$saveData['autoreply_match'] = $data['autoreply_match'];
		$saveData['autoreply_content'] = $data['autoreply_content'];
		$saveData['autoreply_type'] = $data['autoreply_type'];
		$saveData['autoreply_temp'] = $data['autoreply_temp'];
		$where['autoreply_id'] = $replyMod->Insert($saveData);
		SetOpLog( '复制了自动回复' , 'system' , 'insert' , $table , $where);
	}
	Ajax('คัดลอกการตอบกลับอัตโนมัติสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['autoreply_status'] = Request('status');
	$where['autoreply_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = '通过审核';
	}
	else
	{
		$msg = '取消审核';
	}
	//写入操作记录
	SetOpLog( $msg.'了自动回复' , 'system' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('ตอบกลับอัตโนมัติ'.$msg.'สำเร็จ!');
}
?>