<?php
if( !is_array($data) )
{
	echo '<script type="text/javascript">$(document).ready(function(){$(this).alertmsg("info", "对不起，该数据已经被处理或者数据不存在，无法进行查看！");$(this).dialog("closeCurrent");});</script>';
	exit;
}
?>
<div class="bjui-pageContent">
<table class="table table-border table-bordered table-bg table-sort">
    <tr>
      <td valign="top" width="150"><b>字段名：</b></td>
      <td valign="top">旧的数据</td>
      <td valign="top">新的数据</td>
	</tr>
	<?php 
	foreach ($data as $k=>$v)
	{
	?>
	    <tr>
	      <td valign="top" width="150"><b><?php echo GetKey($v,'title').'</b><br/>['.$k.']';?></td>
	      <td valign="top"><?php echo $v['old']?></td>
	      <td valign="top"><?php
	      if( $v['old'] != $v['new'])
	      {
	      	echo '【<span style="color:red">有修改</span>】';
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
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>