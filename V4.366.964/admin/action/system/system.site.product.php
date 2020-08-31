<?php
/**
* 站群配置处理器
*
* @version        $Id: system.site.product.php 2017年6月11日 15:00  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@site_product';
$siteMod = NewModel('system.site');

//修改、测试配置信息
if ( $type == 'edit' || $type == "add" )
{
	$data = str::Escape($post['data'] , 'e');
	$where['product_id'] = Request('product_id');
	foreach ($data as $k=>$v)
	{
		if( $v == '' )
		{
			Ajax('ขออภัย! ฟิลด์ทั้งหมดต้องไม่ว่าง' , 300);
		}
	}
	
	//小说名字检查
	$wheresql['product_id'] = array('<>',$where['product_id']);
	$wheresql['product_domain'] = $data['product_domain'];
	if( $siteMod->ProGetOne($wheresql) )
	{
		Ajax('ขออภัย! มีชื่อโดเมนเว็บไซต์อยู่แล้ว' , 300);
	}
	//如果是新增
	else if ( $type == 'add' )
	{
		//插入记录
		$where['product_id'] = $siteMod->ProInsert($data);
		//写入操作记录
		SetOpLog( 'เพิ่มเว็บไซต์ภายนอก'.$data['product_title'] , 'system' , 'insert' , $table , $where , $data );
		Ajax('เพิ่มเว็บไซต์ภายนอกสำเร็จ!');
	}
	//如果是增加页面
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขเว็บไซต์ภายนอก' , 'system' , 'update' , $table  , $where , $data );
		//修改数据
		$siteMod->ProUpdate($data,$where);
		Ajax('แก้ไขเว็บไซต์ภายนอกสำเร็จ!');
	}
}
//测试站外站点通讯
else if ( $type == 'test' )
{
	$data = str::Escape($post['data'] , 'e');
	foreach ($data as $k=>$v)
	{
		if( $v == '' )
		{
			Ajax('ขออภัย! ฟิลด์ทั้งหมดต้องไม่ว่าง' , 300);
		}
	}
	$siteSer = AdminNewClass('system.site');
	$rs = $siteSer->GetJson($data);
	if( GetKey($rs,'statusCode') == '200' )
	{
		Ajax('ยินดีด้วย! การเชื่อมต่อพื้นหลังสำเร็จ');
	}
	else
	{
		if(!is_array($rs) )
		{
			Ajax('ทดสอบเชื่อมต่อล้มเหลว เหตุผลที่ผิดพลาด : ที่อยู่พื้นหลังผิดพลาดหรือไม่ได้ใช้ระบบ WMCMS' , 300);
		}
		else
		{
			Ajax('ทดสอบเชื่อมต่อล้มเหลว เหตุผลที่ผิดพลาด : '.$rs['message'] , 300);
		}
	}
}
//删除站外站点
else if ( $type == 'del' )
{
	$where['product_id'] = GetDelId();
	$siteMod->ProDel($where);
	//写入操作记录
	SetOpLog( 'ลบเว็บไซต์ภายนอก' , 'system' , 'delete' , $table , $where);
	Ajax('ลบเว็บไซต์ภายนอกสำเร็จ!');
}
//清空站外站点
else if ( $type == 'clear' )
{
	$siteMod->ProDel();
	//写入操作记录
	SetOpLog( 'ล้างเว็บไซต์ภายนอก' , 'system' , 'delete' , $table , $where);
	Ajax('ล้างเว็บไซต์ภายนอกสำเร็จ!');
}
//使用禁用站点
else if ( $type == 'status' )
{
	$data['product_status'] = Request('status');
	$where['product_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ใช้งาน';
	}
	else
	{
		$msg = 'เลิกใช้';
	}
	$siteMod->ProUpdate($data,$where);
	
	//写入操作记录
	SetOpLog( 'เว็บไซต์ถูก'.$msg , 'system' , 'update' , $table , $where);
	Ajax('เว็บไซต์ถูก'.$msg'แล้ว');
}
?>