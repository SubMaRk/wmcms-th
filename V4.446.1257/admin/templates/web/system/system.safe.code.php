<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.safe.code&t=config" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าพื้นฐานรหัสยืนยัน</b></th></tr></thead>
      <thead><tr><th colspan="6" style="text-align:left;"><b>การยืนยันตัวตนสองขั้นตอน (TOTP)</b></th></tr></thead>
      <tr>
        <td width="140">แอป Authenticator</td>
        <td colspan="5">
          <button type="button" class="btn btn-green" onclick="wmTwofaStart()">สร้างคีย์ใหม่</button>
          <input type="text" id="wmTwofaCode" size="8" placeholder="รหัส 6 หลัก" style="width:120px;">
          <button type="button" class="btn btn-blue" onclick="wmTwofaEnable()">เปิดใช้งาน</button>
          <button type="button" class="btn btn-red" onclick="wmTwofaDisable()">ปิดใช้งาน</button>
          <div id="wmTwofaInfo" style="margin-top:6px;color:#666;"></div>
        </td>
      </tr>
      <script>
      function wmTwofaAjax(t, code){
        jQuery.post('index.php?a=yes&c=system.safe.twofa&t='+t, {code: code||''}, function(res){
          var info = document.getElementById('wmTwofaInfo');
          if(res.statusCode == 200){
            if(res.data && res.data.uri){
              info.innerHTML = 'เพิ่มในแอปด้วยคีย์นี้: <b>'+res.data.secret+'</b><br>หรือลิงก์: <span style="word-break:break-all">'+res.data.uri+'</span>';
            }else{
              info.innerHTML = res.message;
            }
          }else{
            info.innerHTML = res.message;
            alert(res.message);
          }
        }, 'json');
      }
      function wmTwofaStart(){ wmTwofaAjax('start'); }
      function wmTwofaEnable(){ wmTwofaAjax('enable', document.getElementById('wmTwofaCode').value); }
      function wmTwofaDisable(){ wmTwofaAjax('disable', document.getElementById('wmTwofaCode').value); }
      </script>

      <tr>
        <td width="140">รหัสยืนยันเข้าสู่ระบบหลังบ้าน</td>
        <td width="300"><?php echo $manager->GetForm('code' , 'code_admin_login');?></td>
        <td width="140">ประเภทรหัสยืนยัน</td>
        <td width="170"><?php echo $manager->GetForm('code' , 'code_admin_login_type');?></td>
        <td width="140">บล็อกการเข้าสู่ระบบ</td>
        <td>
        	ผิดเกิน <?php echo $manager->GetForm('code' , 'admin_login_error_number');?> ครั้ง, 
        	บล็อก <?php echo $manager->GetForm('code' , 'admin_login_error_time');?> นาที
        </td>
      </tr>
      <tr>
        <td>รหัสยืนยันสมัครสมาชิก</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_reg');?></td>
        <td>ประเภทรหัสยืนยัน</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_user_reg_type');?></td>
      </tr>
      <tr>
        <td>รหัสยืนยันเข้าสู่ระบบ</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_login');?></td>
        <td>ประเภทรหัสยืนยัน</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_login_type');?></td>
        <td width="140">บล็อกการเข้าสู่ระบบ</td>
        <td>
        	ผิดเกิน <?php echo $manager->GetForm('code' , 'user_login_error_number');?> ครั้ง, 
        	บล็อก <?php echo $manager->GetForm('code' , 'user_login_error_time');?> นาที
        </td>
      </tr>
      <tr>
        <td>รหัสยืนยันแก้ไขรหัสผ่าน</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_uppsw');?></td>
        <td>ประเภทรหัสยืนยัน</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_user_uppsw_type');?></td>
      </tr>
      <tr>
        <td>รหัสยืนยันการกู้คืนรหัสผ่าน</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_getpsw');?></td>
        <td>ประเภทรหัสยืนยัน</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_user_getpsw_type');?></td>
      </tr>
      <tr>
        <td>รหัสยืนยันการแสดงความคิดเห็น</td>
        <td><?php echo $manager->GetForm('code' , 'code_replay');?></td>
        <td>ประเภทรหัสยืนยัน</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_replay_type');?></td>
      </tr>
      <tr>
        <td>รหัสยืนยันการตั้งกระทู้</td>
        <td><?php echo $manager->GetForm('code' , 'code_bbs_post');?></td>
        <td>ประเภทรหัสยืนยัน</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_bbs_post_type');?></td>
      </tr>
      <tr>
        <td>รหัสยืนยันการตอบกระทู้</td>
        <td><?php echo $manager->GetForm('code' , 'code_bbs_replay');?></td>
        <td>ประเภทรหัสยืนยัน</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_bbs_replay_type');?></td>
      </tr>
    </table>
	
	<table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>คลังคำถามรหัสยืนยัน</b></th></tr></thead>
      <tr>
        <td><?php echo $manager->GetForm('code' , 'code_question');?></td>
        <td>หนึ่งบรรทัดต่อหนึ่งคำถาม คั่นคำถามกับคำตอบด้วย |<br/>เช่น เว็บไซต์ทางการของ wmcms คืออะไร?|www.weimengcms.com</td>
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
	$('#code_question').attr("cols",'70');
	$('#code_question').attr("rows",'10');
	$('#admin_login_error_number').css("width",'40');
	$('#admin_login_error_time').css("width",'70');
	$('#user_login_error_number').css("width",'40');
	$('#user_login_error_time').css("width",'70');
});
</script>