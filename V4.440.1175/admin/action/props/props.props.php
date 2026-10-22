<?php
/**
* 道具处理器
*
* @version        $Id: props.props.php 2017年3月5日 20:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$curModule = 'author';
$table = '@props_props';
$propsMod = NewModel('props.props');
$uploadSer = AdminNewClass('upload');

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['props'], 'e' );
	$where = $post['id'];
	$data['props_time'] = strtotime($data['props_time']);
	$data['props_option'] = serialize($post['option']);
	if ( $data['props_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อไอเท็มก่อน',300);
	}
	else if( !str::Number($data['props_type_id']) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่ไอเท็มก่อน',300);
	}
	else if( !is_numeric($data['props_gold1']) || !is_numeric($data['props_gold2']) || !is_numeric($data['props_money']) )
	{
		Ajax('ขออภัย! ราคาที่ขายต้องเป็นตัวเลขเท่านั้น',300);
	}
	else if( $data['props_gold1'] == 0 && $data['props_gold2'] == 0 && $data['props_money'] == 0 )
	{
		Ajax('ขออภัย! ราคาที่ขายทั้งหมดต้องไม่เท่ากับ 0',300);
	}
	
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มไอเท็มสำเร็จ';
		$where['props_id'] = wmsql::Insert($table, $data);
		//修改最后上传的图片数据
		$uploadSer->UpLast( 'author', 'props' , $where['props_id'] , 'รูปภาพไอเท็ม');
		//写入操作记录
		SetOpLog( 'เพิ่มไอเท็ม'.$data['props_name'] , $curModule , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขไอเท็มสำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขไอเท็ม'.$data['props_name'] , $curModule , 'update' , $table , $where , $data );
	}
	Ajax($info);
}
//永久删除数据
else if ( $type == 'del' )
{
	$where['props_id'] = GetDelId();
	//查询数据
	$data = $propsMod->GetAll($where);
	if( $data )
	{
		foreach ($data as $k=>$v)
		{
			//删除数据
			$propsMod->DeleteById($v['props_id']);
			//删除图片
			$uploadSer->DelUpload('props',$v['props_id']);
		}
		//写入操作记录
		SetOpLog( 'ลบไอเท็ม' , $curModule , 'delete' , $table , $where);
	}
	Ajax('ลบไอเท็มสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['props_status'] = Request('status');
	$where['props_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'บนชั้น';
	}
	else
	{
		$msg = 'ได้รับ';
	}
	//写入操作记录
	SetOpLog( $msg.'ไอเท็ม' , $curModule , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('ไอเท็ม'.$msg.'แล้ว!');
}
?>