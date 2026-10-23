<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.dev.config&t=config" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่านักพัฒนา</b></th></tr></thead>
      <tr>
        <td width="200">บันทึกการทำงาน</td>
        <td width="350">
        	<input name="runlog" type="radio" data-toggle="icheck" data-label="关闭LOG记录" value="0" <?php if(!RUNLOG){echo 'checked="1"';}?> />
      		<input name="runlog" type="radio" data-toggle="icheck" data-label="开启LOG记录" value="1" <?php if(RUNLOG){echo 'checked="1"';}?>/>
	    </td>
        <td>โปรดเปิดอย่างระมัดระวัง หากเข้าชมมากจะใช้พื้นที่ดิสก์จำนวนมาก สามารถบันทึกคำขอเข้าถึงและบันทึก sql ลงโฟลเดอร์แคช</td>
      </tr>
      <tr>
        <td width="200">โหมด DEBUG</td>
        <td width="350">
        	<input name="debug" type="radio" data-toggle="icheck" data-label="关闭DEBUG模式" value="0" <?php if(!DEBUG){echo 'checked="1"';}?> />
      		<input name="debug" type="radio" data-toggle="icheck" data-label="开启DEBUG模式" value="1" <?php if(DEBUG){echo 'checked="1"';}?>/>
	    </td>
        <td>เปิดโหมด DEBUG เพื่อแสดงข้อผิดพลาดและคำเตือนอย่างละเอียด</td>
      </tr>
      <tr>
        <td>โหมดนักพัฒนา</td>
        <td width="350">
        	<input name="developer" type="radio" data-toggle="icheck" data-label="关闭开发者模式" value="0" <?php if(!DEVELOPER){echo 'checked="1"';}?> />
      		<input name="developer" type="radio" data-toggle="icheck" data-label="开启开发者模式" value="1" <?php if(DEVELOPER){echo 'checked="1"';}?>/>
	    </td>
	    <td>โหมดนักพัฒนาแสดงไฟล์ที่หน้าปัจจุบันอ้างอิงและคำสั่ง sql ที่รันอยู่</td>
      </tr>
      <tr>
        <td style="color: red"><b>โหมดข้อผิดพลาดร้ายแรง<b></td>
        <td width="350">
        	<input name="err" type="radio" data-toggle="icheck" data-label="关闭错误致命模式" value="0" <?php if(!ERR){echo 'checked="1"';}?> />
      		<input name="err" type="radio" data-toggle="icheck" data-label="开启错误致命模式" value="1" <?php if(ERR){echo 'checked="1"';}?>/>
	    </td>
        <td>ค่าเริ่มต้นคือปิด เมื่อเปิดแล้วหากเกิดข้อผิดพลาดไม่ร้ายแรง โปรแกรมจะหยุดทำงาน<span style="color: red">รวมถึงหลังบ้าน โปรดเปิดอย่างระมัดระวัง</span>。</td>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>การตั้งค่าสำหรับนักพัฒนาอื่น ๆ</b></th></tr></thead>
      <tr>
        <td>สถิติข้อผิดพลาด 404</td>
        <td width="350">
        	<input name="notfound" type="radio" data-toggle="icheck" data-label="关闭404错误统计" value="0" <?php if(!NOTFOUND){echo 'checked="1"';}?> />
      		<input name="notfound" type="radio" data-toggle="icheck" data-label="开启404错误统计" value="1" <?php if(NOTFOUND){echo 'checked="1"';}?>/>
	    </td>
        <td>เมื่อเปิดแล้วจะนับสถิติหน้าที่เกิดข้อผิดพลาด 404 ต้องตั้งหน้า 404 เริ่มต้นไปที่ 404.php ในไดเรกทอรีราก</td>
      </tr>
      <tr>
        <td>สถิติข้อผิดพลาด 500</td>
        <td width="350">
        	<input name="serverer" type="radio" data-toggle="icheck" data-label="关闭500错误统计" value="0" <?php if(!SERVERER){echo 'checked="1"';}?> />
      		<input name="serverer" type="radio" data-toggle="icheck" data-label="开启500错误统计" value="1" <?php if(SERVERER){echo 'checked="1"';}?>/>
	    </td>
	    <td>เมื่อเปิดแล้วจะนับสถิติหน้าที่เกิดข้อผิดพลาด 500 ต้องตั้งหน้า 500 เริ่มต้นไปที่ 500.php ในไดเรกทอรีราก</td>
      </tr>
      <tr>
        <td width="200">สถิติการครอว์ลสไปเดอร์</td>
        <td width="350">
        	<input name="spider" type="radio" data-toggle="icheck" data-label="关闭蜘蛛统计" value="0" <?php if(!SPIDER){echo 'checked="1"';}?> />
      		<input name="spider" type="radio" data-toggle="icheck" data-label="开启蜘蛛统计" value="1" <?php if(SPIDER){echo 'checked="1"';}?>/>
	    </td>
	    <td>เมื่อเปิดแล้วจะบันทึกการเข้าของบอททั้งหมด หน้าแบบสแตติกจะนับไม่ได้</td>
      </tr>
      <tr>
        <td colspan="4">เมื่อเปิดแล้วไปดูข้อมูลละเอียดที่เมนู SEO ของเว็บไซต์</td>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table warning_set">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าการแจ้งเตือนล่วงหน้า</b></th></tr></thead>
      <tr>
        <td colspan="4"><b style="color: red">ก่อนเปิดการแจ้งเตือน โปรดตรวจสอบว่าช่องทางนั้นเปิดอยู่และรับข้อความได้ปกติ</b></td>
      </tr>
      <tr id="warning_open_box">
        <td width="200">แจ้งเตือนล่วงหน้า</td>
        <td width="350">
            <?php echo $manager->GetForm('dev','warning_open');?>
	    </td>
        <td>เมื่อเปิดแล้วจะแจ้งเตือนการเข้าสู่ระบบหลังบ้านและข้อผิดพลาดโค้ดได้</td>
      </tr>
      <tr id="warning_channel_box" class="warning_open hide">
        <td>ช่องทางแจ้งเตือน</td>
        <td width="350">
            <?php echo $manager->GetForm('dev','warning_channel');?>
	    </td>
	    <td>ช่องทางอีเมลและ SMS มือถือต้องตั้งผู้รับ</td>
      </tr>
      <tr id="warning_hook_channel_box" class="warning_open hide">
        <td>ช่องทาง WebHook</td>
        <td width="350">
            <?php echo $manager->GetForm('dev','warning_hook_channel');?>
	    </td>
	    <td>กรุณาเลือก WebHook ที่รับข้อความ</td>
      </tr>
      <tr id="warning_receive_box" class="warning_open hide">
        <td>ผู้รับช่องทางแจ้งเตือน</td>
        <td width="350">
            <?php echo $manager->GetForm('dev','warning_receive');?>
	    </td>
	    <td>อีเมลหรือหมายเลขโทรศัพท์ของผู้รับ</td>
      </tr>
      <tr id="warning_type_box" class="warning_open hide">
        <td>ประเภทการแจ้งเตือน</td>
        <td width="350">
            <?php echo $manager->GetForm('dev','warning_type');?>
	    </td>
	    <td>เมื่อเลือกแล้ว เหตุการณ์ที่เกี่ยวข้องจะส่งการแจ้งเตือน</td>
      </tr>
    </table>
  </form>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">บันทึก</button></li>
    </ul>
</div>

<script>
function SetOpen(open){
    if( open == '1'){
        $('#warning_channel_box').removeClass('hide');
    }else{
        $('.warning_open').addClass('hide');
    }
}
function SetChannel(channel){
    if( channel == 'webhook'){
        $('#warning_hook_channel_box').removeClass('hide');
        $('#warning_receive_box').addClass('hide');
    }else{
        $('#warning_hook_channel_box').addClass('hide');
        $('#warning_receive_box').removeClass('hide');
    }
    $('#warning_type_box').removeClass('hide');
}
$(document).ready(function(){
    SetOpen('<?php echo $warningOpen;?>');
    <?php
        if( $warningOpen=='1'){
            echo 'SetChannel("'.$warningChannel.'")';   
        }
    ?>
    
	$('#warning_open').change(function(){
	    SetOpen($(this).val());
	});
	$('#warning_channel').change(function(){
	    SetChannel($(this).val());
	});
});
</script>