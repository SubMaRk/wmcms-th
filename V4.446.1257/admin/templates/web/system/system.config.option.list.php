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
			<form id="pagerForm" name="<?php echo $cFun;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="index.php?c=system.config.option.list" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน:</span>
				<select data-toggle="selectpicker" id="module" name="module" data-width="100">
                	<option value="">ทุกโมดูล</option>
                	<?php
                	foreach ($moduleArr as $k=>$v)
                	{
                		$checked = str::CheckElse( $k , $module , 'selected=""' );
                		echo '<option value="'.$k.'" '.$checked.'>'.$v.'</option>';
                	}
                	?>
                </select>
                <input type="text" placeholder="<?php echo $name;?>" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">สืบค้น</button>
				<a id="<?php echo $cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a> &nbsp;
				<div class="alert alert-danger search-inline"><i class="fa fa-info-circle"></i> โปรดอย่าแก้ไขการตั้งค่าตามอำเภอใจ มิฉะนั้นเว็บไซต์จะเข้าถึงไม่ได้</div>
            	<a class="btn btn-secondary radius size-MINI" data-toggle="dialog" data-mask="true" data-title="เพิ่มการตั้งค่า" href="index.php?d=yes&c=system.config.option.edit&t=add" data-width="600" data-height="400" ><i class="fa fa-plus"></i> เพิ่มตัวเลือก</a> &nbsp;
			</form>
		</div>
	</div>
</div>

<div class="bjui-pageContent" id="<?php echo $cFun;?>List">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th width="2%" data-order-field="config_id">ID</th>
				<th width="8%">กลุ่ม</th>
	            <th width="8%">โมดูล</th>
	            <th width="10%">หัวข้อ</th>
	            <th width="10%">ชื่อพารามิเตอร์</th>
	            <th width="7%">ประเภทฟอร์ม</th>
	            <th>หมายเหตุ</th>
	            <th width="13%">ดำเนินการ</th>
	            </tr>
			</thead>
			
			<tbody>
			<?php
			if( $optionArr )
			{
				$i = 1;
				foreach ($optionArr as $k=>$v)
				{
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					echo '<tr class="'.$cur.'">
							<td>'.$v['config_id'].'</td>
							<td>'.$v['group_remark'].'</td>
							<td>'.$configSer->GetModuleName($v['config_module']).'</td>
							<td>'.$v['config_title'].'</td>
							<td>'.$v['config_name'].'</td>
							<td>'.$configSer->GetFromType($v['config_formtype']).'</td>
							<td>'.$v['config_remark'].'</td>
							<td style="text-align: center;">
				            	<a class="btn btn-success radius size-MINI" data-mask="true" href="index.php?d=yes&c=system.config.option.edit&t=edit&id='.$v['config_id'].'"  data-toggle="dialog" data-title="แก้ไขตัวเลือก" data-width="600" data-height="400" >ตัวเลือกการจัดการ</a> 
				            	<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['config_id'].')">ลบ</a>
                			</td>
						</tr>';
					$i++;
				}
			}
			else
			{
				echo '<script type="text/javascript">$(document).ready(function(){$(this).alertmsg("info", "没有数据了!")});</script>';
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
        <span>&nbsp; รายการ จากทั้งหมด <?php echo $total;?> 条</span>
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
	ajaxOptions['url'] = "index.php?a=yes&c=system.config.option&t=del";
	ajaxOptions['confirmMsg'] = "确定要删除所选的数据吗？";
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