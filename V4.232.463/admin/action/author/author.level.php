
			$where['level_id'] = wmsql::Insert($table, $data);
			//写入操作记录
			Ajax('ขออภัย! ต้องกรอกชื่อระดับก่อน' , 300 );
			Ajax('ยินดีด้วย! เพิ่มระดับผู้แต่งแล้ว' , 200 );
			SetOpLog( 'เพิ่มระดับผู้แต่ง' , 'author' , 'insert' , $table , $where , $data );
			wmsql::Update($table, $v['data'], $v['id']);
		$data['level_end'] = intval($data['level_end']);
		$data['level_order'] = intval($data['level_order']);
		$data['level_start'] = intval($data['level_start']);
		{
		{
		{
		}
		}
		}
		Ajax('ขออภัย! โปรดกรอกข้อมูลแล้วคลิ๊กจัดเก็บ',300);
		else
		foreach ($post['level'] as $k=>$v)
		if( $data['level_name'] != '' )
	$data = str::Escape( @$post['level'], 'e' );
	$data['level_end'] = intval(Post('end'));
	$data['level_name'] = Post('name');
	$data['level_order'] = intval(Post('order'));
	$data['level_start'] = intval(Post('start'));
	$where['level_id'] = GetDelId();
	$where['level_id'] = intval(Get('id'));
	//写入操作记录
	//写入操作记录
	//写入操作记录
	{
	{
	{
	}
	}
	}
	Ajax('ลบระดับผู้แต่งสำเร็จแล้ว!');
	Ajax('แก้ไขระดับผู้แต่งสำเร็จแล้ว!');
	Ajax('แก้แก้ไขระดับผู้แต่งทั้งหมดสำเร็จแล้ว!');
	else
	if( !$data )
	if( $post['level'] )
	SetOpLog( 'ลบระดับผู้แต่ง' , 'author' , 'delete' , $table , $where , $data);
	SetOpLog( 'แก้ไขระดับผู้แต่งทั้งหมด' , 'author' , 'update' , $table);
	SetOpLog( 'แก้ไขระดับผู้แต่ง' , 'author' , 'delete' , $table , $where , $data);
	wmsql::Delete($table , $where);
	wmsql::Update($table, $data, $where);
$table = '@author_level';
*
*
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @package        WMCMS
* @version        $Id: author.level.php 2017年3月4日 14:41  weimeng
* 作者等级处理器
*/
/**
//修改全部数据
//修改数据
//删除数据
//新增数据
?>
{
{
{
{
}
}
}
}
<?php
else if ( $type == 'del')
else if ( $type == 'upall')
else if ( $type == 'update')
if ( $type == "add" )
