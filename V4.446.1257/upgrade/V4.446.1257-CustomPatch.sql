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
