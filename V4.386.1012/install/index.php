<?php
header('Content-Type:text/html;charset=utf-8'); 
if (version_compare("5.3", PHP_VERSION, ">")) {
	die("PHP >= 5.3 or greater is required!!!");
}
//定义系统常量
define('WMMANAGER', false);
date_default_timezone_set('PRC');
$wmroot = __dir__.'/../wmcms/';
define('WMINC', $wmroot.'inc/' );
define('WMCONFIG',$wmroot.'config/');
require_once WMCONFIG.'define.config.php';
require_once WMCONFIG.'api.config.php';
require_once WMCONFIG.'web.config.php';
require_once WMINC.'function.php';
require_once WMCLASS.'file.class.php';
require_once WMCLASS.'str.class.php';
require_once 'module.php';
//网站当前的访问http类型
define('HTTP_TYPE',GetHttpType());
define('TCP_TYPE',GetHttpType());


$title = $step = '';
$a = Post('action');
//是否安装过了 
if(file_exists(WMCONFIG.'install.lock.txt') && $a !='step5')
{
	$file = 'lock.php';
}
else if( str_replace('/','',str_replace('index.php','',$_SERVER['PHP_SELF'])) != 'install' )
{
	$file = 'second_dir.php';
}
else if(!file_exists('sql.sql') )
{
	$file = 'sql.php';
}
/*
else if($_SERVER['HTTP_HOST'] == '127.0.0.1' || $_SERVER['HTTP_HOST']=='localhost')
{
	echo '请使用域名访问安装';
	exit;
}*/
else
{
	//执行安装步骤
	switch ($a)
	{
		case '':
			$file = 'step1.php';
			$title = 'ขั้นตอนที่ 1 ข้อตกลงการติดตั้ง';
			$step = 'step2';
			break;

		case 'step2':
			$file = 'step2.php';
			$title = 'ขั้นตอนที่ 2 ตรวจสอบสภาพแวดล้อม';
			$step = 'step3';
			break;
				
		case 'step3':
			$file = 'step3.php';
			$title = 'ขั้นตอนที่ 3 กรอกข้อมูลฐานข้อมูลและการก่อตั้ง';
			$step = 'step4';
			break;
				
		case 'step4':
			$file = 'step4.php';
			$title = 'ขั้นตอนที่ 4 สร้างข้อมูล';
			$step = 'step5';
			break;
				
		case 'step5':
			$file = 'step5.php';
			$title = 'ขั้นตอนที่ 5 เสร็จสิ้นการติดตั้ง';
			break;
	}
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>ตัวติดตั้ง WMCMS<?php echo $title?></title>
<link rel="stylesheet" href="Content/install.css" />
<!--[if IE]>
<script src="Scripts/html5.js" type="text/javascript"></script>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<div class="wrap">
	<header class="header">
		<div class="head">
			<h1 class="logo_install">การติดตั้ง</h1>
			<div class="version">เวอร์ชั่น : V<?php echo WMVER;?>  UTF-8 (<?php echo WMVER_TIME?>)</div>

		</div>
	</header>
	<section class="section">
		<?php require $file;?>
	</section>
	</div>
	<footer class="footer">
		&copy; 2014-2018 <a href="<?php echo WMURL;?>">wmcms</a>(ทีม wmcms ขอสงวนลิขสิทธิ์)
	</footer>
</body>
</html>
