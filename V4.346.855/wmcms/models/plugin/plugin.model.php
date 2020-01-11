<?php
/**
* 插件模型
*
* @version        $Id: plugin.model.php 2018年6月7日 19:18  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class PluginModel
{
	private $pluginTable = '@plugin';
	private $configTable = '@plugin_config';
	
	/**
	 * 构造函数
	 */
	function __construct()
	{
	}
	
	
	/**
	 * 根据文件夹名字查询插件
	 * @param 参数1，必须，文件夹名字
	 */
	function GetByFloder($floder)
	{
		$where['plugin_floder'] = $floder;
		return $this->GetOne($where);
	}
	
	/**
	 * 根据插件ID获得数据
	 * @param 参数1，必须，插件id
	 */
	function GetById($id)
	{
		$where['plugin_id'] = $id;
		return $this->GetOne($where);
	}
	
	/**
	 * 查询一条数据
	 * @param 参数1，必须，查询条件
	 */
	function GetOne($where)
	{
		$wheresql['table'] = $this->pluginTable;
		$wheresql['where'] = $where;
		return wmsql::GetOne($wheresql);
	}
	
	
	/**
	 * 获得插件列表
	 * @param 参数1，选填，是否进行条件查询
	 */
	function GetList($where=array())
	{
		$wheresql['table'] = $this->pluginTable;
		$wheresql['where'] = $where;
		return wmsql::GetAll($wheresql);
	}
	
	
	/**
	 * 安装插件
	 * @param 参数1，必须，需要插入的数据
	 */
	function Insert($data)
	{
		$data['plugin_time'] = time();
		return wmsql::Insert($this->pluginTable, $data);
	}
	
	
	/**
	 * 根据id删除数据
	 * @param 参数1，必须，需要删除的ID
	 */
	function DelById($id)
	{
		//删除插件
		$where['plugin_id'] = $id;
		wmsql::Delete($this->pluginTable,$where);
		//删除配置
		$configWhere['config_plugin_id'] = $id;
		wmsql::Delete($this->configTable,$configWhere);
		return true;
	}
	
	
	/**
	 * 修改插件的版本信息
	 * @param 参数1，必须，应用id标识
	 * @param 参数2，必须，应用需要修改的版本
	 */
	function UpdateVersion($ids,$version)
	{
		$data['plugin_version'] = $version;
		$where['plugin_floder'] = $ids;
		return wmsql::Update($this->pluginTable, $data, $where);
	}
}
?>