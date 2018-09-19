<?php
wmsql::exec("INSERT INTO `".wmsql::table("config_config")."` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('6', 'link', '公共链接出站模式', 'link_url_outtype', '1', 'select', '公共链接出站模式', '1'); ");

wmsql::exec("INSERT INTO `".wmsql::table("config_option")."` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('403', '直接跳出', '1', '1'); ");

wmsql::exec("INSERT INTO `".wmsql::table("config_option")."` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('403', '进入详情页', '2', '2'); ");

wmsql::exec("UPDATE `".wmsql::table("config_config")."` SET `config_module` = 'system' ,`config_remark` = '后台文件所在的目录,如：admin' ,`config_order` = '2' WHERE `config_name` = 'admin_path' and `config_module` = 'system' AND`config_title` = '后台目录'; ");

wmsql::exec("UPDATE `".wmsql::table("config_config")."` SET `config_remark` = '网站的主域名(禁止/结尾,无需填写http://)' WHERE `config_name` = 'weburl' and `config_module` = 'system' AND`config_title` = '网站主域'; ");

wmsql::exec("UPDATE `".wmsql::table("config_config")."` SET `config_order` = '1' WHERE `config_name` = 'upload_savepath' and `config_module` = 'upload' AND`config_title` = '远程保存路径/前缀'; ");

wmsql::exec("UPDATE `".wmsql::table("config_config")."` SET `config_order` = '1' WHERE `config_name` = 'upload_savetype' and `config_module` = 'upload' AND`config_title` = '上传保存方式'; ");

wmsql::exec("UPDATE `".wmsql::table("config_config")."` SET `config_order` = '2' WHERE `config_name` = 'upload_type' and `config_module` = 'upload' AND`config_title` = '上传类型'; ");

?>