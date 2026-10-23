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
		<div class="list-tool pl-15">
            <span >การดำเนินการด่วน:</span>
			<a href="index.php?a=yes&c=operate.flash&t=status&status=1" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要审核选中项吗？" data-callback="<?php echo $type.$cFun;?>ajaxCallBack" class="btn btn-warning radius"> 批量显示</a>
			<a href="index.php?a=yes&c=operate.flash&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要ลบ选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $type.$cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			<a href="index.php?a=yes&c=operate.flash&t=clear" data-toggle="doajax" data-confirm-msg="此ดำเนินการ不可撤回ยืนยัน要清空吗？" class="btn btn-danger size-MINI radius"><i class="fa fa-trash-o"></i> ล้างบันทึก</a>
		</div>
		<div class="list-tool">
			<form id="pagerForm" name="<?php echo $cFun.$type;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
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
				<button type="submit" class="btn btn-warning radius" data-icon="search">สืบค้น</button>
				<a id="<?php echo $type.$cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a>
			</form>
		</div>
	</div>
</div>


<div class="bjui-pageContent">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="5%" data-order-field="flash_id">ID</th>
				<th width="10%" data-order-field="f.type_id">หมวดหมู่สไลด์</th>
				<th width="5%" data-order-field="flash_status">ตรวจสอบหรือไม่</th>
				<th width="8%" data-order-field="flash_module">โมดูล</th>
				<th width="5%" data-order-field="flash_pid">ID หมวดหมู่</th>
				<th width="14%" data-order-field="flash_title">หัวข้อ</th>
				<th>ลิงก์ปลายทาง</th>
				<th width="5%" data-order-field="flash_order">เรียงลำดับ</th>
	            <th width="15%" data-order-field="">เวลาเพิ่ม</th>
	            <th width="15%">ดำเนินการ</th>
	            </tr>
			</thead>
			<tbody id="<?php echo $type.$cFun?>List">
			<?php
			if( $dataArr )
			{
				$i = 1;
				foreach ($dataArr as $k=>$v)
				{
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					$status = str::CheckElse( $v['flash_status'] , 0 , '<a href="javascript:;" onClick="'.$type.$cFun.'StatusAjax(1,'.$v['flash_id'].')"><span style="color:red">已隐藏</span></a>' , '<a href="javascript:;" onClick="'.$type.$cFun.'StatusAjax(0,'.$v['flash_id'].')"><span style="color:green">显示中</span></a>');
					$img = str::CheckElse( $v['flash_img'] , '' , '暂无图片' , '<img height=\'200\' width=\'500\' src=\''.$v['flash_img'].'\' />');
					
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['flash_id'].'"></td>
							<td style="text-align: center;">'.$v['flash_id'].'</td>
							<td style="text-align: center;">'.$v['type_name'].'</td>
							<td style="text-align: center;">'.$status.'</td>
							<td style="text-align: center;">'.$flashSer->GetModule($v['flash_module']).'</td>
							<td style="text-align: center;">'.$v['flash_pid'].'</td>
							<td style="text-align: center;">'.$v['flash_title'].'</td>
							<td style="text-align: center;">'.$v['flash_url'].'</td>
							<td style="text-align: center;">'.$v['flash_order'].'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['flash_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
								<button type="button" class="btn btn-success radius size-MINI" data-toggle="tooltip" data-placement="left" data-html="true" title="'.$img.'">图片</button>
				            	<a class="btn btn-secondary radius size-MINI" data-toggle="navtab" data-id="operate-flash-edit" data-title="แก้ไขสไลด์" href="index.php?d=yes&c=operate.flash.edit&t=edit&id='.$v['flash_id'].'">แก้ไข</a> 
								<a class="btn btn-danger radius" onclick="'.$type.$cFun.'delAjax('.$v['flash_id'].')">ลบ</a>
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
    <div class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>">
    </div>
</div>

<script type="text/javascript">
//页面唯一op获取函数
function <?php echo $type.$cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $type.$cFun;?>Form]").serializeArray();
	return op;
}
//删除数据
function <?php echo $type.$cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $type.$cFun;?>GetOp();
	
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=operate.flash&t=del";
	ajaxOptions['confirmMsg'] = "确定要删除所选的幻灯片吗？";
	ajaxOptions['callback'] = "<?php echo $type.$cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//审核幻灯片
function <?php echo $type.$cFun;?>StatusAjax(status,id)
{
	var type;
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $type.$cFun;?>GetOp();

	//用户操作类型
	switch(status)
	{
		case 0:
			type = "ซ่อน";
	  		break;
	  		
		default:
			type = "แสดง";
	  		break;
	}
	
	ajaxData.id = id;
	ajaxData.status = status;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=operate.flash&t=status";
	ajaxOptions['confirmMsg'] = "确定要"+type+"幻灯片吗？";
	ajaxOptions['callback'] = "<?php echo $type.$cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//页面唯一回调函数
function <?php echo $type.$cFun;?>ajaxCallBack(json){
	$(this).bjuiajax("ajaxDone",json);//显示处理结果
	$(this).dialog("closeCurrent");	//关闭当前dialog
	$(this).navtab("reload",<?php echo $type.$cFun;?>GetOp());	//刷新当前Tab页面 
}


$(document).ready(function(){
	$('#<?php echo $type.$cFun;?>refresh').click(function() {
	   $(this).navtab("reload",<?php echo $type.$cFun;?>GetOp());// 刷新当前Tab页面
	});
});
</script>