<div class="bjui-pageContent">	                       
    <form action="index.php?a=yes&c=operate.zt&t=<?php echo $type;?>" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
	<input name="id[zt_id]" type="hidden" class="input-text" value="<?php echo $id;?>">
		<fieldset>
			<legend>专题编辑</legend>
            <ul class="nav nav-tabs" role="tablist">
            	<li class="active"><a href="#<?php echo $cFun.$type;?>base" role="tab" data-toggle="tab">基本设置</a></li>
            	<li><a href="#<?php echo $cFun.$type;?>seo" role="tab" data-toggle="tab">SEO设置</a></li>
            	<li><a href="#<?php echo $cFun.$type;?>templates" id="<?php echo $cFun.$type;?>templates_tab" role="tab" data-toggle="tab">模版设置</a></li>
            	<li><a href="#<?php echo $cFun.$type;?>html" role="tab" data-toggle="tab">HTML设置</a></li>
            </ul>
            <div class="tab-content">
            	<div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>base">
			        	<table class="table table-condensed table-hover" width="100%">
			            <tbody>
					    <tr>
					      <td width="40%">
						      <b>专 题 名 字：</b>
						      <input name="zt[zt_name]" data-rule="required" type="text" class="input-text" value="<?php echo C('zt_name',null,'data');?>">
						  </td>
					      <td>
						      <b>专 题 拼 音：</b>
						      <input name="zt[zt_pinyin]" type="text" class="input-text" value="<?php echo C('zt_pinyin',null,'data');?>">
						  </td>
						</tr>
						<tr>
							<td>
								<b>专 题 状 态：</b>
								<select data-toggle="selectpicker" name="zt[zt_status]">
								<?php 
								foreach ($statusArr as $k=>$v)
								{
									$select = str::CheckElse($k, C('zt_status',null,'data') , 'selected=""');
									echo '<option value="'.$k.'" '.$select.'>'.$v.'</option>';
								}
								?>
								</select>
							 </td>
							<td>
								<b>专题浏览量：</b><input size="10" name="zt[zt_read]" type="text" class="input-text" value="<?php echo C('zt_read',null,'data');?>">
							</td>
						</tr>
					    <tr>
					      <td colspan="2">
					      	<b>专 题 封 面：</b>
					      	<input size="40" name="zt[zt_simg]" type="text" class="input-text" value="<?php echo C('zt_simg',null,'data');?>">
					      	<span class="upload" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg,*.jpeg,*.png" data-toggle="upload" data-icon="cloud-upload"></span>
					      </td>
						</tr>
					    <tr>
					      <td colspan="2">
					      	<b>专 题 横 幅：</b>
					      	<input size="40" name="zt[zt_banner]" type="text" class="input-text" value="<?php echo C('zt_banner',null,'data');?>">
					      	<span class="upload" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg,*.jpeg,*.png" data-toggle="upload" data-icon="cloud-upload"></span>
					      </td>
						</tr>
					    <tr>
					      <td colspan="2">
					      	<b>专 题 介 绍：</b>
					      	<textarea name="zt[zt_info]" cols="70" rows="6"><?php echo C('zt_info',null,'data');?></textarea>
					      </td>
						</tr>
						<tr>
					      <td colspan="2"><b>页 面 内 容：</b>
							<?php echo Ueditor('width: 98%;height:250px' , 'zt[zt_content]' , C('zt_content',null,'data'), 'editor.operate_zt');?>
					    </tr>
			            </tbody>
			        </table>
	        	</div>

				<div class="tab-pane fade" id="<?php echo $cFun.$type;?>seo">
					<table class="table table-border table-bordered table-bg table-sort">
					    <tr>
					      <td width="150"><b>自定义标题：</b></td>
					      <td><input name="zt[zt_title]" type="text" class="input-text" size="40" value="<?php echo C('zt_title',null,'data');?>"></td>
						</tr>
					    <tr>
					      <td><b>自定义关键字：</b></td>
					      <td><input name="zt[zt_key]" type="text" class="input-text" size="40" value="<?php echo C('zt_key',null,'data');?>"></td>
						</tr>
					    <tr>
					      <td><b>自定义描述：</b></td>
					      <td><input name="zt[zt_desc]" type="text" class="input-text" size="40" value="<?php echo C('zt_desc',null,'data');?>"></td>
						</tr>
					</table>
				</div>

				<div class="tab-pane fade" id="<?php echo $cFun.$type;?>templates">
					<table class="table table-border table-bordered table-bg table-sort">
					    <tr>
					      <td width="150"><b>内容页模版：</b></td>
					      <td>
					      	<input id="zt_ctempid" name="zt[zt_ctempid]" type="hidden" value="<?php echo C('zt_ctempid',null,'data');?>">
					      	<input id="temp_cname" name="temp[temp_cname]" type="text" value="<?php echo C('cname',null,'temp');?>" data-toggle="lookup" data-url="index.php?c=system.templates.lookup&module=zt&page=content&name=cname&tid=ctempid&rename=zt" data-title="选择当前专题内容页模版" size="30" data-width="700" data-height="500">
					      	<a class="btn btn-default" href="index.php?c=system.templates.edit&t=add&module=zt&page=content&name=cname&tid=ctempid&rename=zt" data-toggle="dialog" data-title="上传新的专题内容页模版" data-width="540" data-height="450" ><i class="fa fa-cloud-upload">&nbsp;</i>上传模板</a>
					      </td>
						</tr>
					    <tr>
					      <td colspan="2">不指定模版，将会使用当前应用的主题的自带模版！</td>
						</tr>
					</table>
				</div>

				<div class="tab-pane fade" id="<?php echo $cFun.$type;?>html">
					<table class="table table-border table-bordered table-bg table-sort">
					    <tr>
					      <td width="150"><b>内容页静态路径：</b></td>
					      <td><input name="html[content]" value="<?php echo C('content',null,'html');?>" type="text" class="input-text" size="40"></td>
						</tr>
					</table>
				</div>
				
	        </div>
		</fieldset>
	</form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">保存</button></li>
    </ul>
</div>


<script type="text/javascript">
//页面唯一回调函数
function <?php echo $cFun;?>(json){
	var op = operateZtListGetOp();
	var tabid = 'zt-list';
	op['id'] = tabid;

	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).navtab("reload",op);	// 刷新Tab页面
    $(this).navtab("switchTab",tabid);	// 切换Tab页面
}

//上传模版成功后
function <?php echo $cFun;?>upload_success(file,json,$element){
	json = $.parseJSON(json);
	if ( json.statusCode == 300){
		$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	}else{
		val = json.data.path.replace('../',"/");
		$element.siblings('input').val(val);
	}
}

$(document).ready(function(){
	$("#<?php echo $cFun.$type;?>templates_tab").click(function(){
		$(".bjui-lookup").css("line-height",'23px');
		$(".bjui-lookup").css("height",'23px');
	});
});
</script>