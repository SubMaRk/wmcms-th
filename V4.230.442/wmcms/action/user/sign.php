<?php
/**
* 签到操作处理
*
* @version        $Id: sign.php 2016年5月28日 22:21  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$uid = user::GetUid();
//是否登录了
str::EQ( $uid , 0 , $lang['user']['no_login'] );
//签到已经关闭
str::EQ( $userConfig['sign_open'] , 0 , $lang['user']['sign_close'] );


//查询签到信息
$signMod = NewModel('user.sign');
$ticketMod = NewModel('user.ticket');

//获取用户的签到信息
$signMod->userId = user::GetUid();
$signData = $signMod->GetLastOne();

//如果没有签到记录就插入一条
if ( !$signData )
{
	$result = $signMod->Insert();
}
//有签到记录就修改
else
{
	//如果签到时间大于今0点就已经签到了
	if ( $signData['sign_time'] > strtotime('today') )
	{
		ReturnData( $lang['user']['sign_exist'] , $ajax );
	}


	//如果是连续签到
	if( date("Ymd",time())-1 == date("Ymd",$signData['sign_time']) )
	{
		$data['sign_con'] = $signData['sign_con']+1;
	}
	//不是就重置为1
	else
	{
		$data['sign_con'] = 1;
	}
	//修改的数据
	$data['sign_sum'] = $signData['sign_sum']+1;
	$data['sign_pretime'] = $signData['sign_time'];
	$data['sign_prerank'] = $signData['sign_rank'];
	//今日签到排名
	$data['sign_rank'] = $signMod->GetCount(array('sign_time'=>strtotime(date('Y-m-d'))))+1;
	$data['sign_time'] = time();
	//保存修改数据
	$result = $signMod->Save($data);
}


//每日签到奖励是否开启
if( $userConfig['sign_open'] == '1' )
{
	//更新奖励操作
	$rewardData['gold1'] = $userConfig['sign_gold1'];
	$rewardData['gold2'] = $userConfig['sign_gold2'];
	$rewardData['exp'] = $userConfig['sign_exp'];
	$log['module'] = 'user';
	$log['type'] = 'sign';
	$log['remark'] = '每日签到赠送！';
	$userMod->RewardUpdate( $uid , $rewardData , $log );
	
	//更新推荐票
	$ticketData['rec'] = $userConfig['sign_rec'];
	$ticketData['month'] = $userConfig['sign_month'];
	$ticketData['remark'] =  $lang['user']['ticket_sign_remark'];
	$ticketMod->Update( $uid , $ticketData);
}


//保存签到成功
if( $result )
{
	ReturnData($lang['user']['operate']['sign']['success'] , $ajax , 200);
}
else
{
	ReturnData($lang['user']['operate']['sign']['fail'] , $ajax);
}
?>