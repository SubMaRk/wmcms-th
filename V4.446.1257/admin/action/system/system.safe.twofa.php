<?php
/**
* 管理员两步验证（TOTP）处理器
*
* t=start  生成密钥并返回 otpauth 链接（还不生效，需要下一步验证）
* t=enable 用验证码确认并保存
* t=disable 关闭两步验证
*
* @package        WMCMS
*/
$twofaMod = NewModel('system.twofa');
$managerId = Session('admin_id');

if( $managerId == '' )
{
	Ajax( 'ไม่พบข้อมูลผู้ดูแลระบบ กรุณาเข้าสู่ระบบใหม่' , 300 );
}

//生成新密钥
if ( $type == 'start' )
{
	$secret = TotpSecret();
	//只放进 session：确认验证码之前不写库，避免中途放弃后把自己锁在外面
	Session('admin_twofa_pending', $secret);
	$account = Session('admin_name');
	$uri = 'otpauth://totp/'.rawurlencode((string)C('config.web.web_name')).':'.rawurlencode((string)$account)
		.'?secret='.$secret.'&issuer='.rawurlencode((string)C('config.web.web_name')).'&period=30&digits=6';
	Ajax( $secret , 200 , array('secret'=>$secret,'uri'=>$uri) );
}
//确认并启用
else if ( $type == 'enable' )
{
	$code = Post('code');
	$secret = Session('admin_twofa_pending');
	if( $secret == '' )
	{
		Ajax( 'กรุณาสร้างคีย์ก่อน' , 300 );
	}
	if( !TotpVerify($secret, $code) )
	{
		Ajax( '驗證碼ไม่ถูกต้อง' , 300 );
	}
	$twofaMod->SaveSecret($managerId, $secret);
	Session('admin_twofa_pending','delete');
	SetOpLog( 'เปิดใช้งานการยืนยันตัวตนสองขั้นตอน' , 'system' , 'update' );
	Ajax( 'เปิดใช้งานการยืนยันตัวตนสองขั้นตอนแล้ว' );
}
//关闭
else if ( $type == 'disable' )
{
	$code = Post('code');
	$secret = $twofaMod->GetSecret($managerId);
	if( $secret != '' && !TotpVerify($secret, $code) )
	{
		Ajax( '驗證碼ไม่ถูกต้อง' , 300 );
	}
	$twofaMod->DeleteSecret($managerId);
	SetOpLog( 'ปิดการยืนยันตัวตนสองขั้นตอน' , 'system' , 'update' );
	Ajax( 'ปิดการยืนยันตัวตนสองขั้นตอนแล้ว' );
}
?>
