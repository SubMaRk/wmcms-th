<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="<?php echo $cFun;?>Form" action="index.php?a=yes&c=system.seo.rewrite&t=geturl" method="post" data-toggle="validate" data-callback="<?php echo $cFun;?>">
	
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>สร้างกฎสแตติกเทียม</b></th></tr></thead>
      <tr>
        <td>
        	<select data-toggle="selectpicker" id="<?php echo $cFun;?>server" data-width="130">
            	<option value="">เลือกสภาพแวดล้อม php</option>
            	<option value="iis6">windows + iis6</option>
            	<option value="iis7">windows + iis7</option>
            	<option value="apache">linux + apache</option>
            	<option value="nginx">linux + nginx</option>
         	</select>
         	
        	<select data-toggle="selectpicker" id="<?php echo $cFun;?>module" name="module" data-width="100">
            	<option value="">เลือกโมดูล</option>
                <?php
                foreach ($moduleArr as $k=>$v)
                {
                	echo '<option value="'.$k.'">'.$v.'</option>';
                }
                ?>
         	</select>
         </td>
      </tr>
      <tr id="<?php echo $cFun?>urllist">
         <td style="padding-top: 15px;">
         	<?php 
         	if( $pageData )
         	{
         		foreach ($pageData as $key=>$val)
         		{
         			echo '<div id="'.$cFun.$key.'page" class="pagebox" style="display:none">';
	         		foreach ($val as $k=>$v)
	         		{
	         			echo '<label><input type="checkbox" data-toggle="icheck" data-label="'.$v['name'].'" data-iniurl1="'.$v['ini']['url1'].'" data-iniurl2="'.$v['ini']['url2'].'" data-htaccessurl1="'.$v['htaccess']['url1'].'" data-htaccessurl2="'.$v['htaccess']['url2'].'" data-configurl1="'.$v['ini']['url1'].'" data-configurl2="'.$v['config']['url2'].'"data-id="'.$v['page'].'"></label>';
	         		}
         			echo '</div>';
         		}
         	}
         	?>
         </td>
      </tr>
    </table>
    
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>กฎ URL แบบสแตติกปัจจุบัน</b></th></tr></thead>
      <tr>
        <td width="360" style="font-size:14px;">
        	<span style="color: red"><strong>กฎสแตติกเทียมที่ระบบสร้างขึ้นใช้เป็นข้อมูลอ้างอิงเท่านั้น โปรดแก้ไขตามสถานการณ์จริง</strong></span><br/>
        	<span style="color: green">เมื่อพบ {xx} (xx คืออักขระใด ๆ) หรือ "pt={pt}&" สามารถลบพารามิเตอร์นั้นได้</span><br/>
        	<span style="color: blue"><strong>เมื่อพบ {s} สามารถแทนที่ด้วย (.*?)</strong></span><br/><br/>
			ไฟล์ pseudo-static ของ iis6 หรือต่ำกว่า：httpd.ini<br/>
			ไฟล์ pseudo-static ของ iis7 ขึ้นไป：web.config<br/>
			ไฟล์ pseudo-static ของ apache：.htaccess<br/>
			ไฟล์ pseudo-static ของ nginx：nginx.conf<br/>
        	เมื่อเลือกเสร็จแล้ว ให้คัดลอกเนื้อหาด้านขวาไปยังไฟล์ URL แบบสแตติก<br/>
        </td>
        <td>
        	<ul id="<?php echo $cFun?>rewritelist"></ul>
        </td>
      </tr>
    </table>
    
  </form>
</div>

<script>
//选中页面
$("#<?php echo $cFun?>urllist input").on('ifChecked', function(event){
	var html;
	var ser = $("#<?php echo $cFun;?>server").val();
	if(ser=="iis6"){
		html = "RewriteRule ^"+$(this).data('iniurl2')+"$ "+$(this).data('iniurl1')+" [L]";
	}else if(ser=="iis7"){
		html = '&lt;rule name="'+$(this).data('id')+'"&gt;<br/>'+
				'&nbsp;&nbsp;&nbsp;&nbsp;&lt;match url="^'+$(this).data('configurl2')+'" /&gt;<br/>'+
				'&nbsp;&nbsp;&nbsp;&nbsp;&lt;action type="Rewrite" url="'+$(this).data('configurl1')+'" /&gt;<br/>'+
				'&lt;/rule&gt;';
	}else if(ser=="apache"){
		var url1 = $(this).data('htaccessurl2');
		if( $(this).data('htaccessurl2').substring(0,1) == '/' ){
			url1 = $(this).data('htaccessurl2').substring(1);
		}
		html = 'RewriteRule ^'+url1+'$ '+$(this).data('htaccessurl1');
	}else if(ser=='nginx'){
		var url1 = $(this).data('htaccessurl2');
		if( $(this).data('htaccessurl2').substring(0,1) == '/' ){
			url1 = $(this).data('htaccessurl2').substring(1);
		}
		html = 'rewrite "^/'+url1+'$" '+$(this).data('htaccessurl1')+' last;';
	}
	html = html.replace('&copy','&#38;copy');
	$("#<?php echo $cFun?>rewritelist").append('<li id="'+$(this).data('id')+'" style="margin-bottom: 10px;">'+html+'</li>');
});
//取消选中页面
$("#<?php echo $cFun?>urllist input").on('ifUnchecked', function(event){
	$("#"+$(this).data('id')).remove();
});


//重新选择php运行环境
$("#<?php echo $cFun;?>server").change(function(){
	var html = '';
	$("#<?php echo $cFun?>urllist input").iCheck('uncheck');
	switch($(this).val()){
		case'iis6':
			html = '[ISAPI_Rewrite]<br/># 3600 = 1 hour<br/>CacheClockRate 3600<br/>RepeatLimit 32<br/>'+
			'#####此行代码是为了防止扒窃模板#######<br/>RewriteRule ^templates/([^/]*).html$ /404.php [L]<br/>RewriteRule ^plugin/([^/]*)templates/([^/]*).html$ /404.php [L]<br/>#####此行代码是为了防止扒窃模板#######<br/><br/>';
			break;
		case'iis7':
			html = '&lt;!--此行代码是为了防止扒窃模板--&gt;<br/>'+
			'&lt;rule name="novist"&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;match url="^/templates/([^/]*).html$" /&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;action type="Rewrite" url="/404.php" /&gt;<br/>&lt;/rule&gt;<br/>'+
			'&lt;rule name="novist_plgin"&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;match url="^/plugin/([^/]*)templates/([^/]*).html$" /&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;action type="Rewrite" url="/404.php" /&gt;<br/>&lt;/rule&gt;<br/>';
			break;
		case'apache':
			html = 'RewriteEngine On<br/>RewriteBase /<br/><br/>'+
			'#####此行代码是为了防止扒窃模板#######<br/>RewriteRule ^templates/(.*?).html$ /404.php<br/>RewriteRule ^plugin/(.*?)templates/(.*?).html$ /404.php<br/>#####此行代码是为了防止扒窃模板#######<br/><br/>';
			break;
		case'nginx':
			html = '#####此行代码是为了防止扒窃模板#######<br/>rewrite "^/templates/(.*?).html$" /404.php last;<br/>rewrite "^/plugin/(.*?)templates/(.*?).html$" /404.php last;<br/>#####此行代码是为了防止扒窃模板#######<br/><br/>';
			break;
	}
	$("#<?php echo $cFun?>rewritelist").html('<li>'+html+'</li>');
});

//选择模块
$("#<?php echo $cFun;?>module").change(function(){
	if( $("#<?php echo $cFun?>server").val() == '' ){
		$(this).alertmsg('error', '对不起，请选择PHP运行的环境!');
	}else{
		$("#<?php echo $cFun?>urllist .pagebox").hide();
		$("#<?php echo $cFun?>"+$("#<?php echo $cFun?>module").val()+"page").show();
	}
});
</script>