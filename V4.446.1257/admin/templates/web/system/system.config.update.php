<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>
<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.config.config&t=update" method="post" data-toggle="validate">
	
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table">
      <thead><tr><th colspan="2" style="text-align:left;"><b>อัปเดตการตั้งค่าเว็บไซต์</b></th></tr></thead>
      <tr>
        <td>คำอธิบาย:</td>
        <td style="line-height: 23px;font-size: 14px;">หากใช้ครั้งแรกหรือแก้ไขการตั้งค่าเว็บไซต์แล้วไม่ทำงาน โปรดอัปเดตการตั้งค่าเว็บไซต์ด้วยตนเอง</td>
      </tr>
      <tr>
        <td width="150">การดำเนินการล้าง:</td>
        <td>
        	<button type="submit" class="btn btn-green" data-icon="refresh"><i class="fa fa-refresh"></i> อัปเดตการตั้งค่าเว็บไซต์</button>
        </td>
      </tr>
    </table>

  </form>
</div>
