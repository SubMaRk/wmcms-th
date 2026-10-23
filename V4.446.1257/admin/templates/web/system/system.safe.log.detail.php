<?php
if( !is_array($data) )
{
	echo '<script type="text/javascript">$(document).ready(function(){$(this).alertmsg("info", "对不起，没有此条数据!");$(this).dialog("closeCurrent");});</script>';
	exit;
}
?>
<div class="bjui-pageContent">
<table class="table table-border table-bordered table-bg table-sort">
    <tr>
      <td valign="top" width="150"><b>ID บันทึก:</b></td>
      <td valign="top"><?php echo $data['login_id']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>บัญชีเข้าสู่ระบบ:</b></td>
      <td valign="top"><?php echo $data['manager_name']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>สถานะเข้าสู่ระบบ:</b></td>
      <td valign="top"><?php echo $data['login_status_text']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>ข้อมูลหมายเหตุ:</b></td>
      <td valign="top"><?php echo $data['login_remark']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>IP เข้าสู่ระบบ:</b></td>
      <td valign="top"><?php echo $data['login_ip']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>เวลาเข้าสู่ระบบ:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" , $data['login_time'])?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>ประเภทเบราว์เซอร์:</b></td>
      <td valign="top"><?php echo $data['login_browser']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>UA เบราว์เซอร์:</b></td>
      <td valign="top"><?php echo $data['login_ua']?></td>
	</tr>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>