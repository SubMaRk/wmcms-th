<?php
/**
* 邮箱模型
*
* @version        $Id: email.model.php 2017年6月26日 14:35  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class EmailModel
{
	public $table = '@system_email';
	public $tempTable = '@system_email_temp';
	public $logTable = '@system_email_log';
	public $status = array('0'=>'禁用','1'=>'使用');
	public $sendType = array('1'=>'SMTP服务器发送','2'=>'sendmail发送','3'=>'PHP函数SMTP发送');
	public $logStatus = array('0'=>'等待发送','1'=>'发送成功','2'=>'发送失败');
	
	function __construct( $data = '' ){}


	/**
	 * 获得一条随机邮件配置
	 * @param 参数1，必须，收件邮箱。
	 * @param 参数2，必须，用户名。
	 * @param 参数2，必须，模版id。
	 * @param 参数3，选填，替换的数组。
	 * @param 参数4，选填，是否返回结果？，查询条件。
	 */
	function SendMail($email , $name , $tempId , $arr = array() , $isReturn = false)
	{
		$url = DOMAIN;
		$varCode = $dvarCode = '';
		
		//找回密码和验证邮箱
		if( $tempId == 'getpsw' || $tempId == 'varemail')
		{
			//验证码
			$varCode = str::RandStr('32');
			$dvarCode = urlencode(str::Encrypt( $varCode , 'E' , C('config.api.system.api_apikey')));
			//保存找回密码的session
			Session('var_code' , $varCode);
			Session('var_name' , $name);
		}
		
		//替换标签
		$arr['用户名'] = $name;
		$arr['网站名'] = C('config.web.webname');
		$arr['找回链接'] = '<a href="'.$url.'/module/user/repsw.php?type=repsw&dvarcode='.$dvarCode.'">'.$url.'/module/user/repsw.php?type=repsw&dvarcode='.$dvarCode.'</a>';
		$arr['验证链接'] = '<a href="'.$url.'/wmcms/action/index.php?action=user.varemailnext&dvarcode='.$dvarCode.'">'.$url.'/wmcms/action/index.php?action=user.varemailnext&dvarcode='.$dvarCode.'</a>';
		
		//获得邮件模版
		if($tempId == 'test' )
		{
			$tempData['temp_status'] = '1';
			$tempData['temp_title'] = '邮件发送测试！';
			$tempData['temp_content'] = '这是一封测试邮件，如果您收到此邮件说明你的邮件配置完全正确可以使用了！';
		}
		else
		{
			$tempData = $this->TempGetOne($tempId);
		}
		
		//存在模版，并且是允许发送状态。
		if( $tempData && $tempData['temp_status'] == '1' )
		{
			$smtpData = $this->EmailGetRandOne();
			//发信服务器不存在
			if( !$smtpData )
			{
				if( $isReturn == false )
				{
					ReturnData( C('system.par.smtp_no',null,'lang') );
				}
				else
				{
					return C('system.par.smtp_no',null,'lang');
				}
			}
			else
			{
				//载入邮件类
				$emailSer = NewClass('email' , $smtpData);
				//发送邮件
				$title = tpl::rep($arr , $tempData['temp_title']);
				$content = tpl::rep($arr , $tempData['temp_content']);
				$result = $emailSer->SendGetPsw( $email , $name , $title , $content );
				
				//发信记录数据。
				$logData['log_sendmail'] = $smtpData['email_name'];
				$logData['log_getmail'] = $email;
				$logData['log_title'] = $title;
				$logData['log_content'] = $content;
				$logData['log_status'] = '1';
				
				//发信成功或者失败
				if( $result === true )
				{
					//插入日志记录
					if( C('config.web.emaillog_open') == '1' )
					{
						$this->LogInsert($logData);
					}
					
					return true;
				}
				else
				{
					//插入日志记录
					$logData['log_status'] = '2';
					$logData['log_remark'] = $result;
					if( C('config.web.emaillog_open') == '1' )
					{
						$this->LogInsert($logData);
					}
					
					//是否只直接返回数据还是结果
					if( $isReturn == true )
					{
						return $result;
					}
					else
					{
						ReturnData( $result );
					}
				}
			}
		}
		return true;
	}
	
	
	/**
	 * 获得一条随机邮件配置
	 * @param 参数1，必须，查询条件。
	 */
	function EmailGetRandOne()
	{
		$where['table'] = $this->table;
		$where['where']['email_status'] = '1';
		return wmsql::Rand($where);
	}
	/**
	 * 获得一条邮件配置
	 * @param 参数1，必须，查询条件。
	 */
	function EmailGetOne($wheresql)
	{
		$where['table'] = $this->table;
		if( is_array($wheresql) )
		{
			$where['where'] = $wheresql;
		}
		else
		{
			$where['where']['email_id'] = $wheresql;
		}
		return wmsql::GetOne($where);
	}
	/**
	 * 获得全部邮件设置
	 * @param 参数1，必须，所属的模块
	 * @param 参数2，必须，标签的名字
	 */
	function EmailGetAll($wheresql=array())
	{
		$where['table'] = $this->table;
		if( !empty($wheresql) )
		{
			$where['where'] = $wheresql;
		}
		return wmsql::GetAll($where);
	}
	/**
	 * 删除一条邮件配置
	 * @param 参数1，必须，删除条件。
	 */
	function EmailDel($wheresql)
	{
		if( is_array($wheresql) )
		{
			$where = $wheresql;
		}
		else
		{
			$where['email_id'] = $wheresql;
		}
		return wmsql::Delete($this->table,$where);
	}
	/**
	 * 插入数据
	 * @param 参数1，必须，需要插入的数据
	 */
	function EmailInsert($data)
	{
		return wmsql::Insert($this->table, $data);
	}
	/**
	 * 修改站内站点
	 * @param 参数1，必须，查询条件
	 */
	function EmailUpdate($data,$where)
	{
		return wmsql::Update($this->table, $data, $where);
	}
	
	
	
	/**
	 * 获得一条邮件模版
	 * @param 参数1，必须，查询条件。
	 */
	function TempGetOne($wheresql)
	{
		$where['table'] = $this->tempTable;
		if( is_array($wheresql) )
		{
			$where['where'] = $wheresql;
		}
		else
		{
			$where['where']['temp_id'] = $wheresql;
		}
		return wmsql::GetOne($where);
	}
	/**
	 * 获得全部发信模版
	 * @param 参数1，必须，所属的模块
	 * @param 参数2，必须，标签的名字
	 */
	function TempGetAll($wheresql=array())
	{
		$where['table'] = $this->tempTable;
		if( !empty($wheresql) )
		{
			$where['where'] = $wheresql;
		}
		return wmsql::GetAll($where);
	}
	/**
	 * 删除一条邮件模版
	 * @param 参数1，必须，删除条件。
	 */
	function TempDel($wheresql)
	{
		if( is_array($wheresql) )
		{
			$where = $wheresql;
		}
		else
		{
			$where['temp_id'] = $wheresql;
		}
		return wmsql::Delete($this->tempTable,$where);
	}
	/**
	 * 插入数据
	 * @param 参数1，必须，需要插入的数据
	 */
	function TempInsert($data)
	{
		return wmsql::Insert($this->tempTable, $data);
	}
	/**
	 * 修改站内站点
	 * @param 参数1，必须，查询条件
	 */
	function TempUpdate($data,$where)
	{
		return wmsql::Update($this->tempTable, $data, $where);
	}

	
	/**
	 * 插入邮件记录数据
	 * @param 参数1，必须，需要插入的数据
	 */
	function LogInsert($data)
	{
		$data['log_time'] = time();
		$data['log_sendtime'] = time();
		return wmsql::Insert($this->logTable, $data);
	}
	/**
	 * 获得日志条数
	 * @param 参数1，必须，条件
	 */
	function LogGetCount($wheresql=array())
	{
		$where['table'] = $this->logTable;
		if( !empty($wheresql) )
		{
			$where['where'] = $wheresql;
		}
		return wmsql::GetCount($where,'log_id');
	}
	/**
	 * 获得全部日志
	 * @param 参数1，必须，条件
	 */
	function LogGetAll($where=array())
	{
		$where['table'] = $this->logTable;
		return wmsql::GetAll($where);
	}
	/**
	 * 获得一条日志记录
	 * @param 参数1，必须，查询条件。
	 */
	function LogGetOne($wheresql)
	{
		$where['table'] = $this->logTable;
		if( is_array($wheresql) )
		{
			$where['where'] = $wheresql;
		}
		else
		{
			$where['where']['log_id'] = $wheresql;
		}
		return wmsql::GetOne($where);
	}
	/**
	 * 删除日志记录
	 * @param 参数1，选填，删除条件。
	 */
	function LogDel($where=array())
	{
		return wmsql::Delete($this->logTable, $where);
	}
}
?>