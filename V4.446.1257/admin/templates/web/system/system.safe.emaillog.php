<div class="bjui-pageHeader">
	<div class="row cl pt-10 pb-10 pl-10">
		<div class="f-l" style="margin-left:10px">
			<a href="index.php?a=yes&c=system.safe.emaillog&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要ลบ选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			<a href="index.php?a=yes&c=system.safe.emaillog&t=clear" data-toggle="doajax" data-confirm-msg="ยืนยันล้างบันทึก要吗？" class="btn btn-danger size-MINI radius"><i class="fa fa-trash-o"></i> ล้างบันทึก</a>
		</div>
		<div class="f-l">
			<form id="pagerForm" name="<?php echo $cFun;?>Form"  data-toggle="ajaxsearch" data-loadingmask="true" action="index.php?c=system.safe.emaillog" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
				<span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน:</span>
				<span class="" style="float:left;margin:5px 0 0 15px;">ผู้รับ:</span>
				<input type="text" class="input-text size-MINI radius form-control" name="log_receive" value="<?php echo $logReceive;?>" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">สืบค้น</button>
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
				<th width="5%" data-order-field="log_id">ID</th>
				<th width="5%" data-order-field="log_status">สถานะการส่ง</th>
				<th width="10%">บัญชีผู้ส่ง</th>
				<th width="10%">บัญชีผู้รับ</th>
				<th width="10%">หัวข้ออีเมล</th>
				<th width="12%">หมายเหตุ</th>
				<th width="12%">เวลาส่ง</th>
	            <th width="10%">ดำเนินการ</th>
	            </tr>
			</thead>
			<tbody>
			<?php
			if( $logArr )
			{
				$i = 1;
				foreach ($logArr as $k=>$v)
				{
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					$status = $emailMod->logStatus[$v['log_status']];
					if( $v['log_status'] == '0' )
					{
						$status = '<span style="color:#b7b7b7">'.$status.'</span>';
					}
					else if( $v['log_status'] == '1' )
					{
						$status = '<span style="color:#278410">'.$status.'</span>';
					}
					else if( $v['log_status'] == '2' )
					{
						$status = '<span style="color:red">'.$status.'</span>';
					}
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['log_id'].'"></td>
							<td style="text-align: center;">'.$v['log_id'].'</td>
							<td>'.$status.'</td>
							<td style="text-align: center;">'.$v['log_sender'].'</td>
							<td style="text-align: center;">'.$v['log_receive'].'</td>
							<td style="text-align: center;">'.$v['log_title'].'</td>
							<td style="text-align: center;">'.$v['log_remark'].'</td>
							<td style="text-align: center;">'.date("Y-m-d H:i:s" , $v['log_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
								<a class="btn btn-secondary radius size-MINI" href="index.php?c=system.safe.emaillog.detail&id='.$v['log_id'].'" data-mask="true" data-toggle="dialog" data-title="ดู日志的详细信息" data-width="600" data-height="550" >详情</a>
								<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['log_id'].')">ลบ</a>
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
//删除账号
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=system.safe.emaillog&t=del";
	ajaxOptions['confirmMsg'] = "是否永久删除当前日志？";
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