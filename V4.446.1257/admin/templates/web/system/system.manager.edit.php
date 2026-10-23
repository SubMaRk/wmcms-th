<div class="bjui-pageContent">
<form action="index.php?a=yes&c=system.manager.manager&t=<?php echo $type;?>" data-reload="false" data-toggle="ajaxform" method="post" <?php if($d) { echo 'data-callback="'.$cFun.'"';}?>>
<input name="id" type="hidden" class="input-text" value="<?php echo $id;?>">
<table class="table table-border table-bordered table-bg table-sort">
    <tr>
      <td valign="top" width="150"><b>สถานะบัญชี:</b></td>
      <td valign="top">
        <input type="radio" name="manager_status" value="1" <?php if ( C('manager_status',null,'data') == '1' ) echo 'checked';?> data-toggle="icheck" data-label="ใช้">
        <input type="radio" name="manager_status" value="0" <?php if ( C('manager_status',null,'data') == '0' ) echo 'checked';?> data-toggle="icheck" data-label="ปิดใช้งาน">
      </td>
	</tr>
    <tr>
      <td valign="top"><b>สิทธิ์การจัดการ:</b></td>
      <td valign="top">
      <select data-toggle="selectpicker" name="manager_cid">
      <?php 
      if($compArr)
      {
	      foreach ($compArr as $k=>$v)
	      {
	      	$selected = str::CheckElse( $v['comp_id'] , C('manager_cid',null,'data') ,'selected=""');
	      	echo '<option value="'.$v['comp_id'].'" '.$selected.'>'.$v['comp_name'].'</option>';
	      }
      }
      ?>
      </select>
      </td>
	</tr>
    <tr>
      <td valign="top"><b>บัญชีเข้าสู่ระบบ:</b></td>
      <td valign="top"><input name="manager_name" type="text" class="input-text" value="<?php echo C('manager_name',null,'data');?>" <?php if ( $id != '' ) echo 'readonly';?>></td>
	</tr>
    <tr>
      <td valign="top"><b>รหัสผ่านเข้าสู่ระบบ:</b><?php if ( $id != '' ) echo '<br/>不修改密码就不填写';?></td>
      <td valign="top"><input name="manager_psw" type="text" class="input-text"></td>
	</tr>
    <tr>
      <td valign="top"><b>รหัสผ่านอีกครั้ง:</b></td>
      <td valign="top"><input name="manager_cpsw" type="text" class="input-text"></td>
	</tr>
    <tr>
      <td valign="top" colspan="2"><button type="submit" class="btn-green" data-icon="save">ส่งข้อมูล</button></td>
	</tr>
</table>
</form>
</div>



<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ยกเลิก</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">บันทึก</button></li>
    </ul>
</div>

<script type="text/javascript">
function <?php echo $cFun;?>(json){
	$(this).bjuiajax("ajaxDone",json);// 显示处理结果
    if( json.statusCode == '200' ){
        $(this).dialog("closeCurrent");//关闭
    	$(this).navtab("reload",systemManagerListGetOp());	// 刷新当前Tab页面
    }
}
</script>