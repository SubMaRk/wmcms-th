<?php
/**
* 作者处理器
*
* @version        $Id: author.author.php 2017年1月12日 19:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@author_author';
$authorMod = NewModel('author.author');
$applySer = NewModel('system.apply' , 'author');

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['author'], 'e' );
	$where = $post['id'];
	$data['author_time'] = strtotime($data['author_time']);

	if ( $data['user_id'] == '' || $data['author_nickname'] == '' || $data['author_info'] == '')
	{
		Ajax('ขออภัย! ต้องกรอกไอดีผู้ใช้ นามแฝง และข้อมูลผู้แต่งก่อน',300);
	}
	else if( !str::Number($data['user_id']) || !str::Number($where['author_id']) || !str::Number($data['author_status']))
	{
		Ajax('ขออภัย! ต้องกรอกไอดีผู้ใช้และไอดีผู้แต่งเป็นตัวเลขเท่านั้น',300);
	}
	else if( str::LNC( $data['author_nickname'], '' , '3,30') == false)//Modified by SubMaRk
	{
		Ajax( 'ขออภัย! ต้องกรอกนามแฝงที่มีความยาว 3-30 ตัวอักษรเท่านั้น',300);
	}

	//验证用户是否存在。
	$userMod = NewModel('user.user');
	$expMod = NewModel('author.exp');
	if( !$userMod->GetOne($data['user_id']) )
	{
		Ajax('ขออภัย! ไม่มีไอดีผู้ใช้นี้อยู่',300);
	}
	//检查昵称是否存在
	if( !$authorMod->CheckNickName( $data['author_nickname'], $data['user_id']) )
	{
		Ajax('ขออภัย! มีนามแฝงนี้อยู่แล้ว',300);
	}

	//新增作者
	if( $type == 'add' )
	{
		$authorData = $authorMod->GetAuthor($data['user_id']);
		if( $authorData )
		{
			Ajax('ขออภัย! ผู้ใช้เป็นผู้แต่งอยู่แล้ว',300);
		}
		
		//插入作者
		$where['author_id'] = $authorMod->Insert($data);
		//插入作者经验值
		$expMod->Insert($where['author_id']);
		
		//插入消息
		$msgMod = NewModel('user.msg');
		$msgMod->Insert($data['user_id'] , 'ได้กลายเป็นผู้แต่่งแล้ว!');

		$info = 'ยินดีด้วย! เพิ่มผู้แต่งสำเร็จแล้ว';
		//写入操作记录
		SetOpLog( 'เพิ่มผู้แต่ง'.$data['author_nickname'] , 'author' , 'insert' , $table , $where , $data );
	}
	//修改作者
	else
	{
		$info = 'ยินดีด้วย! แก้ไขผู้แต่งสำเร็จแล้ว';
		$authorMod->UpdateAuthor($data, $where);
		//修改作者经验值
		$expMod->Update('novel' , $where['author_id'] , $post['exp']['novel']['exp_number']);
		$expMod->Update('article' , $where['author_id'] , $post['exp']['article']['exp_number']);
		
		//写入操作记录
		SetOpLog( 'แก้ไขผู้แต่ง'.$data['author_nickname'] , 'author' , 'update' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	//配置文件，删除数据方式是否是直接删除
	$where['author_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบผู้แต่ง' , 'author' , 'delete' , $table , $where);
	$authorMod->Delete($where);

	Ajax('ลบผู้แต่งสำเร็จแล้ว!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['author_status'] = Request('status');
	$where['author_id'] = GetDelId();
	
	$dataList = $authorMod->GetAll($where);
	if( $dataList )
	{
		foreach ($dataList as $k=>$v)
		{
			$authorMod->UpdateAuthor($data , $where);
			//插入消息和修改申请记录
			$applySer->HandleApply('apply' , $v['user_id'] , $v['author_id'] , $data['author_status']);
		}
	
		//写入操作记录
		$msg = 'ละทิ้ง';
		if( Request('status') == '1')
		{
			$msg = 'ตรวจสอบ';
		}
		SetOpLog( $msg.'ผุ้แต่ง' , 'author' , 'update' , $table , $where);
		Ajax('ผู้แต่งถูก'.$msg.'แล้ว!');
	}
	else
	{
		Ajax('ขออภัย! ไม่มีผู้แต่ง');
	}
}
?>