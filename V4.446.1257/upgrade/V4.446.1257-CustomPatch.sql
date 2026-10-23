-- WMCMS V4.446.1257-CustomPatch
-- 从 V4.446.1257 升级到本分支时需要手动执行的 SQL。
-- 本地安装（install/sql.sql）已经包含这些改动，只有既有站点需要跑这一段。

-- 1) 密码哈希升级为 bcrypt / argon2，列宽必须能容纳 password_hash() 的 60 字符输出。
ALTER TABLE `wm_manager_manager`
	MODIFY `manager_psw` VARCHAR(255) NOT NULL COMMENT '管理员密码',
	MODIFY `manager_salt` VARCHAR(50) DEFAULT NULL COMMENT '管理员密码盐（bcrypt 后不再使用，仅为兼容旧哈希保留）';

ALTER TABLE `wm_user_user`
	MODIFY `user_psw` VARCHAR(255) NOT NULL COMMENT '密码',
	MODIFY `user_salt` VARCHAR(50) DEFAULT '' COMMENT '密码盐（bcrypt 后不再使用，仅为兼容旧哈希保留）';

-- 2) 旧的 sha1(md5()) 哈希不需要手工转换：
--    下一次成功登录时会用 password_verify 校验旧格式，
--    通过后立即改写为 password_hash() 的结果。

-- 3) 自定义字段的值表：按“模块 + 类型 + 内容id”查询，原来只有主键索引。
--    条件用的是 FIND_IN_SET/逐值 or，索引根本用不上；改成 IN() 之后这条索引才生效。
--    下表用 IF NOT EXISTS 的等价写法（先判断再建），重复执行不会报错。
SET @idx := (SELECT COUNT(*) FROM information_schema.statistics
	WHERE table_schema = DATABASE() AND table_name = 'wm_config_field_value' AND index_name = 'value_module_type_id');
SET @sql := IF(@idx = 0,
	'ALTER TABLE `wm_config_field_value` ADD KEY `value_module_type_id` (`value_field_module`,`value_field_type`,`value_content_id`)',
	'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx2 := (SELECT COUNT(*) FROM information_schema.statistics
	WHERE table_schema = DATABASE() AND table_name = 'wm_config_field_value' AND index_name = 'value_field_id');
SET @sql2 := IF(@idx2 = 0,
	'ALTER TABLE `wm_config_field_value` ADD KEY `value_field_id` (`value_field_id`)',
	'SELECT 1');
PREPARE stmt2 FROM @sql2; EXECUTE stmt2; DEALLOCATE PREPARE stmt2;

-- 4) 点击/推荐/收藏改成队列合并写入后，建议由 cron 每分钟跑一次 cron.php：
--    * * * * * curl -s "https://站点域名/cron.php?key=<后台 api_apikey>" > /dev/null
