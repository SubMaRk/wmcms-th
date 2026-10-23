<div class="bjui-pageContent">
	<form action="index.php?a=yes&c=finance.apply&t=status" name="<?php echo $cFun;?>Form" class="form form-horizontal" data-reload="false" data-toggle="validate" method="post" data-confirm-msg="ยืนยัน处理此คำขอการเงิน吗？" data-callback="<?php echo $cFun;?>">
	<input type="hidden" name="id" value="<?php echo $id;?>">
	    <table class="table table-border table-bordered table-bg table-sort <?php echo $cFun?>Table">
		     <tr>
		        <td width="120" class="titleTd">ID คำขอ</td>
		        <td class="titleTd"><?php echo $data['apply_id'];?></td>
		        <td width="120" class="titleTd">สถานะคำขอ</td>
		        <td class="titleTd">
		        	<?php 
					switch ($data['apply_status'])
					{
						case '0':
							echo '<span style="color:red">待处理</span>';
							break;
						case '1':
							echo '<span style="color:green">ผ่านแล้ว</span>';
							break;
						case '2':
							echo '<span style="color:#a9a9a9">未通过</span>';
							break;
					}
					?>
		        </td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">โมดูลต้นทาง</td>
		        <td class="titleTd"><?php echo $data['apply_module'];?></td>
		        <td width="120" class="titleTd">ID เนื้อหาโมดูล</td>
		        <td class="titleTd"><?php echo $data['apply_cid'];?></td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">เดือนที่ชำระบัญชี</td>
		        <td class="titleTd"><?php echo $data['apply_month'];?></td>
		        <td width="120" class="titleTd">เวลายื่นคำขอชำระบัญชี</td>
		        <td class="titleTd"><?php echo date( 'Y-m-d H:i:s' , $data['apply_time']);?></td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">ผู้ดูแลระบบที่ยื่นคำขอ</td>
		        <td class="titleTd"><?php echo $data['aname'].'（ID：'.$data['apply_manager_id'].'）';?></td>
		        <td width="120" class="titleTd">หมายเหตุคำขอ</td>
		        <td class="titleTd"><?php echo $data['apply_remark'];?></td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">รางวัล<?php echo $goldName;?></td>
		        <td class="titleTd"><?php echo $data['apply_bonus'];?></td>
		        <td width="120" class="titleTd">หมายเหตุรางวัล</td>
		        <td class="titleTd"><?php echo $data['apply_bonus_remark'];?></td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">หัก<?php echo $goldName;?></td>
		        <td class="titleTd"><?php echo $data['apply_deduct'];?></td>
		        <td width="120" class="titleTd">หมายเหตุการหัก</td>
		        <td class="titleTd"><?php echo $data['apply_deduct_remark'];?></td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">ยอดชำระบัญชีรวม<?php echo $goldName;?></td>
		        <td class="titleTd"><?php echo $data['apply_total'];?></td>
		        <td width="120" class="titleTd">ยอดเข้าบัญชีจริง<?php echo $goldName;?></td>
		        <td class="titleTd"><?php echo $data['apply_real'];?> / <?php echo $financeConfig['rmb_to_gold2'];?> = <?php echo $data['apply_real']/$financeConfig['rmb_to_gold2'];?>หยวน</td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">ผู้ใช้ที่ได้รับเงิน</td>
		        <td class="titleTd" colspan="3"><?php echo $data['user_name'].'（ID：'.$data['apply_to_user_id'].'）';?></td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">ผู้ดูแลที่จัดการคำขอ</td>
		        <td class="titleTd"><?php echo $data['hname'].'（ID：'.$data['apply_handle_manager_id'].'）';?></td>
		        <td width="120" class="titleTd">เวลาจัดการคำขอ</td>
		        <td class="titleTd"><?php echo date( 'Y-m-d H:i:s' , $data['apply_handle_time']);?></td>
		      </tr>
		      <tr>
		        <td width="120" class="titleTd">หมายเหตุการจัดการคำขอ</td>
		        <td class="titleTd" colspan="3">
		        	<textarea <?php if($data['apply_status'] != '0'){echo 'disabled';}?> name="remark" data-toggle="autoheight" cols="50" rows="1"><?php echo $data['apply_handle_remark'];?></textarea>
		       	</td>
		      </tr>
		      <?php
		      if($data['apply_status'] == '0')
		      {
		      ?>
		      <tr>
		        <td width="120" class="titleTd">การดำเนินการ</td>
		        <td class="titleTd" colspan="3">
		        	<select data-toggle="selectpicker" name="status">
	        			<option value="1">อนุมัติคำขอ</option>
	        			<option value="2">ปฏิเสธคำขอ</option>
		        	</select>
		       	</td>
		      </tr>
		      <?php
		      }
		      ?>
		</table>
	</form>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close btn btn-danger size-MINI radius"><i class="fa fa-times"></i> ปิด</button></li>
        <?php
        if( $data['apply_status']=='0'){
        	echo '<li><button type="submit" class="btn-green" data-icon="save">提交处理</button></li>';
        	
        }
        ?><li>
    </ul>
</div>

<script type="text/javascript">
function <?php echo $cFun;?>(json){
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
	$(this).dialog("closeCurrent");
	$(this).navtab("reload",financeApplyListGetOp());	//刷新当前Tab页面 
}
</script>