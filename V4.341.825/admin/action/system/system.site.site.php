<?php
/**
* 站群配置处理器
*
* @version        $Id: system.site.product.php 2017年6月11日 15:00  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@site_site';
$siteMod = NewModel('system.site');

//修改、测试配置信息
if ( $type == 'edit' || $type == "add" )
{
	$data = str::Escape($post['data'] , 'e');
	$where['site_id'] = Request('site_id');
	foreach ($data as $k=>$v)
	{
		if( $v == '' )
		{
			Ajax('ขออภัย! ฟิลด์ทั้งหมดต้องไม่ว่าง' , 300);
		}
	}
	//检查域名
	if( !str::CheckUrl($data['site_domain']) )
	{
		Ajax('ขออภัย! โปรดกรอกชื่อโดเมนแบบเต็ม คุณต้องใส่ http หรือ https ด้วย',300);
	}
	
	//小说名字检查
	$wheresql['site_id'] = array('<>',$where['site_id']);
	$wheresql['site_domain'] = $data['site_domain'];
	$wheresql['site_domain_type'] = $data['site_domain_type'];
	if( $siteMod->SiteGetOne($wheresql) )
	{
		Ajax('ขออภัย! มีประเภทของชื่อโดเมนเว็บไซต์อยู่แล้ว' , 300);
	}
	//如果是新增
	else if ( $type == 'add' )
	{
		//插入记录
		$where['site_id'] = $siteMod->SiteInsert($data);
		//写入操作记录
		SetOpLog( 'เพิ่มกลุ่มเว็บไซต์'.$data['site_title'] , 'system' , 'insert' , $table , $where , $data );
		Ajax('เพิ่มกลุ่มเว็บไซต์สำเร็จ!');
	}
	//如果是增加页面
	else
	{
		//写入操作记录
		SetOpLog( 'แก้ไขกลุ่มเว็บไซต์' , 'system' , 'update' , $table  , $where , $data );
		//修改数据
		$siteMod->SiteUpdate($data,$where);
		Ajax('แก้ไขกลุ่มเว็บไซต์สำเร็จ!');
	}
}
//删除站外站点
else if ( $type == 'del' )
{
	$where['site_id'] = GetDelId();
	$siteMod->SiteDel($where);
	//写入操作记录
	SetOpLog( 'ลบกลุ่มเว็บไซต์' , 'system' , 'delete' , $table , $where);
	Ajax('ลบกลุ่มเว็บไซต์สำเร็จ!');
}
//清空站外站点
else if ( $type == 'clear' )
{
	$siteMod->SiteDel();
	//写入操作记录
	SetOpLog( 'ล้างกลุ่มเว็บไซต์' , 'system' , 'delete' , $table , $where);
	Ajax('ล้างกลุ่มเว็บไซต์สำเร็จ!');
}
//使用禁用站点
else if ( $type == 'status' )
{
	$data['site_status'] = Request('status');
	$where['site_id'] = GetDelId();

	if( Request('status') == '1')
	{
		$msg = 'ใช้งาน';
	}
	else
	{
		$msg = 'เลิกใช้';
	}
	$siteMod->SiteUpdate($data,$where);
	
	//写入操作记录
	SetOpLog( 'เว็บไซต์ถูก'.$msg , 'system' , 'update' , $table , $where);
	Ajax('เว็บไซต์ถูก'.$msg'แล้ว');
}
//获得站群的信息
else if ( $type == 'getsite' )
{
	$siteType = Request('st',1);
	$siteId = Request('id',1);
	$siteMod = NewModel('system.site');
	$rs['id'] = $siteId;
	$rs['type'] = $siteType;
	if($siteType=='0')
	{
		Session( 'admin_site_id' , '1');
	}
	else if($siteType=='1')
	{
		if( $C['config']['web']['site_open'] == '0' )
		{
			Ajax('ขออภัย! ผู้ดูแลระบบเปิดการใช้งานกลุ่มเว็บไซต์และคุณไม่มีสิทธิ์ในการจัดการชื่อโดเมน',300);
		}
		else
		{
			$data = $siteMod->SiteGetOne($siteId);
			if(!$data)
			{
				Ajax('ขออภัย! ไม่มีเว็บไซต์อยู่',300);
			}
			else
			{
				$siteArr = explode(',', Session('admin_site'));
				if( Session('admin_cid') != '0' && !in_array($siteId, $siteArr))
				{
					Ajax('ขออภัย! คุณไม่มีสิทธิ์ในการจัดการเว็บไซต์',300);
				}
				else
				{
					Session( 'admin_site_id' , $siteId);
				}
			}
		}
	}
	else
	{
		$data = $siteMod->ProGetOne($siteId);
		if(!$data)
		{
			Ajax('ขออภัย! ไม่มีเว็บไซต์อยู่',300);
		}
		else
		{
			$domain = $data['product_domain'].'/';
			$path = $data['product_admin'].'/';
			$url = $domain.$path.'index.php?isAjax=0&a=yes&c=login&name='.$data['product_name'].'&psw='.$data['product_psw'];
			$rs['url'] = $url;
		}
	}
	Ajax('คำร้องสำเร็จ!',200,$rs);
}
?>