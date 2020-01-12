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
$levelTable = '@finance_level';

//修改充值等级信息
if ( $type == "leveladd" || $type == "leveledit" )
{
	//新增数据
	if( $type == 'leveladd' )
	{
		$data = str::Escape( GetKey($post,'level'), 'e' );
		if( !$data )
		{
			Ajax('ขออภัย! โปรดเพิ่มข้อมูลแล้วกดจัดเก็บ',300);
		}
		foreach ($data as $k=>$v)
		{
			if( $v['level_money'] != '' )
			{
				$where['level_id'] = wmsql::Insert($levelTable, $v);
				//写入操作记录
				SetOpLog( 'เพิ่มระดับการเติมเงิน' , 'finance' , 'insert' , $levelTable , $where , $v );
			}
		}
		$info = 'ยินดีด้วย! เพิ่มระดับการเติมเงินสำเร็จ';
	}
	else if( $type == 'leveledit' )
	{
		if( $post['level'] )
		{
			foreach ($post['level'] as $k=>$v)
			{
				wmsql::Update($levelTable, $v['data'], $v['id']);
				//写入操作记录
				SetOpLog( 'แก้ไขระดับการเติมเงิน' , 'finance' , 'update' , $levelTable , $v['id'] , $v['data'] );
			}
		}
		$info = 'ยินดีด้วย! แก้ไขระดับการเติมเงินสำเร็จ';
	}

	Ajax($info);
}
//删除数据和永久删除数据
else if ( $type == 'leveldel')
{
	$where['level_id'] = GetDelId();
	wmsql::Delete($levelTable , $where);
	
	//写入操作记录
	SetOpLog( 'ลบระดับการเติมเงิน' , 'finance' , 'delete' , $levelTable , $where);
	
	Ajax('ลบระดับการเติมเงินแล้ว!');
}
?>