<?php
/**
* 封面审核处理器
*
* @version        $Id: author.nove.cover.php 2017年1月15日 16:13  weimeng
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
	$where['apply_type'] = 'novel_cover';
	//获得数据
	$data = $applyMod->GetAll($where);
	if( $data )
	{
		//循环删除上传的文件
		foreach ($data as $k=>$v)
		{
			$option = unserialize($v['apply_option']);
			if( $option['file'] != '' )
			{
				file::DelFile(WMROOT.$option['file']);
			}
		}
		//写入操作记录
		SetOpLog( '删除了小说上传封面' , 'system' , 'delete' , $table , $where);
		$applyMod->Delete($where);
	}
	
	Ajax('小说封面申请删除成功!');
}
//审核数据
else if ( $type == 'status' )
{
	$novelMod = NewModel('novel.novel');
	$novelConfig = GetModuleConfig('novel');
	$status = Request('status');
	
	$data['apply_status'] = $status;
	$where['apply_id'] = GetDelId();
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'novel_cover';
	
	$dataList = $applyMod->GetAll($where);
	if( $dataList )
	{
		foreach ($dataList as $k=>$v)
		{
			if( $v['apply_cid'] > 0 )
			{
				//如果修改的状态为0就把小说的封面重置为默认封面
				$option = unserialize($v['apply_option']);
				$novelData['novel_cover'] = $option['file'];
				if( $data['apply_status'] == 0 )
				{
					$novelData['novel_cover'] = $novelConfig['cover'];
				}
				$novelMod->Update($novelData , $v['apply_cid']);
				
				//插入消息和修改申请记录
				$applyMod->HandleApply('novel_cover' , $v['apply_uid'] , $v['apply_cid'] , $data['apply_status']);
			}
		}

		//写入操作记录
		$msg = '取消审核';
		if( Request('status') == '1')
		{
			$msg = '审核通过';
		}
		SetOpLog( $msg.'了小说上传封面' , 'system' , 'update' , $table , $where);
		Ajax('小说封面'.$msg.'成功!');
	}
	else
	{
		Ajax('对不起，小说封面不存在！');
	}
}
?>