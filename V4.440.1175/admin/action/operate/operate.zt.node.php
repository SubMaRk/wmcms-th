<?php
/**
* 专题节点节点页面处理器
*
* @version        $Id: operate.zt.node.php 2016年5月10日 11:29  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@zt_node';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['node'], 'e' );
	$data['node_label'] = $post['node']['node_label'];
	$where = $post['id'];
	
	if ( $data['node_name'] == '' || $data['node_pinyin'] == '')
	{
		Ajax('ขออภัย! ชื่อกระทู้และไอดีกระทู้ต้องไม่ว่าง',300);
	}
	
	//节点标识检查
	$wheresql['table'] = $table;
	$wheresql['where']['node_zt_id'] = $data['node_zt_id'];
	$wheresql['where']['node_id'] = array('<>',$where['node_id']);
	$wheresql['where']['node_pinyin'] = $data['node_pinyin'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! ไอดีปัจจุบันถูกใช้งานอยู่',300);
	}
	
	
	//新增数据
	if( $type == 'add' )
	{
		$data['node_time'] = time();
		$info = 'ยินดีด้วย! เพิ่มกระทู้สำเร็จ';
		$where['node_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มกระทู้'.$data['node_name'] , 'zt' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขกระทู้สำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขกระทู้'.$data['node_name'] , 'zt' , 'update' , $table , $where , $data );
	}
	//修改编辑器上传的内容id
	$uploadMod = NewModel('upload.upload');
	$uploadMod->UpdateCid( 'editor','operate_ztnode' , $where['node_id']);
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['node_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบกระทู้' , 'zt' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
		
	Ajax('ลบกระทู้สำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	$zid = Request('zid');
	if( $zid == '' )
	{
		Ajax('ขออภัย! คุณต้องเลือกกระทู้ก่อน',300);
	}
	$where['node_zt_id'] = $zid;
	wmsql::Delete( $table , $where);

	//写入操作记录
	SetOpLog( 'ล้างกระทู้' , 'zt' , 'delete');
	Ajax('ล้างกระทู้สำเร็จ!');
}
?>