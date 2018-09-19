<?php
require_once "lib/WxPay.Api.php";
require_once 'log.php';
//创建配置
new WxPayConfig();

//电脑扫码支付统一方法
class UnifiedPay{
	private $logHandler;
	function __construct()
	{
		//初始化日志
		$this->logHandler= new CLogFileHandler();
		Log::Init($this->logHandler, 15);
	}
	
	/**
	 * 设置异步通知地址
	 * @param 参数1，异步通知地址
	 */
	function SetNotifyUrl($url='')
	{
		if( $url != '' )
		{
			WxPayConfig::$notifyUrl = $url;
		}
	}
	/**
	 * 设置同步返回地址
	 * @param 参数1，同步返回地址
	 */
	function SetReturnUrl($url='')
	{
		if( $url != '' )
		{
			WxPayConfig::$returnUrl = $url;
		}
	}
	

	/**
	 * 下单方法
	 * @param 参数1，必须，订单数据
	 */
	function Order($orderData)
	{
		//引入支付方法
		require_once "lib/WxPay.NativePay.php";

		//下单
		$input = new WxPayUnifiedOrder();
		$input->SetBody($orderData['body']);
		$input->SetOut_trade_no($orderData['sn']);
		$input->SetTotal_fee($orderData['money']*100);
		$input->SetNotify_url(WxPayConfig::$notifyUrl);
		$input->SetTrade_type("NATIVE");
		$input->SetProduct_id($orderData['sn']);
		//设置附加信息。
		$params = @$orderData['params'];
		$params['pay_type'] = 'wxpay';
		$input->SetAttach(UrlEncode(json_encode($params)));
		//返回二维码的地址
		$notify = new NativePay();
		$result = $notify->GetPayUrl($input);
		return $result["code_url"];
	}
	

	/**
	 * 异步通知方法
	 */
	function Notify()
	{
		//引入异步通知方法
		require_once "lib/WxPay.Notify.php";
		$inputData = file_get_contents('php://input');

		$notify = new WxPayNotify();
		$result = $notify->Handle(true,true);

		if($result['return_code']=='SUCCESS')
		{
			$this->logHandler->setHandle('success');
			Log::DEBUG($inputData);
		
			//将XML转为array
			//禁止引用外部xml实体
			libxml_disable_entity_loader(true);
			$inputData = json_decode(json_encode(simplexml_load_string($inputData, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
			$data['out_trade_no'] = $inputData['out_trade_no'];
			$data['trade_no'] = $inputData['transaction_id'];
			return $data;
		}
		else
		{
			$this->logHandler->setHandle('fail');
			Log::DEBUG($inputData);
			return false;
		}
	}
}
?>