<?php
$C['module']['inc']['class']=array('img','str');
require_once 'common.inc.php';
if( Request('session_id') != '' )
{
	SetSessionId(Request('session_id'));
}
echo Img::ImgCode(4);
?>