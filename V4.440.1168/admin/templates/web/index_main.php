<link href="<?php echo $tempPath;?>/BJUI/css/main.css" rel="stylesheet">
<style>
	code{font-size: 14px;}
	.tongji_box{font-size:14px;padding-bottom: 25px;}
	.span{color:red;font-size:16px}
</style>
<div class="bjui-pageHeader" style="background:#FFF;z-index: 999;">
    <div style="padding: 0 15px;">
        <h4 style="margin-bottom:20px;">
            ระบบจัดการเนื้อหา WMCMS (WeiMeng CMS)<small>ใช้งานง่าย มุ่งสู่ความฝันของคุณด้วย WMCMS!</small>
        </h4>
        <div style="float:left; width:157px;">
            <div class="alert alert-info" role="alert" style="margin:0 0 5px; padding:10px;text-align:center;">
                <img src="<?php echo $tempPath;?>/BJUI/images/ewm.png" width="135">
               	<div style="font-size:16px;color:red;font-weight: bold;margin-top: 10px">สนับสนุน</div>
            </div>
        </div>
        <div style="margin-left:170px; margin-top:22px; padding-left:6px;">
            <a target="_blank" href="javascript:void(0)"><img border="0" src="<?php echo $tempPath;?>/BJUI/images/group.png" alt="กลุ่มพูดคุย WMCMS กลุ่ม 1" title="กลุ่มพูดคุย WMCMS กลุ่ม 1"></a>
            <span class="label label-default">(เต็มแล้ว)</span>　
            <a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=987a1c49151af08090fae2ab262caaea009981d5fc0b84bd2c7c0e78a80ec7f0"><img border="0" src="<?php echo $tempPath;?>/BJUI/images/group.png" alt="กลุ่มพูดคุย WMCMS กลุ่ม 2" title="กลุ่มพูดคุย WMCMS กลุ่ม 2"></a>
            <span style="padding-left:30px;">เว็บบอร์ดทางการ : </span><a href="<?php echo WMBBS;?>/" target="_blank"><?php echo WMBBS;?></a>
        </div>
        
        
        <div class="row" style="margin-left:170px; margin-top:10px;">
            <div class="col-md-6" style="padding:5px;">
                <div class="alert alert-success" role="alert" style="margin:0 0 5px; padding:5px 15px;">
                    <strong>ทีม WMCMS ยินดีต้อนรับ!</strong>
                    <br><span class="label label-default">นักพัฒนา : </span> <a href="#">@Weimeng (ฉงชิ่ง)</a>
                    <br><span class="label label-default">เทมเพลต : </span> <a href="#">@Kind Xiaochou (เซินเจิ้น)</a> <a href="#">@Junzi (ปักกิ่ง)</a>
                    <br><span class="label label-default">ทดสอบ & ลองใช้ : </span> <a href="#">@YawZhou (ชานซี)</a> <a href="#">@ReaL (เหอหนาน)</a>
                    <br><span class="label label-default">โปรโมท & ดูแล : </span> <a href="#">@Idaho (ปักกิ่ง)</a>
										<!-- SubMaRk --><br><span class="label label-default">แปลไทย : </span> <a href="https://naynum.engineer" target="_blank">@SubMaRk (ประเทศไทย)</a>
                </div>
            </div>
            <div class="col-md-6" style="padding:5px;">
                <div class="alert alert-info" role="alert" style="margin:0 0 5px; padding:5px 15px;">
                    <h5>เว็บไซต์ทางการ : <a href="<?php echo WMURL;?>" target="_blank"><?php echo WMURL;?></a></h5>
                    <h5>โดเมน & ไอพี : <?php echo HTTP_TYPE;?>://<?php echo $_SERVER['SERVER_NAME'];?>(<?php echo HTTP_TYPE;?>://<?php echo gethostbyname($_SERVER["SERVER_NAME"])?>)</h5>
                    <h5>เวอร์ชั่น PHP : <?php echo phpversion()?></h5>
                    <h5>เวอร์ชั่น Zend : <?php echo Zend_Version()?></h5>
                    <h5>ข้อมูลเซิร์ฟเวอร์ : <?php echo $_SERVER['SERVER_SOFTWARE']?></h5>
                </div>                                  
            </div>
        </div>
    </div>
</div>
<div class="bjui-pageContent">
    <!--<div style="position:absolute;top:15px;right:0;width:300px;">
        <iframe width="100%" height="550" class="share_self" frameborder="0" scrolling="no" src="http://show.v.t.qq.com/index.php?c=show&a=index&n=oulEshiRfnet&h=550&fl=1&l=4&o=29&co=0"></iframe>
    </div>-->
    <div style="margin-top:5px; margin-right:450px; overflow:hidden;">
	    <div style="position:absolute;top:15px;right:0;width:450px;margin-right:10px">
	        <div class="col-md-13">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title">ข้อมูลประจำวัน</h3></div>
                    <div class="panel-body">
                    	<div class="tongji_box">ข้อความใหม่ <span class="span"><?php echo $newMessage;?></span> ข้อความ จากทั้งหมด <span class="span"><?php echo $sumMessage;?></span> ที่ยังไม่อ่าน</div>
                    	<div class="tongji_box">เพิ่มใหม่วันนี้ <span class="span"><?php echo $newUser;?></span> ผู้ใช้ จากทั้งหมด <span class="span"><?php echo $sumUser;?></span> ผู้ใช้</div>
                    	<div class="tongji_box">เพิ่มใหม่วันนี้ <span class="span"><?php echo $newNovel;?></span> เรื่อง จากทั้งหมด<span class="span"><?php echo $sumNovel;?></span> เรื่อง</div>
                    </div>
                </div>
            </div>
	    </div>
        <div class="row" style="padding: 0 8px;">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title">เวอร์ชั่นปัจจุบัน : <code>V<?php echo WMVER?></code> เวอร์ชั่นล่าสุด : <code id="version_new">V<?php echo WMVER?></code> บันทึกการอัปเดทล่าสุด (<code id="version_time">......</code>)</h3></div>
                    <div class="panel-body bjui-doc" style="padding:0;">
                        <ul>
                            <li id="version_remark" style="font-size: 15px">กำลังโหลด...</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--<div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title">ชื่อ</h3></div>
                    <div class="panel-body">
                        <iframe width="100%" height="240" class="share_self" frameborder="0" scrolling="no" src="*.html"></iframe>
                    </div>
                </div>
            </div>-->
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
	var op = new Array();
	op['type'] = 'GET';
	op['reload'] = 'false';
	op['url'] = "index.php?a=yes&c=cloud.version&t=getnew";
	op['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(this).bjuiajax("doAjax",op);// 显示处理结果
});
function <?php echo $cFun;?>ajaxCallBack(json){
	var data = json.data.data;
	if(data){
		if( '<?php echo WMVER?>' != data['version_number'] )
		{
			$(this).alertmsg("ok", "พบเวอร์ชั่นใหม่บนเซิร์ฟเวอร์ที่สามารถอัปเดทได้!");
		}
		$("#version_new").html('V'+data['version_number']);
		$("#version_time").html(data['version_addtime']);
		$("#version_remark").html(data['version_remark']);
	}
}
</script>