<div class="bjui-pageContent">	                       
    <form action="index.php?a=yes&c=user.msg&t=send" data-reload="false" data-toggle="validate" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
		<fieldset>
			<legend>发送内信</legend>
    		<table class="table table-border table-bordered table-bg table-sort">
	            <tbody>
	                <tr>
	                    <td colspan="5">
	                        <b>ไอดีผู้ใช้ : </b>
	                        <input type="text" name="uid" value="<?php echo $uid?>" data-rule="required">
	                        (0 ส่งให้ผู้ใช้ทั้งหมด; ใช้ ',' แยกหากมีผู้ใช้หลายคน)
	                    </td>
	                </tr>
	                <tr>
	                   <td>
	                        <b>เนื้อหาข้อความ : </b>
							<?php echo Ueditor('height:200px' , 'content', '','editor.user_msg');?>
	                   </td>
	                </tr>
	            </tbody>
	        </table>
		</fieldset>
	</form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">จัดเก็บ</button></li>
    </ul>
</div>