<?php
/**
* 小说推荐处理器
*
* @version        $Id: novel.rec.php 2016年4月28日 10:31  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@novel_rec';

if( $type == 'edit' || $type == "add" )
{
	$recSer = AdminNewClass('novel.rec');
	
	$data = str::Escape( $post['rec'], 'e' );
	
	$where['table'] = $table;
	$where['where']['rec_id'] = $post['rec_id'];
	$arr = wmsql::GetOne($where);
	
	//修改分类
	if( $type == 'add' )
	{
	
	}
	else
	{
		$info = 'ยินดีด้วย! แก้ไขนิยายแนะนำสำเร็จ';
		//写入操作记录
		SetOpLog( 'แก้ไขนิยายแนะนำ', 'novel' , 'update' , $table , $where , $data );
	}

	//修改小说推荐-先检查是否存在推荐的信息
	$recSer->SetRec( $arr['rec_nid'] , $data , false);
	
	Ajax($info);
}
//推荐操作
else if ( $type == 'rec' )
{
	$recSer = AdminNewClass('novel.rec');
	$rec = Request('rec');
	$val = Request('val');
	$data['rec_'.$rec] = $val;
	$where['rec_nid'] = GetDelId();
	//判断是否是多个小说
	if( !is_array($where['rec_nid']) )
	{
		$recSer->SetRec( $where['rec_nid'] , $data , true);
	}
	else
	{
		foreach (explode(',', $where['rec_nid'][1]) as $v)
		{
			$recSer->SetRec( $v , $data , true);
		}
	}

	switch($rec)
	{
		case "icr":
			$msg = "แนะนำที่หน้าหลัก";
	  		break;
	  		
		case "ibr":
			$msg = "แนะนำพิเศษ";
	  		break;
	  		
		case "ir":
			$msg = "แนะนำที่หน้าหลัก";
	  		break;
	  		
		case "ccr":
			$msg = "แนะนำในหน้าหลักหมวดหมู่";
	  		break;
	  		
		case "cbr":
			$msg = "แนะนำในหมวดหมู่พิเศษ";
	  		break;
	  		
		case "cr":
			$msg = "แนะนำในหมวดหมู่";
	  		break;
	}
	//操作类型设置
	switch($val)
	{
		case 0:
			$type = "ยกเลิก";
	  		break;
	  		
		default:
			$type = "กำหนด";
	  		break;
	}
	
	//写入操作记录
	SetOpLog( $type.'นิยาย'.$msg , 'novel' , 'update' , $table , $where);

	Ajax($type.'นิยาย'.$msg);
}
//删除推荐
else if ( $type == 'del' )
{
	$where['rec_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบนิยายแนะนำ' , 'novel' , 'delete' , $table , $where);

	//删除分类
	wmsql::Delete($table, $where);
	
	Ajax('ลบนิยายแนะนำสำเร็จ!');
}
?>