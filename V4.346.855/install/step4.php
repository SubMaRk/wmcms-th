<?php if(!defined('WMINC'))die();?>
<?php
$dbhost=$_POST['dbhost'];
$dbport=$_POST['dbport'];
$dbuser=$_POST['dbuser'];
$dbpw=$_POST['dbpw'];
$dbname=$_POST['dbname'];
$adminuser=$_POST['adminuser'];
$adminemail=$_POST['adminemail'];
$adminpsw = str::E(($_POST['adminpsw']));
$pre=$_POST['pre'];

try{
	//判断数据库信息
	$dsn = "mysql:host=$dbhost;port=$dbport";
	$db = new PDO($dsn, $dbuser, $dbpw);//
	//新建数据库
	@$db->exec('CREATE database `'.$dbname.'`');
	//关闭测试
	$db = null;

	//通过测试
	//获得appid和key等信息
	$cloudSer = NewClass('cloud');
	$apiArr = $cloudSer->Install();
	$appid = @$apiArr['data']['appid'];
	$apikey = @$apiArr['data']['apikey'];
	$secret = @$apiArr['data']['secret'];
	if($apiArr['code'] != '200')
	{
		die($apiArr['msg']);
		return false;
	}
	else if($appid == '' || $apikey == '' || $secret == '' )
	{
		die('ไม่สามารถรับไอดีแอปฯ และไม่สามารถติดตั้งให้สมบูรณ์ได้');
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
		}
	
		//修改管理员账号信息
		$db->exec("update `wm_manager_manager` set `manager_name`='{$adminuser}',`manager_psw`='{$adminpsw}',`manager_salt`='' where `manager_id`=1");
		//修改域名，修改管理员邮箱
		$domain = @$_SERVER['HTTP_HOST'];
		$db->exec("update `wm_config_config` set `config_value`='{$domain}' where `config_id`=2");
		$db->exec("update `wm_config_config` set `config_value`='".HTTP_TYPE."' where `config_id`=396");
		$db->exec("update `wm_config_config` set `config_value`='{$adminemail}' where `config_id`=3");

		//修改网站的API接口配置
		$db->exec("update `wm_api_api` set `api_appid`='".$appid."',`api_apikey`='".$apikey."',`api_secretkey`='".$secret."' where `api_id`=1");
		$apiContent=file_get_contents("../wmcms/config/api.config.php");
		$apiContent=preg_replace("/'system' => array\('api_type'=>'1','api_title'=>'สถานีทั่วไป','api_ctitle'=>'','api_open'=>'1','api_appid'=>'(.*?)','api_apikey'=>'(.*?)','api_secretkey'=>'(.*?)',/", "'system' => array('api_type'=>'1','api_title'=>'สถานีทั่วไป','api_ctitle'=>'','api_open'=>'1','api_appid'=>'{$appid}','api_apikey'=>'{$apikey}','api_secretkey'=>'{$secret}',", $apiContent);
		file_put_contents("../wmcms/config/api.config.php",$apiContent);
		
		
		//更改配置文件
		$TxtContent=file_get_contents("../wmcms/config/data.config.php");
		//数据库IP
		$TxtContent=preg_replace("/'host'	=>	'(.*?)'/", "'host'	=>	'$dbhost'", $TxtContent);
		//数据库端口
		$TxtContent=preg_replace("/'port'	=>	'(.*?)'/", "'port'	=>	'$dbport'", $TxtContent);
		//数据库用户名
		$TxtContent=preg_replace("/'uname'	=>	'(.*?)'/", "'uname'	=>	'$dbuser'", $TxtContent);
		//数据库密码
		$TxtContent=preg_replace("/'upsw'	=>	'(.*?)'/", "'upsw'	=>	'$dbpw'", $TxtContent);
		//数据库名
		$TxtContent=preg_replace("/'name'	=>	'(.*?)'/", "'name'	=>	'$dbname'", $TxtContent);
		//数据库表前缀
		$TxtContent=preg_replace("/'prefix'	=>	'(.*?)'/", "'prefix'	=>	'$pre'", $TxtContent);
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
					$db->exec("update `wm_system_menu` set `menu_status`='1' where `menu_id`={$moduleArr['id']}");
				}
				else
				{
					$unInstallModule[] = $v['file'];
					//隐藏菜单
					$db->exec("update `wm_system_menu` set `menu_status`='0' where `menu_id`={$moduleArr['id']}");
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
			$rs = $db->query("SELECT CONCAT( 'ALTER TABLE ', table_name, ' RENAME TO ', REPLACE(table_name,'wm_','{$pre}'),';')  as newpre FROM information_schema.tables WHERE TABLE_SCHEMA = '{$dbname}';");
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
	}else if(strpos($errstr,'[1045]')){
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
