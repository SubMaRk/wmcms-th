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
			<form id="pagerForm" name="<?php echo $cFun.$type;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>"><span >ดำเนินการด่วน : </span>
				<a href="index.php?a=yes&c=user.sign&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="หลังจากลบแล้ว จำนวนเช็คชื่อผู้ใช้ที่เลือกจะถูกปรับเป็น 0 ครั้ง คุณต้องการลบหรือไม่?" class="btn btn-danger size-MINI radius" data-callback="<?php echo $type.$cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
				<a href="index.php?a=yes&c=user.sign&t=clear" data-toggle="doajax" data-confirm-msg="หลังจากลบข้อมูลทั้งหมด จำนวนเช็คชื่อของผู้ใช้ทั้งหมดจะถูกปรับเป็น 0 ครั้ง คุณต้องการล้างระเบียนหรือไม่?" class="btn btn-danger size-MINI radius"><i class="fa fa-trash-o"></i> ล้างระเบียน</a>
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
				<th width="5%" data-order-field="sign_id">ไอดี</th>
				<th width="8%" data-order-field="user_id">ไอดีผู้ใช้</th>
				<th>ชื่อเล่น</th>
				<th width="8%" data-order-field="sign_sum">จำนวนเช็คชื่อ</th>
				<th width="10%" data-order-field="sign_con">เช็คชื่อต่อเนื่อง</th>
	            <th width="15%" data-order-field="sign_time">เวลาเช็คชื่อ</th>
				<th width="15%" data-order-field="sign_pretime">เช็คชื่อล่าสุด</th>
	            <th width="10%">ดำเนินการ</th>
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
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['sign_id'].'"></td>
							<td style="text-align: center;">'.$v['sign_id'].'</td>
							<td style="text-align: center;">'.$v['user_id'].'</td>
							<td style="text-align: center;">'.$v['user_name'].'</td>
							<td style="text-align: center;">'.$v['sign_sum'].'</td>
							<td style="text-align: center;">'.$v['sign_con'].'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['sign_time']).'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['sign_pretime']).'</td>
							<td style="text-align: center;" data-noedit="true">
								<a class="btn btn-danger radius" onclick="'.$type.$cFun.'delAjax('.$v['sign_id'].')">ลบ</a>
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
//删除
function <?php echo $type.$cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $type.$cFun;?>GetOp();
	
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=user.sign&t=del";
	ajaxOptions['confirmMsg'] = "หลังจากลบแล้ว จำนวนเช็คชื่อผู้ใช้ที่เลือกจะถูกปรับเป็น 0 ครั้ง คุณต้องการลบหรือไม่?";
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