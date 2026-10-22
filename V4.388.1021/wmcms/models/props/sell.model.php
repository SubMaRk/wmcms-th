<?php
/**
* 道具销售记录模块模型
*
* @version        $Id: sell.model.php 2017年3月11日 21:21  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class SellModel
{
	public $sellTable = '@props_sell';
	public $propsTable = '@props_props';
	
	/**
	 * 构造函数
	 */
	function __construct(){}

	
	/**
	 * 根据模块的内容id获得所有数据
	 * @param 参数1，必须，模块
	 * @param 参数2，必须，内容id
	 */
	function GetByCid($module,$cid)
	{
		$where['table'] = $this->sellTable;
		$where['where']['sell_module'] = $module;
		$where['where']['sell_cid'] = $cid;
		return wmsql::GetAll($where);
	}
	
	/**
	 * 获得所有道具销售数据
	 * @param 参数1，必须，查询条件
	 */
	function GetAll($wheresql='')
	{
		$where['table'] = $this->sellTable;
		$where['left'][$this->propsTable] = 'sell_props_id=props_id';
		$where['where'] = $wheresql;
		return wmsql::GetAll($where);
	}
}
?>