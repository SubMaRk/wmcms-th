<?php
/**
* 文章作者来源处理器
*
* @version        $Id: article.author.php 2016年4月22日 11:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@article_author';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape($post['author'] , 'e');
	$where = Post('id');

	if ( $data['author_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อก่อน',300);
	}
	else if( !str::Number($data['author_data']) )
	{
		Ajax('ขออภัย! ต้องกรอกลำดับก่อน',300);
	}

	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มผู้เขียนสำเร็จแล้ว';
		$where['author_id'] = wmsql::Insert($table, $data);

		//写入操作记录
		SetOpLog( 'เพิ่มผู้เขียนบทความ'.$data['author_name'] , 'article' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขผู้เขียนบทความสำเร็จแล้ว';
		wmsql::Update($table, $data, $where);

		//写入操作记录
		SetOpLog( 'แก้ไขผู้เขียนบทความ'.$data['author_name'] , 'article' , 'update' , $table , $where , $data );
	}

	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['author_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ลบผู้เขียนบทความ' , 'article' , 'delete' , $table , $where);

	wmsql::Delete($table , $where);
	Ajax('ลบผู้เขียนบทความสำเร็จแล้ว!');
}
?>
