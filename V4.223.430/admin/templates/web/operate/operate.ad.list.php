<style>
.table tr {
    height: 35px;
}
thead th {
	text-align: center;
}
.list-tool{
	margin-bottom:5px;
}
</style>
<div class="bjui-pageHeader">
	<div class="row cl pt-10 pl-10">
		<div class="list-tool pl-15">
            <span >快捷操作：</span>
			<a href="index.php?a=yes&c=operate.ad&t=status&status=1" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="确定要审核选中项吗？" data-callback="<?php echo $type.$cFun;?>ajaxCallBack" class="btn btn-warning radius"> 批量审核</a>
			<a href="index.php?a=yes&c=operate.ad&t=del" data-toggle="doajaxchecked" data-idname="ids" data-group="ids" data-confirm-msg="确定要删除选中项吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $type.$cFun;?>ajaxCallBack"> <i class="fa fa-remove"></i> 批量删除</a>
			<a href="index.php?a=yes&c=operate.ad&t=clear" data-toggle="doajax" data-confirm-msg="此操作不可撤回确定要清空吗？" class="btn btn-danger size-MINI radius" data-callback="<?php echo $type.$cFun;?>ajaxCallBack"><i class="fa fa-trash-o"></i> 清空记录</a>
		</div>
		<div class="list-tool">
			<form id="pagerForm" name="<?php echo $cFun.$type;?>Form" data-toggle="ajaxsearch" data-loadingmask="true" action="<?php echo $url;?>" method="post">
				<input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
				<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
				<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
				<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
                <span class="" style="float:left;margin:5px 0 0 15px;">快速查询：</span>
                
                
                <select data-toggle="selectpicker" id="ad_pt" name="ad_pt" data-width="100">
                	<option value="">全部平台</option>
                	<?php
                	foreach ($ptArr as $k=>$v)
                	{
                		$checked = str::CheckElse( $k , $ad_pt , 'selected=""' );
                		echo '<option value="'.$k.'" '.$checked.'>'.$v.'</option>';
                	}
                	?>
                </select>
                
                <input type="text" placeholder="请输入关键字" value="<?php echo $name;?>" name="name" size="15">
				<button type="submit" class="btn btn-warning radius" data-icon="search">查询</button>
				<a id="<?php echo $type.$cFun;?>refresh" class="btn size-MINI btn-primary radius"><i class="fa fa-refresh fa-spin"></i> 刷新</a>
			</form>
		</div>
		<div class="list-tool pl-15" style="color: red;font-size:16px; margin-top:10px;margin-bottom:10px;">
			所有广告都可以JS调用，调用方法：
			&lt;script src="/files/ajs/{广告id}.js">&lt;/script>
		</div>
	</div>
</div>

<div class="bjui-pageContent">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
				<th style="text-align: center;" width="2%;"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
				<th width="5%" data-order-field="ad_id">ID</th>
				<th width="5%" data-order-field="ad_time_type">是否限时</th>
				<th width="5%" data-order-field="ad_status">是否显示</th>
				<th>广告标题</th>
				<th width="8%" data-order-field="ad_pt">平台</th>
				<th width="8%" data-order-field="ad_type">类型</th>
				<th width="5%" data-order-field="ad_price">单价</th>
	            <th width="15%" data-order-field="">添加时间</th>
	            <th width="15%">操作</th>
	            </tr>
			</thead>
			<tbody id="<?php echo $type.$cFun?>List">
			<?php
			if( $dataArr )
			{
				$i = 1;
				foreach ($dataArr as $k=>$v)
				{
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					$status = str::CheckElse( $v['ad_status'] , 0 , '<a href="javascript:;" onClick="'.$type.$cFun.'StatusAjax(1,'.$v['ad_id'].')"><span style="color:red">待审核</span></a>' , '<a href="javascript:;" onClick="'.$type.$cFun.'StatusAjax(0,'.$v['ad_id'].')"><span style="color:green">已审核</span></a>');
					$img = str::CheckElse( $v['ad_img'] , '' , '暂无图片' , '<img height=\'200\' width=\'500\' src=\''.$v['ad_img'].'\' />');
				
					if( $v['ad_time_type'] == '0')
					{
						$time = "永久有效";
					}
					else
					{
						if( time() < $v['ad_start_time'] )
						{
							$time = '<span style="color:red">暂未开始</span>';
						}
						else if( time() > $v['ad_end_time'] )
						{
							$time = '<span style="color:#CCC8C8">已经结束</span>';
						}
						else
						{
							$time = '<span style="color:green">正在进行</span>';
						}
					}
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;"><input type="checkbox" name="ids" data-toggle="icheck" value="'.$v['ad_id'].'"></td>
							<td style="text-align: center;">'.$v['ad_id'].'</td>
							<td style="text-align: center;">'.$time.'</td>
							<td style="text-align: center;">'.$status.'</td>
							<td style="text-align: center;">'.$v['ad_name'].'</td>
							<td style="text-align: center;">'.$adSer->GetPt($v['ad_pt']).'</td>
							<td style="text-align: center;">'.$adSer->GetType($v['ad_type']).'</td>
							<td style="text-align: center;">'.$v['ad_price'].'</td>
							<td style="text-align: center;">'.date( 'Y-m-d H:i:s' , $v['ad_time']).'</td>
							<td style="text-align: center;" data-noedit="true">
								<button type="button" class="btn btn-success radius size-MINI" data-toggle="tooltip" data-placement="left" data-html="true" title="'.$img.'">图片</button>
				            	<a class="btn btn-secondary radius size-MINI" data-toggle="navtab" data-id="ad-edit" data-title="编辑广告广告" href="index.php?d=yes&c=operate.ad.edit&t=edit&id='.$v['ad_id'].'">编辑</a> 
								<a class="btn btn-danger radius" onclick="'.$type.$cFun.'delAjax('.$v['ad_id'].')">删除</a>
				            </td>
						</tr>';
					$i++;
				}
			}
			else
			{
				echo '<script type="text/javascript">$(document).ready(function(){$(this).alertmsg("info", "没有数据了!")});</script>';
			}
			?>
			</tbody>
		</table>
</div>

<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
            </select>
        </div>
        <span>&nbsp;条，共 <?php echo $total;?> 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>">
    </div>
</div>

<script type="text/javascript">
//页面唯一op获取函数
function <?php echo $type.$cFun;?>GetOp(){
	var op=new Array();
	op['type'] = 'POST';
	op['data'] = $("[name=<?php echo $type.$cFun;?>Form]").serializeArray();
	return op;
}
//删除数据
function <?php echo $type.$cFun;?>delAjax(id)
{
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $type.$cFun;?>GetOp();
	
	ajaxData.id = id;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=operate.ad&t=del";
	ajaxOptions['confirmMsg'] = "确定要删除所选的广告吗？";
	ajaxOptions['callback'] = "<?php echo $type.$cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//审核广告
function <?php echo $type.$cFun;?>StatusAjax(status,id)
{
	var type;
	var ajaxOptions=new Array();
	var ajaxData=new Object();
	ajaxOptions = <?php echo $type.$cFun;?>GetOp();

	//用户操作类型
	switch(status)
	{
		case 0:
			type = "取消审核";
	  		break;
	  		
		default:
			type = "通过审核";
	  		break;
	}
	
	ajaxData.id = id;
	ajaxData.status = status;
	ajaxOptions['data'] = ajaxData;
	ajaxOptions['url'] = "index.php?a=yes&c=operate.ad&t=status";
	ajaxOptions['confirmMsg'] = "确定要"+type+"广告吗？";
	ajaxOptions['callback'] = "<?php echo $type.$cFun;?>ajaxCallBack";
	$(".btn-danger").bjuiajax('doAjax', ajaxOptions);
}
//页面唯一回调函数
function <?php echo $type.$cFun;?>ajaxCallBack(json){
	$(this).bjuiajax("ajaxDone",json);//显示处理结果
	$(this).dialog("closeCurrent");	//关闭当前dialog
	$(this).navtab("reload",<?php echo $type.$cFun;?>GetOp());	//刷新当前Tab页面 
}


$(document).ready(function(){
	$('#<?php echo $type.$cFun;?>refresh').click(function() {
	   $(this).navtab("reload",<?php echo $type.$cFun;?>GetOp());// 刷新当前Tab页面
	});
});
</script>