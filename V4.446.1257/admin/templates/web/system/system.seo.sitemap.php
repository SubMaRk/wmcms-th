<div class="bjui-pageContent">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;">
      <b style="color:red;font-size:14px;">คำแนะนำ: พาธบันทึกใช้พาธแบบสแตติกของ sitemap!</b>
      </th></tr></thead>

      <thead>
	      <tr>
	      	<td width="150">สร้างแผนที่ HTML</td>
	        <td><a class="btn btn-success radius size-MINI" onClick="createMap('html')">สร้างแผนที่ HTML</a></td>
	      </tr>
	      <tr>
	      	<td width="150">สร้างแผนที่ XML</td>
	        <td><a class="btn btn-success radius size-MINI" onClick="createMap('xml')">สร้างแผนที่ XML</a></td>
	      </tr>
	      <tr>
	      	<td width="150">สร้างข้อมูลโครงสร้าง XML</td>
	        <td><a class="btn btn-success radius size-MINI" onClick="createMap('site')">สร้างข้อมูลโครงสร้าง XML</a></td>
	      </tr>
      <thead>
	 </table>
	</div>
</div>

<script>
//生成首页
function createMap(page){
	var ajaxOptions=new Array();
	ajaxOptions['url'] = "index.php?a=yes&c=system.seo.sitemap&t=sitemap&page="+page;
	ajaxOptions['loadingmask'] = true;
	$(this).bjuiajax('doAjax', ajaxOptions);
}
</script>