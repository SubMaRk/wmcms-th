<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="<?php echo $cFun.$type;?>Form" action="index.php?a=yes&c=data.mysql&t=runsql" method="post" data-toggle="validate" <?php if($d) { echo 'data-callback="'.$cFun.$type.'"';}?>>
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
	<tr>
        <td colspan="2" style="color:red">หากไม่เชี่ยวชาญ MySql อย่าสั่งรันโดยพลการ มิฉะนั้นอาจเกิดความเสียหายที่กู้คืนไม่ได้!</td>
	</tr>
	<tr>
        <td width="100">เนื้อหา SQL：</td>
        <td>
			<textarea name="sql" style="width:99%;height:150px" placeholder="每行以;结束"></textarea>
		</td>
	</tr>
    </table>
  </form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close btn btn-danger"><i class="fa fa-times"></i> ปิด</button></li>
        <li><button type="submit" class="btn btn-success"><i class="fa fa-floppy-o"></i> ส่งข้อมูล</button></li>
    </ul>
</div>