<?php if(!defined('WMINC'))die();?>
<?php
//安装文件改名
rename('index.php',"index".md5(rand(0,99999).time()).".php");
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