<?php
/**
* 小说限时免费处理器
*
* @version        $Id: novel.timelimit.php 2018年8月27日 21:36  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$limitMod = NewModel('novel.timelimit');
$table = '@novel_timelimit';

if( $type == 'edit' || $type == "add" )
{
	$data = str::Escape( $post['timelimit'], 'e' );
	
	//默认id条件
	$where['timelimit_id'] = $post['timelimit_id'];
	//默认数据时间转换
	$data['timelimit_starttime'] = strtotime(GetKey($data,'timelimit_starttime'));
	$data['timelimit_endtime'] = strtotime(GetKey($data,'timelimit_endtime'));
	
	//检查参数
	if( !str::Number($data['timelimit_order']) )
	{
		Ajax('ขออภัย! ลำดับนิยายต้องเป็นตัวเลขเท่านั้น',300);
	}
	else if( !str::Number($data['timelimit_nid']) )
	{
		Ajax('ขออภัย! ไอดีนิยายต้องไม่ว่าง',300);
	}
	else if( $data['timelimit_starttime']>$data['timelimit_endtime'] )
	{
		Ajax('ขออภัย! เวลาเริ่มต้นต้องไม่มากกว่าเวลาสิ้นสุด',300);
	}
	
	//添加限时免费
	if( $type == 'add' )
	{
		$limitData = $limitMod->GetByNid($data['timelimit_nid']);
		if ( $limitData )
		{
			Ajax('ขออภัย! นิยายเรื่องนี้ถูกกำหนดเวลาให้อ่านได้ฟรี',300);
		}
		else
		{
			$where['timelimit_id'] = $limitMod->Insert($data);
			$info = 'ยินดีด้วย! นิยายเรื่องนี้ถูกกำหนดเวลาให้อ่านได้ฟรีแล้ว';
			//写入操作记录
			SetOpLog( 'กำหนดเวลาอ่านฟรี', $curModule , 'insert' , $table , $where , $data );
		}
	}
	else
	{
		wmsql::Update($table, $data, $where);
		$info = 'ยินดีด้วย! นิยายเรื่องนี้ถูกแก้ไขเวลาให้อ่านได้ฟรีแล้ว';
		//写入操作记录
		SetOpLog( 'แก้ไขเวลาอ่านฟรี', $curModule , 'update' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除推荐
else if ( $type == 'del' )
{
	$where['timelimit_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบเวลาอ่านฟรี' , 'novel' , 'delete' , $table , $where);
	//删除分类
	wmsql::Delete($table, $where);
	
	Ajax('นิยายเรื่องนี้ถูกลบเวลาให้อ่านได้ฟรีแล้ว!');
}
?>