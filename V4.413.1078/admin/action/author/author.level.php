<?php
/**
* 作者等级处理器
*
* @version        $Id: author.level.php 2017年3月4日 14:41  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@author_level';

//新增数据
if ( $type == "add" )
{
	$data = str::Escape( GetKey($post,'level'), 'e' );
	if( !$data )
	{
		Ajax('ขออภัย! โปรดกรอกข้อมูลแล้วคลิ๊กจัดเก็บ',300);
	}
	else
	{
		$data['level_start'] = intval($data['level_start']);
		$data['level_end'] = intval($data['level_end']);
		$data['level_order'] = intval($data['level_order']);
		if( $data['level_name'] != '' )
		{
			$where['level_id'] = wmsql::Insert($table, $data);
			//写入操作记录
			SetOpLog( 'เพิ่มระดับผู้แต่ง' , 'author' , 'insert' , $table , $where , $data );
			Ajax('ยินดีด้วย! เพิ่มระดับผู้แต่งแล้ว' , 200 );
		}
		else
		{
			Ajax('ขออภัย! ต้องกรอกชื่อระดับก่อน' , 300 );
		}
	}
}
//修改数据
else if ( $type == 'update')
{
	$where['level_id'] = intval(Get('id'));
	$data['level_name'] = Post('name');
	$data['level_start'] = intval(Post('start'));
	$data['level_end'] = intval(Post('end'));
	$data['level_order'] = intval(Post('order'));
	wmsql::Update($table, $data, $where);
	//写入操作记录
	SetOpLog( 'แก้ไขระดับผู้แต่ง' , 'author' , 'delete' , $table , $where , $data);
	Ajax('แก้ไขระดับผู้แต่งสำเร็จแล้ว!');
}
//修改全部数据
else if ( $type == 'upall')
{
	if( $post['level'] )
	{
		foreach ($post['level'] as $k=>$v)
		{
			wmsql::Update($table, $v['data'], $v['id']);
		}
	}
	//写入操作记录
	SetOpLog( 'แก้ไขระดับผู้แต่งทั้งหมด' , 'author' , 'update' , $table);
	Ajax('แก้แก้ไขระดับผู้แต่งทั้งหมดสำเร็จแล้ว!');
}
//删除数据
else if ( $type == 'del')
{
	$where['level_id'] = GetDelId();
	wmsql::Delete($table , $where);
	//写入操作记录
	SetOpLog( 'ลบระดับผู้แต่ง' , 'author' , 'delete' , $table , $where);
	Ajax('ลบระดับผู้แต่งสำเร็จแล้ว!');
}
?>