<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.safe.shield&t=config" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>เปิดใช้การตรวจจับ</b></th></tr></thead>
      <tr>
        <td width="200">ตรวจสอบอักษรที่สงวนไว้ : </td>
        <td><?php echo $manager->GetForm('system' , 'check_shield');?></td>
      </tr>
      <tr>
        <td width="200">ตรวจสอบอักษรที่ห้ามใช้ : </td>
        <td><?php echo $manager->GetForm('system' , 'check_disable');?></td>
      </tr>
    </table>
	
	<table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>คำศัพท์สงวน</b></th></tr></thead>
      <tr>
        <td width="250">ห้ามใช้คำที่สงวนเหล่านี้ทุกโมดูล</td>
        <td><textarea name="disable" cols="70" rows="10"><?php echo $disable;?></textarea></td>
      </tr>
    </table>
	<table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="4" style="text-align:left;"><b>คำห้ามใช้</b></th></tr></thead>
      <tr>
        <td width="250">ห้ามมีคำห้ามใช้เหล่านี้ทุกโมดูล</td>
        <td><textarea name="shield" cols="70" rows="10"><?php echo $shield;?></textarea></td>
      </tr>
    </table>
  </form>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">ปิด</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">จัดเก็บ</button></li>
    </ul>
</div>