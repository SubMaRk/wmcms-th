<?php
/**
* 用户消息处理器
*
* @version        $Id: user.msg.php 2016年5月5日 22:25  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@user_msg';

//发送消息
if ( $type == "send"  )
{
	$uid = $post['uid'];
	$data['msg_content'] = str::Escape( $post['content'] , 'e');
	$data['msg_time'] = time();
	$data['msg_fuid'] = '0';

	if ( !str::IsEmpty($uid) )
	{
		Ajax($uid.'对不起，用户id不能为空！',300);
	}
	else if ( $data['msg_content'] == '' )
	{
		Ajax('เนื้อหาข้อความว่าง!',300);
	}
	

	//群发全部用户消息
	if( $uid == '0' )
	{
		$where['table'] = '@user_user';
		$where['filed'] = 'user_id';
		$arr = wmsql::GetAll($where);
		foreach ($arr as $k=>$v)
		{
			$data['msg_tuid'] = $v['user_id'];
			$where['msg_id'] = wmsql::Insert($table, $data);
		}
	}
	//多个用户id发送消息
	else
	{
		$uidArr = explode(',',$uid);
		foreach ($uidArr as $k=>$v)
		{
			$data['msg_tuid'] = $v;
			$where['msg_id'] = wmsql::Insert($table, $data);
		}
	}

	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor','user_msg', $where['msg_id']);
	
	//写入操作记录
	SetOpLog( '群发了消息' , 'user' , 'insert' , $table , $where , $data );
	Ajax('ส่งข้อความสำเร็จ!');
}
//删除请求记录
else if ( $type == 'del' )
{
	$where['msg_id'] = GetDelId();
	
	wmsql::Delete($table, $where);
	SetOpLog( '删除了消息记录' , 'user' , 'delete' , $table , $where);
	
	Ajax('ลบข้อความสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( '清空了消息记录' , 'user' , 'delete');
	Ajax('ล้างข้อมูลข้อความทั้งหมดสำเร็จ!');
}
?>