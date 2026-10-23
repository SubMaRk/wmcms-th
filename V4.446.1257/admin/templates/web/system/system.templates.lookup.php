<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="index.php?c=system.templates.lookup" method="post">
    <input type="hidden" name="pageSize" value="<?php echo $pageSize;?>">
	<input type="hidden" name="pageCurrent" value="<?php echo $pageCurrent;?>">
	<input type="hidden" name="orderField" value="<?php echo $orderField;?>">
	<input type="hidden" name="orderDirection" value="<?php echo $orderDirection;?>">
	<input type="hidden" name="module" value="<?php echo $module;?>">
	<input type="hidden" name="page" value="<?php echo $page;?>">
        <div class="bjui-searchBar">
            <label>คีย์เวิร์ดเทมเพลต:</label><input type="text" id="key" value="<?php echo $key;?>" name="key" size="10" />&nbsp;
            <button type="submit" class="btn-default" data-icon="search">สืบค้น</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-icon="undo">ล้างการสืบค้น</a>&nbsp;
        </div>
    </form>
</div>

<div class="bjui-pageContent">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
			<th width="20" data-order-field="templates_id">ID</th>
			<th style="width:150px">ชื่อ</th>
			<th style="width:60px">เวอร์ชันเรียบง่าย</th>
			<th style="width:60px">3G</th>
			<th style="width:60px">ทัชสกรีน</th>
			<th style="width:60px">คอมพิวเตอร์</th>
            <th width="10" style="text-align: center;">ดำเนินการ</th>
            </tr>
		</thead>
		<tbody>
			<?php
			if( $tempArr )
			{
				$i = 1;
				foreach ($tempArr as $k=>$v)
				{
					$cur = str::CheckElse( $i%2 , 0 , '' , 'even_index_row');
					$temp1 = str::CheckElse( $v['temp_temp1'] , '' , '<span style="color:#B9B6B6">无模版</span>' , '<span style="color:green">有模版</span>');
					$temp2 = str::CheckElse( $v['temp_temp2'] , '' , '<span style="color:#B9B6B6">无模版</span>' , '<span style="color:green">有模版</span>');
					$temp3 = str::CheckElse( $v['temp_temp3'] , '' , '<span style="color:#B9B6B6">无模版</span>' , '<span style="color:green">有模版</span>');
					$temp4 = str::CheckElse( $v['temp_temp4'] , '' , '<span style="color:#B9B6B6">无模版</span>' , '<span style="color:green">有模版</span>');
					$filedName = str::CheckElse($reName, '', 'type', $reName);
					echo '<tr class="'.$cur.'">
							<td style="text-align: center;">'.$v['temp_id'].'</td>
							<td>'.$v['temp_name'].'</td>
							<td>'.$temp1.'</td>
							<td>'.$temp2.'</td>
							<td>'.$temp3.'</td>
							<td>'.$temp4.'</td>
							<td style="text-align: center;">
								<a href="javascript:;" data-toggle="lookupback" data-args="{\''.$filedName.'['.$filedName.'_'.$tid.']\':\''.$v['temp_id'].'\', \'temp[temp_'.$name.']\':\''.$v['temp_name'].'\'}" class="btn btn-blue" title="选择本项" data-icon="check">选择</a>
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
        <span>ต่อหน้า&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
            </select>
        </div>
        <span>&nbsp; รายการ จากทั้งหมด <?php echo $total;?> 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="<?php echo $total;?>" data-page-size="<?php echo $pageSize;?>" data-pageCurrent="<?php echo $pageCurrent?>"></div>
</div>

<script>
$(document).ready(function(){
	$(".btn-orange").click(function(){
		$("#key").val("");
		$("#pagerForm").submit();
	});
});
</script>