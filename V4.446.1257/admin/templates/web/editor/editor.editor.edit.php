<style>
.form-horizontal .row {display: table;width: 100%;}
.form .row {margin-top: 15px;}
.form-horizontal .form-label {margin-top: 8px;cursor: text;text-align: right;padding-right: 10px; font-size: 14px;font-weight: normal;}
</style>

<div class="bjui-pageContent">
	<form action="index.php?a=yes&c=editor.editor&t=<?php echo $type;?>" name="<?php echo $cFun.$type;?>Form" class="form form-horizontal" data-reload="false" data-toggle="ajaxform" method="post" data-callback="<?php echo $cFun.$type;?>">
    	<input type="hidden" name="editor_id" value="<?php echo $id;?>"/>
	    <div class="row cl">
			<label class="form-label col-md-4">สถานะ:</label>
	    	<div class="formControls col-md-8">
	        	<select data-toggle="selectpicker" name="data[editor_status]">
		      	    <?php
		      	    foreach ($editorMod->GetStatus() as $k=>$v)
                	{
                		$checked = str::CheckElse( $k , C('editor_status',null,'data') , 'selected=""' );
                		echo '<option value="'.$k.'" '.$checked.'>'.$v.'</option>';
                	}
		      	    ?>
				</select>
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">ID ผู้ใช้ที่ผูก:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="输入绑定的ผู้ใช้ID" name="data[editor_uid]" size="24" value="<?php echo C('editor_uid',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">ชื่อบรรณาธิการ:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="ชื่อบรรณาธิการ" name="data[editor_name]" size="24" value="<?php echo C('editor_name',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">แก้ไขชื่อจริง:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="บรรณาธิการ的真实ชื่อ-นามสกุล" name="data[editor_realname]" size="24" value="<?php echo C('editor_realname',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">หมายเลข QQ：</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="บรรณาธิการ的หมายเลข QQ" name="data[editor_qq]" size="24" value="<?php echo C('editor_qq',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">ID WeChat:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="บรรณาธิการ的ID WeChat" name="data[editor_weixin]" size="24" value="<?php echo C('editor_weixin',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">หมายเลขโทรศัพท์:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="บรรณาธิการ的หมายเลขโทรศัพท์" name="data[editor_tel]" size="24" value="<?php echo C('editor_tel',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">คำอธิบายส่วนตัว：</label>
	    	<div class="formControls col-md-8">
	    	    <textarea class="form-control" 	cols="24" rows="5" placeholder="บรรณาธิการ的รายการ人คำอธิบาย" name="data[editor_desc]"><?php echo C('editor_desc',null,'data');?></textarea>
	    	</div>
	    </div>
	</div>
	</form>
	<div class="bjui-pageFooter">
	    <ul>
	        <li><button type="button" class="btn-close btn btn-danger size-MINI radius"><i class="fa fa-times"></i> ปิด</button></li>
	        <li><button type="submit" class="btn btn-success size-MINI radius"><i class="fa fa-floppy-o"></i> บันทึก</button></li>
	    </ul>
	</div>
</div>
<script type="text/javascript">
function <?php echo $cFun.$type;?>(json){
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	if(json.statusCode==200){
        $(this).dialog("closeCurrent");	//关闭当前dialog
    	$(this).navtab("reload",editorEditorListGetOp());	// 刷新当前Tab页面
	}
}
</script>