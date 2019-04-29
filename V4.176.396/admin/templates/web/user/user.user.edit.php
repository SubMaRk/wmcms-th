<div class="bjui-pageContent">
    <form action="index.php?a=yes&c=user.user&t=<?php echo $type;?>" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
	<input name="user_id" type="hidden" class="input-text" value="<?php echo $id;?>">
		<fieldset>
			<legend>แก้ไขข้อมูลผู้ใช้</legend>
            <ul class="nav nav-tabs" role="tablist">
            	<li class="active"><a href="#<?php echo $cFun.$type;?>base" role="tab" data-toggle="tab">ข้อมูลทั่วไป</a></li>
            	<li><a href="#<?php echo $cFun.$type;?>finance" id="<?php echo $cFun.$type;?>finance_tab" role="tab" data-toggle="tab">ข้อมูลการเงิน</a></li>
            </ul>
            <div class="tab-content">
            	<div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>base">
		    		<table class="table table-border table-bordered table-bg table-sort">
			            <tbody>
			                <tr>
			                    <td colspan="5">
			                        <b>ชื่อผู้ใช้ : </b>
			                        <input type="text" name="user[user_name]" value="<?php echo C('user_name',null,'data');?>" data-rule="required">
			                    </td>
			                </tr>
			                <tr>
			                    <td colspan="5">
			                        <b>รหัสผ่าน : </b>
			                        <input type="text" name="user[user_psw]">
			                    </td>
			                </tr>
			                <tr>
				                <td>
				                	<b>สถานะบัญชี : </b>
				                    <select data-toggle="selectpicker" name="user[user_status]">
		                            	<option value="1" <?php if(C('user_status',null,'data') == '1'){ echo 'selected=""';}?>>ตรวจสอบแล้ว</option>
		                                <option value="0" <?php if(C('user_status',null,'data') == '0'){ echo 'selected=""';}?>>รอดำเนินการ</option>
		                            </select>
				                </td>
			                   <td>
			                        <b>สถานะแบนบัญชี : </b>
			                        <select data-toggle="selectpicker" name="user[user_display]">
			                        <?php
			                        foreach ($displayArr as $k=>$v)
			                        {
			                        	$select = str::CheckElse( C('user_display',null,'data') , $k , 'selected=""');
			                        	echo '<option value="'.$k.'" '.$select.'>'.$v.'</option>';
			                        }
			                        ?>
		                            </select>
			                   </td>
			                   <td>
			                        <b>เวลาที่แบน : </b>
			                        <input type="text" name="user[user_displaytime]" value="<?php echo date('Y-m-d H:i:s',C('user_displaytime',null,'data'));?>" data-toggle="datepicker" data-pattern="yyyy-MM-dd H:m:s" size="19">
			                   </td>
			                </tr>
			                <tr>
			                   <td colspan="5">
			                        <b>รูปโปรไฟล์ : </b>
			                        <div style="line-height: 25px;">
				                        <img width="100" id="user_head_img" height="100" src="<?php echo C('user_head',null,'data')?>" /><br/>
				                        <a target="_blank" href="<?php echo C('user_head',null,'data');?>">คลิ๊กเพื่อดูรูป</a><br/>

				                        <input type="text" id="user_head" name="user[user_head]" value="<?php echo C('user_head',null,'data');?>" size="40">
										<span class="upload" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg;*.png;*.gif;*.mpg" data-toggle="upload" data-icon="cloud-upload"></span>
									</div>
			                    </td>
			                </tr>
			                <tr>
			                   <td>
			                        <b>ชื่อเล่น : </b>
			                        <input type="text" name="user[user_nickname]" data-rule="required" value="<?php echo C('user_nickname',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>อีเมล : ์</b>
			                        <input type="text" name="user[user_email]" data-rule="email" value="<?php echo C('user_email',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>ยืนยันอีเมล์ : </b>
			                        <input name="user[user_emailtrue]" type="radio" data-toggle="icheck" data-label="ยืนยันแล้ว" value="1" <?php if(C('user_emailtrue',null,'data') == '1'){ echo 'checked="1"';}?> />
			                        <input name="user[user_emailtrue]" type="radio" data-toggle="icheck" data-label="ยังไม่ยืนยัน" value="0" <?php if(C('user_emailtrue',null,'data') == '0'){ echo 'checked="0"';}?> />
			                    </td>
			                </tr>
			                <tr>
			                   <td>
			                        <b>วันเกิด : </b>
			                        <input type="text" data-toggle="datepicker" data-pattern="yyyy-MM-dd" name="user[user_birthday]"  value="<?php echo C('user_birthday',null,'data');?>" size="13">
			                    </td>
			                   <td>
			                        <b>เพศ : </b>
			                        <input name="user[user_sex]" type="radio" data-toggle="icheck" data-label="ชาย" value="1" <?php if(C('user_sex',null,'data') == '1'){ echo 'checked="1"';}?> />
			                        <input name="user[user_sex]" type="radio" data-toggle="icheck" data-label="หญิง" value="2" <?php if(C('user_sex',null,'data') == '2'){ echo 'checked="2"';}?> />
			                    </td>
			                   <td>
			                        <b>ดูพื้นที่ส่วนตัว : </b>
			                        <input type="text" data-rule="number" size="10" name="user[user_browse]"  value="<?php echo C('user_browse',null,'data');?>">
			                    </td>
			                </tr>
			                <tr>
			                   <td>
			                        <b>ค่าประสบการณ์ : </b>
			                        <input type="text" size="10" data-rule="number" name="user[user_exp]"  value="<?php echo C('user_exp',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>QQ : </b>
			                        <input type="text" size="13" data-rule="number" name="user[user_qq]"  value="<?php echo C('user_qq',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>เบอร์มือถือ : </b>
			                        <input type="text" size="13" data-rule="number" name="user[user_tel]"  value="<?php echo C('user_tel',null,'data');?>">
			                    </td>
			                </tr>
			                <tr>
			                   <td>
			                        <b>ยอดคงเหลือ : </b>
			                        <input type="text" size="10" data-rule="number" readonly value="<?php echo C('user_money',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>จำนวนเหรียญทอง 1 : </b>
			                        <input type="text" size="10" data-rule="number" readonly value="<?php echo C('user_gold1',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>จำนวนเหรียญทอง 2 : </b>
			                        <input type="text" size="10" data-rule="number" readonly value="<?php echo C('user_gold2',null,'data');?>">
			                    </td>
			                </tr>
			                <tr>
			                   <td>
			                        <b>จำนวนกระทู้ : </b>
			                        <input type="text" size="10" data-rule="number" name="user[user_topic]"  value="<?php echo C('user_topic',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>ตอบกลับ : </b>
			                        <input type="text" size="10" data-rule="number" name="user[user_retopic]"  value="<?php echo C('user_retopic',null,'data');?>">
			                    </td>
			                   <td>
			                        <b>จำนวนความคิดเห็น : </b>
			                        <input type="text" size="10" data-rule="number" name="user[user_replay]"  value="<?php echo C('user_replay',null,'data');?>">
			                    </td>
			                </tr>
			                <tr>
			                   <td colspan="3">
			                        <b>ลายเซ็น : </b>
			                        <textarea cols="70" rows="1" name="user[user_sign]" data-toggle="autoheight"><?php echo C('user_sign',null,'data');?></textarea>
			                    </td>
			                </tr>
			                <tr>
			                   <td>
			                        <b>เข้าสู่ระบบล่าสุด : </b>
			                        <input type="text" name="user[user_logintime]" value="<?php echo date('Y-m-d H:i:s',C('user_logintime',null,'data'));?>" data-toggle="datepicker" data-pattern="yyyy-MM-dd H:m:s" size="19">
			                   </td>
			                   <td>
			                        <b>เวลาลงทะเบียน : </b>
			                        <input type="text" name="user[user_regtime]" value="<?php echo date('Y-m-d H:i:s',C('user_regtime',null,'data'));?>" data-toggle="datepicker" data-pattern="yyyy-MM-dd H:m:s" size="19">
			                   </td>
			                </tr>
			            </tbody>
			        </table>
			   </div>

		       <div class="tab-pane fade" id="<?php echo $cFun.$type;?>finance">
		    		<table class="table table-border table-bordered table-bg table-sort">
		            <tbody>
		                <tr>
		                   <td>
		                        <b>ชื่อจริง : </b>
		                        <input size="15" name="finance[finance_realname]" value="<?php echo C('finance_realname',null,'data');?>">
		                    </td>
		                   <td>
		                        <b>&nbsp;&nbsp;&nbsp;&nbsp;เลขบัตร ：</b>
		                        <input size="35" name="finance[finance_cardid]" value="<?php echo C('finance_cardid',null,'data');?>">
		                    </td>
		                </tr>
		                <tr>
		                   <td>
		                        <b>รหัสไปรษณีย์ : </b>
		                        <input size="15" name="finance[finance_zipcode]" value="<?php echo C('finance_zipcode',null,'data');?>">
		                    </td>
		                   <td>
		                        <b>ที่อยู่ : </b>
		                        <input size="35" name="finance[finance_address]" value="<?php echo C('finance_address',null,'data');?>">
		                    </td>
		                </tr>
		                <tr>
		                   <td>
		                        <b>ธนาคาร : </b>
		                        <input size="15" name="finance[finance_bank]" value="<?php echo C('finance_bank',null,'data');?>">
		                    </td>
		                   <td>
		                        <b>สาขา : </b>
		                        <input size="35" name="finance[finance_bankaddress]" value="<?php echo C('finance_bankaddress',null,'data');?>">
		                    </td>
		                </tr>
		                <tr>
		                   <td>
		                        <b>ผู้ถือบัตร ：</b>
		                        <input size="15" name="finance[finance_bankmaster]" value="<?php echo C('bankmaster',null,'data');?>">
		                    </td>
		                   <td>
		                        <b>เลขบัญชี ：</b>
		                        <input size="35" name="finance[finance_bankcard]" value="<?php echo C('finance_bankcard',null,'data');?>">
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="3">
		                        <b>Alipay ：</b>
		                        <input size="25" name="finance[finance_alipay]" value="<?php echo C('finance_alipay',null,'data');?>">
		                    </td>
		                </tr>
		            </tbody>
		        </table>
		       </div>
		</fieldset>
	</form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">จัดเก็บ</button></li>
    </ul>
</div>


<script>
//页面唯一op获取函数
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}
//页面唯一回调函数
function <?php echo $cFun;?>(json){
	var op = userUserListGetOp();
	var tabid = 'user-list';
	op['id'] = tabid;

	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).navtab("reload",op);	// 刷新Tab页面
    $(this).navtab("switchTab",tabid);	// 切换Tab页面
}
//上传头像
function <?php echo $cFun;?>upload_success(file,json,$element){
	json = $.parseJSON(json);
	if ( json.statusCode == 300){
		$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	}else{
		val = json.data.path.replace('../',"/");
		$("#user_head").val(val);
		$("#user_head_img").attr('src',val);

	}
}


$(document).ready(function(){
	$("#<?php echo $cFun;?>senior_tab").click(function(){
		$('.bjui-lookup').css("line-height",'22px');
		$('.bjui-lookup').css("height",'22px');
	});
});
</script>
