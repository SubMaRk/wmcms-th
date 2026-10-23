<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=article.config&t=edit" method="post" data-toggle="validate">
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td>รูปย่อเริ่มต้นที่หน้าเว็บเรียกใช้:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'default_simg');?></td>
      </tr>
      <tr>
        <td width="200">สถานะเริ่มต้นการเผยแพร่บทความจากหลังบ้าน:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'admin_add');?></td>
      </tr>
      <tr>
        <td>วิธีลบข้อมูล:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'admin_del');?></td>
      </tr>
      <tr>
        <td>พารามิเตอร์ตรวจสอบหน้าบทความ:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'par_article');?></td>
      </tr>
      <tr>
        <td>พารามิเตอร์ตรวจสอบหน้าความคิดเห็น:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'par_replay');?></td>
      </tr>
      <tr>
        <td>สร้าง HTML บทความอัตโนมัติ:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'auto_create_html');?></td>
      </tr>
      <tr>
        <td>วิธีบันทึกเนื้อหาบทความ:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'data_save_type');?></td>
      </tr>
      <tr>
        <td>พาธบันทึกเนื้อหาไฟล์:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'data_save_path');?>（保存方式为文件的时候生效）</td>
      </tr>
    </table>
    

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าการโต้ตอบโมดูล</b></th></tr></thead>
       <tr>
        <td width="200">ฟังก์ชันโหวตขึ้น/ลงบทความ:</td>
        <td><?php echo $manager->GetForm('article' , 'dingcai_open');?></td>
        <td width="200">โหวตต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('article' , 'dingcai_login');?></td>
        <td width="200">จำนวนโหวตต่อบทความต่อวัน:</td>
        <td><?php echo $manager->GetForm('article' , 'dingcai_count');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันให้คะแนนบทความ:</td>
        <td><?php echo $manager->GetForm('article' , 'score_open');?></td>
        <td>ให้คะแนนต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('article' , 'score_login');?></td>
        <td>จำนวนให้คะแนนต่อบทความต่อวัน:</td>
        <td><?php echo $manager->GetForm('article' , 'score_count');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันความคิดเห็นบทความ:</td>
        <td><?php echo $manager->GetForm('article' , 'replay_open');?></td>
        <td>ความคิดเห็นต้องเข้าสู่ระบบหรือไม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('article' , 'replay_login');?></td>
      </tr>
    </table>
    
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าค้นหาโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชันค้นหาบทความ:</td>
        <td><?php echo $manager->GetForm('article' , 'search_open');?></td>
        <td>ระยะห่างการค้นหาแต่ละครั้ง(วินาที):</td>
        <td><?php echo $manager->GetForm('article' , 'search_time');?></td>
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
	$('#data_save_path').css("width",'350px');
	$('#default_simg').css("width",'300px');
	$('#dingcai_count').css("width",'50px');
	$('#score_count').css("width",'50px');
});
</script>
