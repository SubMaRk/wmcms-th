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
//rename(WMROOT.'/install',WMROOT.'/install'.md5(rand(0,99999).time()));
?>
<div class="main cc">
	<div class="success_tip">
		<a href="/index.php" class="f16 b">ติดตั้งเสร็จสิ้น คลิ๊กเพื่อเข้าชม</a>
		<p>หลังติดตั้งเสร็จสิ้นแล้ว โปรดลบโฟลเดอร์ install <span style="color:red">และสร้างการกำหนดค่าส่วนติดตั้ง API ในพื้นหลังแล้ว</span><br/>เบราว์เซอร์จะเปลี่ยนหน้าโดยอัตโนมัติ</p>
	</div>
</div>
<script type="text/javascript">
setTimeout(function(){window.location.href="/index.php"}, 3000);
</script>