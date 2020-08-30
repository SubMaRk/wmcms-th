<?php
/**
* 申请模型
*
* @version        $Id: apply.model.php 2017年1月11日 19:35  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class ApplyModel
{
	public $applyTable = '@system_apply';
	private $module;
	private $config;
	private $msgMod;
	
	
	function __construct($module='author')
	{
		//获得配置
		$this->module = $module;
		if( $module != '' )
		{
			$this->config = GetModuleConfig($module);
		}
		$this->msgMod = NewModel('user.msg');
	}
	

	/**
	 * 获得拒绝申请的备注信息
	 * @param 参数1，必须，申请类型
	 * @param 参数2，选填，处理请求的类型
	 */
	function GetHandleRemark($type , $status=2)
	{
		return $this->config[$this->module.'_'.$type.'_'.$status];
	}
	
	
	/**
	 * 插入申请记录
	 * @param 参数1，必须，记录数据
	 * @param 参数2，选填，是否发送消息？
	 */
	function Insert($data , $sendMsg = 1 )
	{
		$data['apply_createtime'] = time();
		if( array_key_exists('apply_option',$data))
		{
			$data['apply_option'] = serialize($data['apply_option']);
		}
		//如果是自动审核
		if( $data['apply_status'] == 1 )
		{
			$data['apply_updatetime'] = time();
		}
		
		//是否发送消息给用户
		if( $sendMsg == 1)
		{
			$remark = $this->GetHandleRemark($data['apply_type'] , $data['apply_status']);
			$this->msgMod->Insert($data['apply_uid'] , $remark);
		}
		
		return wmsql::Insert($this->applyTable, $data);
	}
	
	/**
	 * 修改申请数据
	 * @param 参数1，必须，所属的模块
	 * @param 参数2，必须，所属模块的类型
	 * @param 参数3，必须，需要修改的内容id
	 */
	function UpdateCid($type , $cid)
	{
		$where['apply_module'] = $this->module;
		$where['apply_type'] = $type;
		$where['apply_cid'] = 0;
		$data['apply_cid'] = $cid;
		return wmsql::Update($this->applyTable, $data, $where);
	}

	/**
	 * 修改申请的状态
	 * @param 参数1，必须，申请id
	 * @param 参数2，选填，需要修改的状态
	 */
	function UpdateStatus($id , $status = 0)
	{
		$where['apply_id'] = $id;
		$data['apply_status'] = $status;
		return wmsql::Update($this->applyTable, $data, $where);
	}

	/**
	 * 批量修改申请的状态
	 * @param 参数1，必须，操作类型
	 * @param 参数2，必须，内容的条件
	 */
	function BatchUpdateStatus($type , $cid = 0)
	{
		$data['apply_status'] = 1;
		$where['apply_status'] = 0;
		$where['apply_module'] = $this->module;
		$where['apply_type'] = $type;
		$where['apply_uid'] = array('>',0);
		if( $cid > 0 )
		{
			$where['apply_cid'] = $cid;
		}
		return wmsql::Update($this->applyTable, $data, $where);
	}
	
	
	/**
	 * 获得一条数据
	 * @param 参数1，必须，查询条件
	 */
	function GetById($id)
	{
		$where['apply_id'] = $id;
		return $this->GetOne($where);
	}

	
	/**
	 * 获得一条数据
	 * @param 参数1，必须，查询条件
	 */
	function GetOne($wheresql)
	{
		$where['table'] = $this->applyTable;
		$where['where'] = $wheresql;
		return wmsql::GetOne($where);
	}
	
	/**
	 * 根据条件获得所有数据
	 * @param 参数1，必须，查询条件
	 */
	function GetAll($wheresql)
	{
		$where['table'] = $this->applyTable;
		$where['where'] = $wheresql;
		return wmsql::GetAll($where);
	}
	
	/**
	 * 根据条件删除数据
	 * @param 参数1，必须，删除条件
	 */
	function Delete($wheresql = '')
	{
		$where = array();
		if( is_array($wheresql) )
		{
			$where = $wheresql;
		}
		else if( $wheresql != '' )
		{
			$where['apply_id'] = $wheresql;
		}
		return wmsql::Delete($this->applyTable , $where);
	}
	
	

	/**
	 * 获得最后一条未审核的数据
	 * @param 参数1，必须，申请模块的操作类型
	 * @param 参数2，必须，用户id
	 * @param 参数3，必须，内容id
	 * @param 参数4，必须，申请状态，默认为0的
	 */
	function GetLastData($type , $uid , $cid=0 , $status = 0)
	{
		$where['table'] = $this->applyTable;
		$where['order'] = 'apply_id desc';
		$where['limit'] = 1;
		$where['where']['apply_module'] = $this->module;
		$where['where']['apply_status'] = $status;
		$where['where']['apply_type'] = $type;
		$where['where']['apply_uid'] = $uid;
		$where['where']['apply_cid'] = $cid;
		return wmsql::GetOne($where);
	}
	
	
	/**
	 * 处理申请请求操作
	 * @param 参数1，必须，申请类型
	 * @param 参数2，必须，申请用户
	 * @param 参数3，必须，内容的id
	 * @param 参数4，必须，处理的操作类型，0为取消审核，1为通过审核
	 * @param 参数5，选填，备注信息
	 * @param 参数6，选填，是否发送消息
	 */
	function HandleApply($type , $uid , $cid=0 , $status = 0 , $remark = '' , $sendMsg = 1)
	{
		//备注信息
		if( $remark == '' )
		{
			$remark = $this->GetHandleRemark($type , $status);
		}
	
		//获得最后一条数据
		$applyData = $this->GetLastData($type , $uid , $cid);
		if( $applyData )
		{
			//存在就修改申请状态信息
			$data['apply_manager_id'] = Session('admin_id');
			$data['apply_updatetime'] = time();
			$data['apply_remark'] = $remark;
			$data['apply_status'] = $status;
			wmsql::Update($this->applyTable, $data, array('apply_id'=>$applyData['apply_id']));
		}
	
		//并且发送消息给用户
		if( $sendMsg == 1)
		{
			$this->msgMod->Insert($uid , $remark);
		}
		return true;
	}
}
?>