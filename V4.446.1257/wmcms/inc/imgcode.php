<?php
$C['module']['inc']['class']=array('img','str','file');
require_once 'common.inc.php';
$base64 = 0;
//允许上传组件带上自己的 session id，但必须先通过格式校验（见 SetSessionId）
if( Request('session_id') != '' )
{
	if( !SetSessionId(Request('session_id')) )
	{
		header('Content-Type: image/png');
		die();
	}
}
if( Request('base64') == '1' )
{
	$base64 = 1;
}
$imgCode = Img::ImgCode(4,20,0,0,$base64);
echo $imgCode;
die();
?>