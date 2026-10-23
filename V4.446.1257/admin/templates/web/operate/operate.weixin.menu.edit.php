<link href="templates/web/BJUI/plugins/weixin_menu/weixin_menu.css" rel="stylesheet">
<script>
var weixinMenuData = '<?php echo C('menu_data',null,'data');?>';
</script>
<script src="templates/web/BJUI/plugins/weixin_menu/weixin_menu.js"></script>
<div class="bjui-pageContent">	                       
    <form action="index.php?a=yes&c=operate.weixin.menu&t=<?php echo $type;?>" data-reload="false" data-toggle="validate" method="post"  <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
	<input name="id[menu_id]" type="hidden" class="input-text" value="<?php echo $id;?>">
		<fieldset>
			<legend>แก้ไขเมนูกำหนดเอง</legend>
            	<div class="tab-pane fade active in" id="<?php echo $cFun.$type;?>base">
					<table class="table table-border table-bordered table-bg table-sort">
		                <tr>
					      <td valign="top" width="170"><b>บัญชีทางการที่สังกัด:</b></td>
					      <td valign="top">
					      		<select data-toggle="selectpicker" name="menu[menu_account_id]">
		                       	<?php 
		                       	$select = '';
		                       	if( $aid > 0 )
		                       	{
		                       		echo '<option value="'.$aid.'" '.$select.'>'.$aName.'</option>';
		                       	}
		                       	else if( $accountList )
		                       	{
			                       	foreach ($accountList as $k=>$v)
			                       	{
			                       		$select = str::CheckElse($v['account_id'], C('menu_account_id',null,'data') , 'selected=""');
			                       		echo '<option value="'.$v['account_id'].'" '.$select.'>'.$v['account_name'].'</option>';
			                       	}
		                       	}
		                       	?>
		                        </select>
						  </td>
						  <td valign="top" width="170"><b>ชื่อเมนูกำหนดเอง:</b></td>
					      <td valign="top"><input type="text" size="15" name="menu[menu_name]" value="<?php echo C('menu_name',null,'data');?>" data-rule="required"></td>
						</tr>
		                <tr>
		                    <td><b>อัปเดตล่าสุด:</b></td>
		                    <td><?php echo C('menu_updatetime',null,'data');?></td>
		                    <td><b>ผลักล่าสุด:</b></td>
		                    <td><?php echo C('menu_pushtime',null,'data');?></td>
		                </tr>
		                <tr>
		                    <td colspan="4">
		                    	<input type="hidden" name="menu[menu_data]" style="display:none"/>
							    <div id="myTabContent" class="tab-content">
					            <div class="tab-pane fade active in" id="one">
					                <div class="widget-body no-padding">
					                    <div class="weixin-menu-setting clearfix">
					                        <div class="mobile-menu-preview">
					                            <div class="mobile-head-title"><?php echo C('config.web.webname');?></div>
					                            <ul class="menu-list" id="menu-list">
					                                <li class="add-item extra" id="add-item">
					                                    <a href="javascript:;" class="menu-link" title="เพิ่ม菜单"><i class="weixin-icon add-gray"></i></a>
					                                </li>
					                            </ul>
					                        </div>
					                        <div class="weixin-body">
					                            <div class="weixin-content" style="display:none">
					                                <div class="item-info">
					                                    <form id="form-item" class="form-item" data-value="" >
					                                        <div class="item-head">
					                                            <h4 id="current-item-name">เพิ่มเมนูย่อย</h4>
					                                            <div class="item-delete"><a href="javascript:;" id="item_delete">ลบเมนู</a></div>
					                                        </div>
					                                        <div style="margin-top: 20px;">
					                                            <dl>
					                                                <dt id="current-item-option"><span class="is-sub-item">รายการย่อย</span>หัวข้อเมนู:<input id="item_title" name="item-title" type="text" value=""></div></dt>
					                                            </dl>
					                                            <dl class="is-item">
					                                                <dt id="current-item-type"><span class="is-sub-item">รายการย่อย</span>เนื้อหาเมนู:</dt>
					                                                <dd>
					                                                    <!--input id="type0" type="radio" name="type" value="none"><label for="type0" data-editing="1"><span class="lbl_content">无事件</span></label-->
					                                                    <input id="type1" type="radio" name="type" value="click"><label for="type1" data-editing="1"><span class="lbl_content">ส่งข้อความ</span></label>
					                                                    <input id="type2" type="radio" name="type" value="view" ><label for="type2"  data-editing="1"><span class="lbl_content">ไปยังหน้าเว็บ</span></label>
					                                                    <input id="type3" type="radio" name="type" value="miniprogram" ><label for="type3"  data-editing="1"><span class="lbl_content">ไปยังมินิโปรแกรม</span></label>
					                                                    <input id="type4" type="radio" name="type" value="media_id"><label for="type8" data-editing="1"><span class="lbl_content">ข้อความสื่อ</span></label>
					                                                    <input id="type4" type="radio" name="type" value="article_id"><label for="type8" data-editing="1"><span class="lbl_content">ข้อความแบบมีรูป</span></label>
					                                                    <!-- input id="type9" type="radio" name="type" value="scancode_push"><label for="type9" data-editing="1"><span class="lbl_content">扫码推</span></label>
					                                                    <input id="type4" type="radio" name="type" value="scancode_waitmsg"><label for="type4" data-editing="1"><span class="lbl_content">扫码推提示框</span></label>
					                                                    <input id="type5" type="radio" name="type" value="pic_sysphoto"><label for="type5" data-editing="1"><span class="lbl_content">拍照发图</span></label>
					                                                    <input id="type6" type="radio" name="type" value="pic_photo_or_album"><label for="type6" data-editing="1"><span class="lbl_content">拍照相册发图</span></label>
					                                                    <input id="type7" type="radio" name="type" value="pic_weixin"><label for="type7" data-editing="1"><span class="lbl_content">相册发图</span></label>
					                                                    <input id="type8" type="radio" name="type" value="location_select"><label for="type8" data-editing="1"><span class="lbl_content">地理位置选择</span></label> -->
					                                                </dd>
					                                            </dl>
					                                            <div id="menu-content" class="is-item">
					                                            	<div class="none_box is-view">
					                                                    <p class="menu-content-tips">คลิกเมนูนี้จะไม่เกิดเหตุการณ์ใดๆ</p>
					                                                    <dl></dl>
					                                                </div>
					                                            	<div class="click_box is-view">
					                                                    <p class="menu-content-tips">คลิกเมนูนี้จะส่งเนื้อหาต่อไปนี้</p>
					                                                    <dl>
					                                                        <dt>เนื้อหาข้อความ:<input type="text" id="key" name="key"></dt>
					                                                    </dl>
					                                                </div>
					                                                <div class="view_box is-view">
					                                                    <p class="menu-content-tips">คลิกเมนูนี้จะไปยังลิงก์ต่อไปนี้</p>
					                                                    <dl>
					                                                        <dt>ที่อยู่หน้า:<input type="text" id="url" name="url"></dt>
					                                                    </dl>
					                                                </div>
					                                                <div class="media_id_box is-view">
					                                                    <p class="menu-content-tips">คลิกเมนูนี้จะส่งข้อความจากคลังสื่อให้ผู้ใช้</p>
					                                                    <dl>
					                                                        <dt>id สื่อ WeChat:<input type="text" id="media_id" name="media_id"></dt>
					                                                    </dl>
					                                                </div>
					                                                <div class="article_id_box is-view">
					                                                    <p class="menu-content-tips">คลิกเมนูนี้จะส่งข้อความรูปภาพที่เคยส่งไปแล้วให้ผู้ใช้</p>
					                                                    <dl>
					                                                        <dt>ID ข้อความแบบมีรูป:<input type="text" id="article_id" name="article_id"></dt>
					                                                    </dl>
					                                                </div>
					                                                <div class="miniprogram_box is-view">
					                                                    <p class="menu-content-tips">คลิกเมนูนี้จะไปยังมินิโปรแกรม</p>
					                                                    <dl>
					                                                        <dt>APPID มินิโปรแกรม:<input type="text" id="appid" name="appid"></dt>
					                                                    </dl>
					                                                    <dl>
					                                                        <dt>พาธหน้าที่เปิด:<input type="text" id="pagepath" name="pagepath"></dt>
					                                                    </dl>
					                                                </div>
					                                                <!-- div class="clickbox is-click" style="display: none;">
					                                                    <input type="hidden" name="key" id="key" value="" />
					                                                    <span class="create-click"><a href="#select" id="select-resources"><i class="weixin-icon big-add-gray"></i><strong>选择现有资源</strong></a></span>
					                                                    <span class="create-click"><a href="#add" id="add-resources"><i class="weixin-icon big-add-gray"></i><strong>添加新资源</strong></a></span>
					                                                </div> -->
					                                            </div>
					                                        </div>
					                                    </form>
					                                </div>
					                            </div>
					                            <div class="no-weixin-content">
					                            	คลิกเมนูด้านซ้ายเพื่อแก้ไข
					                            </div>
					                        </div>
					                    </div>
					                    <div class="row">
					                        <div class="col-xs-4 text-center text-danger">
					                            <i class="fa fa-lightbulb-o"></i> <small>แก้ไขคุณสมบัติเมนูได้ทางขวา</small>
					                        </div>
					                    </div>
							        </div>
							    </div>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
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
//页面唯一回调函数
function <?php echo $cFun;?>(json){
	var op = operateWeixinMenuListGetOp();
	var tabid = 'weixin-menu_list';
	op['id'] = tabid;
	
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    $(this).navtab("reload",op);	// 刷新Tab页面
    $(this).navtab("switchTab",tabid);	// 切换Tab页面
}
</script>