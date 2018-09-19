<?php
$configTable = wmsql::table('config_config');
$groupTable = wmsql::table('config_group');
$optionTable = wmsql::table('config_option');
$menuTable = wmsql::table('system_menu');
$urlsTable = wmsql::table('seo_urls');
$keysTable = wmsql::table('seo_keys');
$sellTable = wmsql::table('props_sell');
$timeTable = wmsql::table('novel_timelimit');
$welfareTable = wmsql::table('novel_welfare');
$applyTable = wmsql::table('finance_apply');

wmsql::exec("ALTER TABLE `{$sellTable}` ADD COLUMN `sell_remark` VARCHAR(100) NULL COMMENT '留言备注' AFTER `sell_money`; ");

wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('0', '添加限时免费', 'add', '80', '7', 'novel.timelimit.edit'); INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '添加限时免费操作', 'add', '740', '2', '1', 'novel.timelimit'); ");

wmsql::exec("CREATE TABLE `{$timeTable}` (
  `timelimit_id` int(4) NOT NULL AUTO_INCREMENT,
  `timelimit_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '布尔值，是否可用',
  `timelimit_nid` int(4) NOT NULL COMMENT '小说id',
  `timelimit_starttime` int(4) NOT NULL COMMENT '限时免费开始时间',
  `timelimit_endtime` int(4) NOT NULL COMMENT '限时免费结束时间',
  `timelimit_order` int(4) NOT NULL COMMENT '显示顺序',
  `timelimit_time` int(4) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`timelimit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小说限时免费表';");


wmsql::exec("INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('限时免费', 'timelimit', '78', '4', 'novel.timelimit.list'); ");
wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('0', '编辑限时免费', 'edit', '742', '1', 'novel.timelimit.edit'); ");
wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '编辑限时免费操作', 'edit', '743', '2', '1', 'novel.timelimit');  ");
wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '删除限时免费操作', 'del', '742', '2', '2', 'novel.timelimit');  ");
wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('0', '福利设置', 'welfare', '80', '7', 'novel.sell.welfare');  ");
wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '福利设置操作', 'edit', '746', '2', '1', 'novel.sell.welfare'); ");
wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`) VALUES ('0', '结算统计', 'settlement', '80', '8', 'novel.sell.settlement'); ");


wmsql::exec("CREATE TABLE `{$applyTable}`( `apply_id` INT(4) NOT NULL AUTO_INCREMENT, `apply_status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0为待审核，1为已处理，2为未通过',`apply_module` varchar(20) DEFAULT NULL COMMENT '结算来源模块，可以为空',`apply_cid` int(4) NOT NULL DEFAULT '0' COMMENT '模块内容id', `apply_month` INT(4) NOT NULL COMMENT '结算的月份', `apply_time` INT(4) NOT NULL COMMENT '结算的时间', `apply_manager_id` INT(4) NOT NULL COMMENT '结算申请人', `apply_total` DECIMAL(10,2) NOT NULL COMMENT '结算申请总金额', `apply_bonus` DECIMAL(10,2) COMMENT '奖励金额', `apply_bonus_remark` VARCHAR(50) COMMENT '奖励备注', `apply_deduct` DECIMAL(10,2) COMMENT '惩罚备注', `apply_deduct_remark` VARCHAR(50) COMMENT '惩罚备注', `apply_real` DECIMAL(10,2) NOT NULL COMMENT '实际到账金额', `apply_remark` VARCHAR(50) COMMENT '结算申请备注', `apply_to_user_id` INT(4) NOT NULL DEFAULT 0 COMMENT '结算申请给哪个用户', `apply_handle_manager_id` INT(4) NOT NULL DEFAULT 0 COMMENT '处理申请的管理员id', `apply_handle_remark` varchar(50) DEFAULT NULL COMMENT '处理申请的备注', `apply_handle_time` INT(4) NOT NULL DEFAULT 0 COMMENT '处理申请的时间', PRIMARY KEY (`apply_id`) ) ENGINE=MYISAM CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='财务申请记录表'; ");


wmsql::exec("INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '结算申请操作', 'apply', '748', '2', '1', 'novel.sell.settlement');INSERT INTO `{$menuTable}` (`menu_title`, `menu_name`, `menu_pid`, `menu_order`, `menu_file`, `menu_ico`) VALUES ('财务申请', 'apply_list', '99', '0', 'finance.apply.list', 'fa-gg'); INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_order`,`menu_file`) VALUES ('0', '财务申请详情', 'apply_detail', '750', '1','finance.apply.detail');INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '财务申请处理操作', 'status', '751', '2', '1', 'finance.apply'); INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '财务申请删除操作', 'del', '750', '2', '1', 'finance.apply'); INSERT INTO `{$menuTable}` (`menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`) VALUES ('0', '财务申请清空操作', 'clear', '750', '2', '2', 'finance.apply'); ");


wmsql::exec("CREATE TABLE `{$welfareTable}` (
  `welfare_id` int(4) NOT NULL AUTO_INCREMENT,
  `welfare_nid` int(4) NOT NULL COMMENT '小说id',
  `welfare_type` varchar(250) DEFAULT NULL COMMENT '允许的小说分成方式',
  `welfare_number` decimal(5,2) DEFAULT NULL COMMENT '小说字数奖励',
  `welfare_finish` varchar(500) DEFAULT NULL COMMENT '小说完本奖励',
  `welfare_update` varchar(500) DEFAULT NULL COMMENT '小说更新奖励，每月结算',
  `welfare_full` varchar(500) DEFAULT NULL COMMENT '每月出勤奖励，每月结算',
  PRIMARY KEY (`welfare_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小说福利设置表'; ");


////修改define
$defineContent=file_get_contents(WMCONFIG."define.config.php");
$defineContent=str_replace("http://lable.", "http://label.", $defineContent);
file_put_contents(WMCONFIG."define.config.php",$defineContent);
?>