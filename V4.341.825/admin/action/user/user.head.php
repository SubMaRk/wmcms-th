<?php
/**
* 用户头像处理器
*
* @version        $Id: user.head.php 2016年5月5日 21:25  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@user_head';

//修改分类信息
if ( $type == "add"  )
{
	$data['head_src'] = Request('head_src');

	if ( $data['head_src'] == '' )
	{
		Ajax('ขออภัย! ที่อยู่ไฟล์ต้องไม่ว่าง',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มรูปโปรไฟล์สำเร็จ';
		$where['head_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มรูปโปรไฟล์' , 'user' , 'insert' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'del')
{
	$where['table'] = $table;
	$where['where']['head_id'] = GetDelId();
	$data = wmsql::GetAll($where);
	
	if( $data )
	{
		foreach ($data as $k=>$v)
		{
			//删除头像
			$wheresql['head_id'] = $v['head_id'];
			wmsql::Delete($table , $wheresql);
			//删除文件
			file::DelFile('..'.$v['head_src']);
		}
	}
	//写入操作记录
	SetOpLog( 'ลบรูปโปรไฟล์' , 'user' , 'delete' , $table , $where);
	
	Ajax('ลบรูปโปรไฟล์สำเร็จ!');
}
?>