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
			<a data-mask="true" data-toggle="dialog" data-title="บรรณาธิการนิยาย分卷信息" data-width="530" data-height="270" href="index.php?c=novel.volume.edit&t=add&nid=<?php echo $nid;?>" class="btn btn-success size-MINI radius"> <i class="fa fa-plus-square"></i> เพิ่มเล่ม</a>
			<a href="index.php?a=yes&c=novel.volume&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要ลบ选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
		</div>
		<div class="list-tool">
			<form id="pagerForm" name="<?php echo $cFun;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน:</span>
                
                <input type="hidden" name="nid" value="<?php echo $nid;?>">
				<select data-toggle="selectpicker" name="st" data-width="100">
                	<option value="1" <?php echo str::CheckElse( $st , 1 , 'selected=""' );?>>ค้นชื่อหนังสือ</option>
                	<option value="2" <?php echo str::CheckElse( $st , 2 , 'selected=""' );?>>ค้นผู้แต่ง</option>
                </select>
                <input type="text" placeholder="<?php echo $name;?>" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">สืบค้น</button>
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
				<th width="5%" data-order-field="volume_id">ID</th>
				<th width="7%" data-order-field="n.type_id">หมวดหมู่นิยาย</th>
				<th width="13%" data-order-field="volume_name">ชื่อเล่ม</th>
				<th width="8%" data-order-field="volume_nid">ID นิยาย</th>
				<th data-order-field="novel_name">ชื่อนิยาย</th>
	            <th width="13%" data-order-field="novel_author">ผู้แต่งนิยาย</th>
				<th width="4%" data-order-field="volume_order">การเรียงเล่ม</th>
	            <th width="15%" data-order-field="volume_time">เวลาสร้าง</th>
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
					if( $v['volume_nid'] == '0')
					{
						$v['type_name'] = '系统分卷';
						$v['novel_author'] = '系统分卷';
						$v['novel_name'] = '系统分卷';
					}
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['volume_id'].'"></td>
							<td style="text-align: center;">'.$v['volume_id'].'</td>
							<td style="text-align: center;">'.$v['type_name'].'</td>
							<td style="text-align: center;">'.$v['volume_name'].'</td>
							<td style="text-align: center;">'.$v['volume_nid'].'</td>
							<td>'.$v['novel_name'].'</td>
							<td style="text-align: center;">'.$v['novel_author'].'</td>
							<td style="text-align: center;">'.$v['volume_order'].'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['volume_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
				            	<a class="btn btn-secondary radius size-MINI" data-mask="true" data-toggle="dialog" data-title="บรรณาธิการนิยาย分卷信息" data-width="530" data-height="270" href="index.php?d=yes&c=novel.volume.edit&t=edit&id='.$v['volume_id'].'" >แก้ไข</a> 
								<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['volume_id'].')">ลบ</a>
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
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}
//删除分卷
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	if( id == '1' ){
		$(this).alertmsg('error', '对不起，系统分卷禁止操作!');
	}else{
		ajaxData.id = id;
		ajaxOptions['data'] = ajaxData;
		ajaxOptions['url'] = "index.php?a=yes&c=novel.volume&t=del";
		ajaxOptions['confirmMsg'] = "确定要删除所选的分卷吗？";
		ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
		$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
	}
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