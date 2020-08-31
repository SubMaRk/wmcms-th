<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=user.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าโมดูลทั่วไป</b></th></tr></thead>
      <tr>
        <td>ฟังก์ชั่นลงทะเบียน : </td>
        <td><?php echo $manager->GetForm('user' , 'reg_open');?></td>
        <td width="200">ลงทะเบียนทั่วไป : </td>
        <td><?php echo $manager->GetForm('user' , 'reg_status');?></td>
        <td width="200">เชื่อมโยงบัญชีภายนอก : </td>
        <td><?php echo $manager->GetForm('user' , 'api_login_bind');?></td>
      </tr>
      <tr>
        <td>รางวัลลงทะเบียน<?php echo $configArr['gold1_name'];?> : </td>
        <td><?php echo $manager->GetForm('user' , 'reg_gold1');?></td>
        <td>รางวัลลงทะเบียน : <?php echo $configArr['gold2_name'];?></td>
        <td><?php echo $manager->GetForm('user' , 'reg_gold2');?></td>
        <td>รางวัลประสบการณ์ลงทะเบียน : </td>
        <td><?php echo $manager->GetForm('user' , 'reg_exp');?></td>
      </tr>
      <tr>
        <td>รางวัลลงทะเบียน : <?php echo $configArr['ticket_rec'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'reg_rec');?></td>
        <td>รางวัลลงทะเบียน : <?php echo $configArr['ticket_month'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'reg_month');?></td>
      </tr>
      <tr>
      	<td width="200">ความกว้างรูปโปรไฟล์ : </td>
        <td><?php echo $manager->GetForm('user' , 'head_width');?>*<?php echo $manager->GetForm('user' , 'head_height');?></td>
        <td>ประเภทค่าเริ่มต้นรูปโปรไฟล์ : </td>
        <td><?php echo $manager->GetForm('user' , 'user_head');?></td>
        <td>ค่าเริ่มต้นรูปโปรไฟล์ : <a target="_blank" href="<?php echo $configArr['default_head']?>">คลิ๊กเพื่อดู</a></td>
        <td>
        	<?php echo $manager->GetForm('user' , 'default_head');?>
			<span class="upload" data-id="default_head" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg;*.png;*.gif;*.mpg" data-toggle="upload" data-icon="cloud-upload"></span>
		</td>
      </tr>
      <tr>
        <td width="200">ฟังก์ชั่นเข้าสู่ระบบ : </td>
        <td><?php echo $manager->GetForm('user' , 'login_open');?></td>
        <td>หลังเข้าสู่ระบบแล้ว ให้กระโดดไปที่ : </td>
        <td><?php echo $manager->GetForm('user' , 'ajax_login');?></td>
        <td>บันทึกเข้าสู่ระบบ : </td>
        <td><?php echo $manager->GetForm('user' , 'login_log');?></td>
      </tr>
      <tr>
        <td>โปรไฟล์ระบบ : <a target="_blank" href="<?php echo $configArr['msg_head']?>">คลิ๊กเพื่อดู</a></td>
        <td colspan="3">
        	<?php echo $manager->GetForm('user' , 'msg_head');?>
			<span class="upload" data-id="msg_head" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg;*.png;*.gif;*.mpg" data-toggle="upload" data-icon="cloud-upload"></span>
		</td>
      </tr>
      <tr>
        <td>ค่าเริ่มต้นลายเซ็นผู้ใช้ : </td>
        <td colspan="5"><?php echo $manager->GetForm('user' , 'reg_sign');?></td>
      </tr>
    </table>

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun?>bscicTable">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าคุณสมบัติทั่วไป</b></th></tr></thead>
      <tr>
        <td width="200">ชื่อประสบการณ์ : </td>
        <td><?php echo $manager->GetForm('user' , 'exp_name');?></td>
        <td width="200">ชื่อยอดคงเหลือ : </td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'money_name');?></td>
      </tr>
      <tr>
        <td>ชื่อเหรียญ 1 : </td>
        <td><?php echo $manager->GetForm('user' , 'gold1_name');?></td>
        <td>หน่วยเหรียญ 1 : </td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'gold1_unit');?></td>
      </tr>
      <tr>
        <td>ชื่อเหรียญ 2 : </td>
        <td><?php echo $manager->GetForm('user' , 'gold2_name');?></td>
        <td>หน่วยเหรียญ 2 : </td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'gold2_unit');?></td>
      </tr>
      <tr>
        <td>ชื่อตั๋วแนะนำ : </td>
        <td><?php echo $manager->GetForm('user' , 'ticket_rec');?></td>
        <td>ชื่อตั๋วรายเดือน : </td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'ticket_month');?></td>
      </tr>
      <tr>
        <td>รางวัลเข้าสู่ระบบประจำวัน<?php echo $configArr['gold1_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'login_gold1');?></td>
        <td>รางวัลเข้าสู่ระบบประจำวัน<?php echo $configArr['gold2_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'login_gold2');?></td>
        <td>ประสบการณ์เข้าสู่ระบบประจำวัน : </td>
        <td><?php echo $manager->GetForm('user' , 'login_exp');?></td>
      </tr>
      <tr>
        <td>รางวัลเข้าสู่ระบบประจำวัน<?php echo $configArr['ticket_rec'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'login_rec');?></td>
        <td>รางวัลเข้าสู่ระบบประจำวัน<?php echo $configArr['ticket_month'];?>：</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'login_month');?></td>
      </tr>
    </table>
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun?>operateTable">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าฟังก์ชั่นเช็คชื่อ</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชั่นเช็คชื่อ : </td>
        <td width="200"><?php echo $manager->GetForm('user' , 'sign_open');?></td>
        <td width="200">ฟังก์ชั่นรางวัลเช็คชื่อ : </td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'sign_reward');?></td>
      </tr>
      <tr>
        <td>รางวัลเช็คชื่อ<?php echo $configArr['gold1_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'sign_gold1');?></td>
        <td>รางวัลเช็คชื่อ<?php echo $configArr['gold2_name'];?>：</td>
        <td width="200"><?php echo $manager->GetForm('user' , 'sign_gold2');?></td>
        <td width="200">ประสบการณ์เช็คชื่อ : </td>
        <td><?php echo $manager->GetForm('user' , 'sign_exp');?></td>
      </tr>
      <tr>
        <td>รางวัลเช็คชื่อ<?php echo $configArr['ticket_rec'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'sign_rec');?></td>
        <td>รางวัลเช็คชื่อ<?php echo $configArr['ticket_month'];?>：</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'sign_month');?></td>
      </tr>
    </table>
  </form>
</div>



<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">จัดเก็บ</button></li>
    </ul>
</div>




<script>
//上传图片
function <?php echo $cFun;?>upload_success(file,json,$element){
	var json = $.parseJSON(json);
	if ( json.statusCode == 300){
		$($element).bjuiajax("ajaxDone",json);// 显示处理结果
	}else{
		var id = $($element).data('id');
		var val = json.data.path.replace('../',"/");
		$("#"+id).val(val);
	}
}

$(document).ready(function(){
	$('#reg_sign').css("width",'500px');
	$('#reg_sign').css("height",'100px');
	$('#head_width').css("width",'50px');
	$('#head_height').css("width",'50px');
	$('#reg_gold1').css("width",'50px');
	$('#reg_gold2').css("width",'50px');
	$('#reg_exp').css("width",'50px');
	$('#reg_rec').css("width",'50px');
	$('#reg_month').css("width",'50px');
	$('#<?php echo $cFun?>bscicTable input').css("width",'80px');
	$('#<?php echo $cFun?>operateTable input').css("width",'80px');
	$('#<?php echo $cFun?>Finance input').css("width",'80px');
	$('#card_buy_url').css("width",'500px');
});
</script>
