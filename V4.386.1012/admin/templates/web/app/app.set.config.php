<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=app.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าโมดูลทั่วไป</b></th></tr></thead>
      <tr>
        <td>พารามิเตอร์ตรวจสอบหน้าแอปฯ : </td>
        <td><?php echo $manager->GetForm('app' , 'par_app');?></td>
        <td>พารามิเตอร์ตรวจสอบหน้าความคิดเห็น : </td>
        <td><?php echo $manager->GetForm('app' , 'par_replay');?></td>
      </tr>
      <tr>
        <td width="200">ค่าเริ่มต้นไอคอนแอปฯ : </td>
        <td width="400"><?php echo $manager->GetForm('app' , 'default_ico');?></td>
        <td width="200">ค่าเริ่มต้นไหน้าปกแอปฯ : </td>
        <td><?php echo $manager->GetForm('app' , 'default_simg');?></td>
      </tr>
      <tr>
        <td>ค่าเริ่มต้นสถานะเผยแพร่แอปฯ : </td>
        <td><?php echo $manager->GetForm('app' , 'admin_add');?></td>
        <td>เปิดให้ดาวน์โหลดแอปฯ : </td>
        <td><?php echo $manager->GetForm('app' , 'down_open');?></td>
      </tr>
      <tr>
        <td>สร้าง HTML แอปฯ อัตโนมัติ : </td>
        <td colspan="3"><?php echo $manager->GetForm('app' , 'auto_create_html');?></td>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าโมดูลแอปฯ</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชั่นความชอบ : </td>
        <td width="400"><?php echo $manager->GetForm('app' , 'dingcai_open');?></td>
        <td width="200">ความชอบประจำวัน : </td>
        <td><?php echo $manager->GetForm('app' , 'dingcai_count');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชั่นความนิยม : </td>
        <td><?php echo $manager->GetForm('app' , 'score_open');?></td>
        <td>ความนิยมประจำวัน : </td>
        <td><?php echo $manager->GetForm('app' , 'score_count');?></td>
      </tr>
      <tr>
        <td>เข้าสู่ระบบเพื่อให้คะแนน : </td>
        <td colspan="2"><?php echo $manager->GetForm('app' , 'score_login');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชั่นความคิดเห็น : </td>
        <td><?php echo $manager->GetForm('app' , 'replay_open');?></td>
        <td>เข้าสู่ระบบเพื่อแสดงความคิดเห็น : </td>
        <td><?php echo $manager->GetForm('app' , 'replay_login');?></td>
      </tr>
    </table>

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าโมดูลค้นหา</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชั่นค้นหา : </td>
        <td width="400"><?php echo $manager->GetForm('app' , 'search_open');?></td>
        <td width="200">เวลาที่ใช้ในการค้นหาแต่ละครั้ง (หน่วย : วินาที) ：</td>
        <td><?php echo $manager->GetForm('app' , 'search_time');?></td>
      </tr>
    </table>
  </form>
</div>



<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">จัดเก็บ</button></li>
    </ul>
</div>




<script>
$(document).ready(function(){
	$('#dingcai_count').css("width",'50px');
	$('#score_count').css("width",'50px');
	$('#search_time').css("width",'50px');
});
</script>
