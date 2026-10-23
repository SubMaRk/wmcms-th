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

-- 2b) ขยายคอลัมน์ชื่อ/หัวข้อ/คำอธิบายที่ยังแคบเกินสำหรับภาษาไทย
--     (คอลัมน์กลุ่มนี้ไม่มีข้อมูลตัวอย่างใน sql.sql เดิม จึงไม่ถูกขยายในข้อ 2)
ALTER TABLE `wm_about_about`
	MODIFY `about_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อบทความ';

ALTER TABLE `wm_about_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_ad_ad`
	MODIFY `ad_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อตำแหน่งโฆษณา';

ALTER TABLE `wm_ad_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่โฆษณา';

ALTER TABLE `wm_api_api`
	MODIFY `api_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวระบุอินเทอร์เฟซ';

ALTER TABLE `wm_api_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ตัวระบุประเภทอินเทอร์เฟซ';

ALTER TABLE `wm_app_app`
	MODIFY `app_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อแอป',
	MODIFY `app_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อแอป',
	MODIFY `app_tags` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็กแอป';

ALTER TABLE `wm_app_attr`
	MODIFY `attr_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อแอตทริบิวต์';

ALTER TABLE `wm_app_firms`
	MODIFY `firms_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อผู้พัฒนา',
	MODIFY `firms_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อผู้พัฒนา';

ALTER TABLE `wm_app_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_article_article`
	MODIFY `article_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อบทความ',
	MODIFY `article_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อบทความ',
	MODIFY `article_tags` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็ก',
	MODIFY `article_author` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'admin' COMMENT 'ผู้แต่ง';

ALTER TABLE `wm_article_author`
	MODIFY `author_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อผู้แต่งหรือแหล่งที่มา';

ALTER TABLE `wm_article_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อหมวดหมู่';

ALTER TABLE `wm_author_author`
	MODIFY `author_nickname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'นามปากกาผู้แต่ง ห้ามแก้ไข';

ALTER TABLE `wm_author_level`
	MODIFY `level_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ';

ALTER TABLE `wm_author_sign`
	MODIFY `sign_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับการเซ็นสัญญา';

ALTER TABLE `wm_bbs_bbs`
	MODIFY `bbs_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อโพสต์',
	MODIFY `bbs_replay_nickname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อเล่นผู้ใช้ที่ตอบโพสต์',
	MODIFY `bbs_tags` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็ก';

ALTER TABLE `wm_bbs_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_config_field`
	MODIFY `field_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อฟิลด์';

ALTER TABLE `wm_config_group`
	MODIFY `group_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อกลุ่ม',
	MODIFY `group_remark` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมายเหตุกลุ่ม';

ALTER TABLE `wm_config_label`
	MODIFY `label_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อแท็ก',
	MODIFY `label_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อแท็ก';

ALTER TABLE `wm_diy_diy`
	MODIFY `diy_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหน้าเพจที่กำหนดเอง';

ALTER TABLE `wm_editor`
	MODIFY `editor_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อบรรณาธิการ';

ALTER TABLE `wm_editor_group`
	MODIFY `group_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อกลุ่ม';

ALTER TABLE `wm_fans_module_level`
	MODIFY `level_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ';

ALTER TABLE `wm_finance_apply`
	MODIFY `apply_bonus_remark` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุรางวัล',
	MODIFY `apply_deduct_remark` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุการลงโทษ',
	MODIFY `apply_remark` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุคำขอชำระบัญชี',
	MODIFY `apply_handle_remark` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุการพิจารณาคำขอ';

ALTER TABLE `wm_flash_flash`
	MODIFY `flash_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อ';

ALTER TABLE `wm_flash_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่';

ALTER TABLE `wm_link_link`
	MODIFY `link_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อลิงก์เพื่อน',
	MODIFY `link_info` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อลิงก์เพื่อน';

ALTER TABLE `wm_link_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_novel_novel`
	MODIFY `novel_author` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ผู้แต่ง';

ALTER TABLE `wm_novel_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_novel_volume`
	MODIFY `volume_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเล่ม';

ALTER TABLE `wm_picture_picture`
	MODIFY `picture_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อชุดรูปภาพ',
	MODIFY `picture_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อตอนของชุดรูปภาพ',
	MODIFY `picture_tags` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็กชุดรูปภาพ';

ALTER TABLE `wm_picture_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_plugin_demo_apply`
	MODIFY `message_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ผู้ใช้ที่สมัคร';

ALTER TABLE `wm_props_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อหมวดหมู่';

ALTER TABLE `wm_replay_replay`
	MODIFY `replay_nickname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อ-นามสกุล';

ALTER TABLE `wm_seo_html_plan`
	MODIFY `plan_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อภารกิจ';

ALTER TABLE `wm_seo_spider`
	MODIFY `spider_group_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อกลุ่มของสไปเดอร์',
	MODIFY `spider_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อของสไปเดอร์',
	MODIFY `spider_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ตัวระบุของสไปเดอร์';

ALTER TABLE `wm_site_product`
	MODIFY `product_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเว็บไซต์',
	MODIFY `product_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีเข้าสู่ระบบหลังบ้าน';

ALTER TABLE `wm_site_site`
	MODIFY `site_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อเว็บไซต์';

ALTER TABLE `wm_system_competence`
	MODIFY `comp_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อสิทธิ์';

ALTER TABLE `wm_system_domain`
	MODIFY `domain_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อโมดูล',
	MODIFY `domain_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อโมดูล';

ALTER TABLE `wm_system_email`
	MODIFY `email_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'บัญชีเข้าสู่ระบบอีเมล';

ALTER TABLE `wm_system_menu`
	MODIFY `menu_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อสารบัญ หากเป็นเมนูสิทธิ์ ค่านี้จะเป็นประเภท t';

ALTER TABLE `wm_system_retrieval`
	MODIFY `retrieval_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเงื่อนไขการค้นหา';

ALTER TABLE `wm_system_retrieval_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่';

ALTER TABLE `wm_system_sms`
	MODIFY `sms_api_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'อินเทอร์เฟซ SMS',
	MODIFY `sms_sign` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'ลายเซ็นเทมเพลตของบุคคลที่สาม';

ALTER TABLE `wm_system_tags`
	MODIFY `tags_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อแท็ก';

ALTER TABLE `wm_system_tags_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่';

ALTER TABLE `wm_system_templates`
	MODIFY `temp_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อเทมเพลต';

ALTER TABLE `wm_templates_templates`
	MODIFY `templates_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเทมเพลต';

ALTER TABLE `wm_user_level`
	MODIFY `level_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ';

ALTER TABLE `wm_user_punish`
	MODIFY `punish_remark` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุ';

ALTER TABLE `wm_user_read`
	MODIFY `read_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อ';

ALTER TABLE `wm_user_read_log`
	MODIFY `read_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อ';

ALTER TABLE `wm_user_user`
	MODIFY `user_nickname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเล่น';

ALTER TABLE `wm_weixin_account`
	MODIFY `account_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อบัญชีทางการ';

ALTER TABLE `wm_weixin_autoreply`
	MODIFY `autoreply_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อการตอบกลับอัตโนมัติ';

ALTER TABLE `wm_weixin_fans`
	MODIFY `fans_nickname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเล่นของผู้ใช้';

ALTER TABLE `wm_weixin_menu`
	MODIFY `menu_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมายเหตุของเมนู';

ALTER TABLE `wm_zt_node`
	MODIFY `node_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อโหนด';

ALTER TABLE `wm_zt_type`
	MODIFY `type_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท';

ALTER TABLE `wm_zt_zt`
	MODIFY `zt_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหัวข้อพิเศษ';


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
