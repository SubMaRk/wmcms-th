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
      <td valign="top"><?php echo $data['media_id'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>บัญชีทางการที่สังกัด:</b></td>
      <td valign="top"><?php echo $data['account_name'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>ชื่อสื่อ:</b></td>
      <td valign="top"><?php echo $data['media_filename'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>ประเภทสื่อ:</b></td>
      <td valign="top"><?php echo $mediaMod->type[$data['media_type']];?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลาอัปโหลดสื่อ:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" ,$data['media_time']);?></td>
	</tr>
    <tr>
      <td valign="top"><b>พาธสื่อ:</b></td>
      <td valign="top"><?php echo $data['media_filepath'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>id สื่อ WeChat:</b></td>
      <td valign="top" style="word-wrap:break-word; word-break:break-all;"><?php echo $data['media_media_id'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>มีสื่อถาวรหรือไม่:</b></td>
      <td valign="top"><?php echo $data['media_islong'] == 1?'สื่อถาวร':'临时素材';?></td>
	</tr>
	<?php 
	//文本
	if( $data['media_type'] == 'image' )
	{
		echo '<tr>
			<td valign="top"><b>素材宽*高：</b></td>
			<td valign="top">'.$data['media_width'].'*'.$data['media_height'].'</td>
			</tr>';
	}
	?>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>