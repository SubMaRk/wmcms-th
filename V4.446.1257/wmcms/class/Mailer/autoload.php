<?php
/**
* PHPMailer 6.x 的加载器（无 composer 环境用）
*
* 站内代码和插件都可能直接写 new PHPMailer()，所以这里额外把 6.x 的
* 命名空间类别名成旧的全局类名，保持兼容。
*
* 版本：PHPMailer 6.9.3（MIT）
*/
require_once __DIR__.'/src/Exception.php';
require_once __DIR__.'/src/PHPMailer.php';
require_once __DIR__.'/src/SMTP.php';

//5.x 时代的全局类名，插件和老代码仍在用
if( !class_exists('PHPMailer', false) )
{
	class_alias('PHPMailer\\PHPMailer\\PHPMailer', 'PHPMailer');
}
//5.x 的异常类名
if( !class_exists('phpmailerException', false) )
{
	class_alias('PHPMailer\\PHPMailer\\Exception', 'phpmailerException');
}
