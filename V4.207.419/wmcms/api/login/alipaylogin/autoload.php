<?php
require_once("alipay.config.php");
require_once("lib/alipay_submit.class.php");

$target_service = "user.auth.quick.login";
$anti_phishing_key = "";
$exter_invoke_ip = "";

$parameter = array(
	"service" => "alipay.auth.authorize",
	"partner" => trim($alipay_config['partner']),
	"target_service"	=> $target_service,
	"return_url"	=> $backurl,
	"anti_phishing_key"	=> $anti_phishing_key,
	"exter_invoke_ip"	=> $exter_invoke_ip,
	"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);
