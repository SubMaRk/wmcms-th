<?php
/**
* 图集处理器
*
* @version        $Id: picture.picture.php 2016年5月15日 9:53  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$conSer = AdminNewClass('system.config');
$table = '@picture_picture';

//修改分类图集
if ( $type == 'edit' || $type == "add"  )
{
	$where = $post['id'];
	$data = str::Escape( $post['picture'], 'e' );
	$data['picture_time'] = strtotime($data['picture_time']);
	$data['picture_imgs'] = '';
	$data['picture_count'] = 0;
	$picArr = GetKey($post,'pic');
	if( !empty($picArr) )
	{
		$data['picture_imgs'] = serialize($picArr);
		$data['picture_count'] = count($picArr['src']);
	}
	
	if ( $data['picture_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อของอัลบั้มก่อน',300);
	}
	else if( !str::Number($data['type_id']) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่อัลบั้มก่อน',300);
	}

	//图集名字检查
	$wheresql['table'] = $table;
	$wheresql['where']['picture_id'] = array('<>',$where['picture_id']);
	$wheresql['where']['picture_name'] = $data['picture_name'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! ไม่มีอัลบั้มนี้อยู่',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		//写入标签
		$mangerSer = AdminNewClass('manager');
		$mangerSer->SetTags('picture' , $data['picture_tags']);
		
		$info = 'ยินดีด้วย! เพิ่มอัลบั้มสำเร็จ';
		$where['picture_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มอัลบั้ม'.$data['picture_name'] , 'picture' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขอัลบั้มสำเร็จ';
		wmsql::Update($table, $data, $where);

		//写入操作记录
		SetOpLog( 'แก้ไขอัลบั้ม'.$data['picture_name'] , 'picture' , 'update' , $table , $where , $data );
	}

	//写入自定义字段
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = GetKey($post,'field');
	$fieldArr['tid'] = $data['type_id'];
	$fieldArr['cid'] = $where['picture_id'];
	$fieldArr['ft'] = '2';
	$conSer->SetFieldOption($fieldArr);
	
	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor',$curModule , $where['picture_id']);
	
	//上传的文件描述重新写入
	$uploadSer = AdminNewClass('upload');
	$uploadSer->UpUpload( $picArr , 'picture' , $where['picture_id']);
	
	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'del' )
{
	$where['table'] = $table;
	$where['where']['picture_id'] = GetDelId();
	$data = wmsql::GetAll($where);
	if( $data )
	{
		$uploadSer = AdminNewClass('upload');
		
		foreach ($data as $k=>$v)
		{
			//删除图集记录
			$wheresql['picture_id'] = $v['picture_id'];
			wmsql::Delete($table , $wheresql);
			
			$uploadSer->DelUpload('app',$v['picture_id']);
		}
	}

	SetOpLog( 'ลบอัลบั้ม' , 'picture' , 'delete' , $table , $where['where']);
	Ajax('ลบอัลบั้มสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['picture_status'] = Request('status');
	$where['picture_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ตรวจสอบ';
	}
	else
	{
		$msg = 'ละทิ้ง';
	}
	//写入操作记录
	SetOpLog( $msg.'อัลบั้ม' , 'picture' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('อัลบั้มถูก'.$msg.'แล้ว!');
}
//移动数据
else if ( $type == 'move' )
{
	$data['type_id'] = Request('tid');
	$where['picture_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ย้ายอัลบั้ม' , 'picture' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('ย้ายอัลบั้มวำเร็จ!');
}
//属性操作
else if ( $type == 'attr' )
{
	$data['picture_'.$post['attr']] = $post['val'];
	$where['picture_id'] = GetDelId();
	
	switch($post['attr'])
	{
		case "rec":
			$msg = "แนะนำ";
			break;
	}

	//写入操作记录
	SetOpLog( $msg.'อัลบั้ม' , 'picture' , 'update' , $table , $where);

	wmsql::Update($table, $data, $where);
	Ajax($msg.'อัลบั้มแล้ว!');
}
?>