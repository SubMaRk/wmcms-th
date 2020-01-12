<?php
/**
* 数据库管理处理器
*
* @version        $Id: data.mysql.php 2016年5月13日 11:21  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//重命名文件或者文件夹操作
if ( $type == 'runsql' )
{
	$sql = stripslashes($post['sql']);
	if( $sql == '' )
	{
		Ajax( 'ขออภัย! คำสั่ง SQL ต้องไม่ว่าง' , 300);
	}
	else
	{
		if( wmsql::Query($sql , 'rs') === false )
		{
			Ajax( 'ขออภัย! โปรดตรวจสอบว่า SQL ถูกต้อง' , 300);
		}
		else
		{
			Ajax( 'ยินดีด้วย! ดำเนินการคำสั่ง SQL สำเร็จ');
		}
	}
}
//优化表或者修复表
else if ( $type == 'optimize' || $type == 'repair' )
{
	$table = Request('table');
	
	if( $table == '' || $type == '' )
	{
		Ajax( 'ขออภัย! ประเภทของตารางหรือการดำเนินการของคำสั่งต้องไม่ว่าง' , 300);
	}
	else
	{
		switch ($type)
		{
			//优化表
			case "optimize":
				$info = $table.' ถูกเพิ่มประสิทธิภาพแล้ว';
				$sql = 'OPTIMIZE TABLE  `'.$table.'`';
			
			//修复表
			case "repair":
				$info = $table.' ถูกซ่อมแซมแล้ว';
				$sql = 'REPAIR TABLE  `'.$table.'`';
				break;
		}
		
		if( wmsql::Query($sql , 'rs') === false )
		{
			Ajax( 'ขออภัย! โปรดตรวจสอบว่า SQL ถูกต้อง' , 300);
		}
		else
		{
			Ajax( $info );
		}
	}
}
?>