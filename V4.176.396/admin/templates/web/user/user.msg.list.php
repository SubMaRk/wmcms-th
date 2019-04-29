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
            <span >ดำเนินการด่วน : </span>
			<a href="index.php?a=yes&c=user.msg&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="คุณต้องการลบรายการที่เลือกหรือไม่?" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			<a href="index.php?a=yes&c=user.msg&t=clear" data-toggle="doajax" data-confirm-msg="การดำเนินการนี้ไม่สามารถย้อนกลับได้ ต้องการล้างทั้งหมดหรือไม่?" class="btn btn-danger size-MINI radius"><i class="fa fa-trash-o"></i> ล้างข้อความ</a>
		</div>
		<div class="list-tool">
			<form id="pagerForm" name="<?php echo $cFun;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน : </span>


				<select data-toggle="selectpicker" name="st" data-width="100">
                	<option value="f" <?php echo str::CheckElse( $st , 'f' , 'selected=""' );?>>ผู้ส่ง</option>
                	<option value="t" <?php echo str::CheckElse( $st , 't' , 'selected=""' );?>>ผู้รับ</option>
                </select>
                <input type="text" value="<?php echo $name;?>" placeholder="โปรดกรอกไอดีผู้ใช้" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">ค้นหา</button>
				<a id="<?php echo $cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a>
			</form>
		</div>
	</div>
</div>

<div class="bjui-pageContent">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="5%" data-order-field="msg_id">ไอดี</th>
				<th width="10%" data-order-field="f.user_nickname">ผู้ส่ง</th>
				<th width="10%" data-order-field="t.user_nickname">ผู้รับ</th>
				<th width="8%" data-order-field="msg_status">สถานะข้อความ</th>
				<th>เนื้อหาข้อความ</th>
	            <th width="15%" data-order-field="msg_time">เวลาส่ง</th>
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
					$status = str::CheckElse( $v['msg_status'] , 0 , '<span style="color:green">ยังไม่อ่าน</span>' , '<span style="color:#AFAAAA;">อ่านแล้ว</span>');
					$v['fnickname'] = str::CheckElse( $v['fnickname'] , 0 , '<span style="color:red">ระบบ</span>' , $v['fnickname']);
					$content = mb_substr( str::DelHtml($v['msg_content']) , 0 , 55 ,'utf-8');
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['msg_id'].'"></td>
							<td style="text-align: center;">'.$v['msg_id'].'</td>
							<td style="text-align: center;">'.$v['fnickname'].'(ID:'.$v['msg_fuid'].')</td>
							<td style="text-align: center;">'.$v['tnickname'].'(ID:'.$v['msg_tuid'].')</td>
							<td style="text-align: center;">'.$status.'</td>
							<td style="text-align: center;">'.$content.'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['msg_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
				            	<a class="btn btn-secondary radius size-MINI" data-toggle="navtab" data-id="user-user-edit" data-title="แก้ไขเนื้อหา" href="index.php?d=yes&c=user.msg.detail&id='.$v['msg_id'].'">รายละเอียด</a>
								<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['msg_id'].')">ลบ</a>
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
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}
//删除消息
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();

	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=user.msg&t=del";
	ajaxOptions['confirmMsg'] = "คุณต้องการลบข้อความที่เลือกหรือไม่?";
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
