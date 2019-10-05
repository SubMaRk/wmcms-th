<?php
/**
* 文章处理器
*
* @version        $Id: article.article.php 2016年4月17日 16:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//配置文件，删除数据方式是否是直接删除
$articleConfig = AdminInc('article');
$conSer = AdminNewClass('system.config');
$articleMod = NewModel('article.article');
$table = '@article_article';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$htmlMod = NewModel('system.html' , array('module'=>$curModule));
	$data = str::Escape( $post['article'], 'e' );
	$where['article_id'] = $post['article_id'];
	$data['article_simg'] = file::GetImg($data['article_simg'] , GetKey($post,'down_simg'));
	$data['article_addtime'] = strtotime($data['article_addtime']);
	$data['article_editor_id'] = Session('admin_id');
	
	if ( $data['article_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อบทความก่อน',300);
	}
	else if( !str::Number($data['type_id']) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่ก่อน',300);
	}
	else if( $data['article_author'] == '' || $data['article_source'] == ''  )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อผู้เขียนก่อน',300);
	}
	
	//获得文章简介
	$data['article_info']= str::GetContentInfo(GetKey($data,'article_content'),$data['article_info']);
	//获得文章缩略图
	$data['article_simg']= str::GetContentSimg(GetKey($data,'article_content'),$data['article_simg'],$articleConfig['default_simg']);

	//新增数据
	if( $type == 'add' )
	{
		if( $data['article_status'] == 1)
		{
			$data['article_examinetime'] = time();
		}
		//写入新文章作者和来源的数据
		$authorSer = AdminNewClass('article.author');
		$mangerSer = AdminNewClass('manager');
		//写入作者和来源
		$authorSer->SetData('a' , $data['article_author']);
		$authorSer->SetData('s' , $data['article_source']);
		$authorSer->SetData('e' , $data['article_editor']);
		//写入标签
		$mangerSer->SetTags('article' , $data['article_tags']);
		
		$info = 'ยินดีด้วย! เพิ่มบทความสำเร็จแล้ว';
		$where['article_id'] = $articleMod->Insert($data);

		//写入操作记录
		SetOpLog( 'เพิ่มบทความ'.$data['article_name'] , 'article' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขบทความสำเร็จแล้ว';
		$articleMod->Update($data,$where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขบทความ'.$data['article_name'] , 'article' , 'update' , $table , $where , $data );
	}

	//写入自定义字段
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = GetKey($post,'field');
	$fieldArr['tid'] = $data['type_id'];
	$fieldArr['cid'] = $where['article_id'];
	$fieldArr['ft'] = '2';
	$conSer->SetFieldOption($fieldArr);
	
	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor',$curModule , $where['article_id']);
	
	//创建HTML
	$htmlMod->CreateContentHtml($where['article_id']);

	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'del' || $type == 'realdel' )
{
	//删除数据到回收站
	if( $type == 'del' && $articleConfig['admin_del'] == '0' )
	{
		$where['article_id'] = GetDelId();
		$data['article_status'] = 2;
		
		//写入操作记录
		SetOpLog( 'ลบบทความชั่วคราว' , 'article' , 'delete' , $table , $where);
		wmsql::Update($table, $data, $where);
	}
	//永久删除数据
	else if( $type == 'realdel' || ( $type == 'del' && $articleConfig['admin_del'] == '1'  ))
	{
		$where['article_id'] = GetDelId();
		$articleMod->Delete($where);
		
		//解绑主题附件
		$uploadMod = NewModel('upload.upload');
		$uploadMod->module = 'author';
		$uploadMod->type = 'article';
		$uploadMod->cid = GetDelId();
		$uploadMod->UnFileBind();
		
		//写入操作记录
		SetOpLog( 'ลบบทความถาวร' , 'article' , 'delete' , $table , $where);
		
		//删除申请记录
		$applyMod = NewModel('system.apply');
		$applyWhere['apply_cid'] = GetDelId();
		$applyWhere['apply_module'] = 'author';
		$applyWhere['apply_type'] = array('or','article_editarticle,article_cover');
		$applyMod->Delete($applyWhere);
	}
	Ajax('ลบบทความแล้ว!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['article_status'] = Request('status');
	$where['article_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ตรวจสอบ';
	}
	else
	{
		$msg = 'ละทิ้ง';
	}
	//写入操作记录
	SetOpLog( $msg.'บทความ' , 'article' , 'update' , $table , $where);

	wmsql::Update($table, $data, $where);
	Ajax('บทความถูก'.$msg.'แล้ว!');
}
//还原数据
else if( $type == 'reduction' )
{
	$data['article_status'] = 1;
	$where['article_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'กู้คืนบทความ' , 'article' , 'update' , $table , $where);

	wmsql::Update($table, $data, $where);
	Ajax('บทความถูกกู้คืนกลับมาแล้ว!');
}
//移动数据
else if ( $type == 'move' )
{
	$data['type_id'] = Request('tid');
	$where['article_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ย้ายบทความ' , 'article' , 'update' , $table , $where);

	wmsql::Update($table, $data, $where);
	Ajax('ย้ายบทความสำเร็จแล้ว!');
}
//属性操作
else if ( $type == 'attr' )
{
	$data['article_'.$post['attr']] = $post['val'];
	$where['article_id'] = GetDelId();
	
	switch($post['attr'])
	{
		case "rec":
			$msg = "แนะนำ/เลิกแนะนำ";
			break;
		  
		case "head":
			$msg = "พาดหัว/เลิกพาดหัว";
			break;
		  
		case "strong":
			$msg = "เน้น/เลิกเน้น";
			break;
			
		case "display":
			$msg = "ซ่อน/แสดง";
			break;
	}

	//写入操作记录
	SetOpLog( $msg.'บทความ' , 'article' , 'update' , $table , $where);

	wmsql::Update($table, $data, $where);
	Ajax($msg.'บทความแล้ว!');
}
?>