<?php
/**
* 邮件发送类
*
* 底层使用 PHPMailer 6.9.3（见 class/Mailer/src/），旧的 2009 年版
* class.phpmailer.php 已删除：那一版存在发件路径注入（CVE-2016-10033 系列）。
*
* @package        WMCMS
*/
class email{
	//发送方式：1=SMTP，2=sendmail，3=mail()
	private $sendType = 1;
	private $smtp;
	private $port;
	private $name;
	private $psw;
	private $send;

	function __construct($data = array())
	{
		//如果默认的邮件服务器参数不为空就设置为当前传入的邮件服务器
		if( !empty($data) )
		{
			$this->sendType = $data['email_type'];
			$this->smtp = $data['email_smtp'];
			$this->port = $data['email_port'];
			$this->name = $data['email_name'];
			$this->psw = str::Encrypt( $data['email_psw'] , 'D' , C('config.api.system.api_apikey'));
			$this->send = $data['email_send'];
		}
	}

	//发送测试邮件
	function Test()
	{
		$nickName = 'admin';
		$title = '邮件发送测试！';
		$content = '这是一封测试邮件，如果您收到此邮件说明你的邮件配置完全正确可以使用了！';
		return $this->SendEmail($this->name,$nickName , $title , $content);
	}

	/**
	 * 发送邮件
	 * @param 参数1，必填，收件人地址
	 * @param 参数2，必填，收件人姓名
	 * @param 参数3，必填，邮件标题
	 * @param 参数4，必填，邮件内容
	 */
	function SendEmail( $email , $nickname , $title , $content ){
		require_once __DIR__.'/Mailer/autoload.php';
		$mail = new PHPMailer(true);
		try
		{
			//通过链接 SMTP 服务器发送邮件
			if( $this->sendType == '1' )
			{
				$mail->isSMTP();
				$mail->Host = $this->smtp;
				$mail->SMTPDebug = 0;
				$mail->SMTPAuth = true;
				$mail->Username = $this->name;
				$mail->Password = $this->psw;
				$mail->Port = (int)$this->port;
				//证书校验保持开启，避免被中间人
				$mail->SMTPOptions = array(
					'ssl' => array(
						'verify_peer' => true,
						'verify_peer_name' => true,
						'allow_self_signed' => false,
					),
				);
				//新增识别465端口，因为部分服务器发送不了
				if( $this->port == '465' )
				{
					$mail->SMTPSecure = 'ssl';
					$mail->Port = 465;
				}
				//587 端口通常要求 STARTTLS
				else if( $this->port == '587' )
				{
					$mail->SMTPSecure = 'tls';
				}
			}
			//通过sendmail 发送邮件
			else if( $this->sendType == '2' )
			{
				$mail->isSendmail();
			}
			//通过 PHP 函数 mail() 发送邮件
			else if( $this->sendType == '3' )
			{
				$mail->isMail();
			}

			$mail->CharSet = 'UTF-8';
			$mail->Encoding = 'base64';
			//发件人必须是合法地址，PHPMailer 6 会再校验一次
			$mail->setFrom($this->send != '' ? $this->send : $this->name, C('config.web.webname'));
			$mail->addReplyTo($this->send != '' ? $this->send : $this->name, C('config.web.webname'));
			$mail->addAddress($email , $nickname);
			$mail->isHTML(true);
			$mail->Subject = $title;
			$mail->Body = $content;
			$mail->AltBody = 'text/html';
			$mail->send();
			return array('code'=>200,'msg'=>'发送成功');
		}
		catch (Exception $e)
		{
			//PHPMailer 的异常信息里可能带 SMTP 主机和凭据，只保留原因
			return array('code'=>500,'msg'=>$mail->ErrorInfo != '' ? $mail->ErrorInfo : $e->getMessage());
		}
	}
}
?>
