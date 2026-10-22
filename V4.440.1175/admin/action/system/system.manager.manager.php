<?php
/**
* 后台管理员处理器
*
* @version        $Id: system.manager.manager.php 2016年4月6日 13:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@manager_manager';

if( Post('id') == '1')
{
	Ajax( 'ขออภัย! ไม่สามารถแก้ไขข้อมูลผู้ดูแลระบบได้' , 300);
}

if ( $type == 'edit' || $type == "add" )
{
	if ( $post['manager_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกบัญชีที่ใช้เข้าสู่ระบบก่อน',300);
	}
	//设置where条件
	$where['manager_id'] = Post('id');
	$post = str::Escape($post , 'e');
	
	unset($post['id']);

	//新增菜单
	if( $type == "add" )
	{
		//查询账号是否存在
		$wheresql['table'] = $table;
		$wheresql['where']['manager_name'] = $post['manager_name'];
		$count = wmsql::GetCount($wheresql);
		if ( $count > 0 )
		{
			Ajax('ขออภัย! มีบัญชีนี้อยู่แล้ว',300);
		}
		
		if ( $post['manager_psw'] != $post['manager_cpsw'] )
		{
			Ajax('ขออภัย! รหัสผ่านทั้งสองไม่ตรงกัน',300);
		}
		else if ( $post['manager_psw'] == '')
		{
			Ajax('ขออภัย! ต้องกรอกรหัสผ่านก่อน',300);
		}
		
		//加密密码
		$post['manager_salt'] = str::GetSalt();
		$post['manager_psw'] = str::E($post['manager_psw'],$post['manager_salt']);
		//删除重复密码
		unset($post['manager_cpsw']);
		
		$where['manager_id'] = WMSql::Insert($table, $post);

		//写入操作记录
		SetOpLog( 'เพิ่มบัญชีผู้ดูแล'.Post('manager_name') , 'system' , 'insert' , $table , $where , $post );
		
		Ajax('เพิ่มบัญชีผู้ดูแลสำเร็จ!');
	}
	//修改菜单
	else
	{
		//检查是否修改的是超级管理员账号
		$wheresql['table'] = $table;
		$wheresql['where'] = $where;
		$managerData = wmsql::GetOne($wheresql);
		if( Session( 'admin_cid') != '0' && $managerData['manager_cid'] == '0' )
		{
			Ajax('ขออภัย! คุณไม่สามารถแก้ไขรหัสผ่านของผู้ดูแลระบบ',300);
		}
		//判断修改密码
		else if ( $post['manager_psw'] != $post['manager_cpsw'] && $post['manager_psw'] != '')
		{
			Ajax('ขออภัย! รหัสผ่านทั้งสองไม่ตรงกัน',300);
		}
		//需要修改密码
		else if( $post['manager_psw'] != '' )
		{
			$post['manager_salt'] = str::GetSalt();
			$post['manager_psw'] = str::E($post['manager_psw'],$post['manager_salt']);
		}
		//否则删除密码
		else
		{
			unset($post['manager_psw']);
		}
		unset($post['manager_cpsw']);
		unset($post['manager_name']);
		
		//写入操作记录
		SetOpLog( 'แก้ไขบัญชีผู้ดูแล'.Post('manager_name') , 'system' , 'update' , $table , $where , $post );
		
		WMSql::Update($table, $post, $where);
		Ajax('แก้ไขบัญชีผู้ดูแลสำเร็จ!');
	}
}
//账号状态设置
else if ( $type == 'status' )
{
	if( $post['id'] == '1')
	{
		Ajax( 'ขออภัย! ไม่สามารถปิดใช้งานบัญชีผู้ดูแลระบบได้' , 300);
	}
	
	$status = str::CheckElse($post['status'], 0 , '0' , '1');
	$where['manager_id'] = $post['id'];
	$data['manager_status'] = $status;
	
	//状态判断
	switch ($status)
	{
		case "1":
			$statusText = 'กู้คืน';
			break;
				
		case "0":
			$statusText = 'ปิดใช้';
			break;
	}
	
	//写入操作记录
	SetOpLog( $statusText.'บัญชีผู้ดูแล' , 'system' , 'update' , $table , $where , $data );
	
	wmsql::Update($table, $data, $where);
	
	Ajax('บัญชีถูก'.$statusText.'แล้ว!');
}
//删除管理员账号
else if ( $type == 'del' )
{
	if( $post['id'] == '1')
	{
		Ajax( 'ขออภัย! ไม่สามารถลบบัญชีผู้ดูแลระบบได้' , 300);
	}
	$where['manager_id'] = $post['id'];

	//写入操作记录
	SetOpLog( 'ลบบัญชีผู้ดูแล' , 'system' , 'delete' , $table , $where);

	wmsql::Delete($table, $where);
	
	Ajax('ลบบัญชีผู้ดูแลสำเร็จ!');
}
?>