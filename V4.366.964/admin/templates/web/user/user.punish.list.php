<div class="bjui-pageHeader">
	<div class="row cl pt-10 pb-10 pl-10">
		<div class="f-l" style="margin-left:10px">
			<a href="index.php?a=yes&c=user.punish&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="คุณต้องการลบรายการที่เลือกหรือไม่?" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			<a href="index.php?a=yes&c=user.punish&t=clear" data-toggle="doajax" data-confirm-msg="คุณต้องการล้างบันทึกหรือไม่?" class="btn btn-danger size-MINI radius"><i class="fa fa-trash-o"></i> ล้างบันทึก</a>
		</div>
		<div class="f-l">
			<form id="pagerForm" name="<?php echo $cFun;?>Form"  data-toggle="ajaxsearch" data-loadingmask="true" action="index.php?c=user.punish.list" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
				<a id="<?php echo $cFun;?>refresh" style="margin-left:10px;" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a>
			</form>
		</div>
	</div>
</div>
<div class="bjui-pageContent">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="5%" data-order-field="punish_id">ไอดี</th>
				<th width="6%">บทลงโทษ</th>
				<th width="6%">สถานะ</th>
				<th width="14%">ผู้ใช้</th>
				<th width="20%">เหตุผล</th>
				<th width="10%">เวลาเริ่ม</th>
				<th width="10%">เวลาสิ้นสุด</th>
	            <th width="8%">ดำเนินการ</th>
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
					$status = str::CheckElse( $v['punish_status'] , 0 , '<span style="color:#bfbfbf">'.$statusArr[0].'</span>' , '<span style="color:red">'.$statusArr[1].'</span>');
					if( $v['punish_status'] == '0' )
					{
						$st = '<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['punish_id'].')">ลบ</a>';
					}
					else
					{
						$st = '<a class="btn btn-success radius" href="index.php?a=yes&c=user.punish&t=unpunish&st='.$v['punish_type'].'&uid='.$v['punish_uid'].'"  data-mask="true" data-toggle="doajax" data-confirm-msg="คุณต้องการยกโทษให้หรือไม่?")">ยกโทษ</a>';
					}
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['punish_id'].'"></td>
							<td style="text-align: center;">'.$v['punish_id'].'</td>
							<td style="text-align: center;">'.$status.'</td>
							<td style="text-align: center;">'.$typeArr[$v['punish_type']].'</td>
							<td style="text-align: center;">'.$v['user_nickname'].'(ID:'.$v['punish_uid'].')</td>
							<td>'.$v['punish_remark'].'</td>
							<td style="text-align: center;">'.date("Y-m-d H:i:s" , $v['punish_starttime']).'</td>
							<td style="text-align: center;">'.date("Y-m-d H:i:s" , $v['punish_endtime']).'</td>
							<td style="text-align: center;" data-noedit="true">
								'.$st.'
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
    <div class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>"></div>
</div>



<script>
//页面唯一获取op函数
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}
//删除
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=user.punish&t=del";
	ajaxOptions['confirmMsg'] = "คุณต้องการลบบันทึกปัจจุบันทันทีหรือไม่?";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//页面唯一回调函数
function <?php echo $cFun;?>ajaxCallBack(json){
	$(this).bjuiajax("ajaxDone",json);//显示处理结果
  $(this).navtab("reload",<?php echo $cFun;?>GetOp());	//刷新当前Tab页面 
}


$(document).ready(function(){
	$('#<?php echo $cFun;?>refresh').click(function() {
	    $(this).navtab("reload",<?php echo $cFun;?>GetOp());// 刷新当前Tab页面
	});
});
</script>