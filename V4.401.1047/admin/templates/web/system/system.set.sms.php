<div class="bjui-pageContent">
	<fieldset>
		<legend>短信服务设置</legend>
       		<ul class="nav nav-tabs" role="tablist" id="<?php echo $cFun.$type;?>smsLis">
            	<li <?php if(Request('tab')!='log'){echo 'class="active"';}?>><a href="#<?php echo $cFun.$type;?>log" role="tab" data-toggle="tab">发送日志查询</a></li>
            	<li <?php if(Request('tab')=='temp'){echo 'class="active"';}?>><a href="#<?php echo $cFun.$type;?>temp" role="tab" data-toggle="tab">短信模版设置</a></li>
            </ul>
            
            <div class="tab-content"> 
            	<div class="tab-pane fade <?php if(Request('tab')!='temp'){echo 'active in';}?>" id="<?php echo $cFun.$type;?>log">
					快捷操作:
					<a href="index.php?a=yes&c=system.smslog&t=del" data-toggle="doajaxchecked" style="margin-bottom:10px;" data-mask="true" data-idname="ids" data-group="ids" data-confirm-msg="确定要删除选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> 批量删除</a>
					<a href="index.php?a=yes&c=system.smslog&t=clear" style="margin-bottom:10px;" data-toggle="doajax" data-confirm-msg="确定要彻底清空短信发送日志吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> 清空日志</a>
					
					<table class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr>
							<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
							<th width="5%">ID</th>
							<th width="5%">使用状态</th>
							<th width="5%">发送状态</th>
							<th width="5%">短信类型</th>
							<th width="10%">接受客户端</th>
							<th width="5%">验证码</th>
							<th width="10%">发送时间</th>
							<th width="10%">过期时间</th>
							<th>备注</th>
							<th width="8%">操作</th>
							</tr>
						</thead>
						
						<tbody>
						<?php
						if( $logList )
						{
							$i = 1;
							foreach ($logList as $k=>$v)
							{
								$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
								$status = str::CheckElse( $v['log_status'] , 1 , '<span style="color:green">'.$logMod->statusArr[$v['log_status']].'</span>' , '<span style="color:red">'.$logMod->statusArr[$v['log_status']].'</span>');
								$send = str::CheckElse( $v['log_send'] , 1 , '<span style="color:green">'.$logMod->sendArr[$v['log_send']].'</span>' , '<span style="color:red">'.$logMod->sendArr[$v['log_send']].'</span>');
								echo '<tr class="'.$cur.'">
										<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['log_id'].'"></td>
										<td>'.$v['log_id'].'</td>
										<td>'.$status.'</td>
										<td>'.$send.'</td>
										<td>'.$v['log_type'].'</td>
										<td>'.$v['log_client'].'</td>
										<td>'.$v['log_code'].'</td>
										<td>'.date('Y-m-d H:i:s',$v['log_time']).'</td>
										<td>'.date('Y-m-d H:i:s',$v['log_exptime']).'</td>
										<td>'.$v['log_remark'].'</td>
										<td style="text-align: center;">
											<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax('.$v['log_id'].',1)">删除</a>
										</td>
									</tr>';
								$i++;
							}
						}
						else
						{
							echo '<tr><td colspan="11">暂时没有发送日志!</td></tr>';
						}
						?>
						</tbody>
					</table>
		    	</div>
		    	
		    	<div class="tab-pane fade <?php if(Request('tab')=='temp'){echo 'active in';}?>" id="<?php echo $cFun.$type;?>temp">
					<a class="btn btn-secondary radius size-MINI" style="margin-bottom:10px;" data-toggle="dialog" data-mask="true" data-title="添加模版" href="index.php?d=yes&c=system.set.sms.edit&t=add" data-width="650" data-height="420" ><i class="fa fa-plus"></i> 添加模版</a>&nbsp;&nbsp;&nbsp;&nbsp;同类型的多个模版同时启用会随机选择一个服务进行发送。
					<table class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr>
							<th width="5%">ID</th>
							<th width="5%">状态</th>
							<th width="8%">短信接口</th>
							<th width="8%">模版类型</th>
							<th width="12%">第三方签名</th>
							<th width="12%">第三方模版代码</th>
							<th>替换参数</th>
							<th width="15%">创建时间</th>
							<th width="15%">操作</th>
							</tr>
						</thead>
						
						<tbody>
						<?php
						if( $smsList )
						{
							$i = 1;
							foreach ($smsList as $k=>$v)
							{
								$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
								$status = str::CheckElse( $v['sms_status'] , 0 , '<a href="javascript:;" onClick="'.$cFun.'StatusAjax(1,\''.$v['sms_id'].'\',2)"><span style="color:red">'.$smsMod->statusArr[0].'</span></a>' , '<a href="javascript:;" onClick="'.$cFun.'StatusAjax(0,\''.$v['sms_id'].'\',2)"><span style="color:green">'.$smsMod->statusArr[1].'</span></a>');
								echo '<tr class="'.$cur.'">
										<td>'.$v['sms_id'].'</td>
										<td>'.$status.'</td>
										<td>'.$v['sms_api_name'].'</td>
										<td>'.$v['sms_type'].'</td>
										<td>'.$v['sms_sign'].'</td>
										<td>'.$v['sms_tempcode'].'</td>
										<td>'.$v['sms_params'].'</td>
										<td>'.date('Y-m-d H:i:s',$v['sms_time']).'</td>
										<td style="text-align: center;">
											<a class="btn btn-secondary radius size-MINI" data-mask="true" href="index.php?d=yes&c=system.set.sms.edit&t=edit&id='.$v['sms_id'].'"  data-toggle="dialog" data-title="修改短信模版" data-width="650" data-height="420" >编辑</a> 
											<a class="btn btn-danger radius" onclick="'.$cFun.'delAjax(\''.$v['sms_id'].'\',2)">删除</a>
										</td>
									</tr>';
								$i++;
							}
						}
						else
						{
							echo '<tr><td colspan="9">暂时没有短信模版!</td></tr>';
						}
						?>
						</tbody>
					</table>
		    	</div>
	    	</div>
	</fieldset>
</div>

<script type="text/javascript">
var tab;
//页面唯一op获取函数
function <?php echo $cFun;?>GetOp(tab){
	var op=new Array();
	var ajaxData=new Object();
	ajaxData.tab = tab;
	op['type'] = 'POST';
	op['data'] = ajaxData;
	return op;
}
//删除数据
function <?php echo $cFun;?>delAjax(id,type)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	if(type==1){
		ajaxOptions['url'] = "index.php?a=yes&c=system.smslog&t=del";
	}else{
		ajaxOptions['url'] = "index.php?a=yes&c=system.sms&t=del";
	}
	ajaxOptions['confirmMsg'] = "确定要删除所选的数据吗？";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//禁用使用
function <?php echo $cFun;?>StatusAjax(status,id,stt)
{
	var type;
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $cFun;?>GetOp();
	switch(status)
	{
		case 0:
			type = "禁用";
	  		break;
	  		
		default:
			type = "使用";
	  		break;
	}
	
	ajaxData.id = id;
	ajaxData.status = status;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=system.sms&t=status";
	ajaxOptions['confirmMsg'] = "确定要"+type+"吗？";
	ajaxOptions['callback'] = "<?php echo $cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//页面唯一回调函数
function <?php echo $cFun;?>ajaxCallBack(json){
	$(this).bjuiajax("ajaxDone",json);//显示处理结果
	$(this).dialog("closeCurrent");	//关闭当前dialog
	if(json.statusCode==200){
		$(this).navtab("reload",<?php echo $cFun;?>GetOp(tab));	//刷新当前Tab页面 
	}
}
</script>