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
      <td valign="top"><?php echo $data['operation_id']?></td>
	</tr>
    <tr>
      <td valign="top"><b>ผู้ดูแลระบบ:</b></td>
      <td valign="top"><?php echo $data['manager_name']?></td>
	</tr>
    <tr>
      <td valign="top"><b>โมดูลของการดำเนินการ:</b></td>
      <td valign="top"><?php echo $data['operation_module']?></td>
	</tr>
    <tr>
      <td valign="top"><b>ประเภทของการดำเนินการ:</b></td>
      <td valign="top"><?php echo $data['operation_type']?></td>
	</tr>
    <tr>
      <td valign="top"><b>หมายเหตุของการดำเนินการ:</b></td>
      <td valign="top"><?php echo $data['operation_remark']?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลาของการดำเนินการ:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" ,$data['operation_time'])?></td>
	</tr>
    <tr>
      <td valign="top"><b>ตารางที่ดำเนินการ:</b></td>
      <td valign="top"><?php echo $data['operation_table']?></td>
	</tr>
    <tr>
      <td valign="top"><b>ข้อมูลที่ดำเนินการ:</b></td>
      <td valign="top">
      <?php
      if( $operation )
      {
      	foreach ( $operation as $key=>$val)
      	{
      		echo '修改【'.$val[0][0].'】等于【'.$val[0][1].'】的数据：<br/>';
      		if( is_array(GetKey($val,'1')) )
      		{
	      		foreach ( $val[1] as $k=>$v)
	      		{
	      			echo '将字段【'.$v[0].'】的值修改为【'.$v[1].'】<br/>';
	      		}
	      		echo '<br/>';
      		}
      	}
      }
      ?>
      </td>
	</tr>
    <tr>
      <td valign="top"><b>มิเรอร์ของข้อมูล:</b></td>
      <td valign="top"><?php echo $data['operation_backdata']?></td>
	</tr>
    <tr>
      <td valign="top"><b>เวลาคำขอ:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" , $data['operation_time'])?></td>
	</tr>
    <tr></tr>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
        <li><button type="submit" class="btn-green" data-icon="save" disabled>ย้อนคืนข้อมูล</button></li>
    </ul>
</div>