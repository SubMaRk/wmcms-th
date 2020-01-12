<?php
/**
* 提现订单处理器
*
* @version        $Id: finance.order.cash.php 2017年4月6日 22:34  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cashTable = '@finance_order_cash';

//删除记录
if ( $type == 'del'  )
{
	$where['cash_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบคำร้องขอถอนเงิน' , 'finance' , 'delete' , $cashTable , $where);
	wmsql::Delete($cashTable , $where);
	
	Ajax('ลบคำร้องขอถอนเงินสำเร็จ!');
}
//清空数据记录
else if ( $type == 'clear')
{
	SetOpLog( 'ล้างคำร้องขอถอนเงิน' , 'finance' , 'delete' , $cashTable);
	wmsql::Delete($cashTable);
	Ajax('ล้างคำร้องขอถอนเงินสำเร็จ!');
}
//审核操作
else if ( $type == 'status')
{
	$cashMod = NewModel('finance.finance_cash');
	$id = str::Int(Request('id'));
	$status = str::Int(Request('status'));
	$where['cash_id'] = $id;
	$data['cash_status'] = $status;
	
	//查询是否存在
	$cashData = $cashMod->GetById($id);
	if( $cashData )
	{
		$cashMod->UpdateStatus($id , $status);
		if( $status == 1)
		{
			SetOpLog( 'อนุมัติการถอนเงิน' , 'finance' , 'delete' , $cashTable , $where , $data);
			Ajax('อนุมัติการถอนเงินสำเร็จ!');
		}
		else
		{
			$config = GetModuleConfig('finance' , true);
			//把申请提现的金钱还给用户
			$userMod = NewModel('user.user');
			$logData['module'] = 'finance';
			$logData['type'] = 'cash_refuse';
			$logData['uid'] = $cashData['cash_user_id'];
			$logData['remark'] = 'คำร้องขอถอนเงินถูกปฏิเสธ!';
			$userMod->CapitalChange( $cashData['cash_user_id'] , $logData , 0 , $cashData['cash_money']/$config['gold2_to_money']);
			SetOpLog( 'ปฏิเสธการถอนเงิน' , 'finance' , 'delete' , $cashTable , $where , $data);
			Ajax('ปฏิเสธการถอนเงินสำเร็จ!');
		}
	}
	else
	{
		Ajax('ขออภัย! ไม่มีคำร้องขอถอนเงินนี้อยู่');
	}
}
?>