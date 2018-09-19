<?php
/**
* 小说销售统计控制器
*
* @version        $Id: novel.sell.log.php 2017年8月11日 16:12  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
die('开发中');
$nid = Get('nid');
if($nid == '' )
{
	die();
}
$novelMod = NewModel('novel.novel');
$subMod = NewModel('novel.sublog');
$propsMod = NewModel('props.sell');

//获得小说基本信息
$data = $novelMod->GetOne($nid);
$data['novel_name'] = str::DelHtml($data['novel_name']);

//获得订阅小说数据
$data['sub'] = $subMod->GetByNid($nid);
//获得道具销售数据
$data['props'] = $propsMod->GetByCid('novel',$nid);

//数据
$data['today']['sub'] = 0;
$data['today']['reward'] = 0;
$data['today']['props'] = 0;
$data['yesterday']['sub'] = 0;
$data['yesterday']['reward'] = 0;
$data['yesterday']['props'] = 0;
$data['all']['sub'] = 0;
$data['all']['props'] = 0;
$data['all']['props'] = 0;


if($data['sub'])
{
	foreach ($data['sub'] as $k=>$v)
	{
		//今天订阅
		if( date('Y-m-d',$v['log_time']) == date('Y-m-d',time()) )
		{
			$data['today']['sub'] += $v['log_gold2'];
			@$data['todayTime'][date('G',$v['log_time'])] += $v['log_gold2'];
		}
		//昨天订阅
		if( date('Y-m-d',$v['log_time']) == date("Y-m-d",strtotime("-1 day")) )
		{
			$data['yesterday']['sub'] += $v['log_gold2'];
			@$data['yesterdayTime'][date('G',$v['log_time'])] += $v['log_gold2'];
		}
		//总订阅
		$data['all']['sub'] += $v['log_gold2'];
	}
}

//循环实时数据
for($i=1;$i<=24;$i++){
	if( empty($data['todayTime'][$i]) )
	{
		$data['todayTime'][$i]=0;
	}
	if( empty($data['yesterdayTime'][$i]) )
	{
		$data['yesterdayTime'][$i]=0;
	}
}

//提现订单数据
$cashOrderMod = NewModel('finance.finance_cash');
$cashList = $cashOrderMod->GetCashList();
if($cashList)
{
	foreach ($cashList as $k=>$v)
	{
		if( $v['charge_status'] == '1' )
		{
			//今天提现金额
			if( date('Y-m-d',$v['cash_handletime']) == date('Y-m-d',time()) )
			{
				$data['today']['cash'] = $data['today']['cash']+$v['cash_money'];
			}
	
			//昨日充值金额
			if( date('Y-m-d',$v['cash_handletime']) == date("Y-m-d",strtotime("-1 day")) )
			{
				$data['yesterday']['cash'] = $data['today']['cash']+$v['cash_money'];
			}

			//总充值金额
			$data['all']['cash'] = $data['all']['cash']+$v['charge_money'];
		}
	}
}

//日期小计
$data['today']['total'] = $data['today']['charge']-$data['today']['cash'];
$data['yesterday']['total'] = $data['yesterday']['charge']-$data['yesterday']['cash'];
$data['all']['total'] = $data['all']['charge']-$data['all']['cash'];
?>