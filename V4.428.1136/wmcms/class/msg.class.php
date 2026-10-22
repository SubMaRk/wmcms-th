<?php
/**
 * 消息类文件
 *
 * @version        $Id: msg.class.php 2022年03月21日 16:20  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 *
 */
class Msg
{
    //发送类型，默认为邮件 email/tel
    private $sendtype = 'email';
    //默认的发送消息ID
    private $msgId = '';
    //模块的日志模型
    private $moduleLogMod;
    //消息日志的模型
    private $msgLogMod;
	
    /**
     * 初始化方法
     * @param 参数1：必须，消息发送类型类型。
     * @param 参数2：必须，需要发送的消息ID
     */
	function __construct($data)
	{
	    //类型替换
	    if( $data['type'] == '4' )
	    {
	        $data['type'] = 'email';
	    }
	    else if( $data['type'] == '5' )
	    {
	        $data['type'] = 'tel';
	    }
	    //ID替换
	    $data['id'] = strtr($data['id'],array('code_'=>''));
	    
	    $this->sendType = $data['type'];
	    $this->msgId = $data['id'];
	    if( $this->sendType == 'email' )
	    {
	        $this->moduleLogMod = NewModel('system.email');
	    }
	    else
	    {
	        $this->moduleLogMod = NewModel('system.smslog');
	    }
	    //msg的日志模型
	    $this->msgLogMod = NewModel('system.msglog');
	}
	
    /**
     * 发送验证码
     * @param 参数1：必须，收信人
     * @param 参数2：选填，附加参数
     */
	public function SendCode($receive='',$extParams=array())
	{
	    //收件人为空就退出
	    if( empty($receive) )
	    {
	        return false;
	    }
	    else
	    {
    	    //获取当前用户最新的发送记录
    	    $lastLog = $this->msgLogMod->GetLast($receive);
    	    if( $lastLog && time()-$lastLog['log_time'] < 60 )
    	    {
    	        return array('code'=>500,'msg'=>GetLang('system.operate.limit'));
    	    }
    	    else
    	    {
        	    //发送邮件
        	    if( $this->sendType == 'email' )
        	    {
        	        $result = $this->SendEmail($receive,$extParams);
        	    }
        	    //发送手机信息
        	    else if( $this->sendType == 'tel' )
        	    {
        	        $result = $this->SendTel($receive,$extParams);
        	    }
        	    //记录发送日志
        	    $data['log_channel'] = $this->sendType;
        	    $data['log_channel_id'] = isset($result['data']['log_id'])?$result['data']['log_id']:0;
        	    $data['log_params'] = isset($result['data'])?json_encode($result['data'],JSON_UNESCAPED_UNICODE):'';
        	    $data['log_receive'] = $receive;
        	    $this->msgLogMod->InsertLog($data);
        	    return $result;
    	    }
	    }
	}
	
    /**
     * 检查验证码
     * @param 参数1：必须，收信人
     * @param 参数2：必须，需要验证的参数
     */
	public function CheckCode($receive,$params)
	{
	    //记录发送日志
	    $logMod = NewModel('system.msglog');
	    $data = $logMod->GetLast($receive);
	    //参数不为空
	    if( $data && !empty($data['log_params']) )
	    {
            //验证码已经被使用
            if( $data['log_status'] != '0' )
            {
                return array('code'=>500);
            }
	        //验证码已经过期
            else if( time() > $data['log_exptime'] )
            {
                $this->msgLogMod->LogExp($data['log_id'],$data['log_channel_id'],$this->moduleLogMod);
                return array('code'=>500);
            }
            else
            {
    	        foreach ($params as $k=>$v)
    	        {
    	            if( isset($data['log_params'][$k]) && $data['log_params'][$k]==$v )
    	            {
                        $this->msgLogMod->LogUse($data['log_id'],$data['log_channel_id'],$this->moduleLogMod);
    	                return array('code'=>200);
    	            }
    	        }
            }
	    }
	    return array('code'=>500);
	}
	
	/**
	 * 随机生成验证码
	 * @param 参数1，选填，验证码，没有则随机
	 */
	private function GetCode()
	{
		return rand(100000,999999);
	}
	/**
	 * 替换邮件验证码参数
	 * @param 参数1，必须，原参数
	 * @param 参数2，选填，附加参数，如果存在就直接使用
	 */
	private function GetEmailParams($extParams=array())
	{
		$params['验证码'] = $this->GetCode();
		$params['code'] = $params['验证码'];
		$params['网站名'] = C('config.web.webname');
		return array_merge($params,$extParams);
	}
	/**
	 * 替换短信验证码参数
	 * @param 参数1，必须，原参数
	 * @param 参数2，选填，附加参数，如果存在就直接使用
	 */
	private function GetTelParams($paramsText,$extParams=array())
	{
		$newParams = array();
		if( !empty($paramsText) )
		{
			$paramArr = explode("\r\n",$paramsText);
			foreach($paramArr as $v)
			{
				list($key,$val) = explode(":",$v);
				//匹配标签
				if( $val=='{code}' )
				{
					$val = isset($extParams['code'])?$extParams['code']:$this->GetCode();
				}
				//匹配标签
				else if( $val=='{网站名}' )
				{
					$val = C('config.web.webname');;
				}
				//赋值替换数组
				$newParams[$key] = $val;
			}
		}
		return $newParams;
	}
	
	
    /**
     * 发送邮件
     * @param 参数1：必须，收信人
     */
	public function SendEmail($receive,$extParams=array())
	{
	    $params = array();
		//获得邮件模版
		if( $this->msgId == 'test' )
		{
			$tempData['temp_status'] = '1';
			$tempData['temp_title'] = '邮件发送测试！';
			$tempData['temp_content'] = '这是一封测试邮件，如果您收到此邮件说明你的邮件配置完全正确可以使用了！';
		}
		else
		{
	    	$varCode = $dvarCode = '';
			$tempData = $this->moduleLogMod->TempGetOne($this->msgId);
    		//替换标签
    		$params = $this->GetEmailParams($extParams);
			$tempData['temp_title'] = tpl::rep($params , str::ToHtml($tempData['temp_title'],true));
			$tempData['temp_content'] = tpl::rep($params , str::ToHtml($tempData['temp_content'],true));
		}
		
		//存在模版，并且是允许发送状态。
		if( $tempData && $tempData['temp_status'] == '1' )
		{
		    //随机获取一个启用的邮件发信服务
			$smtpData = $this->moduleLogMod->EmailGetRandOne();
			//发信服务器不存在
			if( !$smtpData )
			{
		        return array('code'=>500,'msg'=>C('system.par.smtp_no',null,'lang'));
			}
			else
			{
				//发送邮件
				$emailSer = NewClass('email' , $smtpData);
				$title = $tempData['temp_title'];
				$content = $tempData['temp_content'];
				$name = isset($extParams['name'])?$extParams['name']:$receive;
				$result = $emailSer->SendEmail( $receive , $name , $title , $content );
				$result['data'] = $params;
				//开启了发送日志
				if( C('config.web.emaillog_open') == '1' )
				{ 
    				//发信记录数据
    				$logData['log_sender'] = $smtpData['email_name'];
    				$logData['log_receive'] = $receive;
    				$logData['log_send'] = 1;
    				$logData['log_type'] = $this->msgId;
    				$logData['log_title'] = $title;
    				$logData['log_content'] = $content;
    				$logData['log_status'] = '1';
    				$logData['log_remark'] = json_encode($params,JSON_UNESCAPED_UNICODE);
    				//发信失败
    				if( $result['code'] != '200' )
    				{
    				    $logData['log_send'] = 0;
    					$logData['log_status'] = '2';
    					$logData['log_remark'] = $result['msg'];
    				}
    				$result['data']['log_id'] = $this->moduleLogMod->LogInsert($logData);
				}
				return $result;
			}
		}
		else if( $tempData )
		{
		    return array('code'=>500,'msg'=>GetLang('system.msg.email_temp_no',array('type'=>$this->msgId)));
		}
		else
		{
		    return array('code'=>500,'msg'=>GetLang('system.msg.email_temp_status',array('type'=>$this->msgId)));
		}
	}
	
    /**
     * 发送短信
     * @param 参数1：必须，收信人
     */
	public function SendTel($receive,$extParams=array())
	{
	    $apiMod = NewModel('system.api');
	    $api = $apiMod->GetByTypeRandOne(9,1);
	    //没有开启的短信api
	    if( !$api )
	    {
			return array('code'=>500,'msg'=>GetLang('system.msg.sms_api_no'));
	    }
	    else
	    {
    		//根据短信类型获得短信模版
    	    $smsMod = NewModel('system.sms');
    		$tempData = $smsMod->GetByType($this->msgId,$api['api_name']);
    		if( !$tempData )
    		{
    			$remark = $api['api_name'].GetLang('system.msg.sms_temp_no',array('type'=>$this->msgId));
    			$this->moduleLogMod->SendError($this->msgId,'null',$receive,$remark);
    			return array('code'=>500,'msg'=>$remark);
    		}
    		else
    		{
    		    $apiName = $tempData['sms_api_name'];
        		//短信数据
                $params["receive"] = $receive;
                $params["sign"] = $tempData['sms_sign'];
                $params["tempCode"] = $tempData['sms_tempcode'];
                $params['params'] = $this->GetTelParams($tempData['sms_params']);
        		//根据配置创建新的发送短信服务
        		$sendSer = NewApi('sms.'.$apiName,C('config.api.'.$apiName),'Sms');
        		$result = $sendSer->SendSms($params);
        		$result['data'] = $params['params'];
    			//开启了发送日志
    			if( C('config.web.tellog_open') == '1' )
    			{
            		//发送失败写入日志
            		if( $result['code'] != '200' )
            		{
            			$result['data']['log_id'] = $this->moduleLogMod->SendError($this->msgId,$apiName,$receive,$result['msg']);
            		}
                	//发送成功写入日志
            		else
            		{
                		$result['data']['log_id'] = $this->moduleLogMod->SendSuccess($this->msgId,$apiName,$receive,$params['params']);
            		}
        		}
        		return $result;
    		}
	    }
	}
}
?>