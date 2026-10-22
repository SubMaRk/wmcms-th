<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.safe.code&t=config" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>验证码基本设置</b></th></tr></thead>
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
        <td width="140">后台登录验证码</td>
        <td width="300"><?php echo $manager->GetForm('code' , 'code_admin_login');?></td>
        <td width="140">验证码类型</td>
        <td width="170"><?php echo $manager->GetForm('code' , 'code_admin_login_type');?></td>
        <td width="140">登录封锁</td>
        <td>
        	错误超过 <?php echo $manager->GetForm('code' , 'admin_login_error_number');?> 次，
        	封锁 <?php echo $manager->GetForm('code' , 'admin_login_error_time');?> 分钟
        </td>
      </tr>
      <tr>
        <td>用户注册验证码</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_reg');?></td>
        <td>验证码类型</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_user_reg_type');?></td>
      </tr>
      <tr>
        <td>用户登录验证码</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_login');?></td>
        <td>验证码类型</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_login_type');?></td>
        <td width="140">登录封锁</td>
        <td>
        	错误超过 <?php echo $manager->GetForm('code' , 'user_login_error_number');?> 次，
        	封锁 <?php echo $manager->GetForm('code' , 'user_login_error_time');?> 分钟
        </td>
      </tr>
      <tr>
        <td>修改密码验证码</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_uppsw');?></td>
        <td>验证码类型</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_user_uppsw_type');?></td>
      </tr>
      <tr>
        <td>找回密码验证码</td>
        <td><?php echo $manager->GetForm('code' , 'code_user_getpsw');?></td>
        <td>验证码类型</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_user_getpsw_type');?></td>
      </tr>
      <tr>
        <td>发表评论验证码</td>
        <td><?php echo $manager->GetForm('code' , 'code_replay');?></td>
        <td>验证码类型</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_replay_type');?></td>
      </tr>
      <tr>
        <td>发表主题验证码</td>
        <td><?php echo $manager->GetForm('code' , 'code_bbs_post');?></td>
        <td>验证码类型</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_bbs_post_type');?></td>
      </tr>
      <tr>
        <td>回复主题验证码</td>
        <td><?php echo $manager->GetForm('code' , 'code_bbs_replay');?></td>
        <td>验证码类型</td>
        <td colspan="3"><?php echo $manager->GetForm('code' , 'code_bbs_replay_type');?></td>
      </tr>
    </table>
	
	<table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>问答验证码题库</b></th></tr></thead>
      <tr>
        <td><?php echo $manager->GetForm('code' , 'code_question');?></td>
        <td>一行一个问题，问题和答案之间用|分割<br/>如：wmcms的官网是什么？|www.weimengcms.com</td>
      </tr>
    </table>
  </form>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">保存</button></li>
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