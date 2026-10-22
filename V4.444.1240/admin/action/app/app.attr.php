<?php
/**
* 应用资料处理器
*
* @version        $Id: app.attr.php 2016年5月15日 22:14  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @app           http://www.weimengcms.com
*
*/
$table = '@app_attr';

//修改应用资料
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['attr'], 'e' );
	$where = $post['id'];

	if ( $data['attr_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อแอปฯ ก่อน',300);
	}
	else if( $data['attr_type'] == '' )
	{
		Ajax('ขออภัย! ต้องเลือกประเภทแอปฯ ก่อน',300);
	}

	//应用名字检查
	$wheresql['table'] = $table;
	$wheresql['where']['attr_id'] = array('<>',$where['attr_id']);
	$wheresql['where']['attr_name'] = $data['attr_name'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! มีข้อมูลแอปฯ อยู่แล้ว',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มข้อมูลแอปฯ แล้ว';
		$where['attr_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มข้อมูลแอปฯ'.$data['attr_name'] , 'app' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขข้อมูลแอปฯ แล้ว';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขข้อมูลแอปฯ'.$data['attr_name'] , 'app' , 'update' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'del' )
{
	$where['attr_id'] = GetDelId();
	wmsql::Delete($table,$where);

	SetOpLog( 'ลบข้อมูลแอปฯ' , 'app' , 'delete' , $table , $where);
	Ajax('ลบข้อมูลแอปฯ แล้ว!');
}
?>