<style>
.form-horizontal .row {display: table;width: 100%;}
.form .row {margin-top: 15px;}
.form-horizontal .form-label {margin-top: 8px;cursor: text;text-align: right;padding-right: 10px; font-size: 14px;font-weight: normal;}
</style>

<div class="bjui-pageContent">
	<form action="index.php?a=yes&c=system.api.ttsvoicet&t=<?php echo $type;?>" name="<?php echo $cFun.$type;?>Form" class="form form-horizontal" data-reload="false" data-toggle="ajaxform" method="post" data-callback="<?php echo $cFun.$type;?>">
    	<input type="hidden" name="voicet_id" value="<?php echo $id;?>"/>
    	<div class="row cl">
			<label class="form-label col-md-4">สถานะ:</label>
	    	<div class="formControls col-md-8">
	        	<select data-toggle="selectpicker" name="data[voicet_status]">
		      	    <option value="1" <?php if(C('voicet_status',null,'data')=='1'){echo 'selected=""';}?>>使用</option>
		      	    <option value="0" <?php if(C('voicet_status',null,'data')=='0'){echo 'selected=""';}?>>禁用</option>
				</select>
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">อินเทอร์เฟซที่สังกัด:</label>
	    	<div class="formControls col-md-8">
	        	<select data-toggle="selectpicker" name="data[voicet_api_id]">
		      	    <?php
		      	    if( $typeData )
		      	    {
    		      	    foreach ($typeData as $k=>$v)
    		      	    {
    		      	        $selected = '';
    		      	        if( C('voicet_api_id',null,'data')==$v['api_id'] ){
    		      	            $selected = 'selected=""';
    		      	        }
    		      	        echo '<option value="'.$v['api_id'].'" '.$selected.'>'.$v['api_title'].'</option>';
    		      	    }
		      	    }
		      	    ?>
				</select>
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">ID นักพากย์:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="标签的名คำ，多รายการ用,分割" name="data[voicet_ids]" size="24" value="<?php echo C('voicet_ids',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">ชื่อนักพากย์:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="标签的名คำ，多รายการ用,分割" name="data[voicet_name]" size="24" value="<?php echo C('voicet_name',null,'data');?>">
	    	</div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-md-4">เรียงลำดับ:</label>
	    	<div class="formControls col-md-8">
	        	<input type="text" class="form-control" placeholder="数คำ，ยิ่งน้อยยิ่งอยู่หน้า" name="data[voicet_order]" size="24" value="<?php echo C('voicet_order',null,'data');?>">
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
    	$(this).navtab("reload",systemApiTtsvoicetListGetOp());	// 刷新当前Tab页面
	}
}
</script>