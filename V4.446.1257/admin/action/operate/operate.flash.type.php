<?php
/**
* 幻灯片分类处理器
*
* @version        $Id: operate.flash.type.php 2018年8月21日 20:59  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@flash_type';

//修改分类信息
if ( $type == 'type_edit' || $type == "type_add"  )
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

	//幻灯片分类名字检查
	$wheresql['table'] = $table;
	$wheresql['where']['type_id'] = array('<>',$where['type_id']);
	$wheresql['where']['type_name'] = $data['type_name'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! มีชื่อหมวดหมู่นี้อยู่แล้ว',300);
	}
	
	//查询上级所有id
	$data['type_pid'] = GetPids( $table , $data['type_topid'] );
	
	//新增数据
	if( $type == 'type_add' )
	{
		$info = 'ยินดีด้วย! เพิ่มหมวดหมู่สไลด์สำเร็จ';
		$where['type_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มหมวดหมู่สไลด์'.$data['type_name'] , 'flash' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขหมวดหมู่สไลด์สำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขหมวดหมู่สไลด์'.$data['type_name'] , 'flash' , 'update' , $table , $where , $data );
	}

	Ajax($info);
}
//删除分类
else if ( $type == 'type_del' )
{
	function TypeDelCallBack($tid)
	{
		//删除当前分类的文章
		wmsql::Delete('@flash_flash', array('type_id'=>$tid));
	}
	DelType('flash');
	

	//写入操作记录
	$where['type_id'] = GetDelId();
	SetOpLog( 'ลบหมวดหมู่สไลด์' , 'flash' , 'delete' , $table , $where);
	Ajax('ลบหมวดหมู่สไลด์สำเร็จ!');
}
?>