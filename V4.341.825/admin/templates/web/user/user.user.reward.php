<div class="bjui-pageContent">
<form action="index.php?a=yes&c=user.user&t=reward" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
<input type="hidden" name="id" value="<?php echo $id;?>">
<table class="table table-border table-bordered table-bg table-sort">
    <tr>
      <td valign="top" width="100"><b>ประเภทรางวัล/บทลงโทษ : </b></td>
      <td valign="top">
      	<select data-toggle="selectpicker" name="settype" id="<?php echo $cFun;?>settype">
      		<option value="1">รางวัล</option>
      		<option value="0">ลงโทษ</option>
      	</select>
      </td>
      <td valign="top" width="100"><b>เหตุผลการให้รางวัล/ลงโทษ : </b></td>
      <td valign="top" colspan="3"><input name="remark" type="text" class="input-text" value="รางวัลจากระบบ!"></td>
	</tr>
    <tr>
    	<td valign="top" width="100"><b>รางวัล/ลงโทษ<?php echo $userConfig['money_name']?>：</b></td>
      <td valign="top"><input name="money" type="text" class="input-text" data-rules="required;digits" value="0" size="5"></td>
      <td valign="top" width="100"><b>รางวัล/ลงโทษ<?php echo $userConfig['gold1_name']?>：</b></td>
      <td valign="top"><input name="gold1" type="text" class="input-text" data-rules="required;digits" value="0" size="5"></td>
      <td valign="top"><b>รางวัล/ลงโทษ<?php echo $userConfig['gold2_name']?>：</b></td>
      <td valign="top"><input name="gold2" type="text" class="input-text" data-rules="required;digits" value="0" size="5"></td>
	</tr>
</table>
</form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close btn btn-danger"><i class="fa fa-times"></i> ยกเลิก</button></li>
        <li><button type="submit" class="btn btn-success"><i class="fa fa-floppy-o"></i> จัดเก็บ</button></li>
    </ul>
</div>

<script type="text/javascript">
//页面唯一回调函数
function <?php echo $cFun;?>(json){
	var op = userUserListGetOp();
	var tabid = 'user-list';
	op['id'] = tabid;
	if( json.statusCode == '300' ){
		$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	}else{
		$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	    $(this).navtab("reload",op);	// 刷新Tab页面
	    $(this).navtab("switchTab",tabid);	// 切换Tab页面
	}
}

$(document).ready(function(){
	$("#<?php echo $cFun;?>settype").change(function(){
		if( $(this).val() == 1){
			$("[name=remark]").val('รางวัลจากระบบ!');
		}else{
			$("[name=remark]").val('บทลงโทษจากระบบ!');
		}
	});
});
</script>