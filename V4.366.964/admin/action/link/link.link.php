<?php
/**
* 友链处理器
*
* @version        $Id: link.link.php 2016年5月13日 16:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$conSer = AdminNewClass('system.config');
$table = '@link_link';

//修改分类信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['link'], 'e' );
	$where = $post['id'];
	$data['link_lastintime'] = strtotime($data['link_lastintime']);
	$data['link_lastouttime'] = strtotime($data['link_lastouttime']);
	$data['link_jointime'] = strtotime($data['link_jointime']);

	if ( $data['link_name'] == '' || $data['link_url'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อและลิ้งก์เพื่อนบ้านก่อน',300);
	}
	else if( !str::Number($data['type_id']) )
	{
		Ajax('ขออภัย! ต้องเลือกหมวดหมู่เพื่อนบ้านก่อน',300);
	}
	else if ( !str::IsUrl($data['link_url']) )
	{
		Ajax('ขออภัย! รูปแบบลิ้งก์ไม่ถูกต้อง',300);
	}

	//友链名字检查
	$wheresql['table'] = $table;
	$wheresql['where']['link_id'] = array('<>',$where['link_id']);
	$wheresql['where']['link_name'] = $data['link_name'];
	if ( wmsql::GetCount($wheresql) > 0 )
	{
		Ajax('ขออภัย! มีข้อมูลเพื่อนบ้านนี้อยู่แล้ว',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$info = 'ยินดีด้วย! เพิ่มข้อมูลเพื่อนบ้านสำเร็จ';
		$where['link_id'] = wmsql::Insert($table, $data);
		
		//写入操作记录
		SetOpLog( 'เพิ่มข้อมูลเพื่อนล้าน'.$data['link_name'] , 'link' , 'insert' , $table , $where , $data );
	}
	//修改分类
	else
	{
		$info = 'ยินดีด้วย! แก้ไขข้อมูลเพื่อนบ้านสำเร็จ';
		wmsql::Update($table, $data, $where);
		
		//写入操作记录
		SetOpLog( 'แก้ไขข้อมูลเพื่อนบ้าน'.$data['link_name'] , 'link' , 'update' , $table , $where , $data );
	}

	//写入自定义字段
	$fieldArr['module'] = $curModule;
	$fieldArr['option'] = GetKey($post,'field');
	$fieldArr['tid'] = $data['type_id'];
	$fieldArr['cid'] = $where['link_id'];
	$fieldArr['ft'] = '2';
	$conSer->SetFieldOption($fieldArr);
	
	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'del' )
{
	$where['link_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบข้อมูลเพื่อนบ้าน' , 'link' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
	
	Ajax('ลบข้อมูลเพื่อนบ้านสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$data['link_status'] = Request('status');
	$where['link_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ตรวจสอบ';
	}
	else
	{
		$msg = 'ละทิ้ง';
	}
	//写入操作记录
	SetOpLog( $msg.'ข้อมูลเพื่อนบ้าน' , 'link' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('ข้อมูลเพื่อนบ้านถูก'.$msg.'แล้ว!');
}
//移动数据
else if ( $type == 'move' )
{
	$data['type_id'] = Request('tid');
	$where['link_id'] = GetDelId();

	//写入操作记录
	SetOpLog( 'ย้ายข้อมูลเพื่อนบ้าน' , 'link' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('ย้ายข้อมูลเพื่อนบ้านสำเร็จ!');
}
//属性操作
else if ( $type == 'attr' )
{
	$data['link_'.$post['attr']] = $post['val'];
	$where['link_id'] = GetDelId();
	
	switch($post['attr'])
	{
		case "rec":
			$msg = "เพื่อนบ้านแนะนำ";
			break;
			
		case "show":
			$msg = "แสดงเพื่อนบ้าน";
			break;
		  
		case "fixed":
			$msg = "เพื่อนบ้านเหนียวแน่น";
			break;
	}

	//写入操作记录
	SetOpLog( $msg, 'link' , 'update' , $table , $where);

	wmsql::Update($table, $data, $where);
	Ajax($msg);
}
//seo信息检查
else if ( $type == 'checkseo' )
{
	$httpSer = NewClass('http');
	$domain = Request('domain');
	
	/* Changed to support https */$html = $httpSer->GetUrl('https://seo.chinaz.com/?m=&host='.$domain);//Modified by SubMaRk

	$data['domain'] = $domain;
	$data['img'] = str::GetBetween('<span>น้ำหนัก Baidu : <\/span><a href="{a}src="{*}"', $html);

	Ajax( null , null , $data );
}
//回链检查
else if ( $type == 'checkback' )
{
	$httpSer = NewClass('http');
	$domain = strtolower(Request('domain'));
	$html = $httpSer->GetUrl($domain);

	//默认没有回链
	$data['domain'] = $domain;
	$data['back'] = 0;
	if( str_replace(WEB_URL, '', $html) != $html )
	{
		$data['back'] = 1;
	}
	
	Ajax(null,null,$data);
}
?>