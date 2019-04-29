<?php
/**
* 自定义网页类
*
* @version        $Id: zt.label.php 2015年9月19日 13:41  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime 		  2015年12月31日 14:42
*
*/

class ztlabel
{
	function __construct()
	{
		tpl::labelBefore();
		
		self::PublicUrl();
		
		self::PublicLabel();
	}
	

	//公共url替换
	static function PublicUrl()
	{
		$arr = array(
			'专题列表'=>tpl::url('zt_type' ),
		);
		tpl::Rep($arr);
	}
	
	
	/**
	 * 公共标签替换
	 **/
	static function PublicLabel()
	{
		//数组键：类名，值：方法名
		$CF['zt'] = 'GetData';
	
		$repFun['t']['ztlabel'] = 'PublicZt';
		tpl::Label('{专题:[s]}[a]{/专题}','content', $CF, $repFun['t']);
	}

	
	/**
	 * 公共diy内容标签替换
	 */
	static function PublicZt( $data , $blcode )
	{
		$code = '';
		$i = 1;
		//循环数据
		foreach ($data as $k => $v)
		{
			//没组数据循环，以字段名为标签名
			foreach ($v as $key => $val)
			{
				$arr1[L.$key]=$v[$key];
			}
			//每次循环重新调取原始标签
			$lcode = $blcode;
			
			//计数器标签和选中标签替换
			$lcode = tpl::I( $lcode , $i );
			$lcode = tpl::Cur( $v['zt_id'] , C('page.zid') , $lcode );
			
			//显示固定字数标签
			$nameArr = tpl::Exp('{专题简介:[d]}' , $v['zt_info'] , $lcode);

			//设置自定义中文标签
			$arr2=array(
				'i'=>$i,
				'url'=>tpl::url( 'zt_zt' , array('zid'=>$v['zt_id'],'pinyin'=>$v['zt_pinyin']) ),
				'id'=>$v['zt_id'],
				'专题简介'=>$v['zt_info'],
				'专题横幅'=>$v['zt_banner'],
				'专题图片'=>$v['zt_simg'],
				'专题拼音'=>$v['zt_pinyin'],
				'专题名字'=>$v['zt_name'],
				'专题简介'=>$v['zt_info'],
				'专题缩略图'=>$v['zt_simg'],
				'专题简介:'.@$nameArr[0]=>@$nameArr[1],
				'专题发布时间'=>date("Y-m-d H:i:s",$v['zt_time']),
				'专题发布时间:'.@$time[1][0]=>tpl::Time(@$time[1][0], $v['zt_time']),
			);
			//合并两组标签
			$arr = array_merge($arr1,$arr2);
			//替换标签
			$code.=tpl::rep($arr,$lcode);
			$i++;
		}
		
		//返回最后的结果
		return $code;
	}
	
	
	//diy标签
	static function ZtLabel()
	{
		$v = C('page.data');
		
		//匹配自定义时间标签
		$time = tpl::Tag('{发布时间:[s]}');
	
		tpl::rep(array(
			'内容链接'=>tpl::url( 'zt_zt' , array('zid'=>$v['zt_id'],'pinyin'=>$v['zt_pinyin']) ),
			'id'=>$v['zt_id'],
			'简介'=>$v['zt_info'],
			'横幅'=>$v['zt_banner'],
			'名字'=>$v['zt_name'],
			'拼音'=>$v['zt_pinyin'],
			'缩略图'=>$v['zt_simg'],
			'关键词'=>$v['zt_key'],
			'描述'=>$v['zt_desc'],
			'标题'=>$v['zt_title'],
			'内容'=>$v['zt_content'],
			'简介'=>$v['zt_info'],
			'资源路径'=>'/files/static/'.$v['zt_id'].'/'.GetPtMark(),
			'发布时间'=>date("Y-m-d H:i:s",$v['zt_time']),
			'发布时间:'.@$time[1][0]=>tpl::Time(@$time[1][0], $v['zt_time']),
		));
	
		//专题节点标签
		self::ZtNode();
		/* //评分标签
		common::ScoreLabel( 'score' , C('page.data.zt_id') );
*/
		//上下篇
		self::ZtPreNext(); 
	}
	
	/**
	 * 专题内容页的节点标签替换
	 */
	static function ZtNode()
	{
		//匹配节点标签
		$nodeArr = tpl::Tag('{节点:[s]}');

		//如果存在节点标签
		if( @$nodeArr[1][0] != '' )
		{
			$where['table'] = '@zt_node';
			$where['where']['node_zt_id'] = C('page.did');
			foreach ($nodeArr[1] as $k=>$v)
			{
				$where['where']['node_pinyin'] = $v;
				$data = wmsql::GetOne($where);
				//标签内容替换
				$content = '';
				if( $data )
				{
					if( $data['node_type'] == '1' )
					{
						$content = $data['node_img'];
					}
					else if( $data['node_type'] == '2' )
					{
						$content = $data['node_content'];
					}
					else if( $data['node_type'] == '3' )
					{
						$content = $data['node_label'];
					}
				}
				//替换的节点标签
				$repArr['节点:'.$v] = $content;
			}
			
			tpl::Rep($repArr);
		}
	}

	//上下一篇应用替换
	static function ZtPreNext(){
		$where['field'] = 'zt_id,zt_name';
		$where['table'] = '@zt_zt';
		$where['where']['zt_id'] = C('page.data.zt_id');
		
		$url = tpl::Url('zt_zt');
		
		common::PreNext( $where , 'zt_id' , C('page.data.zt_id') , $url , 'zid' , 'zt_name' );
	}
	
	
	/**
	 * 列表页标签替换
	 **/
	static function TypeLabel()
	{
		self::TypeList();
	
		$CF['zt'] = 'GetData';
		$repFun['a']['ztlabel'] = 'PublicZt';
		tpl::Label('{专题列表:[s]}[a]{/专题列表}','content', $CF, $repFun['a']);
	}
	
	/**
	 * 列表页条件替换
	 * 给专题列表标签加上各种限制条件。
	 **/
	static function TypeList()
	{
		$pageWhere = '';

		if ( C('page.page') > 0 )
		{
			$pageWhere = 'page='.C('page.page').';';
		}
	
		tpl::Rep( array('{专题列表:'=>'{专题列表:'.$pageWhere) , null , '2' );
	}
}
?>