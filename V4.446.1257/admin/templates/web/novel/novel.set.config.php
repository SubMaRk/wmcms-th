<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=novel.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td>ปกเริ่มต้นนิยาย:</td>
        <td colspan="3"><?php echo $manager->GetForm('novel' , 'cover');?></td>
      </tr>
      <tr>
        <td>พารามิเตอร์ตรวจสอบหน้านิยาย:</td>
        <td><?php echo $manager->GetForm('novel' , 'par_info');?></td>
        <td>พารามิเตอร์ตรวจสอบหน้าความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('novel' , 'par_replay');?></td>
      </tr>
      <tr>
        <td>พารามิเตอร์ตรวจสอบหน้าสารบัญ:</td>
        <td><?php echo $manager->GetForm('novel' , 'par_menu');?></td>
        <td>พารามิเตอร์ตรวจสอบหน้าอ่าน:</td>
        <td><?php echo $manager->GetForm('novel' , 'par_read');?></td>
      </tr>
      <tr><td colspan="4" style="color:red"><b>ห้ามเปลี่ยนพาธบันทึกกลางทาง มิฉะนั้นจะอ่านเนื้อหาตอนนิยายไม่ได้</b></td></tr>
      <tr>
        <td width="200">สตริงเข้ารหัสกำหนดเองของชื่อไฟล์นิยาย:</td>
        <td colspan="3">
        	<?php echo $manager->GetForm('novel' , 'novel_en_str');?> 
        	<span style="color:red">ค่าเริ่มต้นโปรดเว้นว่าง</span>
        </td>
      </tr>
      <tr>
        <td width="200">พาธบันทึกไฟล์นิยาย:</td>
        <td><?php echo $manager->GetForm('novel' , 'novel_save');?></td>
        <td width="200">พาธบันทึกไฟล์ตอน:</td>
        <td><?php echo $manager->GetForm('novel' , 'chapter_save');?></td>
      </tr>
      <tr>
        <td width="200">พาธบันทึกเสียงอ่านนิยาย:</td>
        <td><?php echo $manager->GetForm('novel' , 'novel_mp3_save');?></td>
        <td width="200">พาธบันทึกเสียงฟังตอน:</td>
        <td><?php echo $manager->GetForm('novel' , 'chapter_mp3_save');?></td>
      </tr>
      <tr>
        <td>สถานะการเผยแพร่นิยายจากหลังบ้าน:</td>
        <td><?php echo $manager->GetForm('novel' , 'admin_novel_add');?></td>
        <td>สถานะเริ่มต้นของตอนที่เผยแพร่:</td>
        <td><?php echo $manager->GetForm('novel' , 'admin_chapter_add');?></td>
      </tr>
      <tr>
        <td>ประเภทเริ่มต้นการเผยแพร่นิยาย:</td>
        <td><?php echo $manager->GetForm('novel' , 'type');?></td>
        <td>สร้าง HTML ตอนอัตโนมัติ:</td>
        <td><?php echo $manager->GetForm('novel' , 'auto_create_html');?></td>
      </tr>
      <tr>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" style="margin-top: -40px">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าตอนนิยาย</b></th></tr></thead>
      <tr>
        <td width="200">โหมดเทียบตอนที่คล้ายกัน:</td>
        <td><?php echo $manager->GetForm('novel' , 'chapter_compare');?></td>
        <td width="200">ความคล้ายเนื้อหา (ตัวเลข 0-100):</td>
        <td><?php echo $manager->GetForm('novel' , 'chapter_compare_number');?></td>
      </tr>
      <tr>
        <td width="200"><span style="color:red">โหมดนำเข้าข้อมูล (ห้ามแก้ระหว่างทาง)</span>：</td>
        <td><?php echo $manager->GetForm('novel' , 'data_type');?></td>
        <td width="200">ตอนต้องเข้าสู่ระบบเพื่ออ่านหรือไม่โดยค่าเริ่มต้น:</td>
        <td><?php echo $manager->GetForm('novel' , 'chapter_isvip');?></td>
      </tr>
      <tr>
        <td>ต่ำกว่ากี่คำจึงไม่คิดเงิน：</td>
        <td><?php echo $manager->GetForm('novel' , 'buy_wordnumber');?></td>
        <td>ประเภทเหรียญที่ใช้สมัครรับตอน:</td>
        <td><?php echo $manager->GetForm('novel' , 'buy_gold_type');?></td>
      </tr>
      <tr>
        <td>วิธีแจ้งเตือนยังไม่สมัครรับบนหน้าอ่าน:</td>
        <td><?php echo $manager->GetForm('novel' , 'read_sub_prompt');?></td>
        <td>เปิดให้ดาวน์โหลดหรือไม่:</td>
        <td><?php echo $manager->GetForm('novel' , 'down_open');?></td>
      </tr>
      <tr>
        <td>ชื่อตอนเริ่มต้นของนิยายใหม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('novel' , 'new_cname');?></td>
      </tr>
      <tr>
        <td>ข้อมูลหัวไฟล์ TXT นิยายเมื่อสร้างครั้งแรก:<br/><span style="color:red">เว้นว่างหมายถึงไม่แทรกข้อความกำหนดเอง</span></td>
        <td colspan="3"><?php echo $manager->GetForm('novel' , 'novel_head');?></td>
      </tr>
      <tr>
        <td>เทมเพลตเริ่มต้น TXT ตอนใหม่:<br/><span style="color:red">เว้นว่างหมายถึงไม่แทรกข้อความกำหนดเอง</span></td>
        <td colspan="3"><?php echo $manager->GetForm('novel' , 'chapter_start');?></td>
      </tr>
      <tr>
        <td>เทมเพลตสิ้นสุด TXT ตอนใหม่:<br/><span style="color:red">เว้นว่างหมายถึงไม่แทรกข้อความกำหนดเอง</span></td>
        <td colspan="3"><?php echo $manager->GetForm('novel' , 'chapter_end');?></td>
      </tr>
    </table>
    
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun.$type?>Opera">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าการโต้ตอบโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชันโหวต:</td>
        <td><?php echo $manager->GetForm('novel' , 'dingcai_open');?></td>
        <td width="200">โหวตต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('novel' , 'dingcai_login');?></td>
        <td width="200">จำนวนโหวตต่อนิยายต่อวัน:</td>
        <td><?php echo $manager->GetForm('novel' , 'dingcai_count');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันให้คะแนน:</td>
        <td><?php echo $manager->GetForm('novel' , 'score_open');?></td>
        <td>ให้คะแนนต้องเข้าสู่ระบบหรือไม่:</td>
        <td><?php echo $manager->GetForm('novel' , 'score_login');?></td>
        <td>จำนวนให้คะแนนต่อนิยายต่อวัน:</td>
        <td><?php echo $manager->GetForm('novel' , 'score_count');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันความคิดเห็น:</td>
        <td><?php echo $manager->GetForm('novel' , 'replay_open');?></td>
        <td>ความคิดเห็นต้องเข้าสู่ระบบหรือไม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('novel' , 'replay_login');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันรายการโปรด:</td>
        <td><?php echo $manager->GetForm('novel' , 'coll_open');?></td>
        <td>ฟังก์ชันชั้นหนังสือ：</td>
        <td><?php echo $manager->GetForm('novel' , 'shelf_open');?></td>
        <td>บันทึกการอ่าน:</td>
        <td><?php echo $manager->GetForm('novel' , 'read_open');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันแนะนำ:</td>
        <td><?php echo $manager->GetForm('novel' , 'rec_open');?></td>
        <td>ฟังก์ชันมอบของขวัญ:</td>
        <td><?php echo $manager->GetForm('novel' , 'give_open');?></td>
        <td>ฟังก์ชันให้เหรียญรางวัล:</td>
        <td><?php echo $manager->GetForm('novel' , 'reward_open');?></td>
      </tr>
      <tr>
        <td colspan="3">
        	ใช้จ่าย <?php echo $manager->GetForm('novel' , 'fans_exp_gold1');?> <?php echo $userConfig['gold1_name'];?>增加1点粉丝经验值
        </td>
        <td colspan="3">
        	ใช้จ่าย <?php echo $manager->GetForm('novel' , 'fans_exp_gold2');?> <?php echo $userConfig['gold2_name'];?>增加1点粉丝经验值
        </td>
      </tr>
      <tr>
        <td colspan="3">
        	ใช้จ่าย <?php echo $manager->GetForm('novel' , 'cons_gold1');?> <?php echo $userConfig['gold1_name'];?>
        	可以获得 <?php echo $manager->GetForm('novel' , 'cons_gold1_month');?> 张<?php echo $userConfig['ticket_month'];?>和
        	<?php echo $manager->GetForm('novel' , 'cons_gold1_rec');?> 张<?php echo $userConfig['ticket_rec'];?>
        </td>

        <td colspan="3">
        	ใช้จ่าย <?php echo $manager->GetForm('novel' , 'cons_gold2');?> <?php echo $userConfig['gold2_name'];?>
        	可以获得 <?php echo $manager->GetForm('novel' , 'cons_gold2_month');?> 张<?php echo $userConfig['ticket_month'];?>和
        	<?php echo $manager->GetForm('novel' , 'cons_gold2_rec');?> 张<?php echo $userConfig['ticket_rec'];?>
        </td>
      </tr>
    </table>

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าค้นหาโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชันค้นหา:</td>
        <td><?php echo $manager->GetForm('novel' , 'search_open');?></td>
        <td>ระยะห่างการค้นหาแต่ละครั้ง(วินาที):</td>
        <td><?php echo $manager->GetForm('novel' , 'search_time');?></td>
      </tr>
      <tr>
        <td width="200">ถ้ามีผลลัพธ์เดียวให้ข้ามไปทันทีหรือไม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('novel' , 'search_jump');?></td>
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
	$('#novel_head').css("width",'500px');
	$('#novel_head').css("height",'100px');
	$('#chapter_start').css("width",'500px');
	$('#chapter_start').css("height",'100px');
	$('#chapter_end').css("width",'500px');
	$('#chapter_end').css("height",'100px');
	$('#buy_wordnumber').css("width",'50px');
	$('#novel_save').css("width",'300px');
	$('#chapter_save').css("width",'300px');
	$('#novel_mp3_save').css("width",'300px');
	$('#chapter_mp3_save').css("width",'300px');
	$('#cover').css("width",'300px');
	$('#novel_en_str').css("width",'300px');
	$('#<?php echo $cFun.$type?>Opera input').css("width",'50px');
});
</script>
