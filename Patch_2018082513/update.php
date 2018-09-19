<?php
$configTable = wmsql::table('config_config');
$groupTable = wmsql::table('config_group');
$optionTable = wmsql::table('config_option');
$menuTable = wmsql::table('system_menu');
$urlsTable = wmsql::table('seo_urls');
$keysTable = wmsql::table('seo_keys');
$ztTypeTable = wmsql::table('zt_type');
$ztTable = wmsql::table('zt_zt');
$retrievalTable = wmsql::table('system_retrieval');
$flashTypeTable = wmsql::table('flash_type');
$flashTable = wmsql::table('flash_flash');

wmsql::exec("CREATE TABLE `{$ztTypeTable}` (
  `type_id` int(4) NOT NULL AUTO_INCREMENT,
  `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
  `type_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐分类',
  `type_name` varchar(10) NOT NULL COMMENT '分类名',
  `type_cname` varchar(10) DEFAULT NULL COMMENT '类型简称',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
  `type_order` int(2) NOT NULL COMMENT '排序',
  `type_ico` varchar(200) DEFAULT NULL COMMENT '分类图标',
  `type_info` varchar(100) DEFAULT NULL COMMENT '分类信息',
  `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类页模版',
  `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT '内容页模版',
  `type_title` varchar(80) DEFAULT NULL COMMENT '页面标题',
  `type_key` varchar(100) DEFAULT NULL COMMENT '页面关键字',
  `type_desc` varchar(120) DEFAULT NULL COMMENT '页面描述',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='专题分类表'");

wmsql::exec("UPDATE `{$menuTable}` SET `menu_order` = '3' WHERE `menu_id` = '150'; 
UPDATE `{$menuTable}` SET `menu_order` = '4' WHERE `menu_id` = '151'; 
INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`, `menu_ico`) VALUES ('新增分类', 'type_add', '149', '1', 'operate.zt.typeedit', 'fa-plus-circle'); 
INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`, `menu_ico`) VALUES ('分类列表', 'type_list', '149', '2', 'operate.zt.typelist', 'fa-indent'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '增加分类操作', 'type_add', '726', '2', '1', 'operate.zt.type'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '修改分类操作', 'type_edit', '727', '2', '1', 'operate.zt.type'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '删除分类操作', 'type_del', '727', '2', '2', 'operate.zt.type'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('0', '编辑分类', 'type_edit', '727', '2', 'operate.zt.typeedit'); ");

wmsql::exec("ALTER TABLE `{$ztTable}` DROP COLUMN `zt_title`, DROP COLUMN `zt_key`, DROP COLUMN `zt_desc`, DROP COLUMN `zt_ctempid`; 
ALTER TABLE `{$ztTable}` ADD COLUMN `type_id` INT(4) DEFAULT 0 NOT NULL COMMENT '专题分类id' AFTER `zt_id`; 
ALTER TABLE `{$ztTable}` ADD COLUMN `zt_replay` INT(4) DEFAULT 0 NOT NULL COMMENT '评论量' AFTER `zt_read`; ");

wmsql::exec("UPDATE `{$urlsTable}` SET `urls_page` = 'zt_type' ,`urls_pagename` = '专题分类' ,`urls_url1` = '/module/zt/type.php?pt={pt}&tid={tid}&page={page}' ,`urls_url2` = '/module/zt/type.php?pt={pt}&tid={tid}&page={page}' WHERE `urls_id` = '39';UPDATE `{$urlsTable}` SET `urls_url1` = '/module/zt/zt.php?pt={pt}&zid={zid}' ,`urls_url2` = '/module/zt/zt.php?pt={pt}&zid={zid}' WHERE `urls_id` = '38'; INSERT INTO `{$urlsTable}` (`urls_module`, `urls_page`, `urls_pagename`, `urls_url1`, `urls_url2`) VALUES ('replay', 'replay_list', '评论列表', '/module/replay/list.php?pt={pt}&module={module}&page={page}', '/module/replay/list.php?pt={pt}&module={module}&page={page}');");

wmsql::exec("INSERT INTO `{$keysTable}` (`keys_module`, `keys_page`, `keys_pagename`, `keys_title`, `keys_key`, `keys_desc`) VALUES ('zt', 'zt_zt', '专题详情', '{名字}-{网站名}', '{名字},{网站名}', '{名字}-{网站名}'); 
INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`, `menu_ico`) VALUES ('修改配置', 'config', '149', '9', 'operate.zt.config', 'fa-wrench'); 
INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '修改配置操作', 'config_edit', '732', '2', '1', 'operate.zt.config'); 
INSERT INTO `{$groupTable}` (`group_name`, `group_remark`) VALUES ('zt', '专题配置组'); 
insert  into `{$configTable}`(`config_status`,`group_id`,`config_module`,`config_title`,`config_name`,`config_value`,`config_formtype`,`config_remark`,`config_order`) values (1,14,'zt','专题页检查参数','par_zt','1','radio','专题页的是否检测所有参数正确',1),(1,14,'zt','评论页检查参数','par_replay','1','radio','评论页的是否检测所有参数正确',2),(1,14,'zt','开启专题顶踩','dingcai_open','0','select','是否开启专题顶踩功能',11),(1,14,'zt','专题顶踩登录','dingcai_login','1','select','专题顶踩是否需要登录',12),(1,14,'zt','专题顶踩次数','dingcai_count','2','input','每篇专题每日的顶踩次数限制',13),(1,14,'zt','开启专题评分','score_open','0','select','是否开启专题评分功能',14),(1,14,'zt','专题评分登录','score_login','1','select','专题评分是否需要登录',15),(1,14,'zt','专题评分次数','score_count','1','input','每日每篇专题评分次数',16),(1,14,'zt','专题评论开关','replay_open','0','select','专题模块是否开启评论功能',17),(1,14,'zt','专题评论登录','replay_login','1','select','专题模块评论是否需要登录',18);
insert  into `{$optionTable}`(`config_id`,`option_title`,`option_value`,`option_order`) values (404,'开启检查','1',1),(404,'关闭检查','0',2),(405,'开启检查','1',1),(405,'关闭检查','0',2),(406,'开启顶踩','1',1),(406,'关闭顶踩','0',2),(407,'需要登录','1',1),(407,'无需登录','0',2),(409,'开启评分','1',1),(409,'关闭评分','0',2),(410,'需要登录','1',1),(410,'无需登录','0',2),(412,'开启评论','1',1),(412,'关闭评论','0',2),(413,'需要登录','1',1),(413,'无需登录','0',2);");

wmsql::exec("
insert  into `{$menuTable}`(`menu_status`,`menu_title`,`menu_name`,`menu_pid`,`menu_group`,`menu_order`,`menu_file`,`menu_url`,`menu_ico`) values (1,'新增分类','type_add',141,0,1,'operate.flash.typeedit',0,'fa-plus-circle'),(0,'编辑分类','type_edit',141,0,2,'operate.flash.typeedit',0,NULL),(1,'分类列表','type_list',141,0,2,'operate.flash.typelist',0,'fa-indent'),(0,'增加分类操作','type_add',734,2,1,'operate.flash.type',0,NULL),(0,'修改分类操作','type_edit',735,2,1,'operate.flash.type',0,NULL),(0,'删除分类操作','type_del',736,2,2,'operate.flash.type',0,NULL);UPDATE `{$menuTable}` SET `menu_order` = '3' WHERE `menu_id` = '142'; UPDATE `{$menuTable}` SET `menu_order` = '4' WHERE `menu_id` = '143'; ");


wmsql::exec("UPDATE `{$retrievalTable}` SET `retrieval_title` = '更新' WHERE `retrieval_id` = '23'; 
CREATE TABLE `{$flashTypeTable}` (
  `type_id` int(4) NOT NULL AUTO_INCREMENT,
  `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
  `type_name` varchar(10) NOT NULL COMMENT '分类名',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
  `type_order` int(4) NOT NULL DEFAULT '0' COMMENT '分类排序',
  `type_info` varchar(100) DEFAULT NULL COMMENT '分类备注',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';
ALTER TABLE `{$flashTable}` ADD COLUMN `type_id` INT(4) DEFAULT 0 NOT NULL COMMENT '幻灯片分组' AFTER `flash_status`; ");
?>