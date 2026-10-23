<div class="tableContent">
	<div id="<?php echo $cFun;?>" class="hide">
		<form action="index.php?a=yes&c=system.menu.menu&t=default_index" data-reload="false" data-toggle="validate" method="post">
			<div style="text-align:center;">
			    <div class="pt-20">
					ชื่อคอนโทรลเลอร์:<input type="text" name="index" value="<?php echo $defaultIndex;?>">
				</div>
			    <div class="pt-20">
					หมายเหตุ: โปรดตรวจสอบว่าบัญชีปัจจุบันมีสิทธิ์ของคอนโทรลเลอร์นี้เมื่อตั้งค่า
				</div>
			    <div class="pt-20">
					<button type="submit" class="btn-green" data-icon="location-arrow">ยืนยัน</button>
					<button type="button" class="btn-close" data-icon="close">ยกเลิก</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
var ajaxOptions=new Array();
ajaxOptions['target'] = "#<?php echo $cFun;?>";
ajaxOptions['title'] = "设置默认首页";
ajaxOptions['width'] = "300";
ajaxOptions['height'] = "180";
ajaxOptions['loadingmask'] = "true";
ajaxOptions['mask'] = "true";
$(document).dialog(ajaxOptions);

$(document).on('bjui.beforeCloseDialog', function(e) {
    $(this).navtab("closeCurrentTab");	// 刷新Tab页面
})
</script>
