-- WMCMS V4.446.1257 - Thai language pack: schema parity
-- Run last. Sets every column COMMENT to Thai and widens the columns Thai text needs.
-- Never shortens a column that already has the 4.446.1257 width.
-- Compare against install/sql.sql before running: if you widened columns yourself,
-- check the definitions below first.

SET NAMES utf8mb4;

ALTER TABLE `wm_about_about`
	MODIFY `type_id` int NOT NULL DEFAULT 1 COMMENT 'id หมวดหมู่ข้อมูล',
	MODIFY `about_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อบทความ',
	MODIFY `about_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของข้อมูล',
	MODIFY `about_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหา',
	MODIFY `about_order` int NULL DEFAULT 0 COMMENT 'ลำดับของข้อมูล',
	MODIFY `about_title` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อเนื้อหาข้อมูล',
	MODIFY `about_key` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นหาเนื้อหาข้อมูล',
	MODIFY `about_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายเนื้อหาข้อมูล',
	MODIFY `about_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที',
	MODIFY `about_ctempid` int NULL DEFAULT 0 COMMENT 'เทมเพลตที่ใช้';

ALTER TABLE `wm_about_type`
	MODIFY `type_topid` int NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'id ของรายการแม่',
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL DEFAULT 0 COMMENT 'เรียงลำดับ',
	MODIFY `type_info` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหมวดหมู่',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'id เทมเพลตหน้ารายการหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'id เทมเพลตหน้าเนื้อหาหมวดหมู่',
	MODIFY `type_title` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อหน้าหมวดหมู่',
	MODIFY `type_key` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นหาหน้าหมวดหมู่',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหน้าหมวดหมู่';

ALTER TABLE `wm_ad_ad`
	MODIFY `ad_type_id` int NULL DEFAULT 0 COMMENT 'ID หมวดหมู่โฆษณา',
	MODIFY `ad_pt` tinyint(1) NULL DEFAULT 4 COMMENT 'โฆษณาอยู่บนแพลตฟอร์มใด, 1=แบบย่อ, 2=แบบสี, 3=แบบสัมผัส, 4=คอมพิวเตอร์',
	MODIFY `ad_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=ไม่แสดง 1=ปกติ',
	MODIFY `ad_type` int NOT NULL DEFAULT 1 COMMENT '1=ข้อความ 2=ข้อความพร้อมรูป 3=js',
	MODIFY `ad_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อตำแหน่งโฆษณา',
	MODIFY `ad_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อโฆษณา',
	MODIFY `ad_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ลิงก์ของโฆษณา',
	MODIFY `ad_img` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่โฆษณารูปภาพ',
	MODIFY `ad_img_width` int NULL DEFAULT 0 COMMENT 'ความกว้างของรูปภาพ',
	MODIFY `ad_img_height` int NULL DEFAULT 0 COMMENT 'ความสูงของรูปภาพ',
	MODIFY `ad_price` decimal(4,2) NULL DEFAULT 0.00 COMMENT 'ราคาต่อหน่วยของโฆษณา',
	MODIFY `ad_js` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โค้ดโฆษณา js',
	MODIFY `ad_time_type` tinyint NULL COMMENT '0=ไม่จำกัดเวลา 1=ลงโฆษณาแบบมีกำหนดเวลา',
	MODIFY `ad_start_time` int NULL DEFAULT 0 COMMENT 'เวลาเริ่มโฆษณา',
	MODIFY `ad_end_time` int NULL DEFAULT 0 COMMENT 'เวลาสิ้นสุดโฆษณา',
	MODIFY `ad_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่มโฆษณา';

ALTER TABLE `wm_ad_type`
	MODIFY `type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่โฆษณา',
	MODIFY `type_info` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหมวดหมู่โฆษณา';

ALTER TABLE `wm_api_api`
	MODIFY `type_id` int NOT NULL COMMENT 'ประเภทอินเทอร์เฟซ',
	MODIFY `api_open` tinyint(1) NULL DEFAULT 1 COMMENT 'อินเทอร์เฟซเปิดหรือไม่, 1=เปิด, 0=ปิด',
	MODIFY `api_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่ออินเทอร์เฟซ',
	MODIFY `api_ctitle` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่ออินเทอร์เฟซ',
	MODIFY `api_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวระบุอินเทอร์เฟซ',
	MODIFY `api_appid` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ID ผู้พัฒนา',
	MODIFY `api_base` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พารามิเตอร์ตั้งค่าอินเทอร์เฟซพื้นฐาน',
	MODIFY `api_info` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายอินเทอร์เฟซ',
	MODIFY `api_order` int NULL COMMENT 'การเรียงลำดับอินเทอร์เฟซ',
	MODIFY `api_option` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พารามิเตอร์อื่นของอินเทอร์เฟซ';

ALTER TABLE `wm_api_tts_voicet`
	MODIFY `voicet_api_id` int NOT NULL COMMENT 'ID อินเทอร์เฟซ',
	MODIFY `voicet_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ใช้งานหรือไม่: 0=ปิดใช้งาน, 1=ใช้งาน',
	MODIFY `voicet_ids` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID ผู้พูด',
	MODIFY `voicet_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อผู้พูด',
	MODIFY `voicet_order` int NOT NULL DEFAULT 9 COMMENT 'เรียงลำดับ, ค่าน้อยอยู่ก่อน';

ALTER TABLE `wm_api_type`
	MODIFY `type_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อประเภทอินเทอร์เฟซ',
	MODIFY `type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ตัวระบุประเภทอินเทอร์เฟซ',
	MODIFY `type_order` int NULL COMMENT 'เรียงลำดับ';

ALTER TABLE `wm_app_app`
	MODIFY `type_id` int NOT NULL DEFAULT 1 COMMENT 'ID หมวดหมู่แอป',
	MODIFY `app_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ต้องตรวจสอบหรือไม่',
	MODIFY `app_rec` int NOT NULL DEFAULT 0 COMMENT 'แนะนำหรือไม่',
	MODIFY `app_ico` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนแอป',
	MODIFY `app_simg` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รูปย่อที่อ้างอิง',
	MODIFY `app_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินแอป',
	MODIFY `app_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อแอป',
	MODIFY `app_cname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อแอป',
	MODIFY `app_lid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT 'id ภาษา',
	MODIFY `app_lid_text` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อความภาษา',
	MODIFY `app_cid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT 'id ค่าใช้จ่าย',
	MODIFY `app_cid_text` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อความค่าใช้จ่าย',
	MODIFY `app_tocn` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=ไม่ใช่ 1=ใช่ แอปที่แปลภาษาแล้ว',
	MODIFY `app_ver` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'เวอร์ชัน',
	MODIFY `app_size` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'ขนาด',
	MODIFY `app_tags` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็กแอป',
	MODIFY `app_aid` int NULL DEFAULT 0 COMMENT 'ผู้พัฒนา',
	MODIFY `app_oid` int NULL DEFAULT 0 COMMENT 'บริษัทผู้ให้บริการ',
	MODIFY `app_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รีวิว, ตัวอย่าง',
	MODIFY `app_content` varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อ',
	MODIFY `app_read` int NOT NULL DEFAULT 0 COMMENT 'ยอดเข้าชมแอป',
	MODIFY `app_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนความคิดเห็นแอป',
	MODIFY `app_ding` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโหวตชอบแอป',
	MODIFY `app_cai` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโหวตไม่ชอบแอป',
	MODIFY `app_start` decimal(2,1) NOT NULL DEFAULT 0.0 COMMENT 'ระดับดาว',
	MODIFY `app_score` decimal(2,1) NOT NULL DEFAULT 0.0 COMMENT 'คะแนนแอป',
	MODIFY `app_paid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'แพลตฟอร์มที่ใช้งาน',
	MODIFY `app_paid_text` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อความแพลตฟอร์มที่ใช้งาน',
	MODIFY `app_osver` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'ข้อกำหนดของระบบ',
	MODIFY `app_downnum` int NOT NULL DEFAULT 0 COMMENT 'ยอดดาวน์โหลดแอป',
	MODIFY `app_down1` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่ดาวน์โหลดแอป 1',
	MODIFY `app_down2` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่ดาวน์โหลดแอป 2',
	MODIFY `app_down3` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่ดาวน์โหลดแอป 3',
	MODIFY `app_addtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที';

ALTER TABLE `wm_app_attr`
	MODIFY `attr_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'c=ค่าใช้จ่าย p=แพลตฟอร์ม l=ภาษา',
	MODIFY `attr_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อแอตทริบิวต์';

ALTER TABLE `wm_app_firms`
	MODIFY `firms_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'a=ผู้พัฒนาระบบ o=ผู้ให้บริการ s=พัฒนาและขายเอง',
	MODIFY `firms_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อผู้พัฒนา',
	MODIFY `firms_cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อผู้พัฒนา',
	MODIFY `firms_url` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เว็บไซต์ทางการ',
	MODIFY `firms_adress` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่ติดต่อ',
	MODIFY `firms_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โทรศัพท์ผู้พัฒนา',
	MODIFY `firms_email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'อีเมลผู้พัฒนา',
	MODIFY `firms_content` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายผู้พัฒนา',
	MODIFY `firms_addtime` int NULL COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_app_type`
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL DEFAULT 0 COMMENT 'เรียงลำดับ',
	MODIFY `type_ico` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนประเภท',
	MODIFY `type_info` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อของประเภท',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตเนื้อหาหมวดหมู่',
	MODIFY `type_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อหมวดหมู่',
	MODIFY `type_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นหาหมวดหมู่',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหมวดหมู่';

ALTER TABLE `wm_article_article`
	MODIFY `type_id` int NOT NULL DEFAULT 1 COMMENT 'ID หมวดหมู่ข่าว',
	MODIFY `article_display` tinyint(1) NULL DEFAULT 1 COMMENT 'แสดงหรือไม่, สร้าง html',
	MODIFY `article_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=รอตรวจสอบ 1=ปกติ 2=ถังขยะ',
	MODIFY `article_weight` int NOT NULL DEFAULT 0 COMMENT 'น้ำหนักบทความ, ยิ่งมากยิ่งอยู่ก่อน',
	MODIFY `article_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำหรือไม่',
	MODIFY `article_head` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'เป็นข่าวพาดหัวหรือไม่',
	MODIFY `article_strong` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ทำตัวหนาหรือไม่',
	MODIFY `article_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อบทความ',
	MODIFY `article_cname` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อบทความ',
	MODIFY `article_color` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'สีหัวข้อ',
	MODIFY `article_simg` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รูปย่อ',
	MODIFY `article_source` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แหล่งที่มาบทความ',
	MODIFY `article_tags` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็ก',
	MODIFY `article_url` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เปลี่ยนเส้นทางหรือไม่',
	MODIFY `article_author` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'admin' COMMENT 'ผู้แต่ง',
	MODIFY `article_author_id` int NULL DEFAULT 0 COMMENT 'ผู้แต่งบทความ',
	MODIFY `article_editor` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'admin' COMMENT 'บรรณาธิการ',
	MODIFY `article_editor_id` int NULL DEFAULT 1 COMMENT 'id ของบรรณาธิการ',
	MODIFY `article_info` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อ',
	MODIFY `article_save_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ประเภทการจัดเก็บเนื้อหาบทความ, 1=ฐานข้อมูล, 2=ไฟล์',
	MODIFY `article_save_path` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พาธที่จัดเก็บไฟล์',
	MODIFY `article_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหา',
	MODIFY `article_read` int NOT NULL DEFAULT 0 COMMENT 'ยอดอ่าน',
	MODIFY `article_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนตอบกลับ',
	MODIFY `article_score` decimal(2,1) NULL DEFAULT 0.0 COMMENT 'คะแนนบทความ',
	MODIFY `article_ding` int NOT NULL DEFAULT 0 COMMENT 'กดชอบ',
	MODIFY `article_cai` int NOT NULL DEFAULT 0 COMMENT 'กดไม่ชอบ',
	MODIFY `article_addtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที',
	MODIFY `article_examinetime` int NOT NULL DEFAULT 0 COMMENT 'เวลาตรวจสอบ';

ALTER TABLE `wm_article_author`
	MODIFY `author_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'a' COMMENT 'เป็นผู้แต่งหรือแหล่งที่มา, a=ผู้แต่ง, s=แหล่งที่มา',
	MODIFY `author_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อผู้แต่งหรือแหล่งที่มา',
	MODIFY `author_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'เป็นข้อมูลเริ่มต้นหรือไม่',
	MODIFY `author_data` int NULL DEFAULT 0 COMMENT 'จำนวนรายการข้อมูลที่จับคู่กับแอตทริบิวต์ปัจจุบัน';

ALTER TABLE `wm_article_type`
	MODIFY `type_status` tinyint(1) NULL DEFAULT 1 COMMENT 'แสดงหรือไม่',
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อหมวดหมู่',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินหมวดหมู่',
	MODIFY `type_order` int NOT NULL DEFAULT 0 COMMENT 'เรียงลำดับ',
	MODIFY `type_ico` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอน',
	MODIFY `type_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อหมวดหมู่',
	MODIFY `type_add` tinyint(1) NULL DEFAULT 1 COMMENT 'หมวดหมู่อนุญาตให้ส่งผลงานหรือไม่',
	MODIFY `type_titempid` int NOT NULL DEFAULT 0 COMMENT 'หน้าแรกหมวดหมู่',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'รายการหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'id เทมเพลตหน้าเนื้อหา',
	MODIFY `type_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อหมวดหมู่',
	MODIFY `type_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นหาหมวดหมู่',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหมวดหมู่';

ALTER TABLE `wm_author_author`
	MODIFY `user_id` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `author_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=รอตรวจสอบ 1=ปกติ 2=ไม่ผ่าน',
	MODIFY `author_nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'นามปากกาผู้แต่ง ห้ามแก้ไข',
	MODIFY `author_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เรื่องย่อผู้แต่ง',
	MODIFY `author_notice` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประกาศจากผู้แต่ง',
	MODIFY `author_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เปิดใช้งาน',
	MODIFY `author_toptime` int NOT NULL DEFAULT 0 COMMENT 'เวลาเข้าสู่ระบบครั้งล่าสุด';

ALTER TABLE `wm_author_draft`
	MODIFY `draft_author_id` int NOT NULL COMMENT 'ผู้แต่งของฉบับร่าง',
	MODIFY `draft_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลของกล่องฉบับร่าง',
	MODIFY `draft_cid` int NOT NULL DEFAULT 0 COMMENT 'id เนื้อหาที่ฉบับร่างสังกัด',
	MODIFY `draft_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อฉบับร่าง',
	MODIFY `draft_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาฉบับร่าง',
	MODIFY `draft_number` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคำของฉบับร่าง',
	MODIFY `draft_option` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ตัวเลือกของข้อมูลอื่น',
	MODIFY `draft_createtime` int NOT NULL COMMENT 'เวลาสร้างฉบับร่าง';

ALTER TABLE `wm_author_end`
	MODIFY `end_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลรางวัลเมื่อจบเรื่อง',
	MODIFY `end_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทการตรวจสอบรางวัลเมื่อจบเรื่อง（จำนวนคำ、ตอน）',
	MODIFY `end_number` int NULL COMMENT 'เงื่อนไขจำนวนรางวัล',
	MODIFY `end_gold1` decimal(5,2) NULL COMMENT 'รางวัลเหรียญ 1',
	MODIFY `end_gold2` decimal(5,2) NULL COMMENT 'รางวัลเหรียญ 2';

ALTER TABLE `wm_author_exp`
	MODIFY `exp_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลของค่าประสบการณ์',
	MODIFY `exp_number` int NOT NULL DEFAULT 0 COMMENT 'ค่าประสบการณ์',
	MODIFY `exp_author_id` int NOT NULL COMMENT 'id ผู้แต่ง';

ALTER TABLE `wm_author_level`
	MODIFY `level_module` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลระดับ',
	MODIFY `level_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ',
	MODIFY `level_start` int NOT NULL DEFAULT 0 COMMENT 'ประสบการณ์เริ่มต้น',
	MODIFY `level_end` int NOT NULL DEFAULT 0 COMMENT 'ประสบการณ์สิ้นสุด',
	MODIFY `level_order` int NOT NULL DEFAULT 0 COMMENT 'ตำแหน่งที่แสดง';

ALTER TABLE `wm_author_module_income`
	MODIFY `income_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลรายรับ',
	MODIFY `income_author_id` int NOT NULL COMMENT 'id ผู้แต่ง',
	MODIFY `income_cid` int NOT NULL COMMENT 'เนื้อหาโมดูล',
	MODIFY `income_gold1_now` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญสะสมปัจจุบัน 1',
	MODIFY `income_gold2_now` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญสะสมปัจจุบัน 2',
	MODIFY `income_gold1` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญสะสมทั้งหมด 1',
	MODIFY `income_gold2` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญสะสมทั้งหมด 2';

ALTER TABLE `wm_author_sign`
	MODIFY `sign_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูล',
	MODIFY `sign_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับการเซ็นสัญญา',
	MODIFY `sign_divide` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '7:3' COMMENT 'อัตราส่วนแบ่งรายได้จากการให้รางวัลด้วยไอเทม',
	MODIFY `sign_gold1` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญ 1 ต่อพันคำ',
	MODIFY `sign_gold2` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญ 2 ต่อพันคำ',
	MODIFY `sign_order` tinyint NULL DEFAULT 0 COMMENT 'เรียงลำดับ';

ALTER TABLE `wm_author_word`
	MODIFY `word_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูล',
	MODIFY `word_author_id` int NULL COMMENT 'id ผู้แต่ง',
	MODIFY `word_cid` int NULL COMMENT 'id เนื้อหา',
	MODIFY `word_time` int NULL COMMENT 'เวลา';

ALTER TABLE `wm_bbs_bbs`
	MODIFY `bbs_isreplay` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ต้องตอบกลับหรือไม่',
	MODIFY `bbs_islogin` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ต้องเข้าสู่ระบบหรือไม่',
	MODIFY `bbs_ispay` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'เสียเงินหรือไม่',
	MODIFY `bbs_isself` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ดูได้เฉพาะตัวเองหรือไม่',
	MODIFY `type_id` int NOT NULL COMMENT 'id หมวดหมู่',
	MODIFY `bbs_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=รอตรวจสอบ 1=ปกติ',
	MODIFY `bbs_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำ',
	MODIFY `bbs_es` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'คัดสรร',
	MODIFY `bbs_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=ปักหมุดทั้งเว็บไซต์ 2=ปักหมุดในหมวดหมู่ 3=ปักหมุดปัจจุบัน',
	MODIFY `bbs_simg` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รูปย่อ',
	MODIFY `bbs_title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อโพสต์',
	MODIFY `bbs_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาโพสต์',
	MODIFY `user_id` int NOT NULL DEFAULT 0 COMMENT 'ผู้ใช้ที่โพสต์',
	MODIFY `bbs_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาโพสต์',
	MODIFY `bbs_replay_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาตอบกลับล่าสุด',
	MODIFY `bbs_replay_nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อเล่นผู้ใช้ที่ตอบโพสต์',
	MODIFY `bbs_replay_uid` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้ที่ตอบโพสต์',
	MODIFY `bbs_read` int NOT NULL DEFAULT 0 COMMENT 'ยอดเข้าชม',
	MODIFY `bbs_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนตอบกลับ',
	MODIFY `bbs_tags` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็ก',
	MODIFY `bbs_ding` int NOT NULL DEFAULT 0 COMMENT 'กดชอบ',
	MODIFY `bbs_cai` int NOT NULL DEFAULT 0 COMMENT 'กดไม่ชอบ',
	MODIFY `bbs_score` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'คะแนน';

ALTER TABLE `wm_bbs_moderator`
	MODIFY `user_id` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `type_id` int NOT NULL DEFAULT 0 COMMENT 'id ของบอร์ด';

ALTER TABLE `wm_bbs_type`
	MODIFY `type_post_open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=เปิด',
	MODIFY `type_replay_open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=เปิด',
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อย่อของประเภท',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL DEFAULT 50 COMMENT 'เรียงลำดับ',
	MODIFY `type_info` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อ',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าเนื้อหา',
	MODIFY `type_rtempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าความคิดเห็น',
	MODIFY `type_ico` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่ไอคอน',
	MODIFY `type_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อบอร์ด',
	MODIFY `type_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นของบอร์ด',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายบอร์ด',
	MODIFY `type_last_post` int NOT NULL DEFAULT 0 COMMENT 'โพสต์ล่าสุด',
	MODIFY `type_last_replay` int NOT NULL DEFAULT 0 COMMENT 'ตอบกลับล่าสุด',
	MODIFY `type_uptime` int NOT NULL DEFAULT 0 COMMENT 'เวลาอัปเดตข้อมูล',
	MODIFY `type_sum_post` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโพสต์ทั้งหมด',
	MODIFY `type_sum_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนตอบกลับทั้งหมด',
	MODIFY `type_sum_read` int NOT NULL DEFAULT 0 COMMENT 'ยอดเข้าชมทั้งหมด',
	MODIFY `type_today_post` int NOT NULL DEFAULT 0 COMMENT 'โพสต์รายวัน',
	MODIFY `type_today_replay` int NOT NULL DEFAULT 0 COMMENT 'ตอบกลับรายวัน',
	MODIFY `type_today_read` int NOT NULL DEFAULT 0 COMMENT 'ยอดเข้าชมรายวัน';

ALTER TABLE `wm_config_config`
	MODIFY `config_status` tinyint(1) NULL DEFAULT 1 COMMENT 'แสดงการตั้งค่าหรือไม่',
	MODIFY `group_id` int NULL DEFAULT 0 COMMENT 'id กลุ่มการตั้งค่า',
	MODIFY `config_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลของการตั้งค่า',
	MODIFY `config_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อของการตั้งค่า',
	MODIFY `config_name` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อฟิลด์ของการตั้งค่า',
	MODIFY `config_value` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ค่าฟิลด์ของการตั้งค่า',
	MODIFY `config_formtype` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทฟอร์มของการตั้งค่า',
	MODIFY `config_remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมายเหตุของการตั้งค่า',
	MODIFY `config_order` int NULL COMMENT 'ลำดับการแสดงของการตั้งค่า';

ALTER TABLE `wm_config_field`
	MODIFY `field_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อฟิลด์',
	MODIFY `field_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่สังกัด',
	MODIFY `field_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=ฟิลด์หมวดหมู่ 2=ฟิลด์เนื้อหา',
	MODIFY `field_type_id` int NOT NULL COMMENT 'ID ของหมวดหมู่ที่สังกัด',
	MODIFY `field_type_child` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'มีผลกับหมวดหมู่ย่อยหรือไม่',
	MODIFY `field_type_pids` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'ความสัมพันธ์ระดับของหมวดหมู่',
	MODIFY `field_option` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวเลือก';

ALTER TABLE `wm_config_field_value`
	MODIFY `value_field_id` int NOT NULL COMMENT 'id ของตัวเลือก',
	MODIFY `value_field_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลของค่า',
	MODIFY `value_field_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ประเภทของค่า',
	MODIFY `value_content_id` int NOT NULL DEFAULT 0 COMMENT 'id ของเนื้อหา ค่าเริ่มต้น 0',
	MODIFY `field_option` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อของตัวเลือก',
	MODIFY `value_option` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ค่าของตัวเลือก';

ALTER TABLE `wm_config_group`
	MODIFY `group_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อกลุ่ม',
	MODIFY `group_remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมายเหตุกลุ่ม';

ALTER TABLE `wm_config_label`
	MODIFY `label_title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อแท็ก',
	MODIFY `label_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อแท็ก',
	MODIFY `label_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ค่าของแท็ก';

ALTER TABLE `wm_config_option`
	MODIFY `config_id` int NULL DEFAULT 0 COMMENT 'id ของการตั้งค่า',
	MODIFY `option_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อตัวเลือก',
	MODIFY `option_value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ค่าของตัวเลือก',
	MODIFY `option_order` int NULL DEFAULT 9 COMMENT 'การเรียงลำดับของตัวเลือก';

ALTER TABLE `wm_diy_diy`
	MODIFY `diy_status` tinyint(1) NULL DEFAULT 1 COMMENT 'สถานะของหน้าเพจที่กำหนดเอง',
	MODIFY `diy_read` int NULL DEFAULT 0 COMMENT 'ยอดอ่าน',
	MODIFY `diy_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหน้าเพจที่กำหนดเอง',
	MODIFY `diy_pinyin` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'พินอิน',
	MODIFY `diy_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อ',
	MODIFY `diy_key` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นหา',
	MODIFY `diy_desc` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบาย',
	MODIFY `diy_content` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหา',
	MODIFY `diy_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม',
	MODIFY `diy_ctempid` int NULL DEFAULT 0 COMMENT 'id เทมเพลตของหัวข้อพิเศษ';

ALTER TABLE `wm_editor`
	MODIFY `editor_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'เปิดใช้งานหรือไม่: 1=ใช่, 0=ไม่ใช่',
	MODIFY `editor_uid` int NOT NULL COMMENT 'id ผู้ใช้',
	MODIFY `editor_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อบรรณาธิการ',
	MODIFY `editor_realname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อ-นามสกุลจริงของบรรณาธิการ',
	MODIFY `editor_desc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เรื่องย่อของบรรณาธิการ',
	MODIFY `editor_qq` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'qq ของบรรณาธิการ',
	MODIFY `editor_weixin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'บัญชี WeChat ของบรรณาธิการ',
	MODIFY `editor_tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเลขมือถือของบรรณาธิการ',
	MODIFY `editor_time` int NOT NULL COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_editor_bind`
	MODIFY `bind_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูล',
	MODIFY `bind_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ประเภทบรรณาธิการ:1=บรรณาธิการใหญ่,2=บรรณาธิการดูแลต้นฉบับ',
	MODIFY `bind_group_id` int NOT NULL COMMENT 'id กลุ่ม',
	MODIFY `bind_editor_id` int NOT NULL DEFAULT 0 COMMENT 'id บรรณาธิการ',
	MODIFY `bind_time` int NOT NULL COMMENT 'เวลาผูกบัญชี';

ALTER TABLE `wm_editor_group`
	MODIFY `group_id` int NOT NULL auto_increment COMMENT 'id กลุ่ม',
	MODIFY `group_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูลกลุ่ม',
	MODIFY `group_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อกลุ่ม',
	MODIFY `group_desc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำอธิบายกลุ่ม',
	MODIFY `group_order` tinyint NOT NULL DEFAULT 9 COMMENT 'ลำดับกลุ่ม',
	MODIFY `group_time` int NOT NULL COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_editor_works`
	MODIFY `works_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูล',
	MODIFY `works_group_id` int NOT NULL COMMENT 'id กลุ่มของบรรณาธิการ',
	MODIFY `works_cid` int NOT NULL COMMENT 'id ผลงาน',
	MODIFY `works_bind_id` int NULL DEFAULT 0 COMMENT 'id ผูกกลุ่ม',
	MODIFY `works_editor_id` int NULL DEFAULT 0 COMMENT 'id บรรณาธิการ',
	MODIFY `works_time` int NOT NULL COMMENT 'เวลายื่นคำขอ';

ALTER TABLE `wm_fans_module`
	MODIFY `fans_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่สังกัด',
	MODIFY `fans_user_id` int NOT NULL COMMENT 'id แฟนคลับ',
	MODIFY `fans_cid` int NULL COMMENT 'id เนื้อหา',
	MODIFY `fans_exp` int NULL DEFAULT 0 COMMENT 'ค่าประสบการณ์แฟนคลับ',
	MODIFY `fans_addtime` int NULL COMMENT 'เวลาติดตาม';

ALTER TABLE `wm_fans_module_consume`
	MODIFY `consume_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่ใช้จ่าย',
	MODIFY `consume_user_id` int NULL COMMENT 'id ผู้ใช้',
	MODIFY `consume_cid` int NULL COMMENT 'id เนื้อหา',
	MODIFY `consume_gold1_exp` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของค่าประสบการณ์แฟนคลับ1',
	MODIFY `consume_gold2_exp` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของค่าประสบการณ์แฟนคลับ2',
	MODIFY `consume_gold1_ticket` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของประเภทโหวต1',
	MODIFY `consume_gold2_ticket` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของประเภทโหวต2',
	MODIFY `consume_gold1` decimal(15,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้จ่ายทั้งหมด 1',
	MODIFY `consume_gold2` decimal(15,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้จ่ายทั้งหมด 2';

ALTER TABLE `wm_fans_module_level`
	MODIFY `level_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลของระดับ',
	MODIFY `level_cid` int NOT NULL DEFAULT 0 COMMENT '0=เนื้อหาทั้งหมด ค่าอื่น=ระดับแฟนที่กำหนดเอง',
	MODIFY `level_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ',
	MODIFY `level_start` int NOT NULL DEFAULT 0 COMMENT 'ประสบการณ์เริ่มต้นของระดับ',
	MODIFY `level_end` int NOT NULL DEFAULT 0 COMMENT 'ประสบการณ์สิ้นสุดของระดับ',
	MODIFY `level_order` int NOT NULL DEFAULT 0 COMMENT 'การเรียงลำดับระดับ';

ALTER TABLE `wm_finance_apply`
	MODIFY `apply_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=รอตรวจสอบ 1=ดำเนินการแล้ว 2=ไม่ผ่าน',
	MODIFY `apply_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลต้นทางของการชำระบัญชี สามารถเว้นว่างได้',
	MODIFY `apply_cid` int NOT NULL DEFAULT 0 COMMENT 'ID เนื้อหาโมดูล',
	MODIFY `apply_month` int NOT NULL COMMENT 'เดือนของการชำระบัญชี',
	MODIFY `apply_time` int NOT NULL COMMENT 'เวลาของการชำระบัญชี',
	MODIFY `apply_manager_id` int NOT NULL COMMENT 'ผู้ยื่นคำขอชำระบัญชี',
	MODIFY `apply_total` decimal(10,2) NOT NULL COMMENT 'ยอดรวมของคำขอชำระบัญชี',
	MODIFY `apply_bonus` decimal(10,2) NULL COMMENT 'จำนวนเงินรางวัล',
	MODIFY `apply_bonus_remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุรางวัล',
	MODIFY `apply_deduct` decimal(10,2) NULL COMMENT 'หมายเหตุการลงโทษ',
	MODIFY `apply_deduct_remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุการลงโทษ',
	MODIFY `apply_real` decimal(10,2) NOT NULL COMMENT 'จำนวนเงินที่เข้าบัญชีจริง',
	MODIFY `apply_real_money` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'ยอดเงินหยวนที่เข้าจริง 0=โหมด 1',
	MODIFY `apply_remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุคำขอชำระบัญชี',
	MODIFY `apply_to_user_id` int NOT NULL DEFAULT 0 COMMENT 'ผู้ใช้ที่ได้รับคำขอชำระบัญชี',
	MODIFY `apply_handle_manager_id` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ดูแลระบบที่พิจารณาคำขอ',
	MODIFY `apply_handle_remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุการพิจารณาคำขอ',
	MODIFY `apply_handle_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาพิจารณาคำขอ';

ALTER TABLE `wm_finance_level`
	MODIFY `level_money` int NOT NULL DEFAULT 0 COMMENT 'จำนวนเงินที่เติม',
	MODIFY `level_real` int NOT NULL DEFAULT 0 COMMENT 'ราคาที่ต้องชำระหลังส่วนลด',
	MODIFY `level_reward_gold2` int NOT NULL DEFAULT 0 COMMENT 'เหรียญที่แจกให้2';

ALTER TABLE `wm_finance_order_cash`
	MODIFY `cash_status` tinyint(1) NULL DEFAULT 0 COMMENT '0=รอพิจารณา 1=ดำเนินการแล้ว 2=ถูกปฏิเสธ',
	MODIFY `cash_user_id` int NOT NULL COMMENT 'ผู้ใช้ที่ยื่นคำขอ',
	MODIFY `cash_money` decimal(10,2) NOT NULL COMMENT 'จำนวนเงินที่ถอน',
	MODIFY `cash_real` decimal(10,2) NOT NULL COMMENT 'ยอดเงินเข้าบัญชีจริง',
	MODIFY `cash_cost` tinyint NOT NULL DEFAULT 0 COMMENT 'ค่าธรรมเนียมการถอนเงิน',
	MODIFY `cash_remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมายเหตุ',
	MODIFY `cash_time` int NULL DEFAULT 0 COMMENT 'เวลายื่นคำขอ',
	MODIFY `cash_handletime` int NULL DEFAULT 0 COMMENT 'เวลาดำเนินการ';

ALTER TABLE `wm_finance_order_charge`
	MODIFY `charge_sn` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หมายเลขคำสั่งซื้อเติมเงินของเว็บไซต์นี้',
	MODIFY `charge_paysn` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเลขคำสั่งซื้อการเติมเงินของบุคคลที่สาม',
	MODIFY `charge_status` tinyint(1) NULL DEFAULT 0 COMMENT 'สถานะคำสั่งซื้อ 0 คือรอชำระเงิน 1 คือชำระเงินแล้ว',
	MODIFY `charge_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'วิธีเติมเงิน card=เติมด้วยรหัสบัตร',
	MODIFY `charge_user_id` int NOT NULL DEFAULT 0 COMMENT 'ผู้ใช้ที่เติมเงิน',
	MODIFY `charge_tuser_id` int NOT NULL DEFAULT 0 COMMENT 'id เพื่อน',
	MODIFY `charge_money` decimal(10,2) NULL COMMENT 'จำนวนเงินเติม',
	MODIFY `charge_gold2` decimal(10,2) NULL COMMENT 'เหรียญที่ได้รับ2',
	MODIFY `charge_first` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'มีรางวัลเติมเงินครั้งแรกหรือไม่',
	MODIFY `charge_reward` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'มีรางวัลเติมเงินหรือไม่',
	MODIFY `charge_addtime` int NULL DEFAULT 0 COMMENT 'เวลาสั่งซื้อ',
	MODIFY `charge_paytime` int NULL DEFAULT 0 COMMENT 'เวลาชำระเงิน',
	MODIFY `charge_remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุ';

ALTER TABLE `wm_finance_report`
	MODIFY `report_settlement` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'คำนวณหรือไม่: 0=ยังไม่ชำระ, 1=ชำระแล้ว',
	MODIFY `report_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูล',
	MODIFY `report_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภท',
	MODIFY `report_user_id` int NOT NULL DEFAULT 0 COMMENT 'ID ผู้ใช้ที่ใช้จ่ายหรือรับรายได้',
	MODIFY `report_cid` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id เนื้อหาที่ซื้อ หรือ id ต้นทาง',
	MODIFY `report_gold1` decimal(10,3) NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ1 ที่ต้องชำระบัญชี',
	MODIFY `report_gold2` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ2 ที่ต้องชำระบัญชี',
	MODIFY `report_remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมายเหตุ',
	MODIFY `report_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาบันทึกเข้าบัญชี',
	MODIFY `report_settlement_id` int NOT NULL DEFAULT 0 COMMENT 'ID ผู้ชำระบัญชี',
	MODIFY `report_settlement_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาชำระบัญชี';

ALTER TABLE `wm_finance_report_list`
	MODIFY `list_report_id` int NOT NULL DEFAULT 0 COMMENT 'id รายงานการชำระบัญชี',
	MODIFY `list_order_id` int NOT NULL DEFAULT 0 COMMENT 'id คำสั่งซื้อที่ชำระบัญชี';

ALTER TABLE `wm_finance_report_order`
	MODIFY `order_gold1` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญของคำสั่งซื้อ1',
	MODIFY `order_gold2` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญของคำสั่งซื้อ2',
	MODIFY `order_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'ยอดเงินของคำสั่งซื้อ',
	MODIFY `order_admin_id` int NOT NULL DEFAULT 0 COMMENT 'ผู้ชำระบัญชี',
	MODIFY `order_time` int NOT NULL DEFAULT 0 COMMENT 'การชำระบัญชี';

ALTER TABLE `wm_flash_flash`
	MODIFY `flash_status` tinyint(1) NULL DEFAULT 1 COMMENT 'สถานะ',
	MODIFY `type_id` int NOT NULL DEFAULT 0 COMMENT 'กลุ่มสไลด์',
	MODIFY `flash_order` int NOT NULL COMMENT 'เรียงลำดับ',
	MODIFY `flash_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'อยู่ในโมดูลใด',
	MODIFY `flash_pid` int NOT NULL COMMENT 'id หน้าเพจ',
	MODIFY `flash_title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อ',
	MODIFY `flash_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อ',
	MODIFY `flash_desc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำอธิบาย',
	MODIFY `flash_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ที่อยู่ปลายทาง',
	MODIFY `flash_img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนสไลด์',
	MODIFY `flash_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_flash_type`
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL DEFAULT 0 COMMENT 'ลำดับหมวดหมู่',
	MODIFY `type_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุหมวดหมู่';

ALTER TABLE `wm_link_click`
	MODIFY `click_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เข้าหรือออก',
	MODIFY `click_ua` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูล UA',
	MODIFY `click_ip` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'IP ที่คลิก',
	MODIFY `click_adress` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ตำแหน่งที่ตั้ง',
	MODIFY `click_browser` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เบราว์เซอร์',
	MODIFY `click_browser_ver` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เวอร์ชันเบราว์เซอร์',
	MODIFY `click_system` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทระบบ',
	MODIFY `click_system_ver` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เวอร์ชันระบบ',
	MODIFY `click_time` int NOT NULL COMMENT 'เวลาคลิก';

ALTER TABLE `wm_link_link`
	MODIFY `type_id` int NOT NULL COMMENT 'id หมวดหมู่',
	MODIFY `link_name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อลิงก์เพื่อน',
	MODIFY `link_cname` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อลิงก์เพื่อน',
	MODIFY `link_pinyin` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอิน',
	MODIFY `link_ico` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอน',
	MODIFY `link_order` int NOT NULL DEFAULT 99 COMMENT 'เรียงลำดับ',
	MODIFY `link_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'สถานะ',
	MODIFY `link_show` tinyint(1) NULL DEFAULT 1 COMMENT '1=แสดงลิงก์เปลี่ยนเส้นทาง 0=ลิงก์ตรง',
	MODIFY `link_url` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ที่อยู่ลิงก์เพื่อน',
	MODIFY `link_fixed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ลิงก์ถาวร',
	MODIFY `link_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำหรือไม่',
	MODIFY `link_jointime` int NOT NULL DEFAULT 0 COMMENT 'เวลาเข้าร่วม',
	MODIFY `link_in_jump` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ลิงก์เปลี่ยนเส้นทางเมื่อเข้าลิงก์เพื่อน',
	MODIFY `link_info` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อลิงก์เพื่อน',
	MODIFY `link_qq` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'QQ ติดต่อ',
	MODIFY `link_read` int NOT NULL DEFAULT 0 COMMENT 'ยอดอ่าน',
	MODIFY `link_ding` int NOT NULL DEFAULT 0 COMMENT 'กดชอบ',
	MODIFY `link_cai` int NOT NULL DEFAULT 0 COMMENT 'กดไม่ชอบ',
	MODIFY `link_lastintime` int NOT NULL DEFAULT 0 COMMENT 'คลิกเข้าล่าสุด',
	MODIFY `link_lastouttime` int NOT NULL DEFAULT 0 COMMENT 'คลิกออกล่าสุด',
	MODIFY `link_outday` int NOT NULL DEFAULT 0 COMMENT 'คลิกออกรายวัน',
	MODIFY `link_outweek` int NOT NULL DEFAULT 0 COMMENT 'คลิกออก (รายสัปดาห์)',
	MODIFY `link_outmonth` int NOT NULL DEFAULT 0 COMMENT 'คลิกออกรายเดือน',
	MODIFY `link_outyear` int NULL DEFAULT 0 COMMENT 'คลิกออกรายปี',
	MODIFY `link_outsum` int NOT NULL DEFAULT 0 COMMENT 'คลิกออกทั้งหมด',
	MODIFY `link_inday` int NOT NULL DEFAULT 0 COMMENT 'คลิกเข้ารายวัน',
	MODIFY `link_inweek` int NOT NULL DEFAULT 0 COMMENT 'คลิกเข้า (รายสัปดาห์)',
	MODIFY `link_inmonth` int NOT NULL DEFAULT 0 COMMENT 'คลิกเข้ารายเดือน',
	MODIFY `link_inyear` int NULL DEFAULT 0 COMMENT 'คลิกเข้ารายปี',
	MODIFY `link_insum` int NOT NULL DEFAULT 0 COMMENT 'คลิกเข้าทั้งหมด';

ALTER TABLE `wm_link_type`
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำหมวดหมู่หรือไม่',
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL COMMENT 'เรียงลำดับ',
	MODIFY `type_ico` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนหมวดหมู่',
	MODIFY `type_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมวดหมู่',
	MODIFY `type_in_jump` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ลิงก์ปลายทางเมื่อคลิกเข้าลิงก์เพื่อนของหมวดหมู่นี้',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าจัดแสดง',
	MODIFY `type_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อหน้าเพจ',
	MODIFY `type_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นของหน้าเพจ',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหน้าเพจ';

ALTER TABLE `wm_manager_login`
	MODIFY `manager_id` int NOT NULL COMMENT 'id ผู้ดูแลระบบ',
	MODIFY `login_status` tinyint(1) NULL COMMENT '0=เข้าสู่ระบบล้มเหลว 1=เข้าสู่ระบบสำเร็จ 2=รหัสผ่านผิด',
	MODIFY `login_remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รายละเอียดหมายเหตุ',
	MODIFY `login_ip` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ip ที่เข้าสู่ระบบ',
	MODIFY `login_time` int NOT NULL COMMENT 'เวลาที่เข้าสู่ระบบ',
	MODIFY `login_ua` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'UA ที่เข้าสู่ระบบ',
	MODIFY `login_browser` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เบราว์เซอร์ที่เข้าสู่ระบบ';

ALTER TABLE `wm_manager_manager`
	MODIFY `manager_status` int NOT NULL DEFAULT 1 COMMENT '0=ปิดใช้งาน 1=ปกติ',
	MODIFY `manager_cid` int NOT NULL DEFAULT 0 COMMENT 'ID สิทธิ์ของผู้ดูแลระบบ',
	MODIFY `manager_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีผู้ดูแลระบบ',
	MODIFY `manager_psw` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'รหัสผ่านผู้ดูแลระบบ',
	MODIFY `manager_salt` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ซอลต์รหัสผ่านผู้ดูแลระบบ (ไม่ใช้แล้วหลังเปลี่ยนเป็น bcrypt เก็บไว้เพียงเพื่อรองรับแฮชเก่า)',
	MODIFY `manager_lastip` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'IP เข้าสู่ระบบล่าสุด',
	MODIFY `manager_lasttime` int NOT NULL DEFAULT 0 COMMENT 'เข้าสู่ระบบล่าสุด';

ALTER TABLE `wm_manager_operation`
	MODIFY `operation_manager_id` int NULL DEFAULT 0 COMMENT 'ผู้ดูแลระบบที่ดำเนินการ',
	MODIFY `operation_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่ดำเนินการ',
	MODIFY `operation_table` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ตารางที่ดำเนินการ',
	MODIFY `operation_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทการดำเนินการ, insert, updata, delete',
	MODIFY `operation_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลใหม่ของการดำเนินการ',
	MODIFY `operation_where` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เงื่อนไขของข้อมูลที่ดำเนินการ',
	MODIFY `operation_backdata` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลต้นฉบับแบบมิเรอร์ของการดำเนินการ',
	MODIFY `operation_remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมายเหตุของการดำเนินการ',
	MODIFY `operation_time` int NULL DEFAULT 0 COMMENT 'เวลาของการดำเนินการ';

ALTER TABLE `wm_manager_recycle`
	MODIFY `recycle_manager_id` int NOT NULL DEFAULT 0 COMMENT 'id ของผู้ดูแลระบบ',
	MODIFY `recycle_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลใดที่ถูกดำเนินการ',
	MODIFY `recycle_data_id` int NOT NULL DEFAULT 0 COMMENT 'id ข้อมูลที่ลบ',
	MODIFY `recycle_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อข้อมูลที่ลบ',
	MODIFY `recycle_time` int NULL DEFAULT 0 COMMENT 'เวลาที่ลบ';

ALTER TABLE `wm_manager_request`
	MODIFY `request_manager_id` int NOT NULL COMMENT 'id ของผู้ดูแลระบบ',
	MODIFY `request_file` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ไฟล์คอนโทรลเลอร์ที่เข้าถึง',
	MODIFY `request_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'GET' COMMENT 'ประเภทการเข้าชม',
	MODIFY `request_ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ip ของการเข้าชม',
	MODIFY `request_time` int NULL DEFAULT 0 COMMENT 'เวลาที่เข้าชม',
	MODIFY `request_get` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พารามิเตอร์ของคำขอ GET',
	MODIFY `request_post` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พารามิเตอร์ของคำขอ POST';

ALTER TABLE `wm_message_message`
	MODIFY `message_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=ยังไม่ได้อ่าน',
	MODIFY `message_content` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาข้อความ',
	MODIFY `message_time` int NOT NULL COMMENT 'เวลาข้อความ',
	MODIFY `message_ip` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'IP ของข้อความ';

ALTER TABLE `wm_novel_author_said`
	MODIFY `said_id` int NOT NULL auto_increment COMMENT 'ID เพิ่มอัตโนมัติ',
	MODIFY `novel_id` int NOT NULL COMMENT 'ID นิยาย',
	MODIFY `chapter_id` int NOT NULL COMMENT 'ID ของตอน',
	MODIFY `said_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหา',
	MODIFY `said_uptime` int NOT NULL COMMENT 'เวลาอัปเดต';

ALTER TABLE `wm_novel_chapter`
	MODIFY `chapter_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=รอตรวจสอบ 1=ปกติ 2=ไม่ผ่าน',
	MODIFY `chapter_islogin` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ต้องเข้าสู่ระบบจึงจะดูได้หรือไม่',
	MODIFY `chapter_isvip` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ต้องเป็นสมาชิกหรือไม่, 0=ไม่ต้อง',
	MODIFY `chapter_ispay` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ต้องเสียเงินหรือไม่',
	MODIFY `chapter_istxt` tinyint(1) NOT NULL DEFAULT 2 COMMENT '2=นำเข้าฐานข้อมูล 1=เป็นไฟล์ txt',
	MODIFY `chapter_number` int NULL DEFAULT 0 COMMENT 'จำนวนคำของตอน',
	MODIFY `chapter_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อตอน',
	MODIFY `chapter_nid` int NOT NULL DEFAULT 0 COMMENT 'id หนังสือ',
	MODIFY `chapter_vid` int NOT NULL DEFAULT 1 COMMENT 'id เล่ม ค่าเริ่มต้น 1',
	MODIFY `chapter_cid` int NOT NULL DEFAULT 0 COMMENT 'id เนื้อหา',
	MODIFY `chapter_order` int NOT NULL DEFAULT 999 COMMENT 'เรียงลำดับ',
	MODIFY `chapter_path` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พาธบันทึกไฟล์ txt ของตอนแบบครบถ้วน',
	MODIFY `chapter_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที';

ALTER TABLE `wm_novel_content`
	MODIFY `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหา';

ALTER TABLE `wm_novel_novel`
	MODIFY `author_id` int NOT NULL DEFAULT 0 COMMENT 'id ผู้แต่ง',
	MODIFY `novel_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อนิยาย',
	MODIFY `novel_wordname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหนังสือแบบเต็ม',
	MODIFY `novel_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'พินอิน',
	MODIFY `novel_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=รอตรวจสอบ 1=ปกติ',
	MODIFY `novel_copyright` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=ไม่มีลิขสิทธิ์ 1=ขายแบบเซ็นสัญญา 2=ซื้อขาดลิขสิทธิ์',
	MODIFY `novel_sign_id` int NOT NULL DEFAULT 0 COMMENT 'id ของระดับการเซ็นสัญญา',
	MODIFY `novel_sell` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'อนุญาตให้วางขายหรือไม่',
	MODIFY `novel_process` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=กำลังเขียน 2=จบแล้ว 3=หยุดอัปเดต',
	MODIFY `novel_type` int NOT NULL DEFAULT 1 COMMENT '1=ต้นฉบับลงก่อน 2=ลงที่เว็บอื่นก่อน',
	MODIFY `type_id` int NOT NULL COMMENT 'id ประเภท',
	MODIFY `novel_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ผู้แต่ง',
	MODIFY `novel_cover` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ปก',
	MODIFY `novel_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รีวิวของบรรณาธิการ',
	MODIFY `novel_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เรื่องย่อนิยาย',
	MODIFY `novel_tags` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็กนิยาย',
	MODIFY `novel_chapter` int NOT NULL DEFAULT 0 COMMENT 'จำนวนตอนทั้งหมด',
	MODIFY `novel_wordnumber` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคำทั้งหมด',
	MODIFY `novel_uptime` int NOT NULL DEFAULT 0 COMMENT 'เวลาอัปเดตล่าสุด ปีเดือนวันชั่วโมงนาทีวินาที',
	MODIFY `novel_clicktime` int NOT NULL DEFAULT 0 COMMENT 'วันที่อัปเดตการคลิก (ปีเดือนวัน)',
	MODIFY `novel_score` decimal(2,1) NOT NULL DEFAULT 0.0 COMMENT 'คะแนน',
	MODIFY `novel_ding` int NOT NULL DEFAULT 0 COMMENT 'กดชอบ',
	MODIFY `novel_cai` int NOT NULL DEFAULT 0 COMMENT 'กดไม่ชอบ',
	MODIFY `novel_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนความคิดเห็น',
	MODIFY `novel_startcid` int NOT NULL DEFAULT 0 COMMENT 'id ของตอนแรก',
	MODIFY `novel_startcname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'ชื่อของตอนแรก',
	MODIFY `novel_newcid` int NOT NULL DEFAULT 0 COMMENT 'ID ของตอนล่าสุด',
	MODIFY `novel_newcname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'ชื่อตอนล่าสุด',
	MODIFY `novel_createtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาสร้าง',
	MODIFY `novel_todayclick` int NOT NULL DEFAULT 0 COMMENT 'คลิกวันนี้',
	MODIFY `novel_weekclick` int NOT NULL DEFAULT 0 COMMENT 'คลิกสัปดาห์นี้',
	MODIFY `novel_monthclick` int NOT NULL DEFAULT 0 COMMENT 'คลิกเดือนนี้',
	MODIFY `novel_yearclick` int NULL DEFAULT 0 COMMENT 'คลิกรายปี',
	MODIFY `novel_allclick` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคลิกทั้งหมด',
	MODIFY `novel_todaycoll` int NOT NULL DEFAULT 0 COMMENT 'รายการโปรดรายวัน',
	MODIFY `novel_weekcoll` int NOT NULL DEFAULT 0 COMMENT 'รายการโปรดสัปดาห์นี้',
	MODIFY `novel_monthcoll` int NOT NULL DEFAULT 0 COMMENT 'รายการโปรดรายเดือน',
	MODIFY `novel_yearcoll` int NOT NULL DEFAULT 0 COMMENT 'รายการโปรดรายปี',
	MODIFY `novel_allcoll` int NOT NULL DEFAULT 0 COMMENT 'รายการโปรดทั้งหมด',
	MODIFY `novel_colltime` int NOT NULL DEFAULT 0 COMMENT 'เวลาอัปเดตรายการโปรด',
	MODIFY `novel_todayrec` int NOT NULL DEFAULT 0 COMMENT 'การแนะนำจากผู้ใช้รายวัน',
	MODIFY `novel_weekrec` int NOT NULL DEFAULT 0 COMMENT 'ผู้ใช้แนะนำสัปดาห์นี้',
	MODIFY `novel_monthrec` int NOT NULL DEFAULT 0 COMMENT 'การแนะนำจากผู้ใช้รายเดือน',
	MODIFY `novel_yearrec` int NOT NULL DEFAULT 0 COMMENT 'การแนะนำจากผู้ใช้รายปี',
	MODIFY `novel_allrec` int NOT NULL DEFAULT 0 COMMENT 'การแนะนำจากผู้ใช้ทั้งหมด',
	MODIFY `novel_path` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่จัดเก็บไฟล์ txt ของนิยายที่จบแล้ว',
	MODIFY `novel_rectime` int NOT NULL DEFAULT 0 COMMENT 'เวลาอัปเดตที่แนะนำ';

ALTER TABLE `wm_novel_outline`
	MODIFY `outline_id` int NOT NULL auto_increment COMMENT 'ID เพิ่มอัตโนมัติ',
	MODIFY `novel_id` int NOT NULL COMMENT 'ID นิยาย',
	MODIFY `outline_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหาโครงเรื่อง',
	MODIFY `outline_uptime` int NOT NULL COMMENT 'เวลาอัปเดต';

ALTER TABLE `wm_novel_rec`
	MODIFY `rec_nid` int NOT NULL COMMENT 'ID นิยาย',
	MODIFY `rec_img3` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่รูปภาพแนะนำสำหรับหน้าจอสัมผัส',
	MODIFY `rec_img4` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่รูปภาพแนะนำสำหรับคอมพิวเตอร์',
	MODIFY `rec_rt` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อที่แนะนำให้แสดง',
	MODIFY `rec_icr` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ปกหน้าแรก',
	MODIFY `rec_ibr` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'รายการพรีเมียมหน้าแรก',
	MODIFY `rec_ir` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำหน้าแรก',
	MODIFY `rec_ccr` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ปกหมวดหมู่',
	MODIFY `rec_cbr` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'หมวดหมู่คัดสรร',
	MODIFY `rec_cr` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำหมวดหมู่',
	MODIFY `rec_order` int NOT NULL DEFAULT 99 COMMENT 'เรียงลำดับ',
	MODIFY `rec_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_novel_rewardlog`
	MODIFY `log_nid` int NOT NULL DEFAULT 0 COMMENT 'ID นิยาย',
	MODIFY `log_cid` int NULL DEFAULT 0 COMMENT 'id ของตอน สามารถเป็น 0 ได้',
	MODIFY `log_uid` int NOT NULL DEFAULT 0 COMMENT 'ID ผู้ใช้ที่ให้รางวัล',
	MODIFY `log_gold1` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้ในการให้รางวัล 1',
	MODIFY `log_gold2` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้ในการให้รางวัล 2',
	MODIFY `log_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาการให้รางวัล';

ALTER TABLE `wm_novel_sell`
	MODIFY `sell_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=วางขาย 0=เอาออกจากชั้น',
	MODIFY `sell_novel_id` int NOT NULL DEFAULT 0 COMMENT 'ID นิยาย',
	MODIFY `sell_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1' COMMENT 'ประเภทการขาย,1 คือรายตอน 2 คือทั้งเล่ม 3 คือรายเดือน',
	MODIFY `sell_number` decimal(8,2) NULL DEFAULT 0.00 COMMENT 'ราคาต่อพันคำต่อตอน【เหรียญ 2】',
	MODIFY `sell_all` decimal(8,2) NULL DEFAULT 0.00 COMMENT 'ราคาขายทั้งเล่ม【เหรียญ 2】',
	MODIFY `sell_month` decimal(8,2) NULL DEFAULT 0.00 COMMENT 'ราคารายเดือน【เหรียญ 2】',
	MODIFY `sell_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาวางขาย';

ALTER TABLE `wm_novel_sign`
	MODIFY `sign_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=เซ็นสัญญา 0=ยกเลิกสัญญา',
	MODIFY `sign_novel_id` int NOT NULL COMMENT 'ID นิยาย',
	MODIFY `sign_manager_id` int NOT NULL DEFAULT 1 COMMENT 'ผู้ดูแลระบบที่เซ็นสัญญา',
	MODIFY `sign_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ประเภทการเซ็นสัญญา 1 คือขายแบบแบ่งรายได้ 2 คือซื้อขาดลิขสิทธิ์',
	MODIFY `sign_sign_id` int NULL DEFAULT 0 COMMENT 'ระดับการเซ็นสัญญา',
	MODIFY `sign_time` int NOT NULL COMMENT 'เวลาที่เซ็นสัญญา';

ALTER TABLE `wm_novel_sublog`
	MODIFY `log_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ประเภทการสมัครรับ 1 คือรายตอน 2 คือทั้งเล่ม 3 คือรายเดือน',
	MODIFY `log_nid` int NOT NULL DEFAULT 0 COMMENT 'ID นิยาย',
	MODIFY `log_cid` int NULL DEFAULT 0 COMMENT 'id ของตอน สามารถเป็น 0 ได้',
	MODIFY `log_uid` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้ที่สมัครรับ',
	MODIFY `log_gold1` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้ในการสมัครรับ1',
	MODIFY `log_gold2` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้ในการสมัครรับ2',
	MODIFY `log_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาสมัครรับ';

ALTER TABLE `wm_novel_timelimit`
	MODIFY `timelimit_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ค่าบูลีน, ใช้งานได้หรือไม่',
	MODIFY `timelimit_nid` int NOT NULL COMMENT 'ID นิยาย',
	MODIFY `timelimit_starttime` int NOT NULL COMMENT 'เวลาเริ่มฟรีแบบจำกัดเวลา',
	MODIFY `timelimit_endtime` int NOT NULL COMMENT 'เวลาสิ้นสุดฟรีแบบจำกัดเวลา',
	MODIFY `timelimit_order` int NOT NULL COMMENT 'ลำดับการแสดง',
	MODIFY `timelimit_time` int NOT NULL COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_novel_type`
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL COMMENT 'เรียงลำดับ',
	MODIFY `type_ico` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนหมวดหมู่',
	MODIFY `type_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อหมวดหมู่',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าหมวดหมู่',
	MODIFY `type_titempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าแรกหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลต info',
	MODIFY `type_mtempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลต menu',
	MODIFY `type_rtempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลต read',
	MODIFY `type_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อหมวดหมู่',
	MODIFY `type_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นหาหมวดหมู่',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหมวดหมู่';

ALTER TABLE `wm_novel_volume`
	MODIFY `volume_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเล่ม',
	MODIFY `volume_nid` int NOT NULL DEFAULT 0 COMMENT 'id หนังสือ 0=เล่มเริ่มต้น',
	MODIFY `volume_desc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายเล่ม',
	MODIFY `volume_order` int NOT NULL DEFAULT 0 COMMENT 'เรียงลำดับ',
	MODIFY `volume_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาสร้าง ปีเดือนวันชั่วโมงนาทีวินาที';

ALTER TABLE `wm_novel_welfare`
	MODIFY `welfare_nid` int NOT NULL COMMENT 'ID นิยาย',
	MODIFY `welfare_type` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'วิธีแบ่งรายได้นิยายที่อนุญาต',
	MODIFY `welfare_number` decimal(5,2) NULL COMMENT 'รางวัลตามจำนวนคำของนิยาย',
	MODIFY `welfare_finish` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รางวัลนิยายที่จบแล้ว',
	MODIFY `welfare_update` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รางวัลการอัปเดตนิยาย, ชำระทุกเดือน',
	MODIFY `welfare_full` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รางวัลการเข้าใช้งานรายเดือน, ชำระทุกเดือน';

ALTER TABLE `wm_operate_operate`
	MODIFY `operate_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่ดำเนินการ',
	MODIFY `operate_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ประเภทการดำเนินการ',
	MODIFY `operate_cid` int NOT NULL DEFAULT 0 COMMENT 'ID ของเนื้อหาที่ดำเนินการ',
	MODIFY `operate_time` int NOT NULL DEFAULT 0 COMMENT 'เวลา';

ALTER TABLE `wm_operate_score`
	MODIFY `score_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลของคะแนน',
	MODIFY `score_cid` int NOT NULL COMMENT 'id เนื้อหา',
	MODIFY `score_one` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคนที่ได้ 1 คะแนน',
	MODIFY `score_two` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคนที่ได้ 2 คะแนน',
	MODIFY `score_three` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคนที่ได้ 3 คะแนน',
	MODIFY `score_four` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคนที่ได้ 4 คะแนน',
	MODIFY `score_five` int NOT NULL DEFAULT 0 COMMENT 'จำนวนคนที่ได้ 5 คะแนน';

ALTER TABLE `wm_picture_picture`
	MODIFY `type_id` int NOT NULL DEFAULT 1 COMMENT 'ID หมวดหมู่ข่าว',
	MODIFY `picture_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ต้องตรวจสอบหรือไม่',
	MODIFY `picture_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำหรือไม่',
	MODIFY `picture_simg` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รูปย่อ',
	MODIFY `picture_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อชุดรูปภาพ',
	MODIFY `picture_cname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อตอนของชุดรูปภาพ',
	MODIFY `picture_tags` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็กชุดรูปภาพ',
	MODIFY `picture_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รีวิว, ตัวอย่าง',
	MODIFY `picture_imgs` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'อาร์เรย์ซีเรียลไลซ์ของรูปภาพ',
	MODIFY `picture_count` int NOT NULL DEFAULT 0 COMMENT 'จำนวนรูปภาพ',
	MODIFY `picture_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เรื่องย่อ',
	MODIFY `picture_read` int NOT NULL DEFAULT 0 COMMENT 'ยอดเข้าชมชุดรูปภาพ',
	MODIFY `picture_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนความคิดเห็น',
	MODIFY `picture_ding` int NOT NULL DEFAULT 0 COMMENT 'กดชอบ',
	MODIFY `picture_cai` int NOT NULL DEFAULT 0 COMMENT 'กดไม่ชอบ',
	MODIFY `picture_start` decimal(2,1) NOT NULL DEFAULT 0.0 COMMENT 'ระดับดาว',
	MODIFY `picture_score` decimal(2,0) NULL DEFAULT 0 COMMENT 'คะแนน',
	MODIFY `picture_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที';

ALTER TABLE `wm_picture_type`
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL DEFAULT 0 COMMENT 'เรียงลำดับ',
	MODIFY `type_simg` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รูปย่อหมวดหมู่',
	MODIFY `type_ico` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนหมวดหมู่',
	MODIFY `type_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมวดหมู่',
	MODIFY `type_titempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าแรกหมวดหมู่',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าเนื้อหาหมวดหมู่',
	MODIFY `type_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อ',
	MODIFY `type_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นหา',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบาย';

ALTER TABLE `wm_plugin`
	MODIFY `plugin_name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อปลั๊กอิน',
	MODIFY `plugin_floder` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โฟลเดอร์ปลั๊กอิน',
	MODIFY `plugin_author` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ผู้พัฒนาปลั๊กอิน',
	MODIFY `plugin_version` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เวอร์ชันปลั๊กอิน',
	MODIFY `plugin_time` int NOT NULL COMMENT 'เวลาติดตั้งปลั๊กอิน';

ALTER TABLE `wm_plugin_config`
	MODIFY `config_plugin_id` int NOT NULL COMMENT 'ID ปลั๊กอิน',
	MODIFY `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คีย์ปลั๊กอิน',
	MODIFY `config_val` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ค่าปลั๊กอิน';

ALTER TABLE `wm_plugin_demo_apply`
	MODIFY `message_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ผู้ใช้ที่สมัคร',
	MODIFY `message_phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โทรศัพท์ที่ใช้สมัคร',
	MODIFY `message_time` int NOT NULL COMMENT 'เวลาสมัคร';

ALTER TABLE `wm_props_props`
	MODIFY `props_type_id` int NOT NULL COMMENT 'ประเภท',
	MODIFY `props_status` tinyint(1) NULL DEFAULT 1 COMMENT 'แสดงหรือไม่',
	MODIFY `props_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อไอเทม',
	MODIFY `props_cover` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนไอเทม',
	MODIFY `props_stock` int NOT NULL DEFAULT 0 COMMENT 'สต็อกคงเหลือ',
	MODIFY `props_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายไอเทม',
	MODIFY `props_cost` tinyint(1) NULL DEFAULT 1 COMMENT '1=ซื้อด้วยเหรียญ 2=ซื้อด้วยเงินสด',
	MODIFY `props_gold1` decimal(8,2) NULL DEFAULT 0.00 COMMENT 'ราคาเหรียญ1',
	MODIFY `props_gold2` decimal(8,2) NULL DEFAULT 0.00 COMMENT 'ราคาเหรียญ2',
	MODIFY `props_money` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'ราคาเงินสด',
	MODIFY `props_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาวางขาย',
	MODIFY `props_option` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลเพิ่มเติม สตริงที่ serialize แล้ว',
	MODIFY `props_order` int NULL DEFAULT 999 COMMENT 'เรียงลำดับ, ค่าน้อยอยู่ก่อน';

ALTER TABLE `wm_props_sell`
	MODIFY `sell_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่ขาย',
	MODIFY `sell_cid` int NOT NULL DEFAULT 0 COMMENT 'id เนื้อหาที่ซื้อ',
	MODIFY `sell_props_id` int NOT NULL COMMENT 'ผลิตภัณฑ์ที่ขาย',
	MODIFY `sell_user_id` int NOT NULL COMMENT 'ผู้ใช้ที่ซื้อ',
	MODIFY `sell_number` int NOT NULL DEFAULT 1 COMMENT 'จำนวนที่ซื้อ',
	MODIFY `sell_gold1` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้ซื้อ1',
	MODIFY `sell_gold2` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เหรียญที่ใช้ซื้อ2',
	MODIFY `sell_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'เงินสดที่ใช้ซื้อ',
	MODIFY `sell_remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุข้อความ',
	MODIFY `sell_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่ซื้อ';

ALTER TABLE `wm_props_type`
	MODIFY `type_status` tinyint(1) NULL DEFAULT 1 COMMENT 'แสดงหรือไม่',
	MODIFY `type_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่หมวดหมู่อยู่',
	MODIFY `type_topid` int NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อหมวดหมู่',
	MODIFY `type_order` int NULL COMMENT 'ลำดับหมวดหมู่';

ALTER TABLE `wm_replay_replay`
	MODIFY `replay_floor` int NOT NULL DEFAULT 1 COMMENT 'ชั้นของความคิดเห็น',
	MODIFY `replay_pid` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'โครงสร้าง id ของชั้นความคิดเห็นระดับบนสุด',
	MODIFY `replay_rid` int NOT NULL DEFAULT 0 COMMENT 'id ของการตอบกลับ',
	MODIFY `replay_status` int NOT NULL DEFAULT 1 COMMENT '1=ปกติ 2=รอตรวจสอบ',
	MODIFY `replay_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูล',
	MODIFY `replay_cid` int NOT NULL COMMENT 'id เนื้อหา',
	MODIFY `replay_subset_id` int NULL DEFAULT 0 COMMENT 'id ชุดย่อยเนื้อหา',
	MODIFY `replay_segment_id` int NULL DEFAULT 0 COMMENT 'id ตอนย่อยของชุดย่อยเนื้อหา',
	MODIFY `replay_uid` int NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `replay_nickname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อ-นามสกุล',
	MODIFY `replay_ruid` int NULL DEFAULT 0 COMMENT 'id ผู้ใช้ที่ตอบกลับ',
	MODIFY `replay_rnickname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อเล่นผู้ใช้ที่ตอบกลับ',
	MODIFY `replay_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหา',
	MODIFY `replay_count` int NOT NULL DEFAULT 0 COMMENT 'จำนวนตอบกลับ',
	MODIFY `replay_ding` int NOT NULL DEFAULT 0 COMMENT 'กดชอบ',
	MODIFY `replay_cai` int NOT NULL DEFAULT 0 COMMENT 'กดไม่ชอบ',
	MODIFY `replay_time` int NOT NULL COMMENT 'เวลา';

ALTER TABLE `wm_search_search`
	MODIFY `search_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำให้แสดงหรือไม่',
	MODIFY `search_count` int NOT NULL DEFAULT 1 COMMENT 'จำนวนครั้งที่ค้นหา',
	MODIFY `search_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูล',
	MODIFY `search_type` int NOT NULL COMMENT '1=หัวข้อ 2=ผู้แต่ง 3=แท็ก',
	MODIFY `search_key` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำสำคัญ',
	MODIFY `search_data` int NOT NULL DEFAULT 0 COMMENT 'ข้อมูล',
	MODIFY `search_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาค้นหา';

ALTER TABLE `wm_seo_errpage`
	MODIFY `errpage_code` int NULL DEFAULT 500 COMMENT 'ประเภทโค้ดหน้าข้อผิดพลาด 404 หรือ 500',
	MODIFY `errpage_url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่หน้าที่ผิดพลาด',
	MODIFY `errpage_ua` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ua เบราว์เซอร์',
	MODIFY `errpage_time` int NULL DEFAULT 0 COMMENT 'เวลาที่บันทึกข้อผิดพลาด';

ALTER TABLE `wm_seo_html`
	MODIFY `html_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูล',
	MODIFY `html_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภท',
	MODIFY `html_type_id` int NOT NULL DEFAULT 0 COMMENT 'id หมวดหมู่',
	MODIFY `html_path4` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พาธไฟล์ static ของเว็บ';

ALTER TABLE `wm_seo_html_plan`
	MODIFY `plan_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อภารกิจ',
	MODIFY `plan_url` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ลิงก์ url',
	MODIFY `plan_data` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พารามิเตอร์ post',
	MODIFY `plan_path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'พาธที่บันทึก',
	MODIFY `plan_lasttime` int NOT NULL DEFAULT 0 COMMENT 'เวลาดำเนินการล่าสุด',
	MODIFY `plan_addtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_seo_keys`
	MODIFY `keys_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่สังกัด',
	MODIFY `keys_page` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวระบุหน้าเพจ',
	MODIFY `keys_pagename` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหน้าเพจ',
	MODIFY `keys_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อหน้าเพจ',
	MODIFY `keys_key` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำค้นของหน้าเพจ',
	MODIFY `keys_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำอธิบายหน้าเพจ';

ALTER TABLE `wm_seo_spider`
	MODIFY `spider_group` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'กลุ่มของสไปเดอร์',
	MODIFY `spider_group_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อกลุ่มของสไปเดอร์',
	MODIFY `spider_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อของสไปเดอร์',
	MODIFY `spider_title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ตัวระบุของสไปเดอร์',
	MODIFY `spider_url` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'url ที่สไปเดอร์เข้าถึง',
	MODIFY `spider_ua` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ua ของสไปเดอร์',
	MODIFY `spider_time` int NULL COMMENT 'เวลาที่สไปเดอร์เข้าถึง';

ALTER TABLE `wm_seo_urls`
	MODIFY `urls_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่สังกัด',
	MODIFY `urls_page` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวระบุหน้าเพจ',
	MODIFY `urls_pagename` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อหน้าเพจ',
	MODIFY `urls_url1` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ที่อยู่แบบไดนามิก',
	MODIFY `urls_url2` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ที่อยู่สแตติก',
	MODIFY `urls_url3` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่ในโหมดปกติ',
	MODIFY `urls_url4` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่โหมดเข้ากันได้',
	MODIFY `urls_url5` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่โหมด PATHINFO',
	MODIFY `urls_url6` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่โหมด REWRITE';

ALTER TABLE `wm_site_product`
	MODIFY `product_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ใช้งานได้หรือไม่',
	MODIFY `product_title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเว็บไซต์',
	MODIFY `product_domain` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โดเมน',
	MODIFY `product_admin` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โฟลเดอร์หลังบ้าน',
	MODIFY `product_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีเข้าสู่ระบบหลังบ้าน',
	MODIFY `product_psw` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'รหัสผ่านเข้าสู่ระบบหลังบ้าน',
	MODIFY `product_order` int NOT NULL DEFAULT 99 COMMENT 'การเรียงลำดับที่แสดง, ค่าน้อยอยู่ก่อน',
	MODIFY `product_time` int NOT NULL COMMENT 'เวลาสร้าง';

ALTER TABLE `wm_site_site`
	MODIFY `site_status` tinyint(1) NULL DEFAULT 1 COMMENT 'ใช้งานได้หรือไม่',
	MODIFY `site_title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อเว็บไซต์',
	MODIFY `site_domain` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โดเมนเว็บไซต์',
	MODIFY `site_domain_type` tinyint(1) NULL DEFAULT 1 COMMENT 'ประเภทโดเมน 1=โดเมนเดี่ยว 2=ไวลด์การ์ด',
	MODIFY `site_type` tinyint(1) NULL DEFAULT 1 COMMENT 'ประเภทเว็บไซต์ 1 คือเครือข่ายเว็บไซต์ที่แยกข้อมูล 2 คือเครือข่ายเว็บไซต์ที่ใช้ข้อมูลร่วมกัน (เมื่อใช้ไวลด์การ์ด DNS ต้องเป็น 2)',
	MODIFY `site_template` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อโฟลเดอร์เทมเพลตที่ใช้',
	MODIFY `site_order` int NULL DEFAULT 99 COMMENT 'เรียงลำดับ',
	MODIFY `site_time` int NULL DEFAULT 0 COMMENT 'เวลาที่สร้าง';

ALTER TABLE `wm_system_apply`
	MODIFY `apply_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=รอพิจารณา 1=อนุมัติ 2=ปฏิเสธ',
	MODIFY `apply_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่ยื่นคำขอ',
	MODIFY `apply_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ประเภทที่สมัครในโมดูล',
	MODIFY `apply_uid` int NOT NULL COMMENT 'id ผู้ใช้ หรือ id ผู้แต่ง',
	MODIFY `apply_cid` int NOT NULL DEFAULT 0 COMMENT 'ID ของเนื้อหาที่สังกัด',
	MODIFY `apply_pid` int NULL DEFAULT 0 COMMENT 'id เนื้อหาแม่',
	MODIFY `apply_createtime` int NOT NULL COMMENT 'เวลายื่นคำขอ',
	MODIFY `apply_manager_id` int NOT NULL DEFAULT 0 COMMENT 'ผู้ดูแลระบบที่ดำเนินการ',
	MODIFY `apply_editor_id` int NULL DEFAULT 0 COMMENT 'การแก้ไขของการดำเนินการ',
	MODIFY `apply_updatetime` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่ดำเนินการ',
	MODIFY `apply_remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หมายเหตุการดำเนินการ',
	MODIFY `apply_option` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลพิเศษ';

ALTER TABLE `wm_system_competence`
	MODIFY `comp_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อสิทธิ์',
	MODIFY `comp_site` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'สิทธิ์จัดการเว็บไซต์ของบัญชี 0 คือทุกเว็บไซต์',
	MODIFY `comp_content` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาสิทธิ์';

ALTER TABLE `wm_system_domain`
	MODIFY `domain_title` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อโมดูล',
	MODIFY `domain_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อโมดูล',
	MODIFY `domain_domain` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โดเมนที่ผูกกับโมดูล',
	MODIFY `domain_index` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หน้าแรกโมดูล',
	MODIFY `domain_order` int NULL DEFAULT 9 COMMENT 'ลำดับโดเมน';

ALTER TABLE `wm_system_email`
	MODIFY `email_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะการใช้งานบริการอีเมล 0 คือปิดใช้งาน 1 คือเปิดใช้งาน',
	MODIFY `email_type` tinyint(1) NULL DEFAULT 1 COMMENT 'ประเภทอีเมล 1 คือ smtp 2 คือ sendmail,3 คือฟังก์ชัน php smtp',
	MODIFY `email_smtp` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เซิร์ฟเวอร์ smtp',
	MODIFY `email_port` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พอร์ต smtp',
	MODIFY `email_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'บัญชีเข้าสู่ระบบอีเมล',
	MODIFY `email_psw` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รหัสผ่านเข้าสู่ระบบอีเมล',
	MODIFY `email_send` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'บัญชีผู้ส่ง';

ALTER TABLE `wm_system_email_log`
	MODIFY `log_status` tinyint(1) NULL DEFAULT 0 COMMENT 'สถานะการใช้ 0=ยังไม่ใช้ 1=ใช้แล้ว 2=หมดอายุ',
	MODIFY `log_send` tinyint(1) NULL DEFAULT 0 COMMENT 'สถานะการส่ง 1=สำเร็จ 0=ล้มเหลว 2=รอส่ง',
	MODIFY `log_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทจดหมาย',
	MODIFY `log_sender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีผู้ส่ง',
	MODIFY `log_receive` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีผู้รับ',
	MODIFY `log_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้ออีเมล',
	MODIFY `log_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาอีเมล',
	MODIFY `log_remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'ส่งสำเร็จ' COMMENT 'ข้อมูลหมายเหตุ',
	MODIFY `log_time` int NULL DEFAULT 0 COMMENT 'เวลาสร้างงานส่งอีเมล',
	MODIFY `log_sendtime` int NULL DEFAULT 0 COMMENT 'เวลาส่งอีเมล',
	MODIFY `log_exptime` int NULL DEFAULT 0 COMMENT 'อายุการใช้งานของอีเมล';

ALTER TABLE `wm_system_email_temp`
	MODIFY `temp_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID ของเทมเพลต',
	MODIFY `temp_status` tinyint(1) NULL DEFAULT 1 COMMENT '0=ปิดใช้งาน 1=เปิดใช้งาน',
	MODIFY `temp_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อเทมเพลต',
	MODIFY `temp_desc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายเทมเพลต',
	MODIFY `temp_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อจดหมาย',
	MODIFY `temp_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาจดหมาย';

ALTER TABLE `wm_system_errlog`
	MODIFY `errlog_status` tinyint(1) NULL DEFAULT 0 COMMENT 'อัปโหลดหรือไม่, 0=ไม่มี',
	MODIFY `errlog_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'url ที่ผิดพลาด',
	MODIFY `errlog_state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รหัสข้อผิดพลาด SQLSTATE',
	MODIFY `errlog_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รหัสข้อผิดพลาดของไดรเวอร์',
	MODIFY `errlog_msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อความข้อผิดพลาดของไดรเวอร์',
	MODIFY `errlog_sql` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำสั่ง sql ที่ผิดพลาด',
	MODIFY `errlog_ip` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ip ที่เข้าชม',
	MODIFY `errlog_time` int NULL COMMENT 'เวลาที่ผิดพลาด';

ALTER TABLE `wm_system_menu`
	MODIFY `menu_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะการแสดงของเมนู 0 คือซ่อน 1 คือแสดง',
	MODIFY `menu_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หัวข้อสารบัญ',
	MODIFY `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อสารบัญ หากเป็นเมนูสิทธิ์ ค่านี้จะเป็นประเภท t',
	MODIFY `menu_pid` int NOT NULL DEFAULT 0 COMMENT 'id ของรายการแม่',
	MODIFY `menu_group` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=สารบัญปกติ 1=สารบัญกลุ่ม 2=เมนูตามสิทธิ์',
	MODIFY `menu_order` int NULL DEFAULT 10 COMMENT 'ลำดับการแสดง',
	MODIFY `menu_file` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อไฟล์ของสารบัญ',
	MODIFY `menu_url` tinyint(1) NULL DEFAULT 0 COMMENT 'เพิ่มค่า name เป็น type หรือไม่',
	MODIFY `menu_ico` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อไอคอนของเมนู';

ALTER TABLE `wm_system_menu_default`
	MODIFY `default_controller` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อคอนโทรลเลอร์',
	MODIFY `default_mid` int NOT NULL COMMENT 'id ผู้ดูแลระบบ';

ALTER TABLE `wm_system_menu_quick`
	MODIFY `quick_menu_id` int NULL COMMENT 'id ของเมนู',
	MODIFY `quick_order` int NULL DEFAULT 9 COMMENT 'ลำดับการแสดงเมนูลัด',
	MODIFY `quick_manager_id` int NULL COMMENT 'id ของผู้ดูแลระบบ';

ALTER TABLE `wm_system_msg_log`
	MODIFY `log_status` tinyint(1) NULL DEFAULT 0 COMMENT 'สถานะการใช้ 0=ยังไม่ใช้ 1=ใช้แล้ว 2=หมดอายุ',
	MODIFY `log_channel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ช่องทางข้อความ',
	MODIFY `log_channel_id` int NULL COMMENT 'ID บันทึกข้อความ',
	MODIFY `log_receive` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ผู้รับข้อความ',
	MODIFY `log_params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหาข้อความ',
	MODIFY `log_time` int NULL DEFAULT 0 COMMENT 'เวลาส่ง',
	MODIFY `log_exptime` int NULL DEFAULT 0 COMMENT 'เวลาหมดอายุ';

ALTER TABLE `wm_system_msg_temp`
	MODIFY `temp_id` int NOT NULL auto_increment COMMENT 'ID ของเทมเพลต',
	MODIFY `temp_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเทมเพลต',
	MODIFY `temp_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่สังกัด',
	MODIFY `temp_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวระบุของเทมเพลต',
	MODIFY `temp_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาจดหมาย';

ALTER TABLE `wm_system_retrieval`
	MODIFY `retrieval_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะการใช้งาน 0=ปิดใช้งาน 1=ใช้งาน',
	MODIFY `retrieval_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่สังกัด',
	MODIFY `retrieval_type_id` int NOT NULL DEFAULT 0 COMMENT 'ID ประเภทเงื่อนไขการค้นหา',
	MODIFY `retrieval_title` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเงื่อนไขการค้นหา',
	MODIFY `retrieval_field` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ฟิลด์ของเงื่อนไขการค้นหา',
	MODIFY `retrieval_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ประเภทการค้นหา, -1=ย้อนกลับ, 0=ตามลำดับ, 1=เท่ากับ, 2=น้อยกว่า, 3=มากกว่า, 4=ช่วง, 5=อักษรแรก, 6=คล้ายกัน, 7=ขึ้นต้นด้วยตัวเลข',
	MODIFY `retrieval_value` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ค่าที่ค้นหา',
	MODIFY `retrieval_order` int NOT NULL COMMENT 'ลำดับการแสดง';

ALTER TABLE `wm_system_retrieval_type`
	MODIFY `type_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะหมวดหมู่ 0=ซ่อน 1=แสดง',
	MODIFY `type_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่หมวดหมู่อยู่',
	MODIFY `type_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=เงื่อนไข 2=การเรียงลำดับ',
	MODIFY `type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_par` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อพารามิเตอร์ของหมวดหมู่',
	MODIFY `type_order` int NOT NULL DEFAULT 99 COMMENT 'ลำดับหมวดหมู่';

ALTER TABLE `wm_system_sms`
	MODIFY `sms_status` tinyint(1) NULL DEFAULT 1 COMMENT 'สถานะ:1=ใช้งาน,0=ปิดใช้งาน',
	MODIFY `sms_api_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'อินเทอร์เฟซ SMS',
	MODIFY `sms_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ประเภทเทมเพลต',
	MODIFY `sms_sign` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'ลายเซ็นเทมเพลตของบุคคลที่สาม',
	MODIFY `sms_tempcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'โค้ดเทมเพลตของบุคคลที่สาม',
	MODIFY `sms_params` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'พารามิเตอร์แทนที่',
	MODIFY `sms_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาสร้าง';

ALTER TABLE `wm_system_sms_log`
	MODIFY `log_status` tinyint(1) NULL DEFAULT 0 COMMENT 'สถานะการใช้ 0=ยังไม่ใช้ 1=ใช้แล้ว 2=หมดอายุ',
	MODIFY `log_send` tinyint(1) NULL DEFAULT 1 COMMENT 'สถานะการส่ง 1=สำเร็จ 0=ล้มเหลว',
	MODIFY `log_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ประเภท SMS',
	MODIFY `log_remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'ข้อความล้มเหลว',
	MODIFY `log_sender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'ผู้ส่ง',
	MODIFY `log_receive` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ผู้รับ',
	MODIFY `log_content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT 'เนื้อหาข้อความ',
	MODIFY `log_time` int NULL COMMENT 'เวลาส่ง',
	MODIFY `log_exptime` int NULL COMMENT 'เวลาหมดอายุ';

ALTER TABLE `wm_system_tags`
	MODIFY `tags_type_id` int NOT NULL DEFAULT 1 COMMENT 'หมวดหมู่ที่สังกัด',
	MODIFY `tags_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่แท็กสังกัด',
	MODIFY `tags_author_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำให้จัดแสดงหรือไม่',
	MODIFY `tags_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อแท็ก',
	MODIFY `tags_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินแท็ก',
	MODIFY `tags_data` int NOT NULL DEFAULT 1 COMMENT 'จำนวนข้อมูลของแท็ก',
	MODIFY `tags_search` int NULL DEFAULT 0 COMMENT 'จำนวนครั้งที่ค้นหาแท็ก',
	MODIFY `tags_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่สร้างแท็ก';

ALTER TABLE `wm_system_tags_type`
	MODIFY `type_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลหมวดหมู่',
	MODIFY `type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_desc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหมวดหมู่',
	MODIFY `type_order` int NOT NULL DEFAULT 9 COMMENT 'ลำดับหมวดหมู่ ยิ่งน้อยยิ่งอยู่หน้า';

ALTER TABLE `wm_system_templates`
	MODIFY `temp_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูลที่เทมเพลตสังกัด',
	MODIFY `temp_type` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทของเทมเพลต',
	MODIFY `temp_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อเทมเพลต',
	MODIFY `temp_temp4` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เทมเพลตเวอร์ชันคอมพิวเตอร์',
	MODIFY `temp_temp3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'หน้าจอสัมผัส',
	MODIFY `temp_address` tinyint(1) NULL DEFAULT 0 COMMENT 'พาธที่เทมเพลตอยู่ 0=ปัจจุบัน, 1=คำนวณจากไดเรกทอรีราก.';

ALTER TABLE `wm_templates_templates`
	MODIFY `templates_path` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โฟลเดอร์เทมเพลต',
	MODIFY `templates_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเทมเพลต',
	MODIFY `templates_appid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'appid เทมเพลต';

ALTER TABLE `wm_upload`
	MODIFY `upload_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่สังกัด',
	MODIFY `upload_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทที่โมดูลดำเนินการ',
	MODIFY `upload_ext` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภทไฟล์แนบ',
	MODIFY `upload_mid` int NOT NULL DEFAULT 0 COMMENT 'ID ของเนื้อหาหลักที่สังกัด เช่น หัวข้อของความคิดเห็น',
	MODIFY `upload_cid` int NOT NULL DEFAULT 0 COMMENT 'ID ของเนื้อหาที่สังกัด',
	MODIFY `user_id` int NULL DEFAULT 0 COMMENT 'id ของผู้ใช้อัปโหลด',
	MODIFY `upload_alt` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบาย',
	MODIFY `upload_simg` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พาธรูปย่อ',
	MODIFY `upload_img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พาธไฟล์',
	MODIFY `upload_size` int NOT NULL DEFAULT 0 COMMENT 'ขนาดไฟล์',
	MODIFY `upload_width` int NULL DEFAULT 0 COMMENT 'ความกว้างรูปภาพ',
	MODIFY `upload_height` int NULL DEFAULT 0 COMMENT 'ความสูงรูปภาพ',
	MODIFY `upload_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาอัปโหลด';

ALTER TABLE `wm_user_apilogin`
	MODIFY `api_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ประเภทการเข้าสู่ระบบของบุคคลที่สาม',
	MODIFY `api_openid` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID การเข้าสู่ระบบของบุคคลที่สามที่ไม่ซ้ำกัน',
	MODIFY `api_unionid` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ID เชื่อมโยงการเข้าสู่ระบบของบุคคลที่สาม';

ALTER TABLE `wm_user_card`
	MODIFY `card_type` tinyint(1) NULL DEFAULT 1 COMMENT 'ประเภทบัตร 1=บัตรเติมเงิน',
	MODIFY `card_use` tinyint(1) NULL DEFAULT 0 COMMENT 'ใช้งานแล้วหรือไม่',
	MODIFY `card_channel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ช่องทางเผยแพร่',
	MODIFY `card_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเลขบัตร',
	MODIFY `card_money` decimal(10,2) NULL DEFAULT 0.00 COMMENT 'ยอดเงินในบัตร',
	MODIFY `card_give` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'จำนวนโบนัสเมื่อใช้บัตรเติมเงิน',
	MODIFY `card_addtime` int NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม',
	MODIFY `card_user_id` int NOT NULL DEFAULT 0 COMMENT 'ผู้ใช้ที่รับ',
	MODIFY `card_get_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่รับ';

ALTER TABLE `wm_user_card_log`
	MODIFY `log_card_id` int NOT NULL COMMENT 'id หมายเลขบัตร',
	MODIFY `log_user_id` int NOT NULL COMMENT 'id ที่ใช้',
	MODIFY `log_use_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่ใช้',
	MODIFY `log_touser_id` int NOT NULL DEFAULT 0 COMMENT 'ใช้กับใคร';

ALTER TABLE `wm_user_coll`
	MODIFY `coll_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'โมดูลที่ดำเนินการ',
	MODIFY `coll_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ประเภทการดำเนินการ, coll=รายการโปรด, rec=แนะนำ, shelf=ชั้นหนังสือ, sub=สมัครอัตโนมัติ',
	MODIFY `user_id` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `coll_cid` int NOT NULL DEFAULT 0 COMMENT 'ID เนื้อหาที่ดำเนินการ',
	MODIFY `coll_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาของการดำเนินการ';

ALTER TABLE `wm_user_finance`
	MODIFY `finance_user_id` int NULL COMMENT 'id ผู้ใช้',
	MODIFY `finance_realname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อ-นามสกุลจริง',
	MODIFY `finance_cardid` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเลขบัตรประชาชน',
	MODIFY `finance_address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่บ้าน',
	MODIFY `finance_zipcode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รหัสไปรษณีย์',
	MODIFY `finance_bank` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ธนาคารที่เปิดบัญชี',
	MODIFY `finance_bankaddress` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่ธนาคารที่เปิดบัญชี',
	MODIFY `finance_bankcard` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเลขบัญชีของธนาคารที่เปิดบัญชี',
	MODIFY `finance_bankmaster` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อผู้ถือบัตร',
	MODIFY `finance_alipay` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'บัญชี Alipay';

ALTER TABLE `wm_user_finance_log`
	MODIFY `log_status` tinyint(1) NULL DEFAULT 1 COMMENT '1=รายรับ 2=รายจ่าย',
	MODIFY `log_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูล',
	MODIFY `log_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ประเภท',
	MODIFY `log_user_id` int NOT NULL DEFAULT 0 COMMENT 'ID ผู้ใช้ที่ใช้จ่ายหรือรับรายได้',
	MODIFY `log_tuser_id` int NOT NULL DEFAULT 0 COMMENT 'ID ผู้ใช้ที่ถูกใช้หรือผู้ที่มอบให้',
	MODIFY `log_cid` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id เนื้อหาที่ซื้อ หรือ id ต้นทาง',
	MODIFY `log_gold1_before` decimal(10,3) NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ 1 ก่อนทำรายการ',
	MODIFY `log_gold1` decimal(10,3) NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ1',
	MODIFY `log_gold1_after` decimal(10,3) NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ 1 หลังทำรายการ',
	MODIFY `log_gold2_before` decimal(10,3) NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ 2 ก่อนทำรายการ',
	MODIFY `log_gold2` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ2',
	MODIFY `log_gold2_after` decimal(10,3) NULL DEFAULT 0.000 COMMENT 'จำนวนเหรียญ 2 หลังทำรายการ',
	MODIFY `log_remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมายเหตุ',
	MODIFY `log_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาของการซื้อ';

ALTER TABLE `wm_user_head`
	MODIFY `head_src` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ที่อยู่รูปโปรไฟล์',
	MODIFY `head_order` int NOT NULL DEFAULT 50 COMMENT 'ลำดับรูปโปรไฟล์';

ALTER TABLE `wm_user_level`
	MODIFY `level_start` int NOT NULL COMMENT 'ประสบการณ์เริ่มต้นของระดับ',
	MODIFY `level_end` int NOT NULL COMMENT 'ประสบการณ์สิ้นสุดของระดับ',
	MODIFY `level_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อระดับ',
	MODIFY `level_order` int NULL COMMENT 'การเรียงลำดับระดับ',
	MODIFY `level_coll` int NOT NULL DEFAULT 0 COMMENT 'จำนวนรายการโปรดของระดับ',
	MODIFY `level_shelf` int NOT NULL DEFAULT 0 COMMENT 'จำนวนชั้นหนังสือรวมของระดับ',
	MODIFY `level_rec` int NOT NULL DEFAULT 0 COMMENT 'โควตาโหวตแนะนำที่ให้เมื่อเข้าสู่ระบบทุกวัน',
	MODIFY `level_month` int NOT NULL DEFAULT 0 COMMENT 'โหวตรายเดือนที่ให้เมื่อเข้าสู่ระบบทุกวัน';

ALTER TABLE `wm_user_login`
	MODIFY `user_id` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `login_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เข้าสู่ระบบ',
	MODIFY `login_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=บัญชี',
	MODIFY `login_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=เข้าสู่ระบบล้มเหลว 1=เข้าสู่ระบบสำเร็จ 2=รหัสผ่านผิด',
	MODIFY `login_remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'เข้าสู่ระบบสำเร็จ' COMMENT 'รายละเอียดหมายเหตุ',
	MODIFY `login_ip` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'IP ที่เข้าสู่ระบบ',
	MODIFY `login_ua` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ua ของเบราว์เซอร์ที่เข้าสู่ระบบ',
	MODIFY `login_browser` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เบราว์เซอร์';

ALTER TABLE `wm_user_msg`
	MODIFY `msg_fuid` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้ที่ส่ง',
	MODIFY `msg_tuid` int NOT NULL COMMENT 'ID ผู้ใช้ที่รับ',
	MODIFY `msg_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=ยังไม่ได้อ่าน 1=อ่านแล้ว',
	MODIFY `msg_content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหาข้อความ',
	MODIFY `msg_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาส่ง';

ALTER TABLE `wm_user_punish`
	MODIFY `punish_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=ใช้ไม่ได้ 1=ปกติ',
	MODIFY `punish_uid` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `punish_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'login=ห้ามเข้าสู่ระบบ talk=ห้ามแสดงความคิดเห็น',
	MODIFY `punish_remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุ',
	MODIFY `punish_starttime` int NOT NULL DEFAULT 0 COMMENT 'เวลาเริ่มลงโทษ',
	MODIFY `punish_endtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาสิ้นสุดการลงโทษ',
	MODIFY `punish_createtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาสร้างการลงโทษ';

ALTER TABLE `wm_user_read`
	MODIFY `read_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูลการอ่าน',
	MODIFY `read_cid` int NOT NULL DEFAULT 0 COMMENT 'id เนื้อหา',
	MODIFY `read_nid` int NULL DEFAULT 0 COMMENT 'id เนื้อหาแม่',
	MODIFY `read_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อ',
	MODIFY `read_uid` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `read_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาอ่านครั้งแรก',
	MODIFY `read_lasttime` int NOT NULL DEFAULT 0 COMMENT 'เวลาอ่านครั้งล่าสุด';

ALTER TABLE `wm_user_read_log`
	MODIFY `read_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูลการอ่าน',
	MODIFY `read_cid` int NOT NULL DEFAULT 0 COMMENT 'id เนื้อหา',
	MODIFY `read_nid` int NULL DEFAULT 0 COMMENT 'id เนื้อหาแม่',
	MODIFY `read_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อ',
	MODIFY `read_uid` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `read_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาอ่าน';

ALTER TABLE `wm_user_sign`
	MODIFY `user_id` int NOT NULL DEFAULT 0 COMMENT 'ผู้ใช้ที่เช็คอิน',
	MODIFY `sign_sum` int NOT NULL DEFAULT 0 COMMENT 'จำนวนวันเช็คอินทั้งหมด',
	MODIFY `sign_con` int NOT NULL DEFAULT 0 COMMENT 'จำนวนวันเช็คอินต่อเนื่อง',
	MODIFY `sign_prerank` int NOT NULL DEFAULT 0 COMMENT 'อันดับเช็คอินครั้งล่าสุด',
	MODIFY `sign_pretime` int NOT NULL DEFAULT 0 COMMENT 'เวลาเช็คอินครั้งล่าสุด',
	MODIFY `sign_rank` int NOT NULL DEFAULT 0 COMMENT 'อันดับเช็คอินครั้งนี้',
	MODIFY `sign_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาเช็คอินครั้งนี้';

ALTER TABLE `wm_user_sign_log`
	MODIFY `log_user_id` int NOT NULL COMMENT 'ผู้ใช้ที่เช็คอิน',
	MODIFY `log_gold1` int NOT NULL DEFAULT 0 COMMENT 'เหรียญที่แจกให้1',
	MODIFY `log_gold2` int NOT NULL DEFAULT 0 COMMENT 'เหรียญที่แจกให้2',
	MODIFY `log_exp` int NOT NULL DEFAULT 0 COMMENT 'ประสบการณ์ที่แจกให้',
	MODIFY `log_rec` int NOT NULL DEFAULT 0 COMMENT 'โหวตแนะนำที่แจกให้',
	MODIFY `log_month` int NOT NULL DEFAULT 0 COMMENT 'โหวตรายเดือนที่แจกให้',
	MODIFY `log_rank` int NOT NULL COMMENT 'อันดับการเช็คอิน',
	MODIFY `log_date` date NOT NULL COMMENT 'วันที่เช็คอิน',
	MODIFY `log_time` int NOT NULL COMMENT 'เวลาเช็คอิน';

ALTER TABLE `wm_user_ticket`
	MODIFY `ticket_user_id` int NOT NULL COMMENT 'id ผู้ใช้',
	MODIFY `ticket_module` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูลที่สังกัด',
	MODIFY `ticket_rec` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโหวตแนะนำของผู้ใช้',
	MODIFY `ticket_month` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโหวตรายเดือนของผู้ใช้';

ALTER TABLE `wm_user_ticket_log`
	MODIFY `log_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=ได้รับ 2=ใช้ไป',
	MODIFY `log_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'โมดูล, all=ทุกโมดูล',
	MODIFY `log_cid` int NULL DEFAULT 0 COMMENT 'id เนื้อหา,',
	MODIFY `log_user_id` int NOT NULL DEFAULT 0 COMMENT 'id ผู้ใช้',
	MODIFY `log_rec` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโหวตแนะนำ',
	MODIFY `log_month` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโหวตรายเดือน',
	MODIFY `log_remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แหล่งที่มา/คำอธิบายการใช้งาน',
	MODIFY `log_time` int NOT NULL COMMENT 'แหล่งที่มา/เวลาที่ใช้';

ALTER TABLE `wm_user_user`
	MODIFY `user_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'default' COMMENT 'แหล่งที่มาของการสมัครบัญชี',
	MODIFY `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชี/ID บุคคลที่สาม',
	MODIFY `user_salt` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'ซอล์ตรหัสผ่าน（เลิกใช้หลัง bcrypt เก็บไว้รองรับแฮชเก่า）',
	MODIFY `user_psw` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'รหัสผ่าน',
	MODIFY `user_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=ปกติ 0=รอตรวจสอบ',
	MODIFY `user_display` tinyint(1) NULL DEFAULT 1 COMMENT '0=แบนถาวร 1=ปกติ 2=แบนตามกำหนดเวลา',
	MODIFY `user_nickname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเล่น',
	MODIFY `user_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'อีเมล',
	MODIFY `user_emailtrue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=ยืนยันแล้ว 0=ยังไม่ยืนยัน',
	MODIFY `user_qq` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเลข QQ ของผู้ใช้',
	MODIFY `user_tel` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเลขมือถือของผู้ใช้',
	MODIFY `user_teltrue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=ยืนยันแล้ว 0=ยังไม่ยืนยัน',
	MODIFY `user_sex` int NOT NULL DEFAULT 1 COMMENT 'เพศ',
	MODIFY `user_birthday` date NOT NULL DEFAULT '1991-10-24' COMMENT 'วันเดือนปีเกิดของผู้ใช้',
	MODIFY `user_head` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'รูปโปรไฟล์',
	MODIFY `user_sign` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ลายเซ็น',
	MODIFY `user_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'ยอดคงเหลือในบัญชี',
	MODIFY `user_money_freeze` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'ยอดคงเหลือที่ถูกอายัดในบัญชี',
	MODIFY `user_gold1` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'เหรียญ1',
	MODIFY `user_gold2` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'เหรียญ2',
	MODIFY `user_ischarge` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'เคยเติมเงินครั้งแรกแล้วหรือไม่',
	MODIFY `user_exp` int NOT NULL DEFAULT 0 COMMENT 'ประสบการณ์',
	MODIFY `user_browse` int NOT NULL DEFAULT 0 COMMENT 'ยอดเข้าชมพื้นที่',
	MODIFY `user_topic` int NOT NULL DEFAULT 0 COMMENT 'จำนวนหัวข้อ',
	MODIFY `user_retopic` int NOT NULL DEFAULT 0 COMMENT 'จำนวนโพสต์ตอบ',
	MODIFY `user_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนความคิดเห็น',
	MODIFY `user_logintime` int NOT NULL DEFAULT 0 COMMENT 'เวลาเข้าสู่ระบบครั้งล่าสุด',
	MODIFY `user_regtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาสมัคร',
	MODIFY `user_regip` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0.0.0' COMMENT 'IP ที่สมัคร',
	MODIFY `user_displaytime` int NOT NULL DEFAULT 0 COMMENT 'หากเป็นช่วงเวลา จะเป็นช่วงเวลาที่ถูกแบน';

ALTER TABLE `wm_user_vist`
	MODIFY `vist_fuid` int NOT NULL DEFAULT 0 COMMENT 'id ผู้เยี่ยมชม',
	MODIFY `vist_uid` int NOT NULL DEFAULT 0 COMMENT 'id เจ้าของ',
	MODIFY `vist_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เข้าชม';

ALTER TABLE `wm_weixin_account`
	MODIFY `account_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ค่าบูลีน, ใช้งานหรือไม่',
	MODIFY `account_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อบัญชีทางการ',
	MODIFY `account_account` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีเข้าสู่ระบบของบัญชีทางการ',
	MODIFY `account_gid` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'id ตั้งต้นของบัญชีทางการ',
	MODIFY `account_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=บัญชีสมัครสมาชิก 2=บัญชีบริการ',
	MODIFY `account_auth` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ค่าบูลีน, ยืนยันตัวตนหรือไม่',
	MODIFY `account_appid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'appid ของบัญชีทางการ',
	MODIFY `account_secret` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'secret ของบัญชีทางการ',
	MODIFY `account_access` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'เชื่อมต่อแล้วหรือไม่',
	MODIFY `account_main` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'เป็นบัญชีทางการหลักหรือไม่',
	MODIFY `account_follow` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ต้องติดตามก่อนเข้าชมหรือไม่',
	MODIFY `account_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'token ของบัญชีทางการ',
	MODIFY `account_aeskey` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'key เข้ารหัสข้อความของบัญชีทางการ',
	MODIFY `account_welcome` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อความต้อนรับเมื่อติดตามบัญชีทางการ',
	MODIFY `account_welcome_temp` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เทมเพลตข้อความต้อนรับเมื่อติดตามบัญชีทางการ',
	MODIFY `account_default` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำตอบเมื่อไม่พบข้อความที่ตรงกัน',
	MODIFY `account_default_temp` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เทมเพลตคำตอบเมื่อไม่พบข้อความที่ตรงกัน',
	MODIFY `account_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_weixin_autoreply`
	MODIFY `autoreply_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะการใช้งาน เป็นค่าบูลีน',
	MODIFY `autoreply_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=ไม่ตั้งค่า 1=ตอบกลับผู้ติดตาม 2=ตอบกลับอัตโนมัติ',
	MODIFY `autoreply_account_id` int NOT NULL DEFAULT 0 COMMENT 'บัญชีทางการที่ใช้',
	MODIFY `autoreply_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อการตอบกลับอัตโนมัติ',
	MODIFY `autoreply_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'คำค้นที่การตอบกลับอัตโนมัติรับไว้',
	MODIFY `autoreply_match` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=ตรงทั้งหมด 2=ค้นหาคลุมเครือทั้งข้อความ 3=ตรงต้นข้อความ 4=ตรงท้ายข้อความ',
	MODIFY `autoreply_content` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาตอบกลับ',
	MODIFY `autoreply_temp` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เทมเพลตเนื้อหาตอบกลับ',
	MODIFY `autoreply_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'text' COMMENT 'text=ข้อความ image=รูปภาพ',
	MODIFY `autoreply_media_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'id ของสื่อ',
	MODIFY `autoreply_addtime` int NOT NULL COMMENT 'เวลาที่เพิ่ม';

ALTER TABLE `wm_weixin_fans`
	MODIFY `fans_account_id` int NOT NULL COMMENT 'บัญชีทางการที่สังกัด',
	MODIFY `fans_openid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวระบุของผู้ใช้ ซึ่งไม่ซ้ำกันภายในบัญชีทางการปัจจุบัน',
	MODIFY `fans_unionid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ฟิลด์นี้มีเฉพาะเมื่อผูกบัญชีทางการกับบัญชี WeChat Open Platform แล้ว',
	MODIFY `fans_subscribe` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะการติดตามบัญชีทางการของผู้ใช้ ค่า 0 หมายถึงผู้ใช้ยังไม่ได้ติดตามบัญชีทางการนี้ จึงดึงข้อมูลอื่นไม่ได้',
	MODIFY `fans_nickname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อเล่นของผู้ใช้',
	MODIFY `fans_headimgurl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'รูปโปรไฟล์ของผู้ใช้',
	MODIFY `fans_sex` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'เพศของผู้ใช้ ค่า 1 คือชาย ค่า 2 คือหญิง ค่า 0 คือไม่ทราบ',
	MODIFY `fans_country` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '\tประเทศของผู้ใช้',
	MODIFY `fans_province` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'จังหวัดของผู้ใช้',
	MODIFY `fans_city` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เมืองของผู้ใช้',
	MODIFY `fans_remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หมายเหตุแฟนที่ผู้ดูแลบัญชีทางการตั้งไว้ในหน้าจัดการผู้ใช้ WeChat',
	MODIFY `fans_subscribe_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่ผู้ใช้กดติดตาม เป็น timestamp หากผู้ใช้ติดตามหลายครั้ง ให้ใช้เวลาติดตามครั้งล่าสุด',
	MODIFY `fans_unsubtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่ผู้ใช้เลิกติดตาม',
	MODIFY `fans_json` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ข้อมูลผู้ใช้แบบ json',
	MODIFY `fans_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาบันทึกข้อมูลเข้าฐานข้อมูล';

ALTER TABLE `wm_weixin_media`
	MODIFY `media_account_id` int NOT NULL DEFAULT 0 COMMENT 'id ของบัญชีทางการ',
	MODIFY `media_filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อสื่อ',
	MODIFY `media_filepath` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'พาธสื่อ',
	MODIFY `media_media_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID สื่อของ WeChat',
	MODIFY `media_width` int NOT NULL DEFAULT 0 COMMENT 'ความกว้างสื่อ',
	MODIFY `media_height` int NOT NULL DEFAULT 0 COMMENT 'ความสูงสื่อ',
	MODIFY `media_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'image' COMMENT 'ประเภทสื่อ รูปภาพ image, เสียง voice, วิดีโอ video และรูปย่อ thumb',
	MODIFY `media_islong` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'เป็นสื่อถาวรหรือไม่, ค่าบูลีน',
	MODIFY `media_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาอัปโหลด';

ALTER TABLE `wm_weixin_menu`
	MODIFY `menu_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ค่าบูลีน, สถานะการใช้งาน',
	MODIFY `menu_account_id` int NOT NULL COMMENT 'ID บัญชีทางการที่สังกัด',
	MODIFY `menu_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมายเหตุของเมนู',
	MODIFY `menu_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ข้อมูล json ของเมนู',
	MODIFY `menu_addtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม',
	MODIFY `menu_updatetime` int NOT NULL DEFAULT 0 COMMENT 'เวลาอัปเดตล่าสุด',
	MODIFY `menu_pushtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาส่งล่าสุด';

ALTER TABLE `wm_weixin_msg`
	MODIFY `msg_account_id` int NOT NULL DEFAULT 0 COMMENT 'ID ของบัญชีทางการที่สังกัด',
	MODIFY `msg_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'openid ผู้ใช้ WeChat',
	MODIFY `msg_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'text' COMMENT 'ประเภทข้อความ',
	MODIFY `msg_content` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหาข้อความ',
	MODIFY `msg_attr` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหาข้อความเพิ่มเติม',
	MODIFY `msg_picurl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่รูปภาพของข้อความรูปภาพ',
	MODIFY `msg_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'url ของข้อความไฮเปอร์ลิงก์',
	MODIFY `msg_media_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ID สื่อทรัพยากรชั่วคราวของ WeChat',
	MODIFY `msg_recognition` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ผลลัพธ์การรู้จำข้อความเสียง',
	MODIFY `msg_get` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาข้อความจากผู้ใช้ที่เว็บไซต์ได้รับ',
	MODIFY `msg_send` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหาข้อความตอบกลับของเว็บไซต์',
	MODIFY `msg_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่ผู้ใช้ส่งข้อความ',
	MODIFY `msg_sendtime` int NOT NULL DEFAULT 0 COMMENT 'เวลาตอบกลับข้อความของเว็บไซต์';

ALTER TABLE `wm_zt_node`
	MODIFY `node_zt_id` int NOT NULL DEFAULT 0 COMMENT 'ID ของหัวข้อพิเศษที่สังกัด',
	MODIFY `node_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อโหนด',
	MODIFY `node_pinyin` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ตัวระบุหัวข้อพิเศษ',
	MODIFY `node_type` tinyint(1) NULL DEFAULT 2 COMMENT '1=รูปภาพ 2=แสดงเนื้อหาปกติ 3=แท็กวนซ้ำ',
	MODIFY `node_img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ที่อยู่รูปภาพ',
	MODIFY `node_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'เนื้อหา',
	MODIFY `node_label` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แท็กโหนด',
	MODIFY `node_time` int NULL COMMENT 'เวลาสร้างโหนด';

ALTER TABLE `wm_zt_type`
	MODIFY `type_topid` int NOT NULL DEFAULT 0 COMMENT 'id ระดับเหนือขึ้นไป',
	MODIFY `type_pid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
	MODIFY `type_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'แนะนำหมวดหมู่หรือไม่',
	MODIFY `type_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหมวดหมู่',
	MODIFY `type_cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ชื่อย่อของประเภท',
	MODIFY `type_pinyin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินของประเภท',
	MODIFY `type_order` int NOT NULL COMMENT 'เรียงลำดับ',
	MODIFY `type_ico` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ไอคอนหมวดหมู่',
	MODIFY `type_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'ข้อมูลหมวดหมู่',
	MODIFY `type_tempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าหมวดหมู่',
	MODIFY `type_ctempid` int NOT NULL DEFAULT 0 COMMENT 'เทมเพลตหน้าเนื้อหา',
	MODIFY `type_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'หัวข้อหน้าเพจ',
	MODIFY `type_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำค้นของหน้าเพจ',
	MODIFY `type_desc` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'คำอธิบายหน้าเพจ';

ALTER TABLE `wm_zt_zt`
	MODIFY `type_id` int NOT NULL DEFAULT 0 COMMENT 'id หมวดหมู่หัวข้อพิเศษ',
	MODIFY `zt_status` tinyint(1) NULL DEFAULT 1 COMMENT 'สถานะการตรวจสอบ',
	MODIFY `zt_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ชื่อหัวข้อพิเศษ',
	MODIFY `zt_pinyin` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'พินอินหัวข้อพิเศษ',
	MODIFY `zt_info` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'บทนำ',
	MODIFY `zt_banner` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'แบนเนอร์หัวข้อพิเศษ',
	MODIFY `zt_simg` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'รูปภาพหัวข้อพิเศษ',
	MODIFY `zt_read` int NULL DEFAULT 0 COMMENT 'ยอดอ่าน',
	MODIFY `zt_replay` int NOT NULL DEFAULT 0 COMMENT 'จำนวนความคิดเห็น',
	MODIFY `zt_content` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'เนื้อหา',
	MODIFY `zt_time` int NOT NULL DEFAULT 0 COMMENT 'เวลาที่เพิ่ม';
