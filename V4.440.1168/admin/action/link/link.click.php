<?php
/**
* 友链点击处理器
*
* @version        $Id: link.click.php 2016年5月13日 15:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@link_click';

//删除数据
if ( $type == 'del' )
{
	$where['click_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบบันทึกการคลิ๊กลิ้งก์เพื่อนบ้าน' , 'link' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
	
	Ajax('ลบบันทึกการคลิ๊กลิ้งก์เพื่อนบ้านสำเร็จ!');
}
//清空数据
else if ( $type == 'clear' )
{
	//写入操作记录
	SetOpLog( 'ล้างบันทึกการคลิ๊กลิ้งก์เพื่อนบ้าน' , 'link' , 'delete' , $table );
	wmsql::Delete($table);
	
	Ajax('ล้างบันทึกการคลิ๊กลิ้งก์เพื่อนบ้านสำเร็จ!');
}
?>