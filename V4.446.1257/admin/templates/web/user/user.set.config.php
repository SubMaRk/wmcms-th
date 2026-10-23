<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=user.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าพื้นฐานโมดูล</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชันเข้าสู่ระบบ:</td>
        <td><?php echo $manager->GetForm('user' , 'login_open');?></td>
        <td>หน้าที่ไปหลังเข้าสู่ระบบสำเร็จ:</td>
        <td><?php echo $manager->GetForm('user' , 'ajax_login');?></td>
        <td>บันทึกเข้าสู่ระบบ:</td>
        <td><?php echo $manager->GetForm('user' , 'login_log');?></td>
      </tr>
      <tr>
        <td>ฟังก์ชันสมัครสมาชิก:</td>
        <td><?php echo $manager->GetForm('user' , 'reg_open');?></td>
        <td width="200">สถานะสมัครสมาชิกเริ่มต้น:</td>
        <td><?php echo $manager->GetForm('user' , 'reg_status');?></td>
        <td width="200">ผูกบัญชีเข้าสู่ระบบบุคคลที่สาม:</td>
        <td><?php echo $manager->GetForm('user' , 'api_login_bind');?></td>
      </tr>
      <tr>
        <td>默认注册赠送的<?php echo $configArr['gold1_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'reg_gold1');?></td>
        <td>默认注册赠送的<?php echo $configArr['gold2_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'reg_gold2');?></td>
        <td>ค่าประสบการณ์แถมสมัครสมาชิกเริ่มต้น:</td>
        <td><?php echo $manager->GetForm('user' , 'reg_exp');?></td>
      </tr>
      <tr>
        <td>默认注册赠送的<?php echo $configArr['ticket_rec'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'reg_rec');?></td>
        <td>默认注册赠送的<?php echo $configArr['ticket_month'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'reg_month');?></td>
      </tr>
      <tr>
      	<td width="200">กว้างสูงรูปโปรไฟล์เริ่มต้น:</td>
        <td><?php echo $manager->GetForm('user' , 'head_width');?>*<?php echo $manager->GetForm('user' , 'head_height');?></td>
        <td>ประเภทอวาตาร์เริ่มต้น:</td>
        <td><?php echo $manager->GetForm('user' , 'user_head');?></td>
        <td>รูปโปรไฟล์เริ่มต้น:<a target="_blank" href="<?php echo $configArr['default_head']?>">点击查看</a></td>
        <td>
        	<?php echo $manager->GetForm('user' , 'default_head');?>
			<span class="upload" data-id="default_head" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg;*.png;*.gif;*.mpg" data-toggle="upload" data-icon="cloud-upload"></span>
		</td>
      </tr>
      <tr>
        <td>รูปโปรไฟล์ระบบ:<a target="_blank" href="<?php echo $configArr['msg_head']?>">点击查看</a></td>
        <td colspan="3">
        	<?php echo $manager->GetForm('user' , 'msg_head');?>
			<span class="upload" data-id="msg_head" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg;*.png;*.gif;*.mpg" data-toggle="upload" data-icon="cloud-upload"></span>
		</td>
      </tr>
      <tr>
        <td>ลายเซ็นผู้ใช้เริ่มต้น:</td>
        <td colspan="5"><?php echo $manager->GetForm('user' , 'reg_sign');?></td>
      </tr>
    </table>

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun?>bscicTable">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าคุณสมบัติพื้นฐาน</b></th></tr></thead>
      <tr>
        <td width="200">ชื่อค่าประสบการณ์:</td>
        <td><?php echo $manager->GetForm('user' , 'exp_name');?></td>
        <td width="200">ชื่อยอดเงิน：</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'money_name');?></td>
      </tr>
      <tr>
        <td>ชื่อเหรียญ 1:</td>
        <td><?php echo $manager->GetForm('user' , 'gold1_name');?></td>
        <td>หน่วยเหรียญ 1:</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'gold1_unit');?></td>
      </tr>
      <tr>
        <td>ชื่อเหรียญ 2:</td>
        <td><?php echo $manager->GetForm('user' , 'gold2_name');?></td>
        <td>หน่วยเหรียญ 2:</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'gold2_unit');?></td>
      </tr>
      <tr>
        <td>ชื่อโหวตแนะนำ:</td>
        <td><?php echo $manager->GetForm('user' , 'ticket_rec');?></td>
        <td>ชื่อโหวตรายเดือน:</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'ticket_month');?></td>
      </tr>
      <tr>
        <td>ของแถมเข้าสู่ระบบรายวัน<?php echo $configArr['gold1_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'login_gold1');?></td>
        <td>ของแถมเข้าสู่ระบบรายวัน<?php echo $configArr['gold2_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'login_gold2');?></td>
        <td>ค่าประสบการณ์แถมเข้าสู่ระบบรายวัน:</td>
        <td><?php echo $manager->GetForm('user' , 'login_exp');?></td>
      </tr>
      <tr>
        <td>ล้างโหวตแนะนำเมื่อเข้าสู่ระบบทุกวัน:</td>
        <td><?php echo $manager->GetForm('user' , 'login_clear_ticket');?></td>
        <td>ของแถมเข้าสู่ระบบรายวัน<?php echo $configArr['ticket_rec'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'login_rec');?></td>
        <td>ของแถมเข้าสู่ระบบรายวัน<?php echo $configArr['ticket_month'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'login_month');?></td>
      </tr>
    </table>
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun?>operateTable">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าฟังก์ชันเช็กอิน</b></th></tr></thead>
      <tr>
        <td width="200">ฟังก์ชันเช็กอิน:</td>
        <td width="200"><?php echo $manager->GetForm('user' , 'sign_open');?></td>
        <td width="200">ฟังก์ชันรางวัลเช็กอิน:</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'sign_reward');?></td>
      </tr>
      <tr>
        <td>签到赠送<?php echo $configArr['gold1_name'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'sign_gold1');?></td>
        <td>签到赠送<?php echo $configArr['gold2_name'];?>：</td>
        <td width="200"><?php echo $manager->GetForm('user' , 'sign_gold2');?></td>
        <td width="200">ค่าประสบการณ์แถมเช็กอิน:</td>
        <td><?php echo $manager->GetForm('user' , 'sign_exp');?></td>
      </tr>
      <tr>
        <td>签到赠送<?php echo $configArr['ticket_rec'];?>：</td>
        <td><?php echo $manager->GetForm('user' , 'sign_rec');?></td>
        <td>签到赠送<?php echo $configArr['ticket_month'];?>：</td>
        <td colspan="3"><?php echo $manager->GetForm('user' , 'sign_month');?></td>
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
