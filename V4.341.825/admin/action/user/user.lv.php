<?php
/**
* 用户等级处理器
*
* @version        $Id: user.lv.php 2016年5月5日 22:25  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@user_level';

//修改分类信息
if ( $type == "add" || $type == "edit" )
{
	//新增数据
	if( $type == 'add' )
	{
		$data = str::Escape( GetKey($post,'level'), 'e' );
		if( !$data )
		{
			Ajax('ขออภัย! โปรดเพิ่มข้อมูลแล้วคลิ๊กจัดเก็บ!',300);
		}
		foreach ($data as $k=>$v)
		{
			if( $v['level_name'] != '' )
			{
				$where['level_id'] = wmsql::Insert($table, $v);
				//写入操作记录
				SetOpLog( 'เพิ่มระดับผู้ใช้' , 'user' , 'insert' , $table , $where , $v );
			}
		}
		$info = 'ยินดีด้วย! เพิ่มระดับผู้ใช้สำเร็จ';
	}
	else if( $type == 'edit' )
	{
		if( $post['level'] )
		{
			foreach ($post['level'] as $k=>$v)
			{
				wmsql::Update($table, $v['data'], $v['id']);
				//写入操作记录
				SetOpLog( 'แก้ไขระดับผู้ใช้' , 'user' , 'update' , $table , $v['id'] , $v['data'] );
			}
		}
		$info = 'ยินดีด้วย! แก้ไขระดับผู้ใช้สำเร็จ';
	}
	
	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'del')
{
	$where['level_id'] = GetDelId();
	wmsql::Delete($table , $where);
	
	//写入操作记录
	SetOpLog( 'ลบระดับผู้ใช้' , 'user' , 'delete' , $table , $where);
	
	Ajax('ลบระดับผู้ใช้สำเร็จ!');
}
?>