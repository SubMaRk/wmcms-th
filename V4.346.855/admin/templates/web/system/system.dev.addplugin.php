<div class="bjui-pageContent">
	<fieldset>
		<legend>เครื่องมือพัฒนาปลั๊กอิน</legend>
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#<?php echo $cFun.$type;?>plugin_add" role="tab" data-toggle="tab">สร้างปลั๊กอิน</a></li>
            <li><a href="#<?php echo $cFun.$type;?>config_add" role="tab" data-toggle="tab">สร้างการกำหนดค่า</a></li>
            <li><a href="#<?php echo $cFun.$type;?>config_edit" role="tab" data-toggle="tab">ลบการกำหนดค่า</a></li>
        </ul>
		<div class="tab-content">
            <div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>plugin_add">
				<form name="plugin_add" action="index.php?a=yes&c=system.dev.addplugin&t=plugin_add" method="post" data-toggle="validate" data-confirm-msg="สร้างปลั๊กอินหรือไม่?">
				<table class="table table-border table-bordered table-bg table-sort">
					<tr>
				      <td valign="top" width="100"><b>ชื่อ : </b></td>
				      <td valign="top"><input data-rule="required;" name="data[plugin_name]" type="text" class="input-text"> ชื่อของปลั๊กอิน เช่น สมุดบันทึก</td>
					</tr>
				    <tr>
				      <td valign="top"><b>ไอดี : </b></td>
				      <td valign="top"><input data-rule="required;" name="data[plugin_floder]" type="text" class="input-text"> ไอดีที่ใช้ระบุถึงปลั๊กอิน (ภาษาอังกฤษเท่านั้น) ซึ่งต้องอยู่ในรูปแบบ : ชื่อผู้พัฒนา_ชื่อปลั๊กอิน (naynoi_book)</td>
					</tr>
				    <tr>
				      <td valign="top"><b>ผู้พัฒนา : </b></td>
				      <td valign="top"><input data-rule="required;" name="data[plugin_author]" type="text" class="input-text"> ผู้พัฒนาปลั๊กอิน เช่น SubMaRk</td>
					</tr>
				    <tr>
				      <td valign="top"><b>เวอร์ชั่น : </b></td>
				      <td valign="top"><input data-rule="required;" name="data[plugin_version]" type="text" class="input-text"> เวอร์ชั่นของปลั๊กอิน เช่น v1.0</td>
					</tr>
				    <tr>
				      <td valign="top"><b>เว็บหลัก : </b></td>
				      <td valign="top"><input name="url" type="text" class="input-text"> หน้าหลักเว็บไซต์ผู้พัฒนา เช่น https://nay-noi.com</td>
					</tr>
				    <tr>
				      <td colspan="2"><button type="submit" class="btn-green" data-icon="save">สร้างปลั๊กอิน</button></td>
					</tr>
				</table>
				</form>
			</div>
			
			<div class="tab-pane fade" id="<?php echo $cFun.$type;?>config_add">
				<form name="plugin_add" action="index.php?a=yes&c=system.dev.addplugin&t=config_add" method="post" data-toggle="validate" data-confirm-msg="ต้องการสร้างการกำหนดค่าให้ปลั๊กอินหรือไม่?" data-callback="<?php echo $cFun;?>">
				<table class="table table-border table-bordered table-bg table-sort">
					<tr>
				      <td valign="top" width="150"><b>เลือกปลั๊กอิน : </b></td>
				      <td valign="top">
			        	<select data-toggle="selectpicker" data-rule="required;" name="config_plugin_id">
			        		<option value="">โปรดเลือกปลั๊กอิน</option>
				        	<?php 
				        	foreach ($data as $k=>$v)
				        	{
				        		echo '<option value="'.$v['plugin_id'].'">'.$v['plugin_name'].'</option>';
				        	}
				        	?>
			        	</select>
					</tr>
				    <tr>
				      <td valign="top" width="100"><b>ชื่อคีย์ : </b></td>
				      <td valign="top"><input data-rule="required;" name="config_key" type="text" class="input-text"> ชื่อคีย์การกำหนดค่า เช่น site_open</td>
					</tr>
				    <tr>
				      <td valign="top"><b>ค่า : </b></td>
				      <td valign="top"><input data-rule="required;" name="config_val" type="text" class="input-text"> ค่าของคีย์ เช่น 1</td>
					</tr>
				    <tr>
				      <td colspan="2"><button type="submit" class="btn-green" data-icon="save">สร้างการกำหนดค่า</button></td>
					</tr>
				</table>
				</form>
			</div>
			
			<div class="tab-pane fade" id="<?php echo $cFun.$type;?>config_edit">
				<form name="plugin_add" action="index.php?a=yes&c=system.dev.addplugin&t=config_del" method="post" data-toggle="validate" data-confirm-msg="ต้องการลบการกำหนดค่าปลั๊กอินหรือไม่?">
				<table class="table table-border table-bordered table-bg table-sort">
					<tr>
				      <td valign="top" width="150"><b>เลือกปลั๊กอิน : </b></td>
				      <td valign="top">
			        	<select name="config_plugin_id" data-rule="required;" data-toggle="selectpicker" data-nextselect="#<?php echo $cFun;?>config_id" data-refurl="index.php?a=yes&c=system.dev.addplugin&t=getpluginconfig&id={value}">
                        	<option value="">--โปรดเลือกปลั๊กอิน--</option>
                            <?php 
				        	foreach ($data as $k=>$v)
				        	{
				        		echo '<option value="'.$v['plugin_id'].'">'.$v['plugin_name'].'</option>';
				        	}
				        	?>
                        </select>
                        <select name="config_key" data-rule="required;" id="<?php echo $cFun;?>config_id" data-toggle="selectpicker" data-emptytxt="--ไม่พบการกำหนดค่าในปลั๊กอินนี้--">
                        	<option value="">--โปรดเลือกการกำหนดค่า--</option>
                        </select>
					</tr>
				    <tr>
				      <td colspan="2"><button type="submit" class="btn-red" data-icon="close">ลบการกำหนดค่า</button></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</fieldset>
</div>

<script>
</script>
