<?php
/**
* 广告分类处理器
*
* @version        $Id: operate.ad.type.php 2016年5月8日 14:14  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@ad_type';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['type'], 'e' );
	$where = $post['id'];
	
	if ( $data['type_name'] == '')
	{
		Ajax('ขออภัย! ต้องกรอกชื่อหมวดหมู่โฆษณาก่อน',300);
	}

	//分类名字检查
	$wheresql['table'] = $table;
	$wheresql['where']['type_name'] = $data['type_name'];
	$wheresql['where']['type_id'] = array('<>',$where['type_id']);
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! มีหมวดหมู่นี้อยู่แล้ว',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มหมวดหมู่โฆษณาสำเร็จ';
		$where['type_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มหมวดหมู่โฆษณา'.$data['type_name'] , 'system' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขหมวดหมู่โฆษณาสำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขหมวดหมู่โฆษณา'.$data['type_name'] , 'system' , 'update' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['type_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบหมวดหมู่โฆษณา' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);

	Ajax('ลบหมวดหมู่โฆษณาสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างหมวดหมู่โฆษณา' , 'system' , 'delete' , $table);
	Ajax('ล้างหมวดหมู่โฆษณาสำเร็จ');
}
?>