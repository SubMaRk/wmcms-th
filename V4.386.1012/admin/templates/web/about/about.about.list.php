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
			<a href="javascript:;" onClick="<?php echo $cFun?>MoveDiv()" class="btn btn-warning  radius"> ย้ายหลายรายการ</a>
			<a href="index.php?a=yes&c=about.about&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="คุณต้องการลบรายการที่เลือหรือไม่?" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
		</div>
		<div class="list-tool">
			<form id="pagerForm" name="<?php echo $cFun;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน : </span>
                
				<input name="tid" type="hidden" value="<?php echo $tid;?>">
		      	<input name="tname" type="text" data-toggle="selectztree" data-tree="#<?php echo $cFun;?>_ztree_select" readonly value="<?php echo $tname;?>">
	             <ul id="<?php echo $cFun;?>_ztree_select" class="ztree hide" data-toggle="ztree" data-expand-all="true" data-check-enable="true" data-chk-style="radio" data-radio-type="all" data-on-check="<?php echo $cFun;?>S_NodeCheck" data-on-click="<?php echo $cFun;?>S_NodeClick" style="width:120px">
	             <li data-id="">หมวดหมู่ทั้งหมด</li>
	             <?php 
	             if( $typeArr )
	             {
				    foreach ($typeArr as $k=>$v)
				    {
				    	$checked = str::CheckElse( $v['type_id'], C('type_topid',null,'data') , 'true');
				    	echo '<li data-checked="'.$checked.'" data-id="'.$v['type_id'].'" data-pid="'.$v['type_topid'].'">'.$v['type_name'].'</li>';
				    }
	             }
				 ?>
	             </ul>
				
                <input type="text" placeholder="<?php echo $name;?>" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">ดึงข้อมูล</button>
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
				<th width="8%" data-order-field="about_id">ไอดี</th>
				<th width="10%" data-order-field="a.type_id">หมวดหมู่</th>
				<th data-order-field="about_name">ชื่อ</th>
				<th width="10%" data-order-field="about_pinyin">พินอิน</th>
	            <th width="15%" data-order-field="about_time">วันที่เผยแพร่</th>
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
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['about_id'].'"></td>
							<td style="text-align: center;">'.$v['about_id'].'</td>
							<td style="text-align: center;">'.$v['type_name'].'</td>
							<td>'.$v['about_name'].'</td>
							<td style="text-align: center;">'.$v['about_pinyin'].'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['about_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
				            	<a class="btn btn-secondary radius size-MINI" data-toggle="navtab" data-id="about-about-edit" data-title="แก้ไขเนื้อหา" href="index.php?d=yes&c=about.about.edit&t=edit&id='.$v['about_id'].'">แก้ไข</a> 
								<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['about_id'].')">ลบ</a>
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
        <span>&nbsp;รายการ, จากทั้งหมด <?php echo $total;?> รายการ</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>">
    </div>
</div>


<!-- 批量移动操作层 -->
<div id="<?php echo $cFun;?>MoveDiv" data-noinit="true" class="hide" align="center">
	<input name="move_tid" id="<?php echo $cFun;?>move_tid" type="hidden">
	ย้ายหลายรายการไปยัง : 
	<input type="text" data-toggle="selectztree" data-tree="#<?php echo $cFun;?>_move_ztree_select" readonly value="<?php echo $tname;?>">
	<ul id="<?php echo $cFun;?>_move_ztree_select" class="ztree hide" data-toggle="ztree" data-expand-all="true" data-check-enable="true" data-chk-style="radio" data-radio-type="all" data-on-check="<?php echo $cFun;?>S_NodeCheck" data-on-click="<?php echo $cFun;?>S_NodeClick" style="width:120px">
	    <?php 
	    if( $typeArr )
	    {
		    foreach ($typeArr as $k=>$v)
		    {
		    	echo '<li data-id="'.$v['type_id'].'" data-pid="'.$v['type_topid'].'">'.$v['type_name'].'</li>';
		    }
	    }
	    ?>
    </ul>
    <div class="pt-10" style="margin-left: 80px">
		<button onClick="<?php echo $cFun;?>MoveAjax()" type="button" class="btn-green" data-icon="location-arrow">ย้าย</button>
		<button type="button" class="btn-close" data-icon="close">ยกเลิก</button>
	</div>
</div>


<script type="text/javascript">
var <?php echo $cFun;?>ZtreeInputName = 'tid';
//页面唯一op获取函数
function <?php echo $cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>Form]").serializeArray();
	return op;
}
//获得选中项
function getChecked() {
	var records = new Array();
	$('#<?php echo $cFun?>List').each(function() {
		if($(this).find('td:eq(0)>input:checked').length == 1){
			records[records.length] = gridObj.getRowRecord($(this));
		}
	});
	return records;
}
//批量移动窗口打开
function <?php echo $cFun;?>MoveDiv()
{
	<?php echo $cFun;?>ZtreeInputName = 'move_tid';
	var ajaxOptions=new Array();
	
	ajaxOptions['target'] = "#<?php echo $cFun;?>MoveDiv";
	ajaxOptions['title'] = "ย้ายหลายรายการ";
	ajaxOptions['width'] = "300";
	ajaxOptions['height'] = "100";
	ajaxOptions['mask'] = "true";
	$(this).dialog(ajaxOptions);
}
//批量移动操作请求
function <?php echo $cFun;?>MoveAjax()
{
	var tid = $("#<?php echo $cFun;?>move_tid").val();
	if( tid == ''){
		$(this).alertmsg('error', 'ขออภัย! โปรดเลือกหมวดหมู่ที่จะย้ายก่อน')
	}else{
		var ajaxOptions=new Array();
		ajaxOptions['url'] = "index.php?a=yes&c=about.about&t=move&tid="+tid;
		ajaxOptions['idName'] = "ids";
		ajaxOptions['group'] = "ids";
		ajaxOptions['isNavtab'] = true;
		ajaxOptions['confirmMsg'] = "คุณต้องการย้ายรายการที่เลือกหรือไม่?";
		ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
		$(this).bjuiajax('doAjaxChecked', ajaxOptions);
	}
}
//删除信息
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=about.about&t=del";
	ajaxOptions['confirmMsg'] = "คุณต้องการลบรายการที่เลือกหรือไม่";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//设置信息属性
function <?php echo $cFun;?>AttrAjax(attr,val,id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	var msg;
	var type;
	ajaxOptions = <?php echo $cFun;?>GetOp();

	//信息操作属性类型
	switch(attr)
	{
		case "rec":
			msg = "แนะนำ";
	  		break;
	  		
		case "head":
			msg = "พาดหัว";
	  		break;
	  		
		case "strong":
			msg = "ตัวหนา";
	  		break;
	}
	//操作类型设置
	switch(val)
	{
		case 0:
			type = "ยกเลิก";
	  		break;
	  		
		default:
			type = "กำหนด";
	  		break;
	}
	
	ajaxData.id = id;
	ajaxData.attr = attr;
	ajaxData.val = val;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=about.about&t=attr";
	ajaxOptions['confirmMsg'] = "คุณต้องการ"+type+"การเป็น"+msg+"หรือไม่?";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//审核信息
function <?php echo $cFun;?>StatusAjax(status,id)
{
	var type;
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();

	//信息操作类型
	switch(status)
	{
		case 0:
			type = "ละทิ้ง";
	  		break;
	  		
		default:
			type = "ตรวจสอบ";
	  		break;
	}
	
	ajaxData.id = id;
	ajaxData.status = status;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=about.about&t=status";
	ajaxOptions['confirmMsg'] = "คุณต้องการ"+type+"หรือไม่?";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//页面唯一回调函数
function <?php echo $cFun;?>ajaxCallBack(json){
	$(this).bjuiajax("ajaxDone",json);//显示处理结果
	$(this).dialog("closeCurrent");	//关闭当前dialog
	$(this).navtab("reload",<?php echo $cFun;?>GetOp());	//刷新当前Tab页面 
}
//选择事件
function <?php echo $cFun;?>S_NodeCheck(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj(treeId),
        nodes = zTree.getCheckedNodes(true)
    var ids = '', names = ''
    
    for (var i = 0; i < nodes.length; i++) {
        ids   += ','+ nodes[i].id
        names += ','+ nodes[i].name
    }
    if (ids.length > 0) {
        ids = ids.substr(1), names = names.substr(1)
    }
    
    var $from = $('#'+ treeId).data('fromObj')

    $('[name="'+<?php echo $cFun;?>ZtreeInputName+'"]').val(ids);
    <?php echo $cFun;?>ZtreeInputName = 'tid';
    if ($from && $from.length) $from.val(names)
}
//单击事件
function <?php echo $cFun;?>S_NodeClick(event, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj(treeId)
    
    zTree.checkNode(treeNode, !treeNode.checked, true, true)
    
    event.preventDefault()
}


$(document).ready(function(){
	$('#<?php echo $cFun;?>refresh').click(function() {
	   $(this).navtab("reload",<?php echo $cFun;?>GetOp());// 刷新当前Tab页面
	});
});
</script>