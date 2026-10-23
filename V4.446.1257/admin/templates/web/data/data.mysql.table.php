<div class="bjui-pageContent">

<table class="table table-border table-bordered table-hover table-bg table-sort">
<thead>
  <tr>
    <th width="20%"><strong>ชื่อตาราง</strong></th>
    <th width="8%"><strong>ปริมาณข้อมูล</strong></th>
    <th width="10%"><strong>ขนาดข้อมูล</strong></th>
    <th width="10%"><strong>ข้อมูลซ้ำซ้อน</strong></th>
    <th width="10%"><strong>ภาษา</strong></th>
    <th width="15%"><strong>เวลาสร้าง</strong></th>
    <th width="15%"><strong>ดำเนินการ</strong></th>
    
  </tr>
</thead>

<?php
if( $tableArr )
{
	foreach ($tableArr as $k=>$v)
	{
		echo '<tr>
			   <td>'.$v['Name'].'</td>
			   <td>'.$v['Rows'].'条</td>
			   <td>'.($v['Data_length']/1000).' Kb</td>
			   <td>'.($v['Data_free']/1000).' Kb</td>
			   <td>'.$v['Collation'].'</td>
			   <td>'.$v['Create_time'].'</td>
			   <td>
			   		<a data-toggle="doajax" data-confirm-msg="ยืนยัน要优化吗？" class="optimize btn btn-success radius size-MINI" href="index.php?a=yes&c=data.mysql&t=optimize&table='.$v['Name'].'">优化表</a>
					<a data-toggle="doajax" data-confirm-msg="ยืนยัน要修复吗？" class="optimize btn btn-warning radius size-MINI" href="index.php?a=yes&c=data.mysql&t=repair&table='.$v['Name'].'">修复表</a>
			   </td>
			</tr>';
	}
}
?>
</table>
</div>

<script type="text/javascript">
//页面唯一op获取函数
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}

function <?php echo $cFun;?>Ref(json){
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).navtab("reload");	// 刷新当前Tab页面
}
</script>
