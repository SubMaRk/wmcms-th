<?php
/**
* 编辑分组处理器
*
* @version        $Id: editor.editor.php 2022年05月13日 11:30  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$editorMod = NewModel('editor.editor');
$userMod = NewModel('user.user');
$table = $editorMod->table;

//修改编辑
if ( $type == 'edit' || $type == "add" )
{
	$data = str::Escape($post['data'] , 'e');
	$where['editor_id'] = Request('editor_id');
	$uid = $data['editor_uid'];
	foreach ($data as $k=>$v)
	{
		if( $v == '' )
		{
			Ajax('ทุกช่องห้ามว่าง!' , 300);
		}
	}
	//判断用户id是否存在
	if( !$userMod->GetOne($uid) )
	{
		Ajax('ไม่พบ ID ผู้ใช้นี้!' , 300);
	}
	//判断用户是否已经添加了
	if( $editorMod->CheckExist($uid,$where['editor_id']) )
	{
		Ajax('id ผู้ใช้นี้มีอยู่แล้ว!' , 300);
	}
	
	
	//如果是新增
	if ( $type == 'add' )
	{
		//插入记录
		$where['editor_id'] = $editorMod->Insert($data);
		//写入操作记录
		SetOpLog( '新增了编辑'.$data['editor_name'] , 'editor' , 'insert' , $table , $where , $data );
		Ajax('เพิ่มบรรณาธิการสำเร็จ!');
	}
	//如果是增加页面
	else
	{
		//写入操作记录
		SetOpLog( '修改编辑' , 'editor' , 'update' , $table  , $where , $data );
		//修改数据
		$editorMod->Update($data,$where);
		Ajax('แก้ไขบรรณาธิการสำเร็จ!');
	}
}
//快速切换状态
else if( $type == 'status' )
{
	$data['editor_status'] = Request('status');
	$where['editor_id'] = GetDelId();
	if( Request('status') == '1')
	{
		$msg = '启用';
	}
	else
	{
		$msg = '禁用';
	}
	//写入操作记录
	SetOpLog( $msg.'了编辑' , 'editor' , 'update' , $table , $where);
	$editorMod->Update( $data, $where);
	Ajax('บรรณาธิการ'.$msg.'สำเร็จ!');
}
?>