<style>
.table tr {
    height: 35px;
}
thead th {
	text-align: center;
}
.list-tool{
	margin-bottom:5px;
}
</style>
<div class="bjui-pageHeader">
	<div class="row cl pt-10 pl-10">
		<div class="list-tool">
			<form id="pagerForm" name="<?php echo $cFun;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน : </span>
                
				<select data-toggle="selectpicker" name="attr" data-width="100">
                	<option value="">ประเภททั้งหมด</option>
                	<?php
                	foreach ($typeArr as $k=>$v)
                	{
                		$checked = str::CheckElse( $k , $attr , 'selected=""' );
                		echo '<option value="'.$k.'" '.$checked.'>'.$v.'</option>';
                	}
                	?>
                </select>
                <input type="text" placeholder="โปรดกรอกคำค้นบริษัท" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">ดึงข้อมูล</button>
				<a id="<?php echo $cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a>
				<a href="index.php?a=yes&c=app.firms&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="คุณต้องการลบรายการที่เลือกหรือไม่?" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
		
			</form>
		</div>
	</div>
</div>

<div class="bjui-pageContent">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="5%" data-order-field="firms_id">ไอดี</th>
				<th width="7%" data-order-field="firms_type">ประเภท</th>
				<th data-order-field="firms_name">ชื่อเต็ม</th>
				<th width="15%" data-order-field="firms_cname">ชื่อย่อ</th>
	            <th width="10%" data-order-field="firms_phone">หมายเลขโทรศัพท์</th>
	            <th width="10%" data-order-field="firms_email">อีเมล์</th>
	            <th width="14%" data-order-field="firms_addtime">วันที่เพิ่ม</th>
	            <th width="10%">ดำเนินการ</th>
	            </tr>
			</thead>
			<tbody id="<?php echo $cFun?>List">
			<?php
			if( $dataArr )
			{
				$i = 1;
				foreach ($dataArr as $k=>$v)
				{
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['firms_id'].'"></td>
							<td style="text-align: center;">'.$v['firms_id'].'</td>
							<td style="text-align: center;">'.$firmsSer->GetType($v['firms_type']).'</td>
							<td style="text-align: center;">'.$v['firms_name'].'</td>
							<td style="text-align: center;">'.$v['firms_cname'].'</td>
							<td style="text-align: center;">'.$v['firms_phone'].'</td>
							<td style="text-align: center;">'.$v['firms_email'].'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['firms_addtime']).'</td>
							<td style="text-align: center;" data-noedit="true">
				            	<a class="btn btn-secondary radius size-MINI" data-toggle="navtab" data-id="app-firms-edit" data-title="แก้ไขข้อมูลผู้จำหน่าย" href="index.php?d=yes&c=app.firms.edit&t=edit&id='.$v['firms_id'].'">แก้ไข</a> 
								<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['firms_id'].')">ลบ</a>
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
        <span>&nbsp;รายการ จากทั้งหมด <?php echo $total;?> รายการ</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>">
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
	ajaxOptions['url'] = "index.php?a=yes&c=app.firms&t=del";
	ajaxOptions['confirmMsg'] = "คุณต้องการลบผู้จำหน่ายที่เลือกหรือไม่?";
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
	$('#<?php echo $cFun;?>refresh').click(function() {
	   $(this).navtab("reload",<?php echo $cFun;?>GetOp());// 刷新当前Tab页面
	});
});
</script>