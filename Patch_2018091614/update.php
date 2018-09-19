<?php
$configTable = wmsql::table('config_config');
$groupTable = wmsql::table('config_group');
$optionTable = wmsql::table('config_option');
$menuTable = wmsql::table('system_menu');
$urlsTable = wmsql::table('seo_urls');
$keysTable = wmsql::table('seo_keys');
$apiTable = wmsql::table('api_api');

wmsql::exec("INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`, `menu_ico`) VALUES ('新增API', 'addapi', '710', '2', 'system.dev.addapi', 'fa-random'); INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '新增API操作', 'add', '755', '2', '1', 'system.dev.addapi'); ");

wmsql::exec("insert  into `{$apiTable}`(`type_id`,`api_open`,`api_title`,`api_ctitle`,`api_name`,`api_appid`,`api_apikey`,`api_secretkey`,`api_base`,`api_info`,`api_order`,`api_option`) values (2,1,'微信小程序登录','微信','wxapplogin',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"AppID\";s:6:\"remark\";s:11:\"小程序ID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:0:\"\";s:6:\"remark\";s:0:\"\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:9:\"AppSecret\";s:6:\"remark\";s:15:\"小程序密钥\";}}','微信小程序接口设置',6,'');");

wmsql::exec("UPDATE `{$keysTable}` SET `keys_title` = '{类型排行}小说排行榜' ,`keys_key` = '{类型排行},小说排行榜' ,`keys_desc` = '{类型排行}小说排行榜' WHERE `keys_id` = '8'; ");
?>