<?php
/**
* 文章审核处理器
*
* @version        $Id: author.article.apply.php 2017年2月12日 11:56  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_apply';
$applyMod = NewModel('system.apply','author');

//删除数据
if ( $type == 'del' )
{
	//配置文件，删除数据方式是否是直接删除
	$where['apply_id'] = GetDelId();
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'article_editarticle';
	//获得数据
	$data = $applyMod->GetAll($where);
	if( $data )
	{
		//写入操作记录
		SetOpLog( 'ลบคำขอแก้ไขบทความ' , 'system' , 'delete' , $table , $where);
		$applyMod->Delete($where);
	}

	Ajax('ลบคำขอแก้ไข่บทความสำเร็จแล้ว!');
}
//清空记录
else if ( $type == 'clear' )
{
	$where['apply_module'] = 'author';
	$where['apply_type'] = 'article_editarticle';
	$applyMod->Delete($where);
	//写入操作记录
	SetOpLog( 'ล้างบันทึกคำขอบทความ' , 'system' , 'delete');
	Ajax('ล้ล้างบันทึกคำขอบทความทั้งหมดแล้ว');
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
		$articleMod = NewModel('article.article');

		$data['apply_status'] = $status;
		$where['apply_id'] = GetDelId();
		$where['apply_module'] = 'author';
		$where['apply_type'] = 'article_editarticle';
		$dataList = $applyMod->GetAll($where);
		if( $dataList )
		{
			$htmlMod = NewModel('system.html' , array('module'=>'article'));
			foreach ($dataList as $k=>$v)
			{
				if( $v['apply_cid'] > 0 && $v['apply_status'] == 0)
				{
					$lastId = $v['apply_cid'];
					$option = unserialize($v['apply_option']);
					$option['article_status'] = $status;
					//修改现在的章节数据
					$articleMod->Update($option , $lastId);
					//创建HTML
					$htmlMod->CreateContentHtml($v['apply_cid']);

					//插入消息和修改申请记录
					$applyMod->HandleApply('article_editarticle' , $v['apply_uid'] , $v['apply_cid'] , $data['apply_status']);
				}
			}

			//写入操作记录
			$msg = 'ละทิ้ง';
			if( Request('status') == '1')
			{
				$msg = 'ตรวจสอบ';
			}
			SetOpLog( $msg.'คำขอแก้ไขบทความถูก' , 'system' , 'update' , $table , $where);
			Ajax('คำขอแก้ไขบทความถูก'.$msg.'แล้ว!');
		}
		else
		{
			Ajax('ขออภัย! ไม่มีคำขอแก้ไขบทความ');
		}
	}
}
?>
