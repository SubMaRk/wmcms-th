<?php
/**
* 筛选条件处理器
*
* @version        $Id: system.retrieval.php 2017年6月17日 11:26  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
list($module,$type) = explode('_', $type);
$table = '@system_retrieval';
$reMod = NewModel('system.retrieval');

//修改筛选信息
if ( $type == 'edit' || $type == "add" )
{
	$data = str::Escape($post['data'] , 'e');
	$data['retrieval_module'] = $module;
	$where['retrieval_id'] = Request('retrieval_id');
	foreach ($data as $k=>$v)
	{
		if( $v == '' && $k != 'retrieval_value' )
		{
			Ajax(GetModuleName($module).'ขออภัย! ฟิลด์ทั้งหมดต้องไม่ว่าง' , 300);
		}
	}
	
	//如果是新增
	if ( $type == 'add' )
	{
		//插入记录
		$where['retrieval_id'] = $reMod->Insert($data);
		//写入操作记录
		SetOpLog( 'เพิ่ม'.GetModuleName($module).'เงื่อนไขตัวกรอง'.$data['retrieval_title'] , 'system' , 'insert' , $table , $where , $data );
		Ajax(GetModuleName($module).'เพิ่มเงื่อนไขตัวกรองสำเร็จ!');
	}
	//如果是增加页面
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไข'.GetModuleName($module).'เงื่อนไขตัวกรอง' , 'system' , 'update' , $table  , $where , $data );
		//修改数据
		$reMod->Update($data,$where);
		Ajax(GetModuleName($module).'แก้ไขเงื่อนไขตัวกรองสำเร็จ');
	}
}
//删除条件删选
else if( $type == 'del' )
{
	$where['retrieval_id'] = GetDelId();
	$reMod->Del($where);
	//写入操作记录
	SetOpLog( 'ลบ'.GetModuleName($module).'เงื่อนไขตัวกรอง' , 'system' , 'delete' , $table , $where);
	Ajax(GetModuleName($module).'ลบเงื่อนไขตัวกรองสำเร็จ!');
}
//使用禁用条件
else if( $type == 'status' )
{
	$data['retrieval_status'] = Request('status');
	$where['retrieval_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ใช้งาน';
	}
	else
	{
		$msg = 'เลิกใช้';
	}
	$reMod->Update($data,$where);
	
	//写入操作记录
	SetOpLog( GetModuleName($module).'เงื่อนไขตัวกรอง'.$msg , 'system' , 'update' , $table , $where);
	Ajax(GetModuleName($module).'เงื่อนไขตัวกรอง'.$msg'แล้ว');
}

//修改检索分类信息
else if($type == 'type')
{
	if( $post['type'] )
	{
		foreach ($post['type'] as $k=>$v)
		{
			$reMod->TypeUpdate($v['data'],$v['id']);
		}
		//写入操作记录
		SetOpLog( 'แก้ไข'.GetModuleName($module).'หมวดหมู่ตัวกรอง' , 'system' , 'update' , $table , $v['id'] , $v['data'] );
	}
	Ajax(GetModuleName($module).'ยินดีด้วย! แก้ไขหมวดหมู่ตัวกรองสำเร็จ');
}
//使用禁用分类
else if( $type == 'typestatus' )
{
	$data['type_status'] = Request('status');
	$where['type_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ใช้งาน';
	}
	else
	{
		$msg = 'เลิกใช้';
	}
	$reMod->TypeUpdate($data,$where);
	
	//写入操作记录
	SetOpLog( GetModuleName($module).'หมวดหมู่ตัวกรอง'.$msg , 'system' , 'update' , $table , $where);
	Ajax(GetModuleName($module).'หมวดหมู่ตัวกรอง'.$msg'แล้ว');
}
?>