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
      <td valign="top" width="190"><b>ID บันทึก:</b></td>
      <td valign="top"><?php echo $data['fans_id'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>บัญชีทางการที่สังกัด:</b></td>
      <td valign="top"><?php echo $data['account_name'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>Openid ผู้ใช้:</b></td>
      <td valign="top"><?php echo $data['fans_openid'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>Unionid ผู้ใช้:</b></td>
      <td valign="top"><?php echo $data['fans_unionid'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>สถานะการติดตาม：</b></td>
      <td valign="top"><?php echo $fansMod->subscribe[$data['fans_subscribe']];?></td>
	</tr>
    <tr>
      <td valign="top"><b>รูปโปรไฟล์แฟนคลับ:</b></td>
      <td valign="top"><img src="<?php echo $data['fans_headimgurl'];?>"/></td>
	</tr>
    <tr>
      <td valign="top"><b>ชื่อแฟนคลับ:</b></td>
      <td valign="top"><?php echo $data['fans_nickname'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>เพศ:</b></td>
      <td valign="top"><?php echo $fansMod->sex[$data['fans_sex']];?></td>
	</tr>
    <tr>
      <td valign="top"><b>ภูมิภาคแฟนคลับ:</b></td>
      <td valign="top"><?php echo $data['fans_country'].' - '.$data['fans_province'].' - '.$data['fans_city'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>ข้อมูลหมายเหตุ:</b></td>
      <td valign="top"><?php echo $data['fans_remark'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>ข้อมูลอื่น ๆ：</b></td>
      <td valign="top" style="word-wrap:break-word; word-break:break-all;"><?php echo $data['fans_json'];?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลาติดตาม：</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" ,$data['fans_subscribe_time']);?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลายกเลิกติดตาม:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" ,$data['fans_unsubtime']);?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลาเข้าคลัง：</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" ,$data['fans_time']);?></td>
	</tr>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>