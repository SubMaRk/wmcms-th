<?php
require_once 'AopConfig.php';
require_once 'AopEncrypt.php';
require_once 'AopClient.php';
new alipayConfig();

//电脑支付统一方法
class UnifiedPay{
	private $tradeSer;
	function __construct()
	{
		require_once 'service/AlipayTradeService.php';
		$this->tradeSer = new AlipayTradeService(alipayConfig::$alipayConfig);
	}
	
	/**
	 * 设置异步通知地址
	 * @param 参数1，必须，异步通知地址
	 */
	function SetNotifyUrl($url='')
	{
		if( $url != '' )
		{
			alipayConfig::$alipayConfig['notify_url'] = $url;
		}
	}
	/**
	 * 设置同步返回地址
	 * @param 参数1，必须，同步返回地址
	 */
	function SetReturnUrl($url='')
	{
		if( $url != '' )
		{
			alipayConfig::$alipayConfig['return_url'] = $url;
		}
	}
	
	
	/**
	 * 下单方法
	 * @param 参数1，必须，订单数据
	 */
	function Order($orderData)
	{
		return $this->tradeSer->pagePay($orderData);
	}
	
	/**
	 * 异步通知方法
	 */
	function Notify()
	{
		//验证签名参数
		$result = $this->tradeSer->check($_POST);
		//验证成功，并且支付成功
		if($result && $_POST['trade_status'] == 'TRADE_SUCCESS')
		{
			//商户订单号
			$data['out_trade_no'] = $_POST['out_trade_no'];
			//支付宝交易号
			$data['trade_no'] = $_POST['trade_no'];
			
			//写入成功日志
			$this->tradeSer->writeLog(var_export($_POST,true),'success');
			
			echo 'success';
			return $data;
		}
		else
		{
			//写入失败日志
			$this->tradeSer->writeLog(var_export($_POST,true),'fail');
			
			echo 'fail';
			return false;
		}
	}
}