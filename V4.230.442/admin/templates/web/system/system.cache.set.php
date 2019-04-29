<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>
<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.cache&t=config" method="post" data-toggle="validate">
	<fieldset>
		<legend>กำหนดค่าการแคช</legend>
        <ul class="nav nav-tabs" role="tablist">
        	<li class="active"><a href="#<?php echo $cFun.$type;?>default" role="tab" data-toggle="tab">ตั้งค่าทั่วไป</a></li>
            <li><a href="#<?php echo $cFun.$type;?>module" id="<?php echo $cFun;?>senior_tab" role="tab" data-toggle="tab">แคชบล็อคและหน้าเว็บ</a></li>
        </ul>
		<div class="tab-content" id="<?php echo $cFun.$type;?>box">
            <div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>default">
            	<table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
			      <thead><tr><th colspan="8" style="text-align:left;"><b>ตั้งค่ากลไกแคช</b></th></tr></thead>
			      <tr>
			        <td width="150">การสลับแคชทั่วไป : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_open');?></td>
			        <td>กลไกแคช : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_mechanism');?></td>
			        <td>ประเภทแคช : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_type');?></td>
			        <td>เวลาแคช : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_time');?><br/>
			        	<span style="color: red">หากค่าแคชที่กำหนดเป็น 0 จะใช้เวลาทั่วไป</span>
			        </td>
			      </tr>
			      <tr>
			        <td>การสลับแคช SQL : </td>
			        <td colspan="3"><?php echo $manager->GetForm('cache' , 'cache_sql');?></td>
			        <td>ประเภทแคช : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_sqltype');?></td>
			        <td>เวลาแคช : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_sqltime');?></td>
			      </tr>
			      <tr>
			        <td>การสลับแคชคิวบัฟเฟอร์ : </td>
			        <td colspan="3"><?php echo $manager->GetForm('cache' , 'cache_queue');?></td>
			        <td>ประเภทแคช : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_queuetype');?></td>
			        <td>เวลาแคช : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_queuetime');?></td>
			      </tr>
			    </table>

			    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
			      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าที่ตั้งแคช<span style="color: red">【ที่ตั้งต้องไม่เริ่มและจบด้วย '/'】</span></b></th></tr></thead>
			      <tr>
			        <td>ที่ตั้งจัดเก็บแคช : </td>
			        <td colspan="3"><?php echo $manager->GetForm('cache' , 'cache_path');?></td>
			      </tr>
			      <tr>
			        <td width="200">ที่ตั้งแคชทั่วไป : </td>
			        <td><?php echo $manager->GetForm('cache' , 'file_folder');?></td>
			        <td>นามสกุลแคชทั่วไป : </td>
			        <td><?php echo $manager->GetForm('cache' , 'file_ext');?></td>
			      </tr>
			      <tr>
			        <td>ที่ตั้งแคช SQL : </td>
			        <td><?php echo $manager->GetForm('cache' , 'sql_folder');?></td>
			        <td>นามสกุลแคช SQL : </td>
			        <td><?php echo $manager->GetForm('cache' , 'sql_ext');?></td>
			      </tr>
			      <tr>
			        <td>ที่ตั้งแคชคิวบัฟเฟอร์ : </td>
			        <td><?php echo $manager->GetForm('cache' , 'queue_folder');?></td>
			        <td>นามสกุลแคชคิวบัฟเฟอร์ : </td>
			        <td><?php echo $manager->GetForm('cache' , 'queue_ext');?></td>
			      </tr>
			    </table>


			    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
			      <thead><tr><th colspan="4" style="text-align:left;"><b>ตั้งค่าเซิร์ฟเวอร์แคช</b></th></tr></thead>
			      <tr>
			        <td width="200">เซิร์ฟเวอร์ Redis : </td>
			        <td><?php echo $manager->GetForm('cache' , 'redis_host');?></td>
			        <td>พอร์ต Redis : </td>
			        <td><?php echo $manager->GetForm('cache' , 'redis_port');?></td>
			      </tr>
			      <tr>
			        <td width="200">เซิร์ฟเวอร์ Memcached : </td>
			        <td><?php echo $manager->GetForm('cache' , 'memcached_host');?></td>
			        <td>พอร์ต Memcached : </td>
			        <td><?php echo $manager->GetForm('cache' , 'memcached_port');?></td>
			      </tr>
			    </table>
			</div>

		    <div class="tab-pane fade" id="<?php echo $cFun.$type;?>module">
		    	<table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
			      <thead><tr><th colspan="6" style="text-align:left;"><b>ทั่วไป (หน่วย : วินาที)</b></th></tr></thead>
			      <tr>
			        <td width="200">หน้าหลัก : </td>
			        <td colspan="5"><?php echo $manager->GetForm('cache' , 'cache_index');?></td>
			      </tr>
			    </table>
			    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
			      <thead><tr><th colspan="6" style="text-align:left;"><b>หน้าหลักโมดูล (หน่วย : วินาที)</b></th></tr></thead>
			      <tr>
			        <td>หน้าหลักโมดูล : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_index');?></td>
			        <td>หน้าโมดูลหมวดหมู่ : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_tindex');?></td>
			        <td>หน้าโมดูลอันดับ : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_topindex');?></td>
			      </tr>
			    </table>
			    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
			      <thead><tr><th colspan="6" style="text-align:left;"><b>โมดูลหน้ารายการ (หน่วย : วินาที)</b></th></tr></thead>
			      <tr>
			        <td>โมดูลหมวดหมู่ : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_type');?></td>
			        <td>โมดูลความคิดเห็น : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_replay');?></td>
			        <td>โมดูลค้นหา : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_search');?></td>
			      </tr>
			      <tr>
			        <td>โมดูลยอดนิยม</td>
			        <td colspan="5"><?php echo $manager->GetForm('cache' , 'cache_module_toplist');?></td>
			      </tr>
			    </table>
			    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
			      <thead><tr><th colspan="6" style="text-align:left;"><b>โมดูลหน้ารายละเอียด (หน่วย : วินาที)</b></th></tr></thead>
			      <tr>
			        <td>โมดูลเนื้อหา (เนื้อหาบทความ, เนื้อหาบทนิยาย) : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_content');?></td>
			        <td>โมดูลสารบัญ : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_menu');?></td>
			        <td>โมดูลรายละเอียด (รายละเอียดนิยาย) : </td>
			        <td><?php echo $manager->GetForm('cache' , 'cache_module_info');?></td>
			      </tr>
			    </table>
			</div>
		</div>
  </form>
</div>

<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">จัดเก็บ</button></li>
    </ul>
</div>
<script>
$(document).ready(function(){
	$('#<?php echo $cFun.$type;?>box input').css("width",'80px');
	$('#memcached_host').css("width",'120px');
	$('#redis_host').css("width",'120px');


	$('#cache_mechanism').change(function(){
		if($(this).val() == 'page' && $('#cache_type').val() != 'file'){
			$('#cache_type').val("file");
			$('#cache_type').selectpicker("refresh");
			$(this).alertmsg('warn', 'การแคชหน้าเว็บสามารถใช้โหมดการแคชไฟล์เท่านั้น!');
			return false;
		}
	});
	$('#cache_type').change(function(){
		if($("#cache_mechanism").val() == 'page' && $(this).val() != 'file'){
			$(this).val("file");
			$(this).selectpicker("refresh");
			$(this).alertmsg('warn', 'การแคชหน้าเว็บสามารถใช้โหมดการแคชไฟล์เท่านั้น!');
			return false;
		}
	});
});
</script>
