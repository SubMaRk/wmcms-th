<div class="bjui-pageHeader">
	<div class="bjui-searchBar">
   		<button type="button" class="btn-green" data-toggle="tableditadd" data-target="#<?php echo $cFun?>AddTable" data-num="1" data-icon="plus">เพิ่มข้อมูล</button>&nbsp;
        <button type="button" class="btn-green" onclick="$(this).tabledit('add', $('#<?php echo $cFun?>AddTable'), 2)">เพิ่มข้อมูล</button>
        <a class="btn btn-success radius size-MINI" onclick="<?php echo $cFun?>AddLv()">จัดเก็บข้อมูล</a>
    </div>
</div>

<div class="tableContent">
    <form id="<?php echo $cFun;?>AddForm" action="index.php?a=yes&c=user.lv&t=add" data-toggle="validate" method="post">
        <table id="<?php echo $cFun?>AddTable" class="table table-bordered table-hover table-striped table-top" data-toggle="tabledit" data-initnum="0" data-action="ajaxDone3.html" data-single-noindex="true">
            <thead>
                <tr>
                    <th title="ชื่อระดับ"><input type="text" name="level[#index#][level_name]" data-rule="required" size="10"></th>
                    <th title="ค่าประสบการณ์เริ่มต้น"><input value="0" type="text" name="level[#index#][level_start]" data-rule="digits" size="10"></th>
                    <th title="ค่าประสบการณ์สูงสุด"><input value="0" type="text" name="level[#index#][level_end]" data-rule="digits" size="10"></th>
                    <th title="ลำดับ"><input value="0" type="text" name="level[#index#][level_order]" data-rule="digits" size="10"></th>
                    <th title="จำนวนที่เก็บได้"><input value="0" type="text" name="level[#index#][level_coll]"  data-rule="digits" size="10"></th>
                    <th title="จำนวนชั้นหนังสือ"><input value="0" type="text" name="level[#index#][level_shelf]" data-rule="digits" size="10"></th>
                    <th title="รางวัลเข้าสู่ระบบประจำวัน<?php echo $userConfig['ticket_rec'];?>"><input value="0" type="text" name="level[#index#][level_rec]" data-rule="digits" size="10"></th>
                    <th title="รางวัลเข้าสู่ระบบประจำวัน<?php echo $userConfig['ticket_month'];?>"><input value="0" type="text" name="level[#index#][level_month]" data-rule="digits" size="10"></th>
                    <th title="ดำเนินการ" data-addtool="false" width="100">
                        <a href="javascript:<?php echo $cFun;?>DelEdit()" class="btn btn-red row-del" data-confirm-msg="คุณต้องการลบข้อมูลนี้หรือไม่?">ยกเลิก</a>
                    </th>
                </tr>
            </thead>
        </table>
    </form>

	<div style="clear: both; margin-top:20px">
	  <form name="<?php echo $cFun;?>EditForm" action="index.php?a=yes&c=user.lv&t=edit" data-reload="false" data-toggle="validate" method="post" data-callback="<?php echo $cFun;?>ajaxCallBack">
	  <table class="table table-border table-bordered table-bg table-sort">
	    <tr>
	      <td colspan="9"><strong>ตั้งค่าระดับสมาชิก</strong></td>
	    </tr>
	    <tr>
	      <td>ชื่อระดับ</td>
	      <td>ค่าประสบการณ์เริ่มต้น</td>
	      <td>ค่าประสบการณ์สูงสุด</td>
	      <td>ลำดับ</td>
	      <td>จำนวนที่เก็บได้</td>
	      <td>จำนวนชั้นหนังสือ</td>
	      <td>รางวัลเข้าสู่ระบบประจำวัน<?php echo $userConfig['ticket_rec'];?></td>
	      <td>รางวัลเข้าสู่ระบบประจำวัน<?php echo $userConfig['ticket_month'];?></td>
	      <td>ดำเนินการ</td>
	    </tr>

	    <?php
	    if( $lvArr )
	    {
		    foreach ($lvArr as $k=>$v)
		    {
		    	echo '<tr>
			      <td><input type="hidden" name="level['.$v['level_id'].'][id][level_id]" value="'.$v['level_id'].'">
					<input name="level['.$v['level_id'].'][data][level_name]" value="'.$v['level_name'].'" type="text" size="10"/></td>
			      <td><input name="level['.$v['level_id'].'][data][level_start]" value="'.$v['level_start'].'"  type="text" size="10"/></td>
			      <td><input name="level['.$v['level_id'].'][data][level_end]" value="'.$v['level_end'].'"  type="text" size="10"/></td>
			      <td><input name="level['.$v['level_id'].'][data][level_order]"  value="'.$v['level_order'].'"  type="text" size="10"/></td>
			      <td><input name="level['.$v['level_id'].'][data][level_coll]"  value="'.$v['level_coll'].'"  type="text" size="10"/></td>
			      <td><input name="level['.$v['level_id'].'][data][level_shelf]"  value="'.$v['level_shelf'].'"  type="text" size="10"/></td>
			      <td><input name="level['.$v['level_id'].'][data][level_rec]"  value="'.$v['level_rec'].'"  type="text" size="10"/></td>
			      <td><input name="level['.$v['level_id'].'][data][level_month]"  value="'.$v['level_month'].'"  type="text" size="10"/></td>
			      <td><a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['level_id'].')">ลบ</a></td>
			    </tr>';
		    }
		}
		else
		{
			echo '<tr><td colspan="9" style="text-align:center">ไม่มีข้อมูล!</td></tr>';
		}
	    ?>
	    </table>

		<div class="bjui-pageFooter">
		    <ul>
		        <li><button type="button" class="btn-close btn btn-danger size-MINI radius"><i class="fa fa-times"></i> ปิด</button></li>
		        <li><button type="submit" class="btn btn-success size-MINI radius"><i class="fa fa-floppy-o"></i> จัดเก็บ</button></li>
		    </ul>
		</div>
	</form>
	</div>
</div>



<script type="text/javascript">
//页面唯一op获取函数
function <?php echo $cFun;?>GetOp(type){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $cFun;?>"+type+"Form]").serializeArray();
	return op;
}
//删除可编辑表格
function <?php echo $cFun;?>DelEdit(){
	$(this).tabledit('del');
}
function <?php echo $cFun?>AddLv(){
	$("#<?php echo $cFun?>AddForm").bjuiajax('ajaxForm',<?php echo $cFun;?>GetOp('Add'));
}
//页面唯一回调函数
function <?php echo $cFun;?>ajaxCallBack(json){
	$(this).bjuiajax("ajaxDone",json);//显示处理结果
	$(this).navtab("reload");	//刷新当前Tab页面
}
//删除等级
function <?php echo $cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp('Edit');

	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=user.lv&t=del";
	ajaxOptions['confirmMsg'] = "คุณต้องการลบระดับที่เลือกหรือไม่?";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
</script>
