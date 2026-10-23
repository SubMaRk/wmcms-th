<style>
.form-horizontal .row {display: table;width: 100%;}
.form .row {margin-top: 15px;}
.form-horizontal .form-label {margin-top: 8px;cursor: text;text-align: right;padding-right: 10px; font-size: 14px;font-weight: normal;}
</style>


<div class="bjui-pageContent">
	<form action="index.php?a=yes&c=author.sign&t=add" class="form form-horizontal" data-reload="false" data-toggle="validate" method="post" data-callback="<?php echo $cFun;?>">
	    <div class="row cl">
			<label class="form-label col-md-4">โมดูลที่สังกัด:</label>
			<div class="formControls col-md-8">
		      	<select data-toggle="selectpicker" name="sign[sign_module]">
		        <?php
				foreach ($lvModule as $k=>$v)
				{
	            	echo '<option value="'.$k.'">'.$v.'</option>';
	            }
	            ?>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-md-4">ชื่อระดับเซ็นสัญญา:</label>
			<div class="formControls col-md-8">
		      	<input type="text" name="sign[sign_name]" class="form-control" data-rule="required">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-md-4">ส่วนแบ่งรายได้ไอเท็ม:</label>
			<div class="formControls col-md-8">
		      	<input type="text" name="sign[sign_divide]" value="<?php echo C('sign_divide',null,'data');?>" class="form-control" data-rule="required" size="8"> 【如：7(网站):3(作者)】
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-md-4">ราคาต่อพันคำ:</label>
			<div class="formControls col-md-8">
		      	<input type="text" name="sign[sign_gold1]" value="<?php echo C('sign_gold1',null,'data');?>" class="form-control" data-rule="required;number" size="8"> <?php echo $config['gold1_name']?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-md-4">ราคาต่อพันคำ:</label>
			<div class="formControls col-md-8">
		      	<input type="text" name="sign[sign_gold2]" value="<?php echo C('sign_gold2',null,'data');?>" class="form-control" data-rule="required;number" size="8"> <?php echo $config['gold2_name']?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-md-4">การเรียงระดับ:</label>
			<div class="formControls col-md-8">
		      	<input type="text" name="sign[sign_order]" value="<?php echo C('sign_order',null,'data');?>" class="form-control" data-rule="required;digits" size="10">
			</div>
		</div>
	</div>
	<div class="bjui-pageFooter">
	    <ul>
	        <li><button type="button" class="btn-close btn btn-danger size-MINI radius"><i class="fa fa-times"></i> ปิด</button></li>
	        <li><button type="submit" class="btn btn-success size-MINI radius"><i class="fa fa-floppy-o"></i> ส่งข้อมูล</button></li>
	    </ul>
	</div>
	</form>
</div>
<script type="text/javascript">
function <?php echo $cFun;?>(json){
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).dialog("closeCurrent");//关闭
    $(this).navtab("reload");	// 刷新当前Tab页面
}
</script>