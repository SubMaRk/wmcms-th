<?php
/**
* 全系统评论列表请求处理
*
* @version        $Id: replay.php 2015年8月16日 16:55  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime 		  2016年5月27日 21:38  weimeng
*
*/
//获取指定的参数
$page = str::Page( Request('page') );
$order = Request('order');
$cid = str::Int( Request( 'cid' ) );
$pageCount = $replayConfig['list_limit'];
$where = array();

//如果排序是热门
if( $order == 'hot' )
{
	$page = 1;
	//显示多少条热门评论
	$pageCount = $replayConfig['hot_count'];
	$order = 'replay_ding desc';
	$where['replay_ding'] = array('>=',$replayConfig['hot_display']);
}
else
{
	$order = 'replay_time desc';
}

//数据模型
$replayMod = NewModel('replay.replay');
//设置数据
$replayMod->cid = $cid;
$replayMod->order = $order;
$replayMod->module = $module;

//获取列表
$data = $replayMod->GetList($page,$pageCount,$where);
if( $data['data'] )
{
	$furl = tpl::Url('user_fhome');
	foreach ($data['data'] as $k=>$v)
	{
		//替换评论内容的表情
		$newData = $replayMod->RepReplayFace($v,$furl,$userConfig['default_head']);
		
		$data['data'][$k]['replay_content'] = $newData['replay_content'];
		$data['data'][$k]['fhome'] = $newData['fhome'];
	}
}

ReturnData( null , true , 200 , $data );
?>