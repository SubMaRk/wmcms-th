<?php
/**
* 微信自定义菜单处理器
*
* @version        $Id: operate.weixin.menu.php 2019年03月09日 13:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$menuMod = NewModel('operate.weixin_menu');
$table = '@weixin_menu';

//编辑自定义菜单信息
if ( $type == 'edit' || $type == "add"  )
{
	$data = str::Escape( $post['menu'], 'e' );
	$where = $post['id'];
	
	if ( $data['menu_name'] == '' )
	{
		Ajax('ขออภัย! ต้องกรอกชื่อเมนูที่กำหนดเองก่อน',300);
	}
	else if( !str::Number(GetKey($data,'menu_account_id')) )
	{
		Ajax('ขออภัย! ต้องเลือกหมายเลขสาธารณะก่อน',300);
	}
	
	//新增数据
	if( $type == 'add' )
	{
		$opType = 'insert';
		$info = 'เพิ่มเมนูที่กำหนดเอง'.$data['menu_name'];
		$where['menu_id'] = $menuMod->Insert($data);
	}
	//修改分类
	else
	{
		$opType = 'update';
		$info = 'แก้ไขเมนูที่กำหนดเอง'.$data['menu_name'];
		$menuMod->Update($data,$where['menu_id']);
	}
	//写入操作记录
	SetOpLog( $info, 'system' , $opType , $table , $where , $data );
	Ajax($info);
}
//删除数据
else if ( $type == 'del' )
{
	$where['menu_id'] = GetDelId();
	$menuMod->Del($where);
	//写入操作记录
	SetOpLog( 'ลบเมนูที่กำหนดเอง' , 'system' , 'delete' , $table , $where);
	Ajax('ลบเมนูที่กำหนดเองสำเร็จ!');
}
//推送
else if ( $type == 'push' )
{
	$id = Request('id/i');
	$where['menu_id'] = $id;
	$data = $menuMod->GetById($id);
	if( $data )
	{
		//推送
		$wxConfig['appid'] = $data['account_appid'];
		$wxConfig['secret'] = $data['account_secret'];
		$wxSer = NewClass('weixin_platform',$wxConfig);
		$res = $wxSer->MenuCreate('{"button":'.$data['menu_data'].'}');
		if( isset($res['errcode']) && $res['errcode'] != '0' )
		{
			Ajax($res['errmsg'],300);
		}
		else
		{
			//推送后修改数据操作
			$menuMod->PushMenu($data['account_id'],$id);
			SetOpLog( 'ผลักเมนูที่กำหนดเอง' , 'system' , 'delete' , $table , $where);
			Ajax('ผลักเมนูที่กำหนดเองสำเร็จ!');
		}
	}
}
//复制
else if ( $type == 'copy' )
{
	$mid = Request('mid/i');
	$aid = Request('aid/i');
	$data = $menuMod->GetById($mid);
	if( $data )
	{
		$saveData['menu_account_id'] = $aid;
		$saveData['menu_name'] = '复制-'.$data['menu_name'];
		$saveData['menu_data'] = $data['menu_data'];
		$where['menu_id'] = $menuMod->Insert($saveData);
		SetOpLog( 'คัดลอกเมนูที่กำหนดเอง' , 'system' , 'insert' , $table , $where);
	}
	Ajax('คัดลอกเมนูที่กำหนดเองสำเร็จ!');
}
?>