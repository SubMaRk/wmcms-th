<style>
.<?php echo $cFun?>Table{margin-bottom:20px}
</style>

<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=finance.config&t=edit" method="post" data-toggle="validate">
    <table class="table table-border table-bordered table-hover table-bg table-sort <?php echo $cFun?>Table" id="<?php echo $cFun?>Finance">
      <thead><tr><th colspan="6" style="text-align:left;"><b>ตั้งค่าการเงิน</b></th></tr></thead>
      <tr>
        <td width="200">เปิดเติมเงินหรือไม่:</td>
        <td width="150"><?php echo $manager->GetForm('finance' , 'recharge_open');?></td>
        <td width="150">ตั้งค่าอัตราเติมเงิน：</td>
        <td width="250">1 หยวน เท่ากับ <?php echo $manager->GetForm('finance' , 'rmb_to_gold2');?> <?php echo $userConfig['gold2_name'];?></td>
      	<td width="120">รางวัลเติมเงินครั้งแรก:</td>
        <td><?php echo $manager->GetForm('finance' , 'recharge_reward_gold2');?> <?php echo $userConfig['gold2_name'];?>, 0 หมายถึงไม่ให้รางวัล!</td>
      </tr>
      <tr>
        <td width="200">是否开启余额兑换<?php echo $userConfig['gold2_name'];?>：</td>
        <td><?php echo $manager->GetForm('finance' , 'money_to_gold2_open');?></td>
        <td>ตั้งค่าอัตราแลกเปลี่ยน：</td>
        <td colspan="3">1 ยอดเงินเท่ากับ <?php echo $manager->GetForm('finance' , 'money_to_gold2');?> <?php echo $userConfig['gold2_name'];?></td>
      </tr>
      <tr>
        <td width="200">是否<?php echo $userConfig['gold2_name'];?>兑换<?php echo $userConfig['gold1_name'];?>：</td>
        <td><?php echo $manager->GetForm('finance' , 'gold2_to_gold1_open');?></td>
        <td>ตั้งค่าอัตราแลกเปลี่ยน：</td>
        <td colspan="3">1<?php echo $userConfig['gold2_name'];?>等于 <?php echo $manager->GetForm('finance' , 'gold2_to_gold1');?> <?php echo $userConfig['gold1_name'];?></td>
      </tr>
      <tr>
        <td width="200">是否<?php echo $userConfig['gold1_name'];?>兑换<?php echo $userConfig['gold2_name'];?>：</td>
        <td><?php echo $manager->GetForm('finance' , 'gold1_to_gold2_open');?></td>
        <td>ตั้งค่าอัตราแลกเปลี่ยน：</td>
        <td colspan="3">1<?php echo $userConfig['gold1_name'];?>等于 <?php echo $manager->GetForm('finance' , 'gold1_to_gold2');?> <?php echo $userConfig['gold2_name'];?></td>
      </tr>
      <tr>
        <td width="200">เปิดถอนเงินหรือไม่:</td>
        <td><?php echo $manager->GetForm('finance' , 'cash_open');?></td>
        <td width="200">ค่าธรรมเนียมถอน:</td>
        <td><?php echo $manager->GetForm('finance' , 'cash_cost');?> %</td>
        <td width="200">ยอดถอนขั้นต่ำ:</td>
        <td><?php echo $manager->GetForm('finance' , 'cash_lowest');?> 元</td>
      </tr>
      <tr>
        <td width="200">是否<?php echo $userConfig['gold2_name'];?>兑换余额：</td>
        <td><?php echo $manager->GetForm('finance' , 'gold2_to_money_open');?></td>
        <td>ตั้งค่าอัตราแลกเปลี่ยน：</td>
        <td colspan="3">1<?php echo $userConfig['gold2_name'];?>等于 <?php echo $manager->GetForm('finance' , 'gold2_to_money');?> 余额 【<span style="color:red">开启后可使用<?php echo $userConfig['gold2_name'];?>兑换余额提现，否则只能提现余额！</span>】</td>
      </tr>
      <tr>
        <td width="200">ที่อยู่ซื้อรหัสบัตร (เช่น ร้าน Taobao):</td>
        <td colspan="5"><?php echo $manager->GetForm('finance' , 'card_buy_url');?></td>
      </tr>
      <tr>
        <td width="200">โปรโมชันเติมเงิน：</td>
        <td colspan="5"><?php echo $manager->GetForm('finance' , 'activity_open');?> 活动的赠送比例请到充值等级菜单里面设置</td>
      </tr>
      <tr class="<?php echo $cFun.$type;?>activityBox" <?php if( $financeConfig['activity_open'] != 1){?>style="display:none"<?php }?>>
        <td width="200">เวลาโปรโมชันเติมเงิน：</td>
        <td colspan="5">
        	<input type="text" id="activity_starttime" name="finance[activity_starttime]" value="<?php echo date('Y-m-d H:i:s',$financeConfig['activity_starttime']);?>" data-toggle="datepicker" data-pattern="yyyy-MM-dd H:m:s" size="19">
			到 <input type="text" id="activity_endtime" name="finance[activity_endtime]" value="<?php echo date('Y-m-d H:i:s',$financeConfig['activity_endtime']);?>" data-toggle="datepicker" data-pattern="yyyy-MM-dd H:m:s" size="19">
		</td>
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




<script>
$(document).ready(function(){
	$('#<?php echo $cFun?>Finance input').css("width",'80px');
	$('#card_buy_url').css("width",'500px');

	$('input[name="339"]').on('ifChanged', function(e) {
		 var checked = $(this).is(':checked'), val = $(this).val();
		 if (val == 1){
			 $('.<?php echo $cFun.$type;?>activityBox').show();
		 }else{
			 $('.<?php echo $cFun.$type;?>activityBox').hide();
		}
	});
});
</script>
