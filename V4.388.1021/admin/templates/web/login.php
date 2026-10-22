<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><?php echo C('config.web.webname');?>เข้าสู่ระบบพื้นหลัง - <?php echo WMCMS;?></title>
<link href="<?php echo $tempPath;?>BJUI/login/login2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/files/js/jquery-2.0.0.min.js"></script>
</head>
<body style="zoom: 1;">
<h1><?php echo C('config.web.webname');?>ระบบจัดการพื้นหลัง<sup></sup></h1>

<div class="login" style="margin-top:100px;">
    
    <div class="header">
	    <div class="tip">ยินดีต้อนรับกลับ</div>
    </div>


    <div class="web_qr_login" id="web_qr_login" style="display: block;">
            <!--登录-->
            <div class="web_login" id="web_login">
            <div class="login-box">
			<div class="login_form">
				<form action="index.php?a=yes&c=login" class="loginForm" method="post">
               	<input type="hidden" name="isAjax" value="0" />
               	<?php echo FormTokenCreate();?>
                <div class="uinArea" id="uinArea">
					<label class="input-tips" for="u">ไอดี : </label>
					<div class="inputOuter">
						<input type="text" name="name" class="inputstyle" placeholder="ไอดี" required="">
					</div>
                </div>
                <div class="pwdArea" id="pwdArea">
				   <label class="input-tips" for="p">รหัสผ่าน : </label>
				   <div class="inputOuter">
						<input type="password" name="psw" class="inputstyle" placeholder="รหัสผ่าน" required="">
					</div>
                </div>
                <?php
                	if( C('config.web.code_admin_login') == '1' )
                	{
                		echo '<div class="uinArea">
						<div class="inputOuter" style="width: 250px;"id="uArea">
							'.FormCodeCreate('code_admin_login').'
							<input type="text" name="code" class="codeinput" placeholder="โค้ดยืนยัน" required="">
						</div>
	                </div>';
                	}
				?>

                <div style="padding-left:50px;"><input type="submit" value="เข้าสู่ระบบ" style="width:150px;" class="button_blue"></div>
              </form>
           </div>
            	</div>
            </div>
  </div>
</div>
<div class="jianyi">Powered by <a href="<?php echo WMURL;?>" target="_blank"><?php echo WMCMS;?></a> Inc.<!-- SubMaRk --> | แปลไทยโดย <a href="https://naynum.engineer" target="_blank">SubMaRk</a></div>
</body></html>