<?php
$configTable = wmsql::table('config_config');
$menuTable = wmsql::table('system_menu');
$novelTable = wmsql::table('novel_novel');
$chapterTable = wmsql::table('novel_chapter');
wmsql::exec("UPDATE `{$menuTable}` SET `menu_title` = '登录验证' WHERE `menu_id` = '646'; ");

wmsql::exec("INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('1', 'code', '后台登录错误次数', 'admin_login_error_number', '5', 'input', '后台允许登录错误次数', '1'); INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('1', 'code', '后台错误登录限制时间', 'admin_login_error_time', '1440', 'input', '后台达到错误次数后封锁登录时间', '1'); ");

wmsql::exec("INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('1', 'code', '用户登录错误次数', 'user_login_error_number', '5', 'input', '用户允许登录错误次数', '3'); INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('1', 'code', '用户错误登录限制时间', 'user_login_error_time', '1440', 'input', '用户达到错误次数后封锁登录时间', '3'); ");

wmsql::exec("ALTER TABLE `{$novelTable}` ADD COLUMN `novel_wordname` VARCHAR(30) NULL COMMENT '全文字书名' AFTER `novel_name`; ALTER TABLE `{$novelTable}` ADD COLUMN `novel_path` VARCHAR(250) NULL COMMENT '小说完本txt保存地址' AFTER `novel_allrec`;");


wmsql::exec("ALTER TABLE `{$chapterTable}` ADD COLUMN `chapter_path` VARCHAR(250) NULL COMMENT '章节txt完整保存路径' AFTER `chapter_order`; ");
?>