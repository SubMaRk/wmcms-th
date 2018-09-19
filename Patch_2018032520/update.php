<?php
$configTable = wmsql::table('config_config');
$articleTable = wmsql::table('article_article');
$optionTable = wmsql::table('config_option');
$novelTable = wmsql::table('novel_novel');
$rewardlogTable = wmsql::table('novel_rewardlog');
wmsql::exec("ALTER TABLE `{$articleTable}` CHANGE `article_info` `article_info` VARCHAR(250) CHARSET utf8 COLLATE utf8_general_ci NULL COMMENT '简介';ALTER TABLE `{$articleTable}` CHANGE `article_content` `article_content` MEDIUMTEXT NULL COMMENT '内容'; ");

wmsql::exec("ALTER TABLE `{$novelTable}` DROP INDEX `IndexName`, ADD FULLTEXT INDEX `IndexName` (`novel_name`); ");
wmsql::exec("CREATE TABLE `{$rewardlogTable}` (
  `log_id` int(4) NOT NULL AUTO_INCREMENT,
  `log_nid` int(4) NOT NULL DEFAULT '0' COMMENT '小说id',
  `log_cid` int(4) DEFAULT '0' COMMENT '章节id，可以为0',
  `log_uid` int(4) NOT NULL DEFAULT '0' COMMENT '打赏的用户id',
  `log_gold1` decimal(10,2) DEFAULT '0.00' COMMENT '打赏消耗的金币1',
  `log_gold2` decimal(10,2) DEFAULT '0.00' COMMENT '打赏消耗的金币2',
  `log_time` int(4) NOT NULL DEFAULT '0' COMMENT '订打赏的时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小说打赏记录日志表'
");

wmsql::exec("INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('1', 'domain', '后台域名认证', 'admin_domain_access', '0', 'select', '后台只能通过域名访问', '14'); ;INSERT INTO `{$optionTable}` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('395', '关闭域名认证', '0', '1'); INSERT INTO `{$optionTable}` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('395', '开启域名认证', '1', '2'); ");


wmsql::exec("INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES ('1', 'system', '网络协议', 'tcp_type', 'http', 'select', '网络访问的TCP协议类型', '2'); INSERT INTO `{$optionTable}` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('396', 'HTTP', 'http', '1'); INSERT INTO `{$optionTable}` (`config_id`, `option_title`, `option_value`, `option_order`) VALUES ('396', 'HTTPS', 'https', '2'); INSERT INTO `{$configTable}` (`group_id`, `config_module`, `config_title`, `config_name`, `config_formtype`, `config_remark`, `config_order`) VALUES ('3', 'novel', '小说自定义加密字符串', 'novel_en_str', 'input', '小说文件名字加密时候的自定义字符串', '5')");
?>