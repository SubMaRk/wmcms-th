<?php
use Qiniu\json_decode;
/**
* 域名处理器
*
* @version        $Id: system.api.php 2016年3月28日 11:12  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$manager = AdminNewClass('manager');

//如果请求信息存在
if( $post )
{
	//前置判断是否绑定了后台域名，并且为开启状态。如果是就进行验证，是否能够访问。
	if( $post['admin_domain'] != '' && $C['config']['web']['admin_path'] != '' && GetKey($post,'395') != '' )
	{
		$httpSer = NewClass('http');
		$httpSer->timeout = 4;
		$code = $httpSer->GetUrl($post['admin_domain'].'/'.$post['admin_path']);
		if( empty($code) || !$code )
		{
			Ajax('ขออภัย! โปรดตรวจสอบให้มั่นใจว่าชื่อโดเมนในพื้นหลังสามารถเข้าถึงได้ตามปกติ ไม่เช่นนั้นคุณจะไม่สามารถเข้าถึงพื้นหลังนี้ได้',300);
		}
	}
	else
	{
		//$post['395'] = 0;
	}

	//模版域名设置修改
	foreach ($post as $k=>$v)
	{
		if( $k != 'domain' )
		{
			$where = array();
			$data = array();
			
			//如果是id设置
			if(str::Int($k)=='395' || $k == 'admin_domain_access')
			{
				$where['config_id'] = 395;
			}
			//普通
			else
			{
				$where['config_name'] = $k;	
			}
			$data['config_value'] = $v;
			$data = str::Escape($data , 'e');

			wmsql::Update('@config_config', $data, $where);
		}
	}

	//写入操作记录
	SetOpLog( 'แก้ไขกำหนดค่าชื่อโดเมน' , 'system' , 'update' );
	
	//更新配置文件
	$manager->UpConfig('web');

	
	//模块域名绑定
	if( isset($post['domain']) && is_array($post['domain']) )
	foreach ($post['domain'] as $k=>$v)
	{
		$where = array();
		$data = array();
		$where['domain_id'] = $k;
		$data['domain_domain'] = $v;
		wmsql::Update('@system_domain', $data, $where);
	}
	
	//更新域名配置文件
	//这里原来是把库里的值直接拼进 PHP 源码，值里带一个单引号就能写进任意代码。
	//现在先用 var_export 生成字面量，并且只接受合法主机名。
	$domainWhere['table'] = '@system_domain';
	$domainArr = wmsql::GetAll($domainWhere);
	$config = '';
	foreach ($domainArr as $v)
	{
		$name = (string)$v['domain_name'];
		$host = (string)$v['domain_domain'];
		//域名/主机名白名单：字母数字、点、减号、冒号（端口），不能有引号或反斜杠
		if( $name === '' || !preg_match('/^[A-Za-z0-9.\-:]{1,190}$/', $name) )
		{
			continue;
		}
		if( $host !== '' && !preg_match('/^[A-Za-z0-9.\-:]{1,190}$/', $host) )
		{
			continue;
		}
		$config .= var_export($name,true)." => array('domain'=>".var_export($host,true).",'index'=>".var_export((string)$v['domain_index'],true)."),";
	}
	file_put_contents( WMCONFIG."domain.config.php" , '<?php $C["config"]["domain"]=array('.$config.');?>');
	
	Ajax();
}
?>