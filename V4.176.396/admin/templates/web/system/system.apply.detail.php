<?php
if( !is_array($data) )
{
	echo '<script type="text/javascript">$(document).ready(function(){$(this).alertmsg("info", "ขออภัย! ข้อมูลถูกประมวลผลไปแล้วหรือไม่มีข้อมูลอยู่และไม่สามารถเข้าถึงได้");$(this).dialog("closeCurrent");});</script>';
	exit;
}
?>
<div class="bjui-pageContent">
<table class="table table-border table-bordered table-bg table-sort">
    <tr>
      <td valign="top" width="150"><b>ชื่อฟิลด์ : </b></td>
      <td valign="top">ข้อมูลเดิม</td>
      <td valign="top">ข้อมูลใหม่</td>
	</tr>
	<?php
	foreach ($data as $k=>$v)
	{
	?>
	    <tr>
	      <td valign="top" width="150"><b><?php echo @$v['title'].'</b><br/>['.$k.']';?></td>
	      <td valign="top"><?php echo $v['old']?></td>
	      <td valign="top"><?php
	      if( $v['old'] != $v['new'])
	      {
	      	echo '【<span style="color:red">แก้ไขแล้ว</span>】';
	      }
	      echo $v['new'];
	      ?></td>
		</tr>
	<?php
	}
	?>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>
