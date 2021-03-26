<?php
/**
* 论坛版块处理器
*
* @version        $Id: bbs.type.php 2016年5月18日 9:53  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @bbs           http://www.weimengcms.com
*
*/
$seoSer = AdminNewClass('system.seo');
$conSer = AdminNewClass('system.config');

$table = '@bbs_type';

//修改版块信息
if ( $type == 'edit' || $type == "add"  )
{
	$typeSer = AdminNewClass('bbs.type');

	$where = $post['id'];
	$data = str::Escape($post['type'] , 'e');
	$data['type_last_post'] = strtotime(GetKey($data,'type_last_post'));
	$data['type_uptime'] = strtotime(GetKey($data,'type_uptime'));
	
	if ( $data['type_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อบอร์ดก่อน',300);
	}
	else if( !str::Number($data['type_order']) )
	{
		Ajax('ขออภัย! ต้องกรอกลำดับบอร์ดก่อน',300);
	}
	else if( !str::Number($data['type_topid']) )
	{
		Ajax('ขออภัย! ต้องเลือกบอร์ดก่อน',300);
	}

	//版块名字检查
	$typeWhere['type_name'] = $data['type_name'];
	$typeWhere['type_id'] =  array('<>',$where['type_id']);
	if ( $typeSer->CheckName($typeWhere) !== false)
	{
		Ajax('ขออภัย! มีบอร์ดนี้อยู่แล้ว',300);
	}
	
	//查询上级所有id
	$data['type_pid'] = GetPids( $table , $data['type_topid'] );
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มบอร์ดสำเร็จแล้ว';
		$where['type_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มบอร์ด'.$data['type_name'] , 'bbs' , 'insert' , $table , $where , $data );
	}
	//修改版块
	else
	{
		$info = 'ยินดีด้วย! แก้ไขบอร์ดสำเร็จแล้ว';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขบอร์ด'.$data['type_name'] , 'bbs' , 'update' , $table , $where , $data );
	}

	//写入自定义字段
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = GetKey($post,'field');
	$fieldArr['tid'] = $where['type_id'];
	$fieldArr['pid'] = $data['type_topid'];
	$conSer->SetFieldOption($fieldArr);
	
	//插入或者修改html规则
	$seoSer->SetTypeHtml('bbs' , $post['html'] , $where['type_id']);
	
	Ajax($info);
}
//删除版块
else if ( $type == 'del' )
{
	$where['type_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบบอร์ด' , 'bbs' , 'delete' , $table , $where);

	//删除版块
	wmsql::Delete($table, $where);
	//删除当前版块的主题
	wmsql::Delete('@bbs_bbs', $where);
	//删除当前分类的自定义字段
	$conSer->DelField($where['type_id']);

	Ajax('ลบบอร์ดสำเร็จแล้ว!');
}
?>