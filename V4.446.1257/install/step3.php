<?php if(!defined('WMINC'))die();?>
<div class="step">
	<ul>
	<li><em>1</em>ทดสอบสภาพแวดล้อม</li>
	<li class="current"><em>2</em>สร้างข้อมูล</li>
	<li><em>3</em>เสร็จสิ้นการติดตั้ง</li>
	</ul>
</div>

<div class="server">
	<form id="install" action="index.php" method="post">
	<input type="hidden" name="action" value="step4">
	<table width="100%">
	<tr>
		<td class="td1" width="100">เลือกโมดูล</td>
		<td class="td1" width="200">&nbsp;</td>
		<td class="td1">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3">
			<?php 
			$i = 1;
			foreach ($module as $k=>$v)
			{
				$width="40";
				if( $i== '1' || $i == '5' || $i == '9' || $i == '13' ){
					$width="50";
				}
				echo '<label style="margin-left: '.$width.'px;cursor: pointer;"><input type="checkbox" name="module[]" '.@$v['disabled'].' value="'.$k.'" '.@$v['checked'].'> '.$v['name'].'</label>';
				if($i == '4' || $i == '8' || $i == '12'){
					echo '<br/>';
				}
				$i++;
			}
			?>
		</td>
	</tr>
	</table>
	<table width="100%">
	<tr>
		<td class="td1" width="100">ข้อมูลฐานข้อมูล</td>
		<td class="td1" width="200">&nbsp;</td>
		<td class="td1">&nbsp;</td>
	</tr>
	<tr>
		<td class="tar">เซิร์ฟเวอร์ : </td>
		<td><input type="text" name="dbhost" value="localhost" class="input"></td>
		<td><span class="gray">ที่อยู่เซิร์ฟเวอร์ฐานข้อมูล ส่วนมากจะใช้เป็น localhost</span></td>
	</tr>
	<tr>
		<td class="tar">พอร์ต : </td>
		<td><input type="text" name="dbport" value="3306" class="input"></td>
		<td><span class="gray">ค่าพื้นฐานคือ 3306</span></td>
	</tr>
	<tr>
	  <td class="tar">รูปแบบ ; </td>
	  <td><input type="radio" value="mysql" CHECKED />&nbsp;<label for="mysql">MySQL</label>
	  </td>
	  <td></td>
	</tr>
	<tr>
		<td class="tar">ชื่อผู้ใช้ : </td>
		<td><input type="text" name="dbuser" value="root" class="input"></td>
		<td><span class="gray">ชื่อผู้ใช้ในการเข้าสู่ฐานข้อมูล</span></td>
		<td></td>
	</tr>
	<tr>
		<td class="tar">รหัสผ่าน : </td>
		<td><input type="text" name="dbpw" value="" class="input"></td>
		<td><span class="gray">รหัสผ่านที่ใช้ในการเข้าสู่ฐานข้อมูล</span></td>
		<td></td>
	</tr>
	<tr>
		<td class="tar">ชื่อฐานข้อมูล : </td>
		<td><input type="text" name="dbname" value="" class="input"></td>
		<td><span class="gray">หากคุณไม่ได้มีสิทธิ์สร้างใหม่ ให้ใช้ฐานข้อมูลตามค่าพื้นฐาน</span></td>
	</tr>
	<tr>
		<td class="tar">คำเฉพาะตาราง : </td>
		<td><input type="text" name="pre" value="wm_" class="input"></td>
		<td><span class="gray">ค่าเริ่มต้นคือ wm_</span></td>
	</tr>
	</table>
	<table width="100%">
	<tr>
		<td class="td1" width="100">ข้อมูลผู้ดูแลระบบ</td>
		<td class="td1" width="200">&nbsp;</td>
		<td class="td1">&nbsp;</td>
	</tr>
	<tr>
		<td class="tar">อีเมล์ : </td>
		<td><input type="text" name="adminemail" value="" class="input"></td>
		<td><span class="gray">อีเมล์ของผู้ดูแลระบบ</span></td>
	</tr>
	<tr>
		<td class="tar">ชื่อผู้ใช้ : </td>
		<td><input type="text" name="adminuser" value="admin" class="input"></td>
		<td><span class="gray">บัญชีที่ใช้ในการเข้าจัดการในระบบพื้นหลัง</span></td>
	</tr>
	<tr>
		<td class="tar">รหัสผ่าน : </td>
		<td><input type="text" name="adminpsw" class="input"></td>
		<td><span class="gray">รหัสผ่านที่ใช้ในการเข้าจัดการในระบบพื้นหลัง</span></td>
	</tr>
	<tr>
		<td class="tar">รหัสผ่านอีกครั้ง : </td>
		<td><input type="text" name="admincpsw" class="input"></td>
		<td><span class="gray">กรอกรหัสผ่านซ้ำอีกครั้ง</span></td>
		<td></td>
	</tr>
	</table>
	</form>
</div>


<div class="bottom tac">
	<a href="javascript:;" onclick='window.location.href="javascript:history.go(-1)";return false;' class="btn">ย้อนกลับ</a><a href="javascript:;" id="next" onclick="postcheck();return false;" class="btn">ถัดไป</a>
</div>

<script type="text/javascript">
var isSub = false;
function postcheck(){
	if( isSub == true ){
		return false;
	}
	var obj = document.getElementById('install');
	if (!obj.dbhost.value) {
		alert('โปรดกรอกข้อมูลเซิร์ฟเวอร์ฐานข้อมูล');
		obj.dbhost.focus();
		return false;
	} else if (!obj.dbport.value) {
		alert('โปรดกรอกพอร์ตฐานข้อมูล');
		obj.dbport.focus();
		return false;
	} else if (!obj.dbuser.value) {
		alert('โปรดกรอกชื่อผู้ใช้ฐานข้อมูล');
		obj.dbuser.focus();
		return false;
	} else if (!obj.dbname.value) {
		alert('โปรดกรอกชื่อฐานข้อมูล');
		obj.dbname.focus();
		return false;
	} else if (!obj.adminemail.value) {
		alert('โปรดกรอกอีเมล์ผู้ดูแลระบบ');
		obj.adminemail.focus();
		return false;
	} else if (!obj.adminuser.value) {
		alert('โปรดกรอกชื่อผู้ดูแลระบบ');
		obj.adminuser.focus();
		return false;
	} else if (!obj.adminpsw.value) {
		alert('โปรดกรอกรหัสผ่านผู้ดูแลระบบ');
		obj.adminpsw.focus();
		return false;
	} else if (obj.adminpsw.value != obj.admincpsw.value) {
		alert('โปรดกรอกรหัสผ่านซ้ำอีกครั้ง');
		obj.admincpsw.focus();
		return false;
	} else if (!obj.dbpw.value && !confirm('ไม่ได้กรอกรหัสผ่านญานข้อมูล ซึ่งจะใช้งานแบบไม่ใช้รหัสผ่าน')) {
		return false;
	}
	else
	{
		isSub = true;
		document.getElementById('next').disabled = 'disabled';
		document.getElementById('next').setAttribute("class", "btn_old");
		document.getElementById('next').innerHTML = 'กำลังติดตั้ง...';
		obj.submit();
	}
}
</script>