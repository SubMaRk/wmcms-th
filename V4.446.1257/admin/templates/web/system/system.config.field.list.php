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
			<form id="pagerForm" name="<?php echo $cFun;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="index.php?c=system.config.field.list" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน:</span>
                <input type="text" placeholder="请输入คำ段หัวข้อ" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">สืบค้น</button>
				<a id="<?php echo $cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a> &nbsp;
            	<a class="btn btn-secondary radius size-MINI" data-toggle="dialog" data-mask="true" data-title="เพิ่มฟิลด์" href="index.php?d=yes&c=system.config.field.edit&t=add" data-width="700" data-height="380" ><i class="fa fa-plus"></i> เพิ่มฟิลด์</a> &nbsp;
            	<a href="index.php?a=yes&c=system.config.field&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要ลบ选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			</form>
		</div>
	</div>
</div>

<div class="bjui-pageContent" id="<?php echo $cFun;?>List">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="5%" data-order-field="field_id">ID</th>
	            <th width="15%">ประเภทฟิลด์</th>
				<th width="25%">ชื่อฟิลด์</th>
				<th width="15%">โมดูลที่สังกัด</th>
				<th width="15%">หมวดหมู่ที่สังกัด</th>
				<th width="10%">หมวดหมู่ย่อยใช้งานได้</th>
	            <th width="12%">ดำเนินการ</th>
	            </tr>
			</thead>
			<tbody>
			<?php
			if( $fieldArr )
			{
				$i = 1;
				foreach ($fieldArr as $k=>$v)
				{
					$fieldType = str::CheckElse( $v['field_type'] , 1 , 'ฟิลด์หมวดหมู่' , 'ฟิลด์เนื้อหา');
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					$isChild = str::CheckElse( $v['field_type_child'] , 1 , '是' , 'ไม่');
					$typeName = 'ทุกหมวดหมู่';
					if( $v['field_type_id'] != '0' )
					{
						$typeName = $tableSer->GetTypeName($v['field_module'] , $v['field_type_id']);
					}
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['field_id'].'"></td>
							<td>'.$v['field_id'].'</td>
							<td>'.$fieldType.'</td>
							<td>'.$v['field_name'].'</td>
							<td>'.GetModuleName($v['field_module']).'</td>
							<td>'.$typeName.'</td>
							<td>'.$isChild.'</td>
							<td style="text-align: center;">
				            	<a class="btn btn-secondary radius size-MINI" data-mask="true" href="index.php?d=yes&c=system.config.field.edit&t=edit&id='.$v['field_id'].'&d=yes"  data-toggle="dialog" data-title="แก้ไขแท็ก信息" data-width="700" data-height="380" >แก้ไข</a> 
				            	<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['field_id'].')">ลบ</a>
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
	ajaxOptions['url'] = "index.php?a=yes&c=system.config.field&t=del";
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