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
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน:</span>
				<select data-toggle="selectpicker" name="st" data-width="100">
                	<option value="1" <?php echo str::CheckElse( $st , 1 , 'selected=""' );?>>ค้นชื่อหนังสือ</option>
                	<option value="2" <?php echo str::CheckElse( $st , 2 , 'selected=""' );?>>ค้นผู้แต่ง</option>
                </select>
                <input type="text" placeholder="<?php echo $name;?>" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">สืบค้น</button>
				<a id="<?php echo $cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> รีเฟรช</a>&nbsp;
				<a href="index.php?a=yes&c=novel.rec&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要ลบ选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			</form>
		</div>
	</div>
</div>

<div class="bjui-pageContent">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="5%" data-order-field="rec_id">ID</th>
				<th width="5%" data-order-field="novel_id">ID นิยาย</th>
				<th width="15%" data-order-field="novel_name">ชื่อนิยาย</th>
	            <th data-order-field="rec_rt">หัวข้อแนะนำ</th>
				<th width="4%" data-order-field="rec_icr">ปกแนะนำแรก</th>
				<th width="4%" data-order-field="rec_ibr">คัดสรรแรก</th>
				<th width="4%" data-order-field="rec_ir">แนะนำแรก</th>
				<th width="4%" data-order-field="rec_ccr">กำหนดเล่ม</th>
				<th width="4%" data-order-field="rec_cbr">ตั้งเป็นคัดสรร</th>
				<th width="4%" data-order-field="rec_cr">ตั้งเป็นแนะนำ</th>
	            <th width="15%" data-order-field="rec_time">เวลาเพิ่ม</th>
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
					$icr = str::CheckElse( $v['rec_icr'] , 0 , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'icr\',1,'.$v['novel_id'].')">否</a>' , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'icr\',0,'.$v['novel_id'].')"><span style="color:green">是</span></a>');
					$ibr = str::CheckElse( $v['rec_ibr'] , 0 , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'ibr\',1,'.$v['novel_id'].')">否</a>' , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'ibr\',0,'.$v['novel_id'].')"><span style="color:green">是</span></a>');
					$ir = str::CheckElse( $v['rec_ir'] , 0 , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'ir\',1,'.$v['novel_id'].')">否</a>' , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'ir\',0,'.$v['novel_id'].')"><span style="color:green">是</span></a>');
					$ccr = str::CheckElse( $v['rec_ccr'] , 0 , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'ccr\',1,'.$v['novel_id'].')">否</a>' , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'ccr\',0,'.$v['novel_id'].')"><span style="color:green">是</span></a>');
					$cbr = str::CheckElse( $v['rec_cbr'] , 0 , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'cbr\',1,'.$v['novel_id'].')">否</a>' , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'cbr\',0,'.$v['novel_id'].')"><span style="color:green">是</span></a>');
					$cr = str::CheckElse( $v['rec_cr'] , 0 , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'cr\',1,'.$v['novel_id'].')">否</a>' , '<a href="javascript:;" onClick="'.$cFun.'RecAjax(\'cr\',0,'.$v['novel_id'].')"><span style="color:green">是</span></a>');
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['rec_id'].'"></td>
							<td style="text-align: center;">'.$v['rec_id'].'</td>
							<td style="text-align: center;">'.$v['novel_id'].'</td>
							<td><a data-toggle="tooltip" data-placement="bottom" data-html="true" title="<img src=\''.$v['novel_cover'].'\' width=210 height=280/>">'.$v['novel_name'].'</a></td>
							<td>'.$v['rec_rt'].'</td>
							<td style="text-align: center;">'.$icr.'</td>
							<td style="text-align: center;">'.$ibr.'</td>
							<td style="text-align: center;">'.$ir.'</td>
							<td style="text-align: center;">'.$ccr.'</td>
							<td style="text-align: center;">'.$cbr.'</td>
							<td style="text-align: center;">'.$cr.'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['rec_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
				            	<a class="btn btn-secondary radius size-MINI" data-mask="true" data-toggle="dialog" data-title="บรรณาธิการ《'.$v['novel_name'].'》的แนะนำ信息" data-width="560" data-height="450" href="index.php?d=yes&c=novel.novel.rec.edit&t=edit&id='.$v['rec_id'].'" >แก้ไข</a> 
								<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['rec_id'].')">ลบ</a>
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
//删除推荐
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=novel.rec&t=del";
	ajaxOptions['confirmMsg'] = "确定要删除所选的推荐吗？";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//设置小说推荐属性
function <?php echo $cFun;?>RecAjax(rec,val,id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	var msg;
	var type;
	ajaxOptions = <?php echo $cFun;?>GetOp();

	//小说操作属性类型
	switch(rec)
	{
		case "icr":
			msg = "首页บล็อก面推荐";
	  		break;
	  		
		case "ibr":
			msg = "首页精品推荐";
	  		break;
	  		
		case "ir":
			msg = "แนะนำหน้าแรก";
	  		break;
	  		
		case "ccr":
			msg = "分类บล็อก面推荐";
	  		break;
	  		
		case "cbr":
			msg = "分类精品推荐";
	  		break;
	  		
		case "cr":
			msg = "แนะนำหมวดหมู่";
	  		break;
	}
	//操作类型设置
	switch(val)
	{
		case 0:
			type = "ยกเลิก";
	  		break;
	  		
		default:
			type = "设置";
	  		break;
	}
	
	ajaxData.id = id;
	ajaxData.rec = rec;
	ajaxData.val = val;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=novel.rec&t=rec";
	ajaxOptions['confirmMsg'] = "确定要"+type+"小说的"+msg+"属性吗？";
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