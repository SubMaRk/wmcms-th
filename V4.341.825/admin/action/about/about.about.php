<?php
/**
* 信息处理器
*
* @version        $Id: about.about.php 2016年5月13日 17:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$conSer = AdminNewClass('system.config');
$table = '@about_about';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['about'], 'e' );
	$where = $post['id'];
	$data['about_time'] = strtotime($data['about_time']);

	if ( $data['about_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อหัวเรื่องก่อน',300);
	}
	else if( !str::Number($data['type_id']) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่ก่อน',300);
	}

	//信息名字检查
	$wheresql['table'] = $table;
	$wheresql['where']['about_id'] = array('<>',$where['about_id']);
	$wheresql['where']['about_name'] = $data['about_name'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! มีข้อมูลนี้อยู่แล้ว',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มข้อมูลสำเร็จแล้ว';
		$where['about_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มข้อมูล'.$data['about_name'] , 'about' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขข้อมูลสำเร็จแล้ว';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขข้อมูล'.$data['about_name'] , 'about' , 'update' , $table , $where , $data );
	}

	//写入自定义字段
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = GetKey($post,'field');
	$fieldArr['tid'] = $data['type_id'];
	$fieldArr['cid'] = $where['about_id'];
	$fieldArr['ft'] = '2';
	$conSer->SetFieldOption($fieldArr);
	
	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor',$curModule , $where['about_id']);
	
	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'del' )
{
	$where['about_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบข้อมูล' , 'about' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);

	Ajax('ลบข้อมูลแล้ว!');
}
//移动数据
else if ( $type == 'move' )
{
	$data['type_id'] = Request('tid');
	$where['about_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ย้ายข้อมูล' , 'about' , 'update' , $table , $where);

	wmsql::Update($table, $data, $where);
	Ajax('ย้ายข้อมูลสำเร็จแล้ว!');
}
?>