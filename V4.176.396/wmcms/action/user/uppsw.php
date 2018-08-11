<?php
/**
* 修改密码操作处理
*
* @version        $Id: uppsw.php 2016年5月28日 22:59  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
FormTokenCheck();
FormCodeCheck('code_user_uppsw');

//是否登录了
str::EQ( user::GetUid() , 0 , $lang['user']['no_login'] );
$oldpsw = str::IsEmpty( Post('oldpsw') , $lang['user']['oldpsw_no']);
$newpsw = str::IsEmpty( Post('newpsw') , $lang['user']['newpsw_no']);
$renewpsw = str::IsEmpty( Post('renewpsw') , $lang['user']['repsw_no']);


//密码长度和密码格式
str::CheckLen( $newpsw , '6,16' , $lang['user']['psw_len']  );
str::NCN( $newpsw, $lang['user']['psw_err'] );
//两次密码是否相等
str::NEQ( $newpsw, $renewpsw , $lang['user']['psw_repsw'] );
//新旧密码是否相等
str::EQ( $oldpsw, $newpsw , $lang['user']['psw_newpsw'] );


//查询账号
$where['user_id'] = user::GetUid();
$data = $userMod->GetOne($where);

//密码加密
$oldpsw = str::E($oldpsw);
$newpsw = str::E($newpsw);


//旧密码正确
if( $data['user_psw'] == $oldpsw )
{
	//修改密码
	$result = $userMod->Save(array('user_psw'=>$newpsw));
	
	//退出账号
	Cookie('user_account','delete');
	
	//重新登录 的url
	
	//保存成功
	if( $result )
	{
		$info = GetInfo($lang['user']['operate']['uppsw'] , 'user_login');
		$code = 200;

		//表单token删除
		FormDel();
	}
	else
	{
		$info = $lang['user']['operate']['uppsw']['fail'];
		$code = 500;
	}
	
	ReturnData( $info , $ajax , $code);
}
//旧密码错误
else
{
	ReturnData( $lang['user']['oldpsw_err'] );
}

?>