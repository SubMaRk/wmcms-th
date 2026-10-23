-- WMCMS V4.446.1257-CustomPatch
-- SQL ที่ต้องรันด้วยมือเมื่ออัปเกรดจาก V4.446.1257 มาสาขานี้
-- การติดตั้งใหม่ (install/sql.sql) มีการเปลี่ยนแปลงเหล่านี้อยู่แล้ว รันเฉพาะเว็บที่ติดตั้งไว้ก่อนหน้า

-- 1) อัปเกรดแฮชรหัสผ่านเป็น bcrypt / argon2 คอลัมน์ต้องกว้างพอรับผลลัพธ์ 60 ตัวอักษรของ password_hash()
ALTER TABLE `wm_manager_manager`
	MODIFY `manager_psw` VARCHAR(255) NOT NULL COMMENT 'รหัสผ่านผู้ดูแล',
	MODIFY `manager_salt` VARCHAR(50) DEFAULT NULL COMMENT 'salt รหัสผ่านผู้ดูแล (ไม่ใช้แล้วหลัง bcrypt เก็บไว้รองรับแฮชเก่าเท่านั้น)';

ALTER TABLE `wm_user_user`
	MODIFY `user_psw` VARCHAR(255) NOT NULL COMMENT 'รหัสผ่าน',
	MODIFY `user_salt` VARCHAR(50) DEFAULT '' COMMENT 'salt รหัสผ่าน (ไม่ใช้แล้วหลัง bcrypt เก็บไว้รองรับแฮชเก่าเท่านั้น)';

-- 2) ขยายคอลัมน์ที่ภาษาไทยต้องการ ข้อความไทยยาวกว่าจีน 2-3 เท่า
--    ถ้าไม่ขยายก่อน รัน V4.446.1257-ThaiLanguage*.sql จะล้มด้วย error 1406 (Data too long)
--    เปลี่ยน temp_content เป็น mediumtext และปลดล็อก login_remark ที่ถูกบังคับเป็น gbk

ALTER TABLE `wm_about_type`
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่';

ALTER TABLE `wm_api_api`
	MODIFY `api_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่ออินเทอร์เฟซ',
	MODIFY `api_ctitle` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่ออินเทอร์เฟซ',
	MODIFY `api_base` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พารามิเตอร์ตั้งค่าอินเทอร์เฟซพื้นฐาน',
	MODIFY `api_info` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายอินเทอร์เฟซ',
	MODIFY `api_option` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พารามิเตอร์อื่นของอินเทอร์เฟซ';

ALTER TABLE `wm_api_tts_voicet`
	MODIFY `voicet_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อผู้พูด';

ALTER TABLE `wm_api_type`
	MODIFY `type_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อประเภทอินเทอร์เฟซ';

ALTER TABLE `wm_app_type`
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_article_type`
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อหมวดหมู่';

ALTER TABLE `wm_author_level`
	MODIFY `level_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ';

ALTER TABLE `wm_author_sign`
	MODIFY `sign_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับการเซ็นสัญญา';

ALTER TABLE `wm_config_option`
	MODIFY `option_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อตัวเลือก';

ALTER TABLE `wm_fans_module_level`
	MODIFY `level_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ';

ALTER TABLE `wm_link_link`
	MODIFY `link_name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อลิงก์เพื่อน';

ALTER TABLE `wm_link_type`
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่';

ALTER TABLE `wm_novel_type`
	MODIFY `type_cname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_plugin`
	MODIFY `plugin_name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อปลั๊กอิน',
	MODIFY `plugin_author` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ผู้พัฒนาปลั๊กอิน';

ALTER TABLE `wm_props_props`
	MODIFY `props_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อไอเทม';

ALTER TABLE `wm_props_type`
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหมวดหมู่';

ALTER TABLE `wm_seo_keys`
	MODIFY `keys_pagename` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหน้าเพจ',
	MODIFY `keys_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อหน้าเพจ',
	MODIFY `keys_key` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำค้นของหน้าเพจ',
	MODIFY `keys_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำอธิบายหน้าเพจ';

ALTER TABLE `wm_seo_urls`
	MODIFY `urls_pagename` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหน้าเพจ';

ALTER TABLE `wm_system_domain`
	MODIFY `domain_title` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อโมดูล';

ALTER TABLE `wm_system_email_temp`
	MODIFY `temp_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อเทมเพลต',
	MODIFY `temp_desc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายเทมเพลต',
	MODIFY `temp_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาจดหมาย';

ALTER TABLE `wm_system_msg_temp`
	MODIFY `temp_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเทมเพลต',
	MODIFY `temp_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาจดหมาย';

ALTER TABLE `wm_system_retrieval`
	MODIFY `retrieval_title` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเงื่อนไขการค้นหา';

ALTER TABLE `wm_system_sms`
	MODIFY `sms_params` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'พารามิเตอร์แทนที่';

ALTER TABLE `wm_user_level`
	MODIFY `level_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ';

ALTER TABLE `wm_user_login`
	MODIFY `login_remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'เข้าสู่ระบบสำเร็จ' COMMENT 'รายละเอียดหมายเหตุ';

-- 3) แฮชแบบ sha1(md5()) เดิมไม่ต้องแปลงด้วยมือ:
--    การเข้าสู่ระบบครั้งถัดไปจะตรวจรูปแบบเดิมด้วย password_verify
--    เมื่อผ่านจะเขียนทับเป็นผลลัพธ์ของ password_hash() ทันที

-- 4) ตารางค่าฟิลด์กำหนดเอง: ค้นตาม "โมดูล + ชนิด + id เนื้อหา" เดิมมีแค่ดัชนี primary key
--    เงื่อนไขเดิมใช้ FIND_IN_SET/or ทีละค่า ดัชนีจึงไม่ถูกใช้ เปลี่ยนเป็น IN() ดัชนีนี้จึงมีผล
--    คำสั่งด้านล่างเขียนเทียบเท่า IF NOT EXISTS (ตรวจก่อนแล้วค่อยสร้าง) รันซ้ำได้ไม่ error
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

-- 5) หลังเปลี่ยนการนับคลิก/แนะนำ/บุ๊กมาร์กเป็นการเขียนรวมผ่านคิว แนะนำให้ cron รัน cron.php ทุกนาที:
--    * * * * * curl -s "https://โดเมนเว็บไซต์/cron.php?key=<api_apikey ของหลังบ้าน>" > /dev/null
