<?php
/**
* 菜单目录处理器
*
* @version        $Id: system.menu.php 2016年4月1日 10:13  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@system_menu';

//移动菜单显示顺序
if ( $type == 'order' )
{
	$post = str::Escape(Post() , 'e');

	if( $post['order'] < 0 )
	{
		$post['order'] = 0;
	}
	//检查参数
	if( !str::Number($post['id']) || !str::Number($post['order']) )
	{
		Ajax($post['order'].'ขออภัย! ลำดับและไอดีเมนูต้องเป็นตัวเลขเท่านั้น',300);
	}
	//设置条件
	$where['menu_id'] = $post['id'];
	$data['menu_order'] = $post['order'];
	//设置参数
	if( Post('pid') != '' && str::Number(Post('pid')) )
	{
		$data['menu_pid'] = $post['pid'];
	}
	
	
	//写入操作记录
	SetOpLog( 'ย้ายลำดับเมนู' , 'system' , 'updata' , $table , $where , $data );
	
	
	WMSql::Update($table, $data, $where);

	Ajax('ย้ายลำดับเมนูสำเร็จ!');
}
else if ( $type == 'edit' || $type == "add" )
{
	//判断父级id是否为空
	if ( $post['pid'] == '' )
	{
		$post['pid'] = 0;
	}
	//设置where条件
	$where['menu_id'] = $post['id'];
	//设置修改数据
	$data['menu_status'] = $post['status'];
	$data['menu_title'] = $post['title'];
	$data['menu_name'] = $post['name'];
	$data['menu_pid'] = $post['pid'];
	$data['menu_group'] = $post['group'];
	$data['menu_order'] = $post['order'];
	$data['menu_file'] = $post['file'];

	//新增菜单
	if( $type == "add" )
	{
		$where['menu_id'] = WMSql::Insert($table, $data);
		//写入操作记录
		SetOpLog( 'เพิ่มเมนู' , 'system' , 'insert' , $table , $where , $data );
		Ajax('เพิ่มเมนูสำเร็จ!');
	}
	//修改菜单
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขเมนู' , 'system' , 'update' , $table , $where , $data );
		WMSql::Update($table, $data, $where);
		Ajax('แก้ไขเมนูสำเร็จ!');
	}
}
//删除菜单
else if ( $type == 'del' )
{
	$where['menu_id'] = Post('id');
	//写入操作记录
	SetOpLog( 'ลบเมนู' , 'system' , 'delete' , $table , $where);
	wmsql::Delete($table, $where);
	Ajax('ลบเมนูสำเร็จ!');
}
//添加或者删除快捷菜单
else if ( $type == 'quick' )
{
	$table = '@system_menu_quick';
	$where['table'] = $table;
	$where['where']['quick_menu_id'] = Request('id');
	$where['where']['quick_manager_id'] = Session('admin_id');
	$data = wmsql::GetOne($where);
	//存在数据就删除
	if( $data )
	{
		$quickWhere = array("quick_id"=>$data['quick_id']);
		wmsql::Delete($table , $quickWhere);
		//写入操作记录
		SetOpLog( 'ยกเลิกเมนูทางลัด' , 'system' , 'delete' , $table , $quickWhere);
		Ajax('ยกเลิกเมนูทางลัดสำเร็จ!');
	}
	//不存在就添加快捷菜单
	else
	{
		wmsql::Insert($table, $where['where']);
		//写入操作记录
		SetOpLog( 'เพิ่มเมนูทางลัด' , 'system' , 'insert' , $table , $where['where']);
		Ajax('เพิ่มเมนูทางลัดสำเร็จ!');
	}
}
//快捷菜单排序
else if ( $type == 'quickorder' )
{
	if( empty($post['qucik']) )
	{
		Ajax('ขออภัย! โปรดเพิ่มเมนูางลัดก่อน',300);
	}
	else
	{
		foreach ($post['qucik'] as $k=>$v)
		{
			wmsql::Update('@system_menu_quick', array('quick_order'=>$v), array('quick_id'=>$k));
		}
		//写入操作记录
		SetOpLog( 'แก้ไขลำดับเมนูทางลัด' , 'system' , 'update' , $table );
		Ajax('แก้ไขลำดับเมนูทางลัดสำเร็จ!');
	}
}
//设置默认首页
else if ( $type == 'default_index' )
{
	$data['default_controller'] = Post('index');
	if( $data['default_controller'] == '' )
	{
		Ajax('ขออภัย! ต้องเลือกตัวควบคุมก่อน');
	} 
	else
	{
		$menuMod = NewModel('system.menu');
		$defaultData = $menuMod->DefaultGetOne(Session('admin_id'));
		if( $defaultData )
		{
			$menuMod->DefaultSave($data,$defaultData['default_id']);
		}
		else
		{
			$data['default_mid'] = Session('admin_id');
			$menuMod->DefaultInsert($data);
		}
		//写入操作记录
		SetOpLog( 'แก้ไขค่าเริ่มต้นหน้าหลัก' , 'system' , 'update' , $table );
		Ajax('แก้ไขค่าเริ่มต้นหน้าหลักสำเร็จ! โปรดรีเฟรชเพื่อดูผลลัพธ์');
	}
}
?>