<link href="/files/js/webupload/webuploader.css" rel="stylesheet" type="text/css" />
<style>
.uploader-list-container .filelist li .del{cursor: pointer;z-index:999;position: absolute;right:5px;top:5px;width:16px;height:16px;background: url(/files/js/webupload/images/icons.png) no-repeat;background-position: -49px 0px;}
</style>
<div class="bjui-pageContent">               
    <form action="index.php?a=yes&c=app.app&t=<?php echo $type;?>" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
	<input name="id[app_id]" id="<?php echo $cFun.$type;?>_cid" type="hidden" class="input-text" value="<?php echo $id;?>">
		<fieldset>
			<legend>แก้ไขเนื้อหาแอปฯ</legend>
            <ul class="nav nav-tabs" role="tablist">
            	<li class="active"><a href="#<?php echo $cFun.$type;?>base" role="tab" data-toggle="tab">ตั้งค่าทั่วไป</a></li>
            	<li><a href="#<?php echo $cFun.$type;?>senior" id="<?php echo $cFun.$type;?>senior_tab" role="tab" data-toggle="tab">ตั้งค่าขั้นสูง</a></li>
            	<li><a href="#<?php echo $cFun.$type;?>field" id="<?php echo $cFun.$type;?>field_tab" role="tab" data-toggle="tab">ฟิลด์ที่กำหนดเอง</a></li>
            </ul>
            <div class="tab-content">
            	<div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>base">
		        	<table class="table table-condensed table-hover" width="100%">
		            <tbody>
		            	<tr>
						  <td colspan="2">
						  	<b>หมวดหมู่ : </b>
							<input id="<?php echo $cFun.$type;?>type_id" name="app[type_id]" type="hidden" value="<?php echo C('type_id',null,'data');?>">
					      	<input type="text" id="<?php echo $cFun.$type;?>_ztree_input" data-toggle="selectztree" data-tree="#<?php echo $cFun.$type;?>_ztree_select" readonly value="<?php echo C('type_name',null,'data');?>">
                            <ul id="<?php echo $cFun.$type;?>_ztree_select" class="ztree hide" data-toggle="ztree" data-expand-all="true" data-check-enable="true" data-chk-style="radio" data-radio-type="all" data-on-check="<?php echo $cFun.$type;?>S_NodeCheck" data-on-click="<?php echo $cFun.$type;?>S_NodeClick">
                                <?php 
							    foreach ($typeArr as $k=>$v)
							    {
							    	$checked = str::CheckElse( $v['type_id'], C('type_id',null,'data') , 'true');
							    	echo '<li data-checked="'.$checked.'" data-id="'.$v['type_id'].'" data-pid="'.$v['type_topid'].'">'.$v['type_name'].'</li>';
							    }
							    ?>
                            </ul>
					      </td>
						</tr>
		                <tr>
		                    <td width="50%">
		                        <b>ชื่อเต็ม : </b>
		                        <input type="text" name="app[app_name]" value="<?php echo C('app_name',null,'data');?>" data-rule="required">
		                    </td>
		                    <td>
		                        <b>ชื่อย่อ : </b>
		                        <input type="text" name="app[app_cname]" value="<?php echo C('app_cname',null,'data');?>">
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="2">
		                        <b>พินอิน : </b>
		                        <input type="text" name="app[app_pinyin]" value="<?php echo C('app_pinyin',null,'data');?>">
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="2">
		                        <b>สถานะ : </b>
		                        <select data-toggle="selectpicker" name="app[app_status]">
                                    <option value="1" <?php if(C('app_status',null,'data') == '1'){ echo 'selected=""';}?>>ผ่าน</option>
                                    <option value="0" <?php if(C('app_status',null,'data') == '0'){ echo 'selected=""';}?>>รอ</option>
                                </select>
		                        <b style="margin-left: 163px">是 否 推 荐：</b>
		                        <select data-toggle="selectpicker" name="app[app_rec]">
                                    <option value="1" <?php if(C('app_rec',null,'data') == '1'){ echo 'selected=""';}?>>แนะนำ</option>
                                    <option value="0" <?php if(C('app_rec',null,'data') == '0'){ echo 'selected=""';}?>>ไม่แนะนำ</option>
                                </select>
		                    </td>
		                </tr>
		                <tr>
		                   <td>
		                        <b>หน้าปก : </b>
		                        <input type="text" id="app_simg" name="app[app_simg]" value="<?php echo C('app_simg',null,'data');?>" size="35">
								<span class="upload" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg;*.png;*.gif;*.mpg" data-toggle="upload" data-icon="cloud-upload"></span>
								<?php if( C('app_simg',null,'data') != '' ){ echo '<a target="_blank" href="'.C('app_simg',null,'data').'">คลิ๊กเพื่อดูรูปภาพ</a>';}?>
		                    </td>
		                   <td>
		                        <b>ไอคอน : </b>
		                        <input type="text" id="app_ico" name="app[app_ico]" value="<?php echo C('app_ico',null,'data');?>" size="35">
								<span class="upload" data-uploader="index.php?a=yes&c=upload&t=img" data-on-upload-success="<?php echo $cFun;?>upload_success" data-file-type-exts="*.jpg;*.png;*.gif;*.mpg" data-toggle="upload" data-icon="cloud-upload"></span>
								<?php if( C('app_ico',null,'data') != '' ){ echo '<a target="_blank" href="'.C('app_ico',null,'data').'">คลิ๊กเพื่อดูรูปภาพ</a>';}?>
		                    </td>
		                </tr>     
		                <tr>
		                    <td>
		                        <b>ผู้พัฒนา : </b>
		                        <input data-rule="required;" data-url="index.php?a=yes&c=app.firms&t=search&st=a&rt=key" data-toggle="autocomplete" name="firms[a]" type="text" class="input-text" value="<?php echo C('au_name',null,'data');?>">
		                    </td>
		                    <td>
		                        <b>ผู้ให้บริการ : </b>
		                        <input data-url="index.php?a=yes&c=app.firms&t=search&st=o&rt=key" data-toggle="autocomplete" name="firms[o]" type="text" class="input-text" value="<?php echo C('pa_name',null,'data');?>">
		                    </td>
		                </tr>

		                <tr>
		                    <td colspan="2">
		                        <b>รองรับภาษาไทย : </b>
		                        <select data-toggle="selectpicker" name="app[app_tocn]">
                                    <option value="0" <?php if(C('app_tocn',null,'data') == '0'){ echo 'selected=""';}?>>ยังไม่รองรับ</option>
                                    <option value="1" <?php if(C('app_tocn',null,'data') == '1'){ echo 'selected=""';}?>>รองรับ</option>
                                </select>
		                        <b style="margin-left: 150px">รูปแบบภาษา : </b>
								<input name="app[app_lid]" type="hidden" value="<?php echo C('app_lid',null,'data');?>">
								<input name="app[app_lid_text]" type="hidden" value="<?php echo C('app_lid_text',null,'data');?>">
		                        <select data-toggle="selectpicker" data-width="120" class="multiple" multiple data-name="app_lid">
			                        <?php 
								    foreach ($lAttrArr as $k=>$v)
								    {
										$checked = '';
										if( in_array($v['attr_id'],str::StrToArr($data['app_lid'])) )
										{
											$checked = 'selected';
										}
								    	echo '<option value="'.$v['attr_id'].'" '.$checked.'>'.$v['attr_name'].'</option>';
								    }
								    ?>
                                </select>
		                        <b style="margin-left: 150px">ค่าธรรมเนียม : </b>
								<input name="app[app_cid]" type="hidden" value="<?php echo C('app_cid',null,'data');?>">
								<input name="app[app_cid_text]" type="hidden" value="<?php echo C('app_cid_text',null,'data');?>">
		                        <select data-toggle="selectpicker" data-width="120" class="multiple" multiple data-name="app_cid">
			                        <?php 
								    foreach ($cAttrArr as $k=>$v)
								    {
										$checked = '';
										if( in_array($v['attr_id'],str::StrToArr($data['app_cid'])) )
										{
											$checked = 'selected';
										}
								    	echo '<option value="'.$v['attr_id'].'" '.$checked.'>'.$v['attr_name'].'</option>';
								    }
								    ?>
                                </select>
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="2">
		                        <b>เวอร์ชั่น : </b>
		                        <input type="text" name="app[app_ver]" size="7" data-rule="required" value="<?php echo C('app_ver',null,'data');?>">
		                    
		                        <b style="margin-left: 150px">ขนาด : </b>
		                        <input type="text" name="app[app_size]" size="6" data-rule="required" value="<?php echo C('app_size',null,'data');?>"> M
		                    
		                        <b style="margin-left: 148px">ระบบปฏิบัติการ : </b>
								<input name="app[app_paid]" type="hidden" value="<?php echo C('app_paid',null,'data');?>">
								<input name="app[app_paid_text]" type="hidden" value="<?php echo C('app_paid_text',null,'data');?>">
		                        <select data-toggle="selectpicker" data-width="120" class="multiple" multiple data-name="app_paid">
			                        <?php 
								    foreach ($pAttrArr as $k=>$v)
								    {
										$checked = '';
										if( in_array($v['attr_id'],str::StrToArr($data['app_paid'])) )
										{
											$checked = 'selected';
										}
								    	echo '<option value="'.$v['attr_id'].'" '.$checked.'>'.$v['attr_name'].'</option>';
								    }
								    ?>
                                </select>
                                
		                        <b style="margin-left: 150px">ความต้องการระบบ : </b>
		                        <input type="text" name="app[app_osver]" size="7" data-rule="required" value="<?php echo C('app_osver',null,'data');?>">
		                    </td>
		                </tr>   
		                <tr>
		                   <td colspan="2">
		                        <b>ป้ายกำกับ : </b>
		                        <input type="text"  name="app[app_tags]" size="40" value="<?php echo C('app_tags',null,'data');?>">
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="2">
		                        <b>ข้อมูลโดยย่อ : </b>
		                        <textarea cols="70" rows="1" name="app[app_info]" data-toggle="autoheight"><?php echo C('app_info',null,'data');?></textarea>
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="2">
		                    <b>ภาพหน้าจอ</b>
							<div class="formControls">
								<div class="uploader-list-container"> 
									<div class="queueList">
										<div id="<?php echo $cFun.$type;?>dndArea" class="placeholder <?php if($type == 'edit'){echo ' element-invisible';}?>">
											<div id="<?php echo $cFun.$type;?>filePicker-2"></div>
											<p>หรือลากรูปภาพมาที่นี่ อัปโหลดได้สูงสุด 30 รูป</p>
										</div>
										<?php
										if($type == 'edit' && $picArr)
										{
											$size = '0';
											echo '<ul class="filelist">';
											foreach ($picArr as $k=>$v)
											{
												$size = $size+$v['upload_size'];
												echo '<li class="state-complete">
														<div class="del" onClick="DelWebUpload(this)" data-id='.$v['upload_id'].'></div>
														<p class="imgWrap"><img style="border-radius:5px" src="'.$v['upload_img'].'" width="160" height="160"></p>
														<p class="progress" style="display: none;"><span style="display: none; width: 0px;"></span></p>
														<p class="alt">
														<input type="hidden" value="'.$v['upload_img'].'" name="pic[src]['.$v['upload_id'].']">
														<input type="text" size="16" class="form-control" placeholder="โปรดกรอกคำอธิบาย" value="'.$v['upload_alt'].'" name="pic[alt]['.$v['upload_id'].']"></p>
														<span class="success"></span>
		        										<div class="file-panel"><span class="cancel">ลบ</span><span class="rotateRight">หมุนขวา</span><span class="rotateLeft">หมุนซ้าย</span></div>
		        										</li>';
											}
											echo '</ul>';
										}
										?>
	
									</div>
									<div class="statusBar" <?php if($type == 'add'){echo 'style="display:none;"';}?> >
										<div class="progress l"> <span class="text">0%</span> <span class="percentage"></span> </div>
										<div class="info"></div>
										<div class="btns">
											<div id="<?php echo $cFun.$type;?>filePicker2"></div>
											<!-- <div class="uploadBtn">开始上传</div> -->
										</div>
									</div>
								</div>
							 </div>
		                    </td>
		                </tr>
		                
		                <tr>
		                   <td colspan="2">
		                        <b>แหล่งดาวน์โหลดที่ 1 : </b>
		                        <input type="text"  name="app[app_down1]" size="40" value="<?php echo C('app_down1',null,'data');?>">
								<span class="upload" data-file-type-exts="*" data-uploader="index.php?a=yes&c=upload&t=file" data-on-upload-success="<?php echo $cFun;?>upload_success" data-toggle="upload" data-icon="cloud-upload"></span>
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="2">
		                        <b>แหล่งดาวน์โหลดที่ 2 : </b>
		                        <input type="text"  name="app[app_down2]" size="40" value="<?php echo C('app_down2',null,'data');?>">
								<span class="upload" data-file-type-exts="*" data-uploader="index.php?a=yes&c=upload&t=file" data-on-upload-success="<?php echo $cFun;?>upload_success" data-toggle="upload" data-icon="cloud-upload"></span>
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="2">
		                        <b>แหล่งดาวน์โหลดที่ 3 : </b>
		                        <input type="text"  name="app[app_down3]" size="40" value="<?php echo C('app_down3',null,'data');?>">
								<span class="upload" data-file-type-exts="*" data-uploader="index.php?a=yes&c=upload&t=file" data-on-upload-success="<?php echo $cFun;?>upload_success" data-toggle="upload" data-icon="cloud-upload"></span>
		                    </td>
		                </tr>
		                
		                <tr>
		                   <td colspan="2">
		                        <b>เนื้อหา : </b>
		                        <div class="wm_form_content_box">
									<?php echo Ueditor('width: 90%;height:300px' , 'app[app_content]' , C('app_content',null,'data') , 'editor.app');?>
		                        </div>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
		       </div>

		       <div class="tab-pane fade" id="<?php echo $cFun.$type;?>senior">
		       		<table class="table table-condensed table-hover" width="100%">
		            <tbody>
		            	<tr>
						  <td><b>เข้าชม :</b>
							<input size="7" name="app[app_read]" value="<?php echo C('app_read',null,'data');?>">
					     </td>
						  <td><b>ความคิดเห็น : </b>
							<input size="7" name="app[app_replay]" value="<?php echo C('app_replay',null,'data');?>">
					      </td>
						  <td><b> ชอบ : </b>
							<input size="7" name="app[app_ding]" value="<?php echo C('app_ding',null,'data');?>">
					      </td>
						  <td><b> ไม่ชอบ : </b>
							<input size="7" name="app[app_cai]" value="<?php echo C('app_cai',null,'data');?>">
					      </td>
						  <td><b> ระดับดาว : </b>
							<input size="7" name="app[app_start]" value="<?php echo C('app_start',null,'data');?>">
					      </td>
						  <td><b> คะแนน : </b>
							<input size="7" name="app[app_score]" value="<?php echo C('app_score',null,'data');?>">
					      </td>
						</tr>
		            	<tr>
						  <td colspan="6"><b>จำนวนดาวน์โหลด : </b>
							<input size="7" name="app[app_downnum]" value="<?php echo C('app_downnum',null,'data');?>">
					     </td>
						</tr>
		            	<tr>
						  <td colspan="6"><b>วันที่เผยแพร่ : </b>
							<input type="text" name="app[app_addtime]" value="<?php echo date('Y-m-d H:i:s',C('app_addtime',null,'data'));?>" data-toggle="datepicker" data-pattern="yyyy-MM-dd H:m:s" size="19">
					     </td>
						</tr>
		            </tbody>
		        </table>
		       </div>
		       
		       <div class="tab-pane fade" id="<?php echo $cFun.$type;?>field">
					<table class="table table-border table-bordered table-bg table-sort"></table>
			   </div>
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
pageCFun = '<?php echo $cFun.$type;?>';
pageModule = 'app';
pageCid = '<?php echo $id;?>';
//页面唯一op获取函数
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}
//上传封面
function <?php echo $cFun;?>upload_success(file,json,$element){
	json = $.parseJSON(json);
	if ( json.statusCode == 300){
		$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	}else{
		val = json.data.path.replace('../',"/");
		$element.siblings('input').val(val);
	}
}
//页面唯一回调函数
function <?php echo $cFun;?>(json){
	var op = appAppListGetOp();
	var tabid = 'app-app-list';
	op['id'] = tabid;
	
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).navtab("reload",op);	// 刷新Tab页面
    $(this).navtab("switchTab",tabid);	// 切换Tab页面
}
//选择事件
function <?php echo $cFun.$type;?>S_NodeCheck(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj(treeId),
        nodes = zTree.getCheckedNodes(true)
    var ids = '', names = ''
    
    for (var i = 0; i < nodes.length; i++) {
        ids   += ','+ nodes[i].id
        names += ','+ nodes[i].name
    }
    if (ids.length > 0) {
        ids = ids.substr(1), names = names.substr(1)
    }
    
    var $from = $('#'+ treeId).data('fromObj')
    
    $("#<?php echo $cFun.$type;?>type_id").val(ids);
    if ($from && $from.length) $from.val(names)
}
//单击事件
function <?php echo $cFun.$type;?>S_NodeClick(event, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj(treeId)
    zTree.checkNode(treeNode, !treeNode.checked, true, true)
    event.preventDefault()
}
//自定义字段回调
function <?php echo $cFun.$type;?>getfield(json){
	var html='';
	if( json.data ){
		var option = json.data;
		for(var i=0;i<option.length;i++){
			html += '<tr><td valign="top" width="150"><b>'+option[i]['title']+'：</b></td>'+
			      '<td valign="top">'+option[i]['form']+'</td></tr>';
		}
	}else{
		html ='<tr><td valign="top"><b>โปรดเพิ่มฟิลด์ที่กำหนดเองก่อน!</b></td></tr>';
	}
	$("#<?php echo $cFun.$type;?>field table").html(html);
	$("#<?php echo $cFun.$type;?>field table").trigger('bjui.initUI');
}

//自定义字段获取
$("#<?php echo $cFun.$type;?>field_tab").click(function(){
	var cid = $("#<?php echo $cFun.$type;?>_cid").val();
	var tid = $("#<?php echo $cFun.$type;?>type_id").val();

	if( tid == '' ){
		$(this).alertmsg('error', 'ขออภัย! โปรดเลือกหมวหมู่ก่อน');
		return false;
	}else{
		var op = new Array();
		op['type'] = 'GET';
		op['url'] = 'index.php?a=yes&c=system.config.field&ft=2&t=getfield&module=<?php echo $curModule?>&tid='+tid+'&cid='+cid;
		op['callback'] = '<?php echo $cFun.$type;?>getfield';
		$(this).bjuiajax('doAjax', op);
	}
});


$(".multiple").change(function(){
	var val = $(this).val();
	var name = $(this).data('name');
	var text = "";
	var obj = $(this).find("option:selected");
	for(var i=0;i<obj.length;i++){
		if(i==0){
			text = obj[i].innerText;
		}else{
			text = text+','+obj[i].innerText;
		}
	}
	$('[name=app\\['+name+'\\]]').val(val);
	$('[name=app\\['+name+'_text\\]]').val(text);
})
</script>
<script type="text/javascript" src="/files/js/webupload/webuploader.min.js"></script> 
<script type="text/javascript" src="<?php echo $tempPath;?>/BJUI/js/webupload.js"></script> 
<script>
$(".info").html('ทั้งหมด <?php echo count($picArr);?> รูป （<?php echo $size/1000;?>KB）');
</script>