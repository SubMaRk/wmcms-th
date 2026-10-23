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
      <td valign="top" width="150"><b>ID：</b></td>
      <td valign="top"><?php echo $data['log_id']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>สถานะการส่ง:</b></td>
      <td valign="top"><?php echo $emailMod->logStatus[$data['log_status']]?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>บัญชีผู้ส่ง:</b></td>
      <td valign="top"><?php echo $data['log_sender']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>บัญชีผู้รับ:</b></td>
      <td valign="top"><?php echo $data['log_receive']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>หัวข้ออีเมล:</b></td>
      <td valign="top"><?php echo str::Escape($data['log_title'])?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>เนื้อหาอีเมล:</b></td>
      <td valign="top"><?php echo str::Escape($data['log_content'])?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>หมายเหตุ:</b></td>
      <td valign="top"><?php echo $data['log_remark']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>เวลาสร้างงาน：</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" , $data['log_time'])?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>เวลาส่งอีเมล:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" , $data['log_sendtime'])?></td>
	</tr>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>