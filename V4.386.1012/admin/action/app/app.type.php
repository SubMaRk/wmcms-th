<?php
/**
* 应用分类处理器
*
* @version        $Id: app.type.php 2016年5月15日 9:53  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @app           http://www.weimengcms.com
*
*/
$seoSer = AdminNewClass('system.seo');
$conSer = AdminNewClass('system.config');

$table = '@app_type';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape($post['type'] , 'e');
	$where = $post['id'];
	
	if ( $data['type_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อหมวดหมู่ก่อน',300);
	}
	else if( !str::Number($data['type_order']) )
	{
		Ajax('ขออภัย! ต้องกรอกลำดับก่อน',300);
	}
	else if( !str::Number($data['type_topid']) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่ก่อน',300);
	}

	//分类名字检查
	$wheresql['table'] = $table;
	$wheresql['where']['type_id'] = array('<>',$where['type_id']);
	$wheresql['where']['type_name'] = $data['type_name'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! มีหมวดหมู่นี้อยู่แล้ว',300);
	}
	
	
	//查询上级所有id
	$data['type_pid'] = GetPids( $table , $data['type_topid'] );
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มหมวดหมู่แอปฯ สำเร็จแล้ว';
		$where['type_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มหมวดหมู่แอปฯ'.$data['type_name'] , 'app' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขหมวดหมู่แอปฯ สำเร็จแล้ว';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขหมวดหมู่แอปฯ'.$data['type_name'] , 'app' , 'update' , $table , $where , $data );
	}

	//写入自定义字段
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = GetKey($post,'field');
	$fieldArr['tid'] = $where['type_id'];
	$fieldArr['pid'] = $data['type_topid'];
	$conSer->SetFieldOption($fieldArr);
	
	
	//插入或者修改html规则
	$seoSer->SetTypeHtml('app' , $post['html'] , $where['type_id']);
	
	Ajax($info);
}
//删除分类
else if ( $type == 'del' )
{
	function TypeDelCallBack($tid)
	{
		//删除当前分类的文章
		wmsql::Delete('@app_app', array('type_id'=>$tid));
	}
	DelType();
	

	//写入操作记录
	$where['type_id'] = GetDelId();
	SetOpLog( 'ลบหมวดหมู่แอปฯ' , 'app' , 'delete' , $table , $where);
	Ajax('ลบหมวดหมู่แอปฯแล้ว!');
}
?>