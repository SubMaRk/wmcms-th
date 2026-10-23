<div class="bjui-pageContent">
<form action="index.php?a=yes&c=data.file&t=rename" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
<input type="hidden" name="path" value="<?php echo $path;?>">
<table class="table table-border table-bordered table-bg table-sort">
    <tr>
      <td valign="top" width="100"><b>ชื่อเดิม:</b></td>
      <td valign="top"><input name="oldname" readonly="true" type="text" class="input-text" value="<?php echo $name;?>"></td>
	</tr>
    <tr>
      <td valign="top"><b>ชื่อใหม่:</b></td>
      <td valign="top"><input name="newname" type="text" class="input-text" data-rules="required"></td>
	</tr>
</table>
</form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close btn btn-danger"><i class="fa fa-times"></i> ปิด</button></li>
        <li><button type="submit" class="btn btn-success"><i class="fa fa-floppy-o"></i> ยืนยัน</button></li>
    </ul>
</div>

<script type="text/javascript">
function <?php echo $cFun;?>(json){
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).dialog("closeCurrent");//关闭
    $(this).navtab("reload");	// 刷新当前Tab页面
}
</script>