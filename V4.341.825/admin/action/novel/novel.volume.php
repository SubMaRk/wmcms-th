<?php
/**
* 小说分卷处理器
*
* @version        $Id: novel.volume.php 2016年4月28日 11:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@novel_volume';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	//小说数据
	$data = str::Escape( $post['volume'], 'e' );
	//条件
	$where['volume_id'] = $post['volume_id'];
	
	//小说名字检查
	$wheresql['table'] = '@novel_novel';
	$wheresql['where']['novel_name'] = $post['name'];
	$novelList = wmsql::GetAll($wheresql);
	//不存在小说
	if( count($novelList) == 0 )
	{
		Ajax('ขออภัย! ไม่มีนิยายเรื่องนี้อยู่',300);
	}
	//只有一条小说
	else if( count($novelList) == 1 )
	{
		$novelData = $novelList[0];
	}
	//小说大于一本，并且作者为空
	else if( GetKey($post,'author') == '' )
	{
		Ajax('ขออภัย! มีนิยายที่ใช้ชื่อเดียวกันอยู่แล้ว คุณต้องกรอกชื่อผู้แต่งนิยายด้วยเพื่อเพิ่มเล่ม',300);
	}
	else
	{
		foreach ($novelList as $k=>$v)
		{
			if($v['novel_author']==$post['author'])
			{
				$novelData = $novelList[$k];
				break;
			}
		}
		if( empty($novelData) )
		{
			Ajax('ขออภัย! ไม่พบชื่อผู้แต่งในนิยายเรื่องนี้ โปรดตรวจสอบว่าคุณกรอกถูกต้อง',300);	
		}
	}
	//设置分卷的小说id
	$data['volume_nid'] = $novelData['novel_id'];
	
	//分卷检查
	unset($wheresql);
	$wheresql['table'] = $table;
	$wheresql['where']['volume_id'] = array('<>',$where['volume_id']);
	$wheresql['where']['volume_name'] = $data['volume_name'];
	$wheresql['where']['volume_nid'] = $novelData['novel_id'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! มีนิยายชื่อนี้อยู่แล้ว',300);
	}
	
	
	//新增数据
	if( $type == 'add' )
	{
		$data['volume_time'] = time();
		
		$info = 'ยินดีด้วย! เพิ่มเล่มให้นิยายสำเร็จ';
		$where['volume_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มเล่มนิยาย'.$data['volume_name'] , 'novel' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		wmsql::Update($table, $data, $where);
		$info = 'ยินดีด้วย! แก้ไขเล่มให้นิยายสำเร็จ';

		//写入操作记录
		SetOpLog( 'แก้ไขเล่มนิยาย'.$data['volume_name'] , 'novel' , 'update' , $table , $where , $data );
	}
	
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['volume_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบเล่มนิยาย' , 'novel' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);

	Ajax('ลบเล่มของนิยายสำเร็จ!');
}
//获取分卷列表
else if ( $type == 'getvolume' )
{
	$where['table'] = $table;
	$where['where'] = Request();
	$where['order'] = 'volume_order desc';
	$data = wmsql::GetAll($where);
	Ajax('成功!',null,$data);
}
?>