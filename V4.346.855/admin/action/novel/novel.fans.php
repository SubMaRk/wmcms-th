<?php
/**
* 小说粉丝处理器
*
* @version        $Id: novel.fans.php 2017年3月29日 22:04  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$rewardTable = '@user_finance_log';
$ticketTable = '@user_ticket_log';
$subTable = '@novel_sublog';
$levelTable = '@fans_module_level';

//删除打赏记录
if ( $type == 'delreward'  )
{
	$where['log_id'] = GetDelId();
	$where['log_status'] = '2';
	$where['log_module'] = 'novel';
	$where['log_type'] = 'reward_consume';
	//写入操作记录
	SetOpLog( 'ลบบันทึกรางวัล' , 'novel' , 'delete' , $rewardTable , $where);
	wmsql::Delete($rewardTable , $where);
	
	Ajax('ลบบันทึกรางวัลสำเร็จ!');
}
//清空数据打赏记录
else if ( $type == 'clearreward')
{
	//写入操作记录
	$where['log_status'] = '2';
	$where['log_module'] = 'novel';
	$where['log_type'] = 'reward_consume';
	SetOpLog( 'ล้างบันทึกรางวัล' , 'novel' , 'delete' , $rewardTable , $where);
	wmsql::Delete($rewardTable , $where);
	Ajax('ล้างบันทึกรางวัลสำเร็จ');
}

//删除推荐记录
else if ( $type == 'delticket'  )
{
	$where['log_id'] = GetDelId();
	$where['log_status'] = '2';
	$where['log_module'] = 'novel';
	//写入操作记录
	SetOpLog( 'ลบบันทึกตั๋ว' , 'novel' , 'delete' , $ticketTable , $where);
	wmsql::Delete($ticketTable , $where);
	
	Ajax('ลบบันทึกตั๋วสำเร็จ!');
}
//清空数据推荐记录
else if ( $type == 'clearticket')
{
	//写入操作记录
	$where['log_status'] = '2';
	$where['log_module'] = 'novel';
	SetOpLog( 'ล้างบันทึกตั๋ว' , 'novel' , 'delete' , $ticketTable , $where);
	wmsql::Delete($ticketTable , $where);
	Ajax('ล้างบันทึกตั๋วสำเร็จ!');
}

//删除订阅记录
else if ( $type == 'delsub'  )
{
	$where['log_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบบันทึกการสมัคร' , 'novel' , 'delete' , $subTable , $where);
	wmsql::Delete($subTable , $where);
	
	Ajax('ลบบันทึกการสมัครสำเร็จ!');
}
//清空数据推荐记录
else if ( $type == 'clearsub')
{
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการสมัคร' , 'novel' , 'delete' , $subTable);
	wmsql::Delete($subTable);
	Ajax('ล้างบันทึกการสมัครสำเร็จ!');
}

//修改粉丝等级信息
else if ( $type == "leveladd" || $type == "leveledit" )
{
	//新增数据
	if( $type == 'leveladd' )
	{
		$data = str::Escape( GetKey($post,'level'), 'e' );
		if( !$data )
		{
			Ajax('ขออภัย! โปรดเพิ่มข้อมูลแล้วคลิ๊กจัดเก็บ',300);
		}
		foreach ($data as $k=>$v)
		{
			if( $v['level_name'] != '' )
			{
				$where['level_id'] = wmsql::Insert($levelTable, $v);
				//写入操作记录
				SetOpLog( 'เพิ่มระดับแฟนคลับ' , 'novel' , 'insert' , $levelTable , $where , $v );
			}
		}
		$info = 'ยินดีด้วย! เพิ่มระดับแฟนคลับสำเร็จ';
	}
	else if( $type == 'leveledit' )
	{
		if( $post['level'] )
		{
			foreach ($post['level'] as $k=>$v)
			{
				wmsql::Update($levelTable, $v['data'], $v['id']);
				//写入操作记录
				SetOpLog( 'แก้ไขระดับแฟนคลับ' , 'novel' , 'update' , $levelTable , $v['id'] , $v['data'] );
			}
		}
		$info = 'ยินดีด้วย! แก้ไขระดับแฟนคลับสำเร็จ';
	}

	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'leveldel')
{
	$where['level_id'] = GetDelId();
	wmsql::Delete($levelTable , $where);
	
	//写入操作记录
	SetOpLog( 'ลบระดับแฟนคลับ' , 'novel' , 'delete' , $levelTable , $where);
	
	Ajax('ลบระดับแฟนคลับสำเร็จ!');
}
?>