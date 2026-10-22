<?php
/**
* 绑定模块设置处理器
*
* @version        $Id: system.module.config.php 2016年9月14日 11:35  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$manager = AdminNewClass('manager');

//编辑绑定模块
if( $type == 'edit' )
{
	$modlueStr = '';
	$moduleName = Get('module');
	$moduleArr = $post['module'];
	//模块名会拼进文件路径，只允许存在的模块目录，避免路径穿越
	if( !preg_match('/^[a-zA-Z0-9_]{1,32}$/', (string)$moduleName) || !is_dir(WMMODULE.$moduleName) )
	{
		Ajax('ไม่พบโมดูลนี้' , 300);
	}
	
	foreach ($moduleArr as $k=>$v)
	{
		//如果是用户模块就设置成第一位。
		if( $v == 'user' )
		{
			$modlueStr = "'{$v}',".$modlueStr;
		}
		else
		{
			$modlueStr .= "'{$v}'";
			if( !IsLast($moduleArr , $v) )
			{
				$modlueStr .= ',';
			}
		}
	}

	//获得模块公共配置内容
	$content = $manager->GetModuleCommon($moduleName);
	$commonModule = tpl::Tag('BaseModule = array([a])', $content);
	
	$content = tpl::Rep( array( $commonModule[1][0] => $modlueStr ) , $content , 2);
	
	//写入文件内容
	file_put_contents(WMMODULE.$moduleName.'/'.$moduleName.'.common.php', $content);
	Ajax( 'ยินดีด้วย! ผูกโมดูลสำเร็จ' , 200);
}
?>