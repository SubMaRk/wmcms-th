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
		SetOpLog( '删除了小说修改申请' , 'system' , 'delete' , $table , $where);
		$applyMod->Delete($where);
	}
	
	Ajax('小说修改申请删除成功!');
}
//清空记录
else if ( $type == 'clear' )
{
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_editnovel';
	$applyMod->Delete($where);
	//写入操作记录
	SetOpLog( '清空了小说申请记录' , 'system' , 'delete');
	Ajax('所有小说申请记录成功清空！');
}
//审核数据
else if ( $type == 'status' )
{
	$status = Request('status/i');
	if( $status == 0)
	{
		Ajax('对不起，不能变更为未审核状态！');
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
					if( $result && isset($novelData['type_id']) )
					{
						$novelMod->MoveNovelFolder($oldData['type_id'],$novelData['type_id'],$v['apply_cid']);
					}
					
					//插入消息和修改申请记录
					$applyMod->HandleApply('novel_editnovel' , $v['apply_uid'] , $v['apply_cid'] , $data['apply_status']);
				}
			}
	
			//写入操作记录
			$msg = '取消审核';
			if( Request('status') == '1')
			{
				$msg = '审核通过';
			}
			SetOpLog( $msg.'了小说修改申请' , 'system' , 'update' , $table , $where);
			Ajax('小说修改申请'.$msg.'成功!');
		}
		else
		{
			Ajax('对不起，小说修改申请不存在！');
		}
	}
}
?>