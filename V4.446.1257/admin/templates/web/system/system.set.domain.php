<div class="bjui-pageContent">
	<form name="form1" action="index.php?a=yes&c=system.set.domain&t=domain" method="post" data-toggle="validate">
	<fieldset>
		<legend>ตั้งค่าการผูกโดเมนกับเทมเพลต</legend>
       		<ul class="nav nav-tabs" role="tablist">
            	<li class="active"><a href="#templates" role="tab" data-toggle="tab">ตั้งค่าโดเมน</a></li>
            	<li><a href="#domain" role="tab" data-toggle="tab">ผูกโดเมน</a></li>
            </ul>
            
            <div class="tab-content"> 
            	<div class="tab-pane fade active in" id="templates">   
			    	<table class="table table-border table-bordered table-bg table-sort">
				      	<tr>
			        		<td width="20%"><b>ตั้งค่าการเปลี่ยนเส้นทาง 301</b><br />
							<span class="STYLE2">อย่าใส่ http:// ในโดเมน หากไม่ตั้งค่าให้เว้นว่าง ไม่อย่างนั้นเว็บไซต์จะเข้าถึงไม่ได้</span></td>
			                <td width="30%">
			                	<input name="bdomain" value="<?php echo C('config.web.bdomain');?>" type="text" size="30" placeholder="选填：例如将<?php echo WMDOMAIN?>"/>
			                </td>
	                		<td>ไปที่</td>
			                <td>
			                	<input name="ndomain" value="<?php echo C('config.web.ndomain');?>" type="text" size="30" placeholder="选填：跳转ถึงwww.<?php echo WMDOMAIN?>"/>
			                </td>
						</tr>
						
				      	<tr>
			        		<td width="20%"><b>แสดงป้ายเวอร์ชันหรือไม่</b></td>
			                <td colspan="3">
			                	<select data-toggle="selectpicker" name="pt_rep">
			                        <option value="1" <?php if( C('config.web.pt_rep')=='1'){echo 'selected';}?>>显示版本标识</option>
			                        <option value="0" <?php if( C('config.web.pt_rep')=='0'){echo 'selected';}?>>不显示版本标识</option>
			                    </select>
			                </td>
						</tr>
						
						<?php
						$tpArr = array('简洁','3G','หน้าจอสัมผัส','คอมพิวเตอร์');
						for($i=1 ; $i <= 4 ; $i++)
						{
							echo '<tr>
				        		<td width="20%"><b>'.$tpArr[$i-1].'版绑定域名</b><br />
								<span class="STYLE2">直接访问'.$tpArr[$i-1].'版的域名(无需加http://)</span></td>
				                <td width="30%">
				                	<input name="domain'.$i.'" value="'.C('config.web.domain'.$i).'" placeholder="不绑定请留空" type="text" size="30" />
				                </td>
		                		<td>版本标识</td>
				                <td>
				                	<input name="tpmark'.$i.'" value="'.C('config.web.tpmark'.$i).'" type="text"/>
				                </td>
							</tr>';
						}
						?>
			    	</table>
		    	</div>
		    	
		    	<div class="tab-pane fade" id="domain">   
			    	<table class="table table-border table-bordered table-bg table-sort">
				      	<tr>
			        		<td width="15%"><b>โดเมนหลังบ้าน</b><br />
							<span class="STYLE2">จะผูกโดเมนที่เข้าหลังบ้านโดยตรงหรือไม่ หากไม่ผูกให้เว้นว่าง (โดเมนไม่ต้องใส่ http://)</span></td>
			                <td width="35%">
			                	<input name="admin_domain" value="<?php echo C('config.web.admin_domain');?>" type="text" size="25"/>
			                </td>
	                		<td width="25%">เปิดการยืนยันโดเมน<br/>
			                	เมื่อเปิดแล้ว จะเข้าหลังบ้านได้เฉพาะผ่านโดเมนหลังบ้านที่ผูกไว้
			                </td>
			                <td>
			                <select id="admin_domain_access" name="admin_domain_access" data-toggle="selectpicker">
			                	<?php echo $manager->GetConfigOption('domain[admin_domain_access]',$adminDomainAccess);?>
							</select>
			                </td>
						</tr>
						<tr>
			        		<td colspan="4"><span class="STYLE2"><b>โมดูลที่ไม่ผูกโดเมนให้เว้นว่าง(โดเมนไม่ต้องใส่ http://)</b></span></td>
						</tr>
						<?php
						foreach ($domainArr as $k=>$v)
						{
							echo '<tr>
				        		<td width="20%"><b>'.$v['domain_title'].'</b></td>
				                <td colspan="3">
				                	<input name="domain['.$v['domain_id'].']" value="'.$v['domain_domain'].'" placeholder="不绑定请留空" type="text" size="30"/>
				                </td>
							</tr>';
						}
						?>
			    	</table>
		    	</div>
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