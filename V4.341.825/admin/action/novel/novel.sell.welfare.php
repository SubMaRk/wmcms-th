<?php
/**
* 小说福利处理器
*
* @version        $Id: novel.sell.welfare.php 2018年9月2日 14:15  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$welfareMod = NewModel('novel.welfare');

//福利设置操作
if ( $type == "edit"  )
{
	//小说数据
	$data = $post['data'];
	$where['welfare_nid'] = $data['welfare_nid'];
	if( $data['welfare_nid'] < 1)
	{
		Ajax('ขออภัย! ไอดีนิยายไม่ถูกต้อง',300);
	}
	else
	{
		$welfareData = $welfareMod->GetByNid($where['welfare_nid']);
		//存在福利就修改
		if( $welfareData )
		{
			$welfareMod->Update($data,$where);
		}
		//不存在福利就插入
		else
		{
			$welfareMod->Insert($data);
		}
		//写入操作记录
		SetOpLog( 'กำหนดสวัสดิการนิยาย' , 'novel' , 'update' , '@novel_welfare' , $where , $data );
		Ajax('กำหนดสวัสดิการนิยายสำเร็จ!');
	}
}
?>