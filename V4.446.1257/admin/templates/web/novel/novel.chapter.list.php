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
			<a data-mask="true" data-toggle="navtab" data-id="novel-chapter-add" data-title="เพิ่มตอน" data-width="530" data-height="270" href="index.php?c=novel.chapter.edit&t=add&nid=<?php echo $nid;?>" class="btn btn-success size-MINI radius"> <i class="fa fa-plus-square"></i> เพิ่มตอน</a>
			<?php if( $nid > 0 ) { ?><a href="javascript:;" onClick="<?php echo $cFun?>BatchDiv()" class="btn btn-warning  radius"> 快速批量修改</a><?php }?>
			<a href="index.php?a=yes&c=novel.chapter&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要ลบ选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
			<a href="index.php?a=yes&c=novel.chapter&t=clear&name=<?php echo $name;?>&nid=<?php echo $nid;?>" data-toggle="doajax" data-confirm-msg="ยืนยัน要彻底清空当前นิยาย的ทั้งหมด章节吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ล้างตอน</a>
			<?php if($nid>0){ ?><a data-toggle="dialog" data-mask="true" data-id="novel-txt-upload" data-width="500" data-height="400" data-title="นำเข้า TXT" href="index.php?d=yes&c=novel.txt.upload&nid=<?php echo $nid;?>" class="btn btn-secondary size-MINI radius"> <i class="fa fa-exchange"></i> นำเข้า TXT</a></li><?php }?>
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
                	<option value="1" <?php echo str::CheckElse( $st , 1 , 'selected=""' );?>>ค้นชื่อนิยาย</option>
                	<option value="2" <?php echo str::CheckElse( $st , 2 , 'selected=""' );?>>ค้นชื่อตอน</option>
                </select>
                <input type="text" placeholder="请输入关键คำ" value="<?php echo $name;?>" name="name" size="15">
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
				<th width="5%" data-order-field="chapter_id">ID</th>
				<th width="11%" data-order-field="novel_name">ชื่อนิยาย</th>
	            <th width="11%" data-order-field="novel_author">ผู้แต่งนิยาย</th>
	            <th width="6%" data-order-field="chapter_status">สถานะตอน</th>
				<th width="8%" data-order-field="volume_name">ชื่อเล่ม</th>
	            <th data-order-field="chapter_name">ชื่อตอน</th>
	            <th width="6%" data-order-field="chapter_ispay">ประเภทการเก็บเงิน</th>
	            <th width="6%" data-order-field="chapter_islogin">เข้าสู่ระบบหรือไม่</th>
				<th width="4%" data-order-field="chapter_order">การเรียงตอน</th>
	            <th width="10%" data-order-field="chapter_time">เวลาสร้าง</th>
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
					$status = str::CheckElse( $v['chapter_status'] , 1 , '<span style="color:green">ตรวจสอบแล้ว</span>' , '<span style="color:red">未审核</span>');
					$isPay = str::CheckElse( $v['chapter_ispay'] , 1 , '<span style="color:red">ตอนเสียเงิน</span>' , '<span style="color:green">ตอนสาธารณะ</span>');
					$isLogin = str::CheckElse( $v['chapter_islogin'] , 1 , '<span style="color:red">ต้องเข้าสู่ระบบ</span>' , '<span style="color:green">ไม่ต้องเข้าสู่ระบบ</span>');
					
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['chapter_id'].'"></td>
							<td style="text-align: center;">'.$v['chapter_id'].'</td>
							<td>'.$v['novel_name'].'</td>
							<td style="text-align: center;">'.$v['novel_author'].'</td>
							<td style="text-align: center;">'.$status.'</td>
							<td style="text-align: center;">'.$v['volume_name'].'</td>
							<td style="text-align: center;">'.$v['chapter_name'].'</td>
							<td style="text-align: center;">'.$isPay.'</td>
							<td style="text-align: center;">'.$isLogin.'</td>
							<td style="text-align: center;">'.$v['chapter_order'].'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['chapter_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
								<button type="button" class="btn btn-warning radius" data-toggle="dropdown">ดำเนินการ<span class="caret"></span></button>
								<ul class="dropdown-menu" style="width:80px">
							    	<li><a data-toggle="navtab" data-id="novel-chapter-edit" data-title="บรรณาธิการ《'.$v['novel_name'].'》章节เนื้อหา" href="index.php?c=novel.chapter.edit&t=edit&id='.$v['chapter_id'].'">แก้ไข</a></li>
							    	<li class="divider"></li>
									<li><a data-toggle="dialog" data-mask="true" data-height="170" data-id="novel-chapter-edit" data-title="บรรณาธิการ《'.$v['novel_name'].'》章节ลำดับ" href="index.php?d=yes&c=novel.chapter.order&nid='.$v['chapter_nid'].'&cid='.$v['chapter_id'].'">ย้าย</a></li>
								</ul>
								<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['chapter_id'].')">ลบ</a>
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
                <option value="100">100</option>
                <option value="500">500</option>
                <option value="1000">1000</option>
                <option value="3000">3000</option>
                <option value="5000">5000</option>
                <option value="10000">10000</option>
            </select>
        </div>
        <span>&nbsp; รายการ จากทั้งหมด <?php echo $total;?> 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>">
    </div>
</div>

<!-- 批量操作层 -->
<div id="<?php echo $cFun;?>BatchDiv" data-noinit="true" class="hide" align="center">
    <table class="table table-condensed table-hover" width="100%">
	    <tbody>
		<tr>
		    <td colspan="2">
		        <b>เล่มของตอน:</b>
		        <select data-toggle="selectpicker" id="chapter_vid">
		            <option value="">ไม่แก้ไข</option>
		        	<?php
		        	foreach ($volume as $v)
		        	{
		        		echo '<option value="'.$v['volume_id'].'">'.$v['volume_name'].'</option>';
		        	}
		        	?>
		        </select>
		    </td>
		</tr>
		<tr>
		    <td>
		        <b>สถานะตอน:</b>
		        <select data-toggle="selectpicker" id="chapter_status">
		            <option value="">ไม่แก้ไข</option>
		            <option value="1">ตรวจสอบผ่าน</option>
		            <option value="0">ซ่อน/แสดง</option>
		        </select>
		    </td>
		    <td>
		        <b>ประเภทการเก็บเงิน:</b>
		        <select data-toggle="selectpicker" id="chapter_ispay">
		            <option value="">ไม่แก้ไข</option>
		            <option value="0">ตอนสาธารณะ</option>
		            <option value="1">ตอนเสียเงิน</option>
		        </select>
		    </td>
		</tr>
		<tr>
		    <td colspan="2">
		        <b>การอ่านต้องเข้าสู่ระบบหรือไม่:</b>
		        <select data-toggle="selectpicker" id="chapter_islogin">
		            <option value="">ไม่แก้ไข</option>
		            <option value="0">ไม่ต้องเข้าสู่ระบบ</option>
		            <option value="1">ต้องเข้าสู่ระบบ</option>
		        </select>
		    </td>
		</tr>
	    </tbody>
	</table>
    <div class="pt-10" style="text-align: center;">
		<button onClick="<?php echo $cFun;?>BatchAjax()" type="button" class="btn-green" data-icon="location-arrow">确认操作</button>
		<button type="button" class="btn-close" data-icon="close">ปิด</button>
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
//删除章节
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=novel.chapter&t=del";
	ajaxOptions['confirmMsg'] = "确定要删除所选的小说吗？";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//打开批量操作窗口
function <?php echo $cFun;?>BatchDiv()
{
	var ajaxOptions=new Array();
	ajaxOptions['target'] = "#<?php echo $cFun;?>BatchDiv";
	ajaxOptions['title'] = "批量修改";
	ajaxOptions['width'] = "400";
	ajaxOptions['height'] = "200";
	ajaxOptions['loadingmask'] = true;
	ajaxOptions['mask'] = "true";
	$(this).dialog(ajaxOptions);
}
//批量操作请求
function <?php echo $cFun;?>BatchAjax()
{
	var ajaxData=new Object();
	ajaxData.chapter_vid = $('#chapter_vid').val();
	ajaxData.chapter_ispay = $('#chapter_ispay').val();
	ajaxData.chapter_islogin = $('#chapter_islogin').val();
	ajaxData.chapter_status = $('#chapter_status').val();
	var ajaxOptions=new Array();
	ajaxOptions['url'] = "index.php?a=yes&c=novel.chapter&t=batch";
	ajaxOptions['idName'] = "ids";
	ajaxOptions['group'] = "ids";
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['isNavtab'] = true;
	ajaxOptions['confirmMsg'] = "该操作无法撤回，确定要批量修改选中项吗？";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(this).bjuiajax('doAjaxChecked', ajaxOptions);
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