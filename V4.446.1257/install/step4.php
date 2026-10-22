<?php if(!defined('WMINC'))die();?>
<?php
/**
 * 安装参数校验
 * 这些值会被写进 SQL、写进 data.config.php 和 api.config.php，
 * 不校验就等于让第一个访问安装页的人决定服务器上执行什么代码。
 */
function InstallValue($key , $default = '')
{
	return isset($_POST[$key]) ? trim($_POST[$key]) : $default;
}

$dbhost=InstallValue('dbhost' , 'localhost');
$dbport=InstallValue('dbport' , '3306');
$dbuser=InstallValue('dbuser');
$dbpw=InstallValue('dbpw');
$dbname=InstallValue('dbname');
$adminuser=InstallValue('adminuser');
$adminemail=InstallValue('adminemail');
$adminpsw = str::PswHash(InstallValue('adminpsw'));
$pre=InstallValue('pre' , 'wm_');

//数据库名和表前缀只能是标识符
if( !preg_match('/^[A-Za-z0-9_]{1,64}$/', $dbname) )
{
	die('ชื่อฐานข้อมูลไม่ถูกต้อง (ใช้ได้เฉพาะ a-z A-Z 0-9 _)');
}
if( $pre != '' && !preg_match('/^[A-Za-z0-9_]{1,32}$/', $pre) )
{
	die('คำนำหน้าตารางไม่ถูกต้อง (ใช้ได้เฉพาะ a-z A-Z 0-9 _)');
}
//管理员账号和邮箱
if( !preg_match('/^[A-Za-z0-9_.\-@]{3,32}$/', $adminuser) )
{
	die('ชื่อผู้ดูแลระบบไม่ถูกต้อง');
}
if( $adminemail != '' && !filter_var($adminemail, FILTER_VALIDATE_EMAIL) )
{
	die('อีเมลผู้ดูแลระบบไม่ถูกต้อง');
}
//端口只能是数字
if( !preg_match('/^[0-9]{1,5}$/', $dbport) )
{
	die('พอร์ตฐานข้อมูลไม่ถูกต้อง');
}

try{
	//判断数据库信息
	$dsn = "mysql:host=$dbhost;port=$dbport";
	$db = new PDO($dsn, $dbuser, $dbpw);//
	//新建数据库
	@$db->exec('CREATE database `'.$dbname.'`');
	//关闭测试
	$db = null;

	//通过测试
	//安装时不再向官方服务器申请 appid/apikey/secret：那条链路是 http 明文，
	//而且会把域名和凭据一起发出去。这里直接在本地生成，功能完全够用
	//（它只用于本站内部接口签名和 cookie 加密）。
	$appid = 'wm'.substr(md5(uniqid('', true)), 0, 10);
	$apikey = bin2hex(random_bytes(16));
	$secret = bin2hex(random_bytes(16));
	if($appid == '' || $apikey == '' || $secret == '' )
	{
		die('ไม่สามารถสร้างไอดีแอปฯ และไม่สามารถติดตั้งให้สมบูรณ์ได้');
	}
	else
	{
		//开始还原数据
		$dsn = "mysql:host=$dbhost;port=$dbport;dbname=$dbname";
		$db = new PDO($dsn, $dbuser, $dbpw);
		//转换数据库编码
		$db->exec('SET NAMES utf8');
		//导入数据库
		$filepatch='sql.sql';
		//还原数据
		if (file_exists($filepatch)) {
			$sqls = file_get_contents($filepatch);
			$arrsql = explode(";\r\n",$sqls);
			for($i=0;$i<count($arrsql);$i++){
				if(trim($arrsql[$i]) != ''){
					$db->exec($arrsql[$i]);
				}
			}
			//数据已经导入，立刻删掉安装包里的 sql.sql。
			//这份文件里包含完整的表结构和默认管理员 hash，安装完成后继续留在
			///install/sql.sql 上等于把整份 schema 公开，所以不等 step5 就删。
			@unlink($filepatch);
		}
	
		//修改管理员账号信息（使用预处理，不再拼接字符串）
		$st = $db->prepare("update `wm_manager_manager` set `manager_name`=?,`manager_psw`=?,`manager_salt`='' where `manager_id`=1");
		$st->execute(array($adminuser,$adminpsw));
		//修改域名，修改管理员邮箱
		$domain = @$_SERVER['HTTP_HOST'];
		$st = $db->prepare("update `wm_config_config` set `config_value`=? where `config_id`=2");
		$st->execute(array($domain));
		$st = $db->prepare("update `wm_config_config` set `config_value`=? where `config_id`=396");
		$st->execute(array(HTTP_TYPE));
		$st = $db->prepare("update `wm_config_config` set `config_value`=? where `config_id`=3");
		$st->execute(array($adminemail));

		//修改网站的API接口配置
		$st = $db->prepare("update `wm_api_api` set `api_appid`=?,`api_apikey`=?,`api_secretkey`=? where `api_id`=1");
		$st->execute(array($appid,$apikey,$secret));
		$apiContent=file_get_contents("../wmcms/config/api.config.php");
		$apiContent=preg_replace_callback(
			"/'api_appid'=>'(.*?)','api_apikey'=>'(.*?)','api_secretkey'=>'(.*?)',/",
			function($m) use ($appid,$apikey,$secret)
			{
				//用 var_export 生成 PHP 字面量，值里的引号不会变成代码
				return "'api_appid'=>".var_export($appid,true).",'api_apikey'=>".var_export($apikey,true).",'api_secretkey'=>".var_export($secret,true).",";
			},
			$apiContent, 1);
		file_put_contents("../wmcms/config/api.config.php",$apiContent);
		
		
		//更改配置文件
		$TxtContent=file_get_contents("../wmcms/config/data.config.php");
		//每一项都用 var_export 生成字面量：即使密码里有引号也不会变成代码
		$dbMap = array('host'=>$dbhost,'port'=>$dbport,'uname'=>$dbuser,'upsw'=>$dbpw,'name'=>$dbname,'prefix'=>$pre);
		foreach ($dbMap as $dbKey=>$dbVal)
		{
			$TxtContent=preg_replace("/'".$dbKey."'	=>	'(.*?)'/", "'".$dbKey."'	=>	".var_export($dbVal,true), $TxtContent, 1);
		}
		//转换编码并且保存
		file_put_contents("../wmcms/config/data.config.php",$TxtContent);
		
		
		$module = @array_values($_POST['module']);
		if( $module )
		{
			$moduleMod = NewModel('system.module');
			$installModule = $unInstallModule = array();
			//所有模块
			$moduleList = file::FloderList(WMMODULE);
			//安装和卸载的模块
			foreach ($moduleList as $k=>$v)
			{
				$moduleArr = $moduleMod->GetModuleId($v['file']);
				if( in_array($v['file'], $module))
				{
					$installModule[] = $v['file'];
					//显示菜单
					$st = $db->prepare("update `wm_system_menu` set `menu_status`='1' where `menu_id`=?");
					$st->execute(array((int)$moduleArr['id']));
				}
				else
				{
					$unInstallModule[] = $v['file'];
					//隐藏菜单
					$st = $db->prepare("update `wm_system_menu` set `menu_status`='0' where `menu_id`=?");
					$st->execute(array((int)$moduleArr['id']));
				}
			}
			//如果是全部模块
			if( empty($unInstallModule) )
			{
				$installModule = array();
				$installModule[] = 'all';
			}
			
			////修改define不安装使用的module
			$defineContent=file_get_contents(WMCONFIG."define.config.php");
			$defineContent=preg_replace("/define\('NOTMODULE','(.*?)'\);/", "define('NOTMODULE','".@implode(',', $unInstallModule)."');", $defineContent);
			file_put_contents(WMCONFIG."define.config.php",$defineContent);
			
			//设置index安装使用的模块
			$indexContent=file_get_contents(WMROOT."index.php");
			$indexContent=preg_replace("/C\['module'\]\['inc'\]\['module'\]=array\('(.*?)'\);/", "C['module']['inc']['module']=array('".@implode("','", $installModule)."');", $indexContent);
			file_put_contents(WMROOT."index.php",$indexContent);

			//设置404安装使用的模块
			$notfoundContent=file_get_contents(WMROOT."404.php");
			$notfoundContent=preg_replace("/C\['module'\]\['inc'\]\['module'\]=array\('(.*?)'\);/", "C['module']['inc']['module']=array('".@implode("','", $installModule)."');", $notfoundContent);
			file_put_contents(WMROOT."404.php",$notfoundContent);
		}
		
		
		//第二步 安装锁定文件
		@file_put_contents('../wmcms/config/install.lock.txt', time());
		//第三步 修改表前缀。
		if( $pre != 'wm_'){
			$rs = $db->prepare("SELECT CONCAT( 'ALTER TABLE ', table_name, ' RENAME TO ', REPLACE(table_name,'wm_',?),';') as newpre FROM information_schema.tables WHERE TABLE_SCHEMA = ?");
			$rs->execute(array($pre,$dbname));
			//只取列名
			$rs->setFetchMode(PDO::FETCH_ASSOC);
			$row = $rs->fetchAll();
			foreach ($row as $k=>$v)
			{
				$db->exec($v['newpre']);
			}
		}
	}
	
}catch(PDOException $e) {
	$errstr=$e->getMessage();
	if(strpos($errstr,'[2005]')){
		$errinfo='ขออภัย! ไม่สามารถเชื่อมต่อฐานข้อมูล';
	}else if(strpos($errstr,'[2002]')){
		$errinfo='ขออภัย! การกำหนดค่าฐานข้อมูลไม่ถูกต้อง';
	}else if(strpos($errstr,'[2003]')){
		$errinfo='ขออภัย! พอร์ตฐานข้อมูลไม่ถูกต้อง';
	}else if(strpos($errstr,'[1044]')){
		$errinfo='ขออภัย! คุณไม่มีสิทธิ์สร้างฐานข้อมูลใหม่ โปรดใช้ชื่อฐานข้อมูลตามค่าพื้นฐาน';
	}else if(strpos($errstr,'[1045]')){
		$errinfo='ขออภัย! ชื่อผู้ใช้หรือรหัสผ่านฐานข้อมูลไม่ภูกต้อง';
	}else if(strpos($errstr,'[1049]')){
		//创建数据库
	}else{
		$errinfo=$errstr;
	}
	echo '<div class="main cc"><div class="success_tip error_tip" style="margin-bottom: 30px;"><p>'.$errinfo.'</p></div><div class="bottom tac"><a href="javascript:;" onclick="javascript:history.go(-1);return false;" class="btn">ย้อนกลับ</a></div></div>';
	exit;
}
$db = null;
?>
<div class="step">
	<ul>
		<li class="on"><em>1</em>ตรวจสภาพแวดล้อม</li>
		<li class="on"><em>2</em>สร้างข้อมูล</li>
		<li class="current"><em>3</em>ติดตั้งสำเร็จ</li>
	</ul>
</div>

<div class="install" id="log">
	<ul id="loginner"></ul>
</div>

<form id="install" action="index.php?" method="post">
	<input type="hidden" name="action" value="step5">
</form>

<div class="bottom tac">
	<a href="javascript:;" class="btn_old">กำลังติดตั้ง...</a>
</div>

<script type="text/javascript">
var log = "สร้างกำหนดค่าระบบสำเร็จ!<wind>สร้างตารางข้อมูล wm_app_abs ... สำเร็จ!<wind>สร้างตาราง wm_app_app ... สำเร็จ!<wind>สร้างตาราง wm_app_firms ... สำเร็จ!<wind>สร้างตาราง wm_app_type ... สำเร็จ!<wind>สร้างตาราง  wm_article_article ... สำเร็จ!<wind>สร้างตาราง wm_article_sourceauthor ... สำเร็จ!<wind>สร้างตาราง wm_article_type ... สำเร็จ!<wind>สร้างตาราง wm_bbs_bbs ... สำเร็จ!<wind>สร้างตาราง wm_bbs_type ... สำเร็จ!<wind>สร้างตาราง wm_bbs_typemanager ... สำเร็จ!<wind>สร้างตาราง wm_flash_flash ... สำเร็จ!<wind>สร้างตาราง wm_link_click ... สำเร็จ!<wind>สร้างตาราง wm_link_link ... สำเร็จ!<wind>สร้างตาราง wm_link_set ... สำเร็จ!<wind>สร้างตาราง wm_link_type ... สำเร็จ!<wind>สร้างตาราง wm_novel_author ... สำเร็จ!<wind>สร้างตาราง wm_novel_chapter ... สำเร็จ!<wind>สร้างตาราง wm_novel_content ... สำเร็จ!<wind>สร้างตาราง wm_novel_authorvip ... สำเร็จ!<wind>สร้างตาราง wm_novel_dashang ... สำเร็จ!<wind>สร้างตาราง wm_novel_novel ... สำเร็จ!<wind>สร้างตาราง wm_novel_paychapter ... สำเร็จ!<wind>สร้างตาราง wm_novel_paynovel ... สำเร็จ!<wind>สร้างตาราง wm_novel_rec ... สำเร็จ!<wind>สร้างตาราง wm_novel_score ... สำเร็จ!<wind>สร้างตาราง wm_novel_set ... สำเร็จ!<wind>สร้างตาราง wm_novel_tags ... สำเร็จ!<wind>สร้างตาราง wm_novel_type ... สำเร็จ!<wind>สร้างตาราง wm_novel_user_bookshelf ... สำเร็จ!<wind>สร้างตาราง wm_novel_user_coll ... สำเร็จ!<wind>สร้างตาราง wm_novel_user_lvconfig ... สำเร็จ!<wind>สร้างตาราง wm_novel_user_rec ... สำเร็จ!<wind>สร้างตาราง wm_novel_volume ... สำเร็จ!<wind>สร้างตาราง wm_replay_content ... สำเร็จ!<wind>สร้างตาราง wm_replay_set ... สำเร็จ!<wind>สร้างตาราง wm_sign_sign ... สำเร็จ!<wind>สร้างตาราง wm_system_ad ... สำเร็จ!<wind>สร้างตาราง wm_system_competence ... สำเร็จ!<wind>สร้างตาราง wm_system_diy ... สำเร็จ!<wind>สร้างตาราง wm_system_domain ... สำเร็จ!<wind>สร้างตาราง wm_system_keys ... สำเร็จ!<wind>สร้างตาราง wm_system_manager ... สำเร็จ!<wind>สร้างตาราง wm_system_managerlogin ... สำเร็จ!<wind>สร้างตาราง wm_system_message ... สำเร็จ!<wind>สร้างตาราง wm_system_mession ... สำเร็จ!<wind>สร้างตาราง wm_system_operation ... สำเร็จ!<wind>สร้างตาราง wm_system_rules ... สำเร็จ!<wind>สร้างตาราง wm_system_searchkey ... สำเร็จ!<wind>สร้างตาราง wm_system_set ... สำเร็จ!<wind>สร้างตาราง wm_system_temp ... สำเร็จ!<wind>สร้างตาราง wm_system_urls ... สำเร็จ!<wind>สร้างตาราง wm_system_users ... สำเร็จ!<wind>สร้างตาราง wm_system_usershead ... สำเร็จ!<wind>สร้างตาราง wm_system_userslv ... สำเร็จ!<wind>สร้างตาราง wm_system_usersvist ... สำเร็จ!<wind>สร้างตาราง wm_system_users_msg ... สำเร็จ!<wind>สร้างตาราง wm_system_zt ... สำเร็จ!<wind>สร้างตาราง wm_system_ztdiytemp ... สำเร็จ!<wind>สร้างข้อมูลผู้ดูแลระบบสำเร็จ!<wind>เพิ่มปลั๊กอินสำเร็จ!<wind>อัปเดทแคชระบบเสร็จสิ้น!";
var n = 0;
var timer = 0;
log = log.split('<wind>');
function GoPlay(){
	if (n > log.length-1) {
		n=-1;
		clearIntervals();
	}
	if (n > -1) {
		postcheck(n);
		n++;
	}
}
function postcheck(n){
	document.getElementById('loginner').innerHTML += '<li><span class="correct_span">&radic;</span>' + log[n] + '</li>';
	document.getElementById('log').scrollTop = document.getElementById('log').scrollHeight;
}
function setIntervals(){
	timer = setInterval('GoPlay()',50);
}
function clearIntervals(){
	clearInterval(timer);
	document.getElementById('install').submit();
}
setTimeout(setIntervals, 100);
</script>
</div>
