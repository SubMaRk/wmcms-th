





	
	
	
	
	
	
		
		
		$info = '恭喜您，信息分类修改成功！';
		$info = '恭喜您，信息分类添加成功！';
		$where['type_id'] = wmsql::Insert($table, $data);
		//删除当前分类的文章
		//写入操作记录
		//写入操作记录
		Ajax('对不起，该分类名已经存在！',300);
		Ajax('对不起，分类名字必须填写！',300);
		Ajax('对不起，分类排序必须为数字！',300);
		Ajax('对不起，所属分类必须选择！',300);
		SetOpLog( 'แก้ไขหมวดหมู่'.$data['type_name'] , 'about' , 'update' , $table , $where , $data );
		SetOpLog( 'เพิ่มหมวดหมู่ใหม่'.$data['type_name'] , 'about' , 'insert' , $table , $where , $data );
		wmsql::Delete('@about_about', array('type_id'=>$tid));
		wmsql::Update($table, $data, $where);
	$conSer->SetFieldOption($fieldArr);
	$data = str::Escape($post['type'] , 'e');
	$data['type_pid'] = GetPids( $table , $data['type_topid'] );
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = @$post['field'];
	$fieldArr['pid'] = $data['type_topid'];
	$fieldArr['tid'] = $where['type_id'];
	$seoSer->SetTypeHtml('about' , $post['html'] , $where['type_id']);
	$where['type_id'] = $post['type_id'];
	$where['type_id'] = GetDelId();
	$wheresql['table'] = $table;
	$wheresql['where']['type_id'] = array('<>',$where['type_id']);
	$wheresql['where']['type_name'] = $data['type_name'];
	//修改分类
	//友链名字检查
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
	{
	}
	}
	}
	}
	}
	}
	}
	Ajax('信息分类删除成功!');
	Ajax($info);
	DelType();
	else
	else if( !str::Number($data['type_order']) )
	else if( !str::Number($data['type_topid']) )
	function TypeDelCallBack($tid)
	if ( $data['type_name'] == '' )
	if ( wmsql::GetCount($wheresql) > 0 )
	if( $type == 'add' )
	SetOpLog( '删除了信息分类' , 'about' , 'delete' , $table , $where);
$conSer = AdminNewClass('system.config');
$seoSer = AdminNewClass('system.seo');
$table = '@about_type';
*
*
* @about           http://www.weimengcms.com
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @package        WMCMS
* @version        $Id: about.type.php 2016年5月13日 17:00  weimeng
* 信息分类处理器
*/
/**
//修改分类信息
//删除分类
?>
{
{
}
}
<?php
else if ( $type == 'del' )
if ( $type == 'edit' || $type == "add"  )
