<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.set.templates&t=update" method="post" data-toggle="validate">
	<fieldset>
		<legend>ตั้งค่าเทมเพลตเริ่มต้น</legend>
		<ul class="nav nav-tabs" role="tablist">
           <li class="active" id="tab_install"><a href="#install" role="tab" data-toggle="tab">เทมเพลตที่ติดตั้งแล้ว</a></li>
           <li id="tab_list"><a href="#list" role="tab" data-toggle="tab">รายการเทมเพลตทั้งหมด</a></li>
		</ul>
		
             
		<div class="design_page">
		    <div class="tab-content">
		    	<div class="tab-pane fade active in" id="install">  
			    	<ul>
		    		<?php
		    		if( $installTempArr )
		    		{
			    		foreach ($installTempArr as $k=>$v)
			    		{
			    			$checked1 = str::CheckElse( $v['tp1'] , 1 , 'checked="1"' );
			    			$checked2 = str::CheckElse( $v['tp2'] , 1 , 'checked="1"' );
			    			$checked3 = str::CheckElse( $v['tp3'] , 1 , 'checked="1"' );
			    			$checked4 = str::CheckElse( $v['tp4'] , 1 , 'checked="1"' );
			    			
			        		echo '<li><div class="img"><img src="'.$v['cover'].'" width="210" height="140" class="hoverZoomLink"></div>
						        <div class="ft check">
		    					<label>　<input name="templates[tp1]" type="radio" data-toggle="icheck" data-label="简洁版" value="'.$v['path'].'" '.$checked1.'/>　</label>
		    					<label><input name="templates[tp2]" type="radio" data-toggle="icheck" data-label="3G版" value="'.$v['path'].'" '.$checked2.'/></label>
		    					<label>　<input name="templates[tp3]" type="radio" data-toggle="icheck" data-label="触屏版" value="'.$v['path'].'" '.$checked3.'/>　</label>
		    					<label><input name="templates[tp4]" type="radio" data-toggle="icheck" data-label="电脑版" value="'.$v['path'].'" '.$checked4.'/></label>
					        </div>
		    				<div class="ft" style="text-align:center;"><a href="index.php?a=yes&c=system.set.templates&t=uninstall&path='.$v['path'].'" data-toggle="doajax" data-confirm-msg="ใช่ไม่卸载此模版？" style="color:red">点击卸载</a></div>
		    				<div class="ft"><span class="label label-danger radius">'.$v['name'].'</span></div>
							<span class="badge badge-danger">'.$v['ver'].'</span></li>';
			    		}
		    		}
		    		else
		    		{
		    			echo '您暂时没有安装模版';
		    		}
					?>
		    		</ul>
		    		<div style="clear:both"></div>
				</div>
				
				<div class="tab-pane fade" id="list">  
			    	<ul>
		    		<?php 
		    		if( $tempArr )
		    		{
			    		foreach ($tempArr as $k=>$v)
			    		{
			    			if( CheckInstall($v['path']) )
			    			{
			    				$list = '<div class="ft" style="text-align:center;"><a href="index.php?a=yes&c=system.set.templates&t=uninstall&path='.$v['path'].'" data-toggle="doajax" data-confirm-msg="ใช่ไม่卸载此模版？" style="color:red">点击卸载</a></div>';
			    			}
			    			else
			    			{
			    				$list = '<div class="ft" style="text-align:center;"><a href="index.php?a=yes&c=system.set.templates&t=install&path='.$v['path'].'" data-toggle="doajax" data-confirm-msg="ใช่ไม่安装此模版？" style="color:green">点击安装</a></div>';
			    			}
			    			
			        		echo '<li><div class="img"><img src="'.$v['cover'].'" width="210" height="140" class="hoverZoomLink"></div>
			    				'.$list.'<div class="ft"><span class="label label-danger radius">'.$v['name'].'</span></div><span class="badge badge-danger">'.$v['ver'].'</span></li>';
			    		}
		    		}
		    		else
		    		{
		    			echo '您的模版文件夹没有模版！';
		    		}
					?>
		    		</ul>
		    		<div style="clear:both"></div>
				</div>
			</div>
		</div>
	</fieldset>
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
	$("#tab_list").click(function(){
		$(".bjui-pageFooter").hide();
	});
	
	$("#tab_install").click(function(){
		$(".bjui-pageFooter").show();
	});
});
</script>