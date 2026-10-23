<style>
.<?php echo $cFun?>Table,.<?php echo $cFun?>SeoTable,.<?php echo $cFun?>UrlTable{margin-bottom:20px}
.create,.urlTr,.seoTr{display:none}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.dev.addpage&t=add" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>เพิ่มหน้า</b></th></tr></thead>
      <tr>
        <td width="200">ชื่อไฟล์</td>
        <td width="350">
        	<input name="filename" type="text" value=""  />.php
	    </td>
        <td>ชื่อไฟล์ ไม่ต้องใส่ .php ต่อท้าย</td>
      </tr>
      <tr>
        <td>โมดูลที่สังกัด</td>
        <td width="350">
        	<select data-toggle="selectpicker" name="module">
	        	<option value="all">คอนโทรลเลอร์หน้าแรก</option>
	        	<?php 
	        	foreach ($moduleList as $k=>$v)
	        	{
	        		echo '<option value="'.$v['file'].'">'.$moduleMod->GetModuleName($v['file']).'控制器</option>';
	        	}
	        	?>
        	</select>
	    </td>
	    <td>โมดูลของไฟล์</td>
      </tr>
      
      <tr class="create">
        <td>ตัวระบุหน้า</td>
        <td width="350">
        	<input name="page" type="text"/>
	    </td>
        <td>กรอกเป็นภาษาอังกฤษเท่านั้น ไม่ต้องใส่คำนำหน้าโมดูล เช่น novel_ ระบบจะเพิ่มให้เอง</td>
      </tr>
      <tr class="create">
        <td>ชื่อหน้า</td>
        <td width="350">
        	<input name="name" type="text"/>
	    </td>
        <td>ชื่อภาษาจีนของหน้า</td>
      </tr>
    </table>
      
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>UrlTable">
      <thead><tr><th colspan="4" style="text-align:left;"><b>
      		<input name="urlOpen" type="radio" data-toggle="icheck" data-label="不创建URL" value="0" checked="1"/>
      		<input name="urlOpen" type="radio" data-toggle="icheck" data-label="创建URL" value="1"/>
      </b></th></tr></thead>
      <tr class="urlTr">
        <td width="200">ที่อยู่ URL แบบไดนามิก</td>
        <td width="450">
        	<input name="url[url1]" type="text" size="45"/>
	    </td>
        <td>ลิ้งก์แบบไดนามิก รูปแบบ : /index.php</td>
      </tr>
      <tr class="urlTr">
        <td>ลิ้งก์แบบดั้งเดิม</td>
        <td width="350">
        	<input name="url[url2]" type="text" size="45"/>
	    </td>
        <td>ลิ้งก์แบบที่ตั้งคงที่ รูปแบบ : /index.html สามารถใช้แบบเดียวกันกับแบบไดนามิก</td>
      </tr>
      <tr class="urlTr">
        <td>ลิ้งก์ปกติ</td>
        <td width="350">
        	<input name="url[url3]" type="text" size="45"/>
	    </td>
        <td>ลิ้งก์ปกติ รูปแบบ : /?module=novel&file=info&nid={nid}</td>
      </tr>
      <tr class="urlTr">
        <td>ลิ้งก์แบบเข้ากันได้</td>
        <td width="350">
        	<input name="url[url4]" type="text" size="45"/>
	    </td>
        <td>ลิ้งก์แบบเข้ากันได้ รูปแบบ : /?path=/novel/info/nid/{nid}</td>
      </tr>
      <tr class="urlTr">
        <td>ลิ้งก์แบบข้อมูลที่ตั้ง</td>
        <td width="350">
        	<input name="url[url5]" type="text" size="45"/>
	    </td>
        <td>ลิ้งก์แบบข้อมูลที่ตั้ง รูปแบบ : /index.php/novel/info/nid/{nid}</td>
      </tr>
      <tr class="urlTr">
        <td>ลิ้งก์แบบเขียนใหม่</td>
        <td width="350">
        	<input name="url[url6]" type="text" size="45"/>
	    </td>
        <td>ลิ้งก์แบบเขียนใหม่ รูปแบบ : /novel/info/nid/{nid}</td>
      </tr>
    </table>
      
      
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>SeoTable">
      <thead><tr><th colspan="4" style="text-align:left;"><b>
      		<input name="seoOpen" type="radio" data-toggle="icheck" data-label="不创建SEO" value="0" checked="1"/>
      		<input name="seoOpen" type="radio" data-toggle="icheck" data-label="创建SEO" value="1"/>
      </b></th></tr></thead>
      <tr class="seoTr">
        <td width="200">หัวข้อ</td>
        <td width="450">
        	<input name="seo[title]" type="text" size="45"/>
	    </td>
        <td>ข้อมูล title ของหน้าเว็บ</td>
      </tr>
      <tr class="seoTr">
        <td>คำสำคัญ</td>
        <td width="350">
        	<input name="seo[key]" type="text" size="45"/>
	    </td>
        <td>ข้อมูล keywords ของหน้าเว็บ</td>
      </tr>
      <tr class="seoTr">
        <td>คำอธิบาย</td>
        <td width="350">
        	<input name="seo[desc]" type="text" size="45"/>
	    </td>
        <td>ข้อมูล description ของหน้าเว็บ</td>
      </tr>
    </table>
    
  </form>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">บันทึก</button></li>
    </ul>
</div>

<script>
$(document).ready(function(){
	var urlOpen=false;
	var seoOpen=false;
	//url创建开关
	$('input[name="urlOpen"]').on('ifChanged', function(e) {
		var checked = $(this).is(':checked'), val = $(this).val()
		if (checked && val=='1'){
			 $(".<?php echo $cFun?>UrlTable .urlTr").show();
			 $(".create").show();
			 urlOpen=true;
		}else{
			 urlOpen=false;
			 $(".<?php echo $cFun?>UrlTable .urlTr").hide();
			 if( urlOpen==false && seoOpen==false ){
				 $(".create").hide();
			 }
		}
	})
	
	//seo创建开关
	$('input[name="seoOpen"]').on('ifChanged', function(e) {
		var checked = $(this).is(':checked'), val = $(this).val()
		if (checked && val=='1'){
			 $(".<?php echo $cFun?>SeoTable .seoTr").show();
			 $(".create").show();
			 seoOpen=true;
		}else{
			 seoOpen=false;
			 $(".<?php echo $cFun?>SeoTable .seoTr").hide();
			 if( urlOpen==false && seoOpen==false ){
				 $(".create").hide();
			 }
		}
	})
});
</script>