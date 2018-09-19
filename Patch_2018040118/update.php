<?php
$configTable = wmsql::table('config_config');
$optionTable = wmsql::table('config_option');
wmsql::exec("insert  into `{$optionTable}`(`config_id`,`option_title`,`option_value`,`option_order`) values (395,'关闭域名认证','0',1),(395,'开启域名认证','1',2);");

wmsql::exec("INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('1', 'upload', '上传开关', 'upload_open', '0', 'select', '是否允许前台上传文件', '0');");

wmsql::exec("INSERT INTO `{$optionTable}` (`config_id`,`option_title`,`option_value`,`option_order`) VALUES ('398','关闭上传','0','1'),('398', '开启上传', '1', '2'); ");
?>