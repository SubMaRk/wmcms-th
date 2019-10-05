<?php
/**
* 内容标签模块模型
*
* @version        $Id: tags.model.php 2016年12月31日 12:31  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class TagsModel
{
	public $table = '@system_tags';
	
	function __construct( $data = '' ){}


	
	/**
	 * 写入tag标签的数据
	 * @param 参数1，必须，所属的模块
	 * @param 参数2，必须，标签的名字
	 */
	function SetTags( $module , $name )
	{
		$where['table'] = $this->table;
		$where['where']['tags_module'] = $module;
		
		$nameArr = explode(',', $name);
		foreach ($nameArr as $k=>$v)
		{
			$where['where']['tags_name'] = $v;
			$count = wmsql::GetCount($where);
			
			//存在数据就自增
			if( $count > 0 )
			{
				wmsql::Inc($this->table, 'tags_data', $where['where']);
			}
			//否则就插入新的数据
			else
			{
				$pinyinSer = NewClass('pinyin');
				
				$data = $where['where'];
				$data['tags_time'] = time();
				$data['tags_pinyin'] = $pinyinSer->topy($v);
				
				wmsql::Insert($this->table, $data);
			}
		}
	}
}
?>