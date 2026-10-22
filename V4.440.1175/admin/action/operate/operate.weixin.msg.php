<?php
/**
* 微信公众号消息单处理器
*
* @version        $Id: operate.weixin.msg.php 2019年03月10日 14:35  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$msgMod = NewModel('operate.weixin_msg');
$table = '@weixin_msg';

//删除数据
if ( $type == 'del' )
{
	$where['msg_id'] = GetDelId();
	$msgMod->Del($where);
	//写入操作记录
	SetOpLog( 'ลบข้อความบน WeChat' , 'system' , 'delete' , $table , $where);
	Ajax('ลบข้อความบน WeChat สำเร็จ!');
}
?>