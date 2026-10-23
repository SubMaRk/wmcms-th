<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=bbs.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">พารามิเตอร์ตรวจสอบหน้าธีม：</td>
        <td><?php echo $manager->GetForm('bbs' , 'par_bbs');?></td>
        <td>พารามิเตอร์ตรวจสอบหน้าการตอบกลับ:</td>
        <td colspan="3"><?php echo $manager->GetForm('bbs' , 'par_relist');?></td>
      </tr>
      <tr>
        <td>เปิดการโพสต์:</td>
        <td><?php echo $manager->GetForm('bbs' , 'post_open');?></td>
        <td>เปิดการตอบกลับ:</td>
        <td colspan="3"><?php echo $manager->GetForm('bbs' , 'replay_open');?></td>
      </tr>
      <tr>
        <td>ไอคอนบอร์ดเริ่มต้น:</td>
        <td colspan="5"><?php echo $manager->GetForm('bbs' , 'default_ico');?></td>
      </tr>
      <tr>
        <td>ผู้แต่งดูได้หรือไม่：</td>
        <td><?php echo $manager->GetForm('bbs' , 'author_look');?></td>
        <td>ผู้แต่งแก้ไขได้หรือไม่：</td>
        <td><?php echo $manager->GetForm('bbs' , 'author_up');?></td>
        <td>ผู้แต่งลบได้หรือไม่：</td>
        <td><?php echo $manager->GetForm('bbs' , 'author_del');?></td>
      </tr>
      <tr>
        <td>สถานะเริ่มต้นโพสต์ผู้ใช้:</td>
        <td><?php echo $manager->GetForm('bbs' , 'user_post');?></td>
        <td>สถานะเริ่มต้นตอบกลับผู้ใช้:</td>
        <td><?php echo $manager->GetForm('bbs' , 'user_replay');?></td>
        <td>แก้ไขแล้วต้องตรวจสอบหรือไม่：</td>
        <td><?php echo $manager->GetForm('bbs' , 'up_status');?></td>
      </tr>
	
    </table>
    

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่ารางวัลโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">จำนวนโพสต์ต่อวัน:</td>
        <td><?php echo $manager->GetForm('bbs' , 'post_num');?> 0为不限制</td>
        <td>จำนวนครั้งแรกที่มีรางวัลต่อวัน:</td>
        <td colspan="3"><?php echo $manager->GetForm('bbs' , 'post_top');?> 0为关闭</td>
      </tr>
      <tr>
        <td>เหรียญรางวัลโพสต์ 1:</td>
        <td><?php echo $manager->GetForm('bbs' , 'post_gold1');?></td>
        <td>เหรียญรางวัลโพสต์ 2:</td>
        <td><?php echo $manager->GetForm('bbs' , 'post_gold2');?></td>
        <td>ประสบการณ์รางวัลจากการโพสต์:</td>
        <td><?php echo $manager->GetForm('bbs' , 'post_exp');?></td>
      </tr>
      <tr>
        <td width="200">จำนวนตอบกลับต่อวัน:</td>
        <td><?php echo $manager->GetForm('bbs' , 'everyday_count');?> 0为不限制</td>
        <td>จำนวนครั้งแรกที่มีรางวัลต่อวัน:</td>
        <td colspan="3"><?php echo $manager->GetForm('bbs' , 'reward_count');?> 0为关闭</td>
      </tr>
      <tr>
        <td>เหรียญรางวัลตอบกลับ 1:</td>
        <td><?php echo $manager->GetForm('bbs' , 'replay_gold1');?></td>
        <td>เหรียญรางวัลตอบกลับ 2:</td>
        <td><?php echo $manager->GetForm('bbs' , 'replay_gold2');?></td>
        <td>ประสบการณ์รางวัลจากการตอบกลับ:</td>
        <td><?php echo $manager->GetForm('bbs' , 'replay_exp');?></td>
      </tr>
    </table>

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าค้นหาโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชันค้นหา:</td>
        <td width="400"><?php echo $manager->GetForm('bbs' , 'search_open');?></td>
        <td width="200">ระยะห่างการค้นหาแต่ละครั้ง(วินาที):</td>
        <td><?php echo $manager->GetForm('bbs' , 'search_time');?></td>
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
	$('#dingcai_count').css("width",'50px');
	$('#score_count').css("width",'50px');
	$('#search_time').css("width",'50px');
	$('#post_num').css("width",'50px');
	$('#post_top').css("width",'50px');
	$('#post_gold1').css("width",'50px');
	$('#post_gold2').css("width",'50px');
	$('#post_exp').css("width",'50px');
	$('#everyday_count').css("width",'50px');
	$('#reward_count').css("width",'50px');
	$('#replay_gold1').css("width",'50px');
	$('#replay_gold2').css("width",'50px');
	$('#replay_exp').css("width",'50px');
});
</script>
