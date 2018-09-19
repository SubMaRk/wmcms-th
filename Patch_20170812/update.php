<?php
$configTable = wmsql::table('config_config');
$optionTable = wmsql::table('config_option');
$userTable = wmsql::table('user_user');
$apiTable = wmsql::table('api_api');
$apiTypeTable = wmsql::table('api_type');
$menuTable = wmsql::table('system_menu');
$novelTable = wmsql::table('novel_novel');
$sellTable = wmsql::table('props_sell');
$signTable = wmsql::table('user_sign');
$defaultTable = wmsql::table('system_menu_default');

wmsql::exec("INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('4', 'user', '接口登录绑定账号', 'api_login_bind', '1', 'select', '第三方登陆是否强制绑定本站的账号', '50'); 
INSERT INTO `{$optionTable}` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('394', '强制绑定账号', '1', '1'); 
INSERT INTO `{$optionTable}` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('394', '自动创建账号', '0', '2');
ALTER TABLE `{$userTable}` CHANGE `user_email` `user_email` VARCHAR(50) CHARSET utf8 COLLATE utf8_general_ci NULL COMMENT '邮箱'; 
ALTER TABLE `{$userTable}` ADD COLUMN `user_type` VARCHAR(20) DEFAULT 'default' NOT NULL COMMENT '账号注册来源' AFTER `user_id`, CHANGE `user_name` `user_name` VARCHAR(50) CHARSET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号/第三方ID';  
UPDATE `{$apiTable}` SET `api_title` = '支付宝PC支付' WHERE `api_id` = '3'; 
UPDATE `{$apiTable}` SET `api_title` = '微信扫码支付' WHERE `api_id` = '6'; 
UPDATE `{$apiTable}` SET `api_order` = '3' WHERE `api_id` = '6';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:20:\"请输入您的APPID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"API密钥\";s:6:\"remark\";s:24:\"请输入您的API密钥\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}' WHERE `api_id` = '6'; ");

wmsql::exec("insert  into `{$apiTable}`(`api_id`,`type_id`,`api_open`,`api_title`,`api_ctitle`,`api_name`,`api_appid`,`api_apikey`,`api_secretkey`,`api_base`,`api_info`,`api_order`,`api_option`) values (14,6,0,'支付宝WAP支付','支付宝','alipay_wap',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:8:\"应用id\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"支付宝私匙\";s:6:\"remark\";s:15:\"支付宝私匙\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"支付宝公匙\";s:6:\"remark\";s:15:\"支付宝公匙\";}}','支付宝wap端支付，可以使用pc相同配置，也可以单独使用账户',2,NULL),(15,6,0,'微信公众号支付','微信','wxpay_jsapi',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:20:\"请输入您的APPID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"API密钥\";s:6:\"remark\";s:24:\"请输入您的API密钥\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"Appsecret\";s:6:\"remark\";s:24:\"请输入您的Appsecret\";}}','微信公众号内支付，只支持微信浏览器里面支付。可以和扫码支付同配置',4,'a:1:{s:5:{#34}mchid{#34};a:3:{s:5:{#34}title{#34};s:9:{#34}商户号{#34};s:5:{#34}value{#34};s:1:{#34}0{#34};s:4:{#34}info{#34};s:17:{#34}微信商户号id{#34};}}');");

wmsql::exec("INSERT INTO `{$apiTypeTable}` (`type_title`, `type_name`, `type_order`) VALUES ('移动支付接口', 'pay_wap', '3'); 
UPDATE `{$apiTypeTable}` SET `type_title` = 'PC支付接口' WHERE `type_id` = '3'; 
INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_ico`) VALUES ('开发工具', 'development', '1','10', 'fa-joomla'); 
INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`,`menu_ico`) VALUES ('新增页面', 'addpage', '710', '1', 'system.dev.addpage','fa-bookmark'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '新增页面操作', 'add', '711', '2', '1', 'system.dev.addpage'); 
ALTER TABLE `{$novelTable}` CHANGE `novel_info` `novel_info` VARCHAR(1000) CHARSET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小说简介'; 
UPDATE `{$apiTable}` SET `api_title` = '微信扫码登录' WHERE `api_id` = '13'; 
INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('财务统计图', 'finance', '162', '5', 'data.chart.finance'); 
ALTER TABLE `{$sellTable}` ADD COLUMN `sell_module` VARCHAR(20) NOT NULL COMMENT '销售的模块' AFTER `sell_id`, ADD COLUMN `sell_cid` INT(4) DEFAULT 0 NOT NULL COMMENT '购买的内容id' AFTER `sell_module`; 
ALTER TABLE `{$signTable}` ADD COLUMN `sign_prerank` INT(4) DEFAULT 0 NOT NULL COMMENT '上次签到排名' AFTER `sign_con`, ADD COLUMN `sign_rank` INT(4) DEFAULT 0 NOT NULL COMMENT '本次签到排名' AFTER `sign_pretime`; 
INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`,`menu_ico`) VALUES ('默认首页', 'default_index', '9', '4', 'system.menu.default_index','fa-list-ul'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('0', '默认首页操作', 'default_index', '714', '1', 'system.menu.menu'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_file`) VALUES ('0', '销售记录', 'sell_log', '609', 'novel.sell.log'); 
CREATE TABLE `{$defaultTable}` (
  `default_id` int(4) NOT NULL AUTO_INCREMENT,
  `default_controller` varchar(30) NOT NULL COMMENT '控制器名字',
  `default_mid` int(4) NOT NULL COMMENT '管理员id',
  PRIMARY KEY (`default_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8");
?>