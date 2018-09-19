<?php
/**
 * 后台操作类文件
 *
 * @version        $Id: manager.class.php 2016年3月25日 10:33  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class manager{
	
	
	/**
	 * 获得菜单目录的数组
	 * @param 参数1，选填，是否转换子树形数组，默认为是
	 * @param 参数2，选填，默认是1，只显示正常状态的，a为全部菜单
	 */
	function GetMenu( $tree = true , $status = '1' )
	{
		$wheresql['table'] = '@system_menu';
		$wheresql['order'] = 'menu_order,menu_pid';
		//设置菜单查询条件
		if( $status != 'a' )
		{
			$wheresql['where']['menu_group'] = array('or','0,1');
			$wheresql['where']['menu_status'] = $status;
		}
		//如果不是超级管理员就只查询权限目录
		if( Session('admin_cid') != 0 )
		{
			$wheresql['filed'] = '@system_menu.*';
			$wheresql['table'] = '@system_menu,@system_competence';
			$wheresql['where']['menu_id'] = array('string','FIND_IN_SET(menu_id,comp_content) and comp_id='.Session('admin_cid'));
		}
		$menuArr = wmsql::GetAll($wheresql);
		
		if ( $tree )
		{
			$menuArr = str::Tree( $menuArr , 'menu_pid', 'menu_id' , 0 );
		}
		return $menuArr;
	}

	

	/**
	 * 获得快捷菜单
	 */
	function GetQuickMenu()
	{
		//查询当前管理员的快捷菜单配置
		$where['table'] = '@system_menu_quick';
		$where['field'] = 'quick_id,menu_id,menu_title,menu_file,menu_ico,quick_order';
		$where['left']['@system_menu'] = 'quick_menu_id = menu_id';
		$where['where']['quick_manager_id'] = Session('admin_id');
		$where['order'] = 'quick_order';
		$menuArr = wmsql::GetAll($where);
		
		return $menuArr;
	}
	
	
	/**
	 * 获得配置数组
	 * @param 参数1，必须，配置的模块
	 */
	function GetConfig( $module )
	{
		$wheresql['table'] = '@config_config';
		$wheresql['where']['config_module'] = $module;
		$wheresql['order'] = 'config_order';
		$configArr = wmsql::GetAll($wheresql);
		return $configArr;
	}
	
	
	/**
	 * 获取表单内容
	 * @param 参数1，必须，配置文件的数组
	 * @param 参数2，选填，如果填了此项就自动查询
	 * @param 参数3，选填，自定义表单的时候传入的option数组
	 */
	function GetForm( $val , $name = '' , $isDiy = false)
	{
		$option = array();
		if($isDiy == true)
		{
			$val['config_formtype'] = $val['type'];
			$val['config_name'] = @$val['id'];
			$val['config_id'] = $val['name'];
			$val['config_value'] = $val['value'];
			$option = $val['option'];
		}
		else if( $name != '' )
		{
			$where['table'] = '@config_config';
			$where['where']['config_module'] = $val;
			$where['where']['config_name'] = $name;
			$val = WMSql::GetOne($where);
		}

		switch ( $val['config_formtype'])
		{
			case 'select';
				$form = '<select id="'.$val['config_name'].'" name="'.$val['config_id'].'" data-toggle="selectpicker">
						'.$this->GetConfigOption($val['config_id'], $val['config_value'] , 'select' , $option).'
						</select>';
				break;
		
			case 'textarea';
				$form = '<textarea id="'.$val['config_name'].'" name="'.$val['config_id'].'">'.$val['config_value'].'</textarea>';
				break;

			case 'radio';
				$form = $this->GetConfigOption($val['config_id'], $val['config_value'] , $val['config_formtype'] , $option );
				break;

			case 'check';
				$form = $this->GetConfigOption($val['config_id'], $val['config_value'] , $val['config_formtype'] , $option );
				break;
		
			default:
				$form = '<input type="text" id="'.$val['config_name'].'" name="'.$val['config_id'].'" value="'.htmlspecialchars($val['config_value']).'">';
				break;
		}
		
		return $form;
	}
	
	/**
	 * 获得配置文件的下拉列表值
	 * @param 参数1，必须，配置的数组
	 * config_name：option的值
	 * config_value：目前选中的值
	 * @param 参数2，选填，默认选中的值
	 * @param 参数3，选填，是下拉列表还是单选按钮，默认为下拉列表
	 * @param 参数4，选填，自定义的数组
	 */
	function GetConfigOption( $name , $val = '' , $type = 'select'  , $option=array())
	{
		$optionArr = array();
		if( empty($option) )
		{
			$wheresql['table'] = '@config_option as o';
			$wheresql['where']['c.config_id'] = $name;
			$wheresql['left']['@config_config as c'] = 'o.config_id=c.config_id';
			$wheresql['order'] = 'option_order';
			$optionArr = wmsql::GetAll($wheresql);
		}
		else
		{
			foreach($option as $k=>$v)
			{
				$data['option_value'] = $k;
				$data['config_id'] = $name;
				$data['option_title'] = $v;
				$optionArr[] = $data;
			}
		}
		
		$optionText = $selected = '';
		if( $optionArr )
		{
			foreach ( $optionArr as $k=>$v)
			{
				switch ($type)
				{
					//单选按钮
					case 'radio':
						if ( $v['option_value'] == $val )
						{
							$selected = 'checked="1"';
						}
						$optionText .= '<input name="'.$v['config_id'].'" type="radio" data-toggle="icheck" data-label="'.$v['option_title'].'" value="'.$v['option_value'].'" '.$selected.' />&nbsp;&nbsp;&nbsp;&nbsp;';
						break;

					//多选按钮
					case 'check':
						if ( $v['option_value'] == $val )
						{
							$selected = 'checked="1"';
						}
						$optionText .= '<input name="'.$v['config_id'].'" type="checkbox" data-toggle="icheck" data-label="'.$v['option_title'].'" value="'.$v['option_value'].'" '.$selected.' />&nbsp;&nbsp;&nbsp;&nbsp;';
						break;
						
					//下拉列表
					default:
						if ( $v['option_value'] == $val )
						{
							$selected = 'selected=""';
						}
						$optionText .= '<option value="'.$v['option_value'].'" '.$selected.'>'.$v['option_title'].'</option>';
						break;
				}
				$selected = '';
			}
		}
		else
		{
			switch ($type)
			{
				//单选按钮
				case 'radio':
					$optionText .= '<input type="radio" data-toggle="icheck" data-label="暂无选项" value="" />';
					break;
					
				//多选按钮
				case 'radio':
					$optionText .= '<input type="checkbox" data-toggle="icheck" data-label="暂无选项" value="" />';
					break;

				//下拉列表
				default:
					$optionText .= '<option value="0">暂无选项</option>';
					break;
			}
		}
		
		return $optionText;
	}
	
	
	
	/**
	 * 更新配置文件
	 * @param 参数1，必须，分组的标识
	 * @param 参数1，选填，是否使系统模块
	 */
	function UpConfig( $groupName , $isSys = false)
	{
		$config = '';
		//先查询配置分组的信息
		$wheresql['table'] = '@config_group as g';
		$wheresql['where']['group_name'] = $groupName;
		$wheresql['left']['@config_config as c'] = 'g.group_id=c.group_id';
		$configArr = wmsql::GetAll($wheresql);

		//存在配置分组就进行配置项查询
		if ( $configArr )
		{
			foreach ($configArr as $v)
			{
				$config .="'{$v['config_name']}' => '".str::Escape($v['config_value'] , 'e')."',";
			}
			
			switch ($groupName)
			{
				case 'web':
					$fileName = WMCONFIG."web.config.php";//定义好要创建的文件名称
					$configName = '$C["config"]["web"]';
					break;

				case 'site':
					$fileName = WMCONFIG."site.config.php";//定义好要创建的文件名称
					$configName = '$C["config"]["site"]';
					break;

				default:
					if( $isSys == false )
					{
						$fileName = WMMODULE.$groupName."/".$groupName.".config.php";//定义好要创建的文件名称
					}
					else
					{
						$fileName = WMSYSMODULE.$groupName."/".$groupName.".config.php";//定义好要创建的文件名称
					}
					$configName = '$'.$groupName.'Config';
					break;
			}

			file_put_contents( $fileName , '<?php '.$configName.'=array('.$config.');?>');
		}
		
		return true;
	}
	



	/**
	 * 获得分类的树形列表数据
	 * @param 参数1，必须，分类数组
	 * @param 参数2，必须，当前分类模块的类对象
	 */
	function GetTypeList( $typeArr , $typeSer )
	{
		if( $typeArr )
		{
			foreach ( $typeArr as $k=>$v )
			{
				echo '<dl class="cate-item">';
				$typeSer->GetHtml($v);
	
				if( is_array( $v['child'] ) )
				{
					echo '<dd style="display:none">';
					foreach ($v['child'] as $k1=>$v1 )
					{
						echo '<dl class="cate-item">';
						$typeSer->GetHtml($v1);
	
						if( is_array( $v1['child'] ) )
						{
							echo '<dd style="display:none">';
							foreach ($v1['child'] as $k2=>$v2 )
							{
								echo '<dl class="cate-item">';
								$typeSer->GetHtml($v2);
	
								if( is_array( $v2['child'] ) )
								{
									echo '<dd style="display:none">';
									foreach ($v2['child'] as $k3=>$v3 )
									{
										echo '<dl class="cate-item">';
										$typeSer->GetHtml($v3 , 3);
										echo '</dl>';
									}
									echo '</dd>';
								}
								echo '</dl>';
							}
							echo '</dd>';
						}
	
						echo '</dl>';
					}
					echo '</dd>';
				}
				echo '</dl>';
			}
		}
	}
	
	
	
	/**
	 * 写入tag标签的数据
	 * @param 参数1，必须，所属的模块
	 * @param 参数2，必须，标签的名字
	 */
	function SetTags( $module , $name )
	{
		$table = '@system_tags';
		$where['table'] = $table;
		$where['where']['tags_module'] = $module;
		
		$nameArr = explode(',', $name);
		foreach ($nameArr as $k=>$v)
		{
			if( $v != '' )
			{
				$where['where']['tags_name'] = $v;
				$count = wmsql::GetCount($where);
				
				//存在数据就自增
				if( $count > 0 )
				{
					wmsql::Inc($table, 'tags_data', $where['where']);
				}
				//否则就插入新的数据
				else
				{
					$pinyinSer = NewClass('pinyin');
					
					$data = $where['where'];
					$data['tags_time'] = time();
					$data['tags_pinyin'] = $pinyinSer->topy($v);
					
					wmsql::Insert($table, $data);
				}
			}
		}
	}
	
	/**
	 * 获得指定模块当前绑定的的功能模块 
	 * @param 参数1，必须，当前模块
	 */
	function GetModule($moduleName = '')
	{
		$content = $this->GetModuleCommon($moduleName);

		//读取当前使用的基本模块
		$moduleArr = tpl::Tag('BaseModule = array([a])', $content);
		$moduleArr = tpl::Tag("'[a]'" , $moduleArr[1][0]);
			
		return $moduleArr[1];
	}
	/**
	 * 获得指定模块当前绑定的的功能模块
	 * @param 参数1，必须，当前模块
	 */
	function GetModuleCommon($moduleName = '')
	{
		if ( $moduleName != '' )
		{
			//打开模块公共文件
			$fileName = WMMODULE.$moduleName.'/'.$moduleName.'.common.php';
			$content = file::GetFile($fileName);
			return $content;
		}
	}
}
?>