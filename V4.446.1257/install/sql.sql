DROP TABLE IF EXISTS `wm_about_about`;
CREATE TABLE `wm_about_about` (
  `about_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL DEFAULT '1' COMMENT 'id หมวดหมู่ข้อมูล',
  `about_name` varchar(60) NOT NULL COMMENT 'หัวข้อบทความ',
  `about_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของข้อมูล',
  `about_content` text COMMENT 'เนื้อหา',
  `about_order` int DEFAULT '0' COMMENT 'ลำดับของข้อมูล',
  `about_title` varchar(120) DEFAULT NULL COMMENT 'หัวข้อเนื้อหาข้อมูล',
  `about_key` varchar(120) DEFAULT NULL COMMENT 'คำค้นหาเนื้อหาข้อมูล',
  `about_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายเนื้อหาข้อมูล',
  `about_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที',
  `about_ctempid` int DEFAULT '0' COMMENT 'เทมเพลตที่ใช้',
  PRIMARY KEY (`about_id`),
  KEY `tid_index` (`type_id`,`about_time`),
  KEY `ctempid_index` (`about_ctempid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเนื้อหาข้อมูล';
DROP TABLE IF EXISTS `wm_about_type`;
CREATE TABLE `wm_about_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_topid` int DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(50) DEFAULT NULL COMMENT 'id ของรายการแม่',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อของประเภท',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL DEFAULT '0' COMMENT 'เรียงลำดับ',
  `type_info` varchar(200) DEFAULT NULL COMMENT 'คำอธิบายหมวดหมู่',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'id เทมเพลตหน้ารายการหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'id เทมเพลตหน้าเนื้อหาหมวดหมู่',
  `type_title` varchar(120) DEFAULT NULL COMMENT 'หัวข้อหน้าหมวดหมู่',
  `type_key` varchar(120) DEFAULT NULL COMMENT 'คำค้นหาหน้าหมวดหมู่',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายหน้าหมวดหมู่',
  PRIMARY KEY (`type_id`),
  KEY `topid_index` (`type_topid`),
  KEY `pid_index` (`type_pid`),
  KEY `order_index` (`type_order`),
  KEY `tempid_index` (`type_tempid`),
  KEY `ctempid_index` (`type_ctempid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่ข้อมูล';
DROP TABLE IF EXISTS `wm_ad_ad`;
CREATE TABLE `wm_ad_ad` (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `ad_type_id` int DEFAULT '0' COMMENT 'ID หมวดหมู่โฆษณา',
  `ad_pt` tinyint(1) DEFAULT '4' COMMENT 'โฆษณาอยู่บนแพลตฟอร์มใด, 1=แบบย่อ, 2=แบบสี, 3=แบบสัมผัส, 4=คอมพิวเตอร์',
  `ad_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=ไม่แสดง 1=ปกติ',
  `ad_type` int NOT NULL DEFAULT '1' COMMENT '1=ข้อความ 2=ข้อความพร้อมรูป 3=js',
  `ad_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อตำแหน่งโฆษณา',
  `ad_title` varchar(100) DEFAULT NULL COMMENT 'หัวข้อโฆษณา',
  `ad_url` varchar(200) DEFAULT NULL COMMENT 'ลิงก์ของโฆษณา',
  `ad_img` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่โฆษณารูปภาพ',
  `ad_img_width` int DEFAULT '0' COMMENT 'ความกว้างของรูปภาพ',
  `ad_img_height` int DEFAULT '0' COMMENT 'ความสูงของรูปภาพ',
  `ad_price` decimal(4,2) DEFAULT '0.00' COMMENT 'ราคาต่อหน่วยของโฆษณา',
  `ad_js` varchar(2000) DEFAULT NULL COMMENT 'โค้ดโฆษณา js',
  `ad_time_type` tinyint DEFAULT NULL COMMENT '0=ไม่จำกัดเวลา 1=ลงโฆษณาแบบมีกำหนดเวลา',
  `ad_start_time` int DEFAULT '0' COMMENT 'เวลาเริ่มโฆษณา',
  `ad_end_time` int DEFAULT '0' COMMENT 'เวลาสิ้นสุดโฆษณา',
  `ad_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่มโฆษณา',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางโฆษณา';
DROP TABLE IF EXISTS `wm_ad_type`;
CREATE TABLE `wm_ad_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่โฆษณา',
  `type_info` varchar(1000) DEFAULT NULL COMMENT 'คำอธิบายหมวดหมู่โฆษณา',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่โฆษณา';
DROP TABLE IF EXISTS `wm_api_api`;
CREATE TABLE `wm_api_api` (
  `api_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL COMMENT 'ประเภทอินเทอร์เฟซ',
  `api_open` tinyint(1) DEFAULT '1' COMMENT 'อินเทอร์เฟซเปิดหรือไม่, 1=เปิด, 0=ปิด',
  `api_title` varchar(80) NOT NULL COMMENT 'ชื่ออินเทอร์เฟซ',
  `api_ctitle` varchar(80) DEFAULT NULL COMMENT 'ชื่อย่ออินเทอร์เฟซ',
  `api_name` varchar(60) NOT NULL COMMENT 'ตัวระบุอินเทอร์เฟซ',
  `api_appid` varchar(120) DEFAULT NULL COMMENT 'ID ผู้พัฒนา',
  `api_apikey` varchar(5000) DEFAULT NULL COMMENT 'apikey',
  `api_secretkey` varchar(5000) DEFAULT NULL COMMENT 'skey',
  `api_base` varchar(2000) DEFAULT NULL COMMENT 'พารามิเตอร์ตั้งค่าอินเทอร์เฟซพื้นฐาน',
  `api_info` varchar(500) DEFAULT NULL COMMENT 'คำอธิบายอินเทอร์เฟซ',
  `api_order` int DEFAULT NULL COMMENT 'การเรียงลำดับอินเทอร์เฟซ',
  `api_option` varchar(2000) DEFAULT NULL COMMENT 'พารามิเตอร์อื่นของอินเทอร์เฟซ',
  PRIMARY KEY (`api_id`),
  UNIQUE KEY `cname` (`api_name`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางระบบ API ทั้งเว็บไซต์';
INSERT INTO `wm_api_api` VALUES (1,1,1,'ใช้ได้ทั่วไปในเว็บไซต์',NULL,'system','16047','9cbb02c4444b0d53','a2393f3830f3fc2c66167b500a622332','a:3:{s:9:\"api_appid\";a:2:{s:4:\"mast\";i:1;s:6:\"remark\";s:52:\"กรุณากรอก appid ของคุณ\";}s:10:\"api_apikey\";a:2:{s:4:\"mast\";i:1;s:6:\"remark\";s:53:\"กรุณากรอก apikey ของคุณ\";}s:13:\"api_secretkey\";a:2:{s:4:\"mast\";i:1;s:6:\"remark\";s:56:\"กรุณากรอก secretkey ของคุณ\";}}','<span style=\"color:red\">อินเทอร์เฟซสำหรับการโต้ตอบภายในเว็บไซต์ ถ้าไม่กรอกบางฟังก์ชันจะใช้งานไม่ได้ ห้ามแก้ไขใด ๆ</span>',1,''),(2,2,1,'เข้าสู่ระบบ QQ',NULL,'qqlogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:6:\"APP ID\";s:6:\"remark\";s:71:\"กรุณากรอก APP ID ของแอปของคุณ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"APP Key\";s:6:\"remark\";s:72:\"กรุณากรอก APP Key ของแอปของคุณ\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','อินเทอร์เฟซสำหรับเข้าสู่ระบบเว็บไซต์ด้วย QQ ต้องไปสมัครที่ Tencent Open Platform ที่อยู่ callback: โดเมน+/wmcms/notify/apilogin.php',1,''),(3,3,1,'ชำระเงินผ่าน Alipay PC','Alipay','alipay','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:21:\"id ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:49:\"คีย์ส่วนตัวของ Alipay\";s:6:\"remark\";s:49:\"คีย์ส่วนตัวของ Alipay\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:49:\"คีย์สาธารณะของ Alipay\";s:6:\"remark\";s:49:\"คีย์สาธารณะของ Alipay\";}}','อินเทอร์เฟซชำระเงินออนไลน์ Alipay ต้องไปสมัครที่ Alipay Open Platform',1,''),(4,2,0,'เข้าสู่ระบบด้วย Baidu',NULL,'bdlogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:2:\"ID\";s:6:\"remark\";s:67:\"กรุณากรอก ID ของแอปของคุณ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"API Key\";s:6:\"remark\";s:72:\"กรุณากรอก API Key ของแอปของคุณ\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:10:\"Secret Key\";s:6:\"remark\";s:75:\"กรุณากรอก Secret Key ของแอปของคุณ\";}}','เข้าสู่ระบบด้วยบัญชี Baidu ต้องไปสมัครที่ Baidu Open Platform ที่อยู่ callback: โดเมน+/wmcms/notify/apilogin.php',3,''),(5,2,0,'เข้าสู่ระบบด้วย Sina',NULL,'weibologin','','','','a:3:{s:9:\"api_appid\";a:1:{s:4:\"mast\";i:0;}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"App Key\";s:6:\"remark\";s:72:\"กรุณากรอก App Key ของแอปของคุณ\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:10:\"App Secret\";s:6:\"remark\";s:75:\"กรุณากรอก App Secret ของแอปของคุณ\";}}','เข้าสู่ระบบด้วยบัญชี Weibo ต้องไปสมัครที่ Sina Open Platform',2,''),(6,3,1,'ชำระเงินด้วยการสแกน WeChat','WeChat','wxpay','','','123','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:52:\"กรุณากรอก APPID ของคุณ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:16:\"คีย์ API\";s:6:\"remark\";s:62:\"กรุณากรอกคีย์ API ของคุณ\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','อินเทอร์เฟซชำระเงินผ่านการสแกน WeChat ต้องไปสมัครที่ WeChat Merchant Platform',3,'a:1:{#123}s:5:{#34}mchid{#34};a:3:{#123}s:5:{#34}title{#34};s:39:{#34}หมายเลขผู้ค้า{#34};s:5:{#34}value{#34};s:1:{#34}0{#34};s:4:{#34}info{#34};s:46:{#34}หมายเลขผู้ค้า WeChat{#34};{#125}{#125}'),(7,4,0,'Alibaba Cloud OSS',NULL,'oss','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:11:\"AccessKeyId\";s:6:\"remark\";s:43:\"AccessKeyId ที่ได้จาก OSS\";}s:10:\"api_apikey\";a:1:{s:4:\"mast\";i:0;}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"AccessKeySecret\";s:6:\"remark\";s:47:\"AccessKeySecret ที่ได้จาก OSS\";}}','พื้นที่จัดเก็บ OSS ของ Alibaba Cloud',1,'a:2:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}title{#34};s:19:{#34}ชื่อ bucket{#34};s:5:{#34}value{#34};s:0:{#34}{#34};s:4:{#34}info{#34};s:0:{#34}{#34};{#125}s:5:{#34}point{#34};a:3:{#123}s:5:{#34}title{#34};s:42:{#34}ตำแหน่งที่ตั้ง{#34};s:5:{#34}value{#34};s:0:{#34}{#34};s:4:{#34}info{#34};s:181:{#34}ตั้งค่าตามตำแหน่งเซิร์ฟเวอร์ของคุณ ค่าเริ่มต้นคือ http://oss-cn-shenzhen.aliyuncs.com{#34};{#125}{#125}'),(8,4,0,'Tencent Cloud COS',NULL,'cos','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:6:\"APP_ID\";s:6:\"remark\";s:38:\"APP_ID ที่ได้จาก COS\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"API_KEY\";s:6:\"remark\";s:39:\"API_KEY ที่ได้จาก COS\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:6:\"SC_KEY\";s:6:\"remark\";s:38:\"SC_KEY ที่ได้จาก COS\";}}','พื้นที่จัดเก็บ COS ของ Tencent Cloud',2,'a:2:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}title{#34};s:19:{#34}ชื่อ bucket{#34};s:5:{#34}value{#34};s:0:{#34}{#34};s:4:{#34}info{#34};s:0:{#34}{#34};{#125}s:5:{#34}point{#34};a:3:{#123}s:5:{#34}title{#34};s:42:{#34}ตำแหน่งที่ตั้ง{#34};s:5:{#34}value{#34};s:0:{#34}{#34};s:4:{#34}info{#34};s:82:{#34}จีนใต้ -{#gt}gz; จีนกลาง -{#gt}sh; จีนเหนือ -{#gt}tj{#34};{#125}{#125}'),(9,4,0,'คลาวด์ Qiniu',NULL,'qiniu','','','','a:3:{s:9:\"api_appid\";a:1:{s:4:\"mast\";i:0;}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"accessKey\";s:6:\"remark\";s:121:\"accessKey ที่ได้จากที่เก็บข้อมูลแบบออบเจกต์ Qiniu Cloud\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"secretKey\";s:6:\"remark\";s:121:\"secretKey ที่ได้จากที่เก็บข้อมูลแบบออบเจกต์ Qiniu Cloud\";}}','พื้นที่จัดเก็บ Qiniu Cloud',3,'a:2:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}title{#34};s:19:{#34}ชื่อ bucket{#34};s:5:{#34}value{#34};s:0:{#34}{#34};s:4:{#34}info{#34};s:0:{#34}{#34};{#125}s:6:{#34}domain{#34};a:3:{#123}s:5:{#34}title{#34};s:45:{#34}โดเมนที่เข้าถึง{#34};s:5:{#34}value{#34};s:0:{#34}{#34};s:4:{#34}info{#34};s:183:{#34}เข้าสู่ระบบหลังบ้าน Qiniu Cloud เพื่อดูโดเมนที่เข้าถึง ต้องมี http:// นำหน้า!{#34};{#125}{#125}'),(10,4,0,'Sina Cloud',NULL,'scs','','','','a:3:{s:9:\"api_appid\";a:1:{s:4:\"mast\";i:0;}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"AccessKey\";s:6:\"remark\";s:120:\"AccessKey ที่ได้จากที่เก็บข้อมูลแบบออบเจกต์ Sina Cloud\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"SecretKey\";s:6:\"remark\";s:120:\"SecretKey ที่ได้จากที่เก็บข้อมูลแบบออบเจกต์ Sina Cloud\";}}','พื้นที่จัดเก็บ Sina Cloud',4,'a:1:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}title{#34};s:19:{#34}ชื่อ bucket{#34};s:5:{#34}value{#34};s:0:{#34}{#34};s:4:{#34}info{#34};s:0:{#34}{#34};{#125}{#125}'),(11,5,0,'ส่งลิงก์ไปยัง Baidu',NULL,'bdurl','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"โดเมน\";s:6:\"remark\";s:99:\"กรุณากรอกโดเมนของคุณ ไม่ต้องใส่ http://\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"token\";s:6:\"remark\";s:52:\"กรุณากรอก token ของคุณ\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','ใช้สำหรับส่ง URL ต้นฉบับของเว็บไซต์ ช่อง appid ให้กรอกโดเมน ไม่ต้องใส่ http:// ช่อง apikey ให้กรอก token',1,NULL),(12,2,0,'เข้าสู่ระบบด้วย Alipay',NULL,'alipaylogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:3:\"PID\";s:6:\"remark\";s:42:\"id ของผู้ร่วมมือ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:3:\"KEY\";s:6:\"remark\";s:66:\"รหัสตรวจสอบความปลอดภัย\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','เข้าสู่ระบบด้วยบัญชี Alipay ต้องไปสมัครที่ Alipay Open Platform',4,''),(13,2,0,'เข้าสู่ระบบด้วยการสแกน WeChat',NULL,'wxlogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:67:\"กรุณากรอก ID ของแอปของคุณ\";}s:10:\"api_apikey\";a:1:{s:4:\"mast\";i:0;}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"Appsecret\";s:6:\"remark\";s:74:\"กรุณากรอก Appsecret ของแอปของคุณ\";}}','เข้าสู่ระบบด้วย WeChat ต้องชำระ 300 หยวนเพื่อขอสิทธิ์ยืนยัน',5,''),(14,6,1,'ชำระเงินผ่าน Alipay WAP','Alipay','alipay_wap','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:21:\"id ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:49:\"คีย์ส่วนตัวของ Alipay\";s:6:\"remark\";s:49:\"คีย์ส่วนตัวของ Alipay\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:49:\"คีย์สาธารณะของ Alipay\";s:6:\"remark\";s:49:\"คีย์สาธารณะของ Alipay\";}}','ชำระเงินผ่าน Alipay บนมือถือ ใช้การตั้งค่าเดียวกับ PC ได้ หรือใช้บัญชีแยกต่างหากก็ได้',2,NULL),(15,6,1,'ชำระเงินผ่าน WeChat Official Account','WeChat','wxpay_jsapi','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:52:\"กรุณากรอก APPID ของคุณ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:16:\"คีย์ API\";s:6:\"remark\";s:62:\"กรุณากรอกคีย์ API ของคุณ\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"Appsecret\";s:6:\"remark\";s:56:\"กรุณากรอก Appsecret ของคุณ\";}}','ชำระเงินภายใน WeChat Official Account รองรับเฉพาะการชำระเงินในเบราว์เซอร์ WeChat เท่านั้น ใช้การตั้งค่าเดียวกับการชำระเงินผ่านการสแกนได้',4,'a:1:{#123}s:5:{#34}mchid{#34};a:3:{#123}s:5:{#34}title{#34};s:39:{#34}หมายเลขผู้ค้า{#34};s:5:{#34}value{#34};s:1:{#34}0{#34};s:4:{#34}info{#34};s:46:{#34}หมายเลขผู้ค้า WeChat{#34};{#125}{#125}'),(16,2,1,'เข้าสู่ระบบด้วย WeChat Mini Program','WeChat','wxapplogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"AppID\";s:6:\"remark\";s:45:\"ID ของมินิโปรแกรม\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:0:\"\";s:6:\"remark\";s:0:\"\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:9:\"AppSecret\";s:6:\"remark\";s:54:\"คีย์ของมินิโปรแกรม\";}}','ตั้งค่าอินเทอร์เฟซ WeChat Mini Program',6,''),(17,2,0,'เข้าสู่ระบบด้วย WeChat Official Account','WeChat','wxmplogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:9:\"api_appid\";s:6:\"remark\";s:5:\"appID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:10:\"api_apikey\";s:6:\"remark\";s:25:\"apikey ของแอป\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:13:\"api_secretkey\";s:6:\"remark\";s:9:\"appsecret\";}}','เข้าสู่ระบบด้วย WeChat Official Account (บัญชีบริการ) ต้องชำระ 300 หยวนเพื่อขอสิทธิ์ยืนยัน',7,''),(18,3,0,'PayPal ชำระระหว่างประเทศ','PayPal','paypal','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:8:\"ClientId\";s:6:\"remark\";s:9:\"Client ID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:10:\"api_apikey\";s:6:\"remark\";s:25:\"apikey ของแอป\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:6:\"secret\";s:6:\"remark\";s:6:\"secret\";}}','PayPal คือเครื่องมือชำระเงินสำหรับการค้าระหว่างประเทศที่ได้รับความนิยมจากผู้ใช้หลายร้อยล้านคนทั่วโลก ชำระเงินทันที เงินเข้าบัญชีทันที มีอินเทอร์เฟซการใช้งานภาษาจีนทั้งหมด สามารถถอนเงินผ่านธนาคารในประเทศจีนได้อย่างง่ายดาย ช่วยแก้ปัญหาการรับเงินจากการค้าต่างประเทศ',5,''),(19,7,1,'ชำระเงินผ่าน Alipay APP','Alipay','alipay_app','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:21:\"id ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:49:\"คีย์ส่วนตัวของ Alipay\";s:6:\"remark\";s:49:\"คีย์ส่วนตัวของ Alipay\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:49:\"คีย์สาธารณะของ Alipay\";s:6:\"remark\";s:49:\"คีย์สาธารณะของ Alipay\";}}','ชำระเงินผ่านแอป Alipay',1,''),(20,7,1,'ชำระเงินผ่าน WeChat APP','WeChat','wxpay_app','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:5:\"APPID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:16:\"คีย์ API\";s:6:\"remark\";s:16:\"คีย์ API\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:13:\"api_secretkey\";s:6:\"remark\";s:0:\"\";}}','ชำระเงินผ่านแอป WeChat',2,'a:1:{#123}s:5:{#34}mchid{#34};a:3:{#123}s:5:{#34}title{#34};s:21:{#34}ID ผู้ค้า{#34};s:5:{#34}value{#34};s:10:{#34}1504418791{#34};s:4:{#34}info{#34};s:39:{#34}หมายเลขผู้ค้า{#34};{#125}{#125}'),(21,8,1,'เข้าสู่ระบบด้วย WeChat APP','WeChat','wxapp_login','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:5:\"APPID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:10:\"api_apikey\";s:6:\"remark\";s:25:\"apikey ของแอป\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:9:\"APPSecret\";s:6:\"remark\";s:9:\"APPSecret\";}}','เข้าสู่ระบบด้วยแอป WeChat ต้องไปสมัครแอปที่ WeChat Open Platform',0,''),(22,8,1,'เข้าสู่ระบบด้วย QQ มือถือ','เข้าสู่ระบบ QQ','qqapplogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:6:\"APP ID\";s:6:\"remark\";s:6:\"APP ID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:7:\"APP Key\";s:6:\"remark\";s:7:\"APP Key\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:13:\"api_secretkey\";s:6:\"remark\";s:28:\"secretkey ของแอป\";}}','ต้องไปสมัครที่ QQ Open Platform',2,''),(23,9,0,'ข้อความ Alibaba Cloud','Alibaba Cloud','aliyunsms','','123123','1223123','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:9:\"api_appid\";s:6:\"remark\";s:24:\"appid ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:11:\"accessKeyId\";s:6:\"remark\";s:11:\"accessKeyId\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:15:\"accessKeySecret\";s:6:\"remark\";s:15:\"accessKeySecret\";}}','อินเทอร์เฟซส่งข้อความ Alibaba Cloud โปรดดู https://ak-console.aliyun.com/ เพื่อรับข้อมูล AK ของคุณ',1,''),(24,9,1,'ข้อความ Tencent Cloud','Tencent Cloud','tencentsms',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:24:\"APPID ของแอป\";s:6:\"remark\";s:24:\"APPID ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:41:\"SecretId ของ API คลาวด์\";s:6:\"remark\";s:41:\"SecretId ของ API คลาวด์\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:42:\"SecretKey ของ API คลาวด์\";s:6:\"remark\";s:42:\"SecretKey ของ API คลาวด์\";}}','อินเทอร์เฟซส่งข้อความ Tencent Cloud ดูคีย์ Cloud API ได้ที่: https://console.cloud.tencent.com/cam/capi',2,''),(25,10,0,'แจ้งเตือน DingTalk','DingTalk','dingding_hook',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:9:\"api_appid\";s:6:\"remark\";s:24:\"appid ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:10:\"api_apikey\";s:6:\"remark\";s:25:\"apikey ของแอป\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:13:\"api_secretkey\";s:6:\"remark\";s:28:\"secretkey ของแอป\";}}','การแจ้งเตือนผ่าน DingTalk',1,'a:1:{s:3:\"url\";a:3:{s:5:\"title\";s:22:\"URL ของ DingTalk\";s:5:\"value\";s:0:\"\";s:4:\"info\";s:58:\"URL แจ้งเตือน WEBHOOK ของ DingTalk\";}}'),(26,10,0,'แจ้งเตือน WeCom','WeCom','weixinwork_hook',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:9:\"api_appid\";s:6:\"remark\";s:24:\"appid ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:10:\"api_apikey\";s:6:\"remark\";s:25:\"apikey ของแอป\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:13:\"api_secretkey\";s:6:\"remark\";s:28:\"secretkey ของแอป\";}}','การแจ้งเตือนผ่าน WeCom',2,'a:1:{s:3:\"url\";a:3:{s:5:\"title\";s:19:\"URL ของ WeCom\";s:5:\"value\";s:0:\"\";s:4:\"info\";s:55:\"URL แจ้งเตือน WEBHOOK ของ WeCom\";}}'),(27,11,0,'สังเคราะห์เสียง Tencent Cloud','Tencent Cloud','tencenttts',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:30:\"APPID ของบัญชี\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:8:\"secretId\";s:6:\"remark\";s:41:\"SecretId ของ API คลาวด์\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:9:\"secretKey\";s:6:\"remark\";s:41:\"SecretId ของ API คลาวด์\";}}','การสังเคราะห์เสียง Tencent Cloud ดูคีย์ Cloud API ได้ที่: https://console.cloud.tencent.com/cam/capi',2,''),(28,11,0,'สังเคราะห์เสียง Baidu Cloud','Baidu Cloud','baidutts',NULL,NULL,NULL,'a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"AppID\";s:6:\"remark\";s:24:\"appid ของแอป\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:7:\"API Key\";s:6:\"remark\";s:26:\"API Key ของแอป\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:10:\"Secret Key\";s:6:\"remark\";s:29:\"Secret Key ของแอป\";}}','อินเทอร์เฟซสังเคราะห์เสียง Baidu Cloud ต้องสร้างแอปใน Baidu Cloud',4,'');
DROP TABLE IF EXISTS `wm_api_tts_voicet`;
CREATE TABLE `wm_api_tts_voicet` (
  `voicet_id` int NOT NULL AUTO_INCREMENT,
  `voicet_api_id` int NOT NULL COMMENT 'ID อินเทอร์เฟซ',
  `voicet_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ใช้งานหรือไม่: 0=ปิดใช้งาน, 1=ใช้งาน',
  `voicet_ids` varchar(10) NOT NULL COMMENT 'ID ผู้พูด',
  `voicet_name` varchar(60) NOT NULL COMMENT 'ชื่อผู้พูด',
  `voicet_order` int NOT NULL DEFAULT '9' COMMENT 'เรียงลำดับ, ค่าน้อยอยู่ก่อน',
  PRIMARY KEY (`voicet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางตั้งค่าผู้พูดสังเคราะห์เสียง';
INSERT INTO `wm_api_tts_voicet` VALUES (1,29,1,'100510000','จื้อเซียวเหยา, เสียงชายสำหรับอ่าน',1),(2,29,1,'101001','จื้อหยู, เสียงหญิงเชิงอารมณ์',2),(3,29,1,'101002','จื้อหลิง, เสียงหญิงทั่วไป',3),(4,29,1,'101004','จื้อหยุน, เสียงชายทั่วไป',4),(5,29,1,'101023','จื้อซวน, เสียงหญิงแบบสนทนา',5),(6,29,1,'101024','จื้อหาว, เสียงชายแบบสนทนา',6),(7,29,1,'1005','จื้อลี่, เสียงหญิงทั่วไป',7),(8,29,1,'1018','จื้อจิ้ง, เสียงชายเชิงอารมณ์',8),(9,30,1,'5003','ตู้เสียวเหยา',1),(10,30,1,'5118','ตู้เสี่ยวลู่',2),(11,30,1,'106','ตู้ป๋อเหวิน',3),(12,30,1,'5','ตู้เสี่ยวเจียว',4),(13,30,1,'1','ตู้เสี่ยวอวี่',6),(14,30,1,'0','ตู้เสี่ยวเหม่ย',5),(15,30,1,'3','ตู้เสียวเหยา',7),(16,30,1,'4','ตู้ยาหย่า',8);
DROP TABLE IF EXISTS `wm_api_type`;
CREATE TABLE `wm_api_type` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(60) DEFAULT NULL COMMENT 'ชื่อประเภทอินเทอร์เฟซ',
  `type_name` varchar(60) DEFAULT NULL COMMENT 'ตัวระบุประเภทอินเทอร์เฟซ',
  `type_order` int DEFAULT NULL COMMENT 'เรียงลำดับ',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางประเภทอินเทอร์เฟซ API';
INSERT INTO `wm_api_type` VALUES (1,'API ภายในเว็บไซต์','system',1),(2,'API เข้าสู่ระบบเว็บ','login',2),(3,'API ชำระเงิน PC','pay',3),(4,'API จัดเก็บ','oss',4),(5,'API SEO','seo',5),(6,'API ชำระเงินมือถือ','pay_wap',3),(7,'API ชำระเงิน APP','pay_app',3),(8,'API เข้าสู่ระบบ APP','login_app',3),(9,'API ข้อความ','sms',7),(10,'WEBHOOK','webhook',8),(11,'API สังเคราะห์เสียง','tts',9);
DROP TABLE IF EXISTS `wm_app_app`;
CREATE TABLE `wm_app_app` (
  `app_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL DEFAULT '1' COMMENT 'ID หมวดหมู่แอป',
  `app_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ต้องตรวจสอบหรือไม่',
  `app_rec` int NOT NULL DEFAULT '0' COMMENT 'แนะนำหรือไม่',
  `app_ico` varchar(120) DEFAULT NULL COMMENT 'ไอคอนแอป',
  `app_simg` varchar(120) DEFAULT NULL COMMENT 'รูปย่อที่อ้างอิง',
  `app_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินแอป',
  `app_name` varchar(60) NOT NULL COMMENT 'หัวข้อแอป',
  `app_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อแอป',
  `app_lid` varchar(100) DEFAULT '0' COMMENT 'id ภาษา',
  `app_lid_text` varchar(200) DEFAULT NULL COMMENT 'ข้อความภาษา',
  `app_cid` varchar(100) DEFAULT '0' COMMENT 'id ค่าใช้จ่าย',
  `app_cid_text` varchar(200) DEFAULT NULL COMMENT 'ข้อความค่าใช้จ่าย',
  `app_tocn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=ไม่ใช่ 1=ใช่ แอปที่แปลภาษาแล้ว',
  `app_ver` varchar(20) NOT NULL DEFAULT '0' COMMENT 'เวอร์ชัน',
  `app_size` varchar(20) NOT NULL DEFAULT '0' COMMENT 'ขนาด',
  `app_tags` varchar(60) DEFAULT NULL COMMENT 'แท็กแอป',
  `app_aid` int DEFAULT '0' COMMENT 'ผู้พัฒนา',
  `app_oid` int DEFAULT '0' COMMENT 'บริษัทผู้ให้บริการ',
  `app_info` varchar(100) DEFAULT NULL COMMENT 'รีวิว, ตัวอย่าง',
  `app_content` varchar(10000) DEFAULT NULL COMMENT 'เรื่องย่อ',
  `app_read` int NOT NULL DEFAULT '0' COMMENT 'ยอดเข้าชมแอป',
  `app_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนความคิดเห็นแอป',
  `app_ding` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโหวตชอบแอป',
  `app_cai` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโหวตไม่ชอบแอป',
  `app_start` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT 'ระดับดาว',
  `app_score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT 'คะแนนแอป',
  `app_paid` varchar(100) NOT NULL DEFAULT '0' COMMENT 'แพลตฟอร์มที่ใช้งาน',
  `app_paid_text` varchar(200) DEFAULT NULL COMMENT 'ข้อความแพลตฟอร์มที่ใช้งาน',
  `app_osver` varchar(20) NOT NULL DEFAULT '0' COMMENT 'ข้อกำหนดของระบบ',
  `app_downnum` int NOT NULL DEFAULT '0' COMMENT 'ยอดดาวน์โหลดแอป',
  `app_down1` varchar(120) DEFAULT NULL COMMENT 'ที่อยู่ดาวน์โหลดแอป 1',
  `app_down2` varchar(120) DEFAULT NULL COMMENT 'ที่อยู่ดาวน์โหลดแอป 2',
  `app_down3` varchar(120) DEFAULT NULL COMMENT 'ที่อยู่ดาวน์โหลดแอป 3',
  `app_addtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที',
  PRIMARY KEY (`app_id`),
  KEY `tid` (`type_id`,`app_addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางแอป';
DROP TABLE IF EXISTS `wm_app_attr`;
CREATE TABLE `wm_app_attr` (
  `attr_id` int NOT NULL AUTO_INCREMENT,
  `attr_type` varchar(10) NOT NULL COMMENT 'c=ค่าใช้จ่าย p=แพลตฟอร์ม l=ภาษา',
  `attr_name` varchar(60) NOT NULL COMMENT 'ชื่อแอตทริบิวต์',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางระบบค่าบริการแอป';
INSERT INTO `wm_app_attr` VALUES (5,'c','ซื้อในแอป'),(4,'p','แอนดรอยด์'),(6,'p','ซิมเบียน'),(7,'l','ภาษาอังกฤษ'),(8,'p','แอปเปิล'),(9,'l','ภาษาจีน'),(10,'c','แคร็ก'),(11,'c','ฟรี');
DROP TABLE IF EXISTS `wm_app_firms`;
CREATE TABLE `wm_app_firms` (
  `firms_id` int NOT NULL AUTO_INCREMENT,
  `firms_type` varchar(10) DEFAULT NULL COMMENT 'a=ผู้พัฒนาระบบ o=ผู้ให้บริการ s=พัฒนาและขายเอง',
  `firms_name` varchar(60) NOT NULL COMMENT 'ชื่อผู้พัฒนา',
  `firms_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อผู้พัฒนา',
  `firms_url` varchar(120) DEFAULT NULL COMMENT 'เว็บไซต์ทางการ',
  `firms_adress` varchar(120) DEFAULT NULL COMMENT 'ที่อยู่ติดต่อ',
  `firms_phone` varchar(15) DEFAULT NULL COMMENT 'โทรศัพท์ผู้พัฒนา',
  `firms_email` varchar(20) DEFAULT NULL COMMENT 'อีเมลผู้พัฒนา',
  `firms_content` varchar(5000) DEFAULT NULL COMMENT 'คำอธิบายผู้พัฒนา',
  `firms_addtime` int DEFAULT NULL COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`firms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางผู้พัฒนาแอป';
DROP TABLE IF EXISTS `wm_app_type`;
CREATE TABLE `wm_app_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อของประเภท',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL DEFAULT '0' COMMENT 'เรียงลำดับ',
  `type_ico` varchar(200) DEFAULT NULL COMMENT 'ไอคอนประเภท',
  `type_info` varchar(200) DEFAULT NULL COMMENT 'เรื่องย่อของประเภท',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตเนื้อหาหมวดหมู่',
  `type_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อหมวดหมู่',
  `type_key` varchar(100) DEFAULT NULL COMMENT 'คำค้นหาหมวดหมู่',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายหมวดหมู่',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่แอป';
INSERT INTO `wm_app_type` VALUES (12,0,'0','กีฬาแข่งความเร็ว','กีฬา','tiyu',5,NULL,'',0,0,'','',''),(11,0,'0','วางแผนป้องกันฐาน','วางแผน','celue',4,NULL,'',0,0,'','',''),(8,0,'0','สวมบทบาท','ตัวละคร','jiaose',1,NULL,'',0,0,'','',''),(9,0,'0','แอ็กชันผจญภัย','แอ็กชัน','dongzuo',2,'','',0,0,'','',''),(10,0,'0','ยิงเครื่องบิน','การบิน','feixing',3,NULL,'',0,0,'','',''),(13,0,'0','ฝึกสมองผ่อนคลาย','ฝึกสมอง','yizhi',6,NULL,'',0,0,'','',''),(14,0,'0','เกมกระดานไพ่','ไพ่','kapai',7,NULL,'',0,0,'','',''),(15,0,'0','จำลองการเลี้ยงดู','การเลี้ยงดู','yangcheng',9,NULL,'',0,0,'','',''),(16,0,'0','แปลจีนคุณภาพสูง','แปลภาษาจีน','hanhua',8,NULL,'',0,0,'','','');
DROP TABLE IF EXISTS `wm_article_article`;
CREATE TABLE `wm_article_article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL DEFAULT '1' COMMENT 'ID หมวดหมู่ข่าว',
  `article_display` tinyint(1) DEFAULT '1' COMMENT 'แสดงหรือไม่, สร้าง html',
  `article_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=รอตรวจสอบ 1=ปกติ 2=ถังขยะ',
  `article_weight` int NOT NULL DEFAULT '0' COMMENT 'น้ำหนักบทความ, ยิ่งมากยิ่งอยู่ก่อน',
  `article_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำหรือไม่',
  `article_head` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'เป็นข่าวพาดหัวหรือไม่',
  `article_strong` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ทำตัวหนาหรือไม่',
  `article_name` varchar(60) NOT NULL COMMENT 'หัวข้อบทความ',
  `article_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อบทความ',
  `article_color` varchar(20) DEFAULT NULL COMMENT 'สีหัวข้อ',
  `article_simg` varchar(200) DEFAULT NULL COMMENT 'รูปย่อ',
  `article_source` varchar(20) DEFAULT NULL COMMENT 'แหล่งที่มาบทความ',
  `article_tags` varchar(60) DEFAULT NULL COMMENT 'แท็ก',
  `article_url` varchar(120) DEFAULT NULL COMMENT 'เปลี่ยนเส้นทางหรือไม่',
  `article_author` varchar(60) DEFAULT 'admin' COMMENT 'ผู้แต่ง',
  `article_author_id` int DEFAULT '0' COMMENT 'ผู้แต่งบทความ',
  `article_editor` varchar(20) DEFAULT 'admin' COMMENT 'บรรณาธิการ',
  `article_editor_id` int DEFAULT '1' COMMENT 'id ของบรรณาธิการ',
  `article_info` varchar(250) DEFAULT NULL COMMENT 'เรื่องย่อ',
  `article_save_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ประเภทการจัดเก็บเนื้อหาบทความ, 1=ฐานข้อมูล, 2=ไฟล์',
  `article_save_path` varchar(250) DEFAULT NULL COMMENT 'พาธที่จัดเก็บไฟล์',
  `article_content` mediumtext COMMENT 'เนื้อหา',
  `article_read` int NOT NULL DEFAULT '0' COMMENT 'ยอดอ่าน',
  `article_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนตอบกลับ',
  `article_score` decimal(2,1) DEFAULT '0.0' COMMENT 'คะแนนบทความ',
  `article_ding` int NOT NULL DEFAULT '0' COMMENT 'กดชอบ',
  `article_cai` int NOT NULL DEFAULT '0' COMMENT 'กดไม่ชอบ',
  `article_addtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที',
  `article_examinetime` int NOT NULL DEFAULT '0' COMMENT 'เวลาตรวจสอบ',
  PRIMARY KEY (`article_id`),
  KEY `tid_index` (`type_id`,`article_addtime`),
  KEY `attr_index` (`article_display`,`article_status`,`article_weight`,`article_rec`,`article_head`,`article_strong`),
  KEY `list_index` (`article_status`,`type_id`),
  KEY `status_index` (`article_status`),
  KEY `type_index` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเนื้อหาบทความ';
DROP TABLE IF EXISTS `wm_article_author`;
CREATE TABLE `wm_article_author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_type` varchar(2) NOT NULL DEFAULT 'a' COMMENT 'เป็นผู้แต่งหรือแหล่งที่มา, a=ผู้แต่ง, s=แหล่งที่มา',
  `author_name` varchar(60) NOT NULL COMMENT 'ชื่อผู้แต่งหรือแหล่งที่มา',
  `author_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'เป็นข้อมูลเริ่มต้นหรือไม่',
  `author_data` int DEFAULT '0' COMMENT 'จำนวนรายการข้อมูลที่จับคู่กับแอตทริบิวต์ปัจจุบัน',
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางผู้แต่งบทความ';
INSERT INTO `wm_article_author` VALUES (1,'s','ต้นฉบับ',1,10),(32,'a','admin',1,10),(65,'e','admin',0,10);
DROP TABLE IF EXISTS `wm_article_type`;
CREATE TABLE `wm_article_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_status` tinyint(1) DEFAULT '1' COMMENT 'แสดงหรือไม่',
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อหมวดหมู่',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินหมวดหมู่',
  `type_order` int NOT NULL DEFAULT '0' COMMENT 'เรียงลำดับ',
  `type_ico` varchar(200) DEFAULT NULL COMMENT 'ไอคอน',
  `type_info` varchar(100) DEFAULT NULL COMMENT 'เรื่องย่อหมวดหมู่',
  `type_add` tinyint(1) DEFAULT '1' COMMENT 'หมวดหมู่อนุญาตให้ส่งผลงานหรือไม่',
  `type_titempid` int NOT NULL DEFAULT '0' COMMENT 'หน้าแรกหมวดหมู่',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'รายการหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'id เทมเพลตหน้าเนื้อหา',
  `type_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อหมวดหมู่',
  `type_key` varchar(100) DEFAULT NULL COMMENT 'คำค้นหาหมวดหมู่',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายหมวดหมู่',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่บทความ';
INSERT INTO `wm_article_type` VALUES (1,1,0,'0','ประกาศเว็บไซต์','ประกาศ','gg',1,'','',0,0,0,0,'','',''),(2,1,0,'0','ข่าวสาร','ข่าว','news',2,'','',0,0,0,0,'','',''),(3,1,1,'1','ces','','',1,'','',0,0,0,0,'','',''),(4,1,0,'0','หมวดหมู่ ceshi',NULL,NULL,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL);
DROP TABLE IF EXISTS `wm_author_author`;
CREATE TABLE `wm_author_author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `author_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=รอตรวจสอบ 1=ปกติ 2=ไม่ผ่าน',
  `author_nickname` varchar(60) NOT NULL COMMENT 'นามปากกาผู้แต่ง ห้ามแก้ไข',
  `author_info` varchar(100) NOT NULL COMMENT 'เรื่องย่อผู้แต่ง',
  `author_notice` varchar(500) DEFAULT NULL COMMENT 'ประกาศจากผู้แต่ง',
  `author_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เปิดใช้งาน',
  `author_toptime` int NOT NULL DEFAULT '0' COMMENT 'เวลาเข้าสู่ระบบครั้งล่าสุด',
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางผู้แต่ง';
DROP TABLE IF EXISTS `wm_author_draft`;
CREATE TABLE `wm_author_draft` (
  `draft_id` int NOT NULL AUTO_INCREMENT,
  `draft_author_id` int NOT NULL COMMENT 'ผู้แต่งของฉบับร่าง',
  `draft_module` varchar(20) NOT NULL COMMENT 'โมดูลของกล่องฉบับร่าง',
  `draft_cid` int NOT NULL DEFAULT '0' COMMENT 'id เนื้อหาที่ฉบับร่างสังกัด',
  `draft_title` varchar(100) NOT NULL COMMENT 'หัวข้อฉบับร่าง',
  `draft_content` text NOT NULL COMMENT 'เนื้อหาฉบับร่าง',
  `draft_number` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคำของฉบับร่าง',
  `draft_option` varchar(2000) DEFAULT NULL COMMENT 'ตัวเลือกของข้อมูลอื่น',
  `draft_createtime` int NOT NULL COMMENT 'เวลาสร้างฉบับร่าง',
  PRIMARY KEY (`draft_id`),
  KEY `draft_index` (`draft_author_id`,`draft_module`,`draft_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='กล่องฉบับร่าง';
DROP TABLE IF EXISTS `wm_author_end`;
CREATE TABLE `wm_author_end` (
  `end_id` int NOT NULL AUTO_INCREMENT,
  `end_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลรางวัลเมื่อจบเรื่อง',
  `end_type` varchar(20) DEFAULT NULL COMMENT 'ประเภทการตรวจสอบรางวัลเมื่อจบเรื่อง（จำนวนคำ、ตอน）',
  `end_number` int DEFAULT NULL COMMENT 'เงื่อนไขจำนวนรางวัล',
  `end_gold1` decimal(5,2) DEFAULT NULL COMMENT 'รางวัลเหรียญ 1',
  `end_gold2` decimal(5,2) DEFAULT NULL COMMENT 'รางวัลเหรียญ 2',
  PRIMARY KEY (`end_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางรางวัลการจบเรื่อง';
DROP TABLE IF EXISTS `wm_author_exp`;
CREATE TABLE `wm_author_exp` (
  `exp_id` int NOT NULL AUTO_INCREMENT,
  `exp_module` varchar(20) NOT NULL COMMENT 'โมดูลของค่าประสบการณ์',
  `exp_number` int NOT NULL DEFAULT '0' COMMENT 'ค่าประสบการณ์',
  `exp_author_id` int NOT NULL COMMENT 'id ผู้แต่ง',
  PRIMARY KEY (`exp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางระดับประสบการณ์ของผู้แต่ง';
DROP TABLE IF EXISTS `wm_author_level`;
CREATE TABLE `wm_author_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_module` varchar(15) DEFAULT NULL COMMENT 'โมดูลระดับ',
  `level_name` varchar(60) NOT NULL COMMENT 'ชื่อระดับ',
  `level_start` int NOT NULL DEFAULT '0' COMMENT 'ประสบการณ์เริ่มต้น',
  `level_end` int NOT NULL DEFAULT '0' COMMENT 'ประสบการณ์สิ้นสุด',
  `level_order` int NOT NULL DEFAULT '0' COMMENT 'ตำแหน่งที่แสดง',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='ระดับประสบการณ์';
INSERT INTO `wm_author_level` VALUES (1,'novel','นักเขียนหน้าใหม่',0,100,1),(2,'novel','ดาวรุ่ง',100,300,2),(3,'novel','มีฝีมือระดับหนึ่ง',300,600,3),(4,'novel','มีแฟนคลับมาก',600,1000,4),(5,'novel','นักเขียนอาชีพ',1000,1500,5),(6,'novel','นักเขียนมือเทพ',1500,2100,6),(22,'article','นักเขียนทั่วไป',0,100,1),(23,'article','นักเขียนระดับกลาง',100,500,2),(24,'article','นักเขียนระดับสูง',500,2000,3),(25,'article','นักเขียนอาชีพ',2000,5000,4);
DROP TABLE IF EXISTS `wm_author_module_income`;
CREATE TABLE `wm_author_module_income` (
  `income_id` int NOT NULL AUTO_INCREMENT,
  `income_module` varchar(20) NOT NULL COMMENT 'โมดูลรายรับ',
  `income_author_id` int NOT NULL COMMENT 'id ผู้แต่ง',
  `income_cid` int NOT NULL COMMENT 'เนื้อหาโมดูล',
  `income_gold1_now` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญสะสมปัจจุบัน 1',
  `income_gold2_now` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญสะสมปัจจุบัน 2',
  `income_gold1` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญสะสมทั้งหมด 1',
  `income_gold2` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญสะสมทั้งหมด 2',
  PRIMARY KEY (`income_id`),
  KEY `user_index` (`income_module`,`income_author_id`,`income_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกรายได้เนื้อหาของโมดูลผู้แต่ง';
DROP TABLE IF EXISTS `wm_author_sign`;
CREATE TABLE `wm_author_sign` (
  `sign_id` int NOT NULL AUTO_INCREMENT,
  `sign_module` varchar(20) NOT NULL COMMENT 'โมดูล',
  `sign_name` varchar(60) NOT NULL COMMENT 'ชื่อระดับการเซ็นสัญญา',
  `sign_divide` varchar(5) NOT NULL DEFAULT '7:3' COMMENT 'อัตราส่วนแบ่งรายได้จากการให้รางวัลด้วยไอเทม',
  `sign_gold1` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญ 1 ต่อพันคำ',
  `sign_gold2` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญ 2 ต่อพันคำ',
  `sign_order` tinyint DEFAULT '0' COMMENT 'เรียงลำดับ',
  PRIMARY KEY (`sign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='ระดับการเซ็นสัญญาของผู้แต่งนิยาย';
INSERT INTO `wm_author_sign` VALUES (1,'novel','สัญญาระดับ D','9:1',1.00,10.00,1),(2,'novel','สัญญาระดับ C','8:2',2.00,20.00,2),(3,'novel','สัญญาระดับ B','7:3',3.00,30.00,3),(4,'novel','สัญญาระดับ A','6:4',4.00,40.00,4),(5,'novel','เซ็นสัญญาระดับซิลเวอร์','5:5',5.00,50.00,5),(6,'novel','เซ็นสัญญาระดับโกลด์','4:6',6.00,60.00,6),(7,'novel','เซ็นสัญญาระดับแพลตินัม','3:7',7.00,70.00,7);
DROP TABLE IF EXISTS `wm_author_word`;
CREATE TABLE `wm_author_word` (
  `word_id` int NOT NULL AUTO_INCREMENT,
  `word_module` varchar(20) DEFAULT NULL COMMENT 'โมดูล',
  `word_author_id` int DEFAULT NULL COMMENT 'id ผู้แต่ง',
  `word_cid` int DEFAULT NULL COMMENT 'id เนื้อหา',
  `word_time` int DEFAULT NULL COMMENT 'เวลา',
  PRIMARY KEY (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการอัปเดตจำนวนคำ';
DROP TABLE IF EXISTS `wm_bbs_bbs`;
CREATE TABLE `wm_bbs_bbs` (
  `bbs_id` int NOT NULL AUTO_INCREMENT,
  `bbs_isreplay` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ต้องตอบกลับหรือไม่',
  `bbs_islogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ต้องเข้าสู่ระบบหรือไม่',
  `bbs_ispay` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'เสียเงินหรือไม่',
  `bbs_isself` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ดูได้เฉพาะตัวเองหรือไม่',
  `type_id` int NOT NULL COMMENT 'id หมวดหมู่',
  `bbs_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=รอตรวจสอบ 1=ปกติ',
  `bbs_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำ',
  `bbs_es` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'คัดสรร',
  `bbs_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=ปักหมุดทั้งเว็บไซต์ 2=ปักหมุดในหมวดหมู่ 3=ปักหมุดปัจจุบัน',
  `bbs_simg` varchar(120) DEFAULT NULL COMMENT 'รูปย่อ',
  `bbs_title` varchar(60) NOT NULL COMMENT 'หัวข้อโพสต์',
  `bbs_content` text NOT NULL COMMENT 'เนื้อหาโพสต์',
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'ผู้ใช้ที่โพสต์',
  `bbs_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาโพสต์',
  `bbs_replay_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาตอบกลับล่าสุด',
  `bbs_replay_nickname` varchar(60) DEFAULT NULL COMMENT 'ชื่อเล่นผู้ใช้ที่ตอบโพสต์',
  `bbs_replay_uid` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้ที่ตอบโพสต์',
  `bbs_read` int NOT NULL DEFAULT '0' COMMENT 'ยอดเข้าชม',
  `bbs_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนตอบกลับ',
  `bbs_tags` varchar(60) DEFAULT NULL COMMENT 'แท็ก',
  `bbs_ding` int NOT NULL DEFAULT '0' COMMENT 'กดชอบ',
  `bbs_cai` int NOT NULL DEFAULT '0' COMMENT 'กดไม่ชอบ',
  `bbs_score` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'คะแนน',
  PRIMARY KEY (`bbs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหัวข้อฟอรัม';
DROP TABLE IF EXISTS `wm_bbs_moderator`;
CREATE TABLE `wm_bbs_moderator` (
  `moderator_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `type_id` int NOT NULL DEFAULT '0' COMMENT 'id ของบอร์ด',
  PRIMARY KEY (`moderator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางผู้ดูแลหมวดฟอรัม';
DROP TABLE IF EXISTS `wm_bbs_type`;
CREATE TABLE `wm_bbs_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_post_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=เปิด',
  `type_replay_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=เปิด',
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) NOT NULL COMMENT 'ชื่อย่อของประเภท',
  `type_pinyin` varchar(50) NOT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL DEFAULT '50' COMMENT 'เรียงลำดับ',
  `type_info` varchar(200) DEFAULT NULL COMMENT 'เรื่องย่อ',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าเนื้อหา',
  `type_rtempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าความคิดเห็น',
  `type_ico` varchar(225) DEFAULT NULL COMMENT 'ที่อยู่ไอคอน',
  `type_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อบอร์ด',
  `type_key` varchar(100) DEFAULT NULL COMMENT 'คำค้นของบอร์ด',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายบอร์ด',
  `type_last_post` int NOT NULL DEFAULT '0' COMMENT 'โพสต์ล่าสุด',
  `type_last_replay` int NOT NULL DEFAULT '0' COMMENT 'ตอบกลับล่าสุด',
  `type_uptime` int NOT NULL DEFAULT '0' COMMENT 'เวลาอัปเดตข้อมูล',
  `type_sum_post` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโพสต์ทั้งหมด',
  `type_sum_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนตอบกลับทั้งหมด',
  `type_sum_read` int NOT NULL DEFAULT '0' COMMENT 'ยอดเข้าชมทั้งหมด',
  `type_today_post` int NOT NULL DEFAULT '0' COMMENT 'โพสต์รายวัน',
  `type_today_replay` int NOT NULL DEFAULT '0' COMMENT 'ตอบกลับรายวัน',
  `type_today_read` int NOT NULL DEFAULT '0' COMMENT 'ยอดเข้าชมรายวัน',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบอร์ดย่อยของฟอรัม';
DROP TABLE IF EXISTS `wm_config_config`;
CREATE TABLE `wm_config_config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `config_status` tinyint(1) DEFAULT '1' COMMENT 'แสดงการตั้งค่าหรือไม่',
  `group_id` int DEFAULT '0' COMMENT 'id กลุ่มการตั้งค่า',
  `config_module` varchar(20) NOT NULL COMMENT 'โมดูลของการตั้งค่า',
  `config_title` varchar(80) NOT NULL COMMENT 'หัวข้อของการตั้งค่า',
  `config_name` varchar(35) NOT NULL COMMENT 'ชื่อฟิลด์ของการตั้งค่า',
  `config_value` varchar(2000) NOT NULL COMMENT 'ค่าฟิลด์ของการตั้งค่า',
  `config_formtype` varchar(20) DEFAULT NULL COMMENT 'ประเภทฟอร์มของการตั้งค่า',
  `config_remark` varchar(255) DEFAULT NULL COMMENT 'ข้อมูลหมายเหตุของการตั้งค่า',
  `config_order` int DEFAULT NULL COMMENT 'ลำดับการแสดงของการตั้งค่า',
  PRIMARY KEY (`config_id`,`config_title`)
) ENGINE=MyISAM AUTO_INCREMENT=442 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางการตั้งค่าระบบ';
INSERT INTO `wm_config_config` VALUES (1,1,1,'system','ชื่อเว็บไซต์','webname','WMCMS เว็บไซต์ตัวอย่าง','input','ชื่อเว็บไซต์',1),(2,1,1,'system','โดเมนหลักของเว็บไซต์','weburl','wmcms.com','input','โดเมนหลักของเว็บไซต์ (ห้ามลงท้ายด้วย / ไม่ต้องใส่ http://)',2),(3,1,1,'system','อีเมลผู้ดูแลเว็บ','email','1747699213@qq.com','input','อีเมลติดต่อของผู้ดูแลเว็บไซต์',3),(14,1,1,'system','เลขทะเบียน ICP','beian','เลขที่ใบอนุญาต ICP ฉงชิ่ง 030173','input','หมายเลขจดทะเบียนโดเมนของเว็บไซต์',4),(7,1,1,'system','เปิดเว็บไซต์','siteopen','1','radio','สถานะเปิดปิดของเว็บไซต์',5),(8,1,1,'system','คำแนะนำเมื่อปิด','closeinfo','ขออภัย เว็บไซต์กำลังอัปเกรด ปิดให้บริการชั่วคราว','textarea','ข้อความแจ้งเมื่อเว็บไซต์ปิด',6),(9,1,1,'templates','เทมเพลตแบบเรียบง่าย','tp1','wmcms-web','input','เทมเพลตที่ใช้กับ wap1.0',9),(10,1,1,'templates','เทมเพลต 3G','tp2','wmcms-web','input','เทมเพลตที่ใช้กับเว็บไซต์ 3G',10),(11,1,1,'templates','เทมเพลตทัชสกรีน','tp3','wmcms-m','input','เทมเพลตที่ใช้กับเว็บไซต์ท็อชสกรีน',11),(12,1,1,'templates','เทมเพลตคอมพิวเตอร์','tp4','wmcms-web','input','เทมเพลตที่ใช้กับเว็บไซต์คอมพิวเตอร์',12),(13,1,15,'urlmode','เปิด URL แบบคงที่','url_type','1','select','การเปิดใช้ลิงก์แบบคงที่จำลองจะใช้ทรัพยากรเซิร์ฟเวอร์',8),(15,1,1,'domain','โดเมนคอมพิวเตอร์','domain4','','input','โดเมนสำหรับเข้าถึงเวอร์ชันคอมพิวเตอร์โดยตรง',8),(16,1,1,'domain','โดเมนทัชสกรีน','domain3','','input','โดเมนสำหรับเข้าถึงเวอร์ชันท็อชสกรีนโดยตรง',7),(17,1,1,'domain','โดเมน 3G','domain2','','input','โดเมนสำหรับเข้าถึงเวอร์ชัน 3G โดยตรง',6),(18,1,1,'domain','โดเมนแบบเรียบง่าย','domain1','','input','โดเมนสำหรับเข้าถึงเวอร์ชันเรียบง่ายโดยตรง',5),(25,1,4,'user','คำต้องห้าม','shieldkey','ผู้ดูแลระบบ,เจ้าของเว็บไซต์,ระบบ,admin','input','คำต้องห้ามในชื่อเล่นผู้ใช้',50),(28,1,1,'system','บันทึกการส่งอีเมล','emaillog_open','0','select','บันทึกประวัติการส่งอีเมลหรือไม่',13),(390,1,1,'cache','ประเภทแคชคิว','cache_queuetype','file','select','ประเภทแคชคิวที่ใช้งาน',16),(391,1,1,'cache','โฟลเดอร์แคช sql','sql_folder','sql','input','โฟลเดอร์เก็บแคช sql',5),(392,1,1,'cache','นามสกุลไฟล์แคช sql','sql_ext','.sql','input','นามสกุลไฟล์แคช sql',5),(39,1,1,'system','QQ ผู้ดูแลเว็บ','qq','1747699213','input','หมายเลข QQ ของผู้ดูแลเว็บไซต์',9),(40,1,1,'system','เบอร์โทรผู้ดูแลเว็บ','phone','15123931801','input','หมายเลขโทรศัพท์ของผู้ดูแลเว็บไซต์',10),(47,1,1,'domain','แสดงสัญลักษณ์ pt','pt_rep','0','input','แสดงตัวระบุ pt หรือไม่',11),(42,1,1,'tongji','โค้ดสถิติ','tongji','','textarea','โค้ดสถิติ',0),(43,1,1,'domain','สัญลักษณ์เวอร์ชันเรียบง่าย','tpmark1','wap','input','ตัวระบุสำหรับเวอร์ชันกะทัดรัด',13),(44,1,1,'domain','สัญลักษณ์เวอร์ชัน 3G','tpmark2','3g','input','ตัวระบุสำหรับเวอร์ชัน 3G',12),(45,1,1,'domain','สัญลักษณ์เวอร์ชันทัชสกรีน','tpmark3','m','input','ตัวระบุสำหรับเวอร์ชันท็อชสกรีน',10),(46,1,1,'domain','สัญลักษณ์เวอร์ชันคอมพิวเตอร์','tpmark4','web','input','ตัวระบุสำหรับเวอร์ชันคอมพิวเตอร์',9),(50,1,1,'domain','โดเมนเดิม','bdomain','','input','โดเมนเดิม',1),(51,1,1,'domain','โดเมนใหม่','ndomain','','input','โดเมนใหม่ที่ข้ามไป',2),(53,1,1,'domain','ผูกโดเมนหลังบ้าน','admin_domain','','input','โดเมนที่ผูกกับการจัดการหลังบ้านของเว็บไซต์',3),(54,1,1,'system','ไดเรกทอรีหลังบ้าน','admin_path','admin','input','ไดเรกทอรีของไฟล์หลังบ้าน เช่น admin',2),(57,1,1,'code','รหัสยืนยันเข้าสู่ระบบหลังบ้าน','code_admin_login','0','radio','การเข้าสู่ระบบหลังบ้านต้องกรอกรหัสยืนยันหรือไม่',1),(67,1,1,'upload','ครอปอัตโนมัติ','upload_cut','0','radio','เปิดใช้การตัดขอบรูปภาพอัตโนมัติหรือไม่',3),(58,1,1,'upload','ประเภทการอัปโหลด','upload_type','jpeg,jpg,gif,png,gif,txt,doc,apk','input','ประเภทไฟล์ที่อนุญาตให้อัปโหลด คั่นด้วย ,',2),(59,1,1,'upload','ขนาดอัปโหลด','upload_size','1024','input','จำกัดขนาดไฟล์อัปโหลด หน่วยเป็น Kb',2),(60,1,1,'upload','เปิดลายน้ำ','watermark_open','1','radio','เปิดใช้ฟังก์ชันลายน้ำหรือไม่',20),(61,1,1,'upload','ความกว้างที่ทริกเกอร์ลายน้ำ','watermark_width','100','input','เมื่อความกว้างของรูปภาพมากกว่าค่านี้',21),(62,1,1,'upload','ความสูงที่ทริกเกอร์ลายน้ำ','watermark_height','200','input','เมื่อความกว้างของรูปภาพมากกว่าค่านี้',22),(63,1,1,'upload','ประเภทลายน้ำ','watermark_type','text','radio','ประเภทลายน้ำ! พาธลายน้ำรูปภาพ /files/images/watermark.png',23),(64,1,1,'upload','ตำแหน่งลายน้ำ','watermark_location','9','radio','ตำแหน่งแสดงลายน้ำ',27),(65,1,1,'upload','สีลายน้ำ','watermark_color','#e01515','input','สีลายน้ำข้อความ',25),(66,1,1,'upload','ขนาดตัวอักษร','watermark_size','5','input','ขนาดลายน้ำข้อความ หน่วย: พิกเซล',26),(68,1,1,'upload','ความกว้างที่ทริกเกอร์ครอป','upload_imgwidth','1200','input','เมื่อความกว้างของรูปภาพมากกว่าค่านี้',4),(69,1,1,'upload','ความสูงที่ทริกเกอร์ครอป','upload_imgheight','800','input','เมื่อความสูงของรูปภาพมากกว่าค่านี้',5),(70,1,1,'upload','ความกว้างหลังครอป','upload_cutwidth','500','input','ความกว้างของรูปภาพหลังตัดขอบ',6),(71,1,1,'upload','ความสูงหลังครอป','upload_cutheight','500','input','ความสูงของรูปภาพหลังตัดขอบ',7),(72,1,1,'upload','เนื้อหาลายน้ำ','watermark_text','แท็กภาษาไทย WMCMS','input','เนื้อหาลายน้ำข้อความ',24),(73,1,1,'system','ภาษาหลักของโปรแกรม','lang','th_th','radio','ภาษาที่โปรแกรมใช้งาน',15),(389,1,1,'cache','ประเภทแคช sql','cache_sqltype','file','select','ประเภทแคช sql ที่ใช้งาน',16),(75,1,1,'system','อนุญาตเข้าผ่านพร็อกซี','proxy_visit','1','radio','อนุญาตให้เข้าถึงผ่านพร็อกซีหรือไม่',16),(77,1,1,'system','คำขอผู้ดูแลระบบ','request_open','0','radio','เปิดใช้บันทึกคำขอของผู้ดูแลระบบหลังบ้านหรือไม่',11),(78,1,1,'system','การดำเนินการผู้ดูแลระบบ','operation_open','0','radio','เปิดใช้การบันทึกสำรองข้อมูลเมื่อผู้ดูแลระบบแก้ไขข้อมูลหรือไม่',14),(79,1,2,'article','ตรวจพารามิเตอร์หน้าบทความ','par_article','1','radio','หน้าบทความตรวจสอบพารามิเตอร์ทั้งหมดว่าถูกต้องหรือไม่',1),(80,1,2,'article','ตรวจสอบพารามิเตอร์หน้าความคิดเห็น','par_replay','1','radio','หน้าความคิดเห็นตรวจสอบพารามิเตอร์ทั้งหมดว่าถูกต้องหรือไม่',2),(81,1,2,'article','สถานะเริ่มต้นเผยแพร่หลังบ้าน','admin_add','1','radio','สถานะเริ่มต้นเมื่อผู้ดูแลระบบเผยแพร่บทความจากหลังบ้าน',3),(82,1,11,'author','เปิดฟังก์ชันส่งผลงานหรือไม่','author_article_open','1','radio','เปิดใช้ฟังก์ชันส่งผลงานของผู้ใช้หรือไม่',24),(84,1,2,'article','สวิตช์ค้นหาบทความ','search_open','1','radio','เปิดใช้ฟังก์ชันค้นหาบทความหรือไม่',5),(85,1,2,'article','ระยะห่างการค้นหา','search_time','3','input','ช่วงเวลาระหว่างการค้นหาแต่ละครั้ง (หน่วย: วินาที)',6),(86,1,2,'article','เปิดโหวตบทความ','dingcai_open','1','select','เปิดใช้ฟังก์ชันโหวตถูกใจ/ไม่ถูกใจบทความหรือไม่',7),(87,1,2,'article','จำนวนโหวตบทความ','dingcai_count','2','input','จำกัดจำนวนครั้งที่โหวตถูกใจ/ไม่ถูกใจบทความแต่ละชิ้นต่อวัน',8),(88,1,1,'system','บันทึกข้อผิดพลาด','err_open','0','select','เปิดใช้บันทึกข้อผิดพลาดของเว็บไซต์หรือไม่',12),(89,1,2,'article','ลบข้อมูลถาวรทันที','admin_del','1','select','การลบบทความลบทันทีหรือย้ายไปถังขยะก่อน',3),(90,1,2,'article','สวิตช์ความคิดเห็นบทความ','replay_open','0','select','โมดูลบทความเปิดใช้ความคิดเห็นหรือไม่',9),(91,1,2,'article','แสดงความคิดเห็นต้องเข้าสู่ระบบหรือไม่','replay_login','1','select','ความคิดเห็นในโมดูลบทความต้องเข้าสู่ระบบหรือไม่',11),(92,1,3,'novel','ตรวจพารามิเตอร์หน้านิยาย','par_info','1','select','หน้ารายละเอียดนิยายตรวจสอบ id หมวดหมู่และ id หนังสือพร้อมกัน',1),(93,1,3,'novel','ตรวจพารามิเตอร์หน้าความคิดเห็น','par_replay','0','select','หน้าความคิดเห็นนิยายตรวจสอบ id หมวดหมู่และ id หนังสือพร้อมกัน',2),(94,1,3,'novel','ตรวจพารามิเตอร์หน้าสารบัญ','par_menu','1','select','หน้าสารบัญนิยายตรวจสอบ id หมวดหมู่และ id หนังสือพร้อมกัน',3),(95,1,3,'novel','ตรวจพารามิเตอร์หน้าอ่าน','par_read','1','select','หน้าอ่านนิยายตรวจสอบ id หมวดหมู่และ id หนังสือพร้อมกัน',4),(96,1,3,'novel','พาธเก็บไฟล์นิยาย','novel_save','/files/txt/novel/{#123}tid{#125}/{#123}nid{#125}/index.txt','input','พาธเก็บไฟล์ txt ที่สร้างจากนิยาย',5),(97,1,3,'novel','พาธเก็บตอนนิยาย','chapter_save','/files/txt/novel/{#123}tid{#125}/{#123}nid{#125}/{#123}cid{#125}.txt','input','พาธเก็บไฟล์ txt ของตอนที่สร้างจากนิยาย',6),(98,1,3,'novel','ปกเริ่มต้น','cover','/files/images/nocover.jpg','input','ที่อยู่ปกนิยายเริ่มต้น',7),(99,1,3,'novel','สถานะเผยแพร่หนังสือหลังบ้าน','admin_novel_add','1','select','สถานะตรวจสอบเริ่มต้นของการเผยแพร่หนังสือจากหลังบ้าน',8),(100,1,3,'novel','สถานะเผยแพร่ตอนหลังบ้าน','admin_chapter_add','100','select','สถานะตรวจสอบเริ่มต้นของการเผยแพร่ตอนจากหลังบ้าน',9),(101,1,3,'novel','ประเภทเริ่มต้นการเผยแพร่','type','1','select','ประเภทเริ่มต้นของการเผยแพร่นิยาย',10),(102,1,3,'novel','รูปแบบบันทึกเข้าฐานข้อมูล','data_type','1','radio','โหมดบันทึกข้อมูลลงฐานข้อมูล',11),(103,1,3,'novel','เปิดดาวน์โหลดนิยาย','down_open','1','radio','เปิดใช้การดาวน์โหลดนิยายหรือไม่',12),(104,1,3,'novel','ชื่อตอนล่าสุดเริ่มต้น','new_cname','ยังไม่มีตอน','input','ชื่อตอนล่าสุดเริ่มต้นของนิยายที่สร้างใหม่',13),(105,1,3,'novel','เทมเพลตเนื้อหานำหน้า TXT','novel_head','เว็บไซต์นิยายนี้ปลอดไวรัสอย่างแน่นอน','textarea','เทมเพลตส่วนหัวของ txt ที่สร้างเมื่อสร้างนิยายใหม่',14),(106,1,3,'novel','เทมเพลตเริ่มตอน TXT ใหม่','chapter_start','กดเพิ่มในรายการโปรดเพื่อติดตามได้เลย','textarea','เทมเพลตเริ่มต้นของตอน TXT ที่สร้างใหม่',15),(107,1,3,'novel','เทมเพลตจบตอน TXT ใหม่','chapter_end','โปรดจดจำที่อยู่เว็บไซต์นี้','textarea','เทมเพลตสิ้นสุดของตอน TXT ที่สร้างใหม่',16),(108,1,3,'novel','ตอนเริ่มต้นต้องเข้าสู่ระบบหรือไม่','chapter_isvip','0','radio','การเผยแพร่ตอนต้องเข้าสู่ระบบเพื่ออ่านหรือไม่ (ค่าเริ่มต้น)',17),(109,1,3,'novel','ชนิดเหรียญที่ใช้ซื้อตอน','buy_gold_type','2','radio','ประเภทเหรียญที่ใช้สมัครรับตอน',13),(110,1,3,'novel','ต่ำกว่าจำนวนคำไม่คิดเงิน','buy_wordnumber','500','input','ตอนที่มีจำนวนคำต่ำกว่าเท่าไรจึงไม่คิดเงิน',19),(111,1,3,'novel','สวิตช์โหวต','dingcai_open','1','select','เปิดใช้ฟังก์ชันโหวตถูกใจ/ไม่ถูกใจนิยาย',20),(112,1,3,'novel','จำนวนโหวต','dingcai_count','1','input','จำกัดจำนวนครั้งที่โหวตถูกใจ/ไม่ถูกใจนิยายแต่ละเล่มต่อวัน',21),(113,1,3,'novel','จำนวนครั้งให้คะแนน','score_count','1','input','จำกัดจำนวนครั้งที่ให้คะแนนนิยายแต่ละเล่มต่อวัน',23),(114,1,3,'novel','เปิดให้คะแนน','score_open','1','select','เปิดใช้ฟังก์ชันให้คะแนนนิยาย',22),(115,1,3,'novel','ให้คะแนนต้องเข้าสู่ระบบหรือไม่','score_login','0','select','ฟังก์ชันให้คะแนนนิยายต้องเข้าสู่ระบบหรือไม่',24),(116,1,3,'novel','เปิดความคิดเห็น','replay_open','0','select','เปิดใช้ฟังก์ชันความคิดเห็นนิยายหรือไม่',25),(117,1,3,'novel','ความคิดเห็นต้องเข้าสู่ระบบ','replay_login','1','select','ฟังก์ชันความคิดเห็นนิยายต้องเข้าสู่ระบบหรือไม่',26),(118,1,3,'novel','ฟังก์ชันรายการโปรด','coll_open','1','select','เปิดใช้ฟังก์ชันรายการโปรดนิยายหรือไม่',27),(119,1,3,'novel','ฟังก์ชันแนะนำ','rec_open','1','select','เปิดใช้ฟังก์ชันแนะนำนิยายหรือไม่',28),(120,1,3,'novel','ใช้เหรียญ 1 ได้ประสบการณ์แฟน','fans_exp_gold1','200','input','เปิดใช้ฟังก์ชันสมัครรับนิยายหรือไม่',30),(121,1,3,'novel','ฟังก์ชันให้เหรียญรางวัล','reward_open','1','select','เปิดใช้ฟังก์ชันให้เหรียญสนับสนุนนิยายหรือไม่',31),(122,1,3,'novel','ฟังก์ชันค้นหา','search_open','1','select','เปิดใช้ฟังก์ชันค้นหานิยายหรือไม่',32),(123,1,3,'novel','ระยะห่างการค้นหา','search_time','3','input','ช่วงเวลาระหว่างการค้นหานิยาย',33),(124,1,3,'novel','เปลี่ยนเส้นทางค้นหา','search_jump','0','radio','เมื่อค้นหานิยายได้ผลลัพธ์เดียว ให้ข้ามไปหน้านิยายทันทีหรือไม่',34),(125,1,3,'novel','เปิดชั้นหนังสือหรือไม่','shelf_open','1','select','เปิดใช้ฟังก์ชันชั้นหนังสือหรือไม่',31),(126,1,4,'user','ฟังก์ชันสมัครสมาชิก','reg_open','1','select','เปิดใช้การสมัครสมาชิกหรือไม่',1),(127,1,4,'user','ฟังก์ชันเข้าสู่ระบบ','login_open','1','select','เปิดใช้การเข้าสู่ระบบหรือไม่',2),(128,1,4,'user','บันทึกการเข้าสู่ระบบ','login_log','1','select','เปิดใช้บันทึกประวัติการเข้าสู่ระบบหรือไม่',3),(129,1,4,'user','ประเภทโปรไฟล์เริ่มต้น','user_head','1','select','รูปโปรไฟล์เริ่มต้นของผู้ใช้ที่สมัครใหม่',4),(130,1,4,'user','ประเภทโปรไฟล์เริ่มต้น','default_head','/files/images/nohead.gif','input','ที่อยู่รูปโปรไฟล์เริ่มต้น',5),(131,1,4,'user','สถานะสมัครสมาชิกใหม่','reg_status','1','select','สถานะเริ่มต้นของบัญชีผู้ใช้ที่สมัครใหม่',6),(132,1,4,'user','ความกว้างรูปโปรไฟล์','head_width','100','input','ความกว้างรูปโปรไฟล์ผู้ใช้',7),(133,1,4,'user','ความสูงรูปโปรไฟล์','head_height','100','input','ความสูงรูปโปรไฟล์ผู้ใช้',8),(134,1,4,'user','รูปโปรไฟล์ระบบ','msg_head','/files/images/system.jpg','input','รูปโปรไฟล์เริ่มต้นของระบบ',9),(135,1,4,'user','สมัครแล้วแถมเหรียญ 1','reg_gold1','2','input','จำนวนเหรียญ 1 ที่มอบให้ผู้ใช้ที่สมัครใหม่',10),(136,1,4,'user','สมัครแล้วแถมเหรียญ 2','reg_gold2','0','input','จำนวนเหรียญ 2 ที่มอบให้ผู้ใช้ที่สมัครใหม่',11),(137,1,4,'user','สมัครแล้วแถมประสบการณ์','reg_exp','0','input','จำนวนประสบการณ์ที่มอบให้ผู้ใช้ที่สมัครใหม่',12),(138,1,4,'user','ลายเซ็นเริ่มต้นสมัครสมาชิก','reg_sign','WMCMS อยู่เคียงข้างคุณ!','textarea','ลายเซ็นเริ่มต้นของผู้ใช้ที่สมัครใหม่',13),(139,1,4,'user','ชื่อค่าประสบการณ์','exp_name','แต้มฝัน','input','ชื่อประสบการณ์ของเว็บไซต์',14),(140,1,4,'user','ชื่อเหรียญ 1','gold1_name','หยวนฝัน','input','ชื่อเหรียญ 1 ของเว็บไซต์',15),(141,1,4,'user','ชื่อเหรียญ 2','gold2_name','สมบัติฝัน','input','ชื่อเหรียญ 2 ของเว็บไซต์',16),(142,1,4,'user','หน่วยเหรียญ 1','gold1_unit','หยวน','input','หน่วยของเหรียญ 1 ของเว็บไซต์',17),(143,1,4,'user','หน่วยเหรียญ 2','gold2_unit','รายการ','input','หน่วยของเหรียญ 2 ของเว็บไซต์',18),(144,1,4,'user','เข้าสู่ระบบแถมประสบการณ์','login_exp','1','input','ประสบการณ์ที่มอบให้เมื่อเข้าสู่ระบบครั้งแรกของวัน',19),(145,1,4,'user','เข้าสู่ระบบแถมเหรียญ 1','login_gold1','0','input','จำนวนเหรียญ 1 ที่มอบให้เมื่อเข้าสู่ระบบครั้งแรกของวัน',20),(146,1,4,'user','เข้าสู่ระบบแถมเหรียญ 2','login_gold2','0','input','จำนวนเหรียญ 2 ที่มอบให้เมื่อเข้าสู่ระบบครั้งแรกของวัน',21),(147,1,1,'system','ตรวจอักขระสงวน','check_shield','0','select','ตรวจสอบอักขระที่สงวนไว้',98),(148,1,1,'system','ตรวจอักขระต้องห้าม','check_disable','0','select','ตรวจสอบอักขระที่ห้ามใช้',99),(149,1,4,'user','สวิตช์เช็คอิน','sign_open','1','select','สวิตช์ฟังก์ชันเช็กอิน',24),(150,1,4,'user','สวิตช์รางวัลเช็คอิน','sign_reward','0','select','สวิตช์รางวัลการเช็กอิน',25),(151,1,4,'user','รางวัลประสบการณ์เช็คอิน','sign_exp','1','input','ประสบการณ์ที่ได้จากการเช็กอินทุกวัน',26),(152,1,4,'user','รางวัลเหรียญ 1 เช็คอิน','sign_gold1','0','input','เหรียญ 1 ที่ได้จากการเช็กอินทุกวัน',27),(153,1,4,'user','รางวัลเหรียญ 2 เช็คอิน','sign_gold2','0','input','เหรียญ 2 ที่ได้จากการเช็กอินทุกวัน',28),(154,1,5,'replay','เปิดความคิดเห็น','replay_open','1','select','เปิดใช้ฟังก์ชันความคิดเห็นหรือไม่',1),(155,1,5,'replay','ตั้งค่าแบบรวม','unify','1','select','โมดูลอื่นใช้การตั้งค่าจากโมดูลความคิดเห็นหรือไม่',2),(156,1,5,'replay','ต้องเข้าสู่ระบบหรือไม่','replay_login','0','select','ความคิดเห็นต้องเข้าสู่ระบบหรือไม่',3),(157,1,5,'replay','สถานะความคิดเห็นเริ่มต้น','status','1','select','ความคิดเห็นเริ่มต้นเป็นสถานะตรวจสอบแล้วหรือรอตรวจสอบ',4),(158,1,5,'replay','ระยะห่างระหว่างความคิดเห็น','top_time','15','input','ช่วงเวลาระหว่างความคิดเห็นสองครั้ง',5),(159,1,5,'replay','จำนวนความคิดเห็น','everyday_count','100','input','จำนวนครั้งที่แสดงความคิดเห็นได้ต่อวัน',6),(160,1,5,'replay','ฟังก์ชันโหวต','dingcai_open','1','select','เปิดใช้ฟังก์ชันโหวตถูกใจ/ไม่ถูกใจความคิดเห็นหรือไม่',7),(161,1,5,'replay','จำนวนโหวต','dingcai_count','1','input','จำนวนครั้งที่โหวตถูกใจ/ไม่ถูกใจความคิดเห็นเดียวกันได้ต่อวัน',8),(162,1,5,'replay','ชื่อเล่นผู้เยี่ยมชม','nickname','ผู้เยี่ยมชม','input','ชื่อเล่นเมื่อผู้เยี่ยมชมแสดงความคิดเห็น',9),(163,1,5,'replay','รางวัลความคิดเห็นครั้งแรก ๆ','reward_count','0','input','ความคิดเห็นกี่ครั้งแรกของวันจึงได้รางวัล',10),(164,1,5,'replay','รางวัลเหรียญ 1','replay_gold1','0','input','เหรียญ 1 ที่ได้จากความคิดเห็น',11),(165,1,5,'replay','รางวัลเหรียญ 2','replay_gold2','0','input','เหรียญ 2 ที่ได้จากความคิดเห็น',12),(166,1,5,'replay','ค่าประสบการณ์รางวัล','replay_exp','0','input','ประสบการณ์ที่ได้จากความคิดเห็น',13),(167,1,5,'replay','ชื่อกล่องความคิดเห็น js','boxname','โรงน้ำชายุทธภพ','input','ชื่อกล่องความคิดเห็น js',14),(168,1,5,'replay','คำแนะนำเมื่อไม่มีข้อมูล','no_data','รอคุณอยู่','input','ข้อความแจ้งเมื่อไม่มีความคิดเห็นใน js',15),(169,1,5,'replay','คำแนะนำในช่องกรอก','input','ไม่แสดงความคิดเห็นสักหน่อยหรือ?','input','คำใบ้ในช่องกรอกความคิดเห็น js',16),(170,1,5,'replay','แสดงความคิดเห็นยอดนิยม','hot','1','select','แสดงความคิดเห็นยอดนิยมหรือไม่',17),(171,1,5,'replay','กี่โหวตขึ้นเป็นความคิดเห็นยอดนิยม','hot_display','2','input','ต้องมีโหวตถูกใจกี่ครั้งจึงเป็นความคิดเห็นยอดนิยม',18),(172,1,5,'replay','จำนวนความคิดเห็นยอดนิยม','hot_count','2','input','จำนวนความคิดเห็นยอดนิยมที่แสดง',19),(173,1,5,'replay','จำนวนรายการต่อหน้า','list_limit','6','input','จำนวนความคิดเห็นที่แสดงต่อหน้า',20),(174,1,5,'replay','จำนวนลิงก์แบ่งหน้า','page_count','5','input','จำนวนปุ่มข้ามหน้าที่แสดง',21),(175,1,6,'link','ตรวจพารามิเตอร์หน้าลิงก์เพื่อน','par_link','0','select','ตรวจสอบพารามิเตอร์ของหน้าลิงก์เพื่อน',1),(176,1,6,'link','เปิดรับสมัคร','join','1','select','เปิดใช้การขอลิงก์เพื่อนหรือไม่',2),(177,1,6,'link','ประเภทคลิกลิงก์เพื่อน','click_type','0','select','ประเภทการคลิกของลิงก์เพื่อน',3),(178,1,6,'link','เวลาป้องกันรีเฟรช','ref_time','3600','input','เวลาป้องกันการรีเฟรช',4),(179,1,6,'link','ตรวจ UA การคลิก','check_ua','1','select','ตรวจสอบ UA เมื่อคลิกลิงก์เพื่อนหรือไม่',5),(180,1,6,'link','บันทึก IP ครั้งเดียว','check_oneip','1','select','การคลิกในวันเดียวกันบันทึก IP เพียงครั้งเดียว',6),(181,1,6,'link','บันทึกการคลิก','click_log','1','select','เปิดใช้การบันทึกสถิติการคลิก',7),(182,1,6,'link','เปิดนับสถิติ IP','getip_open','1','select','เปิดใช้การสถิติ IP',8),(183,1,6,'link','เปิดนับสถิติที่อยู่','getadress_open','0','select','เปิดใช้การสถิติที่อยู่',9),(184,1,6,'link','สถานะเริ่มต้นใบสมัครหน้าเว็บ','join_status','0','select','สถานะเริ่มต้นของการขอลิงก์เพื่อนจากหน้าเว็บ',10),(185,1,6,'link','สถานะเริ่มต้นเพิ่มหลังบ้าน','admin_status','1','select','สถานะเริ่มต้นเมื่อเพิ่มลิงก์เพื่อนจากหลังบ้าน',11),(186,1,6,'link','หน้าเข้าลิงก์เพื่อน','in_jump','','input','หน้าที่เปิดเมื่อคลิกลิงก์เพื่อน หากว่างถือเป็นหน้าแรก',12),(187,1,7,'picture','ตรวจพารามิเตอร์หน้าอัลบั้ม','par_picture','0','select','ตรวจสอบพารามิเตอร์ของหน้าอัลบั้มภาพ',1),(188,1,7,'picture','ตรวจพารามิเตอร์หน้าความคิดเห็น','par_replay','0','select','ตรวจสอบพารามิเตอร์ของหน้าความคิดเห็นอัลบั้มภาพ',2),(189,1,7,'picture','อัปเดตหลังบ้านต้องตรวจสอบ','admin_add','1','select','การอัปเดตอัลบั้มภาพจากหลังบ้านต้องตรวจสอบหรือไม่',3),(190,1,7,'picture','ผู้ใช้ส่งผลงานต้องตรวจสอบ','user_add','1','select','การส่งอัลบั้มภาพของผู้ใช้ต้องผ่านการตรวจสอบ',4),(191,1,7,'picture','ฟังก์ชันโหวต','dingcai_open','1','select','ฟังก์ชันโหวตถูกใจ/ไม่ถูกใจ',5),(192,1,7,'picture','ฟังก์ชันให้คะแนน','score_open','1','select','เปิดใช้ฟังก์ชันให้คะแนนหรือไม่',6),(193,1,7,'picture','ฟังก์ชันความคิดเห็น','replay_open','1','select','เปิดใช้ฟังก์ชันความคิดเห็นหรือไม่',7),(194,1,7,'picture','ให้คะแนนต้องเข้าสู่ระบบหรือไม่','score_login','1','select','การให้คะแนนต้องเข้าสู่ระบบหรือไม่',8),(195,1,7,'picture','เปิดค้นหาหรือไม่','search_open','1','select','เปิดใช้การค้นหาหรือไม่',9),(196,1,7,'picture','จำนวนโหวต','dingcai_count','1','input','จำนวนครั้งที่โหวตถูกใจ/ไม่ถูกใจเนื้อหาเดียวกันได้ต่อวัน',10),(197,1,7,'picture','จำนวนครั้งให้คะแนน','score_count','1','input','จำนวนครั้งที่ให้คะแนนเนื้อหาเดียวกันได้ต่อวัน',11),(198,1,7,'picture','ระยะห่างการค้นหา','search_time','3','input','ช่วงเวลาระหว่างการค้นหาแต่ละครั้ง',12),(199,1,7,'picture','ความคิดเห็นต้องเข้าสู่ระบบหรือไม่','replay_login','1','select','ความคิดเห็นต้องเข้าสู่ระบบหรือไม่',14),(200,1,8,'app','ตรวจพารามิเตอร์หน้าแอป','par_app','0','select','ตรวจสอบพารามิเตอร์ของหน้าแอป',1),(201,1,8,'app','ตรวจพารามิเตอร์หน้าความคิดเห็น','par_replay','0','select','ตรวจสอบพารามิเตอร์ของหน้าความคิดเห็นแอป',2),(202,1,8,'app','ไอคอนเริ่มต้นแอป','default_ico','/files/images/noimage.gif','input','ไอคอนเริ่มต้นของแอป',3),(203,1,8,'app','ปกเริ่มต้นแอป','default_simg','/files/images/noimage.gif','input','ปกเริ่มต้นของแอป',4),(204,1,8,'app','อัปเดตหลังบ้านต้องตรวจสอบ','admin_add','1','select','การอัปเดตแอปจากหลังบ้านต้องตรวจสอบหรือไม่',5),(205,1,8,'app','เปิดดาวน์โหลดแอปหรือไม่','down_open','1','select','เปิดใช้ฟังก์ชันดาวน์โหลดแอปหรือไม่',6),(206,1,8,'app','ฟังก์ชันโหวต','dingcai_open','1','select','ฟังก์ชันโหวตถูกใจ/ไม่ถูกใจ',6),(207,1,8,'app','จำนวนโหวต','dingcai_count','1','input','จำนวนครั้งที่โหวตถูกใจ/ไม่ถูกใจเนื้อหาเดียวกันได้ต่อวัน',7),(208,1,8,'app','ฟังก์ชันให้คะแนน','score_open','1','select','เปิดใช้ฟังก์ชันให้คะแนนหรือไม่',8),(209,1,8,'app','จำนวนครั้งให้คะแนน','score_count','1','input','จำนวนครั้งที่ให้คะแนนเนื้อหาเดียวกันได้ต่อวัน',9),(210,1,8,'app','ให้คะแนนต้องเข้าสู่ระบบหรือไม่','score_login','0','select','การให้คะแนนต้องเข้าสู่ระบบหรือไม่',10),(211,1,8,'app','ฟังก์ชันความคิดเห็น','replay_open','1','select','เปิดใช้ฟังก์ชันความคิดเห็นหรือไม่',11),(212,1,8,'app','ความคิดเห็นต้องเข้าสู่ระบบหรือไม่','replay_login','0','select','ความคิดเห็นต้องเข้าสู่ระบบหรือไม่',12),(213,1,8,'app','เปิดค้นหาหรือไม่','search_open','1','select','เปิดใช้การค้นหาหรือไม่',13),(214,1,8,'app','ระยะห่างการค้นหา','search_time','3','input','ช่วงเวลาระหว่างการค้นหาสองครั้ง',14),(215,1,9,'bbs','ตรวจพารามิเตอร์หน้ากระทู้','par_bbs','0','select','ตรวจสอบพารามิเตอร์ของหน้ากระทู้',1),(216,1,9,'bbs','ตรวจพารามิเตอร์หน้าตอบกลับ','par_relist','0','select','ตรวจสอบพารามิเตอร์ของหน้าการตอบกลับ',2),(217,1,9,'bbs','ผู้แต่งดูได้หรือไม่','author_look','1','select','ผู้แต่งดูกระทู้ที่อยู่ระหว่างตรวจสอบได้หรือไม่',3),(218,1,9,'bbs','ผู้แต่งแก้ไขได้หรือไม่','author_up','1','select','ผู้แต่งแก้ไขกระทู้ของตนเองได้หรือไม่',4),(219,1,9,'bbs','ผู้แต่งลบได้หรือไม่','author_del','1','select','ผู้แต่งลบกระทู้ของตนเองได้หรือไม่',5),(220,1,9,'bbs','สถานะเริ่มต้นโพสต์','user_post','1','select','สถานะเริ่มต้นของการโพสต์ของผู้ใช้',6),(221,1,9,'bbs','สถานะเริ่มต้นตอบกลับ','user_replay','1','select','สถานะเริ่มต้นของการตอบกลับของผู้ใช้',7),(222,1,9,'bbs','แก้ไขแล้วต้องตรวจสอบหรือไม่','up_status','1','select','ผู้ใช้แก้ไขกระทู้แล้วต้องตรวจสอบหรือไม่',8),(223,1,9,'bbs','ฟังก์ชันโพสต์','post_open','0','select','เปิดใช้ฟังก์ชันโพสต์หรือไม่',9),(224,1,9,'bbs','ฟังก์ชันตอบกลับ','replay_open','0','select','เปิดใช้ฟังก์ชันตอบกลับหรือไม่',10),(225,1,9,'bbs','จำกัดการโพสต์','post_num','0','input','จำกัดจำนวนโพสต์ต่อวันหรือไม่',11),(226,1,9,'bbs','รางวัลโพสต์ครั้งแรก ๆ','post_top','5','input','โพสต์กี่ครั้งแรกของวันจึงได้รางวัล',12),(227,1,9,'bbs','รางวัลเหรียญ 1 โพสต์','post_gold1','1','input','เหรียญ 1 ที่ได้จากการโพสต์',13),(228,1,9,'bbs','รางวัลเหรียญ 2 โพสต์','post_gold2','0','input','เหรียญ 2 ที่ได้จากการโพสต์',14),(229,1,9,'bbs','รางวัลประสบการณ์โพสต์','post_exp','1','input','ประสบการณ์ที่ได้จากการโพสต์',15),(230,1,9,'bbs','จำกัดตอบกลับต่อวัน','everyday_count','0','input','จำนวนการตอบกลับสูงสุดต่อวัน',16),(231,1,9,'bbs','ตอบกลับครั้งแรก ๆ มีรางวัล','reward_count','5','input','ตอบกลับกี่ครั้งแรกของวันจึงได้รางวัล',17),(232,1,9,'bbs','รางวัลเหรียญ 1 ตอบกลับ','replay_gold1','1','input','เหรียญ 1 ที่ได้จากการตอบกลับ',18),(233,1,9,'bbs','รางวัลเหรียญ 2 ตอบกลับ','replay_gold2','0','input','เหรียญ 2 ที่ได้จากการตอบกลับ',18),(234,1,9,'bbs','รางวัลประสบการณ์ตอบกลับ','replay_exp','1','input','ประสบการณ์ที่ได้จากการตอบกลับ',19),(235,1,9,'bbs','ไอคอนบอร์ดเริ่มต้น','default_ico','/files/images/forum.png','input','ไอคอนเริ่มต้นของบอร์ด',20),(236,1,9,'bbs','ระยะห่างการค้นหา','search_time','3','input','ช่วงเวลาระหว่างการค้นหาสองครั้ง',22),(237,1,9,'bbs','เปิดค้นหา','search_open','1','select','เปิดใช้การค้นหากระทู้หรือไม่',21),(238,1,2,'article','รูปย่อเริ่มต้นของหน้าเว็บ','default_simg','/files/images/noimage.gif','input','ปกเริ่มต้นเมื่อหน้าเว็บเรียกภาพย่อแล้วไม่มีภาพ',0),(239,1,1,'logo','โลโก้แบบเรียบง่าย','logo_1','','input','โลโก้ที่ใช้กับเวอร์ชันเรียบง่าย',1),(240,1,1,'logo','โลโก้สี','logo_2','','input','โลโก้ที่ใช้กับเวอร์ชันสี',2),(241,1,1,'logo','โลโก้ทัชสกรีน','logo_3','/files/images/logo.png','input','โลโก้ที่ใช้กับหน้าจอสัมผัส',3),(242,1,1,'logo','โลโก้คอมพิวเตอร์','logo_4','/files/images/logo.png','input','โลโก้ที่ใช้กับคอมพิวเตอร์',4),(243,1,1,'system','ประเภทฐานข้อมูล','db','mysql','select','ประเภทฐานข้อมูลที่ใช้งาน',17),(244,1,10,'message','สวิตช์ฟังก์ชันข้อความ','message_open','1','select','เปิดใช้ฟังก์ชันข้อความหรือไม่',1),(245,1,10,'message','จำนวนข้อความต่อวัน','message_count','3','input','จำนวนข้อความสูงสุดต่อวัน',2),(246,1,1,'logo','คิวอาร์โค้ด WeChat','ewm_wx','','input','คิวอาร์โค้ด WeChat',5),(247,1,1,'logo','คิวอาร์โค้ด Alipay','ewm_alipay','/files/images/ewm_alipay.png','input','คิวอาร์โค้ด Alipay',6),(248,1,1,'logo','คิวอาร์โค้ด Weibo','ewm_weibo','','input','คิวอาร์โค้ด Weibo',7),(249,1,1,'logo','คิวอาร์โค้ดกลุ่ม QQ','ewm_qun','/files/images/ewm_qun.png','input','คิวอาร์โค้ดกลุ่ม QQ',8),(250,1,1,'cache','สวิตช์แคช','cache_open','1','select','เปิดใช้แคชหรือไม่',1),(251,1,1,'cache','ประเภทแคช','cache_type','file','select','ประเภทแคช',2),(252,1,1,'cache','พาธบันทึกแคช','cache_path','cache','input','พาธเก็บแคช',3),(253,1,1,'cache','พาธแคชไฟล์','file_folder','site','input','พาธเก็บแคชไฟล์',4),(254,1,1,'cache','นามสกุลแคชไฟล์','file_ext','.cache','input','นามสกุลแคชไฟล์',5),(255,1,1,'cache','โฟลเดอร์บันทึกคิว','queue_folder','queue','input','โฟลเดอร์เก็บคิว',6),(256,1,1,'cache','นามสกุลแคชคิว','queue_ext','.queue','input','นามสกุลแคชคิว',7),(257,1,1,'cache','เซิร์ฟเวอร์ redis','redis_host','127.0.0.1','input','เซิร์ฟเวอร์ redis',8),(258,1,1,'cache','พอร์ต redis','redis_port','6379','input','พอร์ต redis',9),(259,1,1,'cache','เซิร์ฟเวอร์ memcached','memcached_host','127.0.0.1','input','เซิร์ฟเวอร์ memcached',10),(260,1,1,'cache','พอร์ต memcached','memcached_port','11211','input','พอร์ต memcached',11),(261,1,1,'cache','กลไกแคช','cache_mechanism','page','select','กลไกแคช',1),(262,1,1,'cache','แคช SQL','cache_sql','1','radio','แคช SQL',1),(263,1,1,'cache','เวลาบันทึกแคช','cache_time','300','input','เวลาเก็บแคช (หน่วย: วินาที)',12),(268,1,4,'user','การทำงานหลังเข้าสู่ระบบ ajax','ajax_login','ref','select','การทำงานหลังเข้าสู่ระบบด้วย ajax',29),(265,1,1,'cache','เปิดแคชคิว','cache_queue','0','radio','เปิดใช้แคชคิวหรือไม่',14),(266,1,1,'cache','เวลาแคชคิว','cache_queuetime','300','input','เวลาแคชคิว',15),(267,1,1,'cache','เวลาแคช SQL','cache_sqltime','300','input','เวลาแคช SQL',16),(269,1,11,'author','สถานะเริ่มต้นใบสมัครผู้แต่ง','apply_author_status','0','select','สถานะตรวจสอบเริ่มต้นของการสมัครเป็นผู้แต่ง',2),(270,1,11,'author','เปิดสมัครผู้แต่งด้วยตนเอง','apply_author_open','1','select','เปิดใช้การสมัครเป็นผู้แต่งด้วยตนเองจากหน้าเว็บหรือไม่',1),(271,1,11,'author','เรื่องย่อเริ่มต้น','author_default_info','คนนี้ขี้เกียจมาก!','input','ประวัติส่วนตัวเริ่มต้นของผู้สมัครเป็นผู้แต่ง',3),(272,1,11,'author','ประกาศเริ่มต้น','author_default_notice','ผู้แต่งรายนี้ยังไม่มีประกาศ!','input','ประกาศเริ่มต้นของผู้สมัครเป็นผู้แต่ง',4),(273,1,4,'user','ชื่อยอดเงิน','money_name','หยวนนุ่ม','input','ชื่อยอดคงเหลือของบัญชี',30),(274,1,11,'author','วิธีตรวจสอบนิยาย','author_novel_createnovel','0','select','วิธีตรวจสอบนิยายที่สร้างใหม่',5),(275,1,11,'author','วิธีตรวจสอบตอน','author_novel_createchapter','0','select','วิธีตรวจสอบตอนของนิยายที่สร้างใหม่',6),(276,1,11,'author','ความกว้างปกอัปโหลด','author_novel_coverwidth','400','input','จำกัดความกว้างของปกที่อัปโหลด',7),(277,1,11,'author','ความสูงปกอัปโหลด','author_novel_coverheight','500','input','จำกัดความสูงของปกที่อัปโหลด',8),(278,1,11,'author','วิธีตรวจสอบปก','author_novel_uploadcover','0','radio','วิธีตรวจสอบปก',9),(279,1,11,'author','ข้อความยังไม่ตรวจสอบ','author_apply_0','สวัสดี คำขอเป็นนักเขียนของคุณถูกส่งแล้ว กรุณารอผู้ดูแลระบบตรวจสอบ!','textarea','เหตุผลที่สถานะผู้แต่งเปลี่ยนเป็นยังไม่ตรวจสอบ',10),(280,1,11,'author','เหตุผลที่อนุมัติ','author_apply_1','สวัสดี คำขอเป็นนักเขียนของคุณผ่านการตรวจสอบแล้ว ตอนนี้คุณสามารถสร้างนิยายได้เลย!','textarea','เหตุผลที่ส่งข้อความเมื่อผู้แต่งผ่านการตรวจสอบ',11),(281,1,11,'author','เหตุผลที่ไม่อนุมัติ','author_apply_2','ขออภัย คำขอเป็นนักเขียนของคุณไม่ผ่านการตรวจสอบ!\\r\\nสาเหตุมีดังนี้:\\r\\n1. ข้อมูลอาจไม่ครบถ้วน\\r\\n2. นามปากกาของคุณอาจเข้าข่ายผิดกฎหมาย','textarea','เหตุผลที่ผู้แต่งไม่ผ่านการตรวจสอบ',12),(282,1,11,'author','เหตุผลที่ยังไม่ตรวจสอบ','author_novel_cover_0','สวัสดี ปกที่คุณอัปโหลดจะแสดงให้เห็นหลังผู้ดูแลระบบตรวจสอบผ่านแล้วเท่านั้น!','textarea','เหตุผลที่ปกกลายเป็นยังไม่ตรวจสอบ',13),(283,1,11,'author','เหตุผลที่อนุมัติ','author_novel_cover_1','ยินดีด้วย ปกนิยายที่คุณส่งผ่านการตรวจสอบแล้ว!','textarea','เหตุผลที่ปกผ่านการตรวจสอบ',14),(284,1,11,'author','เหตุผลที่ปฏิเสธการตรวจสอบ','author_novel_cover_2','ขออภัย ปกที่คุณขอไม่ผ่านการตรวจสอบ!\\r\\nสาเหตุมีดังนี้:\\r\\n1. ปกอาจมีเนื้อหาลามกหรือรุนแรง!\\r\\n2. ผิดกฎหมายที่เกี่ยวข้องของประเทศ!','textarea','เหตุผลที่ปกไม่ผ่านการตรวจสอบ',15),(285,1,11,'author','วิธีตรวจสอบแก้ไขนิยาย','author_novel_editnovel','0','select','การแก้ไขนิยายต้องตรวจสอบหรือไม่',16),(286,1,11,'author','วิธีตรวจสอบแก้ไขตอน','author_novel_editchapter','0','select','การแก้ไขตอนต้องตรวจสอบหรือไม่',17),(287,1,11,'author','เหตุผลที่ยังไม่ตรวจสอบ','author_novel_editnovel_0','สวัสดี นิยายที่คุณแก้ไขกรุณารอผู้ดูแลระบบตรวจสอบ!','textarea','เหตุผลที่สถานะการแก้ไขนิยายเปลี่ยนเป็นยังไม่ตรวจสอบ',18),(288,1,11,'author','เหตุผลที่อนุมัติ','author_novel_editnovel_1','ยินดีด้วย ข้อมูลนิยายที่คุณส่งผ่านการตรวจสอบแล้ว!','textarea','เหตุผลที่การแก้ไขนิยายผ่านการตรวจสอบ',19),(289,1,11,'author','เหตุผลที่ปฏิเสธการตรวจสอบ','author_novel_editnovel_2','ขออภัย นิยายที่คุณแก้ไขไม่ผ่านการตรวจสอบ!\\r\\nสาเหตุมีดังนี้:\\r\\n1. เนื้อหาอาจลามกหรือรุนแรง!\\r\\n2. ผิดกฎหมายที่เกี่ยวข้องของประเทศ!','textarea','เหตุผลที่การแก้ไขนิยายไม่ผ่านการตรวจสอบ',20),(290,1,11,'author','เหตุผลที่ยังไม่ตรวจสอบ','author_novel_editchapter_0','สวัสดี ตอนที่คุณแก้ไขกรุณารอผู้ดูแลระบบตรวจสอบ!','textarea','เหตุผลที่สถานะการแก้ไขตอนเปลี่ยนเป็นยังไม่ตรวจสอบ',21),(291,1,11,'author','เหตุผลที่อนุมัติ','author_novel_editchapter_1','ยินดีด้วย ตอนของคุณผ่านการตรวจสอบแล้ว!','textarea','เหตุผลที่การแก้ไขตอนผ่านการตรวจสอบ',22),(292,1,11,'author','เหตุผลที่ปฏิเสธการตรวจสอบ','author_novel_editchapter_2','ขออภัย ตอนที่คุณแก้ไขไม่ผ่านการตรวจสอบ!\\r\\nสาเหตุมีดังนี้:\\r\\n1. เนื้อหาอาจลามกหรือรุนแรง!\\r\\n2. ผิดกฎหมายที่เกี่ยวข้องของประเทศ!','textarea','เหตุผลที่การแก้ไขตอนไม่ผ่านการตรวจสอบ',23),(293,1,11,'author','วิธีตรวจสอบบทความ','author_article_createarticle','0','select','วิธีตรวจสอบการส่งบทความ',24),(294,1,11,'author','วิธีตรวจสอบแก้ไขบทความ','author_article_editarticle','0','select','วิธีตรวจสอบการส่งบทความที่แก้ไข',25),(295,1,11,'author','เหตุผลที่ยังไม่ตรวจสอบ','author_article_editarticle_0','สวัสดี กรุณารอผู้ดูแลระบบตรวจสอบต้นฉบับของคุณ!','textarea','เหตุผลที่การแก้ไขบทความเปลี่ยนเป็นยังไม่ตรวจสอบ',26),(296,1,11,'author','เหตุผลที่อนุมัติ','author_article_editarticle_1','ยินดีด้วย บทความที่คุณส่งผ่านการตรวจสอบแล้ว!','textarea','เหตุผลที่การแก้ไขบทความผ่านการตรวจสอบ',27),(297,1,11,'author','เหตุผลที่ปฏิเสธการตรวจสอบ','author_article_editarticle_2','ขออภัย บทความที่คุณส่งเข้ามาไม่ผ่านการตรวจสอบ!\\r\\nสาเหตุมีดังนี้:\\r\\n1. เนื้อหาอาจลามกหรือรุนแรง!\\r\\n2. ผิดกฎหมายที่เกี่ยวข้องของประเทศ!','textarea','เหตุผลที่การแก้ไขบทความเปลี่ยนเป็นยังไม่ตรวจสอบ',28),(302,1,1,'system','ข้อผิดพลาดอัปโหลดอัตโนมัติ','err_auto_upload','1','select','เมื่อพบข้อผิดพลาดให้ส่งไปยังเซิร์ฟเวอร์คลาวด์เพื่อดำเนินการโดยอัตโนมัติหรือไม่',13),(301,1,15,'urlmode','เปิด HTML หรือไม่','ishtml','0','radio','เปิดใช้การเข้าถึงแบบ HTML หรือไม่',6),(303,1,3,'novel','จำนวนใช้เหรียญ 1','cons_gold1','200','input','จำนวนเหรียญ 1 ที่ใช้',30),(304,1,3,'novel','ใช้เหรียญ 1 แถมโหวตรายเดือน','cons_gold1_month','0','input','ใช้เหรียญ 1 ครบจำนวนหนึ่งแล้วมอบโหวตรายเดือน',31),(322,1,3,'novel','ใช้เหรียญ 1 แถมโหวตแนะนำ','cons_gold1_rec','1','input','ใช้เหรียญ 1 ครบจำนวนหนึ่งแล้วมอบโหวตแนะนำ',32),(305,1,4,'user','เข้าสู่ระบบแถมโหวตแนะนำ','login_rec','0','input','จำนวนโหวตแนะนำที่มอบให้เมื่อเข้าสู่ระบบทุกวัน',31),(306,1,4,'user','เข้าสู่ระบบแถมโหวตรายเดือน','login_month','0','input','จำนวนโหวตรายเดือนที่มอบให้เมื่อเข้าสู่ระบบทุกวัน',32),(307,1,4,'user','เช็คอินแถมโหวตรายเดือน','sign_month','0','input','จำนวนโหวตรายเดือนที่มอบให้เมื่อเช็กอินทุกวัน',33),(308,1,4,'user','เช็คอินแถมโหวตแนะนำ','sign_rec','0','input','จำนวนโหวตแนะนำที่มอบให้เมื่อเช็กอินทุกวัน',34),(309,1,4,'user','ชื่อโหวตแนะนำ','ticket_rec','โหวตแนะนำ','input','ชื่อกำหนดเองของโหวตแนะนำ',35),(310,1,4,'user','ชื่อโหวตรายเดือน','ticket_month','โหวตรายเดือน','input','ชื่อกำหนดเองของโหวตรายเดือน',36),(311,1,12,'finance','เปิดเติมเงิน','recharge_open','1','select','เปิดใช้การเติมเงินหรือไม่',1),(312,1,12,'finance','แลกยอดเงินเป็นเหรียญ 2','money_to_gold2_open','1','select','เปิดใช้การแลกยอดคงเหลือเป็นเหรียญ 2 หรือไม่',2),(313,1,12,'finance','แลกเหรียญ 2 เป็นเหรียญ 1','gold2_to_gold1_open','0','select','เปิดใช้การแลกเหรียญ 2 เป็นเหรียญ 1 หรือไม่',3),(314,1,12,'finance','แลกเหรียญ 1 เป็นเหรียญ 2','gold1_to_gold2_open','0','select','เปิดใช้การแลกเหรียญ 1 เป็นเหรียญ 2 หรือไม่',4),(315,1,12,'finance','แลกเหรียญ 2 เป็นยอดเงิน','gold2_to_money_open','1','select','เปิดใช้การแลกเหรียญ 2 เป็นยอดคงเหลือหรือไม่',5),(316,1,12,'finance','เปิดถอนเงินหรือไม่','cash_open','1','select','เปิดใช้การถอนเงินหรือไม่',6),(317,1,12,'finance','อัตราเติมเงิน','rmb_to_gold2','10','input','อัตราการเติมเงิน',7),(318,1,12,'finance','อัตราแลกยอดเงินเป็นเหรียญ 2','money_to_gold2','1','input','อัตราแลกเปลี่ยนยอดคงเหลือเป็นเหรียญ 2',8),(319,1,12,'finance','อัตราแลกเหรียญ 2 เป็นเหรียญ 1','gold2_to_gold1','10','input','อัตราแลกเหรียญ 2 เป็นเหรียญ 1',9),(320,1,12,'finance','อัตราแลกเหรียญ 1 เป็นเหรียญ 2','gold1_to_gold2','0','input','อัตราแลกเหรียญ 1 เป็นเหรียญ 2',10),(321,1,12,'finance','อัตราแลกเหรียญ 2 เป็นยอดเงิน','gold2_to_money','0.1','input','อัตราแลกเหรียญ 2 เป็นยอดคงเหลือ',11),(323,1,3,'novel','จำนวนใช้เหรียญ 2','cons_gold2','100','input','จำนวนเหรียญ 2 ที่ใช้',33),(324,1,3,'novel','ใช้เหรียญ 2 แถมโหวตรายเดือน','cons_gold2_month','2','input','ใช้เหรียญ 2 ครบจำนวนหนึ่งแล้วมอบโหวตรายเดือน',34),(325,1,3,'novel','ใช้เหรียญ 2 แถมโหวตแนะนำ','cons_gold2_rec','3','input','ใช้เหรียญ 2 ครบจำนวนหนึ่งแล้วมอบโหวตแนะนำ',35),(326,1,4,'user','สมัครแล้วแถมโหวตแนะนำ','reg_rec','0','input','โหวตแนะนำที่มอบให้เมื่อสมัครสมาชิก',48),(327,1,4,'user','สมัครแล้วแถมโหวตรายเดือน','reg_month','0','input','โหวตรายเดือนที่มอบให้เมื่อสมัครสมาชิก',49),(328,1,3,'novel','ใช้เหรียญ 2 ได้ประสบการณ์แฟน','fans_exp_gold2','15','input','ใช้เหรียญ 2 ครบจำนวนหนึ่งแล้วได้ประสบการณ์แฟนคลับ',36),(329,1,11,'author','ของแถมเข้าสู่ระบบ','login_exp','10','input','ประสบการณ์ผู้แต่งที่มอบให้เมื่อเข้าสู่ระบบทุกวัน',29),(330,1,11,'author','ประสบการณ์รับโหวตแนะนำ','income_rec','5','input','ได้ประสบการณ์เท่าไรจากการได้รับโหวตแนะนำ 1 ใบ',30),(331,1,11,'author','ประสบการณ์รับโหวตรายเดือน','income_month','10','input','ได้ประสบการณ์เท่าไรจากการได้รับโหวตรายเดือน 1 ใบ',31),(332,1,11,'author','จำนวนรับเหรียญ 1','income_gold1','100','input','ได้เหรียญ 1 จำนวนเท่าไรจึงจะได้ประสบการณ์ผู้แต่ง 1 แต้ม',32),(333,1,11,'author','จำนวนรับเหรียญ 2','income_gold2','50','input','ได้เหรียญ 2 จำนวนเท่าไรจึงจะได้ประสบการณ์ผู้แต่ง 1 แต้ม',33),(334,1,3,'novel','ฟังก์ชันส่งของขวัญ','give_open','1','select','เปิดใช้ฟังก์ชันมอบของขวัญหรือไม่',37),(335,1,3,'novel','โหวตต้องเข้าสู่ระบบหรือไม่','dingcai_login','1','select','การโหวตถูกใจ/ไม่ถูกใจต้องเข้าสู่ระบบหรือไม่',38),(336,1,3,'novel','วิธีแจ้งเตือนหน้ายังไม่ได้ซื้อ','read_sub_prompt','1','select','วิธีแจ้งเมื่อยังไม่ได้สมัครรับบนหน้าอ่าน',39),(337,1,12,'finance','ที่อยู่ซื้อบัตรเติมเงิน','card_buy_url','http://www.weimengcms.com','input','ที่อยู่สำหรับซื้อรหัสบัตร',12),(338,1,12,'finance','รางวัลเติมเงินครั้งแรก','recharge_reward_gold2','10','input','เหรียญ 2 ที่ได้เป็นรางวัลจากการเติมเงินครั้งแรก',13),(339,1,12,'finance','กิจกรรมเติมเงิน','activity_open','1','radio','เปิดใช้กิจกรรมเติมเงินหรือไม่',14),(340,1,12,'finance','เวลาเริ่มกิจกรรม','activity_starttime','1524055804','input','เวลาเริ่มกิจกรรม',15),(341,1,12,'finance','เวลาสิ้นสุดกิจกรรม','activity_endtime','1524919806','input','เวลาสิ้นสุดกิจกรรม',16),(342,1,12,'finance','ค่าธรรมเนียมถอนเงิน','cash_cost','8','input','ค่าธรรมเนียมการถอนเงิน',17),(343,1,12,'finance','ยอดถอนขั้นต่ำ','cash_lowest','100','input','ยอดถอนเงินขั้นต่ำ',18),(344,1,1,'upload','วิธีบันทึกการอัปโหลด','upload_savetype','0','select','ตำแหน่งเก็บไฟล์ที่อัปโหลด',1),(345,1,1,'upload','พาธจัดเก็บระยะไกล/คำนำหน้า','upload_savepath','','input','ตำแหน่งหรือคำนำหน้าสำหรับเก็บไฟล์ที่อัปโหลดจากระยะไกล',1),(346,1,2,'article','ฟังก์ชันให้คะแนนบทความ','score_open','1','select','เปิดใช้ฟังก์ชันให้คะแนนบทความหรือไม่',12),(347,1,2,'article','เข้าสู่ระบบเพื่อโหวตบทความ','dingcai_login','1','select','การโหวตถูกใจ/ไม่ถูกใจบทความต้องเข้าสู่ระบบหรือไม่',13),(348,1,2,'article','เข้าสู่ระบบเพื่อให้คะแนนบทความ','score_login','1','select','การให้คะแนนบทความต้องเข้าสู่ระบบหรือไม่',14),(349,1,2,'article','จำนวนให้คะแนนต่อบทความ','score_count','1','input','จำนวนครั้งที่ให้คะแนนบทความแต่ละชิ้นได้ต่อวัน',15),(350,1,5,'replay','เข้าสู่ระบบเพื่อโหวตความคิดเห็น','dingcai_login','1','select','การโหวตถูกใจ/ไม่ถูกใจความคิดเห็นต้องเข้าสู่ระบบหรือไม่',22),(351,1,1,'system','ตรวจ UA แล้วเปลี่ยนเส้นทางอัตโนมัติ','auto_jump','1','select','เปิดใช้การตรวจสอบอัตโนมัติและข้ามไปยังเวอร์ชันมือถือหรือคอมพิวเตอร์ที่เหมาะสมหรือไม่',4),(352,1,1,'code','รหัสยืนยันสมัครสมาชิก','code_user_reg','1','radio','การสมัครสมาชิกของผู้ใช้ต้องใช้รหัสยืนยันหรือไม่',2),(353,1,1,'code','รหัสยืนยันเข้าสู่ระบบผู้ใช้','code_user_login','1','radio','การเข้าสู่ระบบของผู้ใช้ต้องใช้รหัสยืนยันหรือไม่',3),(354,1,1,'code','รหัสยืนยันเปลี่ยนรหัสผ่าน','code_user_uppsw','1','radio','การแก้ไขรหัสผ่านต้องใช้รหัสยืนยันหรือไม่',4),(355,1,1,'code','รหัสยืนยันกู้รหัสผ่าน','code_user_getpsw','1','radio','การกู้คืนรหัสผ่านต้องใช้รหัสยืนยันหรือไม่',5),(356,1,1,'code','รหัสยืนยันแสดงความคิดเห็น','code_replay','0','radio','การแสดงความคิดเห็นต้องใช้รหัสยืนยันหรือไม่',6),(357,1,1,'code','รหัสยืนยันโพสต์กระทู้','code_bbs_post','1','radio','การตั้งกระทู้ต้องใช้รหัสยืนยันหรือไม่',7),(358,1,1,'code','รหัสยืนยันตอบกลับกระทู้','code_bbs_replay','1','radio','การตอบกลับกระทู้ต้องใช้รหัสยืนยันหรือไม่',8),(359,1,1,'code','คลังคำถามรหัสยืนยัน','code_question','เว็บไซต์อย่างเป็นทางการของ WMCMS คืออะไร?|www.weimengcms.com\\r\\nใครคือผู้ก่อตั้ง WMCMS?|เวยเมิ่ง','textarea','คลังคำถามของรหัสยืนยันแบบถามตอบ',9),(360,1,1,'code','ประเภทรหัสยืนยันเข้าสู่ระบบหลังบ้าน','code_admin_login_type','2','select','ประเภทรหัสยืนยันของการเข้าสู่ระบบหลังบ้าน',10),(361,1,1,'code','ประเภทรหัสยืนยันสมัครสมาชิก','code_user_reg_type','2','select','ประเภทรหัสยืนยันของการสมัครสมาชิก',11),(362,1,1,'code','ประเภทรหัสยืนยันเข้าสู่ระบบผู้ใช้','code_user_login_type','2','select','ประเภทรหัสยืนยันของการเข้าสู่ระบบของผู้ใช้',12),(363,1,1,'code','ประเภทรหัสยืนยันกู้รหัสผ่าน','code_user_uppsw_type','2','select','ประเภทรหัสยืนยันของการกู้คืนรหัสผ่าน',13),(364,1,1,'code','ประเภทรหัสยืนยันแสดงความคิดเห็น','code_user_getpsw_type','2','select','ประเภทรหัสยืนยันของการแสดงความคิดเห็น',14),(365,1,1,'code','ประเภทรหัสยืนยันโพสต์กระทู้','code_replay_type','1','select','ประเภทรหัสยืนยันของการตั้งกระทู้',15),(366,1,1,'code','ประเภทรหัสยืนยันตอบกลับกระทู้','code_bbs_post_type','1','select','ประเภทรหัสยืนยันของการตอบกลับกระทู้',16),(367,1,1,'code','ประเภทคลังคำถามรหัสยืนยัน','code_bbs_replay_type','1','select','ประเภทคลังคำถามของรหัสยืนยันแบบถามตอบ',17),(368,1,1,'cache','แคชหน้าแรกทั้งเว็บ','cache_index','300','input','เวลาแคชหน้าแรกของทั้งเว็บไซต์',17),(369,1,1,'cache','แคชหน้าแรกโมดูล','cache_module_index','300','input','เวลาแคชหน้าแรกของโมดูล',18),(370,1,1,'cache','แคชหน้าแรกหมวดหมู่โมดูล','cache_module_tindex','300','input','เวลาแคชหน้าแรกหมวดหมู่ของโมดูล',19),(371,1,1,'cache','แคชหน้าแรกจัดอันดับโมดูล','cache_module_topindex','36000','input','เวลาแคชหน้าแรกการจัดอันดับของโมดูล',20),(372,1,1,'cache','แคชรายการโมดูล','cache_module_type','600','input','เวลาแคชรายการของโมดูล',21),(373,1,1,'cache','แคชความคิดเห็นโมดูล','cache_module_replay','600','input','เวลาแคชรายการความคิดเห็นของโมดูล',22),(374,1,1,'cache','แคชค้นหาโมดูล','cache_module_search','600','input','เวลาแคชรายการค้นหาของโมดูล',23),(375,1,1,'cache','แคชรายการจัดอันดับโมดูล','cache_module_toplist','36000','input','เวลาแคชรายการจัดอันดับของโมดูล',24),(376,1,1,'cache','แคชเนื้อหาโมดูล','cache_module_content','1800','input','เวลาแคชเนื้อหาโมดูล',25),(377,1,1,'cache','แคชสารบัญโมดูล','cache_module_menu','1800','input','เวลาแคชสารบัญของโมดูล',26),(378,1,1,'cache','แคชรายละเอียดโมดูล','cache_module_info','360000','input','เวลาแคชหน้ารายละเอียดของโมดูล',27),(379,1,2,'article','อัปเดตบทความสร้าง HTML อัตโนมัติ','auto_create_html','0','select','สร้าง HTML อัตโนมัติเมื่ออัปเดตบทความ',16),(380,1,3,'novel','อัปเดตตอนสร้าง HTML อัตโนมัติ','auto_create_html','0','select','สร้าง HTML อัตโนมัติเมื่ออัปเดตตอน',40),(381,1,8,'app','อัปเดตแอปสร้าง HTML อัตโนมัติ','auto_create_html','0','select','สร้าง HTML อัตโนมัติเมื่ออัปเดตแอป',14),(382,1,1,'system','วิธีแชร์ COOKIE','cookie_type','0','select','วิธีแชร์ cookeie ของเว็บไซต์',15),(383,1,1,'site','สวิตช์กลุ่มเว็บไซต์','site_open','0','select','เปิดหรือปิดเครือข่ายเว็บไซต์',1),(384,1,5,'replay','หมายเหตุชั้นความคิดเห็น','replay_floor_nickname','โซฟา\\r\\nม้านั่ง\\r\\nพื้น','textarea','เริ่มนับจากชั้นแรกเรียงลงมา ไม่จำกัดจำนวนชั้น',23),(385,1,5,'replay','ชื่อชั้นความคิดเห็น','replay_floor_name','ชั้น','input','ชื่อของชั้นคืออะไร เช่น “ชั้น”',24),(386,1,3,'novel','เปรียบเทียบตอน','chapter_compare','2','select','วิธีตรวจสอบว่าตอนที่บันทึกลงฐานข้อมูลเป็นตอนเดียวกัน',41),(387,1,3,'novel','เปรียบเทียบความคล้าย','chapter_compare_number','70','input','ค่าความคล้ายเท่าไรจึงถือว่าเป็นเนื้อหาเดียวกัน',42),(393,1,3,'novel','ประวัติการอ่าน','read_open','1','select','เปิดใช้การบันทึกประวัตินิยายที่อ่านหรือไม่',43),(394,1,4,'user','บัญชีผูกการเข้าสู่ระบบ API','api_login_bind','0','select','การเข้าสู่ระบบด้วยบุคคลที่สามบังคับผูกบัญชีของเว็บไซต์นี้หรือไม่',50),(395,1,1,'domain','ยืนยันโดเมนหลังบ้าน','admin_domain_access','0','select','หลังบ้านเข้าถึงได้ผ่านโดเมนเท่านั้น',14),(397,1,3,'novel','สตริงเข้ารหัสกำหนดเองของนิยาย','novel_en_str','','input','สตริงกำหนดเองที่ใช้เมื่อเข้ารหัสชื่อไฟล์นิยาย',5),(396,1,1,'system','โปรโตคอลเครือข่าย','tcp_type','http','select','ประเภทโปรโตคอล TCP ของการเข้าถึงผ่านเครือข่าย',2),(398,1,1,'upload','สวิตช์อัปโหลด','upload_open','1','select','อนุญาตให้อัปโหลดไฟล์จากหน้าเว็บหรือไม่',0),(399,1,1,'code','จำนวนเข้าสู่ระบบผิดหลังบ้าน','admin_login_error_number','5','input','จำนวนครั้งที่เข้าสู่ระบบผิดพลาดได้ในหลังบ้าน',1),(400,1,1,'code','เวลาจำกัดเข้าสู่ระบบผิดหลังบ้าน','admin_login_error_time','1440','input','ระยะเวลาล็อกการเข้าสู่ระบบหลังบ้านเมื่อผิดพลาดครบจำนวนครั้ง',1),(401,1,1,'code','จำนวนเข้าสู่ระบบผิดของผู้ใช้','user_login_error_number','5','input','จำนวนครั้งที่ผู้ใช้เข้าสู่ระบบผิดพลาดได้',3),(402,1,1,'code','เวลาจำกัดเข้าสู่ระบบผิดของผู้ใช้','user_login_error_time','1440','input','ระยะเวลาล็อกการเข้าสู่ระบบของผู้ใช้เมื่อผิดพลาดครบจำนวนครั้ง',3),(403,1,6,'link','รูปแบบลิงก์ออกภายนอก','link_url_outtype','1','select','โหมดลิงก์ออกภายนอกของลิงก์สาธารณะ',1),(404,1,14,'zt','ตรวจพารามิเตอร์หน้าหัวข้อพิเศษ','par_zt','1','radio','หน้าหัวข้อพิเศษตรวจสอบพารามิเตอร์ทั้งหมดว่าถูกต้องหรือไม่',1),(405,1,14,'zt','ตรวจสอบพารามิเตอร์หน้าความคิดเห็น','par_replay','1','radio','หน้าความคิดเห็นตรวจสอบพารามิเตอร์ทั้งหมดว่าถูกต้องหรือไม่',2),(406,1,14,'zt','เปิดโหวตหัวข้อพิเศษ','dingcai_open','0','select','เปิดใช้ฟังก์ชันโหวตถูกใจ/ไม่ถูกใจหัวข้อพิเศษหรือไม่',11),(407,1,14,'zt','เข้าสู่ระบบเพื่อโหวตหัวข้อพิเศษ','dingcai_login','1','select','การโหวตถูกใจ/ไม่ถูกใจหัวข้อพิเศษต้องเข้าสู่ระบบหรือไม่',12),(408,1,14,'zt','จำนวนโหวตขึ้นลงหัวข้อพิเศษ','dingcai_count','2','input','จำกัดจำนวนครั้งที่โหวตถูกใจ/ไม่ถูกใจหัวข้อพิเศษแต่ละรายการต่อวัน',13),(409,1,14,'zt','เปิดให้คะแนนหัวข้อพิเศษ','score_open','0','select','เปิดใช้ฟังก์ชันให้คะแนนหัวข้อพิเศษหรือไม่',14),(410,1,14,'zt','เข้าสู่ระบบเพื่อให้คะแนนหัวข้อพิเศษ','score_login','1','select','การให้คะแนนหัวข้อพิเศษต้องเข้าสู่ระบบหรือไม่',15),(411,1,14,'zt','จำนวนครั้งให้คะแนนหัวข้อพิเศษ','score_count','1','input','จำนวนครั้งที่ให้คะแนนหัวข้อพิเศษแต่ละรายการได้ต่อวัน',16),(412,1,14,'zt','สวิตช์ความคิดเห็นหัวข้อพิเศษ','replay_open','0','select','โมดูลหัวข้อพิเศษเปิดใช้ความคิดเห็นหรือไม่',17),(413,1,14,'zt','เข้าสู่ระบบเพื่อแสดงความคิดเห็นหัวข้อพิเศษ','replay_login','1','select','ความคิดเห็นในโมดูลหัวข้อพิเศษต้องเข้าสู่ระบบหรือไม่',18),(414,1,15,'urlmode','ตัวคั่นพารามิเตอร์ URL','urlmode_exp','/','input','อักขระคั่นพารามิเตอร์ URL',3),(415,1,15,'urlmode','นามสกุลไฟล์ URL','urlmode_suffix','.html','input','นามสกุลไฟล์ URL เว้นว่างได้',4),(416,1,15,'urlmode','ชื่อพารามิเตอร์โมดูลโหมดปกติ','urlmode_par_odnr1','module','input','ชื่อพารามิเตอร์โมดูลในโหมดปกติ',5),(417,1,15,'urlmode','ชื่อพารามิเตอร์ไฟล์โหมดปกติ','urlmode_par_odnr2','file','input','ชื่อพารามิเตอร์ไฟล์ในโหมดปกติ',6),(418,1,15,'urlmode','ชื่อพารามิเตอร์โหมดเข้ากันได้','urlmode_par_cptb','path','input','ชื่อพารามิเตอร์ในโหมดเข้ากันได้',7),(419,1,15,'urlmode','เส้นทาง URL','urlmode_route','','textarea','การจับคู่เส้นทางของพารามิเตอร์ url',8),(420,1,2,'article','วิธีบันทึกข้อมูล','data_save_type','2','radio','วิธีบันทึกข้อมูลบทความ',17),(421,1,2,'article','พาธบันทึกไฟล์','data_save_path','/files/txt/article/{#123}tid{#125}/{#123}aid{#125}.txt','input','พาธบันทึกข้อมูลบทความ',18),(422,1,1,'upload','สร้างรูปย่ออัตโนมัติ','upload_simg','1','select','เปิดใช้การสร้างภาพย่ออัตโนมัติหรือไม่',8),(423,1,1,'upload','ความกว้างที่ทริกเกอร์รูปย่อ','upload_simg_width','900','input','ความกว้างของภาพต้นฉบับที่กระตุ้นการสร้างภาพย่อ',9),(424,1,1,'upload','ความสูงที่ทริกเกอร์รูปย่อ','upload_simg_height','600','input','ความสูงของภาพต้นฉบับที่กระตุ้นการสร้างภาพย่อ',10),(425,1,1,'upload','ความกว้างรูปย่อ','upload_simgwidth','540','input','ความกว้างของภาพย่อที่สร้างขึ้น',11),(426,1,1,'upload','ความสูงรูปย่อ','upload_simgheight','370','input','ความสูงของภาพย่อที่สร้างขึ้น',12),(427,1,5,'replay','รูปแบบแสดงความคิดเห็น','replay_type','1','select','โหมดแสดงรายการความคิดเห็น',25),(428,1,5,'replay','จำนวนตอบกลับที่แสดงเริ่มต้น','replay_replay_number','5','input','จำนวนการตอบกลับที่แสดงต่อความคิดเห็นหนึ่งรายการ',26),(429,1,5,'replay','จำนวนตอบกลับต่อหน้า','replay_replay_page','10','input','จำนวนการตอบกลับที่แสดงต่อหน้า',27),(430,1,5,'replay','วิธีเรียงลำดับตอบกลับ','replay_replay_order','replay_time','select','วิธีเรียงลำดับการตอบกลับความคิดเห็น',28),(431,1,4,'user','ล้างโหวตแนะนำเมื่อเข้าสู่ระบบ','login_clear_ticket','0','select','การเข้าสู่ระบบล้างโหวตแนะนำหรือไม่',55),(432,1,11,'author','รูปแบบรายได้ผู้แต่ง','author_income_type','2','select','รูปแบบการชำระรายได้ของผู้แต่ง',34),(433,1,11,'author','รูปแบบคำขอการเงินสถิติการขาย','author_finance_apply_type','1','select','โหมดการยื่นเรื่องการเงินจากสถิติการขาย',35),(434,1,1,'system','บันทึกการส่ง SMS','tellog_open','1','select','บันทึกประวัติการส่ง SMS หรือไม่',13),(435,1,16,'dev','การแจ้งเตือนล่วงหน้า','warning_open','0','select','เปิดใช้การแจ้งเตือนล่วงหน้าหรือไม่',1),(436,1,16,'dev','ช่องทางแจ้งเตือน','warning_channel','','select','ช่องทางแจ้งเตือนล่วงหน้า',2),(437,1,16,'dev','ช่องทาง WebHook','warning_hook_channel','','select','ช่องทางแจ้งเตือน webhook',3),(438,1,16,'dev','ผู้รับช่องทางแจ้งเตือน','warning_receive','','input','ผู้รับการแจ้งเตือนล่วงหน้า',4),(439,1,16,'dev','ประเภทการแจ้งเตือน','warning_type','','check','ประเภทการแจ้งเตือนล่วงหน้า',5),(440,1,3,'novel','พาธเก็บไฟล์นิยาย','novel_mp3_save','/files/audio/novel/{#123}tid{#125}/{#123}nid{#125}/index.mp3','input','พาธเก็บไฟล์ mp3 หลักของหนังสือเสียงที่สร้างจากนิยาย',6),(441,1,3,'novel','พาธเก็บตอนนิยาย','chapter_mp3_save','/files/audio/novel/{#123}tid{#125}/{#123}nid{#125}/{#123}cid{#125}.mp3','input','พาธเก็บไฟล์ mp3 ของแต่ละตอนของหนังสือเสียงที่สร้างจากนิยาย',6);
DROP TABLE IF EXISTS `wm_config_field`;
CREATE TABLE `wm_config_field` (
  `field_id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อฟิลด์',
  `field_module` varchar(20) NOT NULL COMMENT 'โมดูลที่สังกัด',
  `field_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=ฟิลด์หมวดหมู่ 2=ฟิลด์เนื้อหา',
  `field_type_id` int NOT NULL COMMENT 'ID ของหมวดหมู่ที่สังกัด',
  `field_type_child` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'มีผลกับหมวดหมู่ย่อยหรือไม่',
  `field_type_pids` varchar(50) NOT NULL DEFAULT '0' COMMENT 'ความสัมพันธ์ระดับของหมวดหมู่',
  `field_option` varchar(2000) NOT NULL COMMENT 'ตัวเลือก',
  PRIMARY KEY (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางฟิลด์ที่สร้างเอง';
DROP TABLE IF EXISTS `wm_config_field_value`;
CREATE TABLE `wm_config_field_value` (
  `value_id` int NOT NULL AUTO_INCREMENT,
  `value_field_id` int NOT NULL COMMENT 'id ของตัวเลือก',
  `value_field_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลของค่า',
  `value_field_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ประเภทของค่า',
  `value_content_id` int NOT NULL DEFAULT '0' COMMENT 'id ของเนื้อหา ค่าเริ่มต้น 0',
  `field_option` varchar(2000) DEFAULT NULL COMMENT 'หัวข้อของตัวเลือก',
  `value_option` varchar(2000) NOT NULL COMMENT 'ค่าของตัวเลือก',
  PRIMARY KEY (`value_id`),
  KEY `value_field_id` (`value_field_id`),
  KEY `value_module_type_id` (`value_field_module`,`value_field_type`,`value_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ค่าของฟิลด์ที่สร้างเอง';
DROP TABLE IF EXISTS `wm_config_group`;
CREATE TABLE `wm_config_group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อกลุ่ม',
  `group_remark` varchar(60) DEFAULT NULL COMMENT 'ข้อมูลหมายเหตุกลุ่ม',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='การจัดกลุ่มการตั้งค่า';
INSERT INTO `wm_config_group` VALUES (1,'web','กลุ่มการตั้งค่าระบบ'),(2,'article','กลุ่มการตั้งค่าบทความ'),(3,'novel','กลุ่มการตั้งค่านิยาย'),(4,'user','กลุ่มการตั้งค่าผู้ใช้'),(5,'replay','กลุ่มการตั้งค่าความคิดเห็น'),(6,'link','กลุ่มการตั้งค่าลิงก์เพื่อน'),(7,'picture','กลุ่มการตั้งค่าแกลเลอรี'),(8,'app','กลุ่มการตั้งค่าแอป'),(9,'bbs','กลุ่มการตั้งค่าฟอรัม'),(10,'message','กลุ่มการตั้งค่าข้อความ'),(11,'author','กลุ่มการตั้งค่าต้นฉบับ'),(12,'finance','กลุ่มการตั้งค่าการเงิน'),(13,'site','กลุ่มการตั้งค่าเครือข่ายเว็บไซต์'),(14,'zt','กลุ่มการตั้งค่าหัวข้อพิเศษ'),(15,'route','กลุ่มการตั้งค่าเส้นทาง'),(16,'dev','กลุ่มการตั้งค่าการพัฒนา');
DROP TABLE IF EXISTS `wm_config_label`;
CREATE TABLE `wm_config_label` (
  `label_id` int NOT NULL AUTO_INCREMENT,
  `label_title` varchar(60) DEFAULT NULL COMMENT 'หัวข้อแท็ก',
  `label_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อแท็ก',
  `label_value` varchar(500) DEFAULT NULL COMMENT 'ค่าของแท็ก',
  PRIMARY KEY (`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางแท็กกำหนดเอง';
DROP TABLE IF EXISTS `wm_config_option`;
CREATE TABLE `wm_config_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT,
  `config_id` int DEFAULT '0' COMMENT 'id ของการตั้งค่า',
  `option_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อตัวเลือก',
  `option_value` varchar(50) DEFAULT NULL COMMENT 'ค่าของตัวเลือก',
  `option_order` int DEFAULT '9' COMMENT 'การเรียงลำดับของตัวเลือก',
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=utf8mb3 COMMENT='ตัวเลือกการตั้งค่าระบบ';
INSERT INTO `wm_config_option` VALUES (1,7,'เปิดเว็บไซต์','1',1),(2,7,'ปิดเว็บไซต์','0',2),(3,13,'โหมดสแตติกเทียมแบบเดิม','2',2),(4,13,'โหมดไดนามิกแบบเดิม','1',1),(5,57,'เปิดรหัสยืนยัน','1',1),(6,57,'ปิดรหัสยืนยัน','0',2),(7,73,'จีน-ตัวย่อ','zh_cn',1),(8,67,'ปิดครอปรูปอัตโนมัติ','0',1),(9,67,'เปิดครอปรูปอัตโนมัติ','1',2),(10,60,'ปิดลายน้ำ','0',1),(11,60,'เปิดลายน้ำ','1',2),(12,63,'ลายน้ำรูปภาพ','img',1),(13,63,'ลายน้ำข้อความ','text',2),(14,75,'ห้ามเข้าผ่านพร็อกซี','0',1),(15,75,'อนุญาตเข้าผ่านพร็อกซี','1',2),(16,77,'เปิดสถิติ','1',1),(17,77,'ปิดสถิติ','0',2),(18,78,'เปิดการบันทึก','1',1),(19,78,'ปิดการบันทึก','0',2),(35,80,'ปิดการตรวจสอบ','0',1),(34,80,'เปิดการตรวจสอบ','1',0),(25,79,'เปิดการตรวจสอบ','1',1),(26,79,'ปิดการตรวจสอบ','0',2),(36,81,'ค่าเริ่มต้นยังไม่ตรวจสอบ','0',2),(37,81,'ตรวจสอบตามค่าเริ่มต้น','1',1),(38,82,'ปิดการส่งต้นฉบับ','0',1),(39,82,'เปิดการส่งบทความ','1',2),(40,84,'เปิดการค้นหา','1',0),(41,84,'ปิดการค้นหา','0',1),(42,86,'เปิดโหวตขึ้นลง','1',1),(43,86,'ปิดโหวตขึ้นลง','0',2),(44,88,'ปิดบันทึกข้อผิดพลาด','0',2),(45,88,'เปิดบันทึกข้อผิดพลาด','1',1),(46,89,'ย้ายไปถังขยะก่อน','0',1),(47,89,'ลบถาวรทันที','1',2),(48,90,'ปิดความคิดเห็น','0',2),(49,90,'เปิดความคิดเห็น','1',1),(50,91,'ต้องเข้าสู่ระบบ','1',2),(51,91,'ไม่ต้องเข้าสู่ระบบ','0',1),(52,92,'เปิดการตรวจสอบ','1',2),(53,92,'ปิดการตรวจสอบ','0',1),(54,93,'เปิดการตรวจสอบ','1',2),(55,93,'ปิดการตรวจสอบ','0',1),(56,94,'เปิดการตรวจสอบ','1',2),(57,94,'ปิดการตรวจสอบ','0',1),(58,95,'เปิดการตรวจสอบ','1',2),(59,95,'ปิดการตรวจสอบ','0',1),(60,101,'เว็บอื่นลงก่อน','2',2),(61,101,'ต้นฉบับลงก่อน','1',1),(62,102,'สร้าง TXT','1',1),(63,102,'บันทึกลงฐานข้อมูลโดยตรง','2',2),(64,103,'ปิดดาวน์โหลดนิยาย','0',2),(65,103,'เปิดดาวน์โหลดนิยาย','1',1),(66,99,'สถานะรอตรวจสอบ','0',2),(67,99,'สถานะผ่าน','1',1),(68,100,'สถานะรอตรวจสอบ','0',2),(69,100,'สถานะผ่าน','1',1),(70,108,'เข้าสู่ระบบเพื่อดู','1',2),(71,108,'ไม่ต้องเข้าสู่ระบบ','0',1),(73,109,'เหรียญ 2','2',2),(72,109,'เหรียญ 1','1',1),(74,111,'ปิดโหวตขึ้นลง','0',1),(75,111,'เปิดโหวตขึ้นลง','1',2),(76,114,'ปิดการให้คะแนน','0',1),(77,114,'เปิดให้คะแนน','1',2),(78,115,'ต้องเข้าสู่ระบบ','1',1),(79,115,'ไม่ต้องเข้าสู่ระบบ','0',2),(80,116,'เปิดความคิดเห็น','1',2),(81,116,'ปิดความคิดเห็น','0',1),(82,117,'ไม่ต้องเข้าสู่ระบบ','0',1),(83,117,'ต้องเข้าสู่ระบบ','1',2),(84,118,'ปิดรายการโปรด','0',1),(85,118,'เปิดรายการโปรด','1',2),(86,119,'เปิดการแนะนำ','1',2),(87,119,'ปิดการแนะนำ','0',1),(88,120,'เปิดการติดตาม','1',2),(89,120,'ปิดการสมัครรับ','0',1),(251,311,'เปิดเติมเงิน','1',2),(250,311,'ปิดเติมเงิน','0',1),(92,122,'ปิดการค้นหา','0',1),(93,122,'เปิดการค้นหา','1',2),(94,124,'แสดงรายการ','0',1),(95,124,'ไปยังหน้าหนังสือ','1',2),(96,125,'ปิดชั้นหนังสือ','0',1),(97,125,'เปิดชั้นหนังสือ','1',2),(98,126,'เปิดสมัครสมาชิก','1',1),(99,126,'ปิดการสมัครสมาชิก','0',2),(100,127,'ปิดเข้าสู่ระบบ','0',2),(101,127,'เปิดเข้าสู่ระบบ','1',1),(102,128,'เปิดบันทึกล็อก','1',2),(103,128,'ปิดบันทึกเหตุการณ์','0',1),(104,129,'รูปโปรไฟล์เริ่มต้น','0',2),(105,129,'รูปโปรไฟล์สุ่ม','1',1),(106,131,'สถานะปกติ','1',2),(107,131,'รอตรวจสอบ','0',1),(108,147,'เปิดการตรวจสอบ','1',2),(109,147,'ไม่ต้องตรวจ','0',1),(110,148,'เปิดการตรวจสอบ','1',2),(111,148,'ไม่ต้องตรวจ','0',1),(112,149,'เปิดเช็กอิน','1',2),(113,149,'ปิดเช็กอิน','0',1),(114,150,'ปิดรางวัลเช็กอิน','0',2),(115,150,'เปิดรางวัลเช็กอิน','1',1),(116,154,'เปิดความคิดเห็น','1',2),(117,154,'ปิดความคิดเห็น','0',1),(118,155,'เปิดตั้งค่ารวม','1',2),(119,155,'ปิดการตั้งค่ารวม','0',1),(120,156,'แสดงความคิดเห็นโดยไม่ต้องเข้าสู่ระบบ','0',2),(121,156,'ต้องเข้าสู่ระบบจึงแสดงความคิดเห็น','1',1),(122,157,'สถานะตรวจสอบ','0',1),(123,157,'สถานะผ่าน','1',2),(124,160,'ปิดโหวตขึ้นลง','0',2),(125,160,'เปิดโหวตขึ้นลง','1',1),(126,170,'ปิดความคิดเห็นยอดนิยม','0',2),(127,170,'แสดงความคิดเห็นยอดนิยม','1',1),(128,175,'เปิดการตรวจสอบ','1',2),(129,175,'ปิดการตรวจสอบ','0',1),(130,176,'ปิดการยื่นคำขอ','0',2),(131,176,'เปิดการยื่นคำขอ','1',1),(132,177,'เด้งออกทันที','0',1),(133,177,'ไปยังหน้ารายละเอียด','1',2),(134,179,'ปิดการตรวจสอบ','0',2),(135,179,'เปิดการตรวจสอบ','1',1),(136,180,'ไม่จำกัดจำนวนครั้ง','0',2),(137,180,'บันทึก IP เดียววันละครั้ง','1',1),(138,181,'เปิดบันทึกการคลิก','1',1),(139,181,'ปิดบันทึกการคลิก','0',2),(140,182,'ปิดสถิติ IP','0',1),(141,182,'เปิดสถิติ IP','1',2),(142,183,'ปิดสถิติที่อยู่','0',1),(143,183,'เปิดสถิติที่อยู่','1',2),(144,184,'ไม่ต้องตรวจสอบ','1',1),(145,184,'ต้องตรวจสอบ','0',2),(146,185,'สถานะปกติ','1',1),(147,185,'สถานะตรวจสอบ','0',2),(148,187,'ปิดการตรวจสอบ','0',1),(149,187,'เปิดการตรวจสอบ','1',2),(150,188,'เปิดการตรวจสอบ','1',2),(151,188,'ปิดการตรวจสอบ','0',1),(152,189,'ไม่ต้องตรวจสอบ','1',1),(153,189,'ต้องตรวจสอบ','0',2),(154,190,'ไม่ต้องตรวจสอบ','1',2),(155,190,'ต้องตรวจสอบ','0',1),(156,191,'เปิดฟังก์ชันโหวตขึ้นลง','1',1),(157,191,'ปิดระบบโหวตขึ้นลง','0',2),(158,192,'ปิดระบบให้คะแนน','0',2),(159,192,'เปิดฟังก์ชันให้คะแนน','1',1),(160,193,'ปิดระบบความคิดเห็น','0',2),(161,193,'เปิดฟังก์ชันความคิดเห็น','1',1),(162,194,'ต้องเข้าสู่ระบบ','1',1),(163,194,'ไม่ต้องเข้าสู่ระบบ','0',2),(164,195,'เปิดการค้นหา','1',1),(165,195,'ปิดการค้นหา','0',2),(166,199,'ผู้เยี่ยมชมแสดงความคิดเห็นได้','0',2),(167,199,'ต้องเข้าสู่ระบบก่อนแสดงความคิดเห็น','1',1),(168,200,'ปิดการตรวจสอบ','0',1),(169,200,'เปิดการตรวจสอบ','1',2),(170,201,'เปิดการตรวจสอบ','1',2),(171,201,'ปิดการตรวจสอบ','0',1),(172,204,'ไม่ต้องตรวจสอบ','1',1),(173,204,'ต้องตรวจสอบ','0',2),(174,205,'เปิดดาวน์โหลด','1',2),(175,205,'ปิดดาวน์โหลด','0',1),(176,206,'เปิดฟังก์ชันโหวตขึ้นลง','1',1),(177,206,'ปิดระบบโหวตขึ้นลง','0',2),(178,208,'ปิดระบบให้คะแนน','0',2),(179,208,'เปิดฟังก์ชันให้คะแนน','1',1),(180,211,'ปิดระบบความคิดเห็น','0',2),(181,211,'เปิดฟังก์ชันความคิดเห็น','1',1),(182,212,'ต้องเข้าสู่ระบบ','1',1),(183,212,'ไม่ต้องเข้าสู่ระบบ','0',2),(184,213,'เปิดการค้นหา','1',1),(185,213,'ปิดการค้นหา','0',2),(186,215,'ปิดการตรวจสอบ','0',1),(187,215,'เปิดการตรวจสอบ','1',2),(188,216,'ปิดการตรวจสอบ','0',1),(189,216,'เปิดการตรวจสอบ','1',2),(190,217,'ผู้แต่งดูได้','1',1),(191,217,'ผู้แต่งดูไม่ได้','0',2),(192,218,'ผู้แต่งแก้ไขได้','1',1),(193,218,'ผู้แต่งแก้ไขไม่ได้','0',2),(194,219,'ผู้แต่งลบได้','1',1),(195,219,'ผู้แต่งลบไม่ได้','0',2),(196,220,'ไม่ต้องตรวจสอบ','1',1),(197,220,'ต้องตรวจสอบ','0',2),(198,221,'ไม่ต้องตรวจสอบ','1',1),(199,221,'ต้องตรวจสอบ','0',2),(200,222,'ไม่ต้องตรวจสอบ','1',1),(201,222,'ต้องตรวจสอบ','0',2),(202,223,'เปิดการตั้งกระทู้','1',1),(203,223,'ปิดการตั้งกระทู้','0',2),(227,268,'ไปยังศูนย์ผู้ใช้','jump',2),(206,237,'เปิดการค้นหา','1',1),(207,237,'ปิดการค้นหา','0',2),(208,243,'MYSQL','mysql',1),(209,244,'เปิดข้อความ','1',1),(210,244,'ปิดข้อความ','0',2),(211,210,'ไม่ต้องเข้าสู่ระบบ','0',1),(212,210,'ต้องเข้าสู่ระบบ','1',2),(213,250,'ปิดแคช','0',1),(214,250,'เปิดแคช','1',2),(215,251,'แคชไฟล์','file',1),(216,251,'แคช redis','redis',2),(217,251,'แคช memcached','memcached',3),(218,261,'แคชหน้า','page',1),(219,261,'แคชบล็อก','block',2),(220,262,'ปิดแคช sql','0',1),(221,262,'เปิดแคช sql','1',2),(222,265,'ปิดแคชคิว','0',1),(223,265,'เปิดแคชคิว','1',2),(226,268,'รีเฟรชหน้านี้','ref',1),(225,389,'แคชไฟล์','file',1),(204,224,'เปิดการตอบกลับ','1',1),(205,224,'ปิดการตอบกลับ','0',2),(228,269,'ตรวจสอบด้วยตนเอง','0',1),(229,269,'ตรวจสอบอัตโนมัติ','1',2),(230,270,'ปิดการขอเอง','0',1),(231,270,'เปิดยื่นคำขอด้วยตนเอง','1',2),(232,274,'ตรวจสอบอัตโนมัติ','1',2),(233,274,'ตรวจสอบโดยคน','0',1),(234,275,'ตรวจสอบโดยคน','0',1),(235,275,'ตรวจสอบอัตโนมัติ','1',2),(236,278,'ตรวจสอบโดยคน','0',1),(237,278,'ตรวจสอบอัตโนมัติ','1',2),(238,285,'ตรวจสอบโดยคน','0',1),(239,285,'ตรวจสอบอัตโนมัติ','1',2),(240,286,'ตรวจสอบโดยคน','0',1),(241,286,'ตรวจสอบอัตโนมัติ','1',2),(242,293,'ตรวจสอบโดยคน','0',1),(243,293,'ตรวจสอบอัตโนมัติ','1',2),(244,294,'ตรวจสอบโดยคน','0',1),(245,294,'ตรวจสอบอัตโนมัติ','1',2),(246,301,'ไม่ใช้ HTML','0',1),(247,301,'ใช้ HTML','1',2),(248,302,'เปิดอัปโหลดอัตโนมัติ','1',1),(249,302,'ปิดอัปโหลดอัตโนมัติ','0',2),(252,312,'ปิดการแลก','0',1),(253,312,'เปิดการแลก','1',2),(254,313,'ปิดการแลก','0',1),(255,313,'เปิดการแลก','1',2),(256,314,'ปิดการแลก','0',1),(257,314,'เปิดการแลก','1',2),(258,315,'ปิดการแลก','0',1),(259,315,'เปิดการแลก','1',2),(260,316,'ปิดการถอนเงิน','0',1),(261,316,'เปิดถอนเงิน','1',2),(262,121,'ปิดการให้เหรียญ','0',1),(263,121,'เปิดรางวัลด้วยเหรียญ','1',2),(264,334,'ปิดการให้ของขวัญ','0',1),(265,334,'เปิดส่งของขวัญ','1',2),(266,335,'ไม่ต้องเข้าสู่ระบบ','0',1),(267,335,'ต้องเข้าสู่ระบบ','1',2),(268,336,'ข้อความแท็กหน้า','1',1),(269,336,'ข้อความหน้าแสดงข้อผิดพลาดทั่วไป','2',2),(270,339,'ปิดกิจกรรม','0',1),(271,339,'เปิดกิจกรรม','1',2),(272,344,'บันทึกในเครื่อง','0',1),(273,344,'Alibaba Cloud OSS','oss',2),(274,344,'Tencent Cloud COS','cos',3),(275,344,'คลาวด์ Qiniu','qiniu',4),(276,344,'Sina Cloud','scs',5),(277,346,'ปิดการให้คะแนน','0',1),(278,346,'เปิดให้คะแนน','1',2),(279,347,'ไม่ต้องเข้าสู่ระบบ','0',1),(280,347,'ต้องเข้าสู่ระบบ','1',2),(281,348,'ไม่ต้องเข้าสู่ระบบ','0',1),(282,348,'ต้องเข้าสู่ระบบ','1',2),(283,350,'ไม่ต้องเข้าสู่ระบบ','0',1),(284,350,'ต้องเข้าสู่ระบบ','1',2),(285,351,'ตรวจจับการเปลี่ยนเส้นทางอัตโนมัติ','1',1),(286,351,'ไม่ต้องตรวจจับการเปลี่ยนเส้นทาง','0',2),(287,352,'เปิดรหัสยืนยัน','1',1),(288,352,'ปิดรหัสยืนยัน','0',2),(289,353,'เปิดรหัสยืนยัน','1',1),(290,353,'ปิดรหัสยืนยัน','0',2),(291,354,'เปิดรหัสยืนยัน','1',1),(292,354,'ปิดรหัสยืนยัน','0',2),(293,355,'เปิดรหัสยืนยัน','1',1),(294,355,'ปิดรหัสยืนยัน','0',2),(295,356,'เปิดรหัสยืนยัน','1',1),(296,356,'ปิดรหัสยืนยัน','0',2),(297,357,'เปิดรหัสยืนยัน','1',1),(298,357,'ปิดรหัสยืนยัน','0',2),(299,358,'เปิดรหัสยืนยัน','1',1),(300,358,'ปิดรหัสยืนยัน','0',2),(301,360,'รหัสยืนยันทั่วไป','1',1),(302,360,'คำนวณรหัสยืนยัน','2',2),(303,360,'รหัสยืนยันแบบถามตอบ','3',3),(304,361,'รหัสยืนยันทั่วไป','1',1),(305,361,'คำนวณรหัสยืนยัน','2',2),(306,361,'รหัสยืนยันแบบถามตอบ','3',3),(307,362,'รหัสยืนยันทั่วไป','1',1),(308,362,'คำนวณรหัสยืนยัน','2',2),(309,362,'รหัสยืนยันแบบถามตอบ','3',3),(310,363,'รหัสยืนยันทั่วไป','1',1),(311,363,'คำนวณรหัสยืนยัน','2',2),(312,363,'รหัสยืนยันแบบถามตอบ','3',3),(313,364,'รหัสยืนยันทั่วไป','1',1),(314,364,'คำนวณรหัสยืนยัน','2',2),(315,364,'รหัสยืนยันแบบถามตอบ','3',3),(316,365,'รหัสยืนยันทั่วไป','1',1),(317,365,'คำนวณรหัสยืนยัน','2',2),(318,365,'รหัสยืนยันแบบถามตอบ','3',3),(319,366,'รหัสยืนยันทั่วไป','1',1),(320,366,'คำนวณรหัสยืนยัน','2',2),(321,366,'รหัสยืนยันแบบถามตอบ','3',3),(322,367,'รหัสยืนยันทั่วไป','1',1),(323,367,'คำนวณรหัสยืนยัน','2',2),(324,367,'รหัสยืนยันแบบถามตอบ','3',3),(325,379,'ไม่สร้าง HTML','0',1),(326,379,'สร้าง HTML','1',2),(327,380,'ไม่สร้าง HTML','0',1),(328,380,'สร้าง HTML','1',2),(329,381,'ไม่สร้าง HTML','0',1),(330,381,'สร้าง HTML','1',2),(331,382,'เฉพาะโดเมนหลัก/ย่อย','0',1),(332,382,'แชร์โดเมนหลัก/ย่อย','1',2),(333,383,'ปิดโหมดหลายเว็บไซต์','0',1),(334,383,'เปิดโหมดกลุ่มเว็บไซต์','1',2),(335,28,'ปิดบันทึกการส่ง','0',1),(336,386,'เทียบเฉพาะชื่อตอน','1',1),(337,386,'เทียบเนื้อหาและชื่อ','2',2),(340,28,'เปิดบันทึกการส่ง','1',2),(341,389,'แคช redis','redis',2),(342,389,'แคช memcached','memcached',3),(343,390,'แคชไฟล์','file',1),(344,390,'แคช redis','redis',2),(345,390,'แคช memcached','memcached',3),(346,393,'ปิดประวัติการอ่าน','0',1),(347,393,'เปิดประวัติการอ่าน','1',2),(348,394,'บังคับผูกบัญชี','1',1),(349,394,'สร้างบัญชีอัตโนมัติ','0',2),(350,395,'ปิดยืนยันโดเมน','0',1),(351,395,'เปิดยืนยันโดเมน','1',2),(352,396,'HTTP','http',1),(353,396,'HTTPS','https',2),(354,398,'ปิดอัปโหลด','0',1),(355,398,'เปิดอัปโหลด','1',2),(356,403,'เด้งออกทันที','1',1),(357,403,'ไปยังหน้ารายละเอียด','2',2),(358,404,'เปิดการตรวจสอบ','1',1),(359,404,'ปิดการตรวจสอบ','0',2),(360,405,'เปิดการตรวจสอบ','1',1),(361,405,'ปิดการตรวจสอบ','0',2),(362,406,'เปิดโหวตขึ้นลง','1',1),(363,406,'ปิดโหวตขึ้นลง','0',2),(364,407,'ต้องเข้าสู่ระบบ','1',1),(365,407,'ไม่ต้องเข้าสู่ระบบ','0',2),(366,409,'เปิดให้คะแนน','1',1),(367,409,'ปิดการให้คะแนน','0',2),(368,410,'ต้องเข้าสู่ระบบ','1',1),(369,410,'ไม่ต้องเข้าสู่ระบบ','0',2),(370,412,'เปิดความคิดเห็น','1',1),(371,412,'ปิดความคิดเห็น','0',2),(372,413,'ต้องเข้าสู่ระบบ','1',1),(373,413,'ไม่ต้องเข้าสู่ระบบ','0',2),(374,13,'โหมดปกติ','3',3),(375,13,'โหมดเข้ากันได้','4',4),(376,13,'โหมด PATHINFO','5',5),(377,13,'โหมด REWRITE','6',6),(378,420,'บันทึกลงฐานข้อมูล','1',1),(379,420,'บันทึกลงไฟล์','2',2),(380,422,'ปิดสร้างอัตโนมัติ','0',1),(381,422,'เปิดสร้างอัตโนมัติ','1',2),(382,427,'โหมดรายการ','1',1),(383,427,'โหมดผู้ตั้งกระทู้','2',2),(384,430,'ล่าสุด','replay_time',1),(385,430,'ยอดนิยม','replay_ding',2),(386,430,'ลำดับ','replay_id',3),(387,431,'ไม่ล้างข้อมูล','0',1),(388,431,'ล้างเฉพาะโหวตแนะนำ','1',2),(389,431,'ล้างเฉพาะโหวตรายเดือน','2',3),(390,431,'ล้างโหวตแนะนำและโหวตรายเดือน','3',4),(391,432,'รายได้โอนเข้าบัญชีผู้แต่งโดยตรง','1',1),(392,432,'โหมดชำระโดยคน','2',2),(393,433,'หลังอนุมัติคำขอ เงินจะโอนเข้าบัญชีผู้แต่ง','1',1),(394,433,'ไม่โอนเงิน แจ้งเตือนเท่านั้น','2',2),(395,361,'รหัสยืนยัน SMS','5',5),(396,361,'รหัสยืนยันทางอีเมล','4',4),(399,434,'ปิดบันทึกการส่ง','0',1),(400,434,'เปิดบันทึกการส่ง','1',2),(401,435,'ปิดแจ้งเตือนล่วงหน้า','0',1),(402,435,'เปิดแจ้งเตือนล่วงหน้า','1',2),(403,436,'กรุณาเลือก','',1),(404,436,'WebHook','webhook',2),(405,436,'ที่อยู่อีเมล','email',3),(406,436,'SMS มือถือ','tel',4),(407,437,'กรุณาเลือก','',1),(408,437,'DingTalk','dingding_hook',2),(409,437,'WeCom','weixinwork_hook',3),(410,439,'เข้าสู่ระบบหลังบ้าน','warning_admin_login',1),(411,439,'โค้ดผิดพลาด','warning_code_eroor',2);
DROP TABLE IF EXISTS `wm_diy_diy`;
CREATE TABLE `wm_diy_diy` (
  `diy_id` int NOT NULL AUTO_INCREMENT,
  `diy_status` tinyint(1) DEFAULT '1' COMMENT 'สถานะของหน้าเพจที่กำหนดเอง',
  `diy_read` int DEFAULT '0' COMMENT 'ยอดอ่าน',
  `diy_name` varchar(60) NOT NULL COMMENT 'ชื่อหน้าเพจที่กำหนดเอง',
  `diy_pinyin` varchar(20) NOT NULL COMMENT 'พินอิน',
  `diy_title` varchar(100) DEFAULT NULL COMMENT 'หัวข้อ',
  `diy_key` varchar(120) DEFAULT NULL COMMENT 'คำค้นหา',
  `diy_desc` varchar(150) DEFAULT NULL COMMENT 'คำอธิบาย',
  `diy_content` varchar(2000) NOT NULL COMMENT 'เนื้อหา',
  `diy_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  `diy_ctempid` int DEFAULT '0' COMMENT 'id เทมเพลตของหัวข้อพิเศษ',
  PRIMARY KEY (`diy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหน้ากำหนดเอง';
DROP TABLE IF EXISTS `wm_editor`;
CREATE TABLE `wm_editor` (
  `editor_id` int NOT NULL AUTO_INCREMENT,
  `editor_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'เปิดใช้งานหรือไม่: 1=ใช่, 0=ไม่ใช่',
  `editor_uid` int NOT NULL COMMENT 'id ผู้ใช้',
  `editor_name` varchar(60) NOT NULL COMMENT 'ชื่อบรรณาธิการ',
  `editor_realname` varchar(20) NOT NULL COMMENT 'ชื่อ-นามสกุลจริงของบรรณาธิการ',
  `editor_desc` varchar(200) NOT NULL COMMENT 'เรื่องย่อของบรรณาธิการ',
  `editor_qq` varchar(20) DEFAULT NULL COMMENT 'qq ของบรรณาธิการ',
  `editor_weixin` varchar(50) DEFAULT NULL COMMENT 'บัญชี WeChat ของบรรณาธิการ',
  `editor_tel` varchar(11) DEFAULT NULL COMMENT 'หมายเลขมือถือของบรรณาธิการ',
  `editor_time` int NOT NULL COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบรรณาธิการ';
DROP TABLE IF EXISTS `wm_editor_bind`;
CREATE TABLE `wm_editor_bind` (
  `bind_id` int NOT NULL AUTO_INCREMENT,
  `bind_module` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูล',
  `bind_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ประเภทบรรณาธิการ:1=บรรณาธิการใหญ่,2=บรรณาธิการดูแลต้นฉบับ',
  `bind_group_id` int NOT NULL COMMENT 'id กลุ่ม',
  `bind_editor_id` int NOT NULL DEFAULT '0' COMMENT 'id บรรณาธิการ',
  `bind_time` int NOT NULL COMMENT 'เวลาผูกบัญชี',
  PRIMARY KEY (`bind_id`),
  KEY `module_index` (`bind_module`),
  KEY `group_index` (`bind_group_id`),
  KEY `editor_index` (`bind_editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='การผูกกลุ่มบรรณาธิการ';
DROP TABLE IF EXISTS `wm_editor_group`;
CREATE TABLE `wm_editor_group` (
  `group_id` int NOT NULL AUTO_INCREMENT COMMENT 'id กลุ่ม',
  `group_module` varchar(20) NOT NULL DEFAULT 'novel' COMMENT 'โมดูลกลุ่ม',
  `group_name` varchar(60) NOT NULL COMMENT 'ชื่อกลุ่ม',
  `group_desc` varchar(100) NOT NULL COMMENT 'คำอธิบายกลุ่ม',
  `group_order` tinyint NOT NULL DEFAULT '9' COMMENT 'ลำดับกลุ่ม',
  `group_time` int NOT NULL COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='กลุ่มบรรณาธิการ';
DROP TABLE IF EXISTS `wm_editor_works`;
CREATE TABLE `wm_editor_works` (
  `works_id` int NOT NULL AUTO_INCREMENT,
  `works_module` varchar(20) NOT NULL DEFAULT 'novel' COMMENT 'โมดูล',
  `works_group_id` int NOT NULL COMMENT 'id กลุ่มของบรรณาธิการ',
  `works_cid` int NOT NULL COMMENT 'id ผลงาน',
  `works_bind_id` int DEFAULT '0' COMMENT 'id ผูกกลุ่ม',
  `works_editor_id` int DEFAULT '0' COMMENT 'id บรรณาธิการ',
  `works_time` int NOT NULL COMMENT 'เวลายื่นคำขอ',
  PRIMARY KEY (`works_id`),
  KEY `module_index` (`works_module`),
  KEY `group_index` (`works_group_id`),
  KEY `cid_index` (`works_cid`),
  KEY `bind_index` (`works_bind_id`),
  KEY `editor_index` (`works_editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ตารางความสัมพันธ์ระหว่างบรรณาธิการกับผลงาน';
DROP TABLE IF EXISTS `wm_fans_module`;
CREATE TABLE `wm_fans_module` (
  `fans_id` int NOT NULL AUTO_INCREMENT,
  `fans_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่สังกัด',
  `fans_user_id` int NOT NULL COMMENT 'id แฟนคลับ',
  `fans_cid` int DEFAULT NULL COMMENT 'id เนื้อหา',
  `fans_exp` int DEFAULT '0' COMMENT 'ค่าประสบการณ์แฟนคลับ',
  `fans_addtime` int DEFAULT NULL COMMENT 'เวลาติดตาม',
  PRIMARY KEY (`fans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางแฟนคลับเนื้อหาโมดูล.';
DROP TABLE IF EXISTS `wm_fans_module_consume`;
CREATE TABLE `wm_fans_module_consume` (
  `consume_id` int NOT NULL AUTO_INCREMENT,
  `consume_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่ใช้จ่าย',
  `consume_user_id` int DEFAULT NULL COMMENT 'id ผู้ใช้',
  `consume_cid` int DEFAULT NULL COMMENT 'id เนื้อหา',
  `consume_gold1_exp` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของค่าประสบการณ์แฟนคลับ1',
  `consume_gold2_exp` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของค่าประสบการณ์แฟนคลับ2',
  `consume_gold1_ticket` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของประเภทโหวต1',
  `consume_gold2_ticket` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้สะสมในระยะปัจจุบันของประเภทโหวต2',
  `consume_gold1` decimal(15,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้จ่ายทั้งหมด 1',
  `consume_gold2` decimal(15,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้จ่ายทั้งหมด 2',
  PRIMARY KEY (`consume_id`),
  KEY `user_index` (`consume_module`,`consume_user_id`,`consume_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการใช้จ่ายของแฟนคลับเนื้อหาโมดูล';
DROP TABLE IF EXISTS `wm_fans_module_level`;
CREATE TABLE `wm_fans_module_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_module` varchar(20) NOT NULL COMMENT 'โมดูลของระดับ',
  `level_cid` int NOT NULL DEFAULT '0' COMMENT '0=เนื้อหาทั้งหมด ค่าอื่น=ระดับแฟนที่กำหนดเอง',
  `level_name` varchar(60) NOT NULL COMMENT 'ชื่อระดับ',
  `level_start` int NOT NULL DEFAULT '0' COMMENT 'ประสบการณ์เริ่มต้นของระดับ',
  `level_end` int NOT NULL DEFAULT '0' COMMENT 'ประสบการณ์สิ้นสุดของระดับ',
  `level_order` int NOT NULL DEFAULT '0' COMMENT 'การเรียงลำดับระดับ',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางระดับแฟนคลับเนื้อหาโมดูล';
INSERT INTO `wm_fans_module_level` VALUES (1,'novel',0,'ศิษย์ฝึกปราณ',0,500,1),(2,'novel',0,'ศิษย์สร้างฐาน',500,1000,2),(3,'novel',0,'ศิษย์ประตูชั้นนอก',1000,2000,3),(4,'novel',0,'ศิษย์ประตูชั้นใน',2000,4000,4),(5,'novel',0,'ศิษย์สายตรง',4000,6000,5),(6,'novel',0,'ผู้ดูแลศิษย์นอกสำนักขั้นตานลวง',6000,10000,6),(7,'novel',0,'ผู้ดูแลศิษย์ในสำนักขั้นตานทอง',10000,20000,7),(8,'novel',0,'ผู้พิทักษ์ธรรมระดับหยวนอิง',20000,30000,8),(9,'novel',0,'ผู้อาวุโสระดับออกร่าง',30000,50000,9),(10,'novel',0,'รองเจ้าสำนักระดับแปลงจิต',50000,60000,10),(11,'novel',0,'เจ้าสำนักระดับรวมร่าง',60000,70000,11),(12,'novel',0,'เจ้าสำนักขั้นต้งซวี',70000,80000,12),(13,'novel',0,'ประมุขพันธมิตรระดับมหายาน',80000,100000,13);
DROP TABLE IF EXISTS `wm_finance_apply`;
CREATE TABLE `wm_finance_apply` (
  `apply_id` int NOT NULL AUTO_INCREMENT,
  `apply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=รอตรวจสอบ 1=ดำเนินการแล้ว 2=ไม่ผ่าน',
  `apply_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลต้นทางของการชำระบัญชี สามารถเว้นว่างได้',
  `apply_cid` int NOT NULL DEFAULT '0' COMMENT 'ID เนื้อหาโมดูล',
  `apply_month` int NOT NULL COMMENT 'เดือนของการชำระบัญชี',
  `apply_time` int NOT NULL COMMENT 'เวลาของการชำระบัญชี',
  `apply_manager_id` int NOT NULL COMMENT 'ผู้ยื่นคำขอชำระบัญชี',
  `apply_total` decimal(10,2) NOT NULL COMMENT 'ยอดรวมของคำขอชำระบัญชี',
  `apply_bonus` decimal(10,2) DEFAULT NULL COMMENT 'จำนวนเงินรางวัล',
  `apply_bonus_remark` varchar(60) DEFAULT NULL COMMENT 'หมายเหตุรางวัล',
  `apply_deduct` decimal(10,2) DEFAULT NULL COMMENT 'หมายเหตุการลงโทษ',
  `apply_deduct_remark` varchar(60) DEFAULT NULL COMMENT 'หมายเหตุการลงโทษ',
  `apply_real` decimal(10,2) NOT NULL COMMENT 'จำนวนเงินที่เข้าบัญชีจริง',
  `apply_real_money` decimal(10,2) DEFAULT '0.00' COMMENT 'ยอดเงินหยวนที่เข้าจริง 0=โหมด 1',
  `apply_remark` varchar(60) DEFAULT NULL COMMENT 'หมายเหตุคำขอชำระบัญชี',
  `apply_to_user_id` int NOT NULL DEFAULT '0' COMMENT 'ผู้ใช้ที่ได้รับคำขอชำระบัญชี',
  `apply_handle_manager_id` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ดูแลระบบที่พิจารณาคำขอ',
  `apply_handle_remark` varchar(60) DEFAULT NULL COMMENT 'หมายเหตุการพิจารณาคำขอ',
  `apply_handle_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาพิจารณาคำขอ',
  PRIMARY KEY (`apply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกคำขอด้านการเงิน';
DROP TABLE IF EXISTS `wm_finance_level`;
CREATE TABLE `wm_finance_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_money` int NOT NULL DEFAULT '0' COMMENT 'จำนวนเงินที่เติม',
  `level_real` int NOT NULL DEFAULT '0' COMMENT 'ราคาที่ต้องชำระหลังส่วนลด',
  `level_reward_gold2` int NOT NULL DEFAULT '0' COMMENT 'เหรียญที่แจกให้2',
  PRIMARY KEY (`level_id`),
  KEY `money_index` (`level_money`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางระดับการเติมเงิน';
INSERT INTO `wm_finance_level` VALUES (1,10,10,0),(2,20,20,0),(3,50,50,0),(4,100,100,0),(5,200,200,0),(7,500,500,100),(8,80,80,0),(9,150,150,0);
DROP TABLE IF EXISTS `wm_finance_order_cash`;
CREATE TABLE `wm_finance_order_cash` (
  `cash_id` int NOT NULL AUTO_INCREMENT,
  `cash_status` tinyint(1) DEFAULT '0' COMMENT '0=รอพิจารณา 1=ดำเนินการแล้ว 2=ถูกปฏิเสธ',
  `cash_user_id` int NOT NULL COMMENT 'ผู้ใช้ที่ยื่นคำขอ',
  `cash_money` decimal(10,2) NOT NULL COMMENT 'จำนวนเงินที่ถอน',
  `cash_real` decimal(10,2) NOT NULL COMMENT 'ยอดเงินเข้าบัญชีจริง',
  `cash_cost` tinyint NOT NULL DEFAULT '0' COMMENT 'ค่าธรรมเนียมการถอนเงิน',
  `cash_remark` varchar(200) DEFAULT NULL COMMENT 'ข้อมูลหมายเหตุ',
  `cash_time` int DEFAULT '0' COMMENT 'เวลายื่นคำขอ',
  `cash_handletime` int DEFAULT '0' COMMENT 'เวลาดำเนินการ',
  PRIMARY KEY (`cash_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางคำสั่งซื้อคำขอถอนเงิน';
DROP TABLE IF EXISTS `wm_finance_order_charge`;
CREATE TABLE `wm_finance_order_charge` (
  `charge_id` int NOT NULL AUTO_INCREMENT,
  `charge_sn` varchar(60) NOT NULL COMMENT 'หมายเลขคำสั่งซื้อเติมเงินของเว็บไซต์นี้',
  `charge_paysn` varchar(60) DEFAULT NULL COMMENT 'หมายเลขคำสั่งซื้อการเติมเงินของบุคคลที่สาม',
  `charge_status` tinyint(1) DEFAULT '0' COMMENT 'สถานะคำสั่งซื้อ 0 คือรอชำระเงิน 1 คือชำระเงินแล้ว',
  `charge_type` varchar(20) NOT NULL COMMENT 'วิธีเติมเงิน card=เติมด้วยรหัสบัตร',
  `charge_user_id` int NOT NULL DEFAULT '0' COMMENT 'ผู้ใช้ที่เติมเงิน',
  `charge_tuser_id` int NOT NULL DEFAULT '0' COMMENT 'id เพื่อน',
  `charge_money` decimal(10,2) DEFAULT NULL COMMENT 'จำนวนเงินเติม',
  `charge_gold2` decimal(10,2) DEFAULT NULL COMMENT 'เหรียญที่ได้รับ2',
  `charge_first` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'มีรางวัลเติมเงินครั้งแรกหรือไม่',
  `charge_reward` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'มีรางวัลเติมเงินหรือไม่',
  `charge_addtime` int DEFAULT '0' COMMENT 'เวลาสั่งซื้อ',
  `charge_paytime` int DEFAULT '0' COMMENT 'เวลาชำระเงิน',
  `charge_remark` varchar(200) DEFAULT NULL COMMENT 'หมายเหตุ',
  PRIMARY KEY (`charge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='บันทึกการเติมเงิน';
DROP TABLE IF EXISTS `wm_finance_report`;
CREATE TABLE `wm_finance_report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_settlement` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'คำนวณหรือไม่: 0=ยังไม่ชำระ, 1=ชำระแล้ว',
  `report_module` varchar(20) DEFAULT NULL COMMENT 'โมดูล',
  `report_type` varchar(20) DEFAULT NULL COMMENT 'ประเภท',
  `report_user_id` int NOT NULL DEFAULT '0' COMMENT 'ID ผู้ใช้ที่ใช้จ่ายหรือรับรายได้',
  `report_cid` varchar(35) NOT NULL DEFAULT '0' COMMENT 'id เนื้อหาที่ซื้อ หรือ id ต้นทาง',
  `report_gold1` decimal(10,3) DEFAULT '0.000' COMMENT 'จำนวนเหรียญ1 ที่ต้องชำระบัญชี',
  `report_gold2` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT 'จำนวนเหรียญ2 ที่ต้องชำระบัญชี',
  `report_remark` varchar(100) DEFAULT NULL COMMENT 'ข้อมูลหมายเหตุ',
  `report_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาบันทึกเข้าบัญชี',
  `report_settlement_id` int NOT NULL DEFAULT '0' COMMENT 'ID ผู้ชำระบัญชี',
  `report_settlement_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาชำระบัญชี',
  PRIMARY KEY (`report_id`),
  KEY `module_index` (`report_module`),
  KEY `type_index` (`report_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='รายงานการขาย';
DROP TABLE IF EXISTS `wm_finance_report_list`;
CREATE TABLE `wm_finance_report_list` (
  `list_id` int NOT NULL AUTO_INCREMENT,
  `list_report_id` int NOT NULL DEFAULT '0' COMMENT 'id รายงานการชำระบัญชี',
  `list_order_id` int NOT NULL DEFAULT '0' COMMENT 'id คำสั่งซื้อที่ชำระบัญชี',
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกความเชื่อมโยงของคำสั่งซื้อที่ชำระบัญชี';
DROP TABLE IF EXISTS `wm_finance_report_order`;
CREATE TABLE `wm_finance_report_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_gold1` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญของคำสั่งซื้อ1',
  `order_gold2` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญของคำสั่งซื้อ2',
  `order_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ยอดเงินของคำสั่งซื้อ',
  `order_admin_id` int NOT NULL DEFAULT '0' COMMENT 'ผู้ชำระบัญชี',
  `order_time` int NOT NULL DEFAULT '0' COMMENT 'การชำระบัญชี',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='บันทึกคำสั่งซื้อที่ชำระบัญชี';
DROP TABLE IF EXISTS `wm_flash_flash`;
CREATE TABLE `wm_flash_flash` (
  `flash_id` int NOT NULL AUTO_INCREMENT,
  `flash_status` tinyint(1) DEFAULT '1' COMMENT 'สถานะ',
  `type_id` int NOT NULL DEFAULT '0' COMMENT 'กลุ่มสไลด์',
  `flash_order` int NOT NULL COMMENT 'เรียงลำดับ',
  `flash_module` varchar(20) NOT NULL COMMENT 'อยู่ในโมดูลใด',
  `flash_pid` int NOT NULL COMMENT 'id หน้าเพจ',
  `flash_title` varchar(60) NOT NULL COMMENT 'หัวข้อ',
  `flash_info` varchar(100) DEFAULT NULL COMMENT 'เรื่องย่อ',
  `flash_desc` varchar(200) NOT NULL COMMENT 'คำอธิบาย',
  `flash_url` varchar(200) NOT NULL COMMENT 'ที่อยู่ปลายทาง',
  `flash_img` varchar(500) DEFAULT NULL COMMENT 'ไอคอนสไลด์',
  `flash_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`flash_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางสไลด์';
DROP TABLE IF EXISTS `wm_flash_type`;
CREATE TABLE `wm_flash_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL DEFAULT '0' COMMENT 'ลำดับหมวดหมู่',
  `type_info` varchar(100) DEFAULT NULL COMMENT 'หมายเหตุหมวดหมู่',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางสไลด์';
DROP TABLE IF EXISTS `wm_link_click`;
CREATE TABLE `wm_link_click` (
  `click_id` int NOT NULL AUTO_INCREMENT,
  `click_lid` int NOT NULL,
  `click_type` varchar(10) NOT NULL COMMENT 'เข้าหรือออก',
  `click_ua` varchar(250) DEFAULT NULL COMMENT 'ข้อมูล UA',
  `click_ip` varchar(15) DEFAULT NULL COMMENT 'IP ที่คลิก',
  `click_adress` varchar(30) DEFAULT NULL COMMENT 'ตำแหน่งที่ตั้ง',
  `click_browser` varchar(30) DEFAULT NULL COMMENT 'เบราว์เซอร์',
  `click_browser_ver` varchar(30) DEFAULT NULL COMMENT 'เวอร์ชันเบราว์เซอร์',
  `click_system` varchar(250) DEFAULT NULL COMMENT 'ประเภทระบบ',
  `click_system_ver` varchar(30) DEFAULT NULL COMMENT 'เวอร์ชันระบบ',
  `click_time` int NOT NULL COMMENT 'เวลาคลิก',
  PRIMARY KEY (`click_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการคลิกลิงก์เพื่อน';
DROP TABLE IF EXISTS `wm_link_link`;
CREATE TABLE `wm_link_link` (
  `link_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL COMMENT 'id หมวดหมู่',
  `link_name` varchar(80) NOT NULL COMMENT 'ชื่อลิงก์เพื่อน',
  `link_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อลิงก์เพื่อน',
  `link_pinyin` varchar(20) DEFAULT NULL COMMENT 'พินอิน',
  `link_ico` varchar(120) DEFAULT NULL COMMENT 'ไอคอน',
  `link_order` int NOT NULL DEFAULT '99' COMMENT 'เรียงลำดับ',
  `link_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'สถานะ',
  `link_show` tinyint(1) DEFAULT '1' COMMENT '1=แสดงลิงก์เปลี่ยนเส้นทาง 0=ลิงก์ตรง',
  `link_url` varchar(120) NOT NULL COMMENT 'ที่อยู่ลิงก์เพื่อน',
  `link_fixed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ลิงก์ถาวร',
  `link_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำหรือไม่',
  `link_jointime` int NOT NULL DEFAULT '0' COMMENT 'เวลาเข้าร่วม',
  `link_in_jump` varchar(200) DEFAULT NULL COMMENT 'ลิงก์เปลี่ยนเส้นทางเมื่อเข้าลิงก์เพื่อน',
  `link_info` varchar(60) DEFAULT NULL COMMENT 'เรื่องย่อลิงก์เพื่อน',
  `link_qq` varchar(20) DEFAULT NULL COMMENT 'QQ ติดต่อ',
  `link_read` int NOT NULL DEFAULT '0' COMMENT 'ยอดอ่าน',
  `link_ding` int NOT NULL DEFAULT '0' COMMENT 'กดชอบ',
  `link_cai` int NOT NULL DEFAULT '0' COMMENT 'กดไม่ชอบ',
  `link_lastintime` int NOT NULL DEFAULT '0' COMMENT 'คลิกเข้าล่าสุด',
  `link_lastouttime` int NOT NULL DEFAULT '0' COMMENT 'คลิกออกล่าสุด',
  `link_outday` int NOT NULL DEFAULT '0' COMMENT 'คลิกออกรายวัน',
  `link_outweek` int NOT NULL DEFAULT '0' COMMENT 'คลิกออก (รายสัปดาห์)',
  `link_outmonth` int NOT NULL DEFAULT '0' COMMENT 'คลิกออกรายเดือน',
  `link_outyear` int DEFAULT '0' COMMENT 'คลิกออกรายปี',
  `link_outsum` int NOT NULL DEFAULT '0' COMMENT 'คลิกออกทั้งหมด',
  `link_inday` int NOT NULL DEFAULT '0' COMMENT 'คลิกเข้ารายวัน',
  `link_inweek` int NOT NULL DEFAULT '0' COMMENT 'คลิกเข้า (รายสัปดาห์)',
  `link_inmonth` int NOT NULL DEFAULT '0' COMMENT 'คลิกเข้ารายเดือน',
  `link_inyear` int DEFAULT '0' COMMENT 'คลิกเข้ารายปี',
  `link_insum` int NOT NULL DEFAULT '0' COMMENT 'คลิกเข้าทั้งหมด',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางลิงก์เพื่อน';
INSERT INTO `wm_link_link` VALUES (1,2,'WMCMS','','','',99,1,0,'http://www.weimengcms.com',1,1,1494685926,'','','',3,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,2,'ความช่วยเหลือในการใช้งาน','','','',99,1,1,'http://help.weimengcms.com',0,0,1552653211,'','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
DROP TABLE IF EXISTS `wm_link_type`;
CREATE TABLE `wm_link_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำหมวดหมู่หรือไม่',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อของประเภท',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL COMMENT 'เรียงลำดับ',
  `type_ico` varchar(200) DEFAULT NULL COMMENT 'ไอคอนหมวดหมู่',
  `type_info` varchar(100) DEFAULT NULL COMMENT 'ข้อมูลหมวดหมู่',
  `type_in_jump` varchar(200) DEFAULT NULL COMMENT 'ลิงก์ปลายทางเมื่อคลิกเข้าลิงก์เพื่อนของหมวดหมู่นี้',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าจัดแสดง',
  `type_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อหน้าเพจ',
  `type_key` varchar(100) DEFAULT NULL COMMENT 'คำค้นของหน้าเพจ',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายหน้าเพจ',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่ลิงก์เพื่อน';
INSERT INTO `wm_link_type` VALUES (2,0,'0',0,'ลิงก์เพื่อนสำหรับคอมพิวเตอร์','','',0,'','','',0,0,'','','');
DROP TABLE IF EXISTS `wm_manager_login`;
CREATE TABLE `wm_manager_login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `manager_id` int NOT NULL COMMENT 'id ผู้ดูแลระบบ',
  `login_status` tinyint(1) DEFAULT NULL COMMENT '0=เข้าสู่ระบบล้มเหลว 1=เข้าสู่ระบบสำเร็จ 2=รหัสผ่านผิด',
  `login_remark` varchar(100) DEFAULT NULL COMMENT 'รายละเอียดหมายเหตุ',
  `login_ip` varchar(150) NOT NULL COMMENT 'ip ที่เข้าสู่ระบบ',
  `login_time` int NOT NULL COMMENT 'เวลาที่เข้าสู่ระบบ',
  `login_ua` varchar(1000) NOT NULL COMMENT 'UA ที่เข้าสู่ระบบ',
  `login_browser` varchar(250) DEFAULT NULL COMMENT 'เบราว์เซอร์ที่เข้าสู่ระบบ',
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='บันทึกการเข้าสู่ระบบของผู้ดูแลระบบ';
DROP TABLE IF EXISTS `wm_manager_manager`;
CREATE TABLE `wm_manager_manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `manager_status` int NOT NULL DEFAULT '1' COMMENT '0=ปิดใช้งาน 1=ปกติ',
  `manager_cid` int NOT NULL DEFAULT '0' COMMENT 'ID สิทธิ์ของผู้ดูแลระบบ',
  `manager_name` varchar(20) NOT NULL COMMENT 'บัญชีผู้ดูแลระบบ',
  `manager_psw` varchar(255) NOT NULL COMMENT 'รหัสผ่านผู้ดูแลระบบ',
  `manager_salt` varchar(50) DEFAULT NULL COMMENT 'ซอลต์รหัสผ่านผู้ดูแลระบบ (ไม่ใช้แล้วหลังเปลี่ยนเป็น bcrypt เก็บไว้เพียงเพื่อรองรับแฮชเก่า)',
  `manager_lastip` varchar(150) DEFAULT NULL COMMENT 'IP เข้าสู่ระบบล่าสุด',
  `manager_lasttime` int NOT NULL DEFAULT '0' COMMENT 'เข้าสู่ระบบล่าสุด',
  PRIMARY KEY (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบัญชีผู้ดูแลระบบ';
INSERT INTO `wm_manager_manager` VALUES (1,1,0,'admin','d4b6232e4aa20cd032009cbb79b3452507a24830','a8e52ffc28e3300ee098aec5b1415b6cea5befcb','127.0.0.1',1613876021),(4,1,1,'sdasd','b8dbfcaea467bc655229df4a370cabe063f7daa4',NULL,'127.0.0.1',1499091969);
DROP TABLE IF EXISTS `wm_manager_operation`;
CREATE TABLE `wm_manager_operation` (
  `operation_id` int NOT NULL AUTO_INCREMENT,
  `operation_manager_id` int DEFAULT '0' COMMENT 'ผู้ดูแลระบบที่ดำเนินการ',
  `operation_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่ดำเนินการ',
  `operation_table` varchar(50) DEFAULT NULL COMMENT 'ตารางที่ดำเนินการ',
  `operation_type` varchar(20) DEFAULT NULL COMMENT 'ประเภทการดำเนินการ, insert, updata, delete',
  `operation_data` text COMMENT 'ข้อมูลใหม่ของการดำเนินการ',
  `operation_where` text COMMENT 'เงื่อนไขของข้อมูลที่ดำเนินการ',
  `operation_backdata` text COMMENT 'ข้อมูลต้นฉบับแบบมิเรอร์ของการดำเนินการ',
  `operation_remark` varchar(500) DEFAULT NULL COMMENT 'ข้อมูลหมายเหตุของการดำเนินการ',
  `operation_time` int DEFAULT '0' COMMENT 'เวลาของการดำเนินการ',
  PRIMARY KEY (`operation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการดำเนินการของผู้ดูแลระบบ';
DROP TABLE IF EXISTS `wm_manager_recycle`;
CREATE TABLE `wm_manager_recycle` (
  `recycle_id` int NOT NULL AUTO_INCREMENT,
  `recycle_manager_id` int NOT NULL DEFAULT '0' COMMENT 'id ของผู้ดูแลระบบ',
  `recycle_module` varchar(20) NOT NULL COMMENT 'โมดูลใดที่ถูกดำเนินการ',
  `recycle_data_id` int NOT NULL DEFAULT '0' COMMENT 'id ข้อมูลที่ลบ',
  `recycle_title` varchar(100) DEFAULT NULL COMMENT 'หัวข้อข้อมูลที่ลบ',
  `recycle_time` int DEFAULT '0' COMMENT 'เวลาที่ลบ',
  PRIMARY KEY (`recycle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ถังรีไซเคิลข้อมูลที่ผู้ดูแลระบบลบ';
DROP TABLE IF EXISTS `wm_manager_request`;
CREATE TABLE `wm_manager_request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `request_manager_id` int NOT NULL COMMENT 'id ของผู้ดูแลระบบ',
  `request_file` varchar(30) NOT NULL COMMENT 'ไฟล์คอนโทรลเลอร์ที่เข้าถึง',
  `request_type` varchar(20) NOT NULL DEFAULT 'GET' COMMENT 'ประเภทการเข้าชม',
  `request_ip` varchar(20) DEFAULT NULL COMMENT 'ip ของการเข้าชม',
  `request_time` int DEFAULT '0' COMMENT 'เวลาที่เข้าชม',
  `request_get` text COMMENT 'พารามิเตอร์ของคำขอ GET',
  `request_post` text COMMENT 'พารามิเตอร์ของคำขอ POST',
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='บันทึกคำขอของผู้ดูแลระบบ';
DROP TABLE IF EXISTS `wm_message_message`;
CREATE TABLE `wm_message_message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=ยังไม่ได้อ่าน',
  `message_content` varchar(100) NOT NULL COMMENT 'เนื้อหาข้อความ',
  `message_time` int NOT NULL COMMENT 'เวลาข้อความ',
  `message_ip` varchar(15) DEFAULT NULL COMMENT 'IP ของข้อความ',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางข้อความ';
DROP TABLE IF EXISTS `wm_novel_author_said`;
CREATE TABLE `wm_novel_author_said` (
  `said_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID เพิ่มอัตโนมัติ',
  `novel_id` int NOT NULL COMMENT 'ID นิยาย',
  `chapter_id` int NOT NULL COMMENT 'ID ของตอน',
  `said_content` text COMMENT 'เนื้อหา',
  `said_uptime` int NOT NULL COMMENT 'เวลาอัปเดต',
  PRIMARY KEY (`said_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='คำกล่าวของผู้แต่ง';
DROP TABLE IF EXISTS `wm_novel_chapter`;
CREATE TABLE `wm_novel_chapter` (
  `chapter_id` int NOT NULL AUTO_INCREMENT,
  `chapter_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=รอตรวจสอบ 1=ปกติ 2=ไม่ผ่าน',
  `chapter_islogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ต้องเข้าสู่ระบบจึงจะดูได้หรือไม่',
  `chapter_isvip` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ต้องเป็นสมาชิกหรือไม่, 0=ไม่ต้อง',
  `chapter_ispay` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ต้องเสียเงินหรือไม่',
  `chapter_istxt` tinyint(1) NOT NULL DEFAULT '2' COMMENT '2=นำเข้าฐานข้อมูล 1=เป็นไฟล์ txt',
  `chapter_number` int DEFAULT '0' COMMENT 'จำนวนคำของตอน',
  `chapter_name` varchar(100) DEFAULT NULL COMMENT 'ชื่อตอน',
  `chapter_nid` int NOT NULL DEFAULT '0' COMMENT 'id หนังสือ',
  `chapter_vid` int NOT NULL DEFAULT '1' COMMENT 'id เล่ม ค่าเริ่มต้น 1',
  `chapter_cid` int NOT NULL DEFAULT '0' COMMENT 'id เนื้อหา',
  `chapter_order` int NOT NULL DEFAULT '999' COMMENT 'เรียงลำดับ',
  `chapter_path` varchar(250) DEFAULT NULL COMMENT 'พาธบันทึกไฟล์ txt ของตอนแบบครบถ้วน',
  `chapter_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที',
  PRIMARY KEY (`chapter_id`),
  KEY `nid_vid_time_Index` (`chapter_nid`,`chapter_vid`,`chapter_time`),
  KEY `nid_time_Index` (`chapter_nid`,`chapter_time`),
  KEY `nid_index` (`chapter_nid`),
  KEY `time_index` (`chapter_time`),
  KEY `cid_index` (`chapter_cid`),
  KEY `status_index` (`chapter_status`),
  KEY `order_index` (`chapter_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางดัชนีตอนนิยาย';
DROP TABLE IF EXISTS `wm_novel_content`;
CREATE TABLE `wm_novel_content` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL COMMENT 'เนื้อหา',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเนื้อหาตอน';
DROP TABLE IF EXISTS `wm_novel_novel`;
CREATE TABLE `wm_novel_novel` (
  `novel_id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL DEFAULT '0' COMMENT 'id ผู้แต่ง',
  `novel_name` varchar(100) NOT NULL COMMENT 'ชื่อนิยาย',
  `novel_wordname` varchar(50) DEFAULT NULL COMMENT 'ชื่อหนังสือแบบเต็ม',
  `novel_pinyin` varchar(50) NOT NULL COMMENT 'พินอิน',
  `novel_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=รอตรวจสอบ 1=ปกติ',
  `novel_copyright` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=ไม่มีลิขสิทธิ์ 1=ขายแบบเซ็นสัญญา 2=ซื้อขาดลิขสิทธิ์',
  `novel_sign_id` int NOT NULL DEFAULT '0' COMMENT 'id ของระดับการเซ็นสัญญา',
  `novel_sell` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'อนุญาตให้วางขายหรือไม่',
  `novel_process` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=กำลังเขียน 2=จบแล้ว 3=หยุดอัปเดต',
  `novel_type` int NOT NULL DEFAULT '1' COMMENT '1=ต้นฉบับลงก่อน 2=ลงที่เว็บอื่นก่อน',
  `type_id` int NOT NULL COMMENT 'id ประเภท',
  `novel_author` varchar(60) NOT NULL COMMENT 'ผู้แต่ง',
  `novel_cover` varchar(250) NOT NULL COMMENT 'ปก',
  `novel_comment` varchar(500) DEFAULT NULL COMMENT 'รีวิวของบรรณาธิการ',
  `novel_info` varchar(2000) NOT NULL COMMENT 'เรื่องย่อนิยาย',
  `novel_tags` varchar(80) DEFAULT NULL COMMENT 'แท็กนิยาย',
  `novel_chapter` int NOT NULL DEFAULT '0' COMMENT 'จำนวนตอนทั้งหมด',
  `novel_wordnumber` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคำทั้งหมด',
  `novel_uptime` int NOT NULL DEFAULT '0' COMMENT 'เวลาอัปเดตล่าสุด ปีเดือนวันชั่วโมงนาทีวินาที',
  `novel_clicktime` int NOT NULL DEFAULT '0' COMMENT 'วันที่อัปเดตการคลิก (ปีเดือนวัน)',
  `novel_score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT 'คะแนน',
  `novel_ding` int NOT NULL DEFAULT '0' COMMENT 'กดชอบ',
  `novel_cai` int NOT NULL DEFAULT '0' COMMENT 'กดไม่ชอบ',
  `novel_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนความคิดเห็น',
  `novel_startcid` int NOT NULL DEFAULT '0' COMMENT 'id ของตอนแรก',
  `novel_startcname` varchar(50) NOT NULL DEFAULT '0' COMMENT 'ชื่อของตอนแรก',
  `novel_newcid` int NOT NULL DEFAULT '0' COMMENT 'ID ของตอนล่าสุด',
  `novel_newcname` varchar(50) NOT NULL DEFAULT '0' COMMENT 'ชื่อตอนล่าสุด',
  `novel_createtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาสร้าง',
  `novel_todayclick` int NOT NULL DEFAULT '0' COMMENT 'คลิกวันนี้',
  `novel_weekclick` int NOT NULL DEFAULT '0' COMMENT 'คลิกสัปดาห์นี้',
  `novel_monthclick` int NOT NULL DEFAULT '0' COMMENT 'คลิกเดือนนี้',
  `novel_yearclick` int DEFAULT '0' COMMENT 'คลิกรายปี',
  `novel_allclick` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคลิกทั้งหมด',
  `novel_todaycoll` int NOT NULL DEFAULT '0' COMMENT 'รายการโปรดรายวัน',
  `novel_weekcoll` int NOT NULL DEFAULT '0' COMMENT 'รายการโปรดสัปดาห์นี้',
  `novel_monthcoll` int NOT NULL DEFAULT '0' COMMENT 'รายการโปรดรายเดือน',
  `novel_yearcoll` int NOT NULL DEFAULT '0' COMMENT 'รายการโปรดรายปี',
  `novel_allcoll` int NOT NULL DEFAULT '0' COMMENT 'รายการโปรดทั้งหมด',
  `novel_colltime` int NOT NULL DEFAULT '0' COMMENT 'เวลาอัปเดตรายการโปรด',
  `novel_todayrec` int NOT NULL DEFAULT '0' COMMENT 'การแนะนำจากผู้ใช้รายวัน',
  `novel_weekrec` int NOT NULL DEFAULT '0' COMMENT 'ผู้ใช้แนะนำสัปดาห์นี้',
  `novel_monthrec` int NOT NULL DEFAULT '0' COMMENT 'การแนะนำจากผู้ใช้รายเดือน',
  `novel_yearrec` int NOT NULL DEFAULT '0' COMMENT 'การแนะนำจากผู้ใช้รายปี',
  `novel_allrec` int NOT NULL DEFAULT '0' COMMENT 'การแนะนำจากผู้ใช้ทั้งหมด',
  `novel_path` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่จัดเก็บไฟล์ txt ของนิยายที่จบแล้ว',
  `novel_rectime` int NOT NULL DEFAULT '0' COMMENT 'เวลาอัปเดตที่แนะนำ',
  PRIMARY KEY (`novel_id`),
  KEY `UPTIME_INDEX` (`novel_uptime`),
  KEY `LIST_INDEX` (`novel_status`,`type_id`),
  KEY `PINYIN_INDEX` (`novel_pinyin`),
  KEY `STATUS_INDEX` (`novel_status`),
  KEY `REPLAY_INDEX` (`novel_replay`),
  KEY `TYPE_INDEX` (`type_id`),
  KEY `SOCRE_INDEX` (`novel_score`),
  KEY `CREATETIME_INDEX` (`novel_createtime`),
  KEY `WORDNUMBER_INDEX` (`novel_wordnumber`),
  KEY `DING_INDEX` (`novel_ding`),
  KEY `CAI_INDEX` (`novel_cai`),
  KEY `ALLCLICK_INDEX` (`novel_allclick`),
  KEY `MONTHCLICK_INDEX` (`novel_monthclick`),
  KEY `WEEKCLICK_INDEX` (`novel_weekclick`),
  KEY `TODAYCLICK_INDEX` (`novel_todayclick`),
  KEY `ALLREC_INDEX` (`novel_allrec`),
  KEY `YEARREC_INDEX` (`novel_yearrec`),
  KEY `MONTHREC_INDEX` (`novel_monthrec`),
  KEY `WEEKREC_INDEX` (`novel_weekrec`),
  KEY `YEARCOLL_INDEX` (`novel_yearcoll`),
  KEY `MONTHCOLL_INDEX` (`novel_monthcoll`),
  KEY `WEEKCOLL_INDEX` (`novel_weekcoll`),
  KEY `TODAYCOLL_INDEX` (`novel_todaycoll`),
  KEY `TODAYREC_INDEX` (`novel_todayrec`),
  KEY `YEARCLICK_INDEX` (`novel_yearclick`),
  KEY `ALLCOLL_INDEX` (`novel_allcoll`),
  KEY `PRE_NEXT_INDEX` (`type_id`,`novel_id`),
  KEY `AUTHOR_INDEX` (`novel_author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหนังสือ';
DROP TABLE IF EXISTS `wm_novel_outline`;
CREATE TABLE `wm_novel_outline` (
  `outline_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID เพิ่มอัตโนมัติ',
  `novel_id` int NOT NULL COMMENT 'ID นิยาย',
  `outline_content` text COMMENT 'เนื้อหาโครงเรื่อง',
  `outline_uptime` int NOT NULL COMMENT 'เวลาอัปเดต',
  PRIMARY KEY (`outline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='โครงเรื่องนิยาย';
DROP TABLE IF EXISTS `wm_novel_rec`;
CREATE TABLE `wm_novel_rec` (
  `rec_id` int NOT NULL AUTO_INCREMENT,
  `rec_nid` int NOT NULL COMMENT 'ID นิยาย',
  `rec_img3` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่รูปภาพแนะนำสำหรับหน้าจอสัมผัส',
  `rec_img4` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่รูปภาพแนะนำสำหรับคอมพิวเตอร์',
  `rec_rt` varchar(20) DEFAULT NULL COMMENT 'หัวข้อที่แนะนำให้แสดง',
  `rec_icr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ปกหน้าแรก',
  `rec_ibr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'รายการพรีเมียมหน้าแรก',
  `rec_ir` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำหน้าแรก',
  `rec_ccr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ปกหมวดหมู่',
  `rec_cbr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'หมวดหมู่คัดสรร',
  `rec_cr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำหมวดหมู่',
  `rec_order` int NOT NULL DEFAULT '99' COMMENT 'เรียงลำดับ',
  `rec_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`rec_id`),
  KEY `nid_index` (`rec_nid`),
  KEY `rec_index` (`rec_rt`,`rec_icr`,`rec_ibr`,`rec_ir`,`rec_ccr`,`rec_cbr`,`rec_cr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางแนะนำนิยาย';
DROP TABLE IF EXISTS `wm_novel_rewardlog`;
CREATE TABLE `wm_novel_rewardlog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_nid` int NOT NULL DEFAULT '0' COMMENT 'ID นิยาย',
  `log_cid` int DEFAULT '0' COMMENT 'id ของตอน สามารถเป็น 0 ได้',
  `log_uid` int NOT NULL DEFAULT '0' COMMENT 'ID ผู้ใช้ที่ให้รางวัล',
  `log_gold1` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้ในการให้รางวัล 1',
  `log_gold2` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้ในการให้รางวัล 2',
  `log_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาการให้รางวัล',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการให้รางวัลนิยาย';
DROP TABLE IF EXISTS `wm_novel_sell`;
CREATE TABLE `wm_novel_sell` (
  `sell_id` int NOT NULL AUTO_INCREMENT,
  `sell_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=วางขาย 0=เอาออกจากชั้น',
  `sell_novel_id` int NOT NULL DEFAULT '0' COMMENT 'ID นิยาย',
  `sell_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT 'ประเภทการขาย,1 คือรายตอน 2 คือทั้งเล่ม 3 คือรายเดือน',
  `sell_number` decimal(8,2) DEFAULT '0.00' COMMENT 'ราคาต่อพันคำต่อตอน【เหรียญ 2】',
  `sell_all` decimal(8,2) DEFAULT '0.00' COMMENT 'ราคาขายทั้งเล่ม【เหรียญ 2】',
  `sell_month` decimal(8,2) DEFAULT '0.00' COMMENT 'ราคารายเดือน【เหรียญ 2】',
  `sell_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาวางขาย',
  PRIMARY KEY (`sell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการวางขายนิยาย';
DROP TABLE IF EXISTS `wm_novel_sign`;
CREATE TABLE `wm_novel_sign` (
  `sign_id` int NOT NULL AUTO_INCREMENT,
  `sign_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=เซ็นสัญญา 0=ยกเลิกสัญญา',
  `sign_novel_id` int NOT NULL COMMENT 'ID นิยาย',
  `sign_manager_id` int NOT NULL DEFAULT '1' COMMENT 'ผู้ดูแลระบบที่เซ็นสัญญา',
  `sign_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ประเภทการเซ็นสัญญา 1 คือขายแบบแบ่งรายได้ 2 คือซื้อขาดลิขสิทธิ์',
  `sign_sign_id` int DEFAULT '0' COMMENT 'ระดับการเซ็นสัญญา',
  `sign_time` int NOT NULL COMMENT 'เวลาที่เซ็นสัญญา',
  PRIMARY KEY (`sign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการเซ็นสัญญาซื้อขาดนิยาย';
DROP TABLE IF EXISTS `wm_novel_sublog`;
CREATE TABLE `wm_novel_sublog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ประเภทการสมัครรับ 1 คือรายตอน 2 คือทั้งเล่ม 3 คือรายเดือน',
  `log_nid` int NOT NULL DEFAULT '0' COMMENT 'ID นิยาย',
  `log_cid` int DEFAULT '0' COMMENT 'id ของตอน สามารถเป็น 0 ได้',
  `log_uid` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้ที่สมัครรับ',
  `log_gold1` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้ในการสมัครรับ1',
  `log_gold2` decimal(10,2) DEFAULT '0.00' COMMENT 'เหรียญที่ใช้ในการสมัครรับ2',
  `log_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาสมัครรับ',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการติดตามนิยาย';
DROP TABLE IF EXISTS `wm_novel_timelimit`;
CREATE TABLE `wm_novel_timelimit` (
  `timelimit_id` int NOT NULL AUTO_INCREMENT,
  `timelimit_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ค่าบูลีน, ใช้งานได้หรือไม่',
  `timelimit_nid` int NOT NULL COMMENT 'ID นิยาย',
  `timelimit_starttime` int NOT NULL COMMENT 'เวลาเริ่มฟรีแบบจำกัดเวลา',
  `timelimit_endtime` int NOT NULL COMMENT 'เวลาสิ้นสุดฟรีแบบจำกัดเวลา',
  `timelimit_order` int NOT NULL COMMENT 'ลำดับการแสดง',
  `timelimit_time` int NOT NULL COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`timelimit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางนิยายฟรีชั่วคราว';
DROP TABLE IF EXISTS `wm_novel_type`;
CREATE TABLE `wm_novel_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อของประเภท',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL COMMENT 'เรียงลำดับ',
  `type_ico` varchar(200) DEFAULT NULL COMMENT 'ไอคอนหมวดหมู่',
  `type_info` varchar(100) DEFAULT NULL COMMENT 'เรื่องย่อหมวดหมู่',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าหมวดหมู่',
  `type_titempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าแรกหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลต info',
  `type_mtempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลต menu',
  `type_rtempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลต read',
  `type_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อหมวดหมู่',
  `type_key` varchar(100) DEFAULT NULL COMMENT 'คำค้นหาหมวดหมู่',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายหมวดหมู่',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่นิยาย';
INSERT INTO `wm_novel_type` VALUES (1,0,'0','แฟนตาซี','แฟนตาซี','xuanhuanmofa',1,'','แฟนตาซีเวทมนตร์มอบนิยายเวทมนตร์ที่สมจริงที่สุดให้คุณ',0,0,0,0,0,'','',''),(2,0,'0','กำลังภายใน','กำลังภายใน','wuxiaxiuzhen',3,'','',0,0,0,0,0,'','',''),(3,0,'0','โรแมนติก','ชีวิตในเมือง','dushiyanqing',5,'','',0,0,0,0,0,'','',''),(4,0,'0','สงคราม','ประวัติศาสตร์','lishijunshi',7,'','',0,0,0,0,0,'','',''),(5,0,'0','ระทึกขวัญ','ระทึกขวัญ','xuanyijiqing',9,'','',0,0,0,0,0,'','',''),(6,0,'0','อีสเปอร์ต','เกมออนไลน์','wangyoujingji',11,'','',0,0,0,0,0,'','',''),(7,0,'0','นิยายวิทย์','ไซไฟ','kehuanqihuan',13,'','',0,0,0,0,0,'','',''),(8,0,'0','สยองขวัญ','สยองขวัญ','kongbulingyi',15,'','',0,0,0,0,0,'','','');
DROP TABLE IF EXISTS `wm_novel_volume`;
CREATE TABLE `wm_novel_volume` (
  `volume_id` int NOT NULL AUTO_INCREMENT,
  `volume_name` varchar(60) NOT NULL COMMENT 'ชื่อเล่ม',
  `volume_nid` int NOT NULL DEFAULT '0' COMMENT 'id หนังสือ 0=เล่มเริ่มต้น',
  `volume_desc` varchar(100) DEFAULT NULL COMMENT 'คำอธิบายเล่ม',
  `volume_order` int NOT NULL DEFAULT '0' COMMENT 'เรียงลำดับ',
  `volume_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาสร้าง ปีเดือนวันชั่วโมงนาทีวินาที',
  PRIMARY KEY (`volume_id`,`volume_time`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเล่มนิยาย';
INSERT INTO `wm_novel_volume` VALUES (1,'เนื้อหาหลัก',0,'คำอธิบายเนื้อหาหลัก',0,22);
DROP TABLE IF EXISTS `wm_novel_welfare`;
CREATE TABLE `wm_novel_welfare` (
  `welfare_id` int NOT NULL AUTO_INCREMENT,
  `welfare_nid` int NOT NULL COMMENT 'ID นิยาย',
  `welfare_type` varchar(250) DEFAULT NULL COMMENT 'วิธีแบ่งรายได้นิยายที่อนุญาต',
  `welfare_number` decimal(5,2) DEFAULT NULL COMMENT 'รางวัลตามจำนวนคำของนิยาย',
  `welfare_finish` varchar(500) DEFAULT NULL COMMENT 'รางวัลนิยายที่จบแล้ว',
  `welfare_update` varchar(500) DEFAULT NULL COMMENT 'รางวัลการอัปเดตนิยาย, ชำระทุกเดือน',
  `welfare_full` varchar(500) DEFAULT NULL COMMENT 'รางวัลการเข้าใช้งานรายเดือน, ชำระทุกเดือน',
  PRIMARY KEY (`welfare_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางตั้งค่าสวัสดิการนิยาย';
DROP TABLE IF EXISTS `wm_operate_operate`;
CREATE TABLE `wm_operate_operate` (
  `operate_id` int NOT NULL AUTO_INCREMENT,
  `operate_module` varchar(20) NOT NULL COMMENT 'โมดูลที่ดำเนินการ',
  `operate_type` varchar(30) NOT NULL COMMENT 'ประเภทการดำเนินการ',
  `operate_cid` int NOT NULL DEFAULT '0' COMMENT 'ID ของเนื้อหาที่ดำเนินการ',
  `operate_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1' COMMENT 'ip',
  `operate_time` int NOT NULL DEFAULT '0' COMMENT 'เวลา',
  PRIMARY KEY (`operate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='บันทึกการโหวตขึ้น-ลงและการให้คะแนนของผู้ใช้';
DROP TABLE IF EXISTS `wm_operate_score`;
CREATE TABLE `wm_operate_score` (
  `score_id` int NOT NULL AUTO_INCREMENT,
  `score_module` varchar(20) NOT NULL COMMENT 'โมดูลของคะแนน',
  `score_cid` int NOT NULL COMMENT 'id เนื้อหา',
  `score_one` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคนที่ได้ 1 คะแนน',
  `score_two` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคนที่ได้ 2 คะแนน',
  `score_three` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคนที่ได้ 3 คะแนน',
  `score_four` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคนที่ได้ 4 คะแนน',
  `score_five` int NOT NULL DEFAULT '0' COMMENT 'จำนวนคนที่ได้ 5 คะแนน',
  PRIMARY KEY (`score_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='การให้คะแนนการมีส่วนร่วม';
DROP TABLE IF EXISTS `wm_picture_picture`;
CREATE TABLE `wm_picture_picture` (
  `picture_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL DEFAULT '1' COMMENT 'ID หมวดหมู่ข่าว',
  `picture_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ต้องตรวจสอบหรือไม่',
  `picture_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำหรือไม่',
  `picture_simg` varchar(120) DEFAULT NULL COMMENT 'รูปย่อ',
  `picture_name` varchar(60) NOT NULL COMMENT 'หัวข้อชุดรูปภาพ',
  `picture_cname` varchar(60) DEFAULT NULL COMMENT 'หัวข้อตอนของชุดรูปภาพ',
  `picture_tags` varchar(60) DEFAULT NULL COMMENT 'แท็กชุดรูปภาพ',
  `picture_info` varchar(100) DEFAULT NULL COMMENT 'รีวิว, ตัวอย่าง',
  `picture_imgs` text COMMENT 'อาร์เรย์ซีเรียลไลซ์ของรูปภาพ',
  `picture_count` int NOT NULL DEFAULT '0' COMMENT 'จำนวนรูปภาพ',
  `picture_content` text COMMENT 'เรื่องย่อ',
  `picture_read` int NOT NULL DEFAULT '0' COMMENT 'ยอดเข้าชมชุดรูปภาพ',
  `picture_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนความคิดเห็น',
  `picture_ding` int NOT NULL DEFAULT '0' COMMENT 'กดชอบ',
  `picture_cai` int NOT NULL DEFAULT '0' COMMENT 'กดไม่ชอบ',
  `picture_start` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT 'ระดับดาว',
  `picture_score` decimal(2,0) DEFAULT '0' COMMENT 'คะแนน',
  `picture_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม ปีเดือนวันชั่วโมงนาทีวินาที',
  PRIMARY KEY (`picture_id`),
  KEY `tid` (`type_id`,`picture_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางแกลเลอรี';
DROP TABLE IF EXISTS `wm_picture_type`;
CREATE TABLE `wm_picture_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อของประเภท',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL DEFAULT '0' COMMENT 'เรียงลำดับ',
  `type_simg` varchar(200) DEFAULT NULL COMMENT 'รูปย่อหมวดหมู่',
  `type_ico` varchar(200) DEFAULT NULL COMMENT 'ไอคอนหมวดหมู่',
  `type_info` varchar(100) DEFAULT NULL COMMENT 'ข้อมูลหมวดหมู่',
  `type_titempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าแรกหมวดหมู่',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าเนื้อหาหมวดหมู่',
  `type_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อ',
  `type_key` varchar(100) DEFAULT NULL COMMENT 'คำค้นหา',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบาย',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่แกลเลอรี';
DROP TABLE IF EXISTS `wm_plugin`;
CREATE TABLE `wm_plugin` (
  `plugin_id` int NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL COMMENT 'ชื่อปลั๊กอิน',
  `plugin_floder` varchar(50) NOT NULL COMMENT 'โฟลเดอร์ปลั๊กอิน',
  `plugin_author` varchar(60) NOT NULL COMMENT 'ผู้พัฒนาปลั๊กอิน',
  `plugin_version` varchar(10) NOT NULL COMMENT 'เวอร์ชันปลั๊กอิน',
  `plugin_time` int NOT NULL COMMENT 'เวลาติดตั้งปลั๊กอิน',
  PRIMARY KEY (`plugin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางการติดตั้งปลั๊กอิน';
INSERT INTO `wm_plugin` VALUES (6,'ทางการ-ปลั๊กอินลงทะเบียน DEMO','demo','WMCMS อย่างเป็นทางการ','V1.0',1528631159);
DROP TABLE IF EXISTS `wm_plugin_config`;
CREATE TABLE `wm_plugin_config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `config_plugin_id` int NOT NULL COMMENT 'ID ปลั๊กอิน',
  `config_key` varchar(100) NOT NULL COMMENT 'คีย์ปลั๊กอิน',
  `config_val` text COMMENT 'ค่าปลั๊กอิน',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางตั้งค่าพารามิเตอร์ปลั๊กอิน';
INSERT INTO `wm_plugin_config` VALUES (4,6,'plugin_demo_site_open','0');
DROP TABLE IF EXISTS `wm_plugin_demo_apply`;
CREATE TABLE `wm_plugin_demo_apply` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_name` varchar(60) NOT NULL COMMENT 'ผู้ใช้ที่สมัคร',
  `message_phone` varchar(11) NOT NULL COMMENT 'โทรศัพท์ที่ใช้สมัคร',
  `message_time` int NOT NULL COMMENT 'เวลาสมัคร',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางลงทะเบียนปลั๊กอิน demo';
INSERT INTO `wm_plugin_demo_apply` VALUES (1,'เว่ยเมิ่ง','15123232323',1528631188);
DROP TABLE IF EXISTS `wm_props_props`;
CREATE TABLE `wm_props_props` (
  `props_id` int NOT NULL AUTO_INCREMENT,
  `props_type_id` int NOT NULL COMMENT 'ประเภท',
  `props_status` tinyint(1) DEFAULT '1' COMMENT 'แสดงหรือไม่',
  `props_name` varchar(60) NOT NULL COMMENT 'ชื่อไอเทม',
  `props_cover` varchar(250) DEFAULT NULL COMMENT 'ไอคอนไอเทม',
  `props_stock` int NOT NULL DEFAULT '0' COMMENT 'สต็อกคงเหลือ',
  `props_desc` text COMMENT 'คำอธิบายไอเทม',
  `props_cost` tinyint(1) DEFAULT '1' COMMENT '1=ซื้อด้วยเหรียญ 2=ซื้อด้วยเงินสด',
  `props_gold1` decimal(8,2) DEFAULT '0.00' COMMENT 'ราคาเหรียญ1',
  `props_gold2` decimal(8,2) DEFAULT '0.00' COMMENT 'ราคาเหรียญ2',
  `props_money` decimal(10,2) DEFAULT '0.00' COMMENT 'ราคาเงินสด',
  `props_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาวางขาย',
  `props_option` varchar(500) DEFAULT NULL COMMENT 'ข้อมูลเพิ่มเติม สตริงที่ serialize แล้ว',
  `props_order` int DEFAULT '999' COMMENT 'เรียงลำดับ, ค่าน้อยอยู่ก่อน',
  PRIMARY KEY (`props_id`),
  KEY `index_type` (`props_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางของขวัญและไอเทม';
INSERT INTO `wm_props_props` VALUES (3,4,1,'พนักงานให้กำลังใจสาวสวย','/upload/images/20170317/20170317180045804022978302.jpg',99956,'',2,0.00,200.00,0.00,1488720588,'a:5:{s:3:\"rec\";s:1:\"0\";s:5:\"month\";s:1:\"0\";s:10:\"author_exp\";s:1:\"0\";s:8:\"fans_exp\";s:1:\"0\";s:8:\"user_exp\";s:1:\"0\";}',4),(4,4,1,'ถ้วยรางวัลทองคำแท้','/upload/images/20170317/20170317180040436654527725.jpg',99979,'',1,0.00,100.00,0.00,1488720588,'a:5:{s:3:\"rec\";s:1:\"0\";s:5:\"month\";s:1:\"0\";s:10:\"author_exp\";s:1:\"0\";s:8:\"fans_exp\";s:1:\"0\";s:8:\"user_exp\";s:1:\"0\";}',3),(7,4,1,'คอมพิวเตอร์แอปเปิล','/upload/images/20170317/20170317180034787516420251.jpg',99950,'',1,0.00,50.00,0.00,1488720803,'a:5:{s:3:\"rec\";s:1:\"0\";s:5:\"month\";s:1:\"0\";s:10:\"author_exp\";s:1:\"0\";s:8:\"fans_exp\";s:1:\"0\";s:8:\"user_exp\";s:1:\"0\";}',2),(8,4,1,'คอมพิวเตอร์มือสอง','/upload/images/20170317/20170317180028754600344308.jpg',99935,'',1,0.00,10.00,0.00,1488721070,'a:5:{s:3:\"rec\";s:1:\"1\";s:5:\"month\";s:1:\"1\";s:10:\"author_exp\";s:1:\"1\";s:8:\"fans_exp\";s:1:\"1\";s:8:\"user_exp\";s:1:\"1\";}',1);
DROP TABLE IF EXISTS `wm_props_sell`;
CREATE TABLE `wm_props_sell` (
  `sell_id` int NOT NULL AUTO_INCREMENT,
  `sell_module` varchar(20) NOT NULL COMMENT 'โมดูลที่ขาย',
  `sell_cid` int NOT NULL DEFAULT '0' COMMENT 'id เนื้อหาที่ซื้อ',
  `sell_props_id` int NOT NULL COMMENT 'ผลิตภัณฑ์ที่ขาย',
  `sell_user_id` int NOT NULL COMMENT 'ผู้ใช้ที่ซื้อ',
  `sell_number` int NOT NULL DEFAULT '1' COMMENT 'จำนวนที่ซื้อ',
  `sell_gold1` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญที่ใช้ซื้อ1',
  `sell_gold2` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เหรียญที่ใช้ซื้อ2',
  `sell_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เงินสดที่ใช้ซื้อ',
  `sell_remark` varchar(100) DEFAULT NULL COMMENT 'หมายเหตุข้อความ',
  `sell_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่ซื้อ',
  PRIMARY KEY (`sell_id`),
  KEY `index_props` (`sell_props_id`),
  KEY `index_user` (`sell_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการขายไอเทม';
DROP TABLE IF EXISTS `wm_props_type`;
CREATE TABLE `wm_props_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_status` tinyint(1) DEFAULT '1' COMMENT 'แสดงหรือไม่',
  `type_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่หมวดหมู่อยู่',
  `type_topid` int DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อหมวดหมู่',
  `type_order` int DEFAULT NULL COMMENT 'ลำดับหมวดหมู่',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่ไอเทม';
INSERT INTO `wm_props_type` VALUES (4,1,'novel',0,'0','สนับสนุน','',0);
DROP TABLE IF EXISTS `wm_replay_replay`;
CREATE TABLE `wm_replay_replay` (
  `replay_id` int NOT NULL AUTO_INCREMENT,
  `replay_floor` int NOT NULL DEFAULT '1' COMMENT 'ชั้นของความคิดเห็น',
  `replay_pid` varchar(200) NOT NULL DEFAULT '0' COMMENT 'โครงสร้าง id ของชั้นความคิดเห็นระดับบนสุด',
  `replay_rid` int NOT NULL DEFAULT '0' COMMENT 'id ของการตอบกลับ',
  `replay_status` int NOT NULL DEFAULT '1' COMMENT '1=ปกติ 2=รอตรวจสอบ',
  `replay_module` varchar(20) DEFAULT NULL COMMENT 'โมดูล',
  `replay_cid` int NOT NULL COMMENT 'id เนื้อหา',
  `replay_subset_id` int DEFAULT '0' COMMENT 'id ชุดย่อยเนื้อหา',
  `replay_segment_id` int DEFAULT '0' COMMENT 'id ตอนย่อยของชุดย่อยเนื้อหา',
  `replay_uid` int DEFAULT '0' COMMENT 'id ผู้ใช้',
  `replay_nickname` varchar(60) NOT NULL COMMENT 'ชื่อ-นามสกุล',
  `replay_ruid` int DEFAULT '0' COMMENT 'id ผู้ใช้ที่ตอบกลับ',
  `replay_rnickname` varchar(50) DEFAULT NULL COMMENT 'ชื่อเล่นผู้ใช้ที่ตอบกลับ',
  `replay_content` text NOT NULL COMMENT 'เนื้อหา',
  `replay_count` int NOT NULL DEFAULT '0' COMMENT 'จำนวนตอบกลับ',
  `replay_ding` int NOT NULL DEFAULT '0' COMMENT 'กดชอบ',
  `replay_cai` int NOT NULL DEFAULT '0' COMMENT 'กดไม่ชอบ',
  `replay_time` int NOT NULL COMMENT 'เวลา',
  `replay_ip` varchar(150) DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`replay_id`),
  KEY `ding` (`replay_ding`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางความคิดเห็น';
DROP TABLE IF EXISTS `wm_search_search`;
CREATE TABLE `wm_search_search` (
  `search_id` int NOT NULL AUTO_INCREMENT,
  `search_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำให้แสดงหรือไม่',
  `search_count` int NOT NULL DEFAULT '1' COMMENT 'จำนวนครั้งที่ค้นหา',
  `search_module` varchar(20) NOT NULL COMMENT 'โมดูล',
  `search_type` int NOT NULL COMMENT '1=หัวข้อ 2=ผู้แต่ง 3=แท็ก',
  `search_key` varchar(20) NOT NULL COMMENT 'คำสำคัญ',
  `search_data` int NOT NULL DEFAULT '0' COMMENT 'ข้อมูล',
  `search_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาค้นหา',
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางประวัติการค้นหา';
DROP TABLE IF EXISTS `wm_seo_errpage`;
CREATE TABLE `wm_seo_errpage` (
  `errpage_id` int NOT NULL AUTO_INCREMENT,
  `errpage_code` int DEFAULT '500' COMMENT 'ประเภทโค้ดหน้าข้อผิดพลาด 404 หรือ 500',
  `errpage_url` varchar(500) DEFAULT NULL COMMENT 'ที่อยู่หน้าที่ผิดพลาด',
  `errpage_ua` varchar(500) DEFAULT NULL COMMENT 'ua เบราว์เซอร์',
  `errpage_time` int DEFAULT '0' COMMENT 'เวลาที่บันทึกข้อผิดพลาด',
  PRIMARY KEY (`errpage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='สถิติหน้าแสดงข้อผิดพลาด';
DROP TABLE IF EXISTS `wm_seo_html`;
CREATE TABLE `wm_seo_html` (
  `html_id` int NOT NULL AUTO_INCREMENT,
  `html_module` varchar(20) DEFAULT NULL COMMENT 'โมดูล',
  `html_type` varchar(30) DEFAULT NULL COMMENT 'ประเภท',
  `html_type_id` int NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่',
  `html_path4` varchar(100) DEFAULT NULL COMMENT 'พาธไฟล์ static ของเว็บ',
  PRIMARY KEY (`html_id`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางที่อยู่แบบคงที่ของหมวดหมู่และเนื้อหา';
INSERT INTO `wm_seo_html` VALUES (118,'novel','tindex',4,'/html/novel/{tid}.html'),(119,'novel','list',4,'/html/novel/{tid}_{page}.html'),(120,'novel','content',4,'/html/novel/{nid}.html'),(121,'novel','menu',4,'/html/novel/menu/{nid}/{page}.html'),(122,'novel','read',4,'/html/novel/read/{nid}/{cid}.html'),(123,'novel','tindex',5,'/html/novel/{tid}.html'),(124,'novel','list',5,'/html/novel/{tid}_{page}.html'),(125,'novel','content',5,'/html/novel/{nid}.html'),(126,'novel','menu',5,'/html/novel/menu/{nid}/{page}.html'),(127,'novel','read',5,'/html/novel/read/{nid}/{cid}.html'),(128,'novel','tindex',6,'/html/novel/{tid}.html'),(129,'novel','list',6,'/html/novel/{tid}_{page}.html'),(130,'novel','content',6,'/html/novel/{nid}.html'),(131,'novel','menu',6,'/html/novel/menu/{nid}/{page}.html'),(132,'novel','read',6,'/html/novel/read/{nid}/{cid}.html'),(133,'novel','tindex',7,'/html/novel/{tid}.html'),(134,'novel','list',7,'/html/novel/{tid}_{page}.html'),(135,'novel','content',7,'/html/novel/{nid}.html'),(136,'novel','menu',7,'/html/novel/menu/{nid}/{page}.html'),(137,'novel','read',7,'/html/novel/read/{nid}/{cid}.html'),(138,'novel','tindex',8,'/html/novel/{tid}.html'),(139,'novel','list',8,'/html/novel/{tid}_{page}.html'),(140,'novel','content',8,'/html/novel/{nid}.html'),(141,'novel','menu',8,'/html/novel/menu/{nid}/{page}.html'),(142,'novel','read',8,'/html/novel/read/{nid}/{cid}.html'),(82,'novel','tindex',9,'/html/novel/{tid}.html'),(83,'novel','list',9,'/html/novel/{tid}_{page}.html'),(84,'novel','content',9,'/html/novel/{nid}.html'),(85,'novel','menu',9,'/html/novel/menu/{nid}/{page}.html'),(86,'novel','read',9,'/html/novel/read/{nid}/{cid}.html'),(108,'novel','tindex',1,'/html/novel/{tid}.html'),(109,'novel','list',1,'/html/novel/{tid}_{page}.html'),(110,'novel','content',1,'/html/novel/{nid}.html'),(111,'novel','menu',1,'/html/novel/menu/{nid}/{page}.html'),(112,'novel','read',1,'/html/novel/read/{nid}/{cid}.html'),(113,'novel','tindex',2,'/html/novel/{tid}.html'),(114,'novel','list',2,'/html/novel/{tid}_{page}.html'),(115,'novel','content',2,'/html/novel/{nid}.html'),(116,'novel','menu',2,'/html/novel/menu/{nid}/{page}.html'),(117,'novel','read',2,'/html/novel/read/{nid}/{cid}.html'),(100,'novel','tindex',3,'/html/novel/{tid}.html'),(101,'novel','list',3,'/html/novel/{tid}_{page}.html'),(102,'novel','content',3,'/html/novel/{nid}.html'),(103,'novel','menu',3,'/html/novel/menu/{nid}/{page}.html'),(104,'novel','read',3,'/html/novel/read/{nid}/{cid}.html'),(143,'article','tindex',1,'/html/article/{tid}.html'),(144,'article','list',1,'/html/article/list/{tid}_{page}.html'),(145,'article','content',1,'/html/article/content/{aid}.html'),(146,'article','tindex',2,'/html/article/{tid}.html'),(147,'article','list',2,'/html/article/list/{tid}_{page}.html'),(148,'article','content',2,'/html/article/content/{aid}.html'),(149,'article','tindex',3,'/html/article/{tid}.html'),(150,'article','list',3,'/html/article/list/{tid}_{page}.html'),(151,'article','content',3,'/html/article/content/{aid}.html'),(152,'picture','list',1,'/html/picture/{tid}_{page}.html'),(153,'picture','content',1,'/html/picture/{nid}.html'),(154,'picture','list',2,'/html/picture/{tid}_{page}.html'),(155,'picture','content',2,'/html/picture/{nid}.html');
DROP TABLE IF EXISTS `wm_seo_html_plan`;
CREATE TABLE `wm_seo_html_plan` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(60) NOT NULL COMMENT 'ชื่อภารกิจ',
  `plan_url` varchar(250) NOT NULL COMMENT 'ลิงก์ url',
  `plan_data` varchar(500) DEFAULT NULL COMMENT 'พารามิเตอร์ post',
  `plan_path` varchar(100) NOT NULL COMMENT 'พาธที่บันทึก',
  `plan_lasttime` int NOT NULL DEFAULT '0' COMMENT 'เวลาดำเนินการล่าสุด',
  `plan_addtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`plan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางงาน HTML';
DROP TABLE IF EXISTS `wm_seo_keys`;
CREATE TABLE `wm_seo_keys` (
  `keys_id` int NOT NULL AUTO_INCREMENT,
  `keys_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่สังกัด',
  `keys_page` varchar(50) NOT NULL COMMENT 'ตัวระบุหน้าเพจ',
  `keys_pagename` varchar(60) DEFAULT NULL COMMENT 'ชื่อหน้าเพจ',
  `keys_title` varchar(200) NOT NULL COMMENT 'หัวข้อหน้าเพจ',
  `keys_key` varchar(200) NOT NULL COMMENT 'คำค้นของหน้าเพจ',
  `keys_desc` varchar(255) NOT NULL COMMENT 'คำอธิบายหน้าเพจ',
  PRIMARY KEY (`keys_id`),
  UNIQUE KEY `page` (`keys_page`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางคีย์เวิร์ด SEO';
INSERT INTO `wm_seo_keys` VALUES (1,'all','index','หน้าแรก','หน้าแรกเว็บไซต์-{网站名}','{网站名}','{网站名}'),(2,'novel','novel_type','รายการนิยาย','รายการนิยาย{分类名字}ล่าสุด, {网站名}','รายการนิยาย{分类名字}ล่าสุด, {网站名}','รายการนิยาย{分类名字}ล่าสุด, {网站名}'),(3,'novel','novel_info','แนะนำนิยาย','{名字}ตอนล่าสุด-{作者}-{类型}','{名字}ตอนล่าสุด-{作者}-{类型}','{简介:100}'),(4,'novel','novel_menu','สารบัญนิยาย','{名字}','{名字}','{简介:100}'),(5,'novel','novel_read','อ่านนิยาย','{名字}-{章节名字}','{名字}-{章节名字}','{名字}-{章节名字}'),(6,'novel','novel_topindex','หน้าแรกอันดับนิยาย','หน้าแรกอันดับนิยาย','หน้าแรกอันดับนิยาย','หน้าแรกอันดับนิยาย'),(7,'novel','novel_search','ค้นหานิยาย','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}'),(8,'novel','novel_toplist','รายการอันดับนิยาย','อันดับนิยาย{类型排行}','{类型排行},อันดับนิยาย','อันดับนิยาย{类型排行}'),(9,'user','user_reg','สมัครสมาชิก','สมัครสมาชิก-{网站名}','สมัครสมาชิก,{网站名}','ศูนย์สมัครสมาชิกใหม่ของ{网站名}'),(10,'user','user_login','เข้าสู่ระบบ','เข้าสู่ระบบ-{网站名}','เข้าสู่ระบบ,{网站名}','เข้าสู่ระบบสำหรับสมาชิกเดิมของ{网站名}'),(11,'user','user_getpsw','กู้คืนรหัสผ่าน','กู้คืนรหัสผ่าน-{网站名}','กู้คืนรหัสผ่าน','กู้คืนรหัสผ่าน'),(12,'user','user_home','ศูนย์ส่วนตัว','ศูนย์ส่วนตัว-{网站名}','ศูนย์ส่วนตัว,{网站名}','ศูนย์ส่วนตัวของ{用户名}'),(13,'user','user_repsw','รีเซ็ตรหัสผ่าน','รีเซ็ตรหัสผ่าน-{网站名}','รีเซ็ตรหัสผ่าน,{网站名}','รีเซ็ตรหัสผ่านผู้ใช้'),(14,'user','user_basic','ข้อมูลผู้ใช้','ข้อมูลผู้ใช้-{网站名}','ข้อมูลผู้ใช้,{网站名}','ข้อมูลโดยละเอียดของ{用户名}'),(15,'user','user_attribute','คุณสมบัติผู้ใช้','คุณสมบัติผู้ใช้-{网站名}','คุณสมบัติผู้ใช้,{网站名}','คุณสมบัติผู้ใช้ของ{用户名}'),(17,'user','user_head','แก้ไขรูปโปรไฟล์','แก้ไขรูปโปรไฟล์-{网站名}','แก้ไขรูปโปรไฟล์,{网站名}','แก้ไขรูปโปรไฟล์'),(18,'user','user_uppsw','แก้ไขรหัสผ่าน','แก้ไขรหัสผ่าน-{网站名}','แก้ไขรหัสผ่าน,{网站名}','แก้ไขรหัสผ่าน'),(19,'user','user_bind','ผูกบัญชี','ผูกบัญชี-{网站名}','ผูกบัญชี,{网站名}','ผูกบัญชี'),(20,'user','user_shelf','ชั้นหนังสือของฉัน','ชั้นหนังสือของฉัน-{网站名}','ชั้นหนังสือของฉัน','ชั้นหนังสือของฉัน'),(21,'user','user_coll','รายการโปรดของฉัน','รายการโปรดของฉัน-{网站名}','รายการโปรดของฉัน,{网站名}','รายการโปรดของฉัน'),(22,'user','user_fhome','ดูข้อมูลเพื่อน','ดูข้อมูลเพื่อน-{网站名}','ดูข้อมูลเพื่อน,{网站名}','ข้อมูลส่วนตัวของ{用户名}'),(23,'novel','novel_replay','รายการความคิดเห็นนิยาย','รายการความคิดเห็นทั้งหมดของ{名字}','ความคิดเห็น{名字}','รายการความคิดเห็นทั้งหมดของ{名字}'),(24,'user','user_msglist','รายการข้อความ','รายการข้อความ-{网站名}','รายการข้อความ,ชื่อเว็บไซต์}','รายการข้อความ-{网站名}'),(25,'user','user_msg','เนื้อหาข้อความ','เนื้อหาข้อความ-{网站名}','เนื้อหาข้อความ,{网站名}','เนื้อหาข้อความ-{网站名}'),(26,'author','author_index','ศูนย์นักเขียน','ศูนย์นักเขียน-{网站名}','ศูนย์นักเขียน,{网站名}','ศูนย์นักเขียน-{网站名}'),(27,'author','author_novel_novellist','จัดการนิยาย','จัดการผลงาน-{网站名}','จัดการผลงาน,{网站名}','จัดการผลงาน-{网站名}'),(28,'author','author_novel_noveledit','แก้ไขนิยาย','แก้ไขผลงาน-{网站名}','แก้ไขผลงาน,{网站名}','แก้ไขผลงาน-{网站名}'),(29,'author','author_novel_volumelist','รายการเล่มนิยาย','รายการเล่มนิยาย-{网站名}','รายการเล่มนิยาย,{网站名}','รายการเล่มนิยาย-{网站名}'),(30,'author','author_createchapter','สร้างตอนใหม่','สร้างตอนใหม่-{网站名}','สร้างตอนใหม่,{网站名}','สร้างตอนใหม่-{网站名}'),(31,'author','author_novel_draftlist','กล่องฉบับร่างนิยาย','กล่องฉบับร่าง-{网站名}','กล่องฉบับร่าง,{网站名}','กล่องฉบับร่าง-{网站名}'),(32,'author','author_novel_chapterlist','รายการตอนนิยาย','รายการตอน-{网站名}','รายการตอน,{网站名}','รายการตอน-{网站名}'),(33,'author','author_novel_draftedit','แก้ไขฉบับร่างนิยาย','แก้ไขฉบับร่าง-{网站名}','แก้ไขฉบับร่าง,{网站名}','แก้ไขฉบับร่าง-{网站名}'),(34,'zt','zt_type','รายการหัวข้อพิเศษ','รายการหัวข้อพิเศษ-{网站名}','รายการหัวข้อพิเศษ,{网站名}','รายการหัวข้อพิเศษ-{网站名}'),(37,'user','user_vistlist','รายการผู้เยี่ยมชมล่าสุด','รายการผู้เยี่ยมชมล่าสุด-{网站名}','รายการผู้เยี่ยมชมล่าสุด,{网站名}','รายการผู้เยี่ยมชมล่าสุด-{网站名}'),(38,'author','author_basic','ข้อมูลพื้นฐานนักเขียน','ข้อมูลพื้นฐานนักเขียน-{网站名}','ข้อมูลพื้นฐานนักเขียน,{网站名}','ข้อมูลพื้นฐานนักเขียน-{网站名}'),(39,'author','author_incomechapter','รายได้จากตอน','รายได้จากตอน-{网站名}','รายได้จากตอน,{网站名}','รายได้จากตอน-{网站名}'),(40,'author','author_incomedashang','รายได้จากของขวัญ','รายได้จากของขวัญ-{网站名}','รายได้จากของขวัญ,{网站名}','รายได้จากของขวัญ-{网站名}'),(41,'author','author_mentionapply','คำขอถอนเงิน','คำขอถอนเงิน-{网站名}','คำขอถอนเงิน,{网站名}','คำขอถอนเงิน-{网站名}'),(42,'author','author_mentionrecord','ประวัติการถอนเงิน','ประวัติการถอนเงิน-{网站名}','ประวัติการถอนเงิน,{网站名}','ประวัติการถอนเงิน-{网站名}'),(43,'article','article_article','เนื้อหาบทความ','{标题}-{网站名}','{标题}-{网站名}','{标题}-{网站名}'),(44,'article','article_type','รายการหมวดหมู่บทความ','{分类名}-{网站名}','{分类名}-{网站名}','{分类名}-{网站名}'),(45,'article','article_search','ค้นหาบทความ','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}'),(46,'article','article_replay','ความคิดเห็นบทความ','รายการความคิดเห็นทั้งหมดของ{标题}','รายการความคิดเห็นทั้งหมดของ{标题}','รายการความคิดเห็นทั้งหมดของ{标题}'),(47,'message','message_add','เพิ่มข้อเสนอแนะ','เพิ่มข้อเสนอแนะ-{网站名}','เพิ่มข้อเสนอแนะ,{网站名}','เพิ่มข้อเสนอแนะ'),(48,'user','user_sign','เช็คอินผู้ใช้','เช็คอินผู้ใช้','เช็คอินผู้ใช้','เช็คอินผู้ใช้'),(49,'bbs','bbs_index','หน้าแรกฟอรัม','หน้าแรกฟอรัม,{网站名}','หน้าแรกฟอรัม,{网站名}','หน้าแรกฟอรัม,{网站名}'),(50,'bbs','bbs_type','รายการหมวดฟอรัม','รายการหมวดฟอรัม,{网站名}','รายการหมวดฟอรัม,{网站名}','รายการหมวดฟอรัม,{网站名}'),(51,'bbs','bbs_list','รายการหัวข้อ','&#123;版块名字&#125;รายการหัวข้อ','&#123;版块名字&#125;รายการหัวข้อ','&#123;版块名字&#125;รายการหัวข้อ'),(52,'bbs','bbs_bbs','เนื้อหาหัวข้อ','{标题},{网站名}','{标题},{网站名}','{标题},{网站名}'),(75,'article','article_tindex','หน้าแรกหมวดหมู่บทความ','{分类名}-{网站名}','{分类名}-{网站名}','{分类名}-{网站名}'),(54,'bbs','bbs_post','ตั้งกระทู้ใหม่','ตั้งกระทู้ใหม่,{网站名}','ตั้งกระทู้ใหม่,{网站名}','ตั้งกระทู้ใหม่,{网站名}'),(55,'link','link_index','หน้าแรกลิงก์เพื่อน','หน้าแรกลิงก์เพื่อน,{网站名}','หน้าแรกลิงก์เพื่อน,{网站名}','หน้าแรกลิงก์เพื่อน,{网站名}'),(56,'link','link_type','หมวดหมู่ลิงก์เพื่อน','{分类名字},{网站名}','{分类名字},{网站名}','{分类名字},{网站名}'),(57,'link','link_show','แสดงลิงก์เพื่อน','{友链名字},{网站名}','{友链名字},{网站名}','{友链名字},{网站名}'),(58,'link','link_join','ขอลิงก์เพื่อน','ขอลิงก์เพื่อน,{网站名}','ขอลิงก์เพื่อน,{网站名}','ขอลิงก์เพื่อน,{网站名}'),(59,'app','app_type','รายการหมวดหมู่แอป','{类型名}-{网站名}','{类型名},{网站名}','{类型名},{网站名}'),(60,'app','app_app','แนะนำแอป','{名字}-{网站名}','{名字},{网站名}','{名字}-{网站名}'),(61,'app','app_index','หน้าแรกแอป','ศูนย์ดาวน์โหลดแอป-{网站名}','ศูนย์ดาวน์โหลดแอป,{网站名}','ศูนย์ดาวน์โหลดแอป,{网站名}'),(62,'app','app_search','ค้นหาแอป','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}'),(63,'article','article_index','หน้าแรกบทความ','หน้าแรกบทความ-{网站名}	','หน้าแรกบทความ,{网站名}	','หน้าแรกบทความ,{网站名}	'),(64,'bbs','bbs_search','ค้นหาฟอรัม','ค้นหาฟอรัม,{网站名}1','ค้นหาฟอรัม,{网站名}','ค้นหาฟอรัม,{网站名}'),(65,'about','about_type','รายการข้อมูลเกี่ยวกับ','{分类名字}_{网站名}','{分类名字},{网站名}','{分类名字}-{网站名}'),(66,'about','about_about','หน้าเนื้อหาข้อมูลเกี่ยวกับ','{标题}-{网站名}','{标题},{网站名}','{标题}-{网站名}'),(67,'user','user_apilogin','สมัครสมาชิกด้วยบัญชีบุคคลที่สาม','กรอกข้อมูลบัญชีให้ครบถ้วน-{网站名}','กรอกข้อมูลบัญชีให้ครบถ้วน,{网站名}','กรอกข้อมูลบัญชีให้ครบถ้วน,{网站名}'),(68,'picture','picture_picture','เนื้อหาแกลเลอรี','{标题}-{网站名}','{标题}-{网站名}','{标题}-{网站名}'),(69,'picture','picture_type','รายการหมวดหมู่แกลเลอรี','{分类名字}-{网站名}','{分类名字}-{网站名}','{分类名字}-{网站名}'),(70,'picture','picture_search','ค้นหาแกลเลอรี','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}','หน้าผลการค้นหาสำหรับ{搜索词}'),(71,'picture','picture_replay','ความคิดเห็นแกลเลอรี','รายการความคิดเห็นทั้งหมดของ{标题}','รายการความคิดเห็นทั้งหมดของ{标题}','รายการความคิดเห็นทั้งหมดของ{标题}'),(72,'picture','picture_toplist','รายการอันดับแกลเลอรี','อันดับแกลเลอรี{排行类型}','อันดับแกลเลอรี{排行类型}','อันดับแกลเลอรี{排行类型}'),(73,'user','user_signlist','รายการเช็คอินผู้ใช้','รายการเช็คอินผู้ใช้','รายการเช็คอินผู้ใช้','รายการเช็คอินผู้ใช้'),(74,'novel','novel_index','หน้าแรกนิยาย','หน้าแรกนิยาย','หน้าแรกนิยาย','หน้าแรกนิยาย'),(76,'picture','picture_index','หน้าแรกแกลเลอรี','หน้าแรกแกลเลอรี-{网站名}','หน้าแรกแกลเลอรี-{网站名}','หน้าแรกแกลเลอรี-{网站名}'),(77,'user','user_rec','รายการแนะนำของฉัน','รายการแนะนำของฉัน-{网站名}','รายการแนะนำของฉัน','รายการแนะนำของฉัน'),(78,'user','user_dingyue','รายการติดตามของฉัน','รายการติดตามของฉัน-{网站名}','รายการติดตามของฉัน','รายการติดตามของฉัน'),(79,'user','user_fcoll','รายการโปรดของเพื่อน','รายการโปรดของ{好友昵称}-{网站名}','รายการโปรดของ{好友昵称},{网站名}','รายการโปรดของ{好友昵称},{网站名}'),(80,'user','user_fdingyue','รายการติดตามของเพื่อน','รายการติดตามของ{好友昵称}-{网站名}','รายการติดตามของ{好友昵称},{网站名}','รายการติดตามของ{好友昵称},{网站名}'),(81,'user','user_frec','รายการแนะนำของเพื่อน','รายการแนะนำของ{好友昵称}-{网站名}','รายการติดตามของ{好友昵称},{网站名}','รายการแนะนำของ{好友昵称},{网站名}'),(82,'user','user_fshelf','ชั้นหนังสือเพื่อน','ชั้นหนังสือของ{好友昵称}-{网站名}','ชั้นหนังสือของ{好友昵称},{网站名}','ชั้นหนังสือของ{好友昵称},{网站名}'),(83,'novel','novel_tindex','หน้าแรกหมวดหมู่','{分类名字}-หน้าแรกหมวดหมู่นิยาย-{网站名}','{分类名字}-หน้าแรกหมวดหมู่นิยาย-{网站名}','{分类名字}-หน้าแรกหมวดหมู่นิยาย-{网站名}'),(84,'author','author_apply','สมัครเป็นนักเขียน','สมัครเป็นนักเขียน-{网站名}','สมัครเป็นนักเขียน,{网站名}','สมัครเป็นนักเขียน-{网站名}'),(85,'author','author_agreement','ข้อตกลงการสมัครเป็นนักเขียน','ข้อตกลงการสมัครเป็นนักเขียน-{网站名}','ข้อตกลงการสมัครเป็นนักเขียน,{网站名}','ข้อตกลงการสมัครเป็นนักเขียน-{网站名}'),(86,'author','author_novel_volumeedit','แก้ไขเล่มนิยาย','แก้ไขเล่มนิยาย-{网站名}','แก้ไขเล่มนิยาย,{网站名}','แก้ไขเล่มนิยาย-{网站名}'),(87,'author','author_article_articlelist','รายการบทความที่ส่งเข้ามา','รายการบทความที่ส่งเข้ามา-{网站名}','รายการบทความที่ส่งเข้ามา,{网站名}','รายการบทความที่ส่งเข้ามา-{网站名}'),(88,'author','author_article_draftedit','แก้ไขฉบับร่างบทความ','แก้ไขฉบับร่าง-{网站名}','แก้ไขฉบับร่าง,{网站名}','แก้ไขฉบับร่าง-{网站名}'),(89,'author','author_article_draftlist','กล่องฉบับร่างบทความ','กล่องฉบับร่าง-{网站名}','กล่องฉบับร่าง,{网站名}','กล่องฉบับร่าง-{网站名}'),(90,'author','author_article_articleedit','แก้ไขบทความ','แก้ไขบทความ-{网站名}','แก้ไขบทความ,{网站名}','แก้ไขบทความ-{网站名}'),(91,'user','user_charge','เติมเงินออนไลน์','เติมเงินออนไลน์-{网站名}','เติมเงินออนไลน์,{网站名}','เติมเงินออนไลน์-{网站名}'),(92,'author','author_novel_incomelist','รายการรายได้นิยาย','รายการรายได้นิยาย-{网站名}','รายการรายได้นิยาย,{网站名}','รายการรายได้นิยาย-{网站名}'),(93,'user','user_cash_apply','ขอถอนเงินออนไลน์','ขอถอนเงินออนไลน์-{网站名}','ขอถอนเงินออนไลน์,{网站名}','ขอถอนเงินออนไลน์-{网站名}'),(94,'user','user_cash_list','ประวัติคำขอถอนเงิน','ประวัติคำขอถอนเงิน-{网站名}','ประวัติคำขอถอนเงิน,{网站名}','ประวัติคำขอถอนเงิน-{网站名}'),(95,'about','about_tindex','หน้าแรกเกี่ยวกับ','หน้าแรกเกี่ยวกับ-{网站名}','หน้าแรกเกี่ยวกับ,{网站名}','หน้าแรกเกี่ยวกับ-{网站名}'),(96,'down','down_down','เนื้อหาดาวน์โหลด','{下载内容}-{网站名}','{下载内容},{网站名}','{下载内容}-{网站名}'),(97,'novel','novel_index_boy','หน้าแรกนิยายสำหรับผู้ชาย','หน้าแรกนิยายสำหรับผู้ชาย','หน้าแรกนิยายสำหรับผู้ชาย','หน้าแรกนิยายสำหรับผู้ชาย'),(98,'novel','novel_index_girl','หน้าแรกนิยายสำหรับผู้หญิง','หน้าแรกนิยายสำหรับผู้หญิง','หน้าแรกนิยายสำหรับผู้หญิง','หน้าแรกนิยายสำหรับผู้หญิง'),(99,'user','user_read','ประวัติการอ่าน','ประวัติการอ่าน-{网站名}','ประวัติการอ่าน,{网站名}','ประวัติการอ่าน-{网站名}'),(100,'user','user_sub','รายการติดตามของฉัน','รายการติดตามของฉัน-{网站名}','รายการติดตามของฉัน,{网站名}','รายการติดตามของฉัน-{网站名}'),(101,'user','user_charge_code','ชำระเงินด้วยการสแกน','ชำระเงินออนไลน์ด้วยการสแกนโค้ด{支付方式}-{网站名}','ชำระเงินออนไลน์ด้วยการสแกนโค้ด{支付方式},{网站名}','ชำระเงินออนไลน์ด้วยการสแกนโค้ด{支付方式}-{网站名}'),(102,'user','user_charge_success','ชำระเงินสำเร็จ','ชำระเงินสำเร็จ-{网站名}','ชำระเงินสำเร็จ,{网站名}','ชำระเงินสำเร็จ-{网站名}'),(103,'zt','zt_zt','รายละเอียดหัวข้อพิเศษ','{名字}-{网站名}','{名字},{网站名}','{名字}-{网站名}'),(104,'app','app_replay','รายการความคิดเห็น{名字}','รายการความคิดเห็นทั้งหมดของ{名字}','ความคิดเห็น{名字}','รายการความคิดเห็นทั้งหมดของ{名字}'),(105,'picture','picture_tindex','หน้าแรกหมวดหมู่','{分类名字}-หน้าแรกหมวดหมู่แกลเลอรี-{网站名}','{分类名字}-หน้าแรกหมวดหมู่แกลเลอรี-{网站名}','{分类名字}-หน้าแรกหมวดหมู่นิยาย-{网站名}'),(106,'author','author_author','ศูนย์ส่วนตัวนักเขียน','{笔名}-{网站名}','{笔名},{网站名}','{笔名}-{网站名}'),(107,'author','author_novel_statistics','สถิตินิยาย','สถิตินิยาย','สถิตินิยาย','สถิตินิยาย'),(108,'editor','editor_index','แก้ไขหน้าแรก','แก้ไขหน้าแรก-{网站名}','แก้ไขหน้าแรก,{网站名}','แก้ไขหน้าแรก-{网站名}'),(109,'editor','editor_novel','แก้ไขการตรวจสอบนิยายใหม่','ตรวจสอบนิยายใหม่-{网站名}','แก้ไขหน้าแรก,{网站名}','แก้ไขหน้าแรก-{网站名}'),(110,'editor','editor_novel_cover','แก้ไขการตรวจสอบปก','ตรวจสอบปก-{网站名}','แก้ไขหน้าแรก,{网站名}','แก้ไขหน้าแรก-{网站名}'),(111,'editor','editor_novel_chapter','แก้ไขการตรวจสอบตอน','ตรวจสอบตอน-{网站名}','แก้ไขหน้าแรก,{网站名}','แก้ไขหน้าแรก-{网站名}'),(112,'editor','editor_basic','แก้ไขข้อมูลพื้นฐาน','ข้อมูลพื้นฐาน-{网站名}','แก้ไขหน้าแรก,{网站名}','แก้ไขหน้าแรก-{网站名}');
DROP TABLE IF EXISTS `wm_seo_spider`;
CREATE TABLE `wm_seo_spider` (
  `spider_id` int NOT NULL AUTO_INCREMENT,
  `spider_group` varchar(30) DEFAULT NULL COMMENT 'กลุ่มของสไปเดอร์',
  `spider_group_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อกลุ่มของสไปเดอร์',
  `spider_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อของสไปเดอร์',
  `spider_title` varchar(60) DEFAULT NULL COMMENT 'ตัวระบุของสไปเดอร์',
  `spider_url` varchar(1000) DEFAULT NULL COMMENT 'url ที่สไปเดอร์เข้าถึง',
  `spider_ua` varchar(1000) DEFAULT NULL COMMENT 'ua ของสไปเดอร์',
  `spider_time` int DEFAULT NULL COMMENT 'เวลาที่สไปเดอร์เข้าถึง',
  PRIMARY KEY (`spider_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการทำงานของสไปเดอร์';
DROP TABLE IF EXISTS `wm_seo_urls`;
CREATE TABLE `wm_seo_urls` (
  `urls_id` int NOT NULL AUTO_INCREMENT,
  `urls_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่สังกัด',
  `urls_page` varchar(50) NOT NULL COMMENT 'ตัวระบุหน้าเพจ',
  `urls_pagename` varchar(60) DEFAULT NULL COMMENT 'ชื่อหน้าเพจ',
  `urls_url1` varchar(250) NOT NULL COMMENT 'ที่อยู่แบบไดนามิก',
  `urls_url2` varchar(250) NOT NULL COMMENT 'ที่อยู่สแตติก',
  `urls_url3` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่ในโหมดปกติ',
  `urls_url4` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่โหมดเข้ากันได้',
  `urls_url5` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่โหมด PATHINFO',
  `urls_url6` varchar(250) DEFAULT NULL COMMENT 'ที่อยู่โหมด REWRITE',
  PRIMARY KEY (`urls_id`),
  UNIQUE KEY `page` (`urls_page`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb3 COMMENT='ที่อยู่สแตติกเสมือน SEO';
INSERT INTO `wm_seo_urls` VALUES (1,'all','index','หน้าแรก','/index.php?pt={pt}','/index.html','/','/','/','/'),(2,'novel','novel_type','รายการนิยาย','/module/novel/type.php?pt={pt}&tid={tid}&page={page}','/{tid}/list/{page}.html','/?pt={pt}&module=novel&file=type&tid={tid}&page={page}','/?path=/novel/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/novel/type/pt/{pt}/tid/{tid}/page/{page}','/novel/type/pt/{pt}/tid/{tid}/page/{page}'),(3,'novel','novel_info','แนะนำนิยาย','/module/novel/info.php?pt={pt}&tid={tid}&nid={nid}','/{tid}/{nid}/info.html','/?module=novel&file=info&pt={pt}&tid={tid}&nid={nid}','/?path=/novel/info/pt/{pt}/tid/{tid}/nid/{nid}','/index.php/novel/info/pt/{pt}/tid/{tid}/nid/{nid}','/novel/info/pt/{pt}/tid/{tid}/nid/{nid}'),(4,'novel','novel_menu','สารบัญนิยาย','/module/novel/menu.php?pt={pt}&tid={tid}&nid={nid}&page={page}','/{tid}/{nid}/menu/{page}.html','/?module=novel&file=menu&pt={pt}&tid={tid}&nid={nid}&page={page}','/?path=/novel/menu/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/index.php/novel/menu/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/novel/menu/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}'),(5,'novel','novel_read','อ่านนิยาย','/module/novel/read.php?pt={pt}&tid={tid}&nid={nid}&cid={cid}','/{tid}/{nid}/read/{cid}.html','/?module=novel&file=read&pt={pt}&tid={tid}&nid={nid}&cid={cid}','/?path=/novel/read/pt/{pt}/tid/{tid}/nid/{nid}/cid/{cid}','/index.php/novel/read/pt/{pt}/tid/{tid}/nid/{nid}/cid/{cid}','/novel/read/pt/{pt}/tid/{tid}/nid/{nid}/cid/{cid}'),(6,'novel','novel_topindex','หน้าแรกจัดอันดับนิยาย','/module/novel/topindex.php?pt={pt}','/top/index.html','/?module=novel&file=topindex&pt={pt}','/?path=/novel/topindex/pt/{pt}','/index.php/novel/topindex/pt/{pt}','/novel/topindex/pt/{pt}'),(7,'novel','novel_search','ค้นหานิยาย','/module/novel/search.php?pt={pt}&type={type}&key={key}&page={page}','/search/{type}/{key}/{page}.html','/?module=novel&file=search&pt={pt}&type={type}&key={key}&page={page}','/?path=/novel/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/index.php/novel/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/novel/search/pt/{pt}/type/{type}/key/{key}/page/{page}'),(8,'novel','novel_toplist','รายการจัดอันดับนิยาย','/module/novel/toplist.php?pt={pt}&tid={tid}&type={type}&page={page}','/top/list/{tid}/{type}/{page}.html','/?module=novel&file=toplist&pt={pt}&tid={tid}&type={type}&page={page}','/?path=/novel/toplist/pt/{pt}/tid/{tid}/type/{type}/page/{page}','/index.php/novel/toplist/pt/{pt}/tid/{tid}/type/{type}/page/{page}','/novel/toplist/pt/{pt}/tid/{tid}/type/{type}/page/{page}'),(9,'user','user_login','ผู้ใช้เข้าสู่ระบบ','/module/user/login.php?pt={pt}','/module/user/login.php?pt={pt}','/?module=user&file=login&pt={pt}','/?path=/user/login/pt/{pt}','/index.php/user/login/pt/{pt}','/user/login/pt/{pt}'),(10,'user','user_reg','ผู้ใช้สมัครสมาชิก','/module/user/reg.php?pt={pt}','/module/user/reg.php?pt={pt}','/?module=user&file=reg&pt={pt}','/?path=/user/reg/pt/{pt}','/index.php/user/reg/pt/{pt}','/user/reg/pt/{pt}'),(11,'user','user_getpsw','กู้คืนรหัสผ่าน','/module/user/getpsw.php?pt={pt}','/module/user/getpsw.php?pt={pt}','/?module=user&file=getpsw&pt={pt}','/?path=/user/getpsw/pt/{pt}','/index.php/user/getpsw/pt/{pt}','/user/getpsw/pt/{pt}'),(12,'user','user_home','ศูนย์ของฉัน','/module/user/home.php?pt={pt}','/module/user/home.php?pt={pt}','/?module=user&file=home&pt={pt}','/?path=/user/home/pt/{pt}','/index.php/user/home/pt/{pt}','/user/home/pt/{pt}'),(13,'user','user_exit','ออกจากระบบ','/module/user/exit.php?pt={pt}','/module/user/exit.php?pt={pt}','/?module=user&file=exit&pt={pt}','/?path=/user/exit/pt/{pt}','/index.php/user/exit/pt/{pt}','/user/exit/pt/{pt}'),(14,'user','user_basic','ข้อมูลผู้ใช้','/module/user/basic.php?pt={pt}','/module/user/basic.php?pt={pt}','/?module=user&file=basic&pt={pt}','/?path=/user/basic/pt/{pt}','/index.php/user/basic/pt/{pt}','/user/basic/pt/{pt}'),(16,'user','user_attribute','คุณสมบัติผู้ใช้','/module/user/attribute.php?pt={pt}','/module/user/attribute.php?pt={pt}','/?module=user&file=attribute&pt={pt}','/?path=/user/attribute/pt/{pt}','/index.php/user/attribute/pt/{pt}','/user/attribute/pt/{pt}'),(18,'user','user_head','เปลี่ยนรูปโปรไฟล์','/module/user/head.php?pt={pt}','/module/user/head.php?pt={pt}','/?module=user&file=head&pt={pt}','/?path=/user/head/pt/{pt}','/index.php/user/head/pt/{pt}','/user/head/pt/{pt}'),(19,'user','user_uppsw','เปลี่ยนรหัสผ่าน','/module/user/uppsw.php?pt={pt}','/module/user/uppsw.php?pt={pt}','/?module=user&file=uppsw&pt={pt}','/?path=/user/uppsw/pt/{pt}','/index.php/user/uppsw/pt/{pt}','/user/uppsw/pt/{pt}'),(20,'user','user_bind','ผูกบัญชี','/module/user/bind.php?pt={pt}','/module/user/bind.php?pt={pt}','/?module=user&file=bind&pt={pt}','/?path=/user/bind/pt/{pt}','/index.php/user/bind/pt/{pt}','/user/bind/pt/{pt}'),(22,'user','user_coll','รายการโปรดผู้ใช้ ฯลฯ','/module/user/coll.php?module={module}&type={type}&page={page}&pt={pt}','/module/user/coll.php?module={module}&type={type}&page={page}&pt={pt}','/?module=user&file=coll&module={module}&type={type}&page={page}&pt={pt}','/?path=/user/coll/module/{module}/type/{type}/page/{page}/pt/{pt}','/index.php/user/coll/module/{module}/type/{type}/page/{page}/pt/{pt}','/user/coll/module/{module}/type/{type}/page/{page}/pt/{pt}'),(24,'novel','novel_replay','รายการความคิดเห็นนิยาย','/module/novel/replay.php?pt={pt}&tid={tid}&nid={nid}&page={page}','/{tid}/{nid}/replay/{page}.html','/?module=novel&file=replay&pt={pt}&tid={tid}&nid={nid}&page={page}','/?path=/novel/replay/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/index.php/novel/replay/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/novel/replay/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}'),(26,'diy','diy_diy','หน้ากำหนดเอง','/module/diy/diy.php?pt={pt}&did={did}','/diy/{pinyin}/index.html','/?module=diy&file=diy&pt={pt}&did={did}','/?path=/diy/diy/pt/{pt}/did/{did}','/index.php/diy/diy/pt/{pt}/did/{did}','/diy/diy/pt/{pt}/did/{did}'),(27,'user','user_msglist','รายการข้อความ','/module/user/msglist.php?pt={pt}&page={page}','/module/user/msglist.php?pt={pt}&page={page}','/?module=user&file=msglist&pt={pt}&page={page}','/?path=/user/msglist/pt/{pt}/page/{page}','/index.php/user/msglist/pt/{pt}/page/{page}','/user/msglist/pt/{pt}/page/{page}'),(28,'user','user_msg','เนื้อหาข้อความ','/module/user/msg.php?pt={pt}&mid={mid}','/module/user/msg.php?pt={pt}&mid={mid}','/?module=user&file=msg&pt={pt}&mid={mid}','/?path=/user/msg/pt/{pt}/mid/{mid}','/index.php/user/msg/pt/{pt}/mid/{mid}','/user/msg/pt/{pt}/mid/{mid}'),(29,'author','author_index','หน้าแรกผู้แต่ง','/module/author/index.php?pt={pt}','/module/author/index.php?pt={pt}','/?module=author&file=index&pt={pt}','/?path=/author/index/pt/{pt}','/index.php/author/index/pt/{pt}','/author/index/pt/{pt}'),(30,'author','author_novel_noveledit','สร้างนิยายใหม่','/module/author/novel_noveledit.php?pt={pt}&nid={nid}','/module/author/novel_noveledit.php?pt={pt}&nid={nid}','/?module=author&file=novel_noveledit&pt={pt}&nid={nid}','/?path=/author/novel_noveledit/pt/{pt}/nid/{nid}','/index.php/author/novel_noveledit/pt/{pt}/nid/{nid}','/author/novel_noveledit/pt/{pt}/nid/{nid}'),(31,'author','author_novel_novellist','จัดการนิยาย','/module/author/novel_novellist.php?pt={pt}&page={page}','/module/author/novel_novellist.php?pt={pt}&page={page}','/?module=author&file=novel_novellist&pt={pt}&page={page}','/?path=/author/novel_novellist/pt/{pt}/page/{page}','/index.php/author/novel_novellist/pt/{pt}/page/{page}','/author/novel_novellist/pt/{pt}/page/{page}'),(32,'author','author_novel_volumelist','รายการเล่มนิยาย','/module/author/novel_volumelist.php?pt={pt}&nid={nid}&page={page}','/module/author/novel_volumelist.php?pt={pt}&nid={nid}&page={page}','/?module=author&file=novel_volumelist&pt={pt}&nid={nid}&page={page}','/?path=/author/novel_volumelist/pt/{pt}/nid/{nid}/page/{page}','/index.php/author/novel_volumelist/pt/{pt}/nid/{nid}/page/{page}','/author/novel_volumelist/pt/{pt}/nid/{nid}/page/{page}'),(33,'author','author_createchapter','สร้างตอน','/module/author/createchapter.php?pt={pt}&cid={cid}','/module/author/createchapter.php?pt={pt}&cid={cid}','/?module=author&file=createchapter&pt={pt}&cid={cid}','/?path=/author/createchapter/pt/{pt}/cid/{cid}','/index.php/author/createchapter/pt/{pt}/cid/{cid}','/author/createchapter/pt/{pt}/cid/{cid}'),(34,'author','author_novel_draftlist','รายการฉบับร่างนิยาย','/module/author/novel_draftlist.php?nid={nid}&page={page}&pt={pt}','/module/author/novel_draftlist.php?nid={nid}&page={page}&pt={pt}','/?module=author&file=novel_draftlist&nid={nid}&page={page}&pt={pt}','/?path=/author/novel_draftlist/nid/{nid}/page/{page}/pt/{pt}','/index.php/author/novel_draftlist/nid/{nid}/page/{page}/pt/{pt}','/author/novel_draftlist/nid/{nid}/page/{page}/pt/{pt}'),(36,'author','author_novel_draftedit','แก้ไขฉบับร่างนิยาย','/module/author/novel_draftedit.php?pt={pt}&nid={nid}&did={did}','/module/author/novel_draftedit.php?pt={pt}&nid={nid}&did={did}','/?module=author&file=novel_draftedit&pt={pt}&nid={nid}&did={did}','/?path=/author/novel_draftedit/pt/{pt}/nid/{nid}/did/{did}','/index.php/author/novel_draftedit/pt/{pt}/nid/{nid}/did/{did}','/author/novel_draftedit/pt/{pt}/nid/{nid}/did/{did}'),(37,'author','author_novel_chapterlist','รายการตอนนิยาย','/module/author/novel_chapterlist.php?pt={pt}&nid={nid}&page={page}','/module/author/novel_chapterlist.php?pt={pt}&nid={nid}&page={page}','/?module=author&file=novel_chapterlist&pt={pt}&nid={nid}&page={page}','/?path=/author/novel_chapterlist/pt/{pt}/nid/{nid}/page/{page}','/index.php/author/novel_chapterlist/pt/{pt}/nid/{nid}/page/{page}','/author/novel_chapterlist/pt/{pt}/nid/{nid}/page/{page}'),(38,'zt','zt_zt','เนื้อหาหัวข้อพิเศษ','/module/zt/zt.php?pt={pt}&zid={zid}','/module/zt/zt.php?pt={pt}&zid={zid}','/?module=zt&file=zt&pt={pt}&zid={zid}','/?path=/zt/zt/pt/{pt}/zid/{zid}','/index.php/zt/zt/pt/{pt}/zid/{zid}','/zt/zt/pt/{pt}/zid/{zid}'),(39,'zt','zt_type','หมวดหมู่หัวข้อพิเศษ','/module/zt/type.php?pt={pt}&tid={tid}&page={page}','/module/zt/type.php?pt={pt}&tid={tid}&page={page}','/?module=zt&file=type&pt={pt}&tid={tid}&page={page}','/?path=/zt/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/zt/type/pt/{pt}/tid/{tid}/page/{page}','/zt/type/pt/{pt}/tid/{tid}/page/{page}'),(42,'user','user_fvistlist','รายการผู้เยี่ยมเพื่อน','/module/user/fvistlist.php?pt={pt}&uid={uid}&page={page}','/module/user/fvistlist.php?pt={pt}&uid={uid}&page={page}','/?module=user&file=fvistlist&pt={pt}&uid={uid}&page={page}','/?path=/user/fvistlist/pt/{pt}/uid/{uid}/page/{page}','/index.php/user/fvistlist/pt/{pt}/uid/{uid}/page/{page}','/user/fvistlist/pt/{pt}/uid/{uid}/page/{page}'),(43,'author','author_basic','ข้อมูลพื้นฐานผู้แต่ง','/module/author/basic.php?pt={pt}','/module/author/basic.php?pt={pt}','/?module=author&file=basic&pt={pt}','/?path=/author/basic/pt/{pt}','/index.php/author/basic/pt/{pt}','/author/basic/pt/{pt}'),(44,'author','author_incomechapter','รายได้จากตอน','/module/author/incomechapter.php?pt={pt}&page={page}','/module/author/incomechapter.php?pt={pt}&page={page}','/?module=author&file=incomechapter&pt={pt}&page={page}','/?path=/author/incomechapter/pt/{pt}/page/{page}','/index.php/author/incomechapter/pt/{pt}/page/{page}','/author/incomechapter/pt/{pt}/page/{page}'),(45,'author','author_incomedashang','รายได้จากรางวัล','/module/author/incomedashang.php?pt={pt}&page={page}','/module/author/incomedashang.php?pt={pt}&page={page}','/?module=author&file=incomedashang&pt={pt}&page={page}','/?path=/author/incomedashang/pt/{pt}/page/{page}','/index.php/author/incomedashang/pt/{pt}/page/{page}','/author/incomedashang/pt/{pt}/page/{page}'),(46,'author','author_mentionapply','คำขอถอนเงิน','/module/author/mentionapply.php?pt={pt}','/module/author/mentionapply.php?pt={pt}','/?module=author&file=mentionapply&pt={pt}','/?path=/author/mentionapply/pt/{pt}','/index.php/author/mentionapply/pt/{pt}','/author/mentionapply/pt/{pt}'),(47,'author','author_mentionrecord','ประวัติถอนเงิน','/module/author/mentionrecord.php?pt={pt}&page={page}','/module/author/mentionrecord.php?pt={pt}&page={page}','/?module=author&file=mentionrecord&pt={pt}&page={page}','/?path=/author/mentionrecord/pt/{pt}/page/{page}','/index.php/author/mentionrecord/pt/{pt}/page/{page}','/author/mentionrecord/pt/{pt}/page/{page}'),(48,'article','article_type','รายการบทความ','/module/article/type.php?pt={pt}&tid={tid}&page={page}','/module/article/type.php?pt={pt}&tid={tid}&page={page}','/?module=article&file=type&pt={pt}&tid={tid}&page={page}','/?path=/article/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/article/type/pt/{pt}/tid/{tid}/page/{page}','/article/type/pt/{pt}/tid/{tid}/page/{page}'),(49,'article','article_article','เนื้อหาบทความ','/module/article/article.php?pt={pt}&tid={tid}&aid={aid}','/module/article/article.php?pt={pt}&tid={tid}&aid={aid}','/?module=article&file=article&pt={pt}&tid={tid}&aid={aid}','/?path=/article/article/pt/{pt}/tid/{tid}/aid/{aid}','/index.php/article/article/pt/{pt}/tid/{tid}/aid/{aid}','/article/article/pt/{pt}/tid/{tid}/aid/{aid}'),(50,'article','article_search','ค้นหาบทความ','/module/article/search.php?pt={pt}&key={key}&type={type}&page={page}','/module/article/search.php?pt={pt}&key={key}&type={type}&page={page}','/?module=article&file=search&pt={pt}&key={key}&type={type}&page={page}','/?path=/article/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/index.php/article/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/article/search/pt/{pt}/key/{key}/type/{type}/page/{page}'),(51,'article','article_replay','ความคิดเห็นบทความ','/module/article/replay.php?pt={pt}&tid={tid}&aid={aid}&page={page}','/module/article/replay.php?pt={pt}&tid={tid}&aid={aid}&page={page}','/?module=article&file=replay&pt={pt}&tid={tid}&aid={aid}&page={page}','/?path=/article/replay/pt/{pt}/tid/{tid}/aid/{aid}/page/{page}','/index.php/article/replay/pt/{pt}/tid/{tid}/aid/{aid}/page/{page}','/article/replay/pt/{pt}/tid/{tid}/aid/{aid}/page/{page}'),(52,'novel','novel_index','หน้าแรกนิยาย','/module/novel/index.php?pt={pt}','/novel/index.html','/?module=novel&file=index&pt={pt}','/?path=/novel/index/pt/{pt}','/index.php/novel/index/pt/{pt}','/novel/index/pt/{pt}'),(54,'message','message_add','เพิ่มข้อความ','/module/message/add.php?pt={pt}','/message/{pt}/add.html','/?module=message&file=add&pt={pt}','/?path=/message/add/pt/{pt}','/index.php/message/add/pt/{pt}','/message/add/pt/{pt}'),(55,'user','user_sign','ผู้ใช้เช็กอิน','/module/user/sign.php?pt={pt}','/module/user/sign.php?pt={pt}','/?module=user&file=sign&pt={pt}','/?path=/user/sign/pt/{pt}','/index.php/user/sign/pt/{pt}','/user/sign/pt/{pt}'),(56,'bbs','bbs_index','หน้าแรกฟอรัม','/module/bbs/index.php?pt={pt}','/module/bbs/index.php?pt={pt}','/?module=bbs&file=index&pt={pt}','/?path=/bbs/index/pt/{pt}','/index.php/bbs/index/pt/{pt}','/bbs/index/pt/{pt}'),(57,'bbs','bbs_bbs','เนื้อหากระทู้','/module/bbs/bbs.php?pt={pt}&tid={tid}&bid={bid}&page={page}','/module/bbs/bbs.php?pt={pt}&tid={tid}&bid={bid}&page={page}','/?module=bbs&file=bbs&pt={pt}&tid={tid}&bid={bid}&page={page}','/?path=/bbs/bbs/pt/{pt}/tid/{tid}/bid/{bid}/page/{page}','/index.php/bbs/bbs/pt/{pt}/tid/{tid}/bid/{bid}/page/{page}','/bbs/bbs/pt/{pt}/tid/{tid}/bid/{bid}/page/{page}'),(58,'bbs','bbs_type','หมวดหมู่บอร์ด','/module/bbs/type.php?pt={pt}&tid={tid}','/module/bbs/type.php?pt={pt}&tid={tid}','/?module=bbs&file=type&pt={pt}&tid={tid}','/?path=/bbs/type/pt/{pt}/tid/{tid}','/index.php/bbs/type/pt/{pt}/tid/{tid}','/bbs/type/pt/{pt}/tid/{tid}'),(59,'bbs','bbs_list','รายการกระทู้','/module/bbs/list.php?pt={pt}&tid={tid}&page={page}','/module/bbs/list.php?pt={pt}&tid={tid}&page={page}','/?module=bbs&file=list&pt={pt}&tid={tid}&page={page}','/?path=/bbs/list/pt/{pt}/tid/{tid}/page/{page}','/index.php/bbs/list/pt/{pt}/tid/{tid}/page/{page}','/bbs/list/pt/{pt}/tid/{tid}/page/{page}'),(83,'article','article_tindex','หน้าแรกหมวดบทความ','/module/article/tindex.php?pt={pt}&tid={tid}','/module/article/tindex.php?pt={pt}&tid={tid}','/?module=article&file=tindex&pt={pt}&tid={tid}','/?path=/article/tindex/pt/{pt}/tid/{tid}','/index.php/article/tindex/pt/{pt}/tid/{tid}','/article/tindex/pt/{pt}/tid/{tid}'),(61,'bbs','bbs_post','ตั้งกระทู้','/module/bbs/post.php?pt={pt}&tid={tid}&bid={bid}','/module/bbs/post.php?pt={pt}&tid={tid}&bid={bid}','/?module=bbs&file=post&pt={pt}&tid={tid}&bid={bid}','/?path=/bbs/post/pt/{pt}/tid/{tid}/bid/{bid}','/index.php/bbs/post/pt/{pt}/tid/{tid}/bid/{bid}','/bbs/post/pt/{pt}/tid/{tid}/bid/{bid}'),(62,'link','link_index','หน้าแรกลิงก์เพื่อน','/module/link/index.php?pt={pt}','/module/link/index.php?pt={pt}','/?module=link&file=index&pt={pt}','/?path=/link/index/pt/{pt}','/index.php/link/index/pt/{pt}','/link/index/pt/{pt}'),(63,'link','link_show','แสดงลิงก์เพื่อน','/module/link/show.php?pt={pt}&tid={tid}&lid={lid}','/module/link/show.php?pt={pt}&tid={tid}&lid={lid}','/?module=link&file=show&pt={pt}&tid={tid}&lid={lid}','/?path=/link/show/pt/{pt}/tid/{tid}/lid/{lid}','/index.php/link/show/pt/{pt}/tid/{tid}/lid/{lid}','/link/show/pt/{pt}/tid/{tid}/lid/{lid}'),(64,'link','link_link','คลิกลิงก์เพื่อน','/module/link/click.php?lid={lid}&t={t}','/module/link/click.php?lid={lid}&t={t}','/?module=link&file=click&lid={lid}&t={t}','/?path=/link/click/lid/{lid}/t/{t}','/index.php/link/click/lid/{lid}/t/{t}','/link/click/lid/{lid}/t/{t}'),(65,'link','link_type','รายการหมวดลิงก์เพื่อน','/module/link/type.php?pt={pt}&tid={tid}&page={page}','/module/link/type.php?pt={pt}&tid={tid}&page={page}','/?module=link&file=type&pt={pt}&tid={tid}&page={page}','/?path=/link/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/link/type/pt/{pt}/tid/{tid}/page/{page}','/link/type/pt/{pt}/tid/{tid}/page/{page}'),(66,'link','link_join','ขอลิงก์เพื่อน','/module/link/join.php?pt={pt}','/module/link/join.php?pt={pt}','/?module=link&file=join&pt={pt}','/?path=/link/join/pt/{pt}','/index.php/link/join/pt/{pt}','/link/join/pt/{pt}'),(67,'app','app_type','รายการหมวดแอป','/module/app/type.php?pt={pt}&tid={tid}&page={page}','/module/app/type.php?pt={pt}&tid={tid}&page={page}','/?module=app&file=type&pt={pt}&tid={tid}&page={page}','/?path=/app/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/app/type/pt/{pt}/tid/{tid}/page/{page}','/app/type/pt/{pt}/tid/{tid}/page/{page}'),(111,'app','app_type_retrieval','ตัวกรองรายการแอป','/module/app/type.php?pt={pt}&tid={tid}&page={page}&rec={rec}&lang={lang}&cost={cost}&size={size}&platform={platform}&order={order}','/{tid}/list/{rec}_{lang}_{cost}_{size}_{platform}_{order}_{page}.html','/?module=app&file=type&pt={pt}&tid={tid}&page={page}&rec={rec}&lang={lang}&cost={cost}&size={size}&platform={platform}&order={order}','/?path=/app/type/pt/{pt}/tid/{tid}/page/{page}/rec/{rec}/lang/{lang}/cost/{cost}/size/{size}/platform/{platform}/order/{order}','/index.php/app/type/pt/{pt}/tid/{tid}/page/{page}/rec/{rec}/lang/{lang}/cost/{cost}/size/{size}/platform/{platform}/order/{order}','/app/type/pt/{pt}/tid/{tid}/page/{page}/rec/{rec}/lang/{lang}/cost/{cost}/size/{size}/platform/{platform}/order/{order}'),(68,'app','app_app','เนื้อหาแอป','/module/app/app.php?pt={pt}&tid={tid}&aid={aid}','/module/app/app.php?pt={pt}&tid={tid}&aid={aid}','/?module=app&file=app&pt={pt}&tid={tid}&aid={aid}','/?path=/app/app/pt/{pt}/tid/{tid}/aid/{aid}','/index.php/app/app/pt/{pt}/tid/{tid}/aid/{aid}','/app/app/pt/{pt}/tid/{tid}/aid/{aid}'),(69,'app','app_index','หน้าแรกแอป','/module/app/index.php?pt={pt}','/module/app/index.php?pt={pt}','/?module=app&file=index&pt={pt}','/?path=/app/index/pt/{pt}','/index.php/app/index/pt/{pt}','/app/index/pt/{pt}'),(70,'down','down_down','เนื้อหาดาวน์โหลด','/module/down/down.php?pt={pt}&module={module}&fid={fid}&cid={cid}','/module/down/down.php?pt={pt}&module={module}&fid={fid}&cid={cid}','/?module=down&file=down&pt={pt}&module={module}&fid={fid}&cid={cid}','/?path=/down/down/pt/{pt}/module/{module}/fid/{fid}/cid/{cid}','/index.php/down/down/pt/{pt}/module/{module}/fid/{fid}/cid/{cid}','/down/down/pt/{pt}/module/{module}/fid/{fid}/cid/{cid}'),(71,'app','app_search','ค้นหาแอป','/module/app/search.php?pt={pt}&type={type}&key={key}&page={page}','/module/app/search.php?pt={pt}&type={type}&key={key}&page={page}','/?module=app&file=search&pt={pt}&type={type}&key={key}&page={page}','/?path=/app/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/index.php/app/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/app/search/pt/{pt}/type/{type}/key/{key}/page/{page}'),(72,'article','article_index','หน้าแรกบทความ','/module/article/index.php?pt={pt}','/html/article/index_{pt}.html','/?module=article&file=index&pt={pt}','/?path=/article/index/pt/{pt}','/index.php/article/index/pt/{pt}','/article/index/pt/{pt}'),(73,'bbs','bbs_search','ค้นหาฟอรัม','/module/bbs/search.php?pt={pt}&key={key}&type={type}&page={page}','/module/bbs/search.php?pt={pt}&key={key}&type={type}&page={page}','/?module=bbs&file=search&pt={pt}&key={key}&type={type}&page={page}','/?path=/bbs/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/index.php/bbs/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/bbs/search/pt/{pt}/key/{key}/type/{type}/page/{page}'),(74,'about','about_type','รายการข้อมูลเกี่ยวกับ','/module/about/type.php?pt={pt}&tid={tid}','/module/about/type.php?pt={pt}&tid={tid}','/?module=about&file=type&pt={pt}&tid={tid}','/?path=/about/type/pt/{pt}/tid/{tid}','/index.php/about/type/pt/{pt}/tid/{tid}','/about/type/pt/{pt}/tid/{tid}'),(75,'about','about_about','เนื้อหาข้อมูลเกี่ยวกับ','/module/about/about.php?pt={pt}&aid={aid}','/module/about/about.php?pt={pt}&aid={aid}','/?module=about&file=about&pt={pt}&aid={aid}','/?path=/about/about/pt/{pt}/aid/{aid}','/index.php/about/about/pt/{pt}/aid/{aid}','/about/about/pt/{pt}/aid/{aid}'),(76,'picture','picture_type','รายการแกลเลอรี','/module/picture/type.php?pt={pt}&tid={tid}&page={page}','/module/picture/type.php?pt={pt}&tid={tid}&page={page}','/?module=picture&file=type&pt={pt}&tid={tid}&page={page}','/?path=/picture/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/picture/type/pt/{pt}/tid/{tid}/page/{page}','/picture/type/pt/{pt}/tid/{tid}/page/{page}'),(77,'picture','picture_picture','เนื้อหาแกลเลอรี','/module/picture/picture.php?pt={pt}&tid={tid}&pid={pid}&page={page}','/module/picture/picture.php?pt={pt}&tid={tid}&pid={pid}&page={page}','/?module=picture&file=picture&pt={pt}&tid={tid}&pid={pid}&page={page}','/?path=/picture/picture/pt/{pt}/tid/{tid}/pid/{pid}/page/{page}','/index.php/picture/picture/pt/{pt}/tid/{tid}/pid/{pid}/page/{page}','/picture/picture/pt/{pt}/tid/{tid}/pid/{pid}/page/{page}'),(78,'picture','picture_search','ค้นหาแกลเลอรี','/module/picture/search.php?pt={pt}&key={key}&type={type}&page={page}','/module/picture/search.php?pt={pt}&key={key}&type={type}&page={page}','/?module=picture&file=search&pt={pt}&key={key}&type={type}&page={page}','/?path=/picture/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/index.php/picture/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/picture/search/pt/{pt}/key/{key}/type/{type}/page/{page}'),(79,'picture','picture_replay','ความคิดเห็นแกลเลอรี','/module/picture/replay.php?pt={pt}&tid={tid}&cid={cid}&page={page}','/module/picture/replay.php?pt={pt}&tid={tid}&cid={cid}&page={page}','/?module=picture&file=replay&pt={pt}&tid={tid}&cid={cid}&page={page}','/?path=/picture/replay/pt/{pt}/tid/{tid}/cid/{cid}/page/{page}','/index.php/picture/replay/pt/{pt}/tid/{tid}/cid/{cid}/page/{page}','/picture/replay/pt/{pt}/tid/{tid}/cid/{cid}/page/{page}'),(80,'picture','picture_toplist','รายการจัดอันดับแกลเลอรี','/module/picture/toplist.php?pt={pt}&tid={tid}&page={page}','/module/picture/toplist.php?pt={pt}&tid={tid}&page={page}','/?module=picture&file=toplist&pt={pt}&tid={tid}&page={page}','/?path=/picture/toplist/pt/{pt}/tid/{tid}/page/{page}','/index.php/picture/toplist/pt/{pt}/tid/{tid}/page/{page}','/picture/toplist/pt/{pt}/tid/{tid}/page/{page}'),(81,'user','user_signlist','รายการเช็กอิน','/module/user/signlist.php?pt={pt}&page={page}','/module/user/signlist.php?pt={pt}&page={page}','/?module=user&file=signlist&pt={pt}&page={page}','/?path=/user/signlist/pt/{pt}/page/{page}','/index.php/user/signlist/pt/{pt}/page/{page}','/user/signlist/pt/{pt}/page/{page}'),(23,'user','user_fhome','ข้อมูลเพื่อน','/module/user/fhome.php?pt={pt}&uid={uid}','/module/user/fhome.php?pt={pt}&uid={uid}','/?module=user&file=fhome&pt={pt}&uid={uid}','/?path=/user/fhome/pt/{pt}/uid/{uid}','/index.php/user/fhome/pt/{pt}/uid/{uid}','/user/fhome/pt/{pt}/uid/{uid}'),(82,'user','user_apilogin','เข้าสู่ระบบผ่าน API','/module/user/apilogin.php','/module/user/apilogin.php','/?module=user&file=apilogin','/?path=/user/apilogin','/index.php/user/apilogin','/user/apilogin'),(84,'picture','picture_index','หน้าแรกแกลเลอรี','/module/picture/index.php?pt={pt}','/module/picture/index.php?pt={pt}','/?module=picture&file=index&pt={pt}','/?path=/picture/index/pt/{pt}','/index.php/picture/index/pt/{pt}','/picture/index/pt/{pt}'),(85,'user','user_fcoll','รายการโปรดเพื่อน ฯลฯ','/module/user/fcoll.php?module={module}&type={type}&page={page}&pt={pt}&uid={uid}','/module/user/fcoll.php?module={module}&type={type}&page={page}&pt={pt}&uid={uid}','/?module=user&file=fcoll&module={module}&type={type}&page={page}&pt={pt}&uid={uid}','/?path=/user/fcoll/module/{module}/type/{type}/page/{page}/pt/{pt}/uid/{uid}','/index.php/user/fcoll/module/{module}/type/{type}/page/{page}/pt/{pt}/uid/{uid}','/user/fcoll/module/{module}/type/{type}/page/{page}/pt/{pt}/uid/{uid}'),(86,'novel','novel_tindex','หน้าแรกหมวดนิยาย','/module/novel/tindex.php?pt={pt}&tid={tid}','/{tid}/index.html','/?module=novel&file=tindex&pt={pt}&tid={tid}','/?path=/novel/tindex/pt/{pt}/tid/{tid}','/index.php/novel/tindex/pt/{pt}/tid/{tid}','/novel/tindex/pt/{pt}/tid/{tid}'),(87,'author','author_apply','สมัครเป็นนักเขียน','/module/author/apply.php?pt={pt}','/module/author/apply.php?pt={pt}','/?module=author&file=apply&pt={pt}','/?path=/author/apply/pt/{pt}','/index.php/author/apply/pt/{pt}','/author/apply/pt/{pt}'),(88,'author','author_agreement','ข้อตกลงนักเขียน','/module/author/agreement.php?pt={pt}','/module/author/agreement.php?pt={pt}','/?module=author&file=agreement&pt={pt}','/?path=/author/agreement/pt/{pt}','/index.php/author/agreement/pt/{pt}','/author/agreement/pt/{pt}'),(89,'author','author_novel_volumeedit','แก้ไขเล่มนิยาย','/module/author/novel_volumeedit.php?pt={pt}&nid={nid}&vid={vid}','/module/author/novel_volumeedit.php?pt={pt}&nid={nid}&vid={vid}','/?module=author&file=novel_volumeedit&pt={pt}&nid={nid}&vid={vid}','/?path=/author/novel_volumeedit/pt/{pt}/nid/{nid}/vid/{vid}','/index.php/author/novel_volumeedit/pt/{pt}/nid/{nid}/vid/{vid}','/author/novel_volumeedit/pt/{pt}/nid/{nid}/vid/{vid}'),(90,'author','author_article_articlelist','รายการบทความที่ส่ง','/module/author/article_articlelist.php?pt={pt}&page={page}','/module/author/article_articlelist.php?pt={pt}&page={page}','/?module=author&file=article_articlelist&pt={pt}&page={page}','/?path=/author/article_articlelist/pt/{pt}/page/{page}','/index.php/author/article_articlelist/pt/{pt}/page/{page}','/author/article_articlelist/pt/{pt}/page/{page}'),(91,'author','author_article_draftedit','รายการกล่องฉบับร่าง','/module/author/article_draftedit.php?did={did}&pt={pt}','/module/author/article_draftedit.php?did={did}&pt={pt}','/?module=author&file=article_draftedit&did={did}&pt={pt}','/?path=/author/article_draftedit/did/{did}/pt/{pt}','/index.php/author/article_draftedit/did/{did}/pt/{pt}','/author/article_draftedit/did/{did}/pt/{pt}'),(92,'author','author_article_draftlist','รายการฉบับร่างบทความ','/module/author/article_draftlist.php?page={page}&pt={pt}','/module/author/article_draftlist.php?page={page}&pt={pt}','/?module=author&file=article_draftlist&page={page}&pt={pt}','/?path=/author/article_draftlist/page/{page}/pt/{pt}','/index.php/author/article_draftlist/page/{page}/pt/{pt}','/author/article_draftlist/page/{page}/pt/{pt}'),(93,'author','author_article_articleedit','แก้ไขบทความ','/module/author/article_articleedit.php?id={id}&pt={pt}','/module/author/article_articleedit.php?id={id}&pt={pt}','/?module=author&file=article_articleedit&id={id}&pt={pt}','/?path=/author/article_articleedit/id/{id}/pt/{pt}','/index.php/author/article_articleedit/id/{id}/pt/{pt}','/author/article_articleedit/id/{id}/pt/{pt}'),(94,'sitemap','sitemap_html_index','แผนผัง HTML','/wmcms/module/sitemap/index.php?type=html','/html/sitemap/index.html','/wmcms/module/sitemap/index.php?type=html','/wmcms/module/sitemap/index.php?type=html','/wmcms/module/sitemap/index.php?type=html','/wmcms/module/sitemap/index.php?type=html'),(95,'sitemap','sitemap_xml_index','แผนผัง XML','/wmcms/module/sitemap/index.php?type=xml','/html/sitemap/sitemap.xml','/wmcms/module/sitemap/index.php?type=xml','/wmcms/module/sitemap/index.php?type=xml','/wmcms/module/sitemap/index.php?type=xml','/wmcms/module/sitemap/index.php?type=xml'),(96,'sitemap','sitemap_rss_index','แผนผัง RSS','/wmcms/module/sitemap/index.php?type=rss','/html/sitemap/rss.html','/wmcms/module/sitemap/index.php?type=rss','/wmcms/module/sitemap/index.php?type=rss','/wmcms/module/sitemap/index.php?type=rss','/wmcms/module/sitemap/index.php?type=rss'),(97,'sitemap','sitemap_rss_list','รายการแผนผังเว็บไซต์','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/html/sitemap/rss/{module}/{tid}.xml','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}'),(98,'user','user_charge','เติมเงินออนไลน์','/module/user/charge.php?pt={pt}','/module/user/charge.php?pt={pt}','/?module=user&file=charge&pt={pt}','/?path=/user/charge/pt/{pt}','/index.php/user/charge/pt/{pt}','/user/charge/pt/{pt}'),(99,'author','author_novel_incomelist','รายการรายได้นิยาย','/module/author/novel_incomelist.php?type={type}&page={page}&pt={pt}','/module/author/novel_incomelist.php?type={type}&page={page}&pt={pt}','/?module=author&file=novel_incomelist&type={type}&page={page}&pt={pt}','/?path=/author/novel_incomelist/type/{type}/page/{page}/pt/{pt}','/index.php/author/novel_incomelist/type/{type}/page/{page}/pt/{pt}','/author/novel_incomelist/type/{type}/page/{page}/pt/{pt}'),(100,'user','user_cash_apply','ขอถอนเงินออนไลน์','/module/user/cash_apply.php?pt={pt}','/module/user/cash_apply.php?pt={pt}','/?module=user&file=cash_apply&pt={pt}','/?path=/user/cash_apply/pt/{pt}','/index.php/user/cash_apply/pt/{pt}','/user/cash_apply/pt/{pt}'),(101,'user','user_cash_list','ประวัติคำขอถอนเงิน','/module/user/cash_list.php?page={page}&pt={pt}','/module/user/cash_list.php?page={page}&pt={pt}','/?module=user&file=cash_list&page={page}&pt={pt}','/?path=/user/cash_list/page/{page}/pt/{pt}','/index.php/user/cash_list/page/{page}/pt/{pt}','/user/cash_list/page/{page}/pt/{pt}'),(102,'about','about_tindex','หน้าแรกเกี่ยวกับ','/module/about/tindex.php?pt={pt}&tid={tid}','/module/about/tindex.php?pt={pt}&tid={tid}','/?module=about&file=tindex&pt={pt}&tid={tid}','/?path=/about/tindex/pt/{pt}/tid/{tid}','/index.php/about/tindex/pt/{pt}/tid/{tid}','/about/tindex/pt/{pt}/tid/{tid}'),(103,'sitemap','sitemap_site_index','ข้อมูลแบบมีโครงสร้าง','/wmcms/module/sitemap/index.php?type=site','/html/sitemap/site.xml','/wmcms/module/sitemap/index.php?type=site','/wmcms/module/sitemap/index.php?type=site','/wmcms/module/sitemap/index.php?type=site','/wmcms/module/sitemap/index.php?type=site'),(104,'novel','novel_type_retrieval','ตัวกรองรายการนิยาย','/module/novel/type.php?pt={pt}&tid={tid}&page={page}&process={process}&word={word}&chapter={chapter}&copy={copy}&cost={cost}&letter={letter}&order={order}','/{tid}/list/{process}_{word}_{chapter}_{copy}_{cost}_{letter}_{order}_{page}.html','/?module=novel&file=type&pt={pt}&tid={tid}&page={page}&process={process}&word={word}&chapter={chapter}&copy={copy}&cost={cost}&letter={letter}&order={order}','/?path=/novel/type/pt/{pt}/tid/{tid}/page/{page}/process/{process}/word/{word}/chapter/{chapter}/copy/{copy}/cost/{cost}/letter/{letter}/order/{order}','/index.php/novel/type/pt/{pt}/tid/{tid}/page/{page}/process/{process}/word/{word}/chapter/{chapter}/copy/{copy}/cost/{cost}/letter/{letter}/order/{order}','/novel/type/pt/{pt}/tid/{tid}/page/{page}/process/{process}/word/{word}/chapter/{chapter}/copy/{copy}/cost/{cost}/letter/{letter}/order/{order}'),(105,'novel','novel_index_boy','หน้าแรกนิยายชาย','/module/novel/index_boy.php?pt={pt}','/index_boy.html','/?module=novel&file=index_boy&pt={pt}','/?path=/novel/index_boy/pt/{pt}','/index.php/novel/index_boy/pt/{pt}','/novel/index_boy/pt/{pt}'),(106,'novel','novel_index_girl','หน้าแรกนิยายหญิง','/module/novel/index_girl.php?pt={pt}','/index_girl.html','/?module=novel&file=index_girl&pt={pt}','/?path=/novel/index_girl/pt/{pt}','/index.php/novel/index_girl/pt/{pt}','/novel/index_girl/pt/{pt}'),(107,'user','user_read','ประวัติการอ่าน','/module/user/read.php?pt={pt}&module={module}&page={page}','/module/user/read.php?pt={pt}&module={module}&page={page}','/?module=user&file=read&pt={pt}&module={module}&page={page}','/?path=/user/read/pt/{pt}/module/{module}/page/{page}','/index.php/user/read/pt/{pt}/module/{module}/page/{page}','/user/read/pt/{pt}/module/{module}/page/{page}'),(108,'user','user_charge_code','สแกนจ่ายออนไลน์','/module/user/charge_code.php?pt={pt}&code={code}&sn={sn}','/module/user/charge_code.php?pt={pt}&code={code}&sn={sn}','/?module=user&file=charge_code&pt={pt}&code={code}&sn={sn}','/?path=/user/charge_code/pt/{pt}/code/{code}/sn/{sn}','/index.php/user/charge_code/pt/{pt}/code/{code}/sn/{sn}','/user/charge_code/pt/{pt}/code/{code}/sn/{sn}'),(109,'user','user_charge_success','ชำระเงินสำเร็จ','/module/user/charge_success.php?pt={pt}','/module/user/charge_success.php?pt={pt}','/?module=user&file=charge_success&pt={pt}','/?path=/user/charge_success/pt/{pt}','/index.php/user/charge_success/pt/{pt}','/user/charge_success/pt/{pt}'),(110,'replay','replay_list','รายการความคิดเห็น','/module/replay/list.php?pt={pt}&module={module}&page={page}','/module/replay/list.php?pt={pt}&module={module}&page={page}','/?module=replay&file=list&pt={pt}&module={module}&page={page}','/?path=/replay/list/pt/{pt}/module/{module}/page/{page}','/index.php/replay/list/pt/{pt}/module/{module}/page/{page}','/replay/list/pt/{pt}/module/{module}/page/{page}'),(112,'picture','picture_tindex','หน้าแรกหมวดแกลเลอรี','/module/picture/tindex.php?pt={pt}&tid={tid}','/{tid}/index.html','/?module=picture&file=tindex&pt={pt}&tid={tid}','/?path=/picture/tindex/pt/{pt}/tid/{tid}','/index.php/picture/tindex/pt/{pt}/tid/{tid}','/picture/tindex/pt/{pt}/tid/{tid}'),(113,'author','author_author','ศูนย์ของผู้แต่ง','/module/author/author.php?pt={pt}&aid={aid}','/module/author/author.php?pt={pt}&aid={aid}','/module/author/author.php?pt={pt}&aid={aid}','/?path=/author/author/pt/{pt}/aid/{aid}','/index.php/author/author/pt/{pt}/aid/{aid}','/author/author/pt/{pt}/aid/{aid}'),(114,'author','author_novel_statistics','สถิติข้อมูลนิยาย','/module/author/novel_statistics.php?pt={pt}','/module/author/novel_statistics.php?pt={pt}','/?module=author&file=novel_statistics&pt={pt}','/?path=/author/novel_statistics/pt/{pt}','/index.php/author/novel_statistics/pt/{pt}','/author/novel_statistics/pt/{pt}'),(128,'editor','editor_novel_chapter','ตรวจสอบตอนที่แก้ไข','/module/editor/novel_chapter.php?page={page}&status={status}&pt={pt}','/module/editor/novel_chapter.php?page={page}&status={status}&pt={pt}','/?module=editor&file=novel_chapter&page={page}&status={status}&pt={pt}','/?path=/editor/novel_chapter/page/{page}/status/{status}/pt/{pt}','/index.php/editor/novel_chapter/page/{page}/status/{status}/pt/{pt}','/editor/novel_chapter/page/{page}/status/{status}/pt/{pt}'),(127,'editor','editor_novel_cover','ตรวจสอบปกที่แก้ไข','/module/editor/novel_cover.php?page={page}&status={status}&pt={pt}','/module/editor/novel_cover.php?page={page}&status={status}&pt={pt}','/?module=editor&file=novel_cover&page={page}&status={status}&pt={pt}','/?path=/editor/novel_cover/page/{page}/status/{status}/pt/{pt}','/index.php/editor/novel_cover/page/{page}/status/{status}/pt/{pt}','/editor/novel_cover/page/{page}/status/{status}/pt/{pt}'),(125,'editor','editor_index','แก้ไขหน้าแรก','/module/editor/index.php?pt={pt}','/module/editor/index.php?pt={pt}','/?module=editor&file=index&pt={pt}','/?path=/editor/index/pt/{pt}','/index.php/editor/index/pt/{pt}','/editor/index/pt/{pt}'),(126,'editor','editor_novel','ตรวจสอบหนังสือใหม่ที่แก้ไข','/module/editor/novel.php?page={page}&status={status}&pt={pt}','/module/editor/novel.php?page={page}&status={status}&pt={pt}','/?module=editor&file=novel&page={page}&status={status}&pt={pt}','/?path=/editor/novel/page/{page}/status/{status}/pt/{pt}','/index.php/editor/novel/page/{page}/status/{status}/pt/{pt}','/editor/novel/page/{page}/status/{status}/pt/{pt}'),(129,'editor','editor_basic','แก้ไขข้อมูลพื้นฐาน','/module/editor/basic.php?pt={pt}','/module/editor/basic.php?pt={pt}','/?module=editor&file=basic&pt={pt}','/?path=/editor/basic/pt/{pt}','/index.php/editor/basic/pt/{pt}','/editor/basic/pt/{pt}');
DROP TABLE IF EXISTS `wm_site_product`;
CREATE TABLE `wm_site_product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ใช้งานได้หรือไม่',
  `product_title` varchar(60) NOT NULL COMMENT 'ชื่อเว็บไซต์',
  `product_domain` varchar(100) NOT NULL COMMENT 'โดเมน',
  `product_admin` varchar(80) NOT NULL COMMENT 'โฟลเดอร์หลังบ้าน',
  `product_name` varchar(60) NOT NULL COMMENT 'บัญชีเข้าสู่ระบบหลังบ้าน',
  `product_psw` varchar(50) NOT NULL COMMENT 'รหัสผ่านเข้าสู่ระบบหลังบ้าน',
  `product_order` int NOT NULL DEFAULT '99' COMMENT 'การเรียงลำดับที่แสดง, ค่าน้อยอยู่ก่อน',
  `product_time` int NOT NULL COMMENT 'เวลาสร้าง',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเครือข่ายเว็บไซต์ตามสายผลิตภัณฑ์';
DROP TABLE IF EXISTS `wm_site_site`;
CREATE TABLE `wm_site_site` (
  `site_id` int NOT NULL AUTO_INCREMENT,
  `site_status` tinyint(1) DEFAULT '1' COMMENT 'ใช้งานได้หรือไม่',
  `site_title` varchar(60) DEFAULT NULL COMMENT 'ชื่อเว็บไซต์',
  `site_domain` varchar(30) DEFAULT NULL COMMENT 'โดเมนเว็บไซต์',
  `site_domain_type` tinyint(1) DEFAULT '1' COMMENT 'ประเภทโดเมน 1=โดเมนเดี่ยว 2=ไวลด์การ์ด',
  `site_type` tinyint(1) DEFAULT '1' COMMENT 'ประเภทเว็บไซต์ 1 คือเครือข่ายเว็บไซต์ที่แยกข้อมูล 2 คือเครือข่ายเว็บไซต์ที่ใช้ข้อมูลร่วมกัน (เมื่อใช้ไวลด์การ์ด DNS ต้องเป็น 2)',
  `site_template` varchar(30) DEFAULT NULL COMMENT 'ชื่อโฟลเดอร์เทมเพลตที่ใช้',
  `site_order` int DEFAULT '99' COMMENT 'เรียงลำดับ',
  `site_time` int DEFAULT '0' COMMENT 'เวลาที่สร้าง',
  PRIMARY KEY (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเว็บไซต์ย่อยในเครือข่ายเว็บไซต์';
DROP TABLE IF EXISTS `wm_system_apply`;
CREATE TABLE `wm_system_apply` (
  `apply_id` int NOT NULL AUTO_INCREMENT,
  `apply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=รอพิจารณา 1=อนุมัติ 2=ปฏิเสธ',
  `apply_module` varchar(20) NOT NULL COMMENT 'โมดูลที่ยื่นคำขอ',
  `apply_type` varchar(20) NOT NULL COMMENT 'ประเภทที่สมัครในโมดูล',
  `apply_uid` int NOT NULL COMMENT 'id ผู้ใช้ หรือ id ผู้แต่ง',
  `apply_cid` int NOT NULL DEFAULT '0' COMMENT 'ID ของเนื้อหาที่สังกัด',
  `apply_pid` int DEFAULT '0' COMMENT 'id เนื้อหาแม่',
  `apply_createtime` int NOT NULL COMMENT 'เวลายื่นคำขอ',
  `apply_manager_id` int NOT NULL DEFAULT '0' COMMENT 'ผู้ดูแลระบบที่ดำเนินการ',
  `apply_editor_id` int DEFAULT '0' COMMENT 'การแก้ไขของการดำเนินการ',
  `apply_updatetime` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่ดำเนินการ',
  `apply_remark` varchar(200) NOT NULL COMMENT 'หมายเหตุการดำเนินการ',
  `apply_option` mediumtext COMMENT 'ข้อมูลพิเศษ',
  PRIMARY KEY (`apply_id`),
  KEY `status_index` (`apply_status`),
  KEY `module_index` (`apply_module`),
  KEY `type_index` (`apply_type`),
  KEY `uid_index` (`apply_uid`),
  KEY `cid_index` (`apply_cid`),
  KEY `editor_index` (`apply_editor_id`),
  KEY `pid_index` (`apply_pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการสมัครทั้งระบบ';
DROP TABLE IF EXISTS `wm_system_competence`;
CREATE TABLE `wm_system_competence` (
  `comp_id` int NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(60) NOT NULL COMMENT 'ชื่อสิทธิ์',
  `comp_site` varchar(5000) NOT NULL DEFAULT '0' COMMENT 'สิทธิ์จัดการเว็บไซต์ของบัญชี 0 คือทุกเว็บไซต์',
  `comp_content` varchar(5000) NOT NULL COMMENT 'เนื้อหาสิทธิ์',
  PRIMARY KEY (`comp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางสิทธิ์ของระบบ';
DROP TABLE IF EXISTS `wm_system_domain`;
CREATE TABLE `wm_system_domain` (
  `domain_id` int NOT NULL AUTO_INCREMENT,
  `domain_title` varchar(60) NOT NULL COMMENT 'หัวข้อโมดูล',
  `domain_name` varchar(60) NOT NULL COMMENT 'ชื่อโมดูล',
  `domain_domain` varchar(30) NOT NULL COMMENT 'โดเมนที่ผูกกับโมดูล',
  `domain_index` varchar(30) DEFAULT NULL COMMENT 'หน้าแรกโมดูล',
  `domain_order` int DEFAULT '9' COMMENT 'ลำดับโดเมน',
  PRIMARY KEY (`domain_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางโดเมนที่ผูกกับโมดูล';
INSERT INTO `wm_system_domain` VALUES (1,'โมดูลบทความ','article','','index',9),(2,'โมดูลฟอรัม','bbs','','index',9),(3,'โมดูลแอป','app','','index',9),(4,'โมดูลผู้ใช้','user','','homne',9),(5,'โมดูลลิงก์เพื่อน','link','','index',9),(6,'โมดูลต้นฉบับ','author','','index',9),(7,'โมดูลนิยาย','novel','','index',9);
DROP TABLE IF EXISTS `wm_system_email`;
CREATE TABLE `wm_system_email` (
  `email_id` int NOT NULL AUTO_INCREMENT,
  `email_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'สถานะการใช้งานบริการอีเมล 0 คือปิดใช้งาน 1 คือเปิดใช้งาน',
  `email_type` tinyint(1) DEFAULT '1' COMMENT 'ประเภทอีเมล 1 คือ smtp 2 คือ sendmail,3 คือฟังก์ชัน php smtp',
  `email_smtp` varchar(20) DEFAULT NULL COMMENT 'เซิร์ฟเวอร์ smtp',
  `email_port` varchar(10) DEFAULT NULL COMMENT 'พอร์ต smtp',
  `email_name` varchar(60) DEFAULT NULL COMMENT 'บัญชีเข้าสู่ระบบอีเมล',
  `email_psw` varchar(50) DEFAULT NULL COMMENT 'รหัสผ่านเข้าสู่ระบบอีเมล',
  `email_send` varchar(30) DEFAULT NULL COMMENT 'บัญชีผู้ส่ง',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='การตั้งค่าบริการอีเมล';
INSERT INTO `wm_system_email` VALUES (1,0,1,'smtp.163.com','25','user@163.com','1TFfVrRCnfnximMmLHE','user@163.com');
DROP TABLE IF EXISTS `wm_system_email_log`;
CREATE TABLE `wm_system_email_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_status` tinyint(1) DEFAULT '0' COMMENT 'สถานะการใช้ 0=ยังไม่ใช้ 1=ใช้แล้ว 2=หมดอายุ',
  `log_send` tinyint(1) DEFAULT '0' COMMENT 'สถานะการส่ง 1=สำเร็จ 0=ล้มเหลว 2=รอส่ง',
  `log_type` varchar(20) DEFAULT NULL COMMENT 'ประเภทจดหมาย',
  `log_sender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีผู้ส่ง',
  `log_receive` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'บัญชีผู้รับ',
  `log_title` varchar(200) NOT NULL COMMENT 'หัวข้ออีเมล',
  `log_content` text NOT NULL COMMENT 'เนื้อหาอีเมล',
  `log_remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'ส่งสำเร็จ' COMMENT 'ข้อมูลหมายเหตุ',
  `log_time` int DEFAULT '0' COMMENT 'เวลาสร้างงานส่งอีเมล',
  `log_sendtime` int DEFAULT '0' COMMENT 'เวลาส่งอีเมล',
  `log_exptime` int DEFAULT '0' COMMENT 'อายุการใช้งานของอีเมล',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกงานอีเมล';
DROP TABLE IF EXISTS `wm_system_email_temp`;
CREATE TABLE `wm_system_email_temp` (
  `temp_id` varchar(20) NOT NULL COMMENT 'ID ของเทมเพลต',
  `temp_status` tinyint(1) DEFAULT '1' COMMENT '0=ปิดใช้งาน 1=เปิดใช้งาน',
  `temp_name` varchar(60) DEFAULT NULL COMMENT 'หัวข้อเทมเพลต',
  `temp_desc` varchar(200) DEFAULT NULL COMMENT 'คำอธิบายเทมเพลต',
  `temp_title` varchar(200) NOT NULL COMMENT 'หัวข้อจดหมาย',
  `temp_content` mediumtext NOT NULL COMMENT 'เนื้อหาจดหมาย',
  PRIMARY KEY (`temp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเทมเพลตอีเมล';
INSERT INTO `wm_system_email_temp` VALUES ('user_welcome',0,'อีเมลต้อนรับ','อีเมลต้อนรับที่ส่งเมื่อสมัครสมาชิกสำเร็จ','ยินดีต้อนรับคุณเข้าร่วม {网站名}','{#lt}p{#gt}เรียน {用户名} ยินดีต้อนรับคุณสู่การสมัครสมาชิก {网站名}.{#lt}/p{#gt}'),('user_getpsw',1,'กู้คืนรหัสผ่าน','อีเมลที่ส่งเมื่อกู้คืนรหัสผ่าน','อีเมลสำหรับกู้คืนรหัสผ่าน!','{#lt}p{#gt}เรียนผู้ใช้ที่เคารพ!{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}อีเมลฉบับนี้ส่งโดยอัตโนมัติจาก {#123}网站名{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}คุณได้รับอีเมลฉบับนี้ เนื่องจากคุณได้ใช้{#lt}span style={#34}color: rgb(255, 0, 0);{#34}{#gt}บริการกู้คืนรหัสผ่าน{#lt}/span{#gt} ที่ {#123}网站名{#125} หากคุณไม่เคยเข้าชม {#123}网站名{#125} หรือไม่ได้ดำเนินการข้างต้น กรุณาเพิกเฉยต่ออีเมลฉบับนี้ คุณไม่จำเป็นต้องยกเลิกการรับหรือดำเนินการใด ๆ เพิ่มเติม{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}รหัสยืนยัน: {#123}验证码{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}'),('user_bind',1,'รหัสยืนยันการผูกบัญชี','รับรหัสยืนยันเมื่อผูกอีเมล','คุณกำลังผูกอีเมล','{#lt}p{#gt}เรียนผู้ใช้ที่เคารพ!{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}อีเมลฉบับนี้ส่งโดยอัตโนมัติจาก {#123}网站名{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}คุณได้รับอีเมลฉบับนี้ เนื่องจากคุณได้ใช้{#lt}span style={#34}color: rgb(255, 0, 0);{#34}{#gt}บริการขอรหัสยืนยันการผูกบัญชี{#lt}/span{#gt} ที่ {#123}网站名{#125} หากคุณไม่เคยเข้าชม {#123}网站名{#125} หรือไม่ได้ดำเนินการข้างต้น กรุณาเพิกเฉยต่ออีเมลฉบับนี้ คุณไม่จำเป็นต้องยกเลิกการรับหรือดำเนินการใด ๆ เพิ่มเติม{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}รหัสยืนยัน: {#123}验证码{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}'),('user_veremail',1,'ยืนยันอีเมล','ยืนยันอีเมลผู้ใช้','ชื่อผู้ใช้{用户名} อีเมลยืนยันอีเมล!','{#lt}p{#gt}เรียนคุณ{#123}用户名{#125}!{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}อีเมลฉบับนี้ส่งโดยอัตโนมัติจาก {#123}网站名{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}คุณได้รับอีเมลฉบับนี้ เนื่องจากคุณได้ใช้{#lt}span style={#34}color: rgb(255, 0, 0);{#34}{#gt}บริการยืนยันอีเมลผู้ใช้{#lt}/span{#gt} ที่ {#123}网站名{#125} หากคุณไม่เคยเข้าชม {#123}网站名{#125} หรือไม่ได้ดำเนินการข้างต้น กรุณาเพิกเฉยต่ออีเมลฉบับนี้ คุณไม่จำเป็นต้องยกเลิกการรับหรือดำเนินการใด ๆ เพิ่มเติม{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}รหัสยืนยัน: {#123}验证码{#125}{#lt}/p{#gt}'),('user_reg',1,'รหัสยืนยันการสมัครสมาชิก','รับรหัสยืนยันทางอีเมลเมื่อสมัครสมาชิก','รอคอยการเข้าร่วมของคุณ','{#lt}p{#gt}เรียนผู้ใช้ที่เคารพ!{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}อีเมลฉบับนี้ส่งโดยอัตโนมัติจาก {#123}网站名{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}คุณได้รับอีเมลฉบับนี้ เนื่องจากคุณได้ใช้{#lt}span style={#34}color: rgb(255, 0, 0);{#34}{#gt}บริการขอรหัสยืนยันการสมัครสมาชิก{#lt}/span{#gt} ที่ {#123}网站名{#125} หากคุณไม่เคยเข้าชม {#123}网站名{#125} หรือไม่ได้ดำเนินการข้างต้น กรุณาเพิกเฉยต่ออีเมลฉบับนี้ คุณไม่จำเป็นต้องยกเลิกการรับหรือดำเนินการใด ๆ เพิ่มเติม{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}รหัสยืนยัน: {#123}验证码{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}'),('user_login',1,'รหัสยืนยันการเข้าสู่ระบบ','รับรหัสยืนยันทางอีเมลเมื่อเข้าสู่ระบบ','ยินดีต้อนรับคุณเข้าสู่ระบบ {#123}网站名{#125}','{#lt}p{#gt}เรียนคุณ{#123}用户名{#125}!{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}อีเมลฉบับนี้ส่งโดยอัตโนมัติจาก {#123}网站名{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}คุณได้รับอีเมลฉบับนี้ เนื่องจากคุณได้ใช้{#lt}span style={#34}color: rgb(255, 0, 0);{#34}{#gt}บริการขอรหัสยืนยันการเข้าสู่ระบบ{#lt}/span{#gt} ที่ {#123}网站名{#125} หากคุณไม่เคยเข้าชม {#123}网站名{#125} หรือไม่ได้ดำเนินการข้างต้น กรุณาเพิกเฉยต่ออีเมลฉบับนี้ คุณไม่จำเป็นต้องยกเลิกการรับหรือดำเนินการใด ๆ เพิ่มเติม{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}รหัสยืนยัน: {#123}验证码{#125}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br style={#34}white-space: normal;{#34}/{#gt}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}'),('warning_admin_login',1,'แจ้งเตือนล่วงหน้า_เข้าสู่ระบบหลังบ้าน','แจ้งเตือนล่วงหน้า_เข้าสู่ระบบหลังบ้าน','แจ้งเตือนล่วงหน้า_เข้าสู่ระบบหลังบ้าน','{#lt}p{#gt}เรียนผู้ดูแลระบบ: IP{#123}后台登录ip{#125}เข้าสู่ระบบบัญชี{#123}后台登录账号{#125} เมื่อ{#123}后台登录时间{#125} สถานะการเข้าสู่ระบบ: {#123}后台登录状态{#125}!{#lt}/p{#gt}'),('warning_code_eroor',1,'แจ้งเตือนล่วงหน้า_ข้อผิดพลาดของโค้ด','แจ้งเตือนล่วงหน้า_ข้อผิดพลาดของโค้ด','แจ้งเตือนล่วงหน้า_ข้อผิดพลาดของโค้ด','{#lt}p{#gt}เรียนผู้ดูแลระบบ: เว็บไซต์เกิดข้อผิดพลาด {#123}代码报错详情{#125}!{#lt}/p{#gt}');
DROP TABLE IF EXISTS `wm_system_errlog`;
CREATE TABLE `wm_system_errlog` (
  `errlog_id` int NOT NULL AUTO_INCREMENT,
  `errlog_status` tinyint(1) DEFAULT '0' COMMENT 'อัปโหลดหรือไม่, 0=ไม่มี',
  `errlog_url` varchar(255) DEFAULT NULL COMMENT 'url ที่ผิดพลาด',
  `errlog_state` varchar(20) DEFAULT NULL COMMENT 'รหัสข้อผิดพลาด SQLSTATE',
  `errlog_code` varchar(20) DEFAULT NULL COMMENT 'รหัสข้อผิดพลาดของไดรเวอร์',
  `errlog_msg` varchar(255) DEFAULT NULL COMMENT 'ข้อความข้อผิดพลาดของไดรเวอร์',
  `errlog_sql` varchar(2000) DEFAULT NULL COMMENT 'คำสั่ง sql ที่ผิดพลาด',
  `errlog_ip` varchar(15) DEFAULT NULL COMMENT 'ip ที่เข้าชม',
  `errlog_time` int DEFAULT NULL COMMENT 'เวลาที่ผิดพลาด',
  PRIMARY KEY (`errlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกข้อผิดพลาด sql ของระบบ';
DROP TABLE IF EXISTS `wm_system_menu`;
CREATE TABLE `wm_system_menu` (
  `menu_id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'สถานะการแสดงของเมนู 0 คือซ่อน 1 คือแสดง',
  `menu_title` varchar(60) NOT NULL COMMENT 'หัวข้อสารบัญ',
  `menu_name` varchar(60) NOT NULL COMMENT 'ชื่อสารบัญ หากเป็นเมนูสิทธิ์ ค่านี้จะเป็นประเภท t',
  `menu_pid` int NOT NULL DEFAULT '0' COMMENT 'id ของรายการแม่',
  `menu_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=สารบัญปกติ 1=สารบัญกลุ่ม 2=เมนูตามสิทธิ์',
  `menu_order` int DEFAULT '10' COMMENT 'ลำดับการแสดง',
  `menu_file` varchar(40) DEFAULT NULL COMMENT 'ชื่อไฟล์ของสารบัญ',
  `menu_url` tinyint(1) DEFAULT '0' COMMENT 'เพิ่มค่า name เป็น type หรือไม่',
  `menu_ico` varchar(50) DEFAULT NULL COMMENT 'ชื่อไอคอนของเมนู',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=921 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเมนูไดเรกทอรีของระบบ';
INSERT INTO `wm_system_menu` VALUES (1,1,'จัดการระบบ','system',0,0,1,NULL,0,'fa-cog'),(2,1,'ตั้งค่าเว็บไซต์','set',1,0,1,NULL,0,'fa-cogs'),(3,1,'ตั้งค่าพื้นฐาน','config',2,0,1,'system.set.config',0,'fa-wrench'),(4,1,'จัดการ API','api',245,0,1,'system.set.api',0,'fa-random'),(5,1,'อัปโหลดลายน้ำ','water',2,0,3,'system.set.water',0,'fa-cloud-upload'),(6,1,'ตั้งค่าโดเมน','domain',2,0,4,'system.set.domain',0,'fa-bars'),(7,1,'จัดการเทมเพลต','templates',2,0,5,'system.set.templates',0,'fa-clone'),(8,1,'กำจัด BOM','delbom',2,0,8,'system.set.delbom',0,'fa-ban'),(9,1,'จัดการเมนู','menu',1,0,2,NULL,0,'fa-align-justify'),(10,0,'เพิ่มเมนู','add',9,0,1,'system.menu.edit',0,NULL),(11,1,'รายการเมนู','menu',9,0,2,'system.menu.menu',0,'fa-list-ul'),(12,1,'SEO เว็บไซต์','seo',1,0,4,NULL,0,'fa-recycle'),(13,1,'ตั้งค่า SEO','config',12,0,1,'system.seo.keys',0,'fa-refresh'),(14,1,'ลิงก์เสมือน','rewrite',12,0,2,'system.seo.rewrite',0,'fa-square'),(15,1,'สร้างแบบสแตติก','html',12,0,3,'system.seo.html',0,'fa-sticky-note'),(16,1,'จัดการสิทธิ์','competence',1,0,7,'',0,'fa-arrows-alt'),(17,1,'เพิ่มสิทธิ์','edit',16,0,1,'system.competence.edit',0,'fa-plus-square'),(18,1,'รายการสิทธิ์','list',16,0,2,'system.competence.list',0,'fa-list-ul'),(19,1,'บัญชีหลังบ้าน','manager',1,0,8,NULL,0,'fa-user-secret'),(20,1,'เพิ่มผู้ดูแล','edit',19,0,1,'system.manager.edit',0,'fa-user-plus'),(22,1,'จัดการความปลอดภัย','safe',1,0,9,'',0,'fa-tasks'),(21,1,'รายการผู้ดูแลระบบ','manager',19,0,2,'system.manager.list',0,'fa-list-ul'),(23,1,'ประวัติการเข้าสู่ระบบ','log',22,0,5,'system.safe.log',0,'fa-location-arrow'),(24,1,'เปลี่ยนรหัสผ่าน','uppsw',22,0,20,'system.safe.account.uppsw',0,'fa-unlock-alt'),(25,1,'จัดการโมดูล','module',0,0,2,'',0,'fa-th-large'),(26,1,'โมดูลบทความ','article',25,0,1,NULL,0,'fa-file-text'),(27,1,'จัดการหมวดหมู่','type',26,1,1,NULL,0,NULL),(28,1,'เพิ่มหมวดหมู่','add',27,0,1,'article.type.edit',0,NULL),(29,1,'รายการหมวดหมู่','list',27,0,2,'article.type.list',0,NULL),(30,1,'จัดการบทความ','article',26,1,2,'',0,NULL),(31,1,'เพิ่มบทความ','add',30,0,1,'article.article.edit',0,NULL),(32,1,'รายการบทความ','list',30,0,2,'article.article.list',0,NULL),(33,1,'ตั้งค่าโมดูล','set',26,0,3,NULL,0,NULL),(34,1,'แหล่งที่มาผู้แต่ง','author',33,0,1,'article.author.list',0,NULL),(35,1,'กำหนดค่าโมดูล','config',33,0,2,'article.set.config',0,NULL),(36,1,'เกี่ยวกับโมดูล','about',25,0,2,'',0,'fa-info-circle'),(37,1,'เกี่ยวกับหมวดหมู่','type',36,1,1,'',0,NULL),(38,1,'เพิ่มหมวดหมู่','add',37,0,1,'about.type.edit',0,NULL),(39,1,'รายการหมวดหมู่','list',37,0,2,'about.type.list',0,NULL),(40,1,'เกี่ยวกับข้อมูล','about',36,1,2,'',0,NULL),(41,1,'เพิ่มข้อมูล','add',40,0,1,'about.about.edit',0,NULL),(42,1,'รายการข้อมูล','list',40,0,2,'about.about.list',0,NULL),(43,1,'โมดูลอัลบั้มภาพ','picture',25,0,3,'',0,'fa-picture-o'),(44,1,'จัดการหมวดหมู่','type',43,1,1,'',0,NULL),(45,1,'เพิ่มหมวดหมู่','add',44,0,1,'picture.type.edit',0,NULL),(46,1,'รายการหมวดหมู่','list',44,0,2,'picture.type.list',0,NULL),(47,1,'จัดการอัลบั้มภาพ','picture',43,1,2,'',0,NULL),(48,1,'เพิ่มอัลบั้มรูป','add',47,0,1,'picture.picture.edit',0,NULL),(49,1,'รายการอัลบั้มภาพ','list',47,0,2,'picture.picture.list',0,NULL),(50,1,'ตั้งค่าโมดูล','set',43,1,3,'',0,NULL),(51,1,'กำหนดค่าโมดูล','config',50,0,1,'picture.set.config',0,NULL),(52,0,'โมดูลฟอรัม','bbs',25,0,4,'',0,'fa-comments'),(53,1,'จัดการบอร์ด','type',52,1,1,'',0,NULL),(54,1,'เพิ่มบอร์ด','add',53,0,1,'bbs.type.edit',0,NULL),(55,1,'รายการบอร์ด','type',53,0,2,'bbs.type.list',0,NULL),(56,1,'จัดการธีม','bbs',52,1,3,'',0,NULL),(57,1,'รายการธีม','bbs',56,0,1,'bbs.bbs.list',0,NULL),(58,1,'รายการตอบกลับ','replay',56,0,2,'bbs.replay.list',0,NULL),(59,1,'ตั้งค่าโมดูล','set',52,1,4,'',0,NULL),(60,1,'กำหนดค่าโมดูล','config',59,0,1,'bbs.set.config',0,NULL),(61,1,'โมดูลแอป','app',25,0,5,'',0,'fa-android'),(62,1,'จัดการหมวดหมู่','type',61,1,1,'',0,NULL),(63,1,'เพิ่มหมวดหมู่','add',62,0,1,'app.type.edit',0,NULL),(64,1,'รายการหมวดหมู่','list',62,0,2,'app.type.list',0,NULL),(65,1,'จัดการแอป','app',61,1,2,'',0,NULL),(66,1,'เพิ่มแอป','add',65,0,1,'app.app.edit',0,NULL),(67,1,'รายการแอป','list',65,0,2,'app.app.list',0,NULL),(68,1,'คุณสมบัติข้อมูลส่วนตัว','attr',61,1,3,'',0,NULL),(69,1,'ข้อมูลส่วนตัวสำเร็จรูป','abs',68,0,1,'app.attr.abs',0,NULL),(70,1,'เพิ่มผู้จำหน่าย','add',68,0,2,'app.firms.edit',0,NULL),(71,1,'รายการผู้จำหน่าย','list',68,0,3,'app.firms.list',0,NULL),(72,1,'ตั้งค่าโมดูล','set',61,1,4,'',0,NULL),(73,1,'กำหนดค่าโมดูล','config',72,0,1,'app.set.config',0,NULL),(74,1,'โมดูลนิยาย','novel',25,0,0,'',0,'fa-book'),(75,1,'จัดการหมวดหมู่','type',74,1,1,'',0,NULL),(76,1,'เพิ่มหมวดหมู่','add',75,0,1,'novel.type.edit',0,NULL),(77,1,'รายการหมวดหมู่','list',75,0,2,'novel.type.list',0,NULL),(78,1,'จัดการนิยาย','novel',74,1,2,'',0,NULL),(79,1,'เพิ่มนิยาย','add',78,0,1,'novel.novel.edit',0,NULL),(80,1,'รายการนิยาย','list',78,0,2,'novel.novel.list',0,NULL),(81,1,'จัดการเล่ม','volume',74,1,3,'',0,NULL),(82,1,'เพิ่มเล่ม','add',81,0,1,'novel.volume.edit',0,NULL),(83,1,'รายการเล่ม','list',81,0,2,'novel.volume.list',0,NULL),(84,1,'จัดการตอน','chapter',74,1,4,'',0,NULL),(85,1,'เพิ่มตอน','add',84,0,1,'novel.chapter.edit',0,NULL),(86,1,'รายการตอน','list',84,0,2,'novel.chapter.list',0,NULL),(87,1,'ตั้งค่าโมดูล','set',74,1,6,'',0,NULL),(88,1,'จัดการการแนะนำ','rec',78,0,3,'novel.novel.rec',0,NULL),(91,1,'ตั้งค่านิยาย','config',87,0,4,'novel.set.config',0,NULL),(92,1,'โมดูลต้นฉบับ','author',25,0,7,'',0,'fa-users'),(93,1,'จัดการนักเขียน','author',92,1,1,'',0,NULL),(94,1,'เพิ่มนักเขียน','add',93,0,1,'author.author.edit',0,NULL),(95,1,'รายการนักเขียน','list',93,0,2,'author.author.list',0,NULL),(96,1,'นิยายต้นฉบับ','novel',92,1,2,'',0,NULL),(97,1,'รายการต้นฉบับ','list',96,0,2,'author.novel.novel.list',0,NULL),(98,1,'ตอนรอตรวจสอบ','status',96,0,3,'author.novel.chapter.list',0,NULL),(99,1,'จัดการการเงิน','finance',107,1,5,'',0,'fa-jpy'),(100,1,'คำขอถอนเงิน','cash',99,0,1,'finance.order.cash',0,'fa-money'),(101,1,'ประวัติเงินทุน','log',99,0,2,'finance.finance.list',0,'fa-vine'),(102,1,'ประวัติการเติมเงิน','charge',99,0,3,'finance.order.charge',0,' fa-buysellads'),(103,1,'ตั้งค่าโมดูล','set',92,1,9,'',0,NULL),(104,1,'ระดับการเขียนนักเขียน','level',103,0,1,'author.level.author',0,NULL),(105,1,'ระดับสัญญาผลงาน','sign',103,0,2,'author.level.sign',0,NULL),(106,1,'กำหนดค่าโมดูล','config',103,0,5,'author.set.config',0,NULL),(107,1,'โมดูลผู้ใช้','user',0,0,3,'',0,'fa-user'),(108,1,'จัดการผู้ใช้','user',107,1,1,'',0,'fa-user'),(109,1,'เพิ่มผู้ใช้','add',108,0,1,'user.user.edit',0,'fa-user-plus'),(110,1,'รายการผู้ใช้','list',108,0,2,'user.user.list',0,'fa-users'),(111,1,'จัดการค่าสำเร็จรูป','preset',107,1,2,'',0,'fa-tachometer'),(112,1,'รูปโปรไฟล์สำเร็จรูป','head',111,0,1,'user.preset.head',0,'fa-smile-o'),(113,1,'กำหนดค่าระดับ','lv',111,0,2,'user.preset.lv',0,'fa-plane'),(114,1,'จัดการการโต้ตอบ','interactive',107,1,3,'',0,'fa-commenting'),(115,1,'ส่งข้อความภายใน','send',114,0,2,'user.msg.send',0,'fa-paper-plane'),(116,1,'รายการข้อความภายใน','list',114,0,3,'user.msg.list',0,'fa-envelope'),(117,1,'ตั้งค่าโมดูล','set',107,1,4,'',0,'fa-th-large'),(118,1,'กำหนดค่าผู้ใช้','config',117,0,1,'user.set.config',0,'fa-user-secret'),(119,1,'โมดูลลิงก์เพื่อน','link',25,0,8,'',0,'fa-link'),(120,1,'จัดการหมวดหมู่','type',119,1,1,'',0,NULL),(121,1,'เพิ่มหมวดหมู่','add',120,0,1,'link.type.edit',0,NULL),(122,1,'รายการหมวดหมู่','list',120,0,2,'link.type.list',0,NULL),(123,1,'จัดการลิงก์เพื่อน','link',119,0,2,'',0,NULL),(124,1,'เพิ่มลิงก์เพื่อน','add',123,0,1,'link.link.edit',0,NULL),(125,1,'รายการลิงก์เพื่อน','list',123,0,2,'link.link.list',0,NULL),(126,1,'ตั้งค่าโมดูล','set',119,1,3,'',0,NULL),(127,1,'เว็บไซต์ที่ยอดไม่ถึง','owed',126,0,1,'link.owed.list',1,NULL),(128,1,'ประวัติการคลิก','click',126,0,2,'link.click.list',0,NULL),(129,1,'กำหนดค่าโมดูล','config',126,0,3,'link.set.config',0,NULL),(130,1,'ศูนย์ปฏิบัติการ','operations',0,0,4,'',0,'fa-arrows'),(131,1,'จัดการความคิดเห็น','replay',130,1,1,'',0,'fa-comment'),(132,1,'ความคิดเห็นวันนี้','today',131,0,1,'operate.replay.list',1,'fa-square'),(133,1,'ความคิดเห็นยอดนิยม','hot',131,0,2,'operate.replay.list',1,'fa-th-large'),(134,1,'ความคิดเห็นทั้งหมด','all',131,0,3,'operate.replay.list',1,'fa-th'),(135,1,'กำหนดค่าความคิดเห็น','config',131,0,4,'operate.replay.config',0,'fa-wrench'),(136,1,'จัดการการค้นหา','search',130,1,2,'',0,'fa-search'),(137,1,'ค้นหาทั้งหมด','all',136,0,1,'operate.search.list',1,'fa-search-plus'),(138,1,'ค้นหาหัวข้อ','name',136,0,2,'operate.search.list',1,'fa-search-minus'),(139,1,'ค้นหาผู้แต่ง','author',136,0,3,'operate.search.list',1,'fa-search-minus'),(140,1,'ค้นหาแท็ก','tag',136,0,4,'operate.search.list',1,'fa-search-minus'),(141,1,'จัดการสไลด์','falsh',130,1,3,'',0,'fa-file-video-o'),(142,1,'เพิ่มสไลด์','add',141,0,3,'operate.flash.edit',0,'fa-plus-circle'),(143,1,'รายการสไลด์','flash',141,0,4,'operate.flash.list',0,'fa-file-text-o'),(144,1,'จัดการข้อความ','message',130,1,4,'',0,'fa-commenting'),(145,1,'รายการข้อความ','message',144,0,1,'operate.message.list',0,'fa-list'),(146,1,'เทมเพลตสำเร็จรูป','templates',130,1,5,'',0,'fa-align-justify'),(147,1,'อัปโหลดเทมเพลต','add',146,0,1,'system.templates.edit',0,'fa-cloud-upload'),(148,1,'รายการเทมเพลต','list',146,0,2,'system.templates.list',0,'fa-list'),(149,1,'จัดการหัวข้อพิเศษ','zt',130,1,6,'',0,'fa-newspaper-o'),(150,1,'เพิ่มหัวข้อพิเศษ','add',149,0,3,'operate.zt.edit',0,'fa-plus-circle'),(151,1,'รายการหัวข้อพิเศษ','list',149,0,4,'operate.zt.list',0,'fa-indent'),(152,1,'จัดการหน้าเดียว','diy',130,1,7,'',0,'fa-cubes'),(153,1,'เพิ่มหน้าเดียว','add',152,0,1,'operate.diy.edit',0,'fa-plus-circle'),(154,1,'รายการหน้าเดียว','list',152,0,2,'operate.diy.list',0,'fa-list-alt'),(155,1,'จัดการสถิติ','tongji',130,1,8,'',0,'fa-bar-chart'),(156,1,'โค้ดสถิติ','code',155,0,1,'operate.tongji.code',0,'fa-file-code-o'),(157,1,'จัดการโฆษณา','ad',130,1,9,'',0,'fa-dollar'),(158,1,'เพิ่มโฆษณา','add',157,0,3,'operate.ad.edit',0,'fa-plus-circle'),(159,1,'รายการโฆษณา','list',157,0,4,'operate.ad.list',0,'fa-list-ul'),(160,1,'ศูนย์ข้อมูล','data',0,0,5,'',0,'fa-bar-chart'),(161,1,'สถิติข้อมูล','chart',160,0,3,'',0,'fa-area-chart'),(162,1,'ข้อมูลกราฟ','graph',161,1,1,'',0,NULL),(163,1,'กราฟสถิติข้อมูล','tongji',162,0,1,'data.chart.tongji',0,NULL),(164,1,'กราฟการเติบโตข้อมูล','week',162,0,2,'data.chart.add',1,NULL),(165,0,'เก็บรวบรวมข้อมูล','collection',160,0,4,'',0,'fa-list-ul'),(166,1,'จัดการกฎ','rules',165,1,1,'',0,NULL),(167,1,'เพิ่มกฎ','edit',166,0,1,'data.collection.rules',0,NULL),(168,1,'รายการกฎ','rules',166,0,2,'data.collection.rules',0,NULL),(169,1,'จัดการงาน','task',165,1,2,'',0,NULL),(170,1,'เพิ่มงาน','edit',169,0,1,'data.collection.rules',0,NULL),(171,1,'รายการงาน','task',169,0,2,'data.collection.rules',0,NULL),(172,1,'รันงาน','start',169,0,3,'data.collection.rules',0,NULL),(173,1,'ตั้งค่าอีเมล','email',245,0,6,'system.set.email',0,'fa-envelope'),(177,1,'แก้ไขการตั้งค่าพื้นฐาน','system',3,2,1,'system.set.config',0,NULL),(178,1,'แก้ไขการตั้งค่า API','api',4,2,1,'system.set.api',0,NULL),(179,1,'แก้ไขการตั้งค่าอัปโหลด','config',5,2,1,'system.set.water',0,NULL),(180,1,'แก้ไขการตั้งค่าโดเมน','domain',6,2,1,'system.set.domain',0,NULL),(181,1,'แก้ไขเทมเพลต','update',7,2,1,'system.set.templates',0,NULL),(182,1,'ถอนการติดตั้งเทมเพลต','uninstall',7,2,2,'system.set.templates',0,NULL),(183,1,'ติดตั้งเทมเพลต','install',7,2,3,'system.set.templates',0,NULL),(184,1,'แก้ไขการตั้งค่าอีเมล','update',173,2,5,'system.set.email',0,NULL),(185,0,'ส่งอีเมลทดสอบ','test',173,2,6,'system.email.email',0,NULL),(186,1,'ลบ BOM','delbom',8,2,1,'system.set.delbom',0,NULL),(187,1,'แก้ไขลำดับเมนู','order',11,2,1,'system.menu.menu',0,NULL),(188,1,'แก้ไขเมนู','edit',11,2,3,'system.menu.menu',0,NULL),(189,1,'ลบเมนู','del',11,2,4,'system.menu.menu',0,NULL),(190,1,'เพิ่มเมนู','add',11,2,0,'system.menu.menu',0,NULL),(191,1,'เพิ่มหน้า SEO','add',13,0,1,'system.seo.keys.edit',0,NULL),(192,1,'แก้ไขหน้า SEO','edit',13,0,2,'system.seo.keys.edit',0,NULL),(193,1,'เพิ่ม SEO','add',191,2,10,'system.seo.keys',0,NULL),(194,1,'แก้ไข SEO','edit',192,2,10,'system.seo.keys',0,NULL),(195,1,'เพิ่มลิงก์ URL','add',14,0,1,'system.seo.rewrite.edit',0,NULL),(196,1,'แก้ไขลิงก์ URL','edit',14,0,1,'system.seo.rewrite.edit',0,NULL),(197,1,'เพิ่ม URL','add',195,2,1,'system.seo.rewrite',0,NULL),(198,1,'แก้ไข URL','edit',196,2,1,'system.seo.rewrite',0,NULL),(199,1,'ดำเนินการเพิ่มสิทธิ์','add',17,2,1,'system.competence.competence',0,NULL),(200,1,'แก้ไขสิทธิ์','edit',17,2,2,'system.competence.competence',0,NULL),(201,1,'ดำเนินการเพิ่มผู้ดูแลระบบ','add',20,2,1,'system.manager.manager',0,NULL),(202,1,'แก้ไขผู้ดูแลระบบ','edit',20,2,2,'system.manager.manager',0,NULL),(203,1,'ระงับหรือคืนสิทธิ์ผู้ดูแลระบบ','status',20,2,3,'system.manager.manager',0,NULL),(204,1,'ลบบัญชีผู้ดูแลระบบ','del',20,2,4,'system.manager.manager',0,NULL),(205,1,'ลบประวัติเข้าสู่ระบบ','del',23,2,1,'system.safe.log',0,NULL),(206,1,'รายละเอียดประวัติการเข้าสู่ระบบ','detail',23,0,2,'system.safe.log.detail',0,NULL),(207,1,'เปลี่ยนรหัสผ่าน','uppsw',24,2,1,'system.safe.account',0,NULL),(208,1,'สร้างแคชคีย์เวิร์ด','config',13,2,3,'system.seo.keys',0,NULL),(209,1,'สร้างแคช URL','config',14,2,4,'system.seo.rewrite',0,NULL),(210,1,'เพิ่มหมวดหมู่บทความ','add',28,2,1,'article.type',0,NULL),(211,1,'แก้ไขหมวดหมู่บทความ','edit',28,2,1,'article.type',0,NULL),(212,1,'แก้ไขเทมเพลต','edit',147,0,2,'system.templates.edit',0,NULL),(213,1,'ดำเนินการเพิ่มเทมเพลต','add',147,2,1,'system.templates.templates',0,NULL),(214,1,'เลือกเทมเพลตกลับมา','lookup',148,0,1,'system.templates.lookup',0,NULL),(215,1,'บันทึกคำขอ','requset',22,0,7,'system.safe.request',0,'fa-random'),(216,1,'รายละเอียดคำขอ','detail',215,0,1,'system.safe.request.detail',0,NULL),(217,0,'ลบบันทึกคำขอ','del',215,2,2,'system.safe.request',0,NULL),(218,0,'ล้างบันทึกคำขอ','clear',215,2,3,'system.safe.request',0,NULL),(219,0,'ล้างประวัติการเข้าสู่ระบบ','clear',23,2,4,'system.safe.log',0,NULL),(220,1,'บันทึกการทำงาน','operation',22,0,9,'system.safe.operation',0,'fa-list'),(221,0,'ลบบันทึกการทำงาน','del',220,2,1,'system.safe.operation',0,NULL),(222,0,'ล้างประวัติการดำเนินการ','clear',220,2,2,'system.safe.operation',0,NULL),(223,0,'รายละเอียดบันทึกการทำงาน','detail',220,0,1,'system.safe.operation.detail',0,NULL),(224,0,'ลบสิทธิ์','del',18,2,2,'system.competence.competence',0,NULL),(225,0,'แก้ไขบทความ','edit',31,2,1,'article.article',0,NULL),(226,0,'ดำเนินการเพิ่มบทความ','add',31,2,2,'article.article',0,NULL),(227,0,'แก้ไขหมวดหมู่บทความ','edit',27,0,10,'article.type.edit',0,NULL),(228,1,'ลบหมวดหมู่บทความ','del',28,2,2,'article.type',0,NULL),(229,1,'ลบบทความ','del',31,2,3,'article.article',0,NULL),(230,1,'ตรวจสอบบทความ','status',31,2,4,'article.article',0,NULL),(231,1,'ย้ายบทความ','move',31,2,5,'article.article',0,NULL),(232,1,'ดำเนินการตั้งค่าคุณสมบัติ','attr',31,2,6,'article.article',0,NULL),(233,1,'แก้ไขเนื้อหาบทความ','edit',31,0,2,'article.article.edit',0,NULL),(234,1,'ดำเนินการแก้ไขผู้แต่ง','edit',31,2,7,'article.author',0,NULL),(235,1,'ลบผู้แต่ง','del',31,2,8,'article.author',0,NULL),(236,1,'ดำเนินการเพิ่มผู้แต่ง','add',31,2,9,'article.author',0,NULL),(237,1,'แก้ไขแหล่งที่มาผู้แต่ง','edit',34,0,1,'article.author.edit',0,NULL),(238,1,'เพิ่มแหล่งที่มาผู้แต่ง','add',34,0,2,'article.author.edit',0,NULL),(239,1,'รายการการตั้งค่า','list',245,0,1,'system.config.list',0,'fa-list-ul'),(240,1,'แก้ไขการตั้งค่า','edit',239,0,1,'system.config.edit',0,NULL),(241,1,'เพิ่มการตั้งค่า','add',239,0,2,'system.config.edit',0,NULL),(242,1,'ดำเนินการเพิ่มการตั้งค่า','add',241,2,1,'system.config.config',0,NULL),(243,1,'ดำเนินการแก้ไขการตั้งค่า','edit',241,2,2,'system.config.config',0,NULL),(244,1,'ลบการตั้งค่า','del',241,2,3,'system.config.config',0,NULL),(245,1,'จัดการการตั้งค่า','option',1,0,2,'',0,'fa-server'),(246,1,'จัดการตัวเลือก','optionlist',245,0,2,'system.config.option.list',0,'fa-file-text-o'),(247,1,'เพิ่มตัวเลือก','add',246,0,3,'system.config.option.edit',0,NULL),(248,1,'แก้ไขตัวเลือก','edit',246,0,4,'system.config.option.edit',0,NULL),(249,1,'ดำเนินการแก้ไขตัวเลือก','edit',246,2,1,'system.config.option',0,NULL),(250,1,'ดำเนินการเพิ่มตัวเลือก','add',246,2,2,'system.config.option',0,NULL),(251,1,'ดึงการตั้งค่ากลุ่ม','getconfig',246,2,3,'system.config.config',0,NULL),(252,1,'ลบตัวเลือก','del',246,2,4,'system.config.option',0,NULL),(253,1,'แก้ไขการตั้งค่า','edit',35,2,1,'article.config',0,NULL),(254,1,'บันทึกข้อผิดพลาด','errlog',22,0,11,'system.safe.errlog',0,'fa-bug'),(255,1,'รายละเอียดบันทึกข้อผิดพลาด','detail',254,0,1,'system.safe.errlog.detail',0,NULL),(256,1,'ลบบันทึก','del',254,2,1,'system.safe.errlog',0,NULL),(257,1,'ดำเนินการล้างบันทึก','clear',254,2,2,'system.safe.errlog',0,NULL),(258,1,'เลือกแหล่งที่มาผู้แต่ง','lookup',31,0,10,'article.author.lookup',0,NULL),(259,1,'ถังขยะ','recycle',30,0,3,'article.article.recycle',0,NULL),(260,1,'ดำเนินการกู้คืน','reduction',259,2,1,'article.article',0,NULL),(261,1,'ลบถาวร','realdel',259,2,2,'article.article',0,NULL),(262,0,'เพิ่มหมวดหมู่นิยาย','add',76,2,1,'novel.type',0,NULL),(263,0,'แก้ไขหมวดหมู่นิยาย','edit',76,2,2,'novel.type',0,NULL),(264,0,'ลบหมวดหมู่นิยาย','del',77,2,1,'novel.type',0,NULL),(265,1,'ดำเนินการเพิ่มนิยาย','add',79,2,1,'novel.novel',0,NULL),(266,1,'ลบนิยาย','del',80,2,1,'novel.novel',0,NULL),(267,1,'ตรวจสอบนิยาย','status',80,2,2,'novel.novel',0,NULL),(268,1,'ดำเนินการย้ายนิยาย','move',80,2,3,'novel.novel',0,NULL),(269,0,'แนะนำหลายรายการ','rec',80,2,4,'novel.rec',0,NULL),(270,1,'แก้ไขนิยาย','edit',79,2,2,'novel.novel',0,NULL),(271,1,'ดำเนินการเพิ่มเล่ม','add',82,2,1,'novel.volume',0,NULL),(272,1,'ค้นหานิยาย','search',80,2,5,'novel.novel',0,NULL),(273,1,'ลบเล่ม','del',83,2,1,'novel.volume',0,NULL),(274,0,'แก้ไขหมวดหมู่นิยาย','edit',75,0,2,'novel.type.edit',0,NULL),(275,0,'แก้ไขนิยาย','edit',78,0,10,'novel.novel.edit',0,NULL),(276,0,'แก้ไขเล่มนิยาย','edit',81,0,10,'novel.volume.edit',0,NULL),(277,0,'ดำเนินการดึงเล่ม','getvolume',81,2,3,'novel.volume',0,NULL),(278,1,'ดำเนินการเพิ่มตอน','add',85,2,1,'novel.chapter',0,NULL),(279,0,'แก้ไขตอน','edit',85,0,2,'novel.chapter.edit',0,NULL),(280,1,'แก้ไขเนื้อหาตอน','edit',279,2,1,'novel.chapter',0,NULL),(281,1,'ลบตอน','del',86,2,1,'novel.chapter',0,NULL),(282,1,'ดำเนินการล้างตอน','clear',86,2,2,'novel.chapter',0,NULL),(283,0,'ลบรายการแนะนำ','del',88,2,2,'novel.rec',0,NULL),(284,0,'แก้ไขรายการแนะนำ','edit',88,0,1,'novel.novel.rec.edit',0,NULL),(285,0,'แก้ไขรายการแนะนำ','edit',88,2,10,'novel.rec',0,NULL),(286,1,'แก้ไขการตั้งค่า','edit',91,2,10,'novel.config',0,NULL),(287,1,'แก้ไขเล่ม','edit',82,2,2,'novel.volume',0,NULL),(288,1,'ดำเนินการเพิ่มผู้ใช้','add',109,2,1,'user.user',0,NULL),(290,1,'ลบผู้ใช้','del',110,2,1,'user.user',0,NULL),(289,1,'แก้ไขผู้ใช้','edit',292,2,2,'user.user',0,NULL),(291,1,'ตรวจสอบผู้ใช้','status',110,2,2,'user.user',0,NULL),(292,0,'แก้ไขผู้ใช้','edit',110,0,1,'user.user.edit',0,NULL),(293,0,'ลบรูปโปรไฟล์','del',112,2,1,'user.head',0,NULL),(294,0,'ดำเนินการเพิ่มรูปโปรไฟล์','add',112,2,2,'user.head',0,NULL),(295,0,'ดำเนินการเพิ่มระดับ','add',113,2,1,'user.lv',0,NULL),(296,1,'แก้ไขระดับ','edit',113,2,2,'user.lv',0,NULL),(297,0,'ลบระดับ','del',113,2,3,'user.lv',0,NULL),(298,0,'ส่งข้อความ','send',115,2,1,'user.msg',0,NULL),(299,0,'ลบข้อความ','del',116,2,1,'user.msg',0,NULL),(300,0,'ดำเนินการล้างการแจ้งเตือน','clear',116,2,1,'user.msg',0,NULL),(475,0,'ย้ายลำดับตอน','order',84,0,3,'novel.chapter.order',0,NULL),(302,0,'แก้ไขการตั้งค่า','edit',118,2,1,'user.config',0,NULL),(303,0,'ลบความคิดเห็น','del',131,2,1,'operate.replay',0,NULL),(304,0,'ดำเนินการล้างความคิดเห็น','clear',131,2,2,'operate.replay',0,NULL),(305,0,'ดำเนินการตรวจสอบความคิดเห็น','status',131,2,3,'operate.replay',0,NULL),(306,0,'แก้ไขการตั้งค่า','edit',135,2,1,'operate.replay.config',0,NULL),(307,0,'ลบการค้นหา','del',137,2,1,'operate.search',0,NULL),(308,0,'ดำเนินการล้างการค้นหา','clear',137,2,2,'operate.search',0,NULL),(309,0,'แก้ไขสไลด์','edit',143,0,1,'operate.flash.edit',0,NULL),(310,0,'ดำเนินการเพิ่มสไลด์','add',142,2,1,'operate.flash',0,NULL),(311,0,'แก้ไขสไลด์','edit',309,2,2,'operate.flash',0,NULL),(312,0,'แสดงสไลด์','status',143,2,1,'operate.flash',0,NULL),(313,0,'ลบสไลด์','del',143,2,2,'operate.flash',0,NULL),(314,0,'ดำเนินการล้างสไลด์','clear',143,2,3,'operate.flash',0,NULL),(315,0,'ดำเนินการตรวจสอบข้อความ','status',145,2,1,'operate.message',0,NULL),(316,0,'ลบข้อความ','del',145,2,2,'operate.message',0,NULL),(317,0,'ดำเนินการล้างข้อความ','clear',145,2,3,'operate.message',0,NULL),(318,0,'ดึงหมวดหมู่โมดูล','gettype',147,2,1,'system.templates.templates',0,NULL),(319,0,'ลบเทมเพลตสำเร็จรูป','del',147,2,1,'system.templates.templates',0,NULL),(320,0,'ดำเนินการล้างเทมเพลตสำเร็จรูป','clear',147,2,2,'system.templates.templates',0,NULL),(321,0,'แก้ไขเทมเพลตสำเร็จรูป','edit',147,2,2,'system.templates.templates',0,NULL),(322,0,'ดำเนินการเพิ่มหน้าเดียว','add',153,2,1,'operate.diy',0,NULL),(323,0,'ลบหน้าเดียว','del',154,2,1,'operate.diy',0,NULL),(324,0,'ดำเนินการล้างหน้าเดียว','clear',154,2,2,'operate.diy',0,NULL),(325,0,'ตรวจสอบหน้าเดียว','status',154,2,3,'operate.diy',0,NULL),(326,0,'แก้ไขหน้าเดียว','edit',327,2,2,'operate.diy',0,NULL),(327,0,'แก้ไขหน้าเดียว','edit',154,0,1,'operate.diy.edit',0,NULL),(328,0,'แก้ไขสถิติ','edit',156,2,1,'operate.tongji',0,NULL),(329,0,'ดำเนินการเพิ่มโฆษณา','add',158,2,1,'operate.ad',0,NULL),(330,0,'แก้ไขโฆษณา','edit',334,2,1,'operate.ad',0,NULL),(331,1,'ตรวจสอบโฆษณา','status',159,2,1,'operate.ad',0,NULL),(332,1,'ลบโฆษณา','del',159,2,2,'operate.ad',0,NULL),(333,1,'ดำเนินการล้างโฆษณา','clear',159,2,3,'operate.ad',0,NULL),(334,0,'แก้ไขโฆษณา','edit',159,0,1,'operate.ad.edit',0,NULL),(335,1,'เพิ่มหมวดหมู่','add',157,0,1,'operate.ad.type.edit',0,'fa-plus-circle'),(336,1,'รายการหมวดหมู่','list',157,0,2,'operate.ad.type.list',0,'fa-list'),(337,0,'ดำเนินการเพิ่มหมวดหมู่','add',335,2,1,'operate.ad.type',0,NULL),(338,0,'แก้ไขหมวดหมู่','edit',341,2,2,'operate.ad.type',0,NULL),(339,0,'ลบหมวดหมู่','del',336,2,1,'operate.ad.type',0,NULL),(340,0,'ดำเนินการล้างหมวดหมู่','clear',336,2,2,'operate.ad.type',0,NULL),(341,0,'แก้ไขหมวดหมู่','edit',336,0,2,'operate.ad.type.edit',0,NULL),(342,0,'สถิติการเติบโตเดือนนี้','month',162,0,3,'data.chart.add',0,NULL),(343,0,'สถิติการเติบโตปีนี้','year',162,0,4,'data.chart.add',0,NULL),(344,0,'ดำเนินการเพิ่มหัวข้อพิเศษ','add',150,2,1,'operate.zt',0,NULL),(345,0,'ลบหัวข้อพิเศษ','del',151,2,1,'operate.zt',0,NULL),(346,0,'ดำเนินการล้างหัวข้อพิเศษ','clear',151,2,2,'operate.zt',0,NULL),(347,0,'ตรวจสอบหัวข้อพิเศษ','status',151,2,3,'operate.zt',0,NULL),(348,0,'แก้ไขหัวข้อพิเศษ','edit',349,2,4,'operate.zt',0,NULL),(349,0,'แก้ไขหัวข้อพิเศษ','edit',151,0,1,'operate.zt.edit',0,NULL),(350,0,'รายการโหนดหัวข้อพิเศษ','node',151,0,1,'operate.zt.node.list',0,NULL),(351,0,'เพิ่มโหนดหัวข้อพิเศษ','add',350,0,2,'operate.zt.node.edit',0,NULL),(352,0,'แก้ไขโหนดหัวข้อพิเศษ','edit',350,0,3,'operate.zt.node.edit',0,NULL),(353,1,'เพิ่มโหนด','add',351,2,1,'operate.zt.node',0,NULL),(354,1,'แก้ไขโหนด','edit',352,2,1,'operate.zt.node',0,NULL),(355,1,'ลบโหนด','del',350,2,1,'operate.zt.node',0,NULL),(356,1,'ดำเนินการล้างโหนด','clear',350,2,2,'operate.zt.node',0,NULL),(357,1,'ประวัติโหวตชอบไม่ชอบ','dingcai',359,0,1,'operate.operate.list',1,'fa-list-ul'),(358,1,'ประวัติการให้คะแนน','score',359,0,2,'operate.operate.list',1,'fa-list-ul'),(359,1,'จัดการการโต้ตอบ','interaction',130,0,2,'',0,'fa-thumbs-up'),(360,1,'ลบการโต้ตอบ','del',359,2,1,'operate.operate',0,NULL),(361,1,'ดำเนินการล้างข้อมูลการโต้ตอบ','clear',359,2,1,'operate.operate',0,NULL),(362,1,'ประวัติการเช็คอิน','sign',114,0,1,'user.sign.list',0,'fa-list-ul'),(363,1,'ลบประวัติเช็คอิน','del',362,2,10,'user.sign',0,NULL),(364,1,'ล้างประวัติการเช็คอิน','clear',362,2,10,'user.sign',0,NULL),(365,1,'จัดการไฟล์','file',160,0,2,'',0,'fa-file'),(366,1,'รายการไฟล์','list',365,0,2,'data.file.list',0,'fa-list-ul'),(367,0,'เปลี่ยนชื่อไฟล์','rename',366,0,1,'data.file.rename',0,NULL),(368,0,'ดำเนินการเปลี่ยนชื่อ','rename',367,2,1,'data.file',0,NULL),(370,0,'สร้างโฟลเดอร์','createfolder',367,0,3,'data.file.createfolder',0,NULL),(369,0,'ลบข้อมูล','del',367,2,2,'data.file',0,NULL),(371,0,'สร้างโฟลเดอร์','createfolder',370,2,1,'data.file',0,NULL),(373,1,'ดำเนินการย้ายไฟล์','movefile',372,2,1,'data.file',0,NULL),(372,0,'ย้ายไฟล์','movefile',365,0,1,'data.file.movefile',0,NULL),(374,0,'สร้างไฟล์','create',366,0,1,'data.file.file',0,NULL),(375,0,'แก้ไขไฟล์','edit',366,0,1,'data.file.file',0,NULL),(376,1,'สร้างไฟล์','create',374,2,1,'data.file',0,NULL),(377,1,'ดำเนินการแก้ไขไฟล์','edit',375,2,1,'data.file',0,NULL),(378,1,'จัดการฐานข้อมูล','mysql',160,0,1,'data.mysql',0,'fa-cubes'),(379,1,'รัน SQL','runsql',378,0,2,'data.mysql.runsql',0,'fa-list-ul'),(380,1,'รัน SQL','runsql',379,2,1,'data.mysql',0,NULL),(381,1,'รายการฐานข้อมูล','table',378,0,1,'data.mysql.table',0,'fa-list-ul'),(382,1,'ปรับแต่งตาราง','optimize',381,2,1,'data.mysql',0,NULL),(383,1,'ซ่อมแซมตาราง','repair',381,2,2,'data.mysql',0,NULL),(384,1,'เพิ่มหมวดหมู่','add',121,2,1,'link.type',0,NULL),(385,1,'แก้ไขหมวดหมู่','edit',386,2,1,'link.type',0,NULL),(386,0,'แก้ไขหมวดหมู่ลิงก์เพื่อน','edit',122,0,2,'link.type.edit',0,NULL),(387,0,'ลบหมวดหมู่','del',122,2,2,'link.type',0,NULL),(388,0,'ดำเนินการเพิ่มลิงก์เพื่อน','add',124,2,1,'link.link',0,NULL),(389,0,'แก้ไขลิงก์เพื่อน','edit',395,2,2,'link.link',0,NULL),(390,0,'ลบลิงก์เพื่อน','del',125,2,3,'link.link',0,NULL),(391,0,'ดำเนินการล้างลิงก์เพื่อน','clear',125,2,4,'link.link',0,NULL),(392,0,'ตรวจสอบลิงก์เพื่อน','status',125,2,5,'link.link',0,NULL),(393,0,'แนะนำลิงก์เพื่อน','attr',125,2,6,'link.link',0,NULL),(394,0,'ดำเนินการย้ายลิงก์เพื่อน','move',125,2,7,'link.link',0,NULL),(395,0,'แก้ไขลิงก์เพื่อน','edit',125,0,1,'link.link.edit',0,NULL),(396,0,'ลบประวัติการคลิก','del',128,2,1,'link.click',0,NULL),(397,0,'ล้างประวัติการคลิก','clear',128,2,2,'link.click',0,NULL),(398,0,'แก้ไขการตั้งค่าลิงก์เพื่อน','edit',129,2,1,'link.config',0,NULL),(399,0,'ดำเนินการเพิ่มหมวดหมู่','add',38,2,1,'about.type',0,NULL),(400,0,'แก้ไขหมวดหมู่','edit',39,2,1,'about.type',0,NULL),(401,0,'แก้ไขหมวดหมู่ข้อมูล','edit',39,0,1,'about.type.edit',0,NULL),(402,1,'ลบหมวดหมู่','del',39,2,2,'about.type',0,NULL),(403,0,'แก้ไขข้อมูล','edit',42,0,1,'about.about.edit',0,NULL),(404,0,'ลบข้อมูล','del',42,2,3,'about.about',0,NULL),(405,0,'ดำเนินการล้างข้อมูล','clear',42,2,4,'about.about',0,NULL),(406,0,'ดำเนินการเพิ่มข้อมูล','add',42,2,5,'about.about',0,NULL),(407,0,'แก้ไขข้อมูล','edit',42,2,6,'about.about',0,NULL),(408,0,'ดำเนินการย้ายข้อมูล','move',42,2,7,'about.about',0,NULL),(409,0,'ดำเนินการตรวจสอบลิงก์เพื่อน','checkseo',125,2,8,'link.link',0,NULL),(410,0,'ดำเนินการตรวจสอบลิงก์ตอบกลับ','checkback',125,2,9,'link.link',0,NULL),(411,1,'รางวัลและโทษเหรียญผู้ใช้','reward',110,0,3,'user.user.reward',0,NULL),(412,0,'ดำเนินการรางวัลและโทษเหรียญ','reward',411,2,1,'user.user',0,NULL),(413,0,'แก้ไขหมวดหมู่อัลบั้มภาพ','edit',44,0,2,'picture.type.edit',0,NULL),(414,0,'เพิ่มหมวดหมู่','add',45,2,1,'picture.type',0,NULL),(415,0,'แก้ไขหมวดหมู่','edit',46,2,1,'picture.type',0,NULL),(416,0,'ลบหมวดหมู่','del',46,2,2,'picture.type',0,NULL),(417,0,'ดำเนินการเพิ่มอัลบั้มรูป','add',48,2,1,'picture.picture',0,NULL),(418,0,'แก้ไขอัลบั้มภาพ','edit',49,2,2,'picture.picture',0,NULL),(419,0,'ลบอัลบั้มภาพ','del',49,2,3,'picture.picture',0,NULL),(420,0,'ตรวจสอบอัลบั้มภาพ','status',49,2,4,'picture.picture',0,NULL),(421,0,'ดำเนินการย้ายอัลบั้มรูป','move',49,2,5,'picture.picture',0,NULL),(422,0,'คุณสมบัติอัลบั้มภาพ','attr',49,2,6,'picture.picture',0,NULL),(423,0,'แก้ไขอัลบั้มภาพ','edit',49,0,7,'picture.picture.edit',0,NULL),(424,0,'แก้ไขการตั้งค่า','edit',51,2,1,'picture.config',0,NULL),(425,1,'เมนูลัด','quick',9,0,3,'system.menu.quick',0,'fa-list-ul'),(426,0,'จัดการทรัพยากรสแตติก','static',147,0,3,'system.templates.static',0,NULL),(427,1,'ลบทรัพยากร','delstatic',426,2,1,'system.templates.templates',0,NULL),(428,1,'ลบหมวดหมู่','del',64,2,1,'app.type',0,NULL),(429,1,'ดำเนินการเพิ่มหมวดหมู่','add',63,2,2,'app.type',0,NULL),(430,1,'แก้ไขหมวดหมู่','edit',64,2,3,'app.type',0,NULL),(431,0,'แก้ไขหมวดหมู่แอป','edit',64,0,2,'app.type.edit',0,NULL),(432,0,'แก้ไขแอป','edit',67,0,1,'app.app.edit',0,NULL),(433,0,'ลบแอป','del',67,2,1,'app.app',0,NULL),(434,0,'เพิ่มแอป','add',67,2,2,'app.app',0,NULL),(435,0,'แก้ไขแอป','edit',432,2,3,'app.app',0,NULL),(436,0,'ตรวจสอบแอป','status',67,2,4,'app.app',0,NULL),(437,0,'ดำเนินการย้ายแอป','move',67,2,5,'app.app',0,NULL),(438,0,'คุณสมบัติแอป','attr',67,2,6,'app.app',0,NULL),(439,0,'เพิ่มข้อมูลส่วนตัว','add',69,0,1,'app.attr.edit',0,NULL),(440,0,'แก้ไขข้อมูลส่วนตัว','edit',69,0,1,'app.attr.edit',0,NULL),(441,0,'ดำเนินการเพิ่มข้อมูลส่วนตัว','add',439,2,1,'app.attr',0,NULL),(442,0,'แก้ไขข้อมูลส่วนตัว','edit',440,2,1,'app.attr',0,NULL),(443,0,'ลบข้อมูลส่วนตัว','del',69,2,2,'app.attr',0,NULL),(444,0,'แก้ไขการตั้งค่า','edit',73,2,1,'app.config',0,NULL),(445,0,'ดำเนินการเพิ่มผู้ให้บริการ','add',70,2,1,'app.firms',0,NULL),(446,0,'แก้ไขผู้จำหน่าย','edit',71,2,2,'app.firms',0,NULL),(447,0,'ลบผู้จำหน่าย','del',71,2,3,'app.firms',0,NULL),(448,0,'แก้ไขผู้จำหน่าย','edit',71,0,1,'app.firms.edit',0,NULL),(449,0,'ค้นหาผู้จำหน่าย','search',71,2,1,'app.firms',0,NULL),(450,0,'สำรองข้อมูลโปรแกรม','backup',366,2,1,'data.file',0,NULL),(451,0,'แก้ไขบอร์ดฟอรัม','edit',55,0,2,'bbs.type.edit',0,NULL),(452,0,'เพิ่มบอร์ด','add',54,2,3,'bbs.type',0,NULL),(453,0,'แก้ไขบอร์ด','edit',55,2,1,'bbs.type',0,NULL),(454,0,'ลบบอร์ด','del',55,2,2,'bbs.type',0,NULL),(455,0,'ลบธีม','del',57,2,1,'bbs.bbs',0,NULL),(456,0,'ดำเนินการย้ายหัวข้อ','move',57,2,2,'bbs.bbs',0,NULL),(457,0,'ตรวจสอบธีม','status',57,2,3,'bbs.bbs',0,NULL),(458,0,'คุณสมบัติธีม','attr',57,2,4,'bbs.bbs',0,NULL),(459,0,'แก้ไขการตั้งค่า','edit',60,2,1,'bbs.config',0,NULL),(460,1,'แท็กกำหนดเอง','label',245,0,3,'system.config.label.list',0,'fa-list-ul'),(461,0,'เพิ่มแท็ก','add',460,0,1,'system.config.label.edit',0,NULL),(462,0,'แก้ไขแท็ก','edit',460,0,2,'system.config.label.edit',0,NULL),(463,1,'ดำเนินการเพิ่มแท็ก','add',461,2,1,'system.config.label',0,NULL),(464,1,'แก้ไขแท็ก','edit',462,2,2,'system.config.label',0,NULL),(465,1,'ลบแท็ก','del',460,2,3,'system.config.label',0,NULL),(466,1,'จัดการ LOGO','logo',2,0,3,'system.set.logo',0,'fa-file-image-o'),(467,1,'แก้ไข LOGO','logo',466,2,1,'system.set.logo',0,NULL),(468,0,'เพิ่มผู้ดูแลบอร์ด','add',469,0,1,'bbs.moder.edit',0,NULL),(469,0,'จัดการผู้ดูแลบอร์ด','moder',55,0,2,NULL,0,NULL),(470,0,'แก้ไขผู้ดูแลบอร์ด','edit',469,0,2,'bbs.moder.edit',0,NULL),(471,0,'ดำเนินการเพิ่มผู้ดูแลบอร์ด','add',470,2,1,'bbs.moder',0,NULL),(472,0,'แก้ไขผู้ดูแลบอร์ด','edit',470,2,1,'bbs.moder',0,NULL),(473,1,'กำหนดค่าข้อความ','config',144,0,2,'operate.message.config',0,'cogs'),(474,0,'แก้ไขการตั้งค่าข้อความ','edit',473,2,10,'operate.message.config',0,NULL),(476,0,'ดำเนินการย้ายลำดับ','order',475,2,1,'novel.chapter',0,NULL),(477,1,'ผูกฟังก์ชัน','article',33,0,3,'system.module.config',1,NULL),(478,0,'ผูกฟังก์ชัน','edit',477,2,1,'system.module.config',0,NULL),(479,1,'ผูกฟังก์ชัน','picture',50,0,3,'system.module.config',1,NULL),(480,1,'ผูกฟังก์ชัน','bbs',59,0,3,'system.module.config',1,NULL),(481,1,'ผูกฟังก์ชัน','app',72,0,3,'system.module.config',1,NULL),(482,1,'ผูกฟังก์ชัน','novel',87,0,5,'system.module.config',1,NULL),(483,1,'ผูกฟังก์ชัน','author',103,0,10,'system.module.config',1,NULL),(484,1,'ผูกฟังก์ชัน','link',126,0,3,'system.module.config',1,NULL),(485,1,'ผูกฟังก์ชัน','user',117,0,3,'system.module.config',1,'lock'),(486,1,'ตั้งค่าโมดูล','config',36,0,3,'',0,NULL),(487,1,'ผูกฟังก์ชัน','about',486,0,3,'system.module.config',1,NULL),(488,1,'สร้างกฎ','createrewrite',12,0,8,'system.seo.createrewrite',0,'arrows-h'),(489,1,'ฟิลด์กำหนดเอง','field',245,0,4,'system.config.field.list',0,'fa-indent'),(490,1,'เพิ่มฟิลด์','add',489,0,1,'system.config.field.edit',0,NULL),(491,1,'แก้ไขฟิลด์','edit',489,0,2,'system.config.field.edit',0,NULL),(492,0,'ดึงหมวดหมู่โมดูล','gettype',489,2,1,'system.config.field',0,NULL),(493,0,'ดำเนินการเพิ่มฟิลด์','add',490,2,1,'system.config.field',0,NULL),(494,0,'แก้ไขฟิลด์','edit',491,2,1,'system.config.field',0,NULL),(495,0,'ลบฟิลด์','del',489,2,3,'system.config.field',0,NULL),(496,0,'ดึงฟิลด์กำหนดเอง','getfield',489,2,2,'system.config.field',0,NULL),(497,1,'ประสิทธิภาพแคช','cache',1,0,3,'',0,'fa-viacoin'),(498,1,'ตั้งค่าแคช','set',497,0,1,'system.cache.set',0,'fa-list-ul'),(499,1,'ล้างแคช','clear',497,0,2,'system.cache.clear',0,'fa-refresh'),(500,0,'ดำเนินการตั้งค่าแคช','config',498,2,1,'system.cache',0,NULL),(501,0,'ดำเนินการล้างแคช','clear',499,2,2,'system.cache',0,NULL),(502,0,'รายละเอียดความคิดเห็น','detail',131,0,1,'operate.replay.detail',0,NULL),(503,1,'ผูกฟังก์ชัน','search',136,0,4,'system.module.config',1,'lock'),(504,0,'ปฏิเสธการตรวจผู้แต่ง','refuse_author_apply',95,0,0,'system.apply.refuse',0,NULL),(505,0,'ดำเนินการตั้งค่าโมดูล','edit',106,2,0,'author.config',0,NULL),(506,0,'ตรวจสอบผู้แต่ง','status',95,2,1,'author.author',2,NULL),(507,0,'ลบผู้แต่ง','del',95,2,2,'author.author',2,NULL),(508,0,'ปฏิเสธผู้แต่ง','refuse_author_apply',95,2,3,'system.apply',0,NULL),(509,0,'ดำเนินการเพิ่มผู้แต่ง','add',94,2,1,'author.author',0,NULL),(510,0,'แก้ไขผู้แต่ง','edit',94,2,2,'author.author',0,NULL),(511,0,'แก้ไขผู้แต่ง','edit',95,0,3,'author.author.edit',0,NULL),(512,1,'ปกรอตรวจสอบ','list',96,0,0,'author.novel.cover.list',0,NULL),(513,0,'ตรวจสอบปก','status',512,2,1,'author.novel.cover',0,NULL),(514,0,'ลบปก','del',512,2,2,'author.novel.cover',0,NULL),(515,0,'ปฏิเสธการตรวจปก','refuse_author_novel_cover',512,0,1,'system.apply.refuse',0,NULL),(516,0,'ปฏิเสธการตรวจปก','refuse_author_novel_cover',515,2,1,'system.apply',0,NULL),(517,1,'แก้ไขคำขอต้นฉบับ','update',96,0,1,'author.novel.novelapply.list',0,NULL),(518,0,'ลบคำขอต้นฉบับ','del',517,2,1,'author.novel.apply',0,NULL),(519,0,'ตรวจสอบคำขอต้นฉบับ','status',517,2,2,'author.novel.apply',0,NULL),(520,0,'ดูข้อมูลที่เปลี่ยนแปลง','refuse_author_novel_edit',517,0,1,'system.apply.detail',0,NULL),(521,1,'ปฏิเสธการแก้ไขนิยาย','refuse_author_novel_editnovel',517,0,1,'system.apply.refuse',0,NULL),(522,1,'ปฏิเสธการแก้ไขนิยาย','refuse_author_novel_editnovel',521,2,1,'system.apply',0,NULL),(523,0,'ดูข้อมูลที่เปลี่ยนแปลง','refuse_author_chapter_edit',98,0,1,'system.apply.detail',0,NULL),(524,1,'ปฏิเสธการแก้ไขตอน','refuse_author_novel_editchapter',98,0,1,'system.apply.refuse',0,NULL),(525,1,'ปฏิเสธการแก้ไขตอน','refuse_author_novel_editchapter',98,2,2,'system.apply',0,NULL),(526,1,'ตรวจสอบคำขอตอน','status',98,2,3,'author.chapter.apply',0,NULL),(527,1,'ดำเนินการล้างคำขอตอน','clear',98,2,4,'author.chapter.apply',0,NULL),(528,1,'ดำเนินการล้างคำขอลงนิยาย','clear',517,2,3,'author.novel.apply',0,NULL),(529,1,'ส่งบทความ','aritcle',92,1,3,'',0,NULL),(530,1,'ตรวจสอบต้นฉบับที่ส่งมา','aritcle_list',529,0,1,'author.article.list',0,NULL),(531,1,'ลบคำขอตอน','del',530,2,5,'author.chapter.apply',0,NULL),(532,1,'ลบคำขอบทความ','del',530,2,1,'author.article.apply',0,NULL),(533,1,'ดำเนินการล้างคำขอบทความ','clear',530,2,2,'author.article.apply',0,NULL),(534,1,'ตรวจสอบคำขอบทความ','status',530,2,3,'author.article.apply',0,NULL),(535,0,'ปฏิเสธการแก้ไขบทความ','refuse_author_article_edit',530,0,4,'system.apply.refuse',0,NULL),(536,1,'ปฏิเสธการแก้ไขบทความ','refuse_author_article_editarticle',530,2,10,'system.apply',0,NULL),(537,1,'ดำเนินการสร้างหน้าแรก HTML','index',15,2,1,'system.seo.html',0,NULL),(538,1,'ดำเนินการดึงหมวดหมู่โมดูล','gettype',15,2,2,'system.seo.html',0,NULL),(539,1,'ดำเนินการสร้างเนื้อหา HTML','content',15,2,3,'system.seo.html',0,NULL),(540,1,'ดำเนินการสร้างรายการ HTML','list',15,2,4,'system.seo.html',0,NULL),(541,1,'ดำเนินการสร้างหน้าแรกหมวดหมู่ HTML','tindex',15,2,5,'system.seo.html',0,NULL),(542,1,'ดำเนินการสร้างสารบัญ HTML','menu',15,2,6,'system.seo.html',0,NULL),(543,1,'สร้างแผนผังเว็บไซต์','sitemap',12,0,4,'system.seo.sitemap',0,'fa-sitemap'),(544,1,'สร้าง RSS','rss',12,0,5,'system.seo.rss',0,'fa-rss '),(545,1,'ดำเนินการสร้างแผนผังเว็บไซต์','sitemap',543,2,1,'system.seo.sitemap',0,NULL),(546,1,'ดำเนินการดึงหมวดหมู่โมดูล','gettype',544,2,1,'system.seo.sitemap',0,NULL),(547,1,'ดำเนินการสร้างหน้าแรก RSS','rss',544,2,2,'system.seo.sitemap',0,NULL),(548,1,'ดำเนินการสร้างรายการ RSS','list',544,2,3,'system.seo.sitemap',0,NULL),(549,1,'อัปเดตการตั้งค่า','update',2,0,7,'system.config.update',0,'fa-refresh'),(550,1,'ดำเนินการอัปเดตการตั้งค่า','update',549,2,1,'system.config.config',0,NULL),(551,1,'ดำเนินการอัปโหลดข้อผิดพลาดอัตโนมัติ','autoupload',254,2,3,'system.safe.errlog',0,NULL),(552,1,'บริการคลาวด์','cloud',0,0,6,NULL,0,'fa-cloud'),(553,1,'จัดการเวอร์ชัน','version',552,1,1,NULL,0,'fa-random'),(554,1,'รายงานบั๊ก','bug',552,1,2,NULL,0,'fa-bug'),(555,1,'บันทึกข้อผิดพลาด','err',552,1,3,NULL,0,'fa-archive'),(556,1,'อัปเกรดออนไลน์','update',553,0,1,'cloud.version.update',0,' fa-cloud-upload'),(557,1,'ข้อเสนอแนะทั้งเครือข่าย','all',554,0,1,'cloud.bug.all',0,'fa-files-o '),(558,1,'ข้อเสนอแนะของฉัน','my',554,0,2,'cloud.bug.my',0,'fa-sticky-note-o '),(559,1,'ข้อผิดพลาดของฉัน','my',555,0,1,'cloud.err.my',0,'fa-bug'),(560,1,'อัปโหลดบันทึกข้อผิดพลาด','upload',254,2,4,'system.safe.errlog',0,NULL),(561,1,'ดำเนินการดึงหมวดหมู่ข้อเสนอแนะ','gettype',557,2,1,'cloud.bug',0,NULL),(562,1,'ดำเนินการดึงรายการข้อเสนอแนะ','getlist',557,2,2,'cloud.bug',0,NULL),(563,1,'ดูรายละเอียดข้อเสนอแนะ','detail',557,0,1,'cloud.bug.detail',0,NULL),(564,1,'ส่งข้อเสนอแนะใหม่','add',558,0,1,'cloud.bug.add',0,NULL),(565,1,'ส่งข้อเสนอแนะใหม่','add',564,2,3,'cloud.bug',0,NULL),(566,1,'ดำเนินการดึงรายการข้อผิดพลาด','getlist',559,2,1,'cloud.err',0,NULL),(567,1,'ดำเนินการดึงเวอร์ชันถัดไปล่าสุด','getnext',559,2,1,'cloud.version',0,NULL),(568,1,'อัปเกรด','update',559,2,2,'cloud.version',0,NULL),(569,1,'ดำเนินการดึงความคืบหน้า','getbarline',559,2,3,'cloud.version',0,NULL),(570,0,'แก้ไขระดับผู้แต่ง','update',104,2,2,'author.level',0,NULL),(571,0,'ลบระดับผู้แต่ง','del',104,2,4,'author.level',0,NULL),(572,1,'เพิ่มระดับผู้แต่ง','add',104,0,0,'author.level.author.edit',0,NULL),(573,1,'ดำเนินการเพิ่มระดับผู้แต่ง','add',104,2,1,'author.level',0,NULL),(574,1,'แก้ไขระดับผู้แต่งทั้งหมด','upall',104,2,3,'author.level',0,NULL),(575,1,'เพิ่มระดับการเซ็นสัญญา','add',105,0,1,'author.level.sign.edit',0,NULL),(576,1,'แก้ไขระดับสัญญา','update',105,2,0,'author.sign',0,NULL),(577,1,'ลบระดับสัญญา','del',105,2,2,'author.sign',0,NULL),(578,1,'ดำเนินการเพิ่มระดับการเซ็นสัญญา','add',105,2,3,'author.sign',0,NULL),(579,0,'แก้ไขระดับสัญญาทั้งหมด','upall',105,2,4,'author.sign',0,NULL),(589,0,'แก้ไขไอเทม','propsedit',582,0,4,'props.props.edit',0,NULL),(580,1,'ไอเทมให้ทิป','props',92,1,8,NULL,0,NULL),(581,1,'เพิ่มไอเท็ม','propsadd',580,0,3,'props.props.edit',0,NULL),(582,1,'รายการไอเท็ม','propslist',580,0,4,'props.props.list',0,NULL),(583,1,'เพิ่มหมวดหมู่','typeadd',580,0,1,'props.type.edit',0,NULL),(584,1,'รายการหมวดหมู่','typelist',580,0,2,'props.type.list',0,NULL),(585,0,'ดำเนินการเพิ่มหมวดหมู่','add',583,2,1,'props.type',0,NULL),(586,0,'แก้ไขหมวดหมู่','edit',584,2,2,'props.type',0,NULL),(587,1,'ลบหมวดหมู่','del',584,2,1,'props.type',0,NULL),(588,0,'แก้ไขหมวดหมู่','typeedit',584,0,3,'props.type.edit',0,NULL),(590,0,'ดำเนินการเพิ่มไอเท็ม','add',581,2,1,'props.props',0,NULL),(591,0,'แก้ไขไอเทม','edit',589,2,1,'props.props',0,NULL),(592,0,'ลบไอเทม','del',582,2,1,'props.props',0,NULL),(593,0,'แก้ไขสถานะไอเทม','status',582,2,2,'props.props',0,NULL),(594,1,'ประวัติการขาย','selllist',580,0,5,'props.sell.list',0,NULL),(595,0,'ลบประวัติการขาย','del',594,2,1,'props.sell',0,NULL),(596,0,'เซ็นสัญญาออนไลน์','add',80,0,5,'novel.sign.add',0,NULL),(597,0,'เปิดขาย','add',80,0,6,'novel.sell.add',0,NULL),(598,0,'เซ็นสัญญาออนไลน์','add',596,2,1,'novel.sign',0,NULL),(599,0,'เปิดขาย','add',597,2,1,'novel.sell',0,NULL),(600,0,'ปิดการขาย','remove',597,2,2,'novel.sell',0,NULL),(601,1,'จัดการรหัสบัตร','card',107,1,7,'',0,'fa-credit-card'),(602,1,'เพิ่มรหัสการ์ด','cardcreate',601,0,1,'user.card.create',0,'fa-list-ol'),(603,1,'รายการรหัสบัตร','cardlist',601,0,2,'user.card.list',0,'fa-cc-mastercard'),(604,0,'สร้างรหัสบัตร','create',602,2,1,'user.card',0,NULL),(605,1,'ดาวน์โหลดรหัสบัตร','carddown',601,0,3,'data.file.list&path=files/card',0,'fa-download'),(606,0,'ดาวน์โหลดไฟล์','down',366,2,5,'data.file',0,NULL),(607,0,'ลบรหัสบัตร','del',603,2,1,'user.card',0,NULL),(608,0,'ดำเนินการล้างรหัสการ์ด','clear',603,2,2,'user.card',0,NULL),(609,1,'การโต้ตอบของแฟนคลับ','',74,1,5,NULL,0,NULL),(610,1,'ประวัติการให้ทิป','fansreward',609,0,2,'novel.fans.reward',0,NULL),(611,1,'ประวัติการแนะนำ','fansticket',609,0,3,'novel.fans.ticket',0,NULL),(612,1,'ประวัติการติดตาม','fanssub',609,0,4,'novel.fans.sub',0,NULL),(613,1,'ระดับแฟนคลับ','fanslevel',609,0,1,'novel.fans.level',0,NULL),(614,0,'ลบประวัติการให้ทิป','delreward',610,2,1,'novel.fans',0,NULL),(615,0,'ดำเนินการล้างประวัติการให้รางวัล','clearreward',610,2,2,'novel.fans',0,NULL),(616,0,'ลบประวัติการแนะนำ','delticket',611,2,3,'novel.fans',0,NULL),(617,0,'ดำเนินการล้างประวัติการแนะนำ','clearticket',611,2,4,'novel.fans',0,NULL),(618,0,'ลบประวัติการติดตาม','delsub',612,2,5,'novel.fans',0,NULL),(619,0,'ดำเนินการล้างประวัติการติดตาม','clearsub',612,2,6,'novel.fans',0,NULL),(620,0,'เพิ่มระดับแฟนนิยาย','leveladd',613,2,7,'novel.fans',0,NULL),(621,0,'แก้ไขระดับแฟนนิยาย','leveledit',613,2,8,'novel.fans',0,NULL),(622,0,'ลบระดับแฟนนิยาย','leveldel',613,2,9,'novel.fans',0,NULL),(623,1,'ตั้งค่าการเงิน','config',99,0,8,'finance.set.config',0,'fa-krw'),(624,1,'ระดับเติมเงิน','level',99,0,5,'finance.level',0,'fa-align-center'),(626,0,'ดำเนินการตั้งค่าการเงิน','edit',623,2,1,'finance.config',0,NULL),(627,0,'เพิ่มระดับเติมเงิน','leveladd',624,2,1,'finance.level',0,NULL),(628,0,'แก้ไขระดับเติมเงิน','leveledit',624,2,2,'finance.level',0,NULL),(629,0,'ลบระดับเติมเงิน','leveldel',624,2,3,'finance.level',0,NULL),(630,0,'ลบประวัติการเงิน','del',101,2,1,'finance.finance',0,NULL),(631,0,'ดำเนินการล้างประวัติการเปลี่ยนแปลงเงิน','clear',101,2,2,'finance.finance',0,NULL),(632,1,'ประวัติการใช้งาน','log',601,0,3,'user.card.log',0,'fa-slack'),(633,0,'ลบประวัติใช้บัตร','del',632,2,1,'user.cardlog',0,NULL),(634,0,'ดำเนินการล้างประวัติการใช้บัตร','clear',632,2,2,'user.cardlog',0,NULL),(635,0,'ลบประวัติการเติมเงิน','del',102,2,1,'finance.order.charge',0,NULL),(636,0,'ดำเนินการล้างประวัติการเติมเงิน','clear',102,2,2,'finance.order.charge',0,NULL),(637,0,'ลบคำขอถอนเงิน','del',100,2,1,'finance.order.cash',0,NULL),(638,0,'ดำเนินการล้างคำขอถอนเงิน','clear',100,2,2,'finance.order.cash',0,NULL),(639,0,'ดำเนินการคำขอถอนเงิน','status',100,2,3,'finance.order.cash',0,NULL),(640,0,'ดูรายละเอียดบทความที่ส่งเข้ามา','refuse_author_article_edit',530,0,1,'system.apply.detail',0,NULL),(641,1,'ส่งลิงก์','urlpost',12,0,3,'system.seo.urlpost',0,'fa-compress'),(642,0,'ดำเนินการส่งลิงก์','post',641,2,1,'system.seo.urlpost',0,NULL),(643,1,'จัดการอีโมจิ','face',130,1,2,'',0,'fa-drupal'),(644,1,'ติดตั้งอีโมจิ','install',643,0,1,'operate.face.install',0,'fa-tripadvisor'),(645,0,'ดำเนินการติดตั้งอีโมจิ','install',644,2,1,'operate.face',0,NULL),(646,1,'ยืนยันการเข้าสู่ระบบ','code',22,0,3,'system.safe.code',3,'codepen'),(647,0,'ดำเนินการตั้งค่ารหัสยืนยัน','config',646,2,1,'system.safe.code',0,NULL),(648,1,'กำหนดค่าเครือข่ายเว็บไซต์','config',662,0,12,'system.site.config',0,'fa-crop'),(649,1,'แก้ไขการตั้งค่าหลายเว็บไซต์','edit',648,2,1,'system.site.config',0,NULL),(650,1,'ติดตั้งโมดูล','module_install',2,0,10,'system.module.install',0,'fa-th-large'),(651,0,'ดำเนินการติดตั้งโมดูล','install',650,2,1,'system.module.install',0,NULL),(652,1,'ตั้งค่านักพัฒนา','development',22,0,1,'system.dev.config',0,'fa-connectdevelop'),(653,0,'ตั้งค่านักพัฒนา','config',652,2,1,'system.dev.config',0,NULL),(654,1,'หน้าข้อผิดพลาด','errpage',12,0,14,'system.seo.errpage',0,'fa-pagelines'),(655,1,'บันทึกสไปเดอร์','spider',12,0,15,'system.seo.spider',0,'fa-opencart'),(656,0,'ลบหน้าข้อผิดพลาด','del',654,2,1,'system.seo.errpage',0,NULL),(657,0,'ดำเนินการล้างหน้าข้อผิดพลาด','clear',654,2,2,'system.seo.errpage',0,NULL),(658,0,'ลบหน้าข้อผิดพลาด','del',655,2,1,'system.seo.spider',0,NULL),(659,0,'ดำเนินการล้างหน้าข้อผิดพลาด','clear',655,2,2,'system.seo.spider',0,NULL),(660,1,'กราฟหน้าข้อผิดพลาด','errpage',162,0,3,'data.chart.errpage',0,NULL),(661,1,'กราฟบันทึกสไปเดอร์','spider',162,0,4,'data.chart.spider',0,NULL),(662,1,'จัดการเครือข่ายเว็บไซต์','site',1,0,5,NULL,0,'fa-object-group'),(663,1,'จัดการเว็บไซต์ภายใน','site',662,0,1,'system.site.site',0,'fa-indent'),(664,1,'จัดการเว็บไซต์ภายนอก','product',662,0,2,'system.site.product',0,'fa-dedent'),(665,0,'เพิ่มเว็บไซต์ภายนอก','add',664,0,1,'system.site.product.edit',0,NULL),(666,0,'แก้ไขเว็บไซต์ภายนอก','edit',664,0,2,'system.site.product.edit',0,NULL),(667,0,'ลบเว็บไซต์ภายนอก','del',664,2,1,'system.site.product',0,NULL),(668,0,'ดำเนินการล้างเว็บไซต์ภายนอก','clear',664,2,2,'system.site.product',0,NULL),(669,0,'ดำเนินการเพิ่มเว็บไซต์ภายนอก','add',665,2,1,'system.site.product',0,NULL),(670,0,'ดำเนินการแก้ไขเว็บไซต์ภายนอก','edit',666,2,1,'system.site.product',0,NULL),(671,0,'ดำเนินการทดสอบเว็บไซต์ภายนอก','test',665,2,2,'system.site.product',0,NULL),(672,0,'เพิ่มเว็บไซต์ภายใน','add',663,0,1,'system.site.site.edit',0,NULL),(673,0,'แก้ไขเว็บไซต์ภายใน','edit',663,0,2,'system.site.site.edit',0,NULL),(674,0,'ลบเว็บไซต์ในระบบ','del',663,2,1,'system.site.site',0,NULL),(675,0,'ดำเนินการล้างเว็บไซต์ภายใน','clear',663,2,2,'system.site.site',0,NULL),(676,0,'ดำเนินการเพิ่มเว็บไซต์ภายใน','add',672,2,1,'system.site.site',0,NULL),(677,0,'ดำเนินการแก้ไขเว็บไซต์ภายใน','edit',673,2,1,'system.site.site',0,NULL),(678,0,'ดำเนินการตรวจสอบเว็บไซต์ภายใน','status',663,2,3,'system.site.site',0,NULL),(679,0,'ดำเนินการตรวจสอบเว็บไซต์ภายนอก','status',664,2,3,'system.site.product',0,NULL),(680,1,'เงื่อนไขการค้นหา','novel_list',87,0,4,'system.retrieval.list',1,NULL),(681,0,'ลบการสืบค้น','novel_del',680,2,1,'system.retrieval',0,NULL),(682,0,'ตรวจสอบการสืบค้น','novel_status',680,2,2,'system.retrieval',0,NULL),(683,0,'แก้ไขการค้นหา','novel_edit',680,0,3,'system.retrieval.edit',0,NULL),(684,0,'เพิ่มการค้นหา','novel_add',680,0,4,'system.retrieval.edit',0,NULL),(685,0,'ดำเนินการเพิ่มการค้นหา','novel_add',684,2,1,'system.retrieval',0,NULL),(686,0,'ดำเนินการแก้ไขการค้นหา','novel_edit',683,2,1,'system.retrieval',0,NULL),(687,1,'ค้นหาหมวดหมู่','novel_type',87,0,3,'system.retrieval.type',1,NULL),(688,0,'แก้ไขหมวดหมู่','novel_type',687,2,1,'system.retrieval',0,NULL),(689,0,'แก้ไขสถานะหมวดหมู่','novel_typestatus',687,2,2,'system.retrieval',0,NULL),(690,1,'เพิ่มบริการอีเมล','add',173,0,1,'system.email.email.edit',0,NULL),(691,1,'แก้ไขบริการอีเมล','edit',173,0,2,'system.email.email.edit',0,NULL),(692,0,'ดำเนินการเพิ่มบริการอีเมล','add',690,2,11,'system.email.email',0,NULL),(693,0,'ดำเนินการแก้ไขบริการอีเมล','edit',691,2,1,'system.email.email',0,NULL),(694,0,'เปลี่ยนสถานะบริการอีเมล','status',173,2,3,'system.email.email',0,NULL),(695,0,'ดำเนินการลบบริการอีเมล','del',173,2,4,'system.email.email',0,NULL),(696,1,'เพิ่มเทมเพลตอีเมล','add',173,0,7,'system.email.temp.edit',0,NULL),(697,1,'แก้ไขเทมเพลตอีเมล','edit',173,0,8,'system.email.temp.edit',0,NULL),(698,0,'ดำเนินการเพิ่มเทมเพลตอีเมล','add',696,2,1,'system.email.temp',0,NULL),(699,0,'ดำเนินการแก้ไขเทมเพลตอีเมล','edit',697,2,1,'system.email.temp',0,NULL),(700,0,'เปลี่ยนสถานะเทมเพลตอีเมล','status',173,2,9,'system.email.temp',0,NULL),(701,0,'ดำเนินการลบเทมเพลตอีเมล','del',173,2,10,'system.email.temp',0,NULL),(702,1,'บันทึกอีเมล','emaillog',22,0,13,'system.safe.emaillog',0,'fa-university'),(703,1,'รายละเอียดบันทึกอีเมล','detail',702,0,1,'system.safe.emaillog.detail',0,NULL),(704,0,'ลบบันทึกอีเมล','del',702,2,1,'system.safe.emaillog',0,NULL),(705,0,'ดำเนินการล้างบันทึกอีเมล','clear',702,2,2,'system.safe.emaillog',0,NULL),(706,1,'ประวัติการอ่าน','list',609,0,5,'novel.fans.read',0,NULL),(707,0,'ลบประวัติการอ่าน','novel_del',706,2,1,'user.read',0,NULL),(708,0,'ล้างประวัติการอ่าน','novel_clear',706,2,2,'user.read',0,NULL),(709,0,'แนะนำคำค้น','rec',137,2,3,'operate.search',0,NULL),(710,1,'เครื่องมือนักพัฒนา','development',1,0,10,NULL,0,'fa-joomla'),(711,1,'เพิ่มหน้า','addpage',710,0,1,'system.dev.addpage',0,'fa-bookmark'),(712,0,'ดำเนินการเพิ่มหน้า','add',711,2,1,'system.dev.addpage',0,NULL),(713,1,'กราฟสถิติการเงิน','finance',162,0,5,'data.chart.finance',0,NULL),(714,1,'หน้าแรกเริ่มต้น','default_index',9,0,4,'system.menu.default_index',0,'fa-list-ul'),(715,0,'ดำเนินการตั้งหน้าแรกเริ่มต้น','default_index',714,0,1,'system.menu.menu',0,NULL),(716,0,'ประวัติการขาย','sell_log',609,0,10,'novel.sell.log',0,NULL),(717,1,'แอปคลาวด์','apps',552,1,0,NULL,0,'fa-cubes'),(718,1,'ปลั๊กอินของฉัน','plugin',717,0,2,'cloud.apps.plugin',0,'fa-plug'),(719,0,'ติดตั้งปลั๊กอิน','install',718,2,1,'cloud.apps.plugin',0,NULL),(720,0,'ถอนการติดตั้งปลั๊กอิน','uninstall',718,2,2,'cloud.apps.plugin',0,NULL),(721,0,'จัดการปลั๊กอิน','manager',718,0,1,'cloud.apps.plugin.manager',0,NULL),(722,0,'หน้าแรกปลั๊กอิน','index',721,0,1,'cloud.apps.plugin.index',0,NULL),(723,0,'จัดการธุรกิจปลั๊กอิน','business',721,0,2,'cloud.apps.plugin.business',0,NULL),(724,0,'แก้ไขการตั้งค่าปลั๊กอิน','config',723,2,1,'cloud.apps.plugin',0,NULL),(725,0,'ทดสอบสร้างลายน้ำ','water_test',5,2,2,'system.set.water',0,NULL),(726,1,'เพิ่มหมวดหมู่','type_add',149,0,1,'operate.zt.typeedit',0,'fa-plus-circle'),(727,1,'รายการหมวดหมู่','type_list',149,0,2,'operate.zt.typelist',0,'fa-indent'),(728,0,'เพิ่มหมวดหมู่','type_add',726,2,1,'operate.zt.type',0,NULL),(729,0,'แก้ไขหมวดหมู่','type_edit',731,2,1,'operate.zt.type',0,NULL),(730,0,'ลบหมวดหมู่','type_del',727,2,2,'operate.zt.type',0,NULL),(731,0,'แก้ไขหมวดหมู่','type_edit',727,0,2,'operate.zt.typeedit',0,NULL),(732,1,'แก้ไขการตั้งค่า','config',149,0,9,'operate.zt.config',0,'fa-wrench'),(733,0,'แก้ไขการตั้งค่า','config_edit',732,2,1,'operate.zt.config',0,NULL),(734,1,'เพิ่มหมวดหมู่','type_add',141,0,1,'operate.flash.typeedit',0,'fa-plus-circle'),(735,0,'แก้ไขหมวดหมู่','type_edit',736,0,2,'operate.flash.typeedit',0,NULL),(736,1,'รายการหมวดหมู่','type_list',141,0,2,'operate.flash.typelist',0,'fa-indent'),(737,0,'เพิ่มหมวดหมู่','type_add',734,2,1,'operate.flash.type',0,NULL),(738,0,'แก้ไขหมวดหมู่','type_edit',735,2,1,'operate.flash.type',0,NULL),(739,0,'ลบหมวดหมู่','type_del',736,2,2,'operate.flash.type',0,NULL),(740,0,'เพิ่มฟรีชั่วคราว','add',80,0,7,'novel.timelimit.edit',0,NULL),(741,0,'ดำเนินการเพิ่มฟรีชั่วคราว','add',740,2,1,'novel.timelimit',0,NULL),(742,1,'ฟรีชั่วคราว','timelimit',78,0,4,'novel.timelimit.list',0,NULL),(743,0,'แก้ไขฟรีชั่วคราว','edit',742,0,1,'novel.timelimit.edit',0,NULL),(744,0,'ดำเนินการแก้ไขฟรีชั่วคราว','edit',743,2,1,'novel.timelimit',0,NULL),(745,0,'ลบโปรฟรีชั่วคราว','del',742,2,2,'novel.timelimit',0,NULL),(746,0,'ตั้งค่าสวัสดิการ','welfare',80,0,7,'novel.sell.welfare',0,NULL),(747,0,'ดำเนินการตั้งค่าสวัสดิการ','edit',746,2,1,'novel.sell.welfare',0,NULL),(748,0,'สถิติการชำระบัญชี','settlement',80,0,8,'novel.sell.settlement',0,NULL),(749,0,'ดำเนินการคำขอชำระบัญชี','apply',748,2,1,'novel.sell.settlement',0,NULL),(750,1,'คำขอการเงิน','apply_list',99,0,0,'finance.apply.list',0,'fa-gg'),(751,0,'รายละเอียดคำขอการเงิน','apply_detail',750,0,1,'finance.apply.detail',0,NULL),(752,0,'ดำเนินการจัดการคำขอการเงิน','status',751,2,1,'finance.apply',0,NULL),(753,0,'ดำเนินการลบคำขอการเงิน','del',750,2,1,'finance.apply',0,NULL),(754,0,'ดำเนินการล้างคำขอการเงิน','clear',750,2,2,'finance.apply',0,NULL),(755,1,'เพิ่ม API','addapi',710,0,2,'system.dev.addapi',0,'fa-random'),(756,0,'เพิ่ม API','add',755,2,1,'system.dev.addapi',0,NULL),(757,1,'รูปแบบ URL','urlmode',12,0,1,'system.seo.urlmode',0,'fa-link'),(758,0,'บันทึกรูปแบบ URL','config',757,2,1,'system.seo.urlmode',0,NULL),(759,1,'ร่วมศึกษาความต้องการ','list',554,0,3,'cloud.together.list',0,'fa-houzz'),(760,0,'ดำเนินการดึงรายการความต้องการ','getlist',759,2,1,'cloud.together',0,NULL),(761,0,'ดำเนินการความต้องการ','operation',759,2,2,'cloud.together',0,NULL),(762,1,'รายละเอียดความต้องการ','detail',759,0,1,'cloud.together.detail',0,NULL),(763,0,'ดำเนินการดึงรายละเอียดความต้องการ','detail',762,2,1,'cloud.together',0,NULL),(764,1,'ส่งข้อเสนอความต้องการ','add',759,0,2,'cloud.together.add',0,NULL),(765,0,'ส่งข้อเสนอความต้องการ','add',764,2,1,'cloud.together',0,NULL),(766,0,'อัปโหลด txt','upload',84,0,10,'novel.txt.upload',0,NULL),(767,0,'รีเซ็ตไฟล์ TXT','init',766,2,1,'novel.txt',0,NULL),(768,0,'ลบ TXT ที่อัปโหลด','del',766,2,2,'novel.txt',0,NULL),(769,0,'นำเข้า TXT','import',766,2,3,'novel.txt',0,NULL),(770,1,'ศูนย์แอป','apps',717,0,1,'cloud.apps.index',0,'fa-th'),(771,0,'ติดตั้งแอป','install',770,2,1,'cloud.apps',0,NULL),(772,1,'แผนงานสแตติก','html_plan',12,0,3,'system.seo.html_plan.list',0,'fa-file-text-o'),(773,0,'ดำเนินการเพิ่มแผนงานสแตติก','add',772,2,1,'system.seo.html_plan',0,NULL),(774,0,'ลบแผนงานสแตติก','del',772,2,2,'system.seo.html_plan',0,NULL),(775,0,'รันแผนงานสแตติก','run',772,2,3,'system.seo.html_plan',0,NULL),(776,1,'บัญชีทางการ WeChat','weixin',130,1,2,NULL,0,'fa-weixin'),(777,1,'รายการบัญชีทางการ','account_list',776,0,1,'operate.weixin.account.list',0,'fa-list'),(778,0,'เพิ่มบัญชีทางการ','add',777,0,2,'operate.weixin.account.edit',0,NULL),(779,0,'แก้ไขบัญชีทางการ','edit',777,0,2,'operate.weixin.account.edit',0,NULL),(780,0,'ดำเนินการเพิ่มบัญชีทางการ','add',778,2,1,'operate.weixin.account',0,NULL),(781,0,'ดำเนินการแก้ไขบัญชีทางการ','edit',779,2,2,'operate.weixin.account',0,NULL),(782,0,'ลบบัญชีทางการ','del',777,2,3,'operate.weixin.account',0,NULL),(783,0,'ตรวจสอบบัญชีทางการ','status',777,2,4,'operate.weixin.account',0,NULL),(784,0,'ดำเนินการตรวจสอบบัญชีทางการ','check',777,2,5,'operate.weixin.account',0,NULL),(785,0,'ดำเนินการตั้งเป็นบัญชีหลัก','main',777,2,6,'operate.weixin.account',0,NULL),(786,1,'เมนูกำหนดเอง','menu_list',776,0,2,'operate.weixin.menu.list',0,'fa-medium'),(787,0,'เพิ่มเมนูกำหนดเอง','add',786,0,2,'operate.weixin.menu.edit',0,NULL),(788,0,'แก้ไขเมนูกำหนดเอง','edit',786,0,2,'operate.weixin.menu.edit',0,NULL),(789,0,'ดำเนินการเพิ่มเมนูกำหนดเอง','add',787,2,1,'operate.weixin.menu',0,NULL),(790,0,'ดำเนินการแก้ไขเมนูกำหนดเอง','edit',788,2,2,'operate.weixin.menu',0,NULL),(791,0,'ลบเมนูกำหนดเอง','del',786,2,3,'operate.weixin.menu',0,NULL),(792,0,'ตรวจสอบเมนูกำหนดเอง','status',786,2,4,'operate.weixin.menu',0,NULL),(793,0,'ส่งเมนูกำหนดเอง','push',786,2,5,'operate.weixin.menu',0,NULL),(794,0,'คัดลอกเมนูกำหนดเอง','copy',786,2,6,'operate.weixin.menu',0,NULL),(795,0,'คัดลอกเมนูกำหนดเอง','copy',786,0,3,'operate.weixin.menu.copy',0,NULL),(796,1,'ตอบกลับอัตโนมัติ','autoreply_list',776,0,3,'operate.weixin.autoreply.list',0,'fa-retweet'),(797,0,'เพิ่มการตอบกลับอัตโนมัติ','add',796,0,2,'operate.weixin.autoreply.edit',0,NULL),(798,0,'แก้ไขการตอบกลับอัตโนมัติ','edit',796,0,2,'operate.weixin.autoreply.edit',0,NULL),(799,0,'คัดลอกตอบกลับอัตโนมัติ','copy',796,0,3,'operate.weixin.autoreply.copy',0,NULL),(800,0,'ดำเนินการเพิ่มการตอบกลับอัตโนมัติ','add',797,2,1,'operate.weixin.autoreply',0,NULL),(801,0,'ดำเนินการแก้ไขการตอบกลับอัตโนมัติ','edit',798,2,2,'operate.weixin.autoreply',0,NULL),(802,0,'ลบตอบกลับอัตโนมัติ','del',796,2,3,'operate.weixin.autoreply',0,NULL),(803,0,'ตรวจสอบตอบกลับอัตโนมัติ','status',796,2,4,'operate.weixin.autoreply',0,NULL),(804,0,'คัดลอกตอบกลับอัตโนมัติ','copy',799,2,5,'operate.weixin.autoreply',0,NULL),(805,1,'จัดการการแจ้งเตือน','msg_list',776,0,5,'operate.weixin.msg.list',0,'fa-comment-o'),(806,0,'ลบข้อความ','del',805,2,1,'operate.weixin.msg',0,NULL),(807,0,'ดูรายละเอียดการแจ้งเตือน','detail',805,0,2,'operate.weixin.msg.detail',0,NULL),(808,1,'จัดการสื่อ','media_list',776,0,4,'operate.weixin.media.list',0,'fa-paperclip'),(809,0,'ดูรายละเอียดสื่อ','detail',808,0,2,'operate.weixin.media.detail',0,NULL),(810,0,'ลบสื่อ','del',808,2,1,'operate.weixin.media',0,NULL),(811,0,'เพิ่มสื่อ','add',808,0,1,'operate.weixin.media.edit',0,NULL),(812,0,'ดำเนินการเพิ่มสื่อ','add',811,2,2,'operate.weixin.media',0,NULL),(813,1,'จัดการแฟนคลับ','media_list',776,0,6,'operate.weixin.fans.list',0,'fa-street-view'),(814,0,'ดูรายละเอียดแฟนคลับ','detail',813,0,2,'operate.weixin.fans.detail',0,NULL),(815,0,'ลบแฟนคลับ','del',813,2,1,'operate.weixin.fans',0,NULL),(816,0,'เลือกสื่อกลับมา','lookup',808,0,1,'operate.weixin.media.lookup',0,NULL),(817,1,'เงื่อนไขการค้นหา','app_list',68,0,5,'system.retrieval.list',1,NULL),(818,0,'ลบการสืบค้น','app_del',817,2,1,'system.retrieval',0,NULL),(819,0,'ตรวจสอบการสืบค้น','app_status',817,2,2,'system.retrieval',0,NULL),(820,0,'แก้ไขการค้นหา','app_edit',817,0,3,'system.retrieval.edit',0,NULL),(821,0,'เพิ่มการค้นหา','app_add',817,0,4,'system.retrieval.edit',0,NULL),(822,0,'ดำเนินการเพิ่มการค้นหา','app_add',821,2,1,'system.retrieval',0,NULL),(823,0,'ดำเนินการแก้ไขการค้นหา','app_edit',820,2,1,'system.retrieval',0,NULL),(824,1,'ค้นหาหมวดหมู่','app_type',68,0,4,'system.retrieval.type',1,NULL),(825,0,'แก้ไขหมวดหมู่','app_type',823,2,1,'system.retrieval',0,NULL),(826,0,'แก้ไขสถานะหมวดหมู่','app_typestatus',823,2,2,'system.retrieval',0,NULL),(827,0,'ดูรายละเอียดการแจ้งเตือนผู้ใช้','detail',116,0,2,'user.msg.detail',0,NULL),(828,1,'เพิ่มปลั๊กอิน','addplugin',710,0,3,'system.dev.addplugin',0,'fa-slack'),(829,0,'ดำเนินการเพิ่มปลั๊กอิน','plugin_add',828,2,1,'system.dev.addplugin',0,NULL),(830,0,'ดำเนินการเพิ่มการตั้งค่าปลั๊กอิน','config_add',828,2,2,'system.dev.addplugin',0,NULL),(831,0,'ดำเนินการดึงการตั้งค่าปลั๊กอิน','getpluginconfig',828,2,3,'system.dev.addplugin',0,NULL),(832,0,'ลบการตั้งค่าปลั๊กอิน','config_del',828,2,4,'system.dev.addplugin',0,NULL),(833,0,'อัปเดตแอป','update',718,2,3,'cloud.apps',0,NULL),(834,1,'คลังคำต้องห้าม','shield',22,0,22,'system.safe.shield',0,'fa-font'),(835,0,'แก้ไขคลังคำต้องห้าม','config',834,2,1,'system.safe.shield',0,NULL),(836,0,'ลงโทษผู้ใช้','punish',110,0,4,'user.punish.punish',0,NULL),(837,0,'ดำเนินการลงโทษผู้ใช้','punish',836,2,1,'user.punish',0,NULL),(838,0,'ดำเนินการยกเลิกโทษผู้ใช้','unpunish',836,2,2,'user.punish',0,NULL),(839,1,'ประวัติการลงโทษ','punishlist',108,0,5,'user.punish.list',0,'fa-user-times'),(840,0,'ลบบทลงโทษผู้ใช้','del',839,2,1,'user.punish',0,NULL),(841,1,'เทมเพลตการแจ้งเตือน','msglist',245,0,5,'system.config.msg.list',0,'fa-envelope-o'),(842,0,'เพิ่มเทมเพลตการแจ้งเตือน','add',841,0,1,'system.config.msg.edit',0,NULL),(843,0,'แก้ไขเทมเพลตการแจ้งเตือน','edit',841,0,2,'system.config.msg.edit',0,NULL),(844,0,'ดำเนินการเพิ่มเทมเพลตการแจ้งเตือน','add',842,2,1,'system.config.msg',0,NULL),(845,0,'ดำเนินการแก้ไขเทมเพลตการแจ้งเตือน','edit',843,2,1,'system.config.msg',0,NULL),(846,0,'ลบเทมเพลตข้อความ','del',841,2,1,'system.config.msg',0,NULL),(871,1,'จัดการแท็ก','novel_tags',103,0,4,'system.tags.list',1,NULL),(870,0,'ลบบันทึกข้อมูล','del',867,2,1,'system.safe.msglog',0,NULL),(869,0,'ล้างบันทึกข้อมูล','clear',867,2,2,'system.safe.msglog',0,NULL),(868,1,'บันทึกข้อมูล','msglog',22,0,12,'system.safe.msglog',0,'fa-commenting'),(867,1,'บันทึก SMS','smslog',22,0,14,'system.set.smslog',0,'fa-envelope'),(853,1,'ตั้งค่า SMS','sms',245,0,6,'system.set.sms',0,'fa-envelope'),(854,1,'เพิ่มเทมเพลต SMS','add',853,0,1,'system.set.sms.edit',0,NULL),(855,1,'แก้ไขเทมเพลต SMS','edit',853,0,2,'system.set.sms.edit',0,NULL),(856,0,'ดำเนินการเพิ่มเทมเพลต SMS','add',854,2,11,'system.sms',0,NULL),(857,0,'ดำเนินการแก้ไขเทมเพลต SMS','edit',855,2,1,'system.sms',0,NULL),(858,0,'เปลี่ยนสถานะเทมเพลต SMS','status',853,2,3,'system.sms',0,NULL),(859,0,'ดำเนินการลบเทมเพลต SMS','del',853,2,4,'system.sms',0,NULL),(860,0,'ดำเนินการลบบันทึก SMS','del',866,2,4,'system.smslog',0,NULL),(861,0,'ดำเนินการล้างบันทึก SMS','clear',866,2,4,'system.smslog',0,NULL),(862,1,'รายงานยอดขาย','report_list',99,0,0,'finance.report.list',0,'fa-bar-chart-o'),(863,0,'ยืนยันรายงานยอดขาย','confirm',862,2,1,'finance.report',0,NULL),(864,0,'รายงานยอดขายชำระบัญชี','settlement',862,2,2,'finance.report',0,NULL),(865,1,'ประวัติการชำระบัญชี','report_order',99,0,0,'finance.report.order',0,'fa-align-justify'),(866,1,'ดำเนินการหลายตอนพร้อมกัน','batch',86,2,4,'novel.chapter',0,NULL),(872,0,'ลบแท็ก','novel_del',871,2,3,'system.tags',0,NULL),(873,0,'ดำเนินการแนะนำแท็ก','novel_author_rec',871,2,4,'system.tags',0,NULL),(874,0,'แก้ไขแท็ก','novel_edit',871,0,2,'system.tags.edit',0,NULL),(875,0,'เพิ่มแท็ก','novel_add',871,0,1,'system.tags.edit',0,NULL),(876,0,'ดำเนินการเพิ่มแท็ก','novel_add',875,2,1,'system.tags',0,NULL),(877,0,'ดำเนินการแก้ไขแท็ก','novel_edit',874,2,1,'system.tags',0,NULL),(878,0,'ดำเนินการล้างแท็ก','novel_clear',871,2,5,'system.tags',0,NULL),(879,1,'จัดการหมวดหมู่แท็ก','novel_tags_type',103,0,3,'system.tags.type.list',1,NULL),(880,0,'ลบหมวดหมู่แท็ก','novel_del',879,2,3,'system.tags.type',0,NULL),(881,0,'แก้ไขหมวดหมู่แท็ก','novel_edit',879,0,2,'system.tags.type.edit',0,NULL),(882,0,'เพิ่มหมวดหมู่แท็ก','novel_add',879,0,1,'system.tags.type.edit',0,NULL),(883,0,'ดำเนินการเพิ่มหมวดหมู่แท็ก','novel_add',882,2,1,'system.tags.type',0,NULL),(884,0,'ดำเนินการแก้ไขหมวดหมู่แท็ก','novel_edit',881,2,1,'system.tags.type',0,NULL),(885,1,'เสียงพูด TTS','tts_voicet_list',245,0,8,'system.api.ttsvoicet.list',0,'fa-music'),(886,0,'ลบเสียงพูด','tts_voicet_del',885,2,1,'system.api.ttsvoicet',0,NULL),(887,0,'แก้ไขผู้พากย์เสียง','tts_voicet_edit',885,0,2,'system.api.ttsvoicet.edit',0,NULL),(888,0,'เพิ่มผู้พากย์เสียง','tts_voicet_add',885,0,3,'system.api.ttsvoicet.add',0,NULL),(889,0,'ดำเนินการเพิ่มผู้พากย์เสียง','tts_voicet_add',888,2,1,'system.api.ttsvoicet',0,NULL),(890,0,'ดำเนินการแก้ไขผู้พากย์เสียง','tts_voicet_edit',887,2,1,'system.api.ttsvoicet',0,NULL),(891,1,'แก้ไขโมดูล','editor',25,0,7,'',0,'fa-columns'),(892,1,'จัดการกลุ่ม','group',891,1,1,'',0,NULL),(893,1,'รายการกลุ่ม','group_list',892,1,1,'editor.group.list',0,NULL),(894,1,'แก้ไขผู้ดูแลระบบ','editor',891,1,1,'',0,NULL),(895,1,'แก้ไขรายการ','editor_list',894,1,1,'editor.editor.list',0,NULL),(896,0,'เพิ่มกลุ่มบรรณาธิการ','add',893,0,1,'editor.group.edit',0,NULL),(897,0,'ดำเนินการเพิ่มกลุ่มบรรณาธิการ','add',896,2,1,'editor.group',0,NULL),(898,0,'แก้ไขกลุ่มบรรณาธิการ','edit',893,0,2,'editor.group.edit',0,NULL),(899,0,'ดำเนินการแก้ไขกลุ่มบรรณาธิการ','edit',898,2,1,'editor.group',0,NULL),(900,0,'ลบกลุ่มบรรณาธิการ','del',893,2,3,'editor.group',0,NULL),(901,0,'เพิ่มบรรณาธิการ','add',895,0,1,'editor.editor.edit',0,NULL),(902,0,'ดำเนินการเพิ่มบรรณาธิการ','add',901,2,1,'editor.editor',0,NULL),(903,0,'แก้ไขบรรณาธิการ','edit',895,0,1,'editor.editor.edit',0,NULL),(904,0,'แก้ไขบรรณาธิการ','edit',903,2,2,'editor.editor',0,NULL),(905,0,'ตรวจสอบและแก้ไขเร็ว','status',895,2,3,'editor.editor',0,NULL),(906,1,'เชื่อมโยงผลงาน','works_list',894,1,1,'editor.works.list',0,NULL),(907,0,'เพิ่มการเชื่อมโยงผลงาน','add',906,0,1,'editor.works.edit',0,NULL),(908,0,'ดำเนินการเพิ่มการเชื่อมโยงผลงาน','add',907,2,1,'editor.works',0,NULL),(909,0,'แก้ไขการเชื่อมโยงผลงาน','edit',906,0,1,'editor.works.edit',0,NULL),(910,0,'แก้ไขการเชื่อมโยงผลงาน','edit',909,2,2,'editor.works',0,NULL),(911,0,'ลบการเชื่อมโยงผลงาน','del',906,2,3,'editor.works',0,NULL),(912,1,'ตั้งค่าโมดูล','editor',891,1,1,'',0,NULL),(913,1,'ผูกฟังก์ชัน','editor',912,0,9,'system.module.config',1,NULL),(914,0,'ดำเนินการเพิ่มกลุ่มบรรณาธิการ','add',896,2,1,'editor.group',0,NULL),(915,1,'สมาชิกกลุ่ม','editor_bind',892,1,2,'editor.bind.list',0,NULL),(916,0,'เพิ่มสมาชิกในทีม','add',915,0,1,'editor.bind.edit',0,NULL),(917,0,'ดำเนินการเพิ่มสมาชิกในทีม','add',916,2,1,'editor.bind',0,NULL),(918,0,'แก้ไขสมาชิก','edit',915,0,1,'editor.bind.edit',0,NULL),(919,0,'แก้ไขสมาชิก','edit',918,2,2,'editor.bind',0,NULL),(920,0,'ลบสมาชิก','del',915,2,3,'editor.bind',0,NULL);
DROP TABLE IF EXISTS `wm_system_menu_default`;
CREATE TABLE `wm_system_menu_default` (
  `default_id` int NOT NULL AUTO_INCREMENT,
  `default_controller` varchar(30) NOT NULL COMMENT 'ชื่อคอนโทรลเลอร์',
  `default_mid` int NOT NULL COMMENT 'id ผู้ดูแลระบบ',
  PRIMARY KEY (`default_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
DROP TABLE IF EXISTS `wm_system_menu_quick`;
CREATE TABLE `wm_system_menu_quick` (
  `quick_id` int NOT NULL AUTO_INCREMENT,
  `quick_menu_id` int DEFAULT NULL COMMENT 'id ของเมนู',
  `quick_order` int DEFAULT '9' COMMENT 'ลำดับการแสดงเมนูลัด',
  `quick_manager_id` int DEFAULT NULL COMMENT 'id ของผู้ดูแลระบบ',
  PRIMARY KEY (`quick_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='เมนูลัด';
DROP TABLE IF EXISTS `wm_system_msg_log`;
CREATE TABLE `wm_system_msg_log` (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `log_status` tinyint(1) DEFAULT '0' COMMENT 'สถานะการใช้ 0=ยังไม่ใช้ 1=ใช้แล้ว 2=หมดอายุ',
  `log_channel` varchar(20) DEFAULT NULL COMMENT 'ช่องทางข้อความ',
  `log_channel_id` int DEFAULT NULL COMMENT 'ID บันทึกข้อความ',
  `log_receive` varchar(50) DEFAULT NULL COMMENT 'ผู้รับข้อความ',
  `log_params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'เนื้อหาข้อความ',
  `log_time` int DEFAULT '0' COMMENT 'เวลาส่ง',
  `log_exptime` int DEFAULT '0' COMMENT 'เวลาหมดอายุ',
  PRIMARY KEY (`log_id`),
  KEY `index` (`log_channel`,`log_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ดัชนีบันทึกการส่งข้อมูล';
DROP TABLE IF EXISTS `wm_system_msg_temp`;
CREATE TABLE `wm_system_msg_temp` (
  `temp_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID ของเทมเพลต',
  `temp_name` varchar(60) NOT NULL COMMENT 'ชื่อเทมเพลต',
  `temp_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่สังกัด',
  `temp_key` varchar(50) NOT NULL COMMENT 'ตัวระบุของเทมเพลต',
  `temp_content` mediumtext NOT NULL COMMENT 'เนื้อหาจดหมาย',
  PRIMARY KEY (`temp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเทมเพลตข้อความ';
INSERT INTO `wm_system_msg_temp` VALUES (1,'ห้ามเข้าสู่ระบบ','user','user_punish_login','<p>คุณถูกระบบห้ามเข้าสู่ระบบ เหตุผลในการลงโทษ: {原因}.</p>'),(2,'ห้ามแสดงความคิดเห็น','user','user_punish_talk','<p>คุณถูกระบบห้ามแสดงความคิดเห็น เหตุผลในการลงโทษ: {原因}.</p>'),(3,'ปลดห้ามเข้าสู่ระบบ','user','user_punish_unlogin','<p>ระบบได้ปลดห้ามการเข้าสู่ระบบของคุณแล้ว โปรดจดจำกฎของแพลตฟอร์มเพื่อไม่ให้ถูกแบนอีก</p>'),(4,'ปลดห้ามแสดงความคิดเห็น','user','user_punish_untalk','<p>ระบบได้ปลดห้ามแสดงความคิดเห็นของคุณแล้ว โปรดจดจำกฎของแพลตฟอร์มเพื่อไม่ให้ถูกห้ามแสดงความคิดเห็นอีก</p>'),(5,'แจ้งเตือนล่วงหน้า_เข้าสู่ระบบหลังบ้าน','all','warning_admin_login','<p>เรียนผู้ดูแลระบบ: IP{后台登录ip} เมื่อ{后台登录时间} เข้าสู่ระบบบัญชี{后台登录账号} สถานะ{后台登录状态}!</p>'),(6,'แจ้งเตือนล่วงหน้า_ข้อผิดพลาดของโค้ด','all','warning_code_eroor','<p>เรียนผู้ดูแลระบบ: เว็บไซต์เกิดข้อผิดพลาด {代码报错详情}!</p>');
DROP TABLE IF EXISTS `wm_system_retrieval`;
CREATE TABLE `wm_system_retrieval` (
  `retrieval_id` int NOT NULL AUTO_INCREMENT,
  `retrieval_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'สถานะการใช้งาน 0=ปิดใช้งาน 1=ใช้งาน',
  `retrieval_module` varchar(20) NOT NULL COMMENT 'โมดูลที่สังกัด',
  `retrieval_type_id` int NOT NULL DEFAULT '0' COMMENT 'ID ประเภทเงื่อนไขการค้นหา',
  `retrieval_title` varchar(60) NOT NULL COMMENT 'ชื่อเงื่อนไขการค้นหา',
  `retrieval_field` varchar(20) NOT NULL COMMENT 'ฟิลด์ของเงื่อนไขการค้นหา',
  `retrieval_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ประเภทการค้นหา, -1=ย้อนกลับ, 0=ตามลำดับ, 1=เท่ากับ, 2=น้อยกว่า, 3=มากกว่า, 4=ช่วง, 5=อักษรแรก, 6=คล้ายกัน, 7=ขึ้นต้นด้วยตัวเลข',
  `retrieval_value` varchar(20) NOT NULL COMMENT 'ค่าที่ค้นหา',
  `retrieval_order` int NOT NULL COMMENT 'ลำดับการแสดง',
  PRIMARY KEY (`retrieval_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเงื่อนไขการค้นหาหมวดหมู่';
INSERT INTO `wm_system_retrieval` VALUES (1,1,'novel',1,'ทั้งหมด','novel_process',1,'-1',1),(2,1,'novel',1,'กำลังเขียน','novel_process',1,'1',2),(3,1,'novel',1,'จบแล้ว','novel_process',1,'2',3),(4,1,'novel',2,'ต่ำกว่า 3 แสนคำ','novel_wordnumber',2,'300000',2),(5,1,'novel',2,'3-10 แสนคำ','novel_wordnumber',4,'300000,1000000',3),(6,1,'novel',2,'1-2 ล้านคำ','novel_wordnumber',4,'1000000,2000000',4),(7,1,'novel',2,'เกิน 2 ล้านคำ','novel_wordnumber',3,'2000000',5),(8,1,'novel',2,'ทั้งหมด','novel_wordnumber',1,'-1',1),(9,1,'novel',3,'ทั้งหมด','novel_chapter',1,'-1',1),(10,1,'novel',3,'ต่ำกว่า 1,000 ตอน','novel_chapter',2,'1000',2),(11,1,'novel',3,'1,000-2,000 ตอน','novel_chapter',4,'1000,2000',3),(12,1,'novel',3,'2,000-3,000 ตอน','novel_chapter',4,'2000,3000',4),(13,1,'novel',3,'เกิน 3,000 ตอน','novel_chapter',3,'3000',5),(14,1,'novel',4,'ทั้งหมด','novel_type',1,'-1',1),(15,1,'novel',4,'ต้นฉบับ','novel_type',1,'1',2),(16,1,'novel',4,'นำไปเผยแพร่ต่อ','novel_type',1,'2',3),(17,1,'novel',4,'เซ็นสัญญา','novel_sign_id',1,'1',4),(18,1,'novel',4,'วางขาย','novel_sell',1,'1',5),(19,1,'novel',4,'ซื้อขาด','novel_copyright',1,'2',6),(20,1,'novel',5,'ทั้งหมด','novel_sell',1,'-1',1),(21,1,'novel',5,'ฟรี','novel_sell',1,'0',2),(22,1,'novel',5,'เสียเงิน','novel_sell',1,'1',3),(23,1,'novel',7,'อัปเดต','novel_uptime',-1,'-1',1),(24,1,'novel',7,'คลิก','novel_allclick',-1,'',2),(25,1,'novel',7,'แนะนำ','novel_allrec',-1,'',3),(26,1,'novel',7,'รายการโปรด','novel_allcoll',-1,'',4),(27,1,'novel',7,'จำนวนคำ','novel_wordnumber',-1,'',5),(28,1,'novel',7,'ตอน','novel_chapter',-1,'',6),(29,1,'novel',6,'ทั้งหมด','novel_pinyin',5,'-1',1),(30,1,'novel',6,'A','novel_pinyin',5,'a',2),(31,1,'novel',6,'B','novel_pinyin',5,'b',3),(32,1,'novel',6,'C','novel_pinyin',5,'c',4),(33,1,'novel',6,'D','novel_pinyin',5,'d',5),(34,1,'novel',6,'E','novel_pinyin',5,'e',6),(35,1,'novel',6,'F','novel_pinyin',5,'f',7),(36,1,'novel',6,'G','novel_pinyin',5,'g',8),(37,1,'novel',6,'H','novel_pinyin',5,'h',9),(38,1,'novel',6,'I','novel_pinyin',5,'i',10),(39,1,'novel',6,'J','novel_pinyin',5,'j',11),(40,1,'novel',6,'K','novel_pinyin',5,'k',12),(41,1,'novel',6,'L','novel_pinyin',5,'l',13),(42,1,'novel',6,'M','novel_pinyin',5,'m',14),(43,1,'novel',6,'N','novel_pinyin',5,'n',15),(44,1,'novel',6,'O','novel_pinyin',5,'o',16),(45,1,'novel',6,'P','novel_pinyin',5,'p',17),(46,1,'novel',6,'Q','novel_pinyin',5,'q',18),(47,1,'novel',6,'R','novel_pinyin',5,'r',19),(48,1,'novel',6,'S','novel_pinyin',5,'s',20),(49,1,'novel',6,'T','novel_pinyin',5,'t',21),(50,1,'novel',6,'U','novel_pinyin',5,'u',22),(51,1,'novel',6,'V','novel_pinyin',5,'v',23),(52,1,'novel',6,'W','novel_pinyin',5,'w',24),(53,1,'novel',6,'X','novel_pinyin',5,'x',25),(54,1,'novel',6,'Y','novel_pinyin',5,'y',26),(55,1,'novel',6,'Z','novel_pinyin',5,'z',27),(56,1,'novel',6,'0-9','novel_pinyin',7,'0,9',28),(57,1,'app',8,'ทั้งหมด','app_rec',1,'-1',1),(58,1,'app',8,'แนะนำแล้ว','app_rec',1,'1',2),(59,1,'app',8,'ยังไม่แนะนำ','app_rec',1,'0',3),(60,1,'app',9,'ทั้งหมด','app_lid',1,'-1',1),(61,1,'app',9,'จีน','app_lid',8,'9',2),(62,1,'app',9,'อังกฤษ','app_lid',8,'7',3),(63,1,'app',10,'ทั้งหมด','app_cid',1,'-1',1),(64,1,'app',10,'ฟรี','app_cid',8,'11',2),(65,1,'app',10,'ซื้อในแอป','app_cid',8,'5',3),(66,1,'app',10,'แครก','app_cid',8,'10',4),(67,1,'app',11,'ต่ำกว่า 100M','app_size',2,'100',1),(68,1,'app',11,'100-500M','app_size',4,'100,500',2),(69,1,'app',11,'500M-1G','app_size',4,'500,1000',3),(70,1,'app',11,'1-2G','app_size',4,'1000,2000',4),(71,1,'app',11,'2G ขึ้นไป','app_size',3,'2000',5),(72,1,'app',11,'ทั้งหมด','app_size',3,'-1',0),(73,1,'app',12,'ทั้งหมด','app_paid',1,'-1',1),(74,1,'app',12,'Android','app_paid',8,'4',2),(75,1,'app',12,'Apple','app_paid',8,'8',3),(76,1,'app',12,'Symbian','app_paid',8,'6',4),(77,1,'app',13,'ค่าเริ่มต้น','app_addtime',1,'-1',1),(78,1,'app',13,'ความร้อนแรง','app_read',-1,'',2),(79,1,'app',13,'อภิปราย','app_replay',-1,'',2),(80,1,'app',13,'ถูกใจ','app_ding',-1,'',3),(81,1,'app',13,'ไม่ชอบ','app_cai',-1,'',4),(82,1,'app',13,'ระดับดาว','app_start',-1,'',6),(83,1,'app',13,'ให้คะแนน','app_score',-1,'',7);
DROP TABLE IF EXISTS `wm_system_retrieval_type`;
CREATE TABLE `wm_system_retrieval_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'สถานะหมวดหมู่ 0=ซ่อน 1=แสดง',
  `type_module` varchar(20) NOT NULL COMMENT 'โมดูลที่หมวดหมู่อยู่',
  `type_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=เงื่อนไข 2=การเรียงลำดับ',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_par` varchar(20) NOT NULL COMMENT 'ชื่อพารามิเตอร์ของหมวดหมู่',
  `type_order` int NOT NULL DEFAULT '99' COMMENT 'ลำดับหมวดหมู่',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่การสืบค้น';
INSERT INTO `wm_system_retrieval_type` VALUES (1,1,'novel',1,'โพรเซส','process',1),(2,1,'novel',1,'จำนวนคำ','word',2),(3,1,'novel',1,'ตอน','chapter',3),(4,1,'novel',1,'ลิขสิทธิ์','copy',4),(5,1,'novel',1,'ค่าใช้จ่าย','cost',5),(6,1,'novel',1,'ตัวอักษร','letter',6),(7,1,'novel',2,'เรียงลำดับ','order',7),(8,1,'app',1,'แนะนำ','rec',1),(9,1,'app',1,'ภาษา','lang',2),(10,1,'app',1,'อัตราค่าบริการ','cost',3),(11,1,'app',1,'ขนาด','size',4),(12,1,'app',1,'แพลตฟอร์ม','platform',5),(13,1,'app',2,'เรียงลำดับ','order',6);
DROP TABLE IF EXISTS `wm_system_sms`;
CREATE TABLE `wm_system_sms` (
  `sms_id` int NOT NULL AUTO_INCREMENT,
  `sms_status` tinyint(1) DEFAULT '1' COMMENT 'สถานะ:1=ใช้งาน,0=ปิดใช้งาน',
  `sms_api_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'อินเทอร์เฟซ SMS',
  `sms_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ประเภทเทมเพลต',
  `sms_sign` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'ลายเซ็นเทมเพลตของบุคคลที่สาม',
  `sms_tempcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'โค้ดเทมเพลตของบุคคลที่สาม',
  `sms_params` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'พารามิเตอร์แทนที่',
  `sms_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาสร้าง',
  PRIMARY KEY (`sms_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='เทมเพลต SMS';
INSERT INTO `wm_system_sms` VALUES (1,1,'aliyunsms','user_login','ทดสอบ SMS ของ Aliyun','SMS_154950909','code:{#123}code{#125}',1647915216),(2,1,'aliyunsms','user_reg','ทดสอบ SMS ของ Aliyun','SMS_154950909','code:{#123}code{#125}',1647915222),(3,1,'aliyunsms','user_veremail','ทดสอบ SMS ของ Aliyun','SMS_154950909','code:{#123}code{#125}',1647915226),(4,1,'aliyunsms','user_getpsw','ทดสอบ SMS ของ Aliyun','SMS_154950909','code:{#123}code{#125}',1647915231),(5,0,'aliyunsms','user_welcome','ทดสอบ SMS ของ Aliyun','SMS_154950909','code:{#123}code{#125}',1647915236),(6,1,'tencentsms','user_login','ความฝันของเวยเมิ่ง','1345770','1:{#123}code{#125}',1647915216),(7,1,'tencentsms','user_reg','ความฝันของเวยเมิ่ง','1345770','1:{#123}code{#125}',1647915222),(8,1,'tencentsms','user_veremail','ความฝันของเวยเมิ่ง','1345770','1:{#123}code{#125}',1647915226),(9,1,'tencentsms','user_getpsw','ความฝันของเวยเมิ่ง','1345770','1:{#123}code{#125}',1647915231),(10,0,'tencentsms','user_welcome','ความฝันของเวยเมิ่ง','1345770','1:{#123}code{#125}',1647915236),(11,1,'aliyunsms','user_bind','ทดสอบ SMS ของ Aliyun','SMS_154950909','code:{#123}code{#125}',1647915216),(12,1,'tencentsms','user_bind','ความฝันของเวยเมิ่ง','1345770','1:{#123}code{#125}',1647915222),(13,1,'tencentsms','warning_code_eroor','ความฝันของเวยเมิ่ง','1345770','IP ที่เกิดข้อผิดพลาด:{#123}代码报错ip{#125}\\r\\nรายละเอียดข้อผิดพลาดของโค้ด:{#123}代码报错详情{#125}\\r\\nโค้ดข้อผิดพลาด:{#123}代码报错代码{#125}\\r\\nเวลาที่เกิดข้อผิดพลาด:{#123}代码报错时间{#125}\\r\\nurl ที่เกิดข้อผิดพลาด:{#123}代码报错url{#125}\\r\\nsql ที่เกิดข้อผิดพลาด:{#123}代码报错sql{#125}',1648901665),(14,1,'tencentsms','warning_admin_login','ความฝันของเวยเมิ่ง','1345770','IP ที่เข้าสู่ระบบหลังบ้าน:{#123}后台登录ip{#125}\\r\\nบัญชีที่เข้าสู่ระบบหลังบ้าน:{#123}后台登录账号{#125}\\r\\nเวลาที่เข้าสู่ระบบหลังบ้าน:{#123}后台登录时间{#125}\\r\\nสถานะการเข้าสู่ระบบหลังบ้าน:{#123}后台登录状态{#125}',1648901665),(15,1,'aliyunsms','warning_code_eroor','ทดสอบ SMS ของ Aliyun','SMS_154950909','1:{#123}代码报错ip{#125}\r\n2:{#123}代码报错详情{#125}\r\n3:{#123}代码报错代码{#125}\r\n4:{#123}代码报错时间{#125}\r\n5:{#123}代码报错url{#125}\r\n6:{#123}代码报错sql{#125}',1648901665),(16,1,'aliyunsms','warning_admin_login','ทดสอบ SMS ของ Aliyun','SMS_154950909','1:{#123}后台登录ip{#125}\r\n2:{#123}后台登录账号{#125}\r\n3:{#123}后台登录时间{#125}\r\n4:{#123}后台登录状态{#125}',1648901665);
DROP TABLE IF EXISTS `wm_system_sms_log`;
CREATE TABLE `wm_system_sms_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_status` tinyint(1) DEFAULT '0' COMMENT 'สถานะการใช้ 0=ยังไม่ใช้ 1=ใช้แล้ว 2=หมดอายุ',
  `log_send` tinyint(1) DEFAULT '1' COMMENT 'สถานะการส่ง 1=สำเร็จ 0=ล้มเหลว',
  `log_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ประเภท SMS',
  `log_remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'ข้อความล้มเหลว',
  `log_sender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'ผู้ส่ง',
  `log_receive` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ผู้รับ',
  `log_content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'เนื้อหาข้อความ',
  `log_time` int DEFAULT NULL COMMENT 'เวลาส่ง',
  `log_exptime` int DEFAULT NULL COMMENT 'เวลาหมดอายุ',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='ตารางบันทึกการส่งข้อมูล';
DROP TABLE IF EXISTS `wm_system_tags`;
CREATE TABLE `wm_system_tags` (
  `tags_id` int NOT NULL AUTO_INCREMENT,
  `tags_type_id` int NOT NULL DEFAULT '1' COMMENT 'หมวดหมู่ที่สังกัด',
  `tags_module` varchar(20) NOT NULL COMMENT 'โมดูลที่แท็กสังกัด',
  `tags_author_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำให้จัดแสดงหรือไม่',
  `tags_name` varchar(60) NOT NULL COMMENT 'ชื่อแท็ก',
  `tags_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินแท็ก',
  `tags_data` int NOT NULL DEFAULT '1' COMMENT 'จำนวนข้อมูลของแท็ก',
  `tags_search` int DEFAULT '0' COMMENT 'จำนวนครั้งที่ค้นหาแท็ก',
  `tags_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่สร้างแท็ก',
  PRIMARY KEY (`tags_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางแท็กของระบบ';
DROP TABLE IF EXISTS `wm_system_tags_type`;
CREATE TABLE `wm_system_tags_type` (
  `type_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_module` varchar(20) NOT NULL COMMENT 'โมดูลหมวดหมู่',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_desc` varchar(100) DEFAULT NULL COMMENT 'คำอธิบายหมวดหมู่',
  `type_order` int NOT NULL DEFAULT '9' COMMENT 'ลำดับหมวดหมู่ ยิ่งน้อยยิ่งอยู่หน้า',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='หมวดหมู่แท็ก';
INSERT INTO `wm_system_tags_type` VALUES (1,'novel','โครงเรื่อง','โครงเรื่อง',1),(2,'novel','แนวเรื่อง','แนวโครงเรื่อง',2),(3,'novel','ตัวละคร','ตัวละครหลัก',3),(4,'novel','สไตล์','สไตล์เนื้อหา',4);
DROP TABLE IF EXISTS `wm_system_templates`;
CREATE TABLE `wm_system_templates` (
  `temp_id` int NOT NULL AUTO_INCREMENT,
  `temp_module` varchar(20) DEFAULT NULL COMMENT 'โมดูลที่เทมเพลตสังกัด',
  `temp_type` varchar(40) DEFAULT NULL COMMENT 'ประเภทของเทมเพลต',
  `temp_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อเทมเพลต',
  `temp_temp4` varchar(100) NOT NULL COMMENT 'เทมเพลตเวอร์ชันคอมพิวเตอร์',
  `temp_temp3` varchar(100) NOT NULL COMMENT 'หน้าจอสัมผัส',
  `temp_temp2` varchar(100) NOT NULL COMMENT '3g',
  `temp_temp1` varchar(100) NOT NULL COMMENT 'wap',
  `temp_address` tinyint(1) DEFAULT '0' COMMENT 'พาธที่เทมเพลตอยู่ 0=ปัจจุบัน, 1=คำนวณจากไดเรกทอรีราก.',
  PRIMARY KEY (`temp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='เทมเพลตเริ่มต้นของหมวดหมู่โมดูลที่ตั้งไว้ล่วงหน้า diy และหัวข้อพิเศษ';
INSERT INTO `wm_system_templates` VALUES (1,'article','list','test','test.html','test.html','test.html','test.html',0),(2,'article','tindex','eee','eee','eee','eee','eee',0),(3,'article','content','dddd','dddd','dddd','dddd','dddd',0);
DROP TABLE IF EXISTS `wm_templates_templates`;
CREATE TABLE `wm_templates_templates` (
  `templates_id` int NOT NULL AUTO_INCREMENT,
  `templates_path` varchar(20) NOT NULL COMMENT 'โฟลเดอร์เทมเพลต',
  `templates_name` varchar(60) NOT NULL COMMENT 'ชื่อเทมเพลต',
  `templates_appid` varchar(40) NOT NULL COMMENT 'appid เทมเพลต',
  PRIMARY KEY (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเทมเพลตการติดตั้งและการใช้งาน';
DROP TABLE IF EXISTS `wm_upload`;
CREATE TABLE `wm_upload` (
  `upload_id` int NOT NULL AUTO_INCREMENT,
  `upload_module` varchar(20) NOT NULL COMMENT 'โมดูลที่สังกัด',
  `upload_type` varchar(20) DEFAULT NULL COMMENT 'ประเภทที่โมดูลดำเนินการ',
  `upload_ext` varchar(10) DEFAULT NULL COMMENT 'ประเภทไฟล์แนบ',
  `upload_mid` int NOT NULL DEFAULT '0' COMMENT 'ID ของเนื้อหาหลักที่สังกัด เช่น หัวข้อของความคิดเห็น',
  `upload_cid` int NOT NULL DEFAULT '0' COMMENT 'ID ของเนื้อหาที่สังกัด',
  `user_id` int DEFAULT '0' COMMENT 'id ของผู้ใช้อัปโหลด',
  `upload_alt` varchar(100) DEFAULT NULL COMMENT 'คำอธิบาย',
  `upload_simg` varchar(200) DEFAULT NULL COMMENT 'พาธรูปย่อ',
  `upload_img` varchar(200) DEFAULT NULL COMMENT 'พาธไฟล์',
  `upload_size` int NOT NULL DEFAULT '0' COMMENT 'ขนาดไฟล์',
  `upload_width` int DEFAULT '0' COMMENT 'ความกว้างรูปภาพ',
  `upload_height` int DEFAULT '0' COMMENT 'ความสูงรูปภาพ',
  `upload_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาอัปโหลด',
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการอัปโหลด';
DROP TABLE IF EXISTS `wm_user_apilogin`;
CREATE TABLE `wm_user_apilogin` (
  `api_id` int NOT NULL AUTO_INCREMENT,
  `api_uid` int NOT NULL DEFAULT '0',
  `api_type` varchar(30) NOT NULL COMMENT 'ประเภทการเข้าสู่ระบบของบุคคลที่สาม',
  `api_openid` varchar(120) NOT NULL COMMENT 'ID การเข้าสู่ระบบของบุคคลที่สามที่ไม่ซ้ำกัน',
  `api_unionid` varchar(120) DEFAULT NULL COMMENT 'ID เชื่อมโยงการเข้าสู่ระบบของบุคคลที่สาม',
  PRIMARY KEY (`api_id`),
  KEY `type_index` (`api_type`),
  KEY `openid_index` (`api_openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการเข้าสู่ระบบผ่านบุคคลที่สาม';
DROP TABLE IF EXISTS `wm_user_card`;
CREATE TABLE `wm_user_card` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `card_type` tinyint(1) DEFAULT '1' COMMENT 'ประเภทบัตร 1=บัตรเติมเงิน',
  `card_use` tinyint(1) DEFAULT '0' COMMENT 'ใช้งานแล้วหรือไม่',
  `card_channel` varchar(20) NOT NULL COMMENT 'ช่องทางเผยแพร่',
  `card_key` varchar(50) DEFAULT NULL COMMENT 'หมายเลขบัตร',
  `card_money` decimal(10,2) DEFAULT '0.00' COMMENT 'ยอดเงินในบัตร',
  `card_give` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'จำนวนโบนัสเมื่อใช้บัตรเติมเงิน',
  `card_addtime` int DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  `card_user_id` int NOT NULL DEFAULT '0' COMMENT 'ผู้ใช้ที่รับ',
  `card_get_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่รับ',
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเลขบัตรเติมเงิน รหัสเชิญ ฯลฯ ของผู้ใช้';
DROP TABLE IF EXISTS `wm_user_card_log`;
CREATE TABLE `wm_user_card_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_card_id` int NOT NULL COMMENT 'id หมายเลขบัตร',
  `log_user_id` int NOT NULL COMMENT 'id ที่ใช้',
  `log_use_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่ใช้',
  `log_touser_id` int NOT NULL DEFAULT '0' COMMENT 'ใช้กับใคร',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการใช้บัตร';
DROP TABLE IF EXISTS `wm_user_coll`;
CREATE TABLE `wm_user_coll` (
  `coll_id` int NOT NULL AUTO_INCREMENT,
  `coll_module` varchar(20) NOT NULL COMMENT 'โมดูลที่ดำเนินการ',
  `coll_type` varchar(20) NOT NULL COMMENT 'ประเภทการดำเนินการ, coll=รายการโปรด, rec=แนะนำ, shelf=ชั้นหนังสือ, sub=สมัครอัตโนมัติ',
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `coll_cid` int NOT NULL DEFAULT '0' COMMENT 'ID เนื้อหาที่ดำเนินการ',
  `coll_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาของการดำเนินการ',
  PRIMARY KEY (`coll_id`),
  KEY `uid` (`user_id`,`coll_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางรายการโปรด ชั้นหนังสือ การสมัครรับ ฯลฯ ของผู้ใช้';
DROP TABLE IF EXISTS `wm_user_finance`;
CREATE TABLE `wm_user_finance` (
  `finance_id` int NOT NULL AUTO_INCREMENT,
  `finance_user_id` int DEFAULT NULL COMMENT 'id ผู้ใช้',
  `finance_realname` varchar(20) DEFAULT NULL COMMENT 'ชื่อ-นามสกุลจริง',
  `finance_cardid` varchar(30) DEFAULT NULL COMMENT 'หมายเลขบัตรประชาชน',
  `finance_address` varchar(50) DEFAULT NULL COMMENT 'ที่อยู่บ้าน',
  `finance_zipcode` varchar(10) DEFAULT NULL COMMENT 'รหัสไปรษณีย์',
  `finance_bank` varchar(20) DEFAULT NULL COMMENT 'ธนาคารที่เปิดบัญชี',
  `finance_bankaddress` varchar(50) DEFAULT NULL COMMENT 'ที่อยู่ธนาคารที่เปิดบัญชี',
  `finance_bankcard` varchar(30) DEFAULT NULL COMMENT 'หมายเลขบัญชีของธนาคารที่เปิดบัญชี',
  `finance_bankmaster` varchar(20) DEFAULT NULL COMMENT 'ชื่อผู้ถือบัตร',
  `finance_alipay` varchar(50) DEFAULT NULL COMMENT 'บัญชี Alipay',
  PRIMARY KEY (`finance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางข้อมูลการเงินของผู้ใช้';
DROP TABLE IF EXISTS `wm_user_finance_log`;
CREATE TABLE `wm_user_finance_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_status` tinyint(1) DEFAULT '1' COMMENT '1=รายรับ 2=รายจ่าย',
  `log_module` varchar(20) DEFAULT NULL COMMENT 'โมดูล',
  `log_type` varchar(20) DEFAULT NULL COMMENT 'ประเภท',
  `log_user_id` int NOT NULL DEFAULT '0' COMMENT 'ID ผู้ใช้ที่ใช้จ่ายหรือรับรายได้',
  `log_tuser_id` int NOT NULL DEFAULT '0' COMMENT 'ID ผู้ใช้ที่ถูกใช้หรือผู้ที่มอบให้',
  `log_cid` varchar(35) NOT NULL DEFAULT '0' COMMENT 'id เนื้อหาที่ซื้อ หรือ id ต้นทาง',
  `log_gold1_before` decimal(10,3) DEFAULT '0.000' COMMENT 'จำนวนเหรียญ 1 ก่อนทำรายการ',
  `log_gold1` decimal(10,3) DEFAULT '0.000' COMMENT 'จำนวนเหรียญ1',
  `log_gold1_after` decimal(10,3) DEFAULT '0.000' COMMENT 'จำนวนเหรียญ 1 หลังทำรายการ',
  `log_gold2_before` decimal(10,3) DEFAULT '0.000' COMMENT 'จำนวนเหรียญ 2 ก่อนทำรายการ',
  `log_gold2` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT 'จำนวนเหรียญ2',
  `log_gold2_after` decimal(10,3) DEFAULT '0.000' COMMENT 'จำนวนเหรียญ 2 หลังทำรายการ',
  `log_remark` varchar(100) DEFAULT NULL COMMENT 'ข้อมูลหมายเหตุ',
  `log_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาของการซื้อ',
  PRIMARY KEY (`log_id`),
  KEY `status_index` (`log_status`),
  KEY `module_index` (`log_module`),
  KEY `type_index` (`log_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='บันทึกการเงินของผู้ใช้ เช่น การซื้อ การใช้ การมอบให้';
DROP TABLE IF EXISTS `wm_user_head`;
CREATE TABLE `wm_user_head` (
  `head_id` int NOT NULL AUTO_INCREMENT,
  `head_src` varchar(200) NOT NULL COMMENT 'ที่อยู่รูปโปรไฟล์',
  `head_order` int NOT NULL DEFAULT '50' COMMENT 'ลำดับรูปโปรไฟล์',
  PRIMARY KEY (`head_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางรูปประจำตัวที่ตั้งไว้ล่วงหน้า';
INSERT INTO `wm_user_head` VALUES (1,'/upload/userhead/20141201125121.jpg',20),(2,'/upload/userhead/20141201125122.jpg',20),(5,'/upload/userhead/20141201125124.jpg',20),(6,'/upload/userhead/20141201125125.jpg',20),(7,'/upload/userhead/20141201125126.jpg',20),(8,'/upload/userhead/20141201125128.jpg',20),(9,'/upload/userhead/20141201125129.png',20),(10,'/upload/userhead/20141201125131.jpg',20),(11,'/upload/userhead/20141201125133.jpg',20),(12,'/upload/userhead/20141201125134.jpg',20),(13,'/upload/userhead/20141201125410.jpg',20),(14,'/upload/userhead/20141201125412.jpg',20),(15,'/upload/userhead/20141201125414.jpg',20),(16,'/upload/userhead/20141201125416.png',20),(17,'/upload/userhead/20141201125422.jpg',20),(18,'/upload/userhead/20141201125419.jpg',20),(19,'/upload/userhead/20141201125424.jpg',20),(20,'/upload/userhead/20141201125426.jpg',20),(21,'/upload/userhead/20141201125432.jpg',20),(22,'/upload/userhead/20141201125430.jpg',20),(23,'/upload/userhead/20141201125431.png',20),(24,'/upload/userhead/20141201125428.png',20),(25,'/upload/userhead/20141201125513.png',20),(26,'/upload/userhead/20141201125512.png',20),(27,'/upload/userhead/20141201125511.png',20),(28,'/upload/userhead/20141201125510.jpg',20);
DROP TABLE IF EXISTS `wm_user_level`;
CREATE TABLE `wm_user_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_start` int NOT NULL COMMENT 'ประสบการณ์เริ่มต้นของระดับ',
  `level_end` int NOT NULL COMMENT 'ประสบการณ์สิ้นสุดของระดับ',
  `level_name` varchar(60) NOT NULL COMMENT 'ชื่อระดับ',
  `level_order` int DEFAULT NULL COMMENT 'การเรียงลำดับระดับ',
  `level_coll` int NOT NULL DEFAULT '0' COMMENT 'จำนวนรายการโปรดของระดับ',
  `level_shelf` int NOT NULL DEFAULT '0' COMMENT 'จำนวนชั้นหนังสือรวมของระดับ',
  `level_rec` int NOT NULL DEFAULT '0' COMMENT 'โควตาโหวตแนะนำที่ให้เมื่อเข้าสู่ระบบทุกวัน',
  `level_month` int NOT NULL DEFAULT '0' COMMENT 'โหวตรายเดือนที่ให้เมื่อเข้าสู่ระบบทุกวัน',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COMMENT='ระดับประสบการณ์';
INSERT INTO `wm_user_level` VALUES (23,0,100,'โต้วเจ่อ',1,5,5,0,0),(24,100,300,'โต้วถู',2,6,6,0,0),(25,300,600,'โต้วซือ',3,7,7,0,0),(26,600,1000,'โต้วหลิง',4,8,8,0,0),(27,1000,2000,'โต้วหวัง',5,9,9,0,0),(28,2000,5000,'โต้วหวง',6,10,10,0,0),(29,5000,10000,'โต้วจง',7,15,15,0,0),(30,10000,20000,'โต้วจุน',8,20,20,0,0),(31,20000,50000,'โต้วเซิ่ง',9,25,25,0,0),(32,50000,100000,'โต้วตี้',10,30,30,0,0);
DROP TABLE IF EXISTS `wm_user_login`;
CREATE TABLE `wm_user_login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `login_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เข้าสู่ระบบ',
  `login_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=บัญชี',
  `login_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=เข้าสู่ระบบล้มเหลว 1=เข้าสู่ระบบสำเร็จ 2=รหัสผ่านผิด',
  `login_remark` varchar(255) DEFAULT 'เข้าสู่ระบบสำเร็จ' COMMENT 'รายละเอียดหมายเหตุ',
  `login_ip` varchar(40) DEFAULT NULL COMMENT 'IP ที่เข้าสู่ระบบ',
  `login_ua` varchar(1000) DEFAULT NULL COMMENT 'ua ของเบราว์เซอร์ที่เข้าสู่ระบบ',
  `login_browser` varchar(250) DEFAULT NULL COMMENT 'เบราว์เซอร์',
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการเข้าสู่ระบบของผู้ใช้';
INSERT INTO `wm_user_login` VALUES (1,1,1613889751,1,2,'รหัสผ่านไม่ถูกต้อง','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36','chrome');
DROP TABLE IF EXISTS `wm_user_msg`;
CREATE TABLE `wm_user_msg` (
  `msg_id` int NOT NULL AUTO_INCREMENT,
  `msg_fuid` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้ที่ส่ง',
  `msg_tuid` int NOT NULL COMMENT 'ID ผู้ใช้ที่รับ',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=ยังไม่ได้อ่าน 1=อ่านแล้ว',
  `msg_content` varchar(1000) DEFAULT NULL COMMENT 'เนื้อหาข้อความ',
  `msg_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาส่ง',
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกข้อความของผู้ใช้';
DROP TABLE IF EXISTS `wm_user_punish`;
CREATE TABLE `wm_user_punish` (
  `punish_id` int NOT NULL AUTO_INCREMENT,
  `punish_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=ใช้ไม่ได้ 1=ปกติ',
  `punish_uid` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `punish_type` varchar(20) NOT NULL COMMENT 'login=ห้ามเข้าสู่ระบบ talk=ห้ามแสดงความคิดเห็น',
  `punish_remark` varchar(60) DEFAULT NULL COMMENT 'หมายเหตุ',
  `punish_starttime` int NOT NULL DEFAULT '0' COMMENT 'เวลาเริ่มลงโทษ',
  `punish_endtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาสิ้นสุดการลงโทษ',
  `punish_createtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาสร้างการลงโทษ',
  PRIMARY KEY (`punish_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการลงโทษผู้ใช้';
DROP TABLE IF EXISTS `wm_user_read`;
CREATE TABLE `wm_user_read` (
  `read_id` int NOT NULL AUTO_INCREMENT,
  `read_module` varchar(20) NOT NULL DEFAULT 'novel' COMMENT 'โมดูลการอ่าน',
  `read_cid` int NOT NULL DEFAULT '0' COMMENT 'id เนื้อหา',
  `read_nid` int DEFAULT '0' COMMENT 'id เนื้อหาแม่',
  `read_title` varchar(60) DEFAULT NULL COMMENT 'หัวข้อ',
  `read_uid` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `read_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาอ่านครั้งแรก',
  `read_lasttime` int NOT NULL DEFAULT '0' COMMENT 'เวลาอ่านครั้งล่าสุด',
  PRIMARY KEY (`read_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการอ่าน, เก็บเฉพาะบันทึกการอ่านล่าสุด';
DROP TABLE IF EXISTS `wm_user_read_log`;
CREATE TABLE `wm_user_read_log` (
  `read_id` int NOT NULL AUTO_INCREMENT,
  `read_module` varchar(20) NOT NULL DEFAULT 'novel' COMMENT 'โมดูลการอ่าน',
  `read_cid` int NOT NULL DEFAULT '0' COMMENT 'id เนื้อหา',
  `read_nid` int DEFAULT '0' COMMENT 'id เนื้อหาแม่',
  `read_title` varchar(60) DEFAULT NULL COMMENT 'หัวข้อ',
  `read_uid` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `read_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาอ่าน',
  PRIMARY KEY (`read_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการอ่าน, บันทึกการอ่านทั้งหมด';
DROP TABLE IF EXISTS `wm_user_sign`;
CREATE TABLE `wm_user_sign` (
  `sign_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'ผู้ใช้ที่เช็คอิน',
  `sign_sum` int NOT NULL DEFAULT '0' COMMENT 'จำนวนวันเช็คอินทั้งหมด',
  `sign_con` int NOT NULL DEFAULT '0' COMMENT 'จำนวนวันเช็คอินต่อเนื่อง',
  `sign_prerank` int NOT NULL DEFAULT '0' COMMENT 'อันดับเช็คอินครั้งล่าสุด',
  `sign_pretime` int NOT NULL DEFAULT '0' COMMENT 'เวลาเช็คอินครั้งล่าสุด',
  `sign_rank` int NOT NULL DEFAULT '0' COMMENT 'อันดับเช็คอินครั้งนี้',
  `sign_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาเช็คอินครั้งนี้',
  PRIMARY KEY (`sign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางการเช็คอินของผู้ใช้';
DROP TABLE IF EXISTS `wm_user_sign_log`;
CREATE TABLE `wm_user_sign_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_user_id` int NOT NULL COMMENT 'ผู้ใช้ที่เช็คอิน',
  `log_gold1` int NOT NULL DEFAULT '0' COMMENT 'เหรียญที่แจกให้1',
  `log_gold2` int NOT NULL DEFAULT '0' COMMENT 'เหรียญที่แจกให้2',
  `log_exp` int NOT NULL DEFAULT '0' COMMENT 'ประสบการณ์ที่แจกให้',
  `log_rec` int NOT NULL DEFAULT '0' COMMENT 'โหวตแนะนำที่แจกให้',
  `log_month` int NOT NULL DEFAULT '0' COMMENT 'โหวตรายเดือนที่แจกให้',
  `log_rank` int NOT NULL COMMENT 'อันดับการเช็คอิน',
  `log_date` date NOT NULL COMMENT 'วันที่เช็คอิน',
  `log_time` int NOT NULL COMMENT 'เวลาเช็คอิน',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการเช็คอิน';
INSERT INTO `wm_user_sign_log` VALUES (1,1,0,0,1,0,0,1,'2021-01-30',1611983872);
DROP TABLE IF EXISTS `wm_user_ticket`;
CREATE TABLE `wm_user_ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `ticket_user_id` int NOT NULL COMMENT 'id ผู้ใช้',
  `ticket_module` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'novel' COMMENT 'โมดูลที่สังกัด',
  `ticket_rec` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโหวตแนะนำของผู้ใช้',
  `ticket_month` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโหวตรายเดือนของผู้ใช้',
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางรวมประเภทโหวตของผู้ใช้';
DROP TABLE IF EXISTS `wm_user_ticket_log`;
CREATE TABLE `wm_user_ticket_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=ได้รับ 2=ใช้ไป',
  `log_module` varchar(20) DEFAULT NULL COMMENT 'โมดูล, all=ทุกโมดูล',
  `log_cid` int DEFAULT '0' COMMENT 'id เนื้อหา,',
  `log_user_id` int NOT NULL DEFAULT '0' COMMENT 'id ผู้ใช้',
  `log_rec` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโหวตแนะนำ',
  `log_month` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโหวตรายเดือน',
  `log_remark` varchar(500) DEFAULT NULL COMMENT 'แหล่งที่มา/คำอธิบายการใช้งาน',
  `log_time` int NOT NULL COMMENT 'แหล่งที่มา/เวลาที่ใช้',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='บันทึกแหล่งที่มาของโหวตรายเดือน โหวตแนะนำ ฯลฯ';
DROP TABLE IF EXISTS `wm_user_user`;
CREATE TABLE `wm_user_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(20) NOT NULL DEFAULT 'default' COMMENT 'แหล่งที่มาของการสมัครบัญชี',
  `user_name` varchar(50) NOT NULL COMMENT 'บัญชี/ID บุคคลที่สาม',
  `user_salt` varchar(50) DEFAULT '' COMMENT 'ซอล์ตรหัสผ่าน（เลิกใช้หลัง bcrypt เก็บไว้รองรับแฮชเก่า）',
  `user_psw` varchar(255) NOT NULL COMMENT 'รหัสผ่าน',
  `user_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=ปกติ 0=รอตรวจสอบ',
  `user_display` tinyint(1) DEFAULT '1' COMMENT '0=แบนถาวร 1=ปกติ 2=แบนตามกำหนดเวลา',
  `user_nickname` varchar(60) NOT NULL COMMENT 'ชื่อเล่น',
  `user_email` varchar(50) DEFAULT NULL COMMENT 'อีเมล',
  `user_emailtrue` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=ยืนยันแล้ว 0=ยังไม่ยืนยัน',
  `user_qq` varchar(15) DEFAULT NULL COMMENT 'หมายเลข QQ ของผู้ใช้',
  `user_tel` varchar(18) DEFAULT NULL COMMENT 'หมายเลขมือถือของผู้ใช้',
  `user_teltrue` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=ยืนยันแล้ว 0=ยังไม่ยืนยัน',
  `user_sex` int NOT NULL DEFAULT '1' COMMENT 'เพศ',
  `user_birthday` date NOT NULL DEFAULT '1991-10-24' COMMENT 'วันเดือนปีเกิดของผู้ใช้',
  `user_head` varchar(200) NOT NULL COMMENT 'รูปโปรไฟล์',
  `user_sign` varchar(100) NOT NULL COMMENT 'ลายเซ็น',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ยอดคงเหลือในบัญชี',
  `user_money_freeze` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ยอดคงเหลือที่ถูกอายัดในบัญชี',
  `user_gold1` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT 'เหรียญ1',
  `user_gold2` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT 'เหรียญ2',
  `user_ischarge` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'เคยเติมเงินครั้งแรกแล้วหรือไม่',
  `user_exp` int NOT NULL DEFAULT '0' COMMENT 'ประสบการณ์',
  `user_browse` int NOT NULL DEFAULT '0' COMMENT 'ยอดเข้าชมพื้นที่',
  `user_topic` int NOT NULL DEFAULT '0' COMMENT 'จำนวนหัวข้อ',
  `user_retopic` int NOT NULL DEFAULT '0' COMMENT 'จำนวนโพสต์ตอบ',
  `user_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนความคิดเห็น',
  `user_logintime` int NOT NULL DEFAULT '0' COMMENT 'เวลาเข้าสู่ระบบครั้งล่าสุด',
  `user_regtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาสมัคร',
  `user_regip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT 'IP ที่สมัคร',
  `user_displaytime` int NOT NULL DEFAULT '0' COMMENT 'หากเป็นช่วงเวลา จะเป็นช่วงเวลาที่ถูกแบน',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='ตารางผู้ใช้';
INSERT INTO `wm_user_user` VALUES (1,'default','weimeng','','280a2b0b4a054aa53596a1b7106b4060f1f91aad',1,1,'ฉันนี่มันโง่จริงๆ','1747699213@qq.com',1,'1747699213','15123931801',0,1,'1991-10-24','/upload/userhead/20141201125513.png','สิ่งที่คุณต้องการอาจไม่มาถึง แต่อนาคตจะมาถึงแน่นอน!',0.00,0.00,17.000,1.130,1,539,122,10,3,33,1613889715,1452754424,'0.0.0.0',1038770);
DROP TABLE IF EXISTS `wm_user_vist`;
CREATE TABLE `wm_user_vist` (
  `vist_id` int NOT NULL AUTO_INCREMENT,
  `vist_fuid` int NOT NULL DEFAULT '0' COMMENT 'id ผู้เยี่ยมชม',
  `vist_uid` int NOT NULL DEFAULT '0' COMMENT 'id เจ้าของ',
  `vist_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เข้าชม',
  PRIMARY KEY (`vist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกการเยี่ยมชมของผู้ใช้';
DROP TABLE IF EXISTS `wm_weixin_account`;
CREATE TABLE `wm_weixin_account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ค่าบูลีน, ใช้งานหรือไม่',
  `account_name` varchar(60) NOT NULL COMMENT 'ชื่อบัญชีทางการ',
  `account_account` varchar(50) NOT NULL COMMENT 'บัญชีเข้าสู่ระบบของบัญชีทางการ',
  `account_gid` varchar(32) NOT NULL COMMENT 'id ตั้งต้นของบัญชีทางการ',
  `account_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=บัญชีสมัครสมาชิก 2=บัญชีบริการ',
  `account_auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ค่าบูลีน, ยืนยันตัวตนหรือไม่',
  `account_appid` varchar(50) NOT NULL COMMENT 'appid ของบัญชีทางการ',
  `account_secret` varchar(100) NOT NULL COMMENT 'secret ของบัญชีทางการ',
  `account_access` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'เชื่อมต่อแล้วหรือไม่',
  `account_main` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'เป็นบัญชีทางการหลักหรือไม่',
  `account_follow` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ต้องติดตามก่อนเข้าชมหรือไม่',
  `account_token` varchar(100) NOT NULL COMMENT 'token ของบัญชีทางการ',
  `account_aeskey` varchar(100) NOT NULL COMMENT 'key เข้ารหัสข้อความของบัญชีทางการ',
  `account_welcome` varchar(200) DEFAULT NULL COMMENT 'ข้อความต้อนรับเมื่อติดตามบัญชีทางการ',
  `account_welcome_temp` varchar(500) DEFAULT NULL COMMENT 'เทมเพลตข้อความต้อนรับเมื่อติดตามบัญชีทางการ',
  `account_default` varchar(200) DEFAULT NULL COMMENT 'คำตอบเมื่อไม่พบข้อความที่ตรงกัน',
  `account_default_temp` varchar(500) DEFAULT NULL COMMENT 'เทมเพลตคำตอบเมื่อไม่พบข้อความที่ตรงกัน',
  `account_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='รายการบัญชีทางการ WeChat';
DROP TABLE IF EXISTS `wm_weixin_autoreply`;
CREATE TABLE `wm_weixin_autoreply` (
  `autoreply_id` int NOT NULL AUTO_INCREMENT,
  `autoreply_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'สถานะการใช้งาน เป็นค่าบูลีน',
  `autoreply_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=ไม่ตั้งค่า 1=ตอบกลับผู้ติดตาม 2=ตอบกลับอัตโนมัติ',
  `autoreply_account_id` int NOT NULL DEFAULT '0' COMMENT 'บัญชีทางการที่ใช้',
  `autoreply_name` varchar(60) NOT NULL COMMENT 'ชื่อการตอบกลับอัตโนมัติ',
  `autoreply_key` varchar(50) NOT NULL COMMENT 'คำค้นที่การตอบกลับอัตโนมัติรับไว้',
  `autoreply_match` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=ตรงทั้งหมด 2=ค้นหาคลุมเครือทั้งข้อความ 3=ตรงต้นข้อความ 4=ตรงท้ายข้อความ',
  `autoreply_content` varchar(500) NOT NULL COMMENT 'เนื้อหาตอบกลับ',
  `autoreply_temp` text NOT NULL COMMENT 'เทมเพลตเนื้อหาตอบกลับ',
  `autoreply_type` varchar(20) NOT NULL DEFAULT 'text' COMMENT 'text=ข้อความ image=รูปภาพ',
  `autoreply_media_id` varchar(100) DEFAULT NULL COMMENT 'id ของสื่อ',
  `autoreply_addtime` int NOT NULL COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`autoreply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางตอบกลับอัตโนมัติของบัญชีทางการ WeChat';
DROP TABLE IF EXISTS `wm_weixin_fans`;
CREATE TABLE `wm_weixin_fans` (
  `fans_id` int NOT NULL AUTO_INCREMENT,
  `fans_account_id` int NOT NULL COMMENT 'บัญชีทางการที่สังกัด',
  `fans_openid` varchar(100) NOT NULL COMMENT 'ตัวระบุของผู้ใช้ ซึ่งไม่ซ้ำกันภายในบัญชีทางการปัจจุบัน',
  `fans_unionid` varchar(100) DEFAULT NULL COMMENT 'ฟิลด์นี้มีเฉพาะเมื่อผูกบัญชีทางการกับบัญชี WeChat Open Platform แล้ว',
  `fans_subscribe` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'สถานะการติดตามบัญชีทางการของผู้ใช้ ค่า 0 หมายถึงผู้ใช้ยังไม่ได้ติดตามบัญชีทางการนี้ จึงดึงข้อมูลอื่นไม่ได้',
  `fans_nickname` varchar(60) NOT NULL COMMENT 'ชื่อเล่นของผู้ใช้',
  `fans_headimgurl` varchar(255) NOT NULL COMMENT 'รูปโปรไฟล์ของผู้ใช้',
  `fans_sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'เพศของผู้ใช้ ค่า 1 คือชาย ค่า 2 คือหญิง ค่า 0 คือไม่ทราบ',
  `fans_country` varchar(20) NOT NULL COMMENT '	ประเทศของผู้ใช้',
  `fans_province` varchar(10) NOT NULL COMMENT 'จังหวัดของผู้ใช้',
  `fans_city` varchar(30) NOT NULL COMMENT 'เมืองของผู้ใช้',
  `fans_remark` varchar(200) DEFAULT NULL COMMENT 'หมายเหตุแฟนที่ผู้ดูแลบัญชีทางการตั้งไว้ในหน้าจัดการผู้ใช้ WeChat',
  `fans_subscribe_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่ผู้ใช้กดติดตาม เป็น timestamp หากผู้ใช้ติดตามหลายครั้ง ให้ใช้เวลาติดตามครั้งล่าสุด',
  `fans_unsubtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่ผู้ใช้เลิกติดตาม',
  `fans_json` varchar(500) NOT NULL COMMENT 'ข้อมูลผู้ใช้แบบ json',
  `fans_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาบันทึกข้อมูลเข้าฐานข้อมูล',
  PRIMARY KEY (`fans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางข้อมูลแฟนคลับ WeChat';
DROP TABLE IF EXISTS `wm_weixin_media`;
CREATE TABLE `wm_weixin_media` (
  `media_id` int NOT NULL AUTO_INCREMENT,
  `media_account_id` int NOT NULL DEFAULT '0' COMMENT 'id ของบัญชีทางการ',
  `media_filename` varchar(255) NOT NULL COMMENT 'ชื่อสื่อ',
  `media_filepath` varchar(500) NOT NULL COMMENT 'พาธสื่อ',
  `media_media_id` varchar(255) NOT NULL COMMENT 'ID สื่อของ WeChat',
  `media_width` int NOT NULL DEFAULT '0' COMMENT 'ความกว้างสื่อ',
  `media_height` int NOT NULL DEFAULT '0' COMMENT 'ความสูงสื่อ',
  `media_type` varchar(20) NOT NULL DEFAULT 'image' COMMENT 'ประเภทสื่อ รูปภาพ image, เสียง voice, วิดีโอ video และรูปย่อ thumb',
  `media_islong` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'เป็นสื่อถาวรหรือไม่, ค่าบูลีน',
  `media_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาอัปโหลด',
  PRIMARY KEY (`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางสื่อของ WeChat';
DROP TABLE IF EXISTS `wm_weixin_menu`;
CREATE TABLE `wm_weixin_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ค่าบูลีน, สถานะการใช้งาน',
  `menu_account_id` int NOT NULL COMMENT 'ID บัญชีทางการที่สังกัด',
  `menu_name` varchar(60) NOT NULL COMMENT 'ชื่อหมายเหตุของเมนู',
  `menu_data` text NOT NULL COMMENT 'ข้อมูล json ของเมนู',
  `menu_addtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  `menu_updatetime` int NOT NULL DEFAULT '0' COMMENT 'เวลาอัปเดตล่าสุด',
  `menu_pushtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาส่งล่าสุด',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางเมนูกำหนดเองของบัญชีทางการ WeChat';
DROP TABLE IF EXISTS `wm_weixin_msg`;
CREATE TABLE `wm_weixin_msg` (
  `msg_id` int NOT NULL AUTO_INCREMENT,
  `msg_account_id` int NOT NULL DEFAULT '0' COMMENT 'ID ของบัญชีทางการที่สังกัด',
  `msg_from` varchar(100) NOT NULL COMMENT 'openid ผู้ใช้ WeChat',
  `msg_type` varchar(20) NOT NULL DEFAULT 'text' COMMENT 'ประเภทข้อความ',
  `msg_content` varchar(2000) DEFAULT NULL COMMENT 'เนื้อหาข้อความ',
  `msg_attr` varchar(500) DEFAULT NULL COMMENT 'เนื้อหาข้อความเพิ่มเติม',
  `msg_picurl` varchar(255) DEFAULT NULL COMMENT 'ที่อยู่รูปภาพของข้อความรูปภาพ',
  `msg_url` varchar(255) DEFAULT NULL COMMENT 'url ของข้อความไฮเปอร์ลิงก์',
  `msg_media_id` varchar(255) DEFAULT NULL COMMENT 'ID สื่อทรัพยากรชั่วคราวของ WeChat',
  `msg_recognition` varchar(255) DEFAULT NULL COMMENT 'ผลลัพธ์การรู้จำข้อความเสียง',
  `msg_get` varchar(2000) NOT NULL COMMENT 'เนื้อหาข้อความจากผู้ใช้ที่เว็บไซต์ได้รับ',
  `msg_send` varchar(2000) NOT NULL COMMENT 'เนื้อหาข้อความตอบกลับของเว็บไซต์',
  `msg_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่ผู้ใช้ส่งข้อความ',
  `msg_sendtime` int NOT NULL DEFAULT '0' COMMENT 'เวลาตอบกลับข้อความของเว็บไซต์',
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางบันทึกข้อความสนทนาของ WeChat';
DROP TABLE IF EXISTS `wm_zt_node`;
CREATE TABLE `wm_zt_node` (
  `node_id` int NOT NULL AUTO_INCREMENT,
  `node_zt_id` int NOT NULL DEFAULT '0' COMMENT 'ID ของหัวข้อพิเศษที่สังกัด',
  `node_name` varchar(60) DEFAULT NULL COMMENT 'ชื่อโหนด',
  `node_pinyin` varchar(20) NOT NULL COMMENT 'ตัวระบุหัวข้อพิเศษ',
  `node_type` tinyint(1) DEFAULT '2' COMMENT '1=รูปภาพ 2=แสดงเนื้อหาปกติ 3=แท็กวนซ้ำ',
  `node_img` varchar(200) DEFAULT NULL COMMENT 'ที่อยู่รูปภาพ',
  `node_content` text COMMENT 'เนื้อหา',
  `node_label` varchar(1000) DEFAULT NULL COMMENT 'แท็กโหนด',
  `node_time` int DEFAULT NULL COMMENT 'เวลาสร้างโหนด',
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางโหนดหัวข้อพิเศษ';
DROP TABLE IF EXISTS `wm_zt_type`;
CREATE TABLE `wm_zt_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_topid` int NOT NULL DEFAULT '0' COMMENT 'id ระดับเหนือขึ้นไป',
  `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่ย่อย',
  `type_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'แนะนำหมวดหมู่หรือไม่',
  `type_name` varchar(60) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type_cname` varchar(60) DEFAULT NULL COMMENT 'ชื่อย่อของประเภท',
  `type_pinyin` varchar(50) DEFAULT NULL COMMENT 'พินอินของประเภท',
  `type_order` int NOT NULL COMMENT 'เรียงลำดับ',
  `type_ico` varchar(200) DEFAULT NULL COMMENT 'ไอคอนหมวดหมู่',
  `type_info` varchar(100) DEFAULT NULL COMMENT 'ข้อมูลหมวดหมู่',
  `type_tempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าหมวดหมู่',
  `type_ctempid` int NOT NULL DEFAULT '0' COMMENT 'เทมเพลตหน้าเนื้อหา',
  `type_title` varchar(80) DEFAULT NULL COMMENT 'หัวข้อหน้าเพจ',
  `type_key` varchar(100) DEFAULT NULL COMMENT 'คำค้นของหน้าเพจ',
  `type_desc` varchar(120) DEFAULT NULL COMMENT 'คำอธิบายหน้าเพจ',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหมวดหมู่หัวข้อพิเศษ';
DROP TABLE IF EXISTS `wm_zt_zt`;
CREATE TABLE `wm_zt_zt` (
  `zt_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL DEFAULT '0' COMMENT 'id หมวดหมู่หัวข้อพิเศษ',
  `zt_status` tinyint(1) DEFAULT '1' COMMENT 'สถานะการตรวจสอบ',
  `zt_name` varchar(60) NOT NULL COMMENT 'ชื่อหัวข้อพิเศษ',
  `zt_pinyin` varchar(20) DEFAULT NULL COMMENT 'พินอินหัวข้อพิเศษ',
  `zt_info` varchar(200) DEFAULT NULL COMMENT 'บทนำ',
  `zt_banner` varchar(200) DEFAULT NULL COMMENT 'แบนเนอร์หัวข้อพิเศษ',
  `zt_simg` varchar(200) DEFAULT NULL COMMENT 'รูปภาพหัวข้อพิเศษ',
  `zt_read` int DEFAULT '0' COMMENT 'ยอดอ่าน',
  `zt_replay` int NOT NULL DEFAULT '0' COMMENT 'จำนวนความคิดเห็น',
  `zt_content` varchar(2000) NOT NULL COMMENT 'เนื้อหา',
  `zt_time` int NOT NULL DEFAULT '0' COMMENT 'เวลาที่เพิ่ม',
  PRIMARY KEY (`zt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='ตารางหัวข้อพิเศษ';
