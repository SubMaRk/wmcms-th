<?php
/**
* 评论处理器
*
* @version        $Id: operate.replay.php 2016年5月6日 15:54  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@replay_replay';


//审核数据
if ( $type == 'status' )
{
	$data['replay_status'] = Request('status/i');
	$where['replay_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ตรวจสอบ';
	}
	else
	{
		$msg = 'ละทิ้ง';
	}
	//写入操作记录
	SetOpLog( $msg.'ความคิดเห็น' , 'replay' , 'update' , $table , $where);
	
	wmsql::Update($table, $data, $where);
	Ajax('ความคิดเห็นถูก'.$msg.'แล้ว!');
}
//删除请求记录
else if ( $type == 'del' )
{
	$where['table'] = $table;
	$where['where']['replay_id'] = GetDelId();
	$data = wmsql::GetAll($where);
	if( $data )
	{
		$uploadSer = AdminNewClass('upload');
		foreach ($data as $k=>$v)
		{
			//删除回帖记录
			$wheresql['replay_id'] = $v['replay_id'];
			wmsql::Delete($table , $wheresql);
			//删除可能有的附件
			$uploadSer->DelUpload('bbs',$v['replay_id']);
		}
	}
	
	SetOpLog( 'ลบบันทึกความคิดเห็น' , 'replay' , 'delete' , $table , $where);
	Ajax('ลบบันทึกความคิดเห็นสำเร็จ!');
}
//清空请求记录
else if ( $type == 'clear' )
{
	if( Request('module') != '' )
	{
		$where['replay_module'] = Request('module');
	}
	else
	{
		$where['replay_module'] = array('<>' , 'bbs' );
	}

	wmsql::Delete($table , $where);
	
	//写入操作记录
	SetOpLog( 'ล้างบันทึกความคิดเห็น' , 'replay' , 'delete');
	Ajax('ล้างบันทึกความคิดเห็นสำเร็จ!');
}
?>