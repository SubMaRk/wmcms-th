<?php
/**
* 小说销售统计控制器
*
* @version        $Id: novel.sell.log.php 2017年8月11日 16:12  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$nid = Get('nid',1);
$novelMod = NewModel('novel.novel');
$subMod = NewModel('novel.sublog');
$propsMod = NewModel('props.sell');
$rewardMod = NewModel('novel.rewardlog');
$timeSer = NewClass('time');

//获得小说基本信息
$data = $novelMod->GetOne($nid);
$data['novel_name'] = str::DelHtml($data['novel_name']);

//获得订阅小说数据
$subData = $subMod->GetByNid($nid);
$data['sub'] = $timeSer->GetListTimeData($subData,array('log_gold2','log_time'));
//获得道具销售数据
$propsData = $propsMod->GetByCid('novel',$nid);
$data['props'] = $timeSer->GetListTimeData($propsData,array('sell_gold2','sell_time'));
//获得打赏销售数据
$rewardData = $rewardMod->GetByNid($nid);
$data['reward'] = $timeSer->GetListTimeData($rewardData,array('log_gold2','log_time'));

//盈利统计
$data['total']['today'] = $data['sub']['today'] + $data['reward']['today'] + $data['props']['today'];
$data['total']['yesterday'] = $data['sub']['yesterday'] + $data['reward']['yesterday'] + $data['props']['yesterday'];
$data['total']['all'] = $data['sub']['all'] + $data['reward']['all'] + $data['props']['all'];

//今日、全部销售排行
$data['sell'] = array(
	'today'=>array(
		'sub'=>$data['sub']['today'],
		'reward'=>$data['reward']['today'],
		'props'=>$data['props']['today'],
	),
	'all'=>array(
		'sub'=>$data['sub']['all'],
		'reward'=>$data['reward']['all'],
		'props'=>$data['props']['all'],
	)
);
?>