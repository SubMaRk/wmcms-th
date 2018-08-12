<?php
/**
* 作者等级处理器
*
* @version        $Id: author.sign.php 2017年3月4日 14:41  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@author_sign';

//新增签约等级
if ( $type == "add" )
{
	$data = str::Escape( @$post['sign'], 'e' );
	if( !$data )
	{
		Ajax('ขออภัย! โปรดกรอกข้อมูลแล้วคลิ๊กจัดเก็บ',300);
	}
	else
	{
		list($w,$u) = explode(":", $data['sign_divide']);
		if( $w+$u != 10 )
		{
			Ajax('ขออภัย! อัตราส่วนต้องไม่เกิน 10' , 300 );
		}
		if( $data['sign_name'] != '' )
		{
			$where['sign_id'] = wmsql::Insert($table, $data);
			//写入操作记录
			SetOpLog( 'เพิ่มระดับเช็คชื่อ' , 'author' , 'insert' , $table , $where , $data );
			Ajax('ยินดีด้วย! เพิ่มระดับเช็คชื่อสำเร็จแล้ว' , 200 );
		}
		else
		{
			Ajax('ขออภัย! ต้องกรอกชื่อระดับเช็คชื่อก่อน' , 300 );
		}
	}
}
//修改签约数据
else if ( $type == 'update')
{
	$where['sign_id'] = intval(Get('id'));
	$data['sign_name'] = Post('name');
	$data['sign_divide'] = Post('divide');
	$data['sign_gold1'] = Post('gold1');
	$data['sign_gold2'] = Post('gold2');
	$data['sign_order'] = Post('order');
	list($w,$u) = explode(":", $data['sign_divide']);
	if( $w+$u != 10 )
	{
		Ajax('ขออภัย! อัตราส่วนต้องไม่เกิน 10' , 300 );
	}
	wmsql::Update($table, $data, $where);
	//写入操作记录
	SetOpLog( 'แก้ไขระดับการเช็คชื่อของผู้ใช้' , 'author' , 'update' , $table , $where , $data);
	Ajax('แก้ไขระดับเช็คชื่อของผู้ใช้สำเร็จแล้ว!');
}
//修改全部数据
else if ( $type == 'upall')
{
	if( $post['sign'] )
	{
		foreach ($post['sign'] as $k=>$v)
		{
			wmsql::Update($table, $v['data'], $v['id']);
		}
	}
	//写入操作记录
	SetOpLog( 'แก้ไขระดับเช็คชื่อทั้งหมด' , 'author' , 'update' , $table);
	Ajax('แก้ไขระดับเช็คชื่อทั้งหมดสำเร็จแล้ว!');
}
//删除数据
else if ( $type == 'del')
{
	$where['sign_id'] = GetDelId();
	wmsql::Delete($table , $where);
	//写入操作记录
	SetOpLog( 'ลบระดับเช็คชื่อผู้ใช้' , 'author' , 'delete' , $table , $where);
	Ajax('ลบระดับเช็คชื่อผู้ใช้สำเร็จแล้ว!');
}
?>
