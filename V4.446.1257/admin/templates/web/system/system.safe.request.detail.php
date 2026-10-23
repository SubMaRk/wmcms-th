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
      <td valign="top" width="150"><b>ID คำขอ:</b></td>
      <td valign="top"><?php echo $data['request_id']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>ผู้ดูแลระบบ:</b></td>
      <td valign="top"><?php echo $data['manager_name']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>控制器文件：</b></td>
      <td valign="top"><?php echo $data['request_file']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>ประเภทคำขอ:</b></td>
      <td valign="top"><?php echo $data['request_type']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>ip คำขอ:</b></td>
      <td valign="top"><?php echo $data['request_ip']?></td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>พารามิเตอร์ Get：</b></td>
      <td valign="top">
	      <?php
	      if( $data['request_get'] )
	      {
		      foreach ($data['request_get'] as $k=>$v)
		      {
		      	echo '【'.$k.'】的值为：【'.print_r($v).'】<br/>';
		      }
	      }
	      ?>
      </td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>พารามิเตอร์ Post：</b></td>
      <td valign="top">
	      <?php
	      if( $data['request_post'] )
	      {
		      foreach ($data['request_post'] as $k=>$v)
		      {
		      	echo '【'.$k.'】的值为：【'.print_r($v).'】<br/>';
		      }
	      }
	      ?>
     </td>
	</tr>
    <tr>
      <td valign="top" width="150"><b>เวลาคำขอ:</b></td>
      <td valign="top"><?php echo date("Y-m-d H:i:s" , $data['request_time'])?></td>
	</tr>
</table>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
    </ul>
</div>