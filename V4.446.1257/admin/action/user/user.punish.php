<?php
/**
* 用户处罚处理器
*
* @version        $Id: user.punish.php 2020年05月28日 15:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$punishMod = NewModel('user.punish');
$msgMod = NewModel('system.msg');
$table = $punishMod->table;

//执行处罚
if ( $type == "punish"  )
{
	$data = $post['punish'];
	$data['punish_endtime'] = strtotime($data['punish_endtime']);
	if( $punishMod->GetOne($data['punish_uid'],$data['punish_type']) )
	{
		Ajax('ผู้ใช้นี้อยู่ระหว่างการลงโทษ!',300);
	}
	else
	{
		$punishMod->Insert($data);
		//发送模板消息
		$msgMod->SendTempMsg('user_punish_'.$data['punish_type'],$data['punish_uid'],array('原因'=>$data['punish_remark']));
		SetOpLog( '插入了处罚记录' , 'user' , 'insert' , $table);
		Ajax('ลงโทษสำเร็จ!');
	}
}
//解除处罚记录
else if ( $type == 'unpunish' )
{
	$uid = Request('uid');
	$st = Request('st');
	$punishMod->UnPunish($uid,$st);
	//发送模板消息
	$msgMod->SendTempMsg('user_punish_un'.$st,$uid);
	$where['punish_uid'] = $uid;
	$where['punish_type'] = $st;
	SetOpLog( '解除了处罚记录' , 'user' , 'update' , $table , $where);
	Ajax('ยกเลิกการลงโทษสำเร็จ!');
}
//删除处罚记录
else if ( $type == 'del' )
{
	$where['punish_id'] = GetDelId();
	$punishMod->Delete($where);
	SetOpLog( '删除了处罚记录' , 'user' , 'delete' , $table , $where);
	Ajax('ลบบันทึกการลงโทษสำเร็จ!');
}
?>