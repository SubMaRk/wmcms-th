<?php
/**
* 申请记录处理器
*
* @version        $Id: system.apply.php 2017年1月14日 20:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$module = Request('module');
$mt = Request('type');
$result['info'] = $result['table'] = $result['where'] = $result['data'] = '';

//拒绝操作
if ( $type == 'refuse_'.$module.'_'.$mt )
{
	$remark = Request('remark');
	$uid = Request('uid/i');
	$cid = Request('cid/i');
	if( $remark == '' )
	{
		Ajax('ขออภัย! ต้องกรอกเหตุผลที่ละทิ้งก่อน',300);
	}
	else if($module == '' || $mt == '' || !str::Number($uid) || !str::Number($cid) || !str::Number($uid) )
	{
		Ajax('ขออภัย! พารามิเตอร์ไม่ถูกต้อง',300);
	}
	else
	{
		//审核类文件
		$applySer = AdminNewClass('system.apply');
		$applyMod = NewModel('system.apply' , $module);
		$applyId = $applyMod->HandleApply($mt , $uid , $cid, 2 ,$remark);

		//如果操作回调方法存在就调用
		$callBack = $mt.'RefuseCallBack';
		if( method_exists($applySer,$callBack) )
		{
			$result = $applySer->$callBack($uid , $cid);
		}

		//修改编辑器上传的内容id
		$uploadMod = NewModel('upload.upload');
		$uploadMod->UpdateCid( 'editor',$module.'_'.$mt.'_refuse', $cid);
		
		//写入操作记录
		SetOpLog( $result['info'] , $module , $type , $result['table'] , $result['where'] , $result['data'] );
		Ajax('ละทิ้งคำร้องสำเร็จ!' , 200);
	}
}
?>