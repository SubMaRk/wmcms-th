
			$where['sign_id'] = wmsql::Insert($table, $data);
			//写入操作记录
			Ajax('ขออภัย! อัตราส่วนต้องไม่เกิน 10' , 300 );
			Ajax('ขออภัย! ต้องกรอกชื่อระดับเช็คชื่อก่อน' , 300 );
			Ajax('ยินดีด้วย! เพิ่มระดับเช็คชื่อสำเร็จแล้ว' , 200 );
			SetOpLog( 'เพิ่มระดับเช็คชื่อ' , 'author' , 'insert' , $table , $where , $data );
			wmsql::Update($table, $v['data'], $v['id']);
		{
		{
		{
		{
		}
		}
		}
		}
		Ajax('ขออภัย! โปรดกรอกข้อมูลแล้วคลิ๊กจัดเก็บ',300);
		Ajax('ขออภัย! อัตราส่วนต้องไม่เกิน 10' , 300 );
		else
		foreach ($post['sign'] as $k=>$v)
		if( $data['sign_name'] != '' )
		if( $w+$u != 10 )
		list($w,$u) = explode(":", $data['sign_divide']);
	$data = str::Escape( @$post['sign'], 'e' );
	$data['sign_divide'] = Post('divide');
	$data['sign_gold1'] = Post('gold1');
	$data['sign_gold2'] = Post('gold2');
	$data['sign_name'] = Post('name');
	$data['sign_order'] = Post('order');
	$where['sign_id'] = GetDelId();
	$where['sign_id'] = intval(Get('id'));
	//写入操作记录
	//写入操作记录
	//写入操作记录
	{
	{
	{
	{
	}
	}
	}
	}
	Ajax('แก้ไขระดับเช็คชื่อของผู้ใช้สำเร็จแล้ว!');
	Ajax('ลบระดับเช็คชื่อผู้ใช้สำเร็จแล้ว!');
	Ajax('ลบระดับเช็คชื่อผู้ใช้สำเร็จแล้ว!');
	else
	if( !$data )
	if( $post['sign'] )
	if( $w+$u != 10 )
	list($w,$u) = explode(":", $data['sign_divide']);
	SetOpLog( 'แก้ไขระดับเช็คชื่อทั้งหมด' , 'author' , 'update' , $table);
	SetOpLog( 'แก้ไขระดับการเช็คชื่อของผู้ใช้' , 'author' , 'update' , $table , $where , $data);
	SetOpLog( 'ลบระดับเช็คชื่อผู้ใช้' , 'author' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
	wmsql::Update($table, $data, $where);
$table = '@author_sign';
*
*
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @package        WMCMS
* @version        $Id: author.sign.php 2017年3月4日 14:41  weimeng
* 作者等级处理器
*/
/**
//修改签约数据
//修改全部数据
//删除数据
//新增签约等级
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
