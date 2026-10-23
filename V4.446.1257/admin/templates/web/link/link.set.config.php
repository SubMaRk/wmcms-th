<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>
	
<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=link.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">พารามิเตอร์ตรวจสอบหน้าลิงก์เพื่อน:</td>
        <td><?php echo $manager->GetForm('link' , 'par_link');?></td>
        <td>เปิดรับสมัครลิงก์เพื่อน:</td>
        <td><?php echo $manager->GetForm('link' , 'join');?></td>
      </tr>
      <tr>
        <td>โหมดลิงก์ออกสาธารณะ：</td>
        <td><?php echo $manager->GetForm('link' , 'link_url_outtype');?></td>
        <td>โหมดการคลิกของลิงก์เพื่อน:</td>
        <td><?php echo $manager->GetForm('link' , 'click_type');?></td>
      </tr>
      <tr>
        <td>ตรวจสอบ UA：</td>
        <td colspan="3"><?php echo $manager->GetForm('link' , 'check_ua');?></td>
      </tr>
      <tr>
        <td>บันทึกเพียงครั้งเดียวต่อวันต่อ IP:</td>
        <td><?php echo $manager->GetForm('link' , 'check_oneip');?></td>
        <td>บันทึกการคลิก:</td>
        <td><?php echo $manager->GetForm('link' , 'click_log');?></td>
      </tr>
      <tr>
        <td>สถิติ IP：</td>
        <td><?php echo $manager->GetForm('link' , 'getip_open');?></td>
        <td>สถิติตำแหน่ง：</td>
        <td><?php echo $manager->GetForm('link' , 'getadress_open');?></td>
      </tr>
      <tr>
        <td>สถานะเริ่มต้นของคำขอหน้าเว็บ:</td>
        <td><?php echo $manager->GetForm('link' , 'join_status');?></td>
        <td>สถานะเริ่มต้นเมื่อเพิ่มจากหลังบ้าน:</td>
        <td><?php echo $manager->GetForm('link' , 'admin_status');?></td>
      </tr>
      <tr>
        <td>ระยะห่างกันสแปม(วินาที):</td>
        <td colspan="3"><?php echo $manager->GetForm('link' , 'ref_time');?></td>
      </tr>
      <tr>
        <td>หน้าที่เปลี่ยนไปเมื่อคลิกเข้า (เว้นว่าง = หน้าแรก):</td>
        <td colspan="3"><?php echo $manager->GetForm('link' , 'in_jump');?> 格式:<?php echo WMURL?></td>
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
	$("#in_jump").css('width','400');
});
</script>