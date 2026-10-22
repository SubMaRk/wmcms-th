<?php
/**
* 小说签约处理器
*
* @version        $Id: novel.sign.php 2017年3月12日 15:31  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$conSer = AdminNewClass('system.config');
$novelMod = NewModel('novel.novel');
$signMod = NewModel('novel.sign');

$curModule = 'novel';
$table = '@novel_sign';
$id = Request('nid');
$novelData = $novelMod->GetOne($id);
if( !$novelData )
{
	Ajax('ขออภัย! ไม่มีนิยายเรื่องนี้อยู่',300);
}
//签约操作
if ( $type == "add"  )
{
	$nid = Request('nid');
	$copy = Request('copy');
	$sid = Request('sid');
	$signData = $signMod->GetLastOne($nid);

	if((str::Int($nid) == 0 || str::Int($copy) == 0) && GetKey($signData,'sign_status') != 1)
	{
		Ajax('ขออภัย! ต้องเลือกรายการทั้งหมดก่อน',300);
	}
	else if($copy == 1 && $sid == 0  && GetKey($signData,'sign_status') != 1)
	{
		Ajax('ขออภัย! โปรดเลือกระดับการทำสัญญาก่อน',300);
	}
	else
	{
		if( GetKey($signData,'sign_status') == 1)
		{
			//插入签约数据
			$data['sign_status'] = 0;
			$copy = $sid = 0;
			//修改小说签约数据
			$signMod->SetNovelSign($nid,$copy,$sid);
			
			$opTxt = 'นิยายเรื่อง 《'.$novelData['novel_name'].'》 ยกเลิกสัญญาสำเร็จ!';
			$setTxt = 'ยินดีด้วย! นิยายเรื่องนี้ถูกยกเลิกสัญญาแล้ว';
		}
		else
		{
			$opTxt = 'นิยายเรื่อง 《'.$novelData['novel_name'].'》 ทำสัญญาสำเร็จ!';
			$setTxt = 'ยินดีด้วย! นิยายเรื่องนี้ถูกทำสัญญาแล้ว';
		}

		//插入签约数据
		$data['sign_novel_id'] = $nid;
		$data['sign_manager_id'] = Session('admin_id');
		$data['sign_type'] = $copy;
		$data['sign_sign_id'] = $sid;
		$where['sign_id'] = $signMod->Insert($data);
		//修改小说签约数据
		$signMod->SetNovelSign($nid,$copy,$sid);
			
		//写入操作记录
		SetOpLog( $opTxt , $curModule , 'insert' , $table , $where , $data );
		Ajax($setTxt);
	}
}
?>