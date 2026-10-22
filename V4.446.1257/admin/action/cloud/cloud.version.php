<?php
/**
* 版本请求处理器
*
* @version        $Id: cloud.version.php 2017年2月25日 13:57  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$cloudSer = NewClass('cloud');

//获得下一版本
if ( $type == 'getnext' )
{
	$rs = $cloudSer->GetVersionNext(1);
	Ajax('คำขอสำเร็จ!',200,$rs);
}
//获得最新版本
else if ( $type == 'getnew' )
{
	$rs = $cloudSer->GetNewVer();
	Ajax('คำขอสำเร็จ!',200,$rs);
}
//开始升级
else if ( $type == 'update' )
{
	/*
	安全策略：自动升级会从 http://server.weimengcms.com 下载 zip，解压后
	require 包内的 update.php。整条链路是明文 http，包也没有签名校验，
	任何能劫持这段连接的人都能让站点执行任意 PHP。
	官方 4.446.1257 已是最后一个版本，因此移除在线升级的实现，
	需要打补丁时手动上传补丁包并运行其中的 update.php。
	*/
	Ajax('ขออภัย! ปิดการอัปเกรดอัตโนมัติเพื่อความปลอดภัย โปรดอัปโหลดชุดแพ็คอัปเดตเองแล้วรัน update.php ด้วยมือ',300);
}
?>