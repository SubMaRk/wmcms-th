<?php
$configTable = wmsql::table('config_config');
$groupTable = wmsql::table('config_group');
$optionTable = wmsql::table('config_option');
$fieldTable = wmsql::table('config_field');
$menuTable = wmsql::table('system_menu');
$urlsTable = wmsql::table('seo_urls');
$keysTable = wmsql::table('seo_keys');

wmsql::exec("ALTER TABLE `{$fieldTable}` ADD COLUMN `field_type_pids` VARCHAR(50) DEFAULT '0' NOT NULL COMMENT '分类的级别关系' AFTER `field_type_child`; ");
?>