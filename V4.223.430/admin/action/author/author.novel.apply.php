<?php
/**
* 小说编辑审核处理器
*
* @version        $Id: author.nove.apply.php 2017年1月19日 22:13  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_apply';
$applyMod = NewModel('system.apply' , 'author');

//删除数据
if ( $type == 'del' )
{
	//配置文件，删除数据方式是否是直接删除
	$where['apply_id'] = GetDelId();
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_editnovel';
	//获得数据
	$data = $applyMod->GetAll($where);
	if( $data )
	{
		//写入操作记录
		SetOpLog( 'ลบคำขอแก้ไขนิยาย' , 'system' , 'delete' , $table , $where);
		$applyMod->Delete($where);
	}

	Ajax('ลบคำขอแก้ไขนิยายสำเร็จแล้ว!');
}
//清空记录
else if ( $type == 'clear' )
{
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_editnovel';
	$applyMod->Delete($where);
	//写入操作记录
	SetOpLog( 'ล้างคำขอแก้ไขนิยาย' , 'system' , 'delete');
	Ajax('ล้างคำขอแก้ไขนิยายสำเร็จแล้ว');
}
//审核数据
else if ( $type == 'status' )
{
	$status = Request('status');
	if( $status == 0)
	{
		Ajax('ขออภัย! ไม่สามารถเปลี่ยนสถานะกลับไปได้');
	}
	else if( $status == 1)
	{
		$novelMod = NewModel('novel.novel');
		$chapterMod = NewModel('novel.chapter');
		$novelConfig = GetModuleConfig('novel');

		$data['apply_status'] = $status;
		$where['apply_id'] = GetDelId();
		$where['apply_module'] = 'author';
		$where['apply_type'] = 'novel_editnovel';

		$dataList = $applyMod->GetAll($where);
		if( $dataList )
		{
			foreach ($dataList as $k=>$v)
			{
				if( $v['apply_cid'] > 0 && $v['apply_status'] == 0)
				{
					//旧的数据
					$oldData = $novelMod->GetOne($v['apply_cid']);
					//修改小说的数据
					$novelData = unserialize($v['apply_option']);
					$novelData['novel_status'] = $status;
					unset($novelData['type_name']);
					$result = $novelMod->Update($novelData , $v['apply_cid']);

					//修改小说分类移动文件
					if( $result )
					{
						$novelMod->MoveNovelFolder($oldData['type_id'],$novelData['type_id'],$v['apply_cid']);
					}

					//插入消息和修改申请记录
					$applyMod->HandleApply('novel_editnovel' , $v['apply_uid'] , $v['apply_cid'] , $data['apply_status']);
				}
			}

			//写入操作记录
			$msg = 'ละทิ้ง';
			if( Request('status') == '1')
			{
				$msg = 'ตรวจสอบ';
			}
			SetOpLog( $msg.'คำขอแก้ไขนิยาย' , 'system' , 'update' , $table , $where);
			Ajax('คำขอแก้ไขนิยายถูก'.$msg.'แล้ว!');
		}
		else
		{
			Ajax('ขออภัย! ไม่มีคำขอแก้ไขนิยาย');
		}
	}
}
?>
