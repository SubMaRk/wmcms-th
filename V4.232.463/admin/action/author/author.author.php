




	
	
	
	
		
		
		
			$applySer->HandleApply('apply' , $v['user_id'] , $v['author_id'] , $data['author_status']);
			$authorMod->UpdateAuthor($data , $where);
			$msg = 'ตรวจสอบ';
			//插入消息和修改申请记录
			Ajax('ขออภัย! ผู้ใช้เป็นผู้แต่งอยู่แล้ว',300);
		$authorData = $authorMod->GetAuthor($data['user_id']);
		$authorMod->UpdateAuthor($data, $where);
		$expMod->Insert($where['author_id']);
		$expMod->Update('article' , $where['author_id'] , $post['exp']['article']['exp_number']);
		$expMod->Update('novel' , $where['author_id'] , $post['exp']['novel']['exp_number']);
		$info = 'ยินดีด้วย! เพิ่มผู้แต่งสำเร็จแล้ว';
		$info = 'ยินดีด้วย! แก้ไขผู้แต่งสำเร็จแล้ว';
		$msg = 'ละทิ้ง';
		$msgMod->Insert($data['user_id'] , 'ได้กลายเป็นผู้แต่่งแล้ว!');
		$msgMod = NewModel('user.msg');
		$where['author_id'] = $authorMod->Insert($data);
		//修改作者经验值
		//写入操作记录
		//写入操作记录
		//写入操作记录
		//插入作者
		//插入作者经验值
		//插入消息
		{
		{
		{
		}
		}
		}
		Ajax('ผู้แต่งถูก'.$msg.'แล้ว!');
		Ajax('ขออภัย! ต้องกรอกไอดีผู้ใช้และไอดีผู้แต่งเป็นตัวเลขเท่านั้น',300);
		Ajax('ขออภัย! ต้องกรอกไอดีผู้ใช้ นามแฝง และข้อมูลผู้แต่งก่อน',300);
		Ajax('ขออภัย! มีนามแฝงนี้อยู่แล้ว',300);
		Ajax('ขออภัย! ไม่มีผู้แต่ง');
		Ajax('ขออภัย! ไม่มีไอดีผู้ใช้นี้อยู่',300);
		Ajax( 'ขออภัย! ต้องกรอกนามแฝงที่มีความยาว 3-25 ตัวอักษรเท่านั้น',300);
		foreach ($dataList as $k=>$v)
		if( $authorData )
		if( Request('status') == '1')
		SetOpLog( 'แก้ไขผู้แต่ง'.$data['author_nickname'] , 'author' , 'update' , $table , $where , $data );
		SetOpLog( 'เพิ่มผู้แต่ง'.$data['author_nickname'] , 'author' , 'insert' , $table , $where , $data );
		SetOpLog( $msg.'ผุ้แต่ง' , 'author' , 'update' , $table , $where);
	$authorMod->Delete($where);
	$data = str::Escape( $post['author'], 'e' );
	$data['author_status'] = Request('status');
	$data['author_time'] = strtotime($data['author_time']);
	$dataList = $authorMod->GetAll($where);
	$expMod = NewModel('author.exp');
	$userMod = NewModel('user.user');
	$where = $post['id'];
	$where['author_id'] = GetDelId();
	$where['author_id'] = GetDelId();
	//配置文件，删除数据方式是否是直接删除
	//验证用户是否存在。
	//修改作者
	//写入操作记录
	//新增作者
	//检查昵称是否存在
	{
	{
	{
	{
	{
	{
	{
	{
	{
	}
	}
	}
	}
	}
	}
	}
	}
	}
	Ajax('ลบผู้แต่งสำเร็จแล้ว!');
	Ajax($info);
	else
	else
	else if( !str::Number($data['user_id']) || !str::Number($where['author_id']) || !str::Number($data['author_status']))
	else if( str::LNC( $data['author_nickname'], '' , '3,25') == false)//Changed from '2,15'
	if ( $data['user_id'] == '' || $data['author_nickname'] == '' || $data['author_info'] == '')
	if( !$authorMod->CheckNickName( $data['author_nickname'], $data['user_id']) )
	if( !$userMod->GetOne($data['user_id']) )
	if( $dataList )
	if( $type == 'add' )
	SetOpLog( 'ลบผู้แต่ง' , 'author' , 'delete' , $table , $where);
$applySer = NewModel('system.apply' , 'author');
$authorMod = NewModel('author.author');
$table = '@author_author';
*
*
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @package        WMCMS
* @version        $Id: author.author.php 2017年1月12日 19:43  weimeng
* 作者处理器
*/
/**
//修改分类信息
//删除数据
//审核数据
?>
{
{
{
}
}
}
<?php
else if ( $type == 'del' )
else if ( $type == 'status' )
if ( $type == 'edit' || $type == "add"  )
