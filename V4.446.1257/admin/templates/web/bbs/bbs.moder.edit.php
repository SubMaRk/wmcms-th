<div class="bjui-pageContent">
    <form action="index.php?a=yes&c=bbs.moder&t=<?php echo $type;?>" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
	<fieldset>
		<legend>แก้ไขบอร์ดฟอรัม</legend>
            <div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>base">
			<table class="table table-border table-bordered table-bg table-sort">
			    <tr>
				  <td valign="top" width="150"><b>หมวดย่อยที่สังกัด:</b></td>
			      <td valign="top" colspan="5">
					<input name="tid" type="hidden" value="<?php echo $tid;?>">
					<input type="text" readonly value="<?php echo $tname;?>">
					</td>
				</tr>
				<tr>
					<td valign="top"><b>UID ผู้ดูแลบอร์ด[คั่นด้วย,]:</b></td>
					<td valign="top"><input name="uids"  size="30" type="text" class="input-text" value="<?php echo $uids;?>"></td>
				</tr>
			</table>
		</div>
	</fieldset>
	</form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">บันทึก</button></li>
    </ul>
</div>


<script>
function <?php echo $cFun;?>(json){
	var op = bbsTypeListGetOp();
	var tabid = 'bbs-type-type';
	op['id'] = tabid;

	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).navtab("reload",op);	// 刷新Tab页面
    $(this).dialog("closeCurrent");//关闭
}
</script>
