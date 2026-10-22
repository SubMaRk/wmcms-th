<style>
.table tr {
    height: 35px;
}
thead th {
	text-align: center;
}
#<?php echo $cFun;?>List td{text-align: center;}
</style>
<div class="bjui-pageHeader">
	<div class="row cl pt-10 pb-10 pl-10">
		<div class="f-l">
			<form id="pagerForm" name="<?php echo $cFun;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="index.php?c=system.config.msg.list" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน : </span>
				<select data-toggle="selectpicker" id="module" name="module" data-width="100">
                	<option value="">โมดูลทั้งหมด</option>
                	<?php
                	foreach ($moduleList as $k=>$v)
                	{
                		$checked = str::CheckElse( $k , $module , 'selected=""' );
                		echo '<option value="'.$k.'" '.$checked.'>'.$v.'</option>';
                	}
                	?>
                </select>
                <input type="text" placeholder="โปรดกรอกไอดีเทมเพลตข้อความ" name="key" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">ค้นหา</button>
				<a id="<?php echo $cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a> &nbsp;
            	<a class="btn btn-secondary radius size-MINI" data-toggle="dialog" data-mask="true" data-title="เพิ่มเทมเพลตข้อความ" href="index.php?d=yes&c=system.config.msg.edit&t=add" data-width="720" data-height="600" ><i class="fa fa-plus"></i> เพิ่มเทมเพลตข้อความ</a> &nbsp;
            	<a href="index.php?a=yes&c=system.config.msg&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="คุณต้องการลบรายการที่เลือกหรือไม่?" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			</form>
		</div>
	</div>
</div>

<div class="bjui-pageContent" id="<?php echo $cFun;?>List">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="8%" data-order-field="temp_id">ไอดี</th>
				<th>ชื่อ</th>
	            <th width="20%">โมดูล</th>
				<th width="20%">ไอดี</th>
	            <th width="15%">ดำเนินการ</th>
	            </tr>
			</thead>
			
			<tbody>
			<?php
			if( $dataArr )
			{
				$i = 1;
				foreach ($dataArr as $k=>$v)
				{
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['temp_id'].'"></td>
							<td>'.$v['temp_id'].'</td>
							<td>'.$v['temp_name'].'</td>
							<td>'.$moduleList[$v['temp_module']].'</td>
							<td>'.$v['temp_key'].'</td>
							<td style="text-align: center;">
				            	<a class="btn btn-secondary radius size-MINI" data-mask="true" href="index.php?d=yes&c=system.config.msg.edit&t=edit&id='.$v['temp_id'].'"  data-toggle="dialog" data-title="แก้ไขข้อมูลเทมเพลตข้อความ" data-width="720" data-height="600" >แก้ไข</a> 
				            	<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['temp_id'].')">ลบ</a>
                			</td>
						</tr>';
					$i++;
				}
			}
			else
			{
				echo '<script type="text/javascript">$(document).ready(function(){$(this).alertmsg("info", "ไม่มีข้อมูล!")});</script>';
			}
			?>
			</tbody>
		</table>
</div>

<div class="bjui-pageFooter">
    <div class="pages">
        <span>ต่อหน้า&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
            </select>
        </div>
        <span>&nbsp;รายการจากทั้งหมด <?php echo $total;?> รายการ</span>
    </div>
    <div id="asd" class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>">
    </div>
</div>

<script type="text/javascript">
//页面唯一op获取函数
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}
//删除数据
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=system.config.msg&t=del";
	ajaxOptions['confirmMsg'] = "คุณต้องการลบข้อมูลที่เลือกหรือไม่?";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//页面唯一回调函数
function <?php echo $cFun;?>ajaxCallBack(json){
	$(this).bjuiajax("ajaxDone",json);//显示处理结果
	$(this).dialog("closeCurrent");	//关闭当前dialog
	$(this).navtab("reload",<?php echo $cFun;?>GetOp());	//刷新当前Tab页面 
}


$(document).ready(function(){
	$('#module').change(function() {
		$("[name=<?php echo $cFun;?>Form]").submit();
	});
	$('#<?php echo $cFun;?>refresh').click(function() {
	   $(this).navtab("reload",<?php echo $cFun;?>GetOp());// 刷新当前Tab页面
	});
});
</script>