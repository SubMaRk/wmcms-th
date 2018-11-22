






	
	
	
	
	
	
		
		
		$info = 'ยินดีด้วย! เพิ่มบอร์ดสำเร็จแล้ว';
		$info = 'ยินดีด้วย! แก้ไขบอร์ดสำเร็จแล้ว';
		$where['type_id'] = wmsql::Insert($table, $data);
		//写入操作记录
		//写入操作记录
		Ajax('ขออภัย! ต้องกรอกชื่อบอร์ดก่อน',300);
		Ajax('ขออภัย! ต้องกรอกลำดับบอร์ดก่อน',300);
		Ajax('ขออภัย! ต้องเลือกบอร์ดก่อน',300);
		Ajax('ขออภัย! มีบอร์ดนี้อยู่แล้ว',300);
		SetOpLog( 'แก้ไขบอร์ด'.$data['type_name'] , 'bbs' , 'update' , $table , $where , $data );
		SetOpLog( 'เพิ่มบอร์ด'.$data['type_name'] , 'bbs' , 'insert' , $table , $where , $data );
		wmsql::Update($table, $data, $where);
	$conSer->DelField($where['type_id']);
	$conSer->SetFieldOption($fieldArr);
	$data = str::Escape($post['type'] , 'e');
	$data['type_last_post'] = strtotime(@$data['type_last_post']);
	$data['type_pid'] = GetPids( $table , $data['type_topid'] );
	$data['type_uptime'] = strtotime(@$data['type_uptime']);
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = @$post['field'];
	$fieldArr['pid'] = $data['type_topid'];
	$fieldArr['tid'] = $where['type_id'];
	$seoSer->SetTypeHtml('bbs' , $post['html'] , $where['type_id']);
	$typeSer = AdminNewClass('bbs.type');
	$typeWhere['type_id'] =  array('<>',$where['type_id']);
	$typeWhere['type_name'] = $data['type_name'];
	$where = $post['id'];
	$where['type_id'] = GetDelId();
	//版块名字检查
	//修改版块
	//删除版块
	//删除当前版块的主题
	//删除当前分类的自定义字段
	//写入自定义字段
	//写入操作记录
	//新增数据
	//插入或者修改html规则
	//查询上级所有id
	{
	{
	{
	{
	{
	{
	}
	}
	}
	}
	}
	}
	Ajax('ลบบอร์ดสำเร็จแล้ว!');
	Ajax($info);
	else
	else if( !str::Number($data['type_order']) )
	else if( !str::Number($data['type_topid']) )
	if ( $data['type_name'] == '' )
	if ( $typeSer->CheckName($typeWhere) !== false)
	if( $type == 'add' )
	SetOpLog( 'ลบบอร์ด' , 'bbs' , 'delete' , $table , $where);
	wmsql::Delete('@bbs_bbs', $where);
	wmsql::Delete($table, $where);
$conSer = AdminNewClass('system.config');
$seoSer = AdminNewClass('system.seo');
$table = '@bbs_type';
*
*
* @bbs           http://www.weimengcms.com
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @package        WMCMS
* @version        $Id: bbs.type.php 2016年5月18日 9:53  weimeng
* 论坛版块处理器
*/
/**
//修改版块信息
//删除版块
?>
{
{
}
}
<?php
else if ( $type == 'del' )
if ( $type == 'edit' || $type == "add"  )
