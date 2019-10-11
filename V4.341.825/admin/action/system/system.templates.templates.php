<?php
/**
* 后台新增预设模版处理器
*
* @version        $Id: system.templates.templates.php 2016年4月8日 13:13  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_templates';

if ( $type == 'edit' || $type == "add" )
{
	$where = $post['id'];
	$temp = str::Escape($post['temp'] , 'e');
	
	if ( $temp['temp_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อเทมเพลตก่อน',300);
	}
	
	//新增菜单
	if( $type == 'add' )
	{
		//查询账号是否存在
		$wheresql['table'] = $table;
		$wheresql['where']['temp_name'] = $temp['temp_name'];
		$wheresql['where']['temp_module'] = $temp['temp_module'];
		$wheresql['where']['temp_type'] = $temp['temp_type'];
		$count = wmsql::GetCount($wheresql);
		if ( $count > 0 )
		{
			Ajax('ขออภัย! มีเทมเพลตนี้อยู่แล้ว',300);
		}
		
		$data['id'] = WMSql::Insert($table, $temp);
		$data['name'] = $temp['temp_name'];

		//写入操作记录
		SetOpLog( 'เพิ่มเทมเพลต' , 'system' , 'insert' , $table , array('temp_id'=>$data['id']) , $data );
		Ajax('เพิ่มเทมเพลตสำเร็จ!',null,$data);
	}
	//修改菜单
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขเทมเพลต' , 'system' , 'update' , $table , $where , $temp );
		WMSql::Update($table, $temp, $where);
		Ajax('แก้ไขเทมเพลตสำเร็จ!');
	}
}
//ajax获取每个模块的分类
else if( $type == 'gettype' )
{
	$val = Get('val');
	$tempSer = AdminNewClass('system.templates');
	//选中的类型
	$dataArr = $tempSer->GetTempType($val);
	
	Ajax(null,null,$dataArr);
}
//删除数据
else if ( $type == 'del' )
{
	$where['temp_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบเทมเพลต' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
		
	Ajax('ลบเทมเพลตสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	wmsql::Delete($table);

	//写入操作记录
	SetOpLog( 'ล้างเทมเพลต' , 'system' , 'delete');
	Ajax('ล้างเทมเพลตสำเร็จ!');
}
//删除静态资源操作
else if ( $type == 'delstatic' )
{
	$id = Request('id');
	$path = Request('path');
	if( $id == '' || $path == '' )
	{
		Ajax('ขออภัย! รูปแบบไอดีและทรัพยากรแบบคงที่ของเทมเพลตค่าเริ่มต้นต้องไม่ว่าง' , 300);
	}
	else if( str::in_string('../',$path,1) || str::in_string('..',$path,1))
	{
		Ajax('ขออภัย! ที่ตั้งทรัพยากรแบบคงที่ไม่ถูกต้อง' , 300);
	}
	file::DelDir(WMSTATIC.$id.'/'.$path);
	//写入操作记录
	SetOpLog( 'ไอดีที่ลบ = '.$id.' ทรัพยากรแบบคงที่ของเทมเพลตค่าเริ่มต้น' , 'system' , 'delete');
	Ajax('ลบทรัพยากรแบบคงที่ของเทมเพลตค่าเริ่มต้นสำเร็จ!');
}
?>