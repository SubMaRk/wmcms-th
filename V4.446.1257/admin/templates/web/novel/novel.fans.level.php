<div class="bjui-pageHeader">
	<div class="bjui-searchBar">
   		<button type="button" class="btn-green" data-toggle="tableditadd" data-target="#<?php echo $cFun?>AddTable" data-num="1" data-icon="plus">添加一条数据</button>&nbsp;
        <button type="button" class="btn-green" onclick="$(this).tabledit('add', $('#<?php echo $cFun?>AddTable'), 2)">添加两条数据</button>
        <a class="btn btn-success radius size-MINI" onclick="<?php echo $cFun?>AddLv()">保存数据</a>
    </div>
</div>

<div class="tableContent">
    <form id="<?php echo $cFun;?>AddForm" action="index.php?a=yes&c=novel.fans&t=leveladd" data-toggle="validate" method="post">
        <table id="<?php echo $cFun?>AddTable" class="table table-bordered table-hover table-striped table-top" data-toggle="tabledit" data-initnum="0" data-single-noindex="true">
            <thead>
                <tr>
                    <th title="ชื่อระดับ"><input type="text" name="level[#index#][level_name]" data-rule="required" size="10"></th>
                    <th title="ประสบการณ์เริ่มต้นของระดับ"><input value="0" type="text" name="level[#index#][level_start]" data-rule="digits" size="10"></th>
                    <th title="ประสบการณ์สิ้นสุดของระดับ"><input value="0" type="text" name="level[#index#][level_end]" data-rule="digits" size="10"></th>
                    <th title="การเรียงลำดับระดับ"><input value="0" type="text" name="level[#index#][level_order]" data-rule="digits" size="10"></th>
                    <th title="ดำเนินการ" data-addtool="false" width="100">
                        <a href="javascript:<?php echo $cFun;?>DelEdit()" class="btn btn-red row-del" data-confirm-msg="ยืนยัน要ลบ该行信息吗？">取消</a>
                    </th>
                </tr>
            </thead>
        </table>
    </form>

	<div style="clear: both; margin-top:20px">
	  <form name="<?php echo $cFun;?>EditForm" action="index.php?a=yes&c=novel.fans&t=leveledit" data-reload="false" data-toggle="validate" method="post" data-callback="<?php echo $cFun;?>ajaxCallBack">
	  <table class="table table-border table-bordered table-bg table-sort">
	    <tr>
	      <td colspan="5"><strong>ตั้งระดับแฟนนิยาย</strong></td>
	    </tr>
	    <tr>
	      <td>ชื่อระดับ</td>
	      <td>ค่าประสบการณ์เริ่มต้นระดับ</td>
	      <td>ค่าประสบการณ์สิ้นสุดระดับ</td>
	      <td>การเรียงระดับ</td>
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
			       <td><a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['level_id'].')">ลบ</a></td>
			    </tr>';
		    }
		}
		else
		{
			echo '<tr><td colspan="5" style="text-align:center">暂无数据!</td></tr>';
		}
	    ?>
	    </table>
	  
		<div class="bjui-pageFooter">
		    <ul>
		        <li><button type="button" class="btn-close btn btn-danger size-MINI radius"><i class="fa fa-times"></i> ปิด</button></li>
		        <li><button type="submit" class="btn btn-success size-MINI radius"><i class="fa fa-floppy-o"></i> ส่งการเปลี่ยนแปลง</button></li>
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
	ajaxOptions['url'] = "index.php?a=yes&c=novel.fans&t=leveldel";
	ajaxOptions['confirmMsg'] = "确定要删除所选的等级吗？";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
</script>