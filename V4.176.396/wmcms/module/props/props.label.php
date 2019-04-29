<?php
/**
* 道具标签处理类
*
* @version        $Id: props.label.php 2017年3月17日 18:00  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
class propsLabel extends props
{
	static public $lcode;
	static public $data;
	static public $CF = array('props'=>'GetData');
	
	function __construct()
	{
		self::PublicLabel();
	}
	
	/**
	* 关于信息标签公共标签替换
	**/
	static function PublicLabel()
	{
		$repFun['a']['propslabel'] = 'PublicProps';
		tpl::Label('{道具:[s]}[a]{/道具}','content', self::$CF, $repFun['a']);
	}


	/**
	* 公共标签替换
	 * @param 参数1，数组，需要进行操作的数组
	 * @param 参数2，字符串，需要进行替换的标签
	**/
	static function PublicProps($data,$blcode)
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
			
			//设置自定义中文标签
			$arr2=array(
				'i'=>$i,
				'道具id'=>$v['props_id'],
				'道具名字'=>$v['props_name'],
				'道具图标'=>$v['props_cover'],
				'道具库存'=>$v['props_stock'],
				'道具消费类型'=>$v['props_cost'],
				'道具介绍'=>$v['props_desc'],
				'道具价格1'=>$v['props_gold1'],
				'道具价格2'=>$v['props_gold2'],
				'道具售价'=>$v['props_money'],
			);

			//合并两组标签
			$arr = array_merge($arr1 , $arr2);
			//替换标签
			$code .= tpl::rep($arr,$lcode);
			
			$i++;
		}
		//返回最后的结果
		return $code;
	}
}
?>