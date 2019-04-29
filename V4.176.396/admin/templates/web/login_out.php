<div class="bjui-pageContent">
    <form action="?a=yes&c=login" data-toggle="validate" method="post">
        <hr>
        <div class="form-group">
            <label for="j_pwschange_oldpassword" class="control-label x85">ชื่อผู้ใช้ : </label>
            <input type="text" data-rule="required" name="name" value="" placeholder="ชื่อผู้ใช้" size="20">
        </div>
        <div class="form-group">
            <label for="j_pwschange_oldpassword" class="control-label x85">รหัสผ่าน : </label>
            <input type="password" data-rule="required" name="psw" value="" placeholder="รหัสผ่าน" size="20">
        </div>
         <?php
         if( C('config.web.admin_login_code') == ' 1' )
         {
             echo '<div class="form-group">
            			<label for="j_pwschange_oldpassword" class="control-label x85">โค้ดยืนยัน : </label>
			            <img src="../../wmcms/inc/imgcode.php" id="refresh" onClick="document.getElementById(\'refresh\').src=\'../../wmcms/inc/imgcode.php?t=\'+Math.random()" width="54" height="22" class="imgode" />
			            <input type="text" data-rule="required" name="code" value="" placeholder="โค้ดยืนยัน" size="14">
			        </div>';
          }
		?>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-default">ส่ง</button></li>
    </ul>
</div>
