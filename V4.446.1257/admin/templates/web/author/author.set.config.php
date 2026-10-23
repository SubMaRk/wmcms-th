<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=author.config&t=edit" method="post" data-toggle="validate">
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td>เปิดให้สมัครเป็นผู้แต่งเองที่หน้าเว็บ:</td>
        <td><?php echo $manager->GetForm('author' , 'apply_author_open');?></td>
        <td>สถานะเริ่มต้นสำหรับการสมัครผู้แต่ง：</td>
        <td colspan="3"><?php echo $manager->GetForm('author' , 'apply_author_status');?></td>
      </tr>
      <tr>
        <td>เรื่องย่อเริ่มต้นสำหรับการสมัครผู้แต่ง：</td>
        <td><?php echo $manager->GetForm('author' , 'author_default_info');?></td>
        <td>ประกาศเริ่มต้นสำหรับการสมัครผู้แต่ง：</td>
        <td colspan="3"><?php echo $manager->GetForm('author' , 'author_default_notice');?></td>
      </tr>
      <tr>
        <td>ข้อความเมื่อตรวจสอบผ่าน:</td>
        <td><?php echo $manager->GetForm('author' , 'author_apply_1');?></td>
        <td>ข้อความเมื่อปฏิเสธ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_apply_2');?></td>
        <td>ข้อความเมื่อเปลี่ยนเป็นยังไม่ตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_apply_0');?></td>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun.$type?>Opera">
      <thead><tr><th colspan="6" style="text-align:left;"><b>โหมดรายได้จากการสนับสนุนด้วยไอเทมและการสมัครรับของผู้แต่ง</b></th></tr></thead>
      <tr>
        <td width="180">โหมดรายได้จากการสนับสนุนด้วยไอเทมและการสมัครรับของผู้แต่ง</td>
        <td>
        	<?php echo $manager->GetForm('author' , 'author_income_type');?>
        </td>
      </tr>
      <tr>
        <td width="160">รายได้โอนเข้าบัญชีผู้แต่งโดยตรง</td>
        <td>โหมดนี้ใช้กับรายได้จากการให้ของขวัญ ไอเท็ม เหรียญ และการสมัครรับ ฯลฯ<b style="color:red">โอนเข้าบัญชีเหรียญที่เกี่ยวข้องของผู้แต่งโดยตรง</b></td>
      </tr>
      <tr>
        <td width="160">โหมดชำระเงินด้วยตนเอง</td>
        <td>โหมดนี้จะนำรายได้จากการให้ของขวัญ ไอเท็ม เหรียญ และการสมัครรับ ฯลฯ เข้าสู่รายงานรอชำระบัญชีก่อน สามารถยืนยันโอนบางส่วนด้วยตนเองในหลังบ้านแล้วจึงชำระบัญชีแบบกลุ่ม<b style="color:red">หลังชำระบัญชี เงินจะไม่เข้าบัญชีผู้แต่ง</b>。
        </td>
      </tr>
      <thead><tr><th colspan="6" style="text-align:left;"><b>โหมดคำขอการเงินสถิติการขาย</b></th></tr></thead>
      <tr>
        <td width="180">โหมดคำขอการเงินสถิติการขาย</td>
        <td>
        	<?php echo $manager->GetForm('author' , 'author_finance_apply_type');?>
        </td>
      </tr>
      <tr>
        <td width="160">หลังจัดการคำขอการเงินแล้ว เงินจะโอนเข้าบัญชีผู้แต่ง</td>
        <td>หลังยื่นคำขอการเงินในหน้าสถิติชำระบัญชีนิยายและอนุมัติแล้ว เงินจะ<b style="color:red">โอนเข้าบัญชีเหรียญที่เกี่ยวข้องของผู้แต่งโดยตรง</b></td>
      </tr>
      <tr>
        <td width="160">โหมดชำระเงินด้วยตนเอง</td>
        <td>หลังยื่นคำขอการเงินในหน้าสถิติการชำระบัญชีนิยายและได้รับการอนุมัติ<b style="color:red">เงินจะไม่เข้าบัญชีผู้แต่ง</b>. จะส่งข้อความแจ้งการอนุมัติคำขอทางการเงินให้ผู้แต่งที่เกี่ยวข้องเท่านั้น
        </td>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun.$type?>Opera">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าการโต้ตอบโมดูล</b></th></tr></thead>
      <tr>
        <td width="160">ของแถมเข้าสู่ระบบรายวัน </td>
        <td>
        	<?php echo $manager->GetForm('author' , 'login_exp');?> 点作者经验值
        </td>
        <td width="160">一张<?php echo $userConfig['ticket_rec'];?>增加 </td>
        <td>
        	<?php echo $manager->GetForm('author' , 'income_rec');?> 点作者经验值
        </td>
        <td width="160">一张<?php echo $userConfig['ticket_month'];?>增加 </td>
        <td>
        	<?php echo $manager->GetForm('author' , 'income_month');?> 点作者经验值
        </td>
      </tr>
      <tr>
        <td colspan="3">
        	1 แต้มค่าประสบการณ์ผู้แต่งต้องใช้รายได้ <?php echo $manager->GetForm('author' , 'income_gold1');?> <?php echo $userConfig['gold1_name'];?>
        </td>
        <td colspan="3">
        	1 แต้มค่าประสบการณ์ผู้แต่งต้องใช้รายได้ <?php echo $manager->GetForm('author' , 'income_gold2');?> <?php echo $userConfig['gold2_name'];?>
        </td>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่านิยายต้นฉบับ</b></th></tr></thead>
      <tr>
        <td>วิธีตรวจสอบนิยายใหม่:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_createnovel');?></td>
        <td>แก้ไขนิยายต้องตรวจสอบหรือไม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('author' , 'author_novel_editnovel');?></td>
      </tr>
      <tr>
        <td>วิธีตรวจสอบตอนใหม่:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_createchapter');?></td>
        <td>แก้ไขตอนต้องตรวจสอบหรือไม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('author' , 'author_novel_editchapter');?></td>
      </tr>
      <tr>
        <td>วิธีตรวจสอบการอัปโหลดปก:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_uploadcover');?></td>
        <td>ความกว้าง/สูงปกนิยาย:</td>
        <td colspan="3">
        	<?php echo $manager->GetForm('author' , 'author_novel_coverwidth');?> *
        	<?php echo $manager->GetForm('author' , 'author_novel_coverheight');?> 像素 , 前台上传的บล็อก面宽和高不能超过设置的数值
        </td>
      </tr>
      <tr>
        <td>ข้อความเมื่อปกตรวจสอบผ่าน:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_cover_1');?></td>
        <td>ข้อความเมื่อปกถูกปฏิเสธ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_cover_2');?></td>
        <td>ข้อความเมื่อปกเปลี่ยนเป็นยังไม่ตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_cover_0');?></td>
      </tr>
      <tr>
        <td>แก้ไขนิยายผ่าน:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_editnovel_1');?></td>
        <td>แก้ไขนิยายถูกปฏิเสธการตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_editnovel_2');?></td>
        <td>แก้ไขนิยายยังไม่ตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_editnovel_0');?></td>
      </tr>
      <tr>
        <td>ข้อความเมื่อตอนผ่านการตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_editchapter_1');?></td>
        <td>ข้อความเมื่อตอนถูกปฏิเสธการตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_editchapter_2');?></td>
        <td>ข้อความเมื่อตอนเปลี่ยนเป็นยังไม่ตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_novel_editchapter_0');?></td>
      </tr>
    </table>
    
    
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าส่งบทความ</b></th></tr></thead>
      <tr>
        <td>สถานะฟังก์ชันส่งบทความ:</td>
        <td colspan="5"><?php echo $manager->GetForm('author' , 'author_article_open');?></td>
      </tr>
      <tr>
        <td>วิธีตรวจสอบบทความที่สร้าง:</td>
        <td><?php echo $manager->GetForm('author' , 'author_article_createarticle');?></td>
        <td>แก้ไขบทความต้องตรวจสอบหรือไม่:</td>
        <td colspan="3"><?php echo $manager->GetForm('author' , 'author_article_editarticle');?></td>
      </tr>
      <tr>
        <td>แก้ไขบทความถูกปฏิเสธการตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_article_editarticle_1');?></td>
        <td>แก้ไขบทความยังไม่ตรวจสอบ:</td>
        <td><?php echo $manager->GetForm('author' , 'author_article_editarticle_2');?></td>
        <td>แก้ไขบทความผ่าน:</td>
        <td><?php echo $manager->GetForm('author' , 'author_article_editarticle_0');?></td>
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
	$('#author_novel_coverwidth').css("width",'80px');
	$('#author_novel_coverheight').css("width",'80px');
	
	$('#author_apply_0').attr("style",'width:220px;height:80px');
	$('#author_apply_1').attr("style",'width:220px;height:80px');
	$('#author_apply_2').attr("style",'width:220px;height:80px');
	
	$('#author_novel_cover_0').attr("style",'width:220px;height:80px');
	$('#author_novel_cover_1').attr("style",'width:220px;height:80px');
	$('#author_novel_cover_2').attr("style",'width:220px;height:80px');

	$('#author_novel_editnovel_0').attr("style",'width:220px;height:80px');
	$('#author_novel_editnovel_1').attr("style",'width:220px;height:80px');
	$('#author_novel_editnovel_2').attr("style",'width:220px;height:80px');

	$('#author_novel_editchapter_0').attr("style",'width:220px;height:80px');
	$('#author_novel_editchapter_1').attr("style",'width:220px;height:80px');
	$('#author_novel_editchapter_2').attr("style",'width:220px;height:80px');

	$('#author_article_edit_0').attr("style",'width:220px;height:80px');
	$('#author_article_edit_1').attr("style",'width:220px;height:80px');
	$('#author_article_edit_2').attr("style",'width:220px;height:80px');

	$('#<?php echo $cFun.$type?>Opera input').css("width",'50px');
});
</script>
