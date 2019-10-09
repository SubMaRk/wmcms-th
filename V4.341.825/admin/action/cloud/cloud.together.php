<?php
/**
* 众研需求请求处理器
*
* @version        $Id: cloud.together.php 2019年01月25日 15:34  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cloudSer = NewClass('cloud');

//获得需求列表
if ( $type == 'getlist' )
{
	$page = str::Page(Request('page'));
	$tid = str::Int(Request('tid'));
	$pageCount = str::Int(Request('pagecount' , 20));
	$rs = $cloudSer->GetTogetherList($tid , $page , $pageCount);
	
	Ajax('请求成功！',200,$rs);
}
//提交新的需求
else if ( $type == 'add' )
{
	$domainShow = str::Int(Request('domainshow'));
	$title = str::IsEmpty(Request('title'),'ชื่อต้องไม่ว่าง!');
	$desc = str::IsEmpty(Request('desc'),'รายละเอียดต้องไม่ว่าง!');
	$rs = $cloudSer->TogetherAdd($domainShow, $title , $desc);

	//写入操作记录
	SetOpLog( 'ส่งความต้องการไปศูนย์คลาวด์' , 'system' , 'update' );
	Ajax('ส่งความต้องการสำเร็จ!',200,$rs);
}
//需求互动操作
else if ( $type == 'operation' )
{
	$id = str::Int(Request('id'));
	$need = str::Int(Request('need'));
	$rs = $cloudSer->TogetherOperation($id , $need);
	if( $rs['code'] == 200 )
	{
		Ajax('ดำเนินความต้องการสำเร็จ!',200);
	}
	else
	{
		Ajax($rs['msg'],300);
	}
}
?>