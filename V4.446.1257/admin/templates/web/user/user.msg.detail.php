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
      <td valign="top" width="150"><b>ID ข้อความ:</b></td>
      <td valign="top"><?php echo $data['msg_id']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>สถานะข้อมูล：</b></td>
      <td valign="top"><?php echo $data['msg_status']==0?'未读':'已读'?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>ผู้ใช้ที่ส่ง:</b></td>
      <td valign="top"><?php echo $data['msg_fuid']==0?'ระบบ':$data['f_nickname'];echo'（ID：'.$data['msg_fuid'];?>）</td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>ผู้ใช้ผู้รับ:</b></td>
      <td valign="top"><?php echo $data['t_nickname'].'（ID：'.$data['msg_tuid'];?>）</td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>เนื้อหาข้อความ:</b></td>
      <td valign="top"><pre><?php echo $data['msg_content']?></pre></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>เวลาส่งข้อความ:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" , $data['msg_time'])?></td>
	</tr>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>