<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>
<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.cache&t=config" method="post" data-toggle="validate">

    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ล้างแคช</b></th></tr></thead>
      <tr>
        <td>เคล็ดลับ : </td>
        <td style="line-height: 23px;font-size: 14px;">คุณสามารถใช้คุณสมบัตินี้เพื่อล้างแคชเมื่อมีการกู้ข้อมูล, อัปเกรด หรือทำงานผิดปกติ<br/>
การล้างแคชจะใช้ทรัพยากรระบบมาก ควรที่จะทำในชั่วโมงที่ไม่ค่อยมีการเข้าชม<br/>
แคชหน้าเว็บ : อัปเดทไฟล์แคชจากกลไกการแคชหน้าเว็บของระบบ<br/>
แคชบล็อค : อัปเดทไฟล์แคชจากกลไกการแคชบล็อคของระบบ<br/>
แคช SQL : อัปเดทไฟล์แคชจากลไกการแคช SQL ของระบบ<br/>
ไฟล์บันทึก : ไฟล์บันทึกจากระบบซื้อขาย, คำร้อง WeChat, การดำเนินการทางข้อมูลระบบ, และอื่น ๆ
        </td>
      </tr>
      <tr>
        <td width="200">การแคช : </td>
        <td colspan="6">
        	<input type="checkbox" name="page" value="1" data-toggle="icheck" data-label="แคชหน้าเว็บ">
        	<input type="checkbox" name="block" value="1" data-toggle="icheck" data-label="แคชบล็อค">
        	<input type="checkbox" name="sql" value="1" data-toggle="icheck" data-label="แคช SQL">
        	<input type="checkbox" name="log" value="1" data-toggle="icheck" data-label="ไฟล์บันทึก">
        </td>
      </tr>
      <tr>
        <td width="200">ดำเนินการ : </td>
        <td colspan="6">
        	<button type="button" id="<?php echo $cFun;?>sub" class="btn btn-green" data-icon="refresh"><i class="fa fa-refresh"></i> ยืนยัน</button>
        	<button type="button" id="<?php echo $cFun;?>close" class="btn btn-orange" data-icon="undo"><i class="fa fa-refresh"></i> ยกเลิก</button>
        </td>
      </tr>
    </table>

  </form>
</div>

<script>
$(document).ready(function(){
	$('#<?php echo $cFun;?>close').click(function(){
		$(this).navtab("closeTab",'cache-clear');
	});

	$('#<?php echo $cFun;?>sub').click(function(){
		var page = $('[name="page"]').is(':checked') ? page = 1 : page = 0;
		var block = $('[name="block"]').is(':checked') ? block = 1 : block = 0;
		var sql = $('[name="sql"]').is(':checked') ? sql = 1 : sql = 0;
		var log = $('[name="log"]').is(':checked') ? log = 1 : log = 0;
		if( !page && !block && !sql && !log){
			$(this).alertmsg('error', 'ขออภัย! ต้องเลือกกลไกการแคชก่อน');
		}else{
			var op=new Array();
			var data=new Object();
			data.page = page;
			data.block = block;
			data.sql = sql;
			data.log = log;
			op['type'] = 'POST';
			op['data'] = data;
			op['url'] = "index.php?a=yes&c=system.cache&t=clear";
			$(this).bjuiajax('doAjax', op);
		}
	});
});
</script>
