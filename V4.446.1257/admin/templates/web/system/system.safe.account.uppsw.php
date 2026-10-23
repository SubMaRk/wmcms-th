<div class="bjui-pageContent">
<form action="index.php?a=yes&c=system.safe.account&t=uppsw" data-reload="false" data-toggle="ajaxform" method="post" data-callback="callBack">
<table class="table table-border table-bordered table-bg table-sort">
    <tr>
      <td valign="top" width="200"><b>รหัสผ่านเดิม:</b></td>
      <td valign="top"><input name="bpsw" type="password" class="input-text"></td>
	</tr>
    <tr>
      <td valign="top"><b>รหัสผ่านใหม่:</b></td>
      <td valign="top"><input name="psw" type="password" class="input-text"></td>
	</tr>
    <tr>
      <td valign="top"><b>รหัสผ่านอีกครั้ง:</b></td>
      <td valign="top"><input name="cpsw" type="password" class="input-text"></td>
	</tr>
    <tr>
      <td valign="top" colspan="2"><button type="submit" class="btn-green" data-icon="save">ส่งข้อมูล</button></td>
	</tr>
</table>
</form>
</div>



<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">บันทึก</button></li>
    </ul>
</div>


<script>
function callBack(json){
	//$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	if (json.statusCode == 200)
	{
		alert("密码修改成功，请重新登录！");
		window.location.href="index.php?c=login"; 
	}
}
</script>