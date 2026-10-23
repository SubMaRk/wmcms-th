<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=operate.zt.config&t=config_edit" method="post" data-toggle="validate">
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">พารามิเตอร์ตรวจสอบหน้าหัวข้อพิเศษ：</td>
        <td colspan="3"><?php echo $manager->GetForm('zt' , 'par_zt');?></td>
      </tr>
      <tr>
        <td width="200">พารามิเตอร์ตรวจสอบหน้าความคิดเห็น:</td>
        <td colspan="3"><?php echo $manager->GetForm('zt' , 'par_replay');?></td>
      </tr>
    </table>
    

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าการโต้ตอบโมดูล</b></th></tr></thead>
       <tr>
        <td width="200">ฟังก์ชันโหวตชอบ/ไม่ชอบหัวข้อพิเศษ：</td>
        <td><?php echo $manager->GetForm('zt' , 'dingcai_open');?></td>
        <td width="200">โหวตต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('zt' , 'dingcai_login');?></td>
        <td width="200">จำนวนโหวตต่อหัวข้อพิเศษต่อวัน:</td>
        <td><?php echo $manager->GetForm('zt' , 'dingcai_count');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันให้คะแนนหัวข้อพิเศษ：</td>
        <td><?php echo $manager->GetForm('zt' , 'score_open');?></td>
        <td>ให้คะแนนต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('zt' , 'score_login');?></td>
        <td>จำนวนให้คะแนนต่อหัวข้อพิเศษต่อวัน:</td>
        <td><?php echo $manager->GetForm('zt' , 'score_count');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันความคิดเห็นหัวข้อพิเศษ：</td>
        <td><?php echo $manager->GetForm('zt' , 'replay_open');?></td>
        <td>ความคิดเห็นต้องเข้าสู่ระบบหรือไม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('zt' , 'replay_login');?></td>
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
$(document).ready(function(){
	$('#default_simg').css("width",'300px');
	$('#dingcai_count').css("width",'50px');
	$('#score_count').css("width",'50px');
});
</script>
