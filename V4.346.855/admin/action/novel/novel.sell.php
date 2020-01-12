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
$sellMod = NewModel('novel.sell');

$curModule = 'novel';
$table = '@novel_sell';
$nid = $post['data']['sell_novel_id'];
$novelData = $novelMod->GetOne($nid);
if( !$novelData )
{
	Ajax('ขออภัย! ไม่มีนิยายเรื่องนี้อยู่',300);
}
else if($novelData['novel_sign_id'] < 1 & $novelData['novel_copyright'] < 1)
{
	Ajax('ขออภัย! โปรดเซ็นสัญญาก่อน',300);
}


//上架操作
if ( $type == "add"  )
{
	$data = $post['data'];
	if( !isset($data['sell_type']) )
	{
		Ajax('ขออภัย! โปรดเลือกช่องทางเก็บเงินอย่างน้อยหนึ่งช่องทาง',300);
	}
	else
	{
		foreach ($data['sell_type'] as $k=>$v)
		{
			if($v == 1 && $data['sell_number'] == '' )
			{
				Ajax('ขออภัย! โปรดกรอกราคาต่อหนึ่งพันคำ',300);
			}
			else if($v == 2 && $data['sell_all'] == '' )
			{
				Ajax('ขออภัย! โปรดกรอกราคาเต็ม',300);
			}
			else if($v == 3 && $data['sell_month'] == '' )
			{
				Ajax('ขออภัย! โปรดกรอกราคารายเดือน',300);
			}
		}
	}
	$data['sell_type'] = implode(',', $data['sell_type']);

	$sellData = $sellMod->GetLastOne($nid);
	if( $sellData && $sellData['sell_status'] == 1)
	{
		Ajax('ขออภัย! นิยายเรื่องนี้อยู่บนชั้นหนังสือแล้ว',300);
	}
	else
	{
		//插入签约数据
		$where['sell_id'] = $sellMod->Insert($data);
		//修改小说签约数据
		$sellMod->SetNovelSell($nid);
		
		//写入操作记录
		SetOpLog( 'นิยายเรื่อง 《'.$novelData['novel_name'].'》 อยู่บนชั้นหนังสือ' , $curModule , 'insert' , $table , $where , $data );
		Ajax('ยินดีด้วย! นิยายเรื่องนี้อยู่บนชั้นแล้ว');
	}
}
else if($type == 'remove')
{
	$sellData['sell_novel_id'] = $novelData['novel_id'];
	$sellData['sell_status'] = 0;
	$where['sell_id'] = $sellMod->Insert($sellData);
	//写入操作记录
	SetOpLog( 'นิยายเรื่อง 《'.$novelData['novel_name'].'》 ถูกนำออกจากชั้นหนังสือ' , $curModule , 'insert' , $table , $where , $sellData );
	//修改小说签约数据
	$sellMod->SetNovelSell($nid , 0);
	Ajax('ยินดีด้วย! ถอดนิยายออกจากชั้นหนังสือแล้ว');
}
?>