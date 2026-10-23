<style>
.<?php echo $cFun?>Table,.<?php echo $cFun?>SeoTable,.<?php echo $cFun?>UrlTable{margin-bottom:20px}
.create,.urlTr,.seoTr{display:none}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.dev.addapi&t=add" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>ข้อมูลพื้นฐานอินเทอร์เฟซ</b></th></tr></thead>
      <tr>
        <td>ประเภทอินเทอร์เฟซ</td>
        <td width="350">
        	<select data-toggle="selectpicker" name="data[type_id]">
	        	<?php 
	        	foreach ($typeArr as $k=>$v)
	        	{
	        		echo '<option value="'.$v['type_id'].'">'.$v['type_title'].'</option>';
	        	}
	        	?>
        	</select>
	    </td>
	    <td>ประเภทที่ API สังกัด</td>
      </tr>
      <tr>
        <td width="200">สวิตช์อินเทอร์เฟซ</td>
        <td width="350">
        	<input name="data[api_open]" type="radio" data-toggle="icheck" data-label="默认开启" checked value="1"  />
        	<input name="data[api_open]" type="radio" data-toggle="icheck" data-label="默认关闭" value="0"  />
	    </td>
        <td>สถานะเปิด/ปิดเริ่มต้นของอินเทอร์เฟซ</td>
      </tr>
      <tr>
        <td>ตัวระบุอินเทอร์เฟซ</td>
        <td width="350">
        	<input name="data[api_name]" type="text" placeholder="英文คำ母，必填！"/>
	    </td>
        <td>กรอกได้เฉพาะตัวอักษรอังกฤษ เช่น wxpay</td>
      </tr>
      <tr>
        <td>ชื่ออินเทอร์เฟซ</td>
        <td width="350">
        	<input name="data[api_title]" type="text" placeholder="接口的名คำ！"/>
	    </td>
        <td>ชื่ออินเทอร์เฟซภาษาจีน เช่น WeChat Pay QR</td>
      </tr>
      <tr>
        <td>ชื่อย่ออินเทอร์เฟซ</td>
        <td width="350">
        	<input name="data[api_ctitle]" type="text" placeholder="接口的简称！"/>
	    </td>
        <td>ชื่ออินเทอร์เฟซภาษาจีน เช่น WeChat</td>
      </tr>
      <tr>
        <td>เรื่องย่ออินเทอร์เฟซ</td>
        <td width="350">
        	<input name="data[api_info]" type="text" placeholder="接口的简介！"/>
	    </td>
        <td>คำอธิบายสั้นของอินเทอร์เฟซ เช่น อินเทอร์เฟซ WeChat Pay QR ต้องสมัครที่แพลตฟอร์มผู้ค้า WeChat</td>
      </tr>
      <tr>
        <td>ลำดับการแสดงอินเทอร์เฟซ</td>
        <td width="350">
        	<input name="data[api_order]" type="text" placeholder="接口ลำดับ！"/>
	    </td>
        <td>ตัวเลขล้วน ลำดับการแสดงของอินเทอร์เฟซ ยิ่งน้อยยิ่งอยู่หน้า</td>
      </tr>
    </table>
    
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="1" style="text-align:left;"><b>ตั้งค่าพารามิเตอร์อินเทอร์เฟซ</b></th></tr></thead>
      <tr>
        <td>
        	<select data-toggle="selectpicker" name="base[api_appid][mast]">
	        	<option value="1">ใช้</option>
	        	<option value="0">ไม่ใช้</option>
        	</select>
        	<input name="base[api_appid][name]" type="text" value="api_appid"/>
        	&nbsp;&nbsp;<input name="base[api_appid][remark]" type="text" size="40" value="应用appid"/>
	    </td>
      </tr>
      <tr>
        <td>
        	<select data-toggle="selectpicker" name="base[api_apikey][mast]">
	        	<option value="1">ใช้</option>
	        	<option value="0">ไม่ใช้</option>
        	</select>
        	<input name="base[api_apikey][name]" type="text" value="api_apikey"/>
        	&nbsp;&nbsp;<input name="base[api_apikey][remark]" type="text" size="40" value="应用apikey"/>
	    </td>
      </tr>
      <tr>
        <td>
        	<select data-toggle="selectpicker" name="base[api_secretkey][mast]">
	        	<option value="1">ใช้</option>
	        	<option value="0">ไม่ใช้</option>
        	</select>
        	<input name="base[api_secretkey][name]" type="text" value="api_secretkey"/>
        	&nbsp;&nbsp;<input name="base[api_secretkey][remark]" type="text" size="40" value="应用secretkey"/>
	    </td>
      </tr>
    </table>
    <?php ?>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun?>Option">
      <thead><tr><th colspan="1" style="text-align:left;"><b>พารามิเตอร์เพิ่มเติมอินเทอร์เฟซ</b></th></tr></thead>
      <tr>
        <td>
        	<input name="option[name][]" size="15" type="text" placeholder="英文คำ母，参数键名"/>
        	<input name="option[title][]" size="15" type="text" placeholder="中文，参数หัวข้อ"/>
        	<input name="option[value][]" size="15" type="text" placeholder="参数ค่าเริ่มต้น值"/>
        	<input name="option[info][]" type="text" size="40" placeholder="参数的基本คำอธิบาย，如：应用appid！"/>
        	&nbsp;&nbsp;<a href="javascript:<?php echo $cFun;?>add()"><i class="fa fa-plus-square"></i></a>
	    </td>
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
function <?php echo $cFun;?>add(){
	var html = '<tr><td>'+
		'<input name="option[name][]" class="form-control" style="width:150px" type="text" placeholder="英文คำ母，参数键名"/>'+
		' <input name="option[title][]" class="form-control" style="width:150px" type="text" placeholder="中文，参数หัวข้อ"/>'+
		' <input name="option[value][]" class="form-control" style="width:150px" type="text" placeholder="参数ค่าเริ่มต้น值"/>'+
		' <input class="form-control" style="width:400px" name="option[info][]" type="text" placeholder="参数的基本คำอธิบาย，如：应用appid！"/>'+
		'&nbsp;&nbsp;<a href="javascript:<?php echo $cFun;?>add()"><i class="fa fa-plus-square"></i></a>'+
		'&nbsp;&nbsp;<a href="javascript:void(0)" onClick="<?php echo $cFun;?>unadd(this)"><i class="fa fa-minus-square"></i></a></li>'+
		'</td></tr>';
	$("#<?php echo $cFun?>Option").append(html);
	
}
function <?php echo $cFun;?>unadd(obj){
	$(obj).parent().parent().remove();
}
	        	
</script>