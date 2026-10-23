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
      <td valign="top" width="200"><b>ID บันทึก:</b></td>
      <td valign="top"><?php echo $data['msg_id'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>บัญชีทางการที่สังกัด:</b></td>
      <td valign="top"><?php echo $data['account_name'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>ผู้ใช้ที่ส่งข้อความ:</b></td>
      <td valign="top"><?php echo $data['account_name'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>ประเภทข้อความ:</b></td>
      <td valign="top"><?php echo $msgMod->msgType[$data['msg_type']];?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลาส่งข้อความผู้ใช้:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" ,$data['msg_time']);?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลาตอบกลับข้อความเว็บไซต์:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" ,$data['msg_sendtime']);?></td>
	</tr>
    <tr>
      <td valign="top"><b>เนื้อหาตอบกลับเว็บไซต์:</b></td>
      <td valign="top"><?php echo str::DelHtml($data['msg_send']);?></td>
	</tr>
	<?php 
	if( $data['msg_type'] == 'event' )
	{
		echo '<tr>
			<td valign="top"><b>接受消息：</b></td>
			<td valign="top">'.str::DelHtml($data['msg_get']).'</td>
			</tr>';
	}
	else
	{
		//文本
		if( $data['msg_type'] == 'text' )
		{
			echo '<tr>
				<td valign="top"><b>接受消息内容：</b></td>
				<td valign="top">'.$data['msg_content'].'</td>
				</tr>';
		}
		//图片
		if( $data['msg_type'] == 'image' )
		{
			echo '<tr>
				<td valign="top"><b>接受消息图片：</b></td>
				<td valign="top"><a href="'.$data['msg_picurl'].'" target="_blank">点击查看图片</a></td>
				</tr>';
		}
		//语音
		if( $data['msg_type'] == 'voice' )
		{
			echo '<tr>
				<td valign="top"><b>语音识别内容：</b></td>
				<td valign="top">'.$data['msg_recognition'].'</td>
				</tr>';
		}
		//超链接
		if( $data['msg_type'] == 'link' )
		{
			echo '<tr>
				<td valign="top"><b>链接URL：</b></td>
				<td valign="top"><a href="'.$data['msg_url'].'">'.$data['msg_url'].'</a></td>
				</tr>';
		}
		?>
	    <tr>
	      <td valign="top"><b>ข้อมูลอื่น ๆ：</b></td>
	      <td valign="top"><?php echo $data['msg_attr'];?></td>
		</tr>
	    <tr>
	      <td valign="top"><b>ID คลังสื่อ WeChat:</b></td>
	      <td valign="top" style="word-wrap:break-word; word-break:break-all; "><?php echo $data['msg_media_id'];?></td>
		</tr>
	<?php }?>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>