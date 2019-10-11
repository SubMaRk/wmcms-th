<?php
/**
* 管理员账号处理器
*
* @version        $Id: system.safe.account.php 2016年4月6日 16:11  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@manager_manager';

//修改管理员账号
if ( $type == 'uppsw' )
{
	if ( $post['bpsw'] == '' )
	{
		Ajax( 'ขออภัย! ต้องกรอกรหัสผ่านเดิมก่อน' , 300 );
	}
	else if( $post['psw'] == '' )
	{
		Ajax( 'ขออภัย! ต้องกรอกรหัสผ่านใหม่ก่อน' , 300 );
	}
	else if( $post['psw'] != $post['cpsw'] )
	{
		Ajax( 'ขออภัย! รหัสผ่านทั้งสองไม่ตรงกัน' , 300 );
	}
	
	//检查原始密码是否一致
	$where['table'] = $table;
	$where['where']['manager_id'] = Session('admin_id');
	$data = wmsql::GetOne( $where );
	
	if ( $data['manager_psw'] == str::E($post['bpsw'],$data['manager_salt']) )
	{
		$data['manager_salt'] = str::GetSalt();
		$data['manager_psw'] = str::E($post['psw'],$data['manager_salt']);
		wmsql::Update($table, $data, $where['where']);

		//写入操作记录
		SetOpLog( 'แก้ไขรหัสผ่านบัญชี' , 'system' , 'update');
		
		Session( 'admin_account' , 'delete' );
		Ajax('เปลี่ยนรหัสผ่านสำเร็จ! โปรดเข้าสู่ระบบใหม่อีกครั้ง');
	}
	else
	{
		Ajax( 'ขออภัย! รหัสผ่านเดิมไม่ถูกต้อง' , 300 );
	}
}
?>