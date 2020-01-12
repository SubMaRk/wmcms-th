<?php
/**
* 静态计划处理器
*
* @version        $Id: system.seo.html.php 2019年02月27日 14:42  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$planMod = NewModel('system.plan');
//添加计划
if ( $type == 'add' )
{
	$data = $post['data'];
	
	if( $data['plan_name'] == '' || $data['plan_url'] == '' || $data['plan_path'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกฟิลด์ทั้งหมดก่อน',300);
	}
	else if( !str::CheckUrl($data['plan_url']) )
	{
		Ajax('รูปแบบลิ้งก์ไม่ถูกต้อง โปรดกรอกลิ้งก์แบบเต็ม ตัวอย่าง ：https://nay-noi.com',300);
	}
	//保存文件格式检测
	else if( count(explode('.', $data['plan_path'])) < 2 )
	{
		Ajax('ขออภัย! รูปแบบการจัดเก็บไม่ถูกต้อง ต้องกรอกชื่อต่อท้ายด้วย',300);
	}
	//保存路径重复检测
	else if( $planMod->GetOne(array('plan_path'=>$data['plan_path'])) )
	{
		Ajax('ขออภัย! มีที่ตั้งในการจัดเก็บแล้ว',300);
	}
	//计划名字重复检测
	else if( $planMod->GetOne(array('plan_name'=>$data['plan_name'])) )
	{
		Ajax('ขออภัย! มีชื่อแผนแบบคงที่อยู่แล้ว',300);
	}
	else
	{
		$planMod->Insert($data);
		//写入操作记录
		SetOpLog( 'เพิ่มแผนแบบคงที่'.$data['plan_name'] , 'system' , 'insert');
		Ajax('เพิ่มแผนแบบคงที่สำเร็จ!');
	}
}
//删除计划
else if ( $type == 'del' )
{
	$planMod->Delete(GetDelId());
	//写入操作记录
	SetOpLog( 'ลบแผนแบบคงที่' , 'system' , 'delete');
	Ajax('ลบแผนแบบคงที่สำเร็จ!');
}
//运行静态计划
else if( $type == 'run' )
{
	$id = Request('id');
	$data = $planMod->GetById($id);
	if( !$data )
	{
		Ajax('ขออภัย! ไม่มีแผนนี้อยู่',300);
	}
	else
	{
		$httpSer = NewClass('http');
		//保存文件
		$html = $httpSer->GetUrl($data['plan_url'],json_decode($data['plan_data'], true));
		file::CreateFile(WMROOT.$data['plan_path'], $html , 1);
		//修改最后运行时间
		$planMod->UpLastTime($id);
		
		//写入操作记录
		SetOpLog( 'แผนแบบคงที่'.$data['plan_path'] , 'system' , 'insert');
		Ajax('แผนทำงานอัตโนมัติถูกจัดเก็บไว้ที่ '.$data['plan_path'].' สำเร็จ!');
	}
}
?>