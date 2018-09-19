<div class="bjui-pageContent">
	<form action="index.php?a=yes&c=system.set.config&t=water" method="post" data-toggle="validate">
	<fieldset>
		<legend>水印上传设置</legend>
    	<table class="table table-border table-bordered table-bg table-sort">
	      	<?php
            foreach ($configArr as $key=>$val)
            {
            	//是否输出表单
            	$EchoForm = true;
            	$form = $manager->GetForm( $val );
            	//上传类类型
            	if ( $val['config_name'] == 'upload_type' )
            	{
            		$form = '<input type="text" id="'.$val['config_name'].'" name="'.$val['config_id'].'" value="'.$val['config_value'].'" size="40">';
            	}
            	//上传大小
            	else if ( $val['config_name'] == 'upload_size' )
            	{
            		$form = '<input type="text" id="'.$val['config_name'].'" name="'.$val['config_id'].'" value="'.$val['config_value'].'" size="10"> KB';
            	}
            	//上传保存位置
            	else if ( $val['config_name'] == 'upload_savetype' )
            	{
            		$form = $manager->GetForm( $val ).' <span style="color:red">如果您选择的不是本地保存，就需要您先到API管理里面设置接口相关参数！</span>';
            	}
            	//上传保存位置
            	else if ( $val['config_name'] == 'upload_savepath' )
            	{
            		$form = $manager->GetForm( $val ).' <span style="color:red">默认为空，英文。不为空则表示远程保存路径或文件名由此开头！</span>';
            	}
            	//触发剪裁的尺寸
            	else if ( $val['config_name'] == 'upload_imgwidth' || $val['config_name'] == 'upload_imgheight' )
            	{
            		if ( $val['config_name'] == 'upload_imgwidth' )
            		{
            			$EchoForm = false;
            			$uploadImgWidth = $val['config_value'];
            			$uploadImgWidthId = $val['config_value'];
            		}
            		else
            		{
            			$val['config_title'] = '触发剪裁的图片尺寸';
            			$val['config_remark'] = '当图片尺寸大于设置的宽*高时就会自动进行剪裁';
            			$form = '<input type="text" name="'.$uploadImgWidthId.'" value="'.$uploadImgWidth.'" size="8"> * <input type="text" name="'.$val['config_id'].'" value="'.$val['config_value'].'" size="8">';
            		}
            	}
            	//剪裁后的尺寸
            	else if ( $val['config_name'] == 'upload_cutwidth' || $val['config_name'] == 'upload_cutheight' )
            	{
            		if ( $val['config_name'] == 'upload_cutwidth' )
            		{
            			$EchoForm = false;
            			$uploadImgWidth = $val['config_value'];
            			$uploadImgWidthId = $val['config_value'];
            		}
            		else
            		{
            			$val['config_title'] = '剪裁后的图片尺寸';
            			$val['config_remark'] = '图片剪裁的大小为此项设置的宽*高';
            			$form = '<input type="text" name="'.$uploadImgWidthId.'" value="'.$uploadImgWidth.'" size="8"> * <input type="text" name="'.$val['config_id'].'" value="'.$val['config_value'].'" size="8">';
            		}
            	}
            	//触发水印的图片尺寸
            	else if ( $val['config_name'] == 'watermark_width' || $val['config_name'] == 'watermark_height' )
            	{
            		if ( $val['config_name'] == 'watermark_width' )
            		{
            			$EchoForm = false;
            			$uploadImgWidth = $val['config_value'];
            			$uploadImgWidthId = $val['config_value'];
            		}
            		else
            		{
            			$val['config_title'] = '触发水印的图片尺寸';
            			$val['config_remark'] = '当图片的宽*高大于此值的时候就加水印';
            			$form = '<input type="text" name="'.$uploadImgWidthId.'" value="'.$uploadImgWidth.'" size="8"> * <input type="text" name="'.$val['config_id'].'" value="'.$val['config_value'].'" size="8">';
            		}
            	}
            	//水印的位置
            	else if ( $val['config_name'] == 'watermark_location' )
            	{
            		$location = array(
            			'顶部居左','顶部居中','顶部居右',
            			'左边居中','图片中心','右边居中',
            			'底部居左','底部居中','底部居右',
            		);
            		$form = '<table class="table table-border table-bordered table-hover table-bg table-sort mt-10"><tr>';
            		for($i=1 ; $i<=9 ; $i++ )
            		{
            			$checked = '';
            			if( $val['config_value'] == $i )
            			{
            				$checked = 'checked';
            			}
            			$form .= '<td><input type="radio" name="'.$val['config_id'].'"  data-toggle="icheck" data-label="'.$location[$i-1].'" value="'.$i.'" '.$checked.'></td>';
            			if( $i == 6 || $i == 3)
            			{
            				$form .= '</tr><tr>';
            			}
            		}
            		$form .= '</tr></table>';
            	}
            	
            	if ( $EchoForm )
            	{
					echo '<tr>
	        		<td width="20%"><b>'.$val['config_title'].'</b><br />
					<span class="STYLE2" id="help5">'.$val['config_remark'].'</span></td>
	                <td>'.$form.'</td>
	                </tr>';
            	}
            }
           ?>
    	</table>
	</fieldset>
	</form>
</div>


<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-green" data-icon="save">保存</button></li>
    </ul>
</div>

<script>
$(function(){
    $("#watermark_color").colorpicker({
        fillcolor:true
    });
});
</script>