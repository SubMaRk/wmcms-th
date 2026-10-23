<div class="bjui-pageContent">
    <form action="index.php?a=yes&c=operate.weixin.autoreply&t=copy" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
		<input name="rid" type="hidden" class="input-text" value="<?php echo $rid;?>">
		<fieldset>
			<legend>คัดลอกการตอบกลับอัตโนมัติ</legend>
            <div class="tab-pane fade active in">
				<table class="table table-border table-bordered table-bg table-sort">
					<tr>
					    <td valign="top" width="30%">
					    	<b>คัดลอกไปยัง:</b>
	                        <select data-toggle="selectpicker" name="aid">
							<?php 
	                        if( $data )
	                        {
		                        foreach ($data as $k=>$v)
		                        {
		                        	echo '<option value="'.$v['account_id'].'">'.$v['account_name'].'</option>';
		                        }
	                        }
	                        ?>
	                        </select>
                        </td>
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
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).dialog("closeCurrent");//关闭
    $(this).navtab("reload",operateWeixinAutoreplyListGetOp());	// 刷新当前Tab页面
    
}
</script>