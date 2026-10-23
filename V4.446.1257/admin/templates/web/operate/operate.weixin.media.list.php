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
			<a href="index.php?c=operate.weixin.media.edit&d=yes&t=add&aid=<?php echo $aid;?>" data-mask="true" data-toggle="dialog" data-id="operate-weixin-media-add" data-title="เพิ่ม新的素材" class="btn btn-primary radius size-MINI" data-width="590" data-height="400"><i class="fa fa-plus"></i> อัปโหลดสื่อใหม่</a>
			<a href="index.php?a=yes&c=operate.weixin.media&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="ยืนยัน要ลบ选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $type.$cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> ลบหลายรายการ</a>
		</div>
		<div class="list-tool">
			<form id="pagerForm" name="<?php echo $cFun.$type;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">ค้นหาด่วน:</span>
                                           หมวดหมู่ค้นหา:<select data-toggle="selectpicker" name="st" data-width="100">
                	<option value="1" <?php echo str::CheckElse( $st , 1 , 'selected=""' );?>>公众号ID</option>
                	<option value="2" <?php echo str::CheckElse( $st , 2 , 'selected=""' );?>>公众号名字</option>
                	<option value="3" <?php echo str::CheckElse( $st , 3 , 'selected=""' );?>>文件名字</option>
                </select>
                                           ประเภทข้อความ:<select data-toggle="selectpicker" name="et" data-width="100">
                     <option value="" <?php echo str::CheckElse( $ft , '' , 'selected=""' );?>>全部类型</option>
					<?php
					foreach ($mediaMod->type as $k=>$v)
					{
						$cur = str::CheckElse( $ft , $k , 'selected=""' );
						echo '<option value="'.$k.'" '.$cur.'>'.$v.'</option>';
					} 
					?>
                </select>
                <input type="text" placeholder="<?php echo $name;?>" name="name" size="15">
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
				<th width="5%" data-order-field="media_id">ID</th>
				<th width="11%" data-order-field="account_name">ชื่อบัญชีทางการ</th>
				<th width="15%" data-order-field="media_filename">ชื่อสื่อ</th>
				<th width="8%" data-order-field="media_type">ประเภทสื่อ</th>
				<th>พาธสื่อ</th>
	            <th width="8%" data-order-field="media_islong">สื่อถาวร</th>
	            <th width="14%" data-order-field="media_time">เวลาเพิ่ม</th>
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
					$isLong = str::CheckElse( $v['media_islong'] , 1 , '永久' , '临时');
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['media_id'].'"></td>
							<td style="text-align: center;">'.$v['media_id'].'</td>
							<td style="text-align: center;">'.$v['account_name'].'</td>
							<td style="text-align: center;">'.$v['media_filename'].'</td>
							<td style="text-align: center;">'.$mediaMod->type[$v['media_type']].'</td>
							<td style="text-align: center;"><a href="'.$v['media_filepath'].'" target="_blank">'.$v['media_filepath'].'</a></td>
							<td style="text-align: center;">'.$isLong.'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['media_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
								<a class="btn btn-secondary radius size-MINI" href="index.php?c=operate.weixin.media.detail&id='.$v['media_id'].'"  data-mask="true" data-toggle="dialog" data-title="ดู素材详细信息" data-width="600" data-height="420" >详情</a>
								<a class="btn btn-danger radius" onclick="'.$type.$cFun.'Ajax(\'del\','.$v['media_id'].',0)">ลบ</a>
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
//ajax请求
function <?php echo $type.$cFun;?>Ajax(type,id,val)
{
	var msg;
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $type.$cFun;?>GetOp();

	switch(type){
		case "del":
			msg = '确定要删除所选的素材吗？';
			break;
	}
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['loadingmask'] = true;
	ajaxOptions['url'] = "index.php?a=yes&c=operate.weixin.media&t="+type;
	ajaxOptions['confirmMsg'] = msg;
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