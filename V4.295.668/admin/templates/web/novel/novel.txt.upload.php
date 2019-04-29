<div class="bjui-pageContent">               
    <form action="index.php?a=yes&c=novel.txt&t=import" data-reload="false" data-timeout="5000" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.$type.'"';}?>>
		<input name="nid" type="hidden" class="input-text" value="<?php echo $nid;?>">
		<input name="file_name" type="hidden" class="input-text" value="">
		<input name="path" type="hidden" class="input-text" value="">
		<fieldset>
			<legend><?php if(!empty($data)){echo '《'.$data['novel_name'].'》 - ';}?>导入TXT</legend>
            <div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>base">
				<table class="table table-border table-bordered table-bg table-sort">
	            <tbody>
	                <tr>
	                    <td width="100"><b>分章类型：</b></td>
					  	<td>
		                    <select data-toggle="selectpicker" name="exp_type">
		                    	<option value="1">自动分章</option>
		                    	<option value="2">按格式分章</option>
                            </select>
	                    </td>
		                
	                </tr>
	                <tr id="<?php echo $cFun.$type?>exp_str_box" style="display:none">
	                    <td width="120"><b>分章格式：</b></td>
					  	<td><input type="text" name="exp_str" value="######"></td>
	                </tr>
	                <tr>
		                <td><b>上传TXT：</b></td>
					  	<td>
		                   <span class="upload" data-uploader="index.php?a=yes&c=upload&t=file" data-on-upload-success="<?php echo $cFun.$type;?>upload_success" data-file-type-exts="*.txt" data-toggle="upload" data-icon="cloud-upload"></span>
	                    </td>
	                </tr>
	                <tr id="<?php echo $cFun.$type?>init_box" style="display:none">
		                <td><b>初始化信息：</b></td>
					  	<td>初始化TXT信息中，请等待...</td>
	                </tr>
	            </tbody>
	        	</table>
			</div>
		</fieldset>
	</form>
</div>

<div class="bjui-pageFooter" id="<?php echo $cFun.$type?>button_box" style="pointer-events:none">
    <ul>
        <li><button type="button" class="btn-close" onClick="<?php echo $cFun.$type;?>initCancel()" data-icon="close">删除TXT</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">开始导入</button></li>
    </ul>
</div>


<script type="text/javascript">
//上传TXT的回调
function <?php echo $cFun.$type;?>upload_success(file,json,$element){
	json = $.parseJSON(json);
	if ( json.statusCode == 300){
		$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	}else{
		//等待初始化提示
        $('#<?php echo $cFun.$type?>init_box').show();
        //书籍id
        var nid = <?php echo $nid;?>;
        //书名
        var fileName = (file.name).replace(".txt","");
        $('[name="file_name"]').val(fileName);
        //上传的路径
        var path = json.data.abspath;
        $('[name="path"]').val(path);
		//上传成功后发送书名 + 书籍id + 上传的路径进行初始化请求。
      	var ajaxOptions=new Array();
        var ajaxData=new Object();
        ajaxData.nid = nid;
        ajaxData.file_name = fileName;
        ajaxData.path = path;
        ajaxData.exp_type = $('[name="exp_type"]').val();
        ajaxData.exp_str = $('[name="exp_str"]').val();
        ajaxOptions['data'] = ajaxData;
        ajaxOptions['type'] = 'POST';
		ajaxOptions['url'] = "index.php?a=yes&c=novel.txt&t=init";
		ajaxOptions['callback'] = "<?php echo $cFun;?>initCallBack";
		$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
	}
}
//初始化请求成功后的回调。
function <?php echo $cFun.$type;?>initCallBack(json){
	if (json.statusCode == 300){
		$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	}else{
		//显示初始化信息
        $('#<?php echo $cFun.$type?>init_box').find('td').eq(1).html('当前TXT共匹配到 '+json.data.count+' 章，请确认是否继续操作！');
        //允许按钮操作
		$('#<?php echo $cFun.$type?>button_box').css('pointer-events','');
    }
}
//初始化后点击取消
function <?php echo $cFun.$type;?>initCancel(){
	//上传成功后发送书名 + 书籍id + 上传的路径进行初始化请求。
  	var ajaxOptions=new Array();
    var ajaxData=new Object();
    ajaxData.path = $('[name="path"]').val();
    ajaxOptions['data'] = ajaxData;
    ajaxOptions['type'] = 'POST';
	ajaxOptions['url'] = "index.php?a=yes&c=novel.txt&t=del";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}

$(document).ready(function(){
	//显示分割字符串
	$('[name="exp_type"]').change(function() {
        $('#<?php echo $cFun.$type?>init_box').hide();
        $('#<?php echo $cFun.$type?>init_box').find('td').eq(1).html('初始化TXT信息中，请等待...');
		if ($(this).val() == 2){
	        $('#<?php echo $cFun.$type?>exp_str_box').show();
	    }else{
	        $('#<?php echo $cFun.$type?>exp_str_box').hide();
		}
	});
});
</script>