<?php
/**
* 充值卡使用操作操作
*
* @version        $Id: card_charge.php 2017年4月2日 22:41  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//使用账号类型
$accountType = str::Int( Request('accounttype' , 0) );
//对好友使用的账号
$account = Request('account');
//重复
$reAccount = Request('reaccount');
//充值金额
$money = str::Int(Request('money'));
//支付方式
$payType = Request('paytype','alipay');
$apiData = C('config.api.'.$payType);

//充值金额是否存在
if( $money <= 0 )
{
	ReturnData( $lang['finance']['action']['pay_money_no'] , $ajax );
}
//如果为好友充值则判断账号是否正确
else if ( $accountType == 1 && ( $account != $reAccount || $account == '' ) )
{
	ReturnData( $lang['finance']['action']['account_err'] , $ajax );
}
//查询充值方式是否存在
else if( $payType == '' || !is_array($apiData) )
{
	ReturnData( $lang['finance']['action']['pay_no'] , $ajax );
}
//已经关闭了
else if( $apiData['api_open'] != '1' )
{
	ReturnData( $lang['finance']['action']['pay_close'] , $ajax );
}
//数据正常
else
{
	//引入公共支付类
	$paySer = NewClass('pay');

	//设置参数
	$data['pay_type'] = $payType;
	$data['uid'] = $uid;
	$data['money'] = $money;
	$data['is_first'] = user::GetIsCharge();
	if( $accountType == '1' )
	{
		$data['account'] = $account;
	}
	$result = $paySer->Order($data);
	if( $result === false )
	{
		ReturnData( $lang['finance']['action']['pay_apino'] , $ajax );
	}
}
?>