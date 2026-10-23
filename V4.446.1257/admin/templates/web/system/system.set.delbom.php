<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.set.delbom&t=delbom" method="post" data-reload="false" data-toggle="validate">
	<fieldset>
		<legend>ลบ BOM ของไฟล์</legend>
    	<table class="table table-border table-bordered table-bg table-sort">
	      	<tr>
        		<td width="30%"><b>เลือกโฟลเดอร์</b><br />
				<span class="STYLE2">โฟลเดอร์ที่ต้องลบ BOM(ใช้ได้หากเทมเพลตมีบรรทัดว่างด้านบน)</span></td>
                <td>
                	<select data-toggle="selectpicker" name="path">
	                	<?php
	                	$floder = file::FloderList(WMTEMPLATE,array('ajax','site','system'));
	                	foreach ($floder as $k=>$v)
	                	{
	                		echo '<option value="'.$v['file'].'">'.$v['file'].'</option>';
	                	}
	                	?>
                	</select>
                </td>
            </tr>
	      	<tr>
                <td colspan="2">
               		<button type="submit" class="btn-secondary">ยืนยันการลบ</button>
                </td>
            </tr>
		</table>
	</fieldset>
	</form>
</div>