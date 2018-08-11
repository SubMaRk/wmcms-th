<?php
/**
* 专题内容页
*
* @version        $Id: zt.php 2015年8月9日 21:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime		  2016年5月10日 12:00 weimeng
*
*/
//引入模块公共文件
$ModuleArr = array('all');
require_once 'zt.common.php';

//当前页面的参数检测
$zid = str::IsEmpty( Get('zid') , $lang['zt']['par']['zid_no'] );

//参数验证
$where = zt::GetPar( 'content' , $zid);

//获得页面的标题等信息
$data = str::GetOne(zt::GetData( 'content' , $where , $lang['system']['content']['no'] ));
$data['title'] = $data['zt_title'];
$data['key'] = $data['zt_key'];
$data['desc'] = $data['zt_desc'];

//设置默认SEO信息
$seoArr = array(
	'pagetype'=>'index' ,
	'data'=>$data ,
	'tempid'=>'zt_ctempid' ,
	'dtemp'=>'zt/zt.html',
	'label'=>'ztlabel',
	'label_fun'=>'ZtLabel',
	'did'=>$data['zt_id'],
);

//设置seo信息
C('page' , $seoArr);
tpl::GetSeo();

//阅读量自增
wmsql::Inc( '@zt_zt' , 'zt_read' , $where);

//创建模版并且输出
$tpl=new tpl();
$tpl->display();
?>