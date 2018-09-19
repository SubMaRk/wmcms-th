<?php
$configTable = wmsql::table('config_config');
$menuTable = wmsql::table('system_menu');

wmsql::exec("UPDATE `{$configTable}` SET `group_id` = '1' ,`config_module` = 'system',`config_order` = '2' WHERE `config_id` = '54';UPDATE `{$menuTable}` SET `menu_name` = 'config' ,`menu_file` = 'system.set.water' WHERE `menu_id` = '179'; ");

wmsql::exec("insert  into `{$menuTable}`(`menu_id`,`menu_status`,`menu_title`,`menu_name`,`menu_pid`,`menu_group`,`menu_order`,`menu_file`,`menu_url`,`menu_ico`) values (717,1,'云应用','apps',552,1,0,NULL,0,'fa-cubes'),(718,1,'我的插件','plugin',717,0,2,'cloud.apps.plugin',0,'fa-plug'),(719,0,'安装插件','install',718,2,1,'cloud.apps.plugin',0,NULL),(720,0,'卸载插件','uninstall',718,2,2,'cloud.apps.plugin',0,NULL),(721,0,'插件管理','manager',718,0,1,'cloud.apps.plugin.manager',0,NULL),(722,0,'插件首页','index',721,0,1,'cloud.apps.plugin.index',0,NULL),(723,0,'插件业务管理','business',721,0,2,'cloud.apps.plugin.business',0,NULL),(724,0,'插件配置修改操作','config',723,2,1,'cloud.apps.plugin',0,NULL),(725,0,'水印生成测试','water_test',5,2,2,'system.set.water',0,NULL);");


$pluginTable = wmsql::table('plugin');
wmsql::exec("DROP TABLE IF EXISTS `{$pluginTable}`;
CREATE TABLE `{$pluginTable}` (
  `plugin_id` int(4) NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(50) NOT NULL COMMENT '插件名字',
  `plugin_floder` varchar(50) NOT NULL COMMENT '插件文件夹',
  `plugin_author` varchar(20) NOT NULL COMMENT '插件作者',
  `plugin_version` varchar(10) NOT NULL COMMENT '插件版本',
  `plugin_time` int(4) NOT NULL COMMENT '插件安装时间',
  PRIMARY KEY (`plugin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='插件安装表';");
wmsql::exec("insert  into `{$pluginTable}`(`plugin_id`,`plugin_name`,`plugin_floder`,`plugin_author`,`plugin_version`,`plugin_time`) values (6,'官方-报名插件DEMO','demo','WMCMS官方','V1.0',1528631159);");


$pluginConfigTable = wmsql::table('plugin_config');
wmsql::exec("DROP TABLE IF EXISTS `{$pluginConfigTable}`;
CREATE TABLE `{$pluginConfigTable}` (
  `config_id` int(4) NOT NULL AUTO_INCREMENT,
  `config_plugin_id` int(4) NOT NULL COMMENT '插件id',
  `config_key` varchar(100) NOT NULL COMMENT '插件键',
  `config_val` text COMMENT '插件值',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='插件参数配置表';");
wmsql::exec("insert  into `{$pluginConfigTable}`(`config_id`,`config_plugin_id`,`config_key`,`config_val`) values (4,6,'plugin_demo_site_open','0');");


$applyTable = wmsql::table('plugin_demo_apply');
wmsql::exec("DROP TABLE IF EXISTS `{$applyTable}`;
CREATE TABLE `{$applyTable}` (
  `message_id` int(4) NOT NULL AUTO_INCREMENT,
  `message_name` varchar(20) NOT NULL COMMENT '报名用户',
  `message_phone` varchar(11) NOT NULL COMMENT '报名电话',
  `message_time` int(4) NOT NULL COMMENT '报名时间',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='demo插件报名表';");
wmsql::exec("insert  into `{$applyTable}`(`message_id`,`message_name`,`message_phone`,`message_time`) values (1,'未梦','15123232323',1528631188);");

?>