<?php
/**
* 小说编辑审核处理器
*
* @version        $Id: author.nove.apply.php 2017年1月19日 22:13  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_apply';
$applyMod = NewModel('system.apply' , 'author');

//删除数据
if ( $type == 'del' )
{
	//配置文件，删除数据方式是否是直接删除
	$where['apply_id'] = GetDelId();
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_editnovel';
	//获得数据
	$data = $applyMod->GetAll($where);
	if( $data )
	{
		//写入操作记录
		SetOpLog( '删除了小说修改申请' , 'system' , 'delete' , $table , $where);
		$applyMod->Delete($where);
	}
	
	Ajax('ลบคำขอแก้ไขนิยายสำเร็จ!');
}
//清空记录
else if ( $type == 'clear' )
{
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_editnovel';
	$applyMod->Delete($where);
	//写入操作记录
	SetOpLog( '清空了小说申请记录' , 'system' , 'delete');
	Ajax('ล้างข้อมูลคำขอนิยายทั้งหมดสำเร็จ!');
}
//审核数据
else if ( $type == 'status' )
{
	$status = Request('status/i');
	if( $status == 0)
	{
		Ajax('ไม่สามารถเปลี่ยนเป็นสถานะยังไม่ตรวจสอบได้!');
	}
	else if( $status == 1)
	{
        $result = $applyMod->ApplyHandle(GetDelId(),1);
		//写入操作记录
		$msg = '取消审核';
		if( Request('status') == '1')
		{
			$msg = '审核通过';
		}
		SetOpLog( $msg.'了小说修改申请' , 'system' , 'update' , $table , array('apply_id'=>GetDelId()));
		Ajax('คำขอแก้ไขนิยาย'.$msg.'สำเร็จ!');
	}
}
?>