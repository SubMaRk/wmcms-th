




	
	
	
	
	
		
		
		$info = '恭喜您，信息修改成功！';
		$info = '恭喜您，信息添加成功！';
		$where['about_id'] = wmsql::Insert($table, $data);
		//写入操作记录
		//写入操作记录
		Ajax('对不起，该信息已经存在！',300);
		Ajax('对不起，信息分类必须选择！',300);
		Ajax('对不起，信息标题必须填写！',300);
		SetOpLog( 'เพิ่มข้อมูล'.$data['about_name'] , 'about' , 'insert' , $table , $where , $data );
		SetOpLog( 'แก้ไขข้อมูล'.$data['about_name'] , 'about' , 'update' , $table , $where , $data );
		wmsql::Update($table, $data, $where);
	$conSer->SetFieldOption($fieldArr);
	$data = str::Escape( $post['about'], 'e' );
	$data['about_time'] = strtotime($data['about_time']);
	$data['type_id'] = Request('tid');
	$fieldArr['cid'] = $where['about_id'];
	$fieldArr['ft'] = '2';
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = @$post['field'];
	$fieldArr['tid'] = $data['type_id'];
	$uploadMod->UpdateCid( 'editor',$curModule , $where['about_id']);
	$uploadMod = NewModel('upload.upload');
	$where = $post['id'];
	$where['about_id'] = GetDelId();
	$where['about_id'] = GetDelId();
	$wheresql['table'] = $table;
	$wheresql['where']['about_id'] = array('<>',$where['about_id']);
	$wheresql['where']['about_name'] = $data['about_name'];
	//信息名字检查
	//修改编辑器上传的内容id
	//修改分类
	//写入自定义字段
	//写入操作记录
	//写入操作记录
	//新增数据
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
	Ajax('信息移动成功!');
	Ajax('信息删除成功!');
	Ajax($info);
	else
	else if( !str::Number($data['type_id']) )
	if ( $data['about_name'] == '' )
	if ( wmsql::GetCount($wheresql) > 0 )
	if( $type == 'add' )
	SetOpLog( '移动了信息' , 'about' , 'update' , $table , $where);
	SetOpLog( '删除了信息' , 'about' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
	wmsql::Update($table, $data, $where);
$conSer = AdminNewClass('system.config');
$table = '@about_about';
*
*
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @package        WMCMS
* @version        $Id: about.about.php 2016年5月13日 17:55  weimeng
* 信息处理器
*/
/**
//移动数据
//修改分类信息
//删除数据和永久删除数据
?>
{
{
{
}
}
}
<?php
else if ( $type == 'del' )
else if ( $type == 'move' )
if ( $type == 'edit' || $type == "add"  )
