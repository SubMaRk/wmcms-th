<?php
/**
* 小说结算申请处理器
*
* @version        $Id: novel.sell.settlement.php 2018年9月8日 12:25  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$novelMod = NewModel('novel.novel');
$applyMod = NewModel('finance.finance_apply');
$authorMod = NewModel('author.author');

//处理结算申请操作
if ( $type == "apply"  )
{
	//申请数据
	$nid = $post['nid'];
	$total = $post['total'];
	$real = $post['real'];
	$year = $post['year'];
	$month = $post['month'];
	$bonusGold2 = GetKey($post,'bonus_gold2');
	$bonusRemark = GetKey($post,'bonus_remark');
	$deductGold2 = GetKey($post,'deduct_gold2');
	$deductRemark = GetKey($post,'deduct_remark');

	$novelData = $novelMod->GetOne($nid);
	$applyData = $applyMod->GetByMonth($year.$month,'novel',$nid);
	
	if( !$novelData )
	{
		Ajax('ขออภัย! ไม่มีนิยายเรื่องนี้อยู่',300);
	}
	else if( $novelData['novel_copyright'] < 1 || $novelData['novel_sell'] < 1 )
	{
		Ajax('ขออภัย! โปรดเซ็นสัญญาก่อน',300);
	}
	else if($real != $total+$bonusGold2-$deductGold2 )
	{
		Ajax('จำนวนเงินที่เรียกเก็บไม่ถูกต้อง!',300);
	}
	else if( $applyData && $applyData['apply_status'] == 0 )
	{
		Ajax('คำร้องทางการเงินกำลังดำเนินการอยู่ โปรดรอผู้ดูแลตรวจสอบอีกครั้ง!',300);
	}
	else if( $applyData && $applyData['apply_status'] == 1 )
	{
		Ajax('การชำระของเดือนนี้ถูกดำเนินการแล้ว ไม่จำเป็นต้องทำเรื่องซ้ำ',300);
	}
	else
	{
		$tUid = $authorMod->GetUidByAid($novelData['author_id']);
		
		//条件
		$where['apply_module'] = 'novel';
		$where['apply_month'] = $year.$month;
		$where['apply_cid'] = $nid;
		
		//数据
		$data = $where;
		$data['apply_manager_id'] = Session('admin_id');
		$data['apply_total'] = $total;
		$data['apply_bonus'] = $bonusGold2;
		$data['apply_bonus_remark'] = $bonusRemark;
		$data['apply_deduct'] = $deductGold2;
		$data['apply_deduct_remark'] = $deductRemark;
		$data['apply_bonus'] = $bonusGold2;
		$data['apply_remark'] = 'นิยายเรื่อง 《'.$novelData['novel_name'].'》 '.$year.'-'.$month.' คำร้องทางการเงิน';
		$data['apply_to_user_id'] = $tUid;
		$data['apply_real'] = $real;
		$applyMod->Insert($data);
		
		//写入操作记录
		SetOpLog( 'กำหนดการชำระเงินนิยาย' , 'finance' , 'insert' , '@finance_apply' , $where , $data );
		Ajax('คำร้องทางการเงินถูกดำเนินการแล้ว!');
	}
}
?>