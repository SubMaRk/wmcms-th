<?php
/**
* 财务申请处理器
*
* @version        $Id: finance.apply.php 2018年9月9日 9:19  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$applyTable = '@finance_apply';
$applyMod = NewModel('finance.finance_apply');

//删除记录
if ( $type == 'del'  )
{
	$where['apply_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบข้อมูลการเงิน' , 'finance' , 'delete' , $applyTable , $where);
	wmsql::Delete($applyTable , $where);
	
	Ajax('ลบข้อมูลการเงินสำเร็จ!');
}
//清空数据记录
else if ( $type == 'clear')
{
	SetOpLog( 'ล้างบันทึกข้อมูลการเงิย' , 'finance' , 'delete' , $applyTable);
	wmsql::Delete($applyTable);
	Ajax('ล้างบันทึกข้อมูลการเงินสำเร็จ!');
}
//审核操作
else if ( $type == 'status')
{
	$id = $post['id'];
	$status = $post['status'];
	$remark = $post['remark'];
	$data = $applyMod->GetById($id);
	if( $data['apply_status'] != '0' )
	{
		Ajax('ขออภัย! ข้อมูลการเงินถูกดำเนินการแล้ว',300);
	}
	else
	{
		$where['apply_id'] = $id;
		$saveData['apply_status'] = $status;
		$saveData['apply_handle_manager_id'] = Session('admin_id');
		$saveData['apply_handle_remark'] = $remark;
		$saveData['apply_handle_time'] = time();
		$applyMod->Update($saveData,$id);
		//指向用户id，并且是通过状态
		if( $data['apply_to_user_id'] > '0' && $status == '1')
		{
			//插入资金变更记录
			$userMod = NewModel('user.user');
			$logData['module'] = 'system';
			$logData['type'] = 'finance_apply';
			$logData['cid'] = $data['apply_cid'];
			$logData['remark'] = $data['apply_remark'];
			$userMod->CapitalChange( $data['apply_to_user_id'] , $logData , 0 , $data['apply_real'] );

			//发送系统消息
			$userConfig = AdminInc('user');
			$msgMod = NewModel('user.msg');
			$msg = $data['apply_month'].'บันทึกการชำระเงิน!<br/>จำนวนรายได้ทั้งหมด : '.$data['apply_total'].$userConfig['gold2_name'].' รายได้จริง '.$data['apply_real'].$userConfig['gold2_name'].'<br/>';
			if( $data['apply_bonus'] > '0' )
			{
				$msg .= 'โบนัสพิเศษ : '.$data['apply_bonus'].$userConfig['gold2_name'].' จากเดิม : '.$data['apply_bonus_remark'].$userConfig['gold2_name'].'<br/>';
			}
			if( $data['apply_deduct'] > '0' )
			{
				$msg .= 'หักโบนัส : '.$data['apply_deduct'].$userConfig['gold2_name'].' จากเดิม : '.$data['apply_deduct_remark'].$userConfig['gold2_name'].'<br/>';
			}
			$msgMod->Insert($data['apply_to_user_id'] , $msg);
		}
		Ajax('ดำเนินการข้อมูลทางการเงินสำเร็จ!');
	}
}
?>