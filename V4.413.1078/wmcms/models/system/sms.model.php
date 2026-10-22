<?php
/**
* 短信模版模块模型
*
* @version        $Id: sms.model.php 2021年03月17日 11:27  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class SmsModel
{
	public $table = '@system_sms';
	public $logTable = '@system_sms_log';
	public $statusArr = array('0'=>'禁用','1'=>'使用');
	
	function __construct( $data = array() ){}

	/**
	 * 新增短信模版
	 * @param 参数1，必须，插入数据
	 */
	public function Insert($data)
	{
		$data['sms_time'] = time();
		return wmsql::Insert($this->table, $data);
	}
	
	/**
	 * 修改短信模版
	 * @param 参数1，必须，修改数据
	 * @param 参数2，必须，修改条件
	 */
	public function Update($data,$where)
	{
		return wmsql::Update($this->table, $data,$where);
	}
	
	/**
	 * 删除短信模版
	 * @param 参数1，必须，删除条件
	 */
	public function Del($where)
	{
		return wmsql::Delete($this->table,$where);
	}
	
	/**
	 * 获得所有短信模版
	 * @param 参数1，选填，查询条件
	 */
	public function GetAll($where=array())
	{
		$where['table'] = $this->table;
		return wmsql::GetAll($where);
	}
	
	/**
	 * 获得短信模版，随机获得一条在使用的短信模版
	 * @param 参数1，必须，短信类型
	 */
	public function GetById($id)
	{
		$where['table'] = $this->table;
		$where['where']['sms_id'] = $id;
		return wmsql::GetOne($where);
	}
	
	/**
	 * 获得短信模版，随机获得一条在使用的短信模版
	 * @param 参数1，必须，短信类型
	 */
	public function GetByType($type)
	{
		$where['table'] = $this->table;
		$where['where']['sms_status'] = 1;
		$where['where']['sms_type'] = $type;
		return wmsql::Rand($where);
	}
	
	
	/**
	 * 写入发送错误日志
	 * @param 参数1，必须，短信类型
	 * @param 参数2，必须，接受客户端
	 * @param 参数3，必须，错误消息
	 */
	public function SendError($type,$client,$remark)
	{
		$data['log_type'] = $type;
		$data['log_send'] = 0;
		$data['log_remark'] = $remark;
		$data['log_client'] = $client;
		return $this->SendLog($data);
	}
	/**
	 * 写入发送成功日志
	 * @param 参数1，必须，短信类型
	 * @param 参数2，必须，接受客户端
	 * @param 参数3，必须，错误消息
	 */
	public function SendSuccess($type,$client,$code)
	{
		$data['log_type'] = $type;
		$data['log_client'] = $client;
		$data['log_code'] = $code;
		return $this->SendLog($data);
	}
	/**
	 * 写入发送日志
	 * @param 参数1，必须，日志内容
	 */
	public function SendLog($data)
	{
		$data['log_time'] = time();
		$data['log_exptime'] = time()+300;
		return wmsql::Insert($this->logTable, $data);
	}



	/**
	 * 发送短信
	 * @param 参数1，必须，短信类型
	 * @param 参数2，必须，接受客户端
	 * @param 参数3，选填，验证码，为空则自动生成
	 */
    public function SendSms($type,$client,$code='')
    {
		//根据短信类型获得短信模版
		$tempData = $this->GetByType($type);
		if( !$tempData )
		{
			global $lang;
			$remark = str_replace('{type}',$type,$lang['system']['msg']['sms_temp_no']);
			$this->SendError($type,$client,$remark);
			return false;
		}
		//验证码
		$code = $this->GetCode($code);
		
		//短信数据
        $params["client"] = $client;
        $params["sign"] = $tempData['sms_sign'];
        $params["tempCode"] = $tempData['sms_tempcode'];
        $params['params'] = $this->GetParamsArr($tempData['sms_params'],$code);
		//根据配置创建新的发送短信服务
		$sendSer = NewApi('sms.'.$tempData['sms_api_name'],'','Sms');
		$result = $sendSer->SendSms($params);
		//发送失败
		if( isset($result['errmsg']) )
		{
			$this->SendError($type,$client,$result['errmsg']);
			return false;
		}
		//发送成功写入日志
		$this->SendSuccess($type,$client,$code);
		return true;
    }
	
	
	/**
	 * 随机生成验证码
	 * @param 参数1，选填，验证码，没有则随机
	 */
	private function GetCode($code='')
	{
		if( empty($code) )
		{
			$code = rand(100000,999999);
		}
		return $code;
	}
	
	
	/**
	 * 获得自定义替换参数数组
	 * @param 参数1，必须，替换参数
	 * @param 参数2，选填，替换参数
	 */
	private function GetParamsArr($params,$code='')
	{
		$newParams = array();
		if( !empty($params) )
		{
			$paramArr = explode("\r\n",$params);
			foreach($paramArr as $v)
			{
				list($key,$val) = explode(":",$params);
				//匹配标签
				if( $val=='{code}' )
				{
					$val = $code;
				}
				//赋值替换数组
				$newParams[$key] = $val;
			}
		}
		return $newParams;
	}
	
	
	
	/**
	 * 检查验证码
	 * @param 参数1，必须，短信类型
	 * @param 参数2，必须，接受客户端
	 * @param 参数3，必须，验证码
	 */
    public function CheckCode($type,$client,$code)
    {
		$logMod = NewModel('system.smslog');
		return $logMod->CheckCode($type,$client,$code);
    }
}
?>