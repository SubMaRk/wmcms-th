<?php
/**
* 短信日志模块模型
*
* @version        $Id: smslog.model.php 2021年03月17日 11:27  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class SmsLogModel
{
	public $table = '@system_sms_log';
	public $statusArr = array('0'=>'未使用','1'=>'已使用','2'=>'已过期');
	public $sendArr = array('0'=>'失败','1'=>'成功');
	
	function __construct( $data = array() ){}
	
	
	/**
	 * 获得所有发送记录
	 * @param 参数1，选填，查询条件
	 */
	public function GetAll($where=array())
	{
		$where['table'] = $this->table;
		return wmsql::GetAll($where);
	}
	
	
	/**
	 * 删除短信模版
	 * @param 参数1，必须，删除条件
	 */
	public function Del($where=array())
	{
		return wmsql::Delete($this->table,$where);
	}
	
	
	/**
	 * 更新记录状态
	 * @param 参数1，必须，修改状态
	 * @param 参数2，必须，条件ID
	 */
	public function UpdateStatus($status,$id)
	{
		$data['log_status'] = $status;
		$where['log_id'] = $id;
		return wmsql::Update($this->table,$data,$where);
	}
	
	/**
	 * 检查验证码
	 * @param 参数1，必须，短信类型
	 * @param 参数2，必须，接受客户端
	 * @param 参数3，必须，验证码
	 */
    public function CheckCode($type,$client,$code)
    {
		$where['table'] = $this->table;
		$where['where']['log_status'] = 0;
		$where['where']['log_type'] = $type;
		$where['where']['log_send'] = 1;
		$where['where']['log_client'] = $client;
		$where['where']['log_code'] = $code;
		$data = wmsql::GetOne($where);
		if( $data )
		{
			//成功状态修改
			if(  $data['log_exptime']>time() )
			{
				$this->UpdateStatus(1,$data['log_id']);
				return true;
			}
			//过期状态修改
			$this->UpdateStatus(2,$data['log_id']);
		}
		return false;
    }
}
?>