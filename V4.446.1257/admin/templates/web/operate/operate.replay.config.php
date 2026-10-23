<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>


<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=operate.replay.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">เปิดความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_open');?></td>
        <td>ตั้งค่าโมดูลความคิดเห็นรวม:</td>
        <td><?php echo $manager->GetForm('replay' , 'unify');?></td>
        <td>ความคิดเห็นต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_login');?></td>
      </tr>
      <tr>
        <td>สถานะความคิดเห็นเริ่มต้น:</td>
        <td><?php echo $manager->GetForm('replay' , 'status');?></td>
        <td>ช่วงเวลาระหว่างสองความคิดเห็น：</td>
        <td><?php echo $manager->GetForm('replay' , 'top_time');?></td>
        <td>จำกัดจำนวนความคิดเห็นต่อวัน:</td>
        <td><?php echo $manager->GetForm('replay' , 'everyday_count');?></td>
      </tr>
      <tr>
        <td>โหวตความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('replay' , 'dingcai_open');?></td>
        <td>โหวตต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('replay' , 'dingcai_login');?></td>
        <td>จำนวนโหวตขึ้น/ลงต่อความคิดเห็นต่อวัน:</td>
        <td><?php echo $manager->GetForm('replay' , 'dingcai_count');?></td>
      </tr>
      <tr>
        <td width="200">ชื่อเล่นผู้ใช้เริ่มต้น:</td>
        <td colspan="5"><?php echo $manager->GetForm('replay' , 'nickname');?></td>
      </tr>
      <tr>
        <td width="200">ชื่อชั้น:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_floor_name');?></td>
        <td width="200">ชื่อเล่นชั้น:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_floor_nickname');?></td>
        <td colspan="2">ชื่อเล่นชั้นเริ่มต้น บรรทัดละหนึ่งชื่อ ไม่จำกัดจำนวนชั้น ที่เกินจะแสดงด้วยชื่อชั้น</td>
      </tr>
    </table>

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" >
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่ารางวัลความคิดเห็น</b></th></tr></thead>
      <tr>
        <td width="200">จำนวนครั้งแรกที่มีรางวัลต่อวัน:</td>
        <td colspan="5"><?php echo $manager->GetForm('replay' , 'reward_count');?></td>
      </tr>
      <tr>
        <td>รางวัล<?php echo $configArr['gold1_name'];?>：</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_gold1');?></td>
        <td>รางวัล<?php echo $configArr['gold2_name'];?>：</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_gold2');?></td>
        <td>รางวัล<?php echo $configArr['exp_name'];?>：</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_exp');?></td>
      </tr>
    </table>
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าความคิดเห็นทั่วไป JS/</b></th></tr></thead>
      <tr>
        <td width="200">หัวข้อกล่องความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('replay' , 'boxname');?></td>
        <td>ข้อความเมื่อไม่มีข้อมูล:</td>
        <td><?php echo $manager->GetForm('replay' , 'no_data');?></td>
        <td>คำแนะนำช่องกรอก:</td>
        <td><?php echo $manager->GetForm('replay' , 'input');?></td>
      </tr>
      <tr>
		<td>โหมดแสดงรายการความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_type');?></td>
        <td>แสดงความคิดเห็นยอดนิยมหรือไม่:</td>
        <td><?php echo $manager->GetForm('replay' , 'hot');?></td>
        <td>โหวตขึ้นกี่ครั้งจึงเป็นความคิดเห็นยอดนิยม:</td>
        <td><?php echo $manager->GetForm('replay' , 'hot_display');?></td>
      </tr>
      <tr>
        <td>แสดงความคิดเห็นยอดนิยมกี่รายการ:</td>
        <td><?php echo $manager->GetForm('replay' , 'hot_count');?></td>
        <td>แสดงกี่รายการต่อหน้า:</td>
        <td><?php echo $manager->GetForm('replay' , 'list_limit');?></td>
        <td>จำนวนเลขหน้าแบ่งหน้าที่แสดง:</td>
        <td><?php echo $manager->GetForm('replay' , 'page_count');?></td>
      </tr>
    </table>
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าตอบกลับความคิดเห็นทั่วไป JS/[มีผลในโหมดเจ้าของกระทู้]</b></th></tr></thead>
      <tr>
        <td width="200">แสดงตอบกลับกี่รายการต่อความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_replay_number');?></td>
        <td>แสดงตอบกลับกี่รายการต่อหน้า:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_replay_page');?></td>
        <td>วิธีเรียงตอบกลับความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('replay' , 'replay_replay_order');?></td>
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
	$('#reg_sign').css("width",'500px');
	$('#reg_sign').css("height",'100px');
	$('#replay_floor_nickname').css("height",'100px');
	$('.bjui-pageContent').find('table').find('input').css("width",'80px');
});
</script>
