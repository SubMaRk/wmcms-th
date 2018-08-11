<?php
/**
* 评论类文件
*
* @version        $Id: replay.class.php 2015年8月9日 21:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @update 		  2015年12月28日 16:07
*
*/
class replay
{
	static protected $module;
	static protected $cid;
	static protected $url;
	static protected $sum;
	static protected $count;
	static protected $limit;
	static protected $page;
	//评论配置
	static protected $replayConfig;
	//楼层
	static protected $floorArr;
	
	function __construct( $module = '' , $cid = '' , $url = '' , $count = '0')
	{
		if ( $module != '' && $cid != '' && $url != '' )
		{
			self::$replayConfig = C('',null,'replayConfig');
			self::$floorArr = explode("\r\n", self::$replayConfig['replay_floor_nickname']);
			
			self::$module = $module;
			self::$cid = $cid;
			self::$url = $url;
			self::$count = $count;
			$this->SetWhere();
	
			//调用模版处理文件
			new replaylabel();
		}
	}
	
	
	//设置where条件
	function SetWhere()
	{
		//设置评论哪些模块可用,模块简称=>模块全称
		$moduleArr = array(
			'novel'=>'novel',
			'article'=>'article',
			'app'=>'app',
			'diy'=>'diy',
			'zt'=>'zt',
			'link'=>'link',
			'bbs'=>'bbs',
			'picture'=>'picture',
		);

		if ( array_key_exists( self::$module , $moduleArr ) )
		{
			$whereLabel = 'replay_module='.self::$module.';replay_cid='.self::$cid.';';
		}
		else
		{
			$whereLabel = 'replay_module=article;replay_cid=0;';
		}
		tpl::Rep( array('{评论:'=>'{评论:'.$whereLabel,'{评论列表:'=>'{评论列表:'.$whereLabel) , null , '2' );
	}
	
	
	//获取评论数据
	static function GetData( $type = '' , $where = array() )
	{
		//设置需要替换的字段
		$wheresql = self::GetWhere( $where );
		$wheresql['field'] = '@replay_replay.*,user_sex,user_name,user_nickname,user_head';
		$wheresql['table'] = '@replay_replay';
		$wheresql['where']['replay_status'] = '1';
		$wheresql['left']['@user_user'] = 'replay_uid = user_id';
		
		$data = wmsql::GetAll($wheresql);

		//总数量
		$count = wmsql::GetCount($wheresql , 'replay_id');
		
		if( class_exists('page') )
		{
			page::Start( self::$url , $count ,$wheresql['limit'] );
		}

		//参与人数
		unset($wheresql['where']['replay_status']);
		$sum = wmsql::GetCount($wheresql , 'replay_id');
		
		self::$sum = $sum;
		self::$count = $count;
		self::$limit = $wheresql['limit'];

		return $data;
	}
	
	//匹配中文条件
	static function GetWhere( $where )
	{
		//设置需要替换的字段
		$arr = array(
			'顺序' =>'replay_time',
			'时间' =>'replay_time desc',
			'最新' =>'replay_time desc',
			'最热' =>'replay_ding desc',
			'最差' =>'replay_cai desc',
		);
		
		return tpl::GetWhere( $where , $arr );
	}
}
?>