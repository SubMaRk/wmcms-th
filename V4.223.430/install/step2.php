<?php
//初始化下一步
$next=true;
$os=PHP_OS;
$phpver=floatval(PHP_VERSION);
if($phpver>=5.3){
	if($phpver>=5.4 && $phpver<=7.0){
		$phps='correct';
	}else{
		$phps='error';
	}
}else{
	$next=false;
	$phps='error';
}
if( class_exists('PDO') ){
	$pdover='พร้อมใช้';
	$pdos='correct';
}else{
	$next=false;
	$pdover = 'ไม่รองรับ';
	$pdos='error';
}

function checkfolder($dirname){
	Global $next;
	$fd=@opendir($dirname);
	if($fd===false){
		echo '<span class="error_span">×</span>อ่าน/เขียนไม่ได้';
		$next=false;
	}else{
		if(is_writable($dirname)){
			echo '<span class="correct_span">&radic;</span>เขียนได้';
		}else{
			echo '<span class="error_span">×</span>อ่านได้แต่เขียนไม่ได้';
			$next=false;
		}
	}
}
//gd库
if(function_exists('gd_info')){
	$gd='<span class="correct_span">&radic;</span>พร้อมใช้';
}else{
	$gd='<span class="error_span">×</span>ไม่พร้อมใช้';
}
//curl库
if(function_exists('curl_init')){
	$curl='<span class="correct_span">&radic;</span>พร้อมใช้';
}else{
	$curl='<span class="error_span">×</span>ไม่พร้อมใช้';
}

//openssl库
if(get_extension_funcs('openssl')){
	$openssl='<span class="correct_span">&radic;</span>พร้อมใช้';
}else{
	$openssl='<span class="error_span">×</span>ไม่พร้อมใช้';
}
//sockets库
if(get_extension_funcs('sockets')){
	$sockets='<span class="correct_span">&radic;</span>พร้อมใช้';
}else{
	$sockets='<span class="error_span">×</span>ไม่พร้อมใช้';
}
//short_open_tag建议关闭
if(get_extension_funcs('short_open_tag')){
	$opentag ='<span class="error_span">&radic;</span>พร้อมใช้';
}else{
	$opentag ='<span class="correct_span">×</span>ไม่พร้อมใช้';
}

//ZIP库
if(class_exists('ZipArchive')){
	$zips='<span class="correct_span">&radic;</span>พร้อมใช้';
}else{
	$zips='<span class="error_span">×</span>ไม่พร้อมใช้';
}
//root方法
if( @$_SERVER['DOCUMENT_ROOT'] != '' ){
	$root='<span class="correct_span">&radic;</span>พร้อมใช้';
}else{
	$root='<span class="error_span">×</span>ไม่พร้อมใช้';
}
?>
<div class="step">
	<ul>
	<li class="current"><em>1</em>ทดสอบสภาพแวดล้อม</li>
	<li><em>2</em>สร้างข้อมูล</li>
	<li><em>3</em>เสร็จสิ้นการติดตั้ง</li>
	</ul>
</div>

<div class="server">
	<table width="100%">
	<tr>
		<td class="td1">ทดสอบสภาพแวดล้อม</td>
		<td class="td1" width="30%">ปัจจุบัน</td>
		<td class="td1" width="22%">แนะนำ</td>
		<td class="td1" width="22%">ขั้นต่ำ</td>
	</tr>
	<?php
	if($_SERVER['HTTP_HOST'] !== '127.0.0.1' || $_SERVER['HTTP_HOST']=='localhost'){
		echo '<tr><td class="td1" style="color:red" colspan="4">การทดสอบการติดตั้งสามารถใช้ไอพี Local ได้ แต่ในสภาพแวดล้อมที่เป็นทางการ โปรดใช้ชื่อโดเมนในการติดตั้ง ไม่อย่างนั้นคุณจะไม่สามารถใช้บริการอัปเดทผ่านคลาวด์ออนไลน์และฟังก์ชั่นอื่น ๆ ได้</td></tr>';
	}
	?>
	<tr>
		<td>ระบบปฏิบัติการ</td>
		<td><span class="correct_span">&radic;</span><?php echo $os;?></td>
		<td>UNIX</td>
		<td>ไม่จำกัด</td>
	</tr>
	<tr>
		<td>เวอร์ชั่น PHP</td>
		<td><span class="<?php echo $phps;?>_span">&radic;</span><?php echo $phpver;?></td>
		<td><= 7.0</td>
		<td>5.3</td>
	</tr>
	<tr>
		<td>PDO</td>
		<td><span class="<?php echo $pdos;?>_span">&radic;</span><?php echo $pdover;?></td>
		<td>รองรับ</td>
		<td>รองรับ</td>
	</tr>
	<tr>
		<td>MYSQL</td>
		<td><span class="error_span">&radic;</span>แนะนำ [ไม่ตรวจพบตัวท้องถิ่น]</td>
		<td>>= 5.3</td>
		<td>5.2</td>
	</tr>
	</table>

	<table width="100%">
	<tr>
		<td class="td1">ไลบลารีทั่วไป</td>
		<td class="td1" width="20%">ปัจจุบัน</td>
		<td class="td1" width="35%">แนะนำ</td>
	</tr>
	<tr>
		<td>short_open_tag</td>
		<td><?=$opentag?></td>
		<td>แนะนำให้ปิด เนื่องจากมีผลต่อประสิทธิภาพป้ายกำกับ</td>
	</tr>
	<tr>
		<td>DOCUMENT_ROOT</td>
		<td><?=$root?></td>
		<td>แนะนำให้เปิด เพื่อให้สามารถใช้เส้นทางเว็บไซต์ได้อย่างถูกต้อง</td>
	</tr>
	<tr>
		<td>องค์ประกอบ OpenSSL</td>
		<td><?=$openssl?></td>
		<td>แนะนำให้เปิด จำเป็นสำหรับ Sendmail, การชำระเงิน และอื่น ๆ</td>
	</tr>
	<tr>
		<td>องค์ประกอบ Sockets</td>
		<td><?=$sockets?></td>
		<td>แนะนำให้เปิด จำเป็นสำหรับ Sendmail, การชำระเงิน และอื่น ๆ</td>
	</tr>
	<tr>
		<td>ไลบลารีประมวณผลรูปภาพ GD</td>
		<td><?=$gd?></td>
		<td>แนะนำให้เปิด จำเป็นสำหรับฟังก์ชั่นประมวณผลรูปภาพ</td>
	</tr>
	<tr>
		<td>ไลบลารีที่อยู่ cUrl</td>
		<td><?=$gd?></td>
		<td>แนะนำให้เปิด จำเป็นสำหรับฟังก์ชั่นนิยาย</td>
	</tr>
	<tr>
		<td>ไฟล์ไลบลารีบีบอัด ZIP</td>
		<td><?=$zips?></td>
		<td>แนะนำให้เปิด จำเป็นต้องใช้ในการอัปเดทออนไลน์</td>
	</tr>
	</table>


	<table width="100%">
	<tr>
		<td class="td1">ตรวจสอบสิทธิ์ไฟล์/ไดเรกทอรี</td>
		<td class="td1" width="20%">ปัจจุบัน</td>
		<td class="td1" width="35%">จำเป็น</td>
	</tr>
	<tr>
		<td colspan="3" style="color:red">โปรดกำหนดโฟลเดอร์การติดตั้งให้สามารถอ่านและเขียนได้ (Windows) หรือสิทธิ์ 0755 (Linux)</td>
	</tr>
	<tr>
		<td>/wmcms/config/</td>
		<td><?php checkfolder('../wmcms/config/')?></td>
		<td><span class="correct_span">&radic;</span>อ่าน/เขียนได้</td>
	</tr>
	<tr>
		<td>/install/</td>
		<td><?php checkfolder('../install/')?></td>
		<td><span class="correct_span">&radic;</span>อ่าน/เขียนได้</td>
	</tr>
	<tr>
		<td>/cache/</td>
		<td><?php checkfolder('../cache/')?></td>
		<td><span class="correct_span">&radic;</span>อ่าน/เขียนได้</td>
	</tr>
	<tr>
		<td>/files/</td>
		<td><?php checkfolder('../files/')?></td>
		<td><span class="correct_span">&radic;</span>อ่าน/เขียนได้</td>
	</tr>
	<tr>
		<td>/upload/</td>
		<td><?php checkfolder('../upload/')?></td>
		<td><span class="correct_span">&radic;</span>อ่าน/เขียนได้</td>
	</tr>
	<tr>
		<td>/module/</td>
		<td><?php checkfolder('../module/')?></td>
		<td><span class="correct_span">&radic;</span>อ่าน/เขียนได้</td>
	</tr>
	<tr>
		<td>/templates/</td>
		<td><?php checkfolder('../templates/')?></td>
		<td><span class="correct_span">&radic;</span>อ่าน/เขียนได้</td>
	</tr>
	</table>
</div>


<div class="bottom tac">
	<form action="index.php" id="form" method="post">
		<input type="hidden" name="action" value="step3">
	</form>
	<a href="javascript:;" onclick="document.getElementById('form').action.value='step2';document.getElementById('form').submit();return false;" class="btn">ตรวจใหม่</a>
	<?php
	if(!$next){
		echo '<a href="javascript:;" class="btn_old">ตรวจสอบ</a>';
	}else{
		echo '<a href="javascript:;" onclick="document.getElementById(\'form\').submit();return false;" class="btn">ขั้นตอนต่อไป</a>';
	}
	?>
</div>
