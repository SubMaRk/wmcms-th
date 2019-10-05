<?php
/**
* 厂商厂商处理器
*
* @version        $Id: app.firms.php 2016年5月17日 17:30  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @app           http://www.weimengcms.com
*
*/
$table = '@app_firms';

//修改分类厂商
if ( $type == 'edit' || $type == "add"  )
{
	$firmsSer = AdminNewClass('app.firms');
	$data = str::Escape( $post['firms'], 'e' );
	$where = $post['id'];

	if ( $data['firms_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อผู้ขายก่อน',300);
	}
	else if( $data['firms_type'] == '' )
	{
		Ajax('ขออภัย! ต้องเลือกประเภทผู้ขายก่อน',300);
	}
	
	//检查厂商是否存在
	$firmsWhere['firms_name'] = $data['firms_name'];
	$firmsWhere['firms_id'] = array('<>',$where['firms_id']);
	if ( $firmsSer->CheckName($firmsWhere) !== false )
	{
		Ajax('ขออภัย! มีผู้ขายนี้อยู่แล้ว',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$data['firms_addtime'] = time();
		$where['firms_id'] = wmsql::Insert($table, $data);

		$info = 'ยินดีด้วย! เพิ่มข้อมูลผู้ขายใหม่แล้ว';
		//写入操作记录
		SetOpLog( 'เพิ่มข้อมูลผู้ขาย'.$data['firms_name'] , 'app' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		wmsql::Update($table, $data, $where);

		$info = 'ยินดีด้วย! แก้ไขข้อมูลผู้ขายแล้ว';
		//写入操作记录
		SetOpLog( 'แก้ไขข้อมูลผู้ขาย'.$data['firms_name'] , 'app' , 'update' , $table , $where , $data );
	}
	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor',$curModule , $where['firms_id']);
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['firms_id'] = GetDelId();
	wmsql::Delete($table , $where);

	SetOpLog( 'ลบข้อมูลผู้ขาย' , 'app' , 'delete' , $table , $where);
	Ajax('ลบข้อมูลผู้ขายแล้ว!');
}
//厂商搜索操作
else if ( $type == 'search' )
{
	$st = Request('st');
	$keyword = Request('keyword');
	//返回类型。默认全部，否则是键值对
	$rt = Request('rt');
	
	$where['table'] = $table;
	//判断是否搜索标题
	switch ($st)
	{
		default:
			$where['where']['firms_name'] = array('like',$keyword);
			break;
	}
	$where['limit'] = '0,20';
	
	$data = wmsql::GetAll($where);
	if( $data && $rt == 'key')
	{
		foreach ($data as $k=>$v)
		{
			if( $v['firms_type'] == 'a')
			{
				$typeName = '开发商';
			}
			else if( $v['firms_type'] == 'o')
			{
				$typeName = '运营商';
			}
			else
			{
				$typeName = '自研自营';
			}
			$data[$k] = array('key'=>$v['firms_id'],'val'=>$typeName.' - '.$v['firms_name']);
		}
	}

	Ajax('เรียกข้อมูลสำเร็จแล้ว!',null,$data);
}
?>