<?php
/**
* 道具分类处理器
*
* @version        $Id: props.type.php 2017年3月5日 17:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$typeMod = NewModel('props.type');

$table = '@props_type';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape($post['type'] , 'e');
	$where['type_id'] = $post['type_id'];
	
	if ( $data['type_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อหมวดหมู่ก่อน',300);
	}
	else if( !str::Number($data['type_order']) )
	{
		Ajax('ขออภัย! ต้องกรอกหมายเลขลำดับก่อน',300);
	}
	else if( !str::Number($data['type_topid']) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่ก่อน',300);
	}
	else if( $typeMod->GetByName($data['type_module'] , $data['type_name'] , $where['type_id']) )
	{
		Ajax('ขออภัย! มีหมวดหมู่ในปัจจุบันอยู่แล้ว',300);
	}

	//查询上级所有id
	$data['type_pid'] = GetPids( $table , $data['type_topid'] );
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มหมวดหมู่ไอเท็มสำเร็จ';
		$where['type_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มหมวดหมู่ไอเท็ม'.$data['type_name'] , $curModule , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขหมวดหมู่ไอเท็มสำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขหมวดหมู่ไอเท็ม'.$data['type_name'] , $curModule , 'update' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除分类
else if ( $type == 'del' )
{
	$where['type_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบหมวดหมู่ไอเท็ม' , $curModule , 'delete' , $table , $where);
	//删除分类
	wmsql::Delete($table, $where);
	Ajax('ลบหมวดหมู่ไอเท็มสำเร็จ!');
}
?>