<?php if(!defined('WMINC'))die();?>
<?php
//安装文件改名
rename('index.php',"index".md5(rand(0,99999).time()).".php");
//数据库结构已经导入，安装包里的 sql.sql 不再需要，保留它等于把整份 schema
//（包含管理员密码 hash 与 salt）暴露在 /install/sql.sql 上，所以安装完就删掉。
if( file_exists('sql.sql') )
{
	@unlink('sql.sql');
}
//整个安装目录改名，安装器连同 listen.txt 等辅助文件都不会再被访问到。
//改名失败（例如主机不允许重命名目录）时至少把入口文件改掉，并提示手动删除。
$installGone = false;
$newName = 'install_'.substr(md5(uniqid('', true)),0,8);
if( @rename(__DIR__, dirname(__DIR__).'/'.$newName) === true )
{
	$installGone = true;
}
else
{
	foreach (glob(__DIR__.'/*.php') as $installFile)
	{
		if( basename($installFile) != basename(__FILE__) )
		{
			@rename($installFile, $installFile.'.removed');
		}
	}
	//目录不能改名时，至少让 Apache 拒绝访问整个安装目录
	$deny = "<IfModule mod_authz_core.c>\r\n\tRequire all denied\r\n</IfModule>\r\n"
	      . "<IfModule !mod_authz_core.c>\r\n\tOrder allow,deny\r\n\tDeny from all\r\n</IfModule>\r\n";
	@file_put_contents(__DIR__.'/.htaccess', $deny);
}
//rename(WMROOT.'/install',WMROOT.'/install'.md5(rand(0,99999).time()));
?>
<div class="main cc">
	<div class="success_tip">
		<a href="/index.php" class="f16 b">ติดตั้งเสร็จสิ้น คลิกเพื่อเข้าชม</a>
		<p>หลังติดตั้งเสร็จสิ้นแล้ว โปรดลบโฟลเดอร์ install <span style="color:red">และสร้างการกำหนดค่าส่วนติดตั้ง API ในพื้นหลังแล้ว</span><br/>เบราว์เซอร์จะเปลี่ยนหน้าโดยอัตโนมัติ</p>
	</div>
</div>
<script type="text/javascript">
setTimeout(function(){window.location.href="/index.php"}, 3000);
</script>