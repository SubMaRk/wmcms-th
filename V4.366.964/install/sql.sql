DROP TABLE IF EXISTS `wm_about_about`;

CREATE TABLE `wm_about_about` (`about_id` int(11) NOT NULL AUTO_INCREMENT,
 `type_id` int(11) NOT NULL DEFAULT '1' COMMENT '信息分类id',
 `about_name` varchar(50) NOT NULL COMMENT '文章标题',
 `about_pinyin` varchar(50) DEFAULT NULL COMMENT '信息拼音',
 `about_content` text COMMENT '内容',
 `about_order` int(1) DEFAULT '0' COMMENT '信息的排序',
 `about_title` varchar(120) DEFAULT NULL COMMENT '信息内容标题',
 `about_key` varchar(120) DEFAULT NULL COMMENT '信息内容关键字',
 `about_desc` varchar(120) DEFAULT NULL COMMENT '信息内容描述',
 `about_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间年月日时分秒',
 `about_ctempid` int(4) DEFAULT '0' COMMENT '使用的模版',
 PRIMARY KEY (`about_id`), KEY `tid_index` (`type_id`, `about_time`),
 KEY `ctempid_index` (`about_ctempid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='信息内容表';

/*Data for the table `wm_about_about` */ /*Table structure for table `wm_about_type` */
DROP TABLE IF EXISTS `wm_about_type`;

CREATE TABLE `wm_about_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_topid` int(4) DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(50) DEFAULT NULL COMMENT '父级id',
 `type_name` varchar(20) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_cname` varchar(10) DEFAULT NULL COMMENT '类型简称',
 `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
 `type_order` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
 `type_info` varchar(200) DEFAULT NULL COMMENT '分类描述',
 `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类列表页模版id',
 `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类内容页模版id',
 `type_title` varchar(120) DEFAULT NULL COMMENT '分类页标题',
 `type_key` varchar(120) DEFAULT NULL COMMENT '分类页关键字',
 `type_desc` varchar(120) DEFAULT NULL COMMENT '分类页描述',
 PRIMARY KEY (`type_id`), KEY `topid_index` (`type_topid`),
 KEY `pid_index` (`type_pid`),
 KEY `order_index` (`type_order`),
 KEY `tempid_index` (`type_tempid`),
 KEY `ctempid_index` (`type_ctempid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='信息分类表';

/*Data for the table `wm_about_type` */ /*Table structure for table `wm_ad_ad` */
DROP TABLE IF EXISTS `wm_ad_ad`;

CREATE TABLE `wm_ad_ad` (`ad_id` int(4) NOT NULL AUTO_INCREMENT,
 `ad_type_id` int(4) DEFAULT '0' COMMENT '广告分类id',
 `ad_pt` tinyint(1) DEFAULT '4' COMMENT '广告属于哪个平台，1为简版，2为彩版，3为触屏，4为电脑',
 `ad_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0为不显示，1为正常',
 `ad_type` int(1) NOT NULL DEFAULT '1' COMMENT '1为文字,2为图文,3为js',
 `ad_name` varchar(20) DEFAULT NULL COMMENT '广告位的名字',
 `ad_title` varchar(100) DEFAULT NULL COMMENT '广告的标题',
 `ad_url` varchar(200) DEFAULT NULL COMMENT '广告的连接',
 `ad_img` varchar(250) DEFAULT NULL COMMENT '图片广告的地址',
 `ad_img_width` int(1) DEFAULT '0' COMMENT '图片的宽度',
 `ad_img_height` int(1) DEFAULT '0' COMMENT '图片的高度',
 `ad_price` decimal(4, 2) DEFAULT '0.00' COMMENT '广告的单价',
 `ad_js` varchar(2000) DEFAULT NULL COMMENT 'js广告代码',
 `ad_time_type` tinyint(4) DEFAULT NULL COMMENT '0为不限制时间，1为限时投放',
 `ad_start_time` int(11) DEFAULT '0' COMMENT '广告开始时间',
 `ad_end_time` int(11) DEFAULT '0' COMMENT '广告结束时间',
 `ad_time` int(4) NOT NULL DEFAULT '0' COMMENT '广告添加的时间',
 PRIMARY KEY (`ad_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='广告表';

/*Data for the table `wm_ad_ad` */ /*Table structure for table `wm_ad_type` */
DROP TABLE IF EXISTS `wm_ad_type`;

CREATE TABLE `wm_ad_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_name` varchar(20) NOT NULL COMMENT '广告分类名字',
 `type_info` varchar(1000) DEFAULT NULL COMMENT '广告分类描述',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='广告分类表';

/*Data for the table `wm_ad_type` */ /*Table structure for table `wm_api_api` */
DROP TABLE IF EXISTS `wm_api_api`;

CREATE TABLE `wm_api_api` (`api_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_id` int(4) NOT NULL COMMENT '接口类型',
 `api_open` tinyint(1) DEFAULT '1' COMMENT '接口是否开启，1为开启，0为关闭',
 `api_title` varchar(50) NOT NULL COMMENT '接口名称 /* SubMaRk */',
 `api_ctitle` varchar(10) DEFAULT NULL COMMENT '接口简称',
 `api_name` varchar(40) NOT NULL COMMENT '接口标识 /* SubMaRk */',
 `api_appid` varchar(120) DEFAULT NULL COMMENT '开发者id',
 `api_apikey` varchar(5000) DEFAULT NULL COMMENT 'apikey',
 `api_secretkey` varchar(5000) DEFAULT NULL COMMENT 'skey',
 `api_base` varchar(500) DEFAULT NULL COMMENT '基本接口配置参数',
 `api_info` varchar(200) DEFAULT NULL COMMENT '接口描述',
 `api_order` int(4) DEFAULT NULL COMMENT '接口排序',
 `api_option` varchar(500) DEFAULT NULL COMMENT '接口的其他参数',
 PRIMARY KEY (`api_id`), UNIQUE KEY `cname` (`api_name`)) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT
CHARSET=utf8 COMMENT='全站API接口系统表';

/*Data for the table `wm_api_api` */
INSERT INTO `wm_api_api`(`api_id`, `type_id`, `api_open`, `api_title`, `api_ctitle`, `api_name`, `api_appid`, `api_apikey`, `api_secretkey`, `api_base`, `api_info`, `api_order`, `api_option`) VALUES (1,1,1,'ทั่วไป',NULL,'system','0000','0000','0000','a:3:{s:9:\"api_appid\";a:2:{s:4:\"mast\";i:1;s:6:\"remark\";s:20:\"โปรดกรอก AppID\";}s:10:\"api_apikey\";a:2:{s:4:\"mast\";i:1;s:6:\"remark\";s:21:\"โปรดกรอก API Key\";}s:13:\"api_secretkey\";a:2:{s:4:\"mast\";i:1;s:6:\"remark\";s:24:\"โปรดกรอก SecretKey\";}}','<span style=\"color:red\">ส่วนติดต่อการทำงานร่วมกัน หากคุณไม่ได้กรอกข้อมูล ฟังก์ชั่นบางส่วนอาจไม่ทำงาน โปรดอย่าทำการเปลี่ยนแปลง!</span>',1,''), (2,2,1,'เข้าสู่ระบบด้วย QQ',NULL,'qqlogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:6:\"APP ID\";s:6:\"remark\";s:27:\"โปรดกรอก APP ID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"APP Key\";s:6:\"remark\";s:28:\"โปรดกรอก APP Key\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','ส่วนติดต่อการเข้าสู่ระบบด้วย QQ คุณจำเป็นต้องลงทะเบียนที่แพลตฟอร์ม Tencent ก่อน ที่อยู่สำหรับการตอบกลับ ：[โดเมน]+/wmcms/notify/apilogin.php',1,''), (3,3,1,'ชำระเงินผ่าน Alipay บนพีซี','Alipay','alipay','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:8:\"ไอดีแอปฯ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"คีย์ลับ\";s:6:\"remark\";s:15:\"คีย์ลับ\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"คีย์สาธารณะ\";s:6:\"remark\";s:15:\"คีย์สาธารณะ\";}}','ส่วนติดต่อการชำระเงินออนไลน์ผ่าน Alipay คุณจำเป็นต้องลงทะเบียนที่แพลตฟอร์ม Alipay ก่อน',1,''), (4,2,0,'เข้าสู่ระบบด้วย Baidu',NULL,'bdlogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:2:\"ID\";s:6:\"remark\";s:23:\"โปรดกรอก AppID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"API Key\";s:6:\"remark\";s:28:\"โปรดกรอก API Key\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:10:\"Secret Key\";s:6:\"remark\";s:31:\"โปรดกรอก Secret Key\";}}','ส่วนติดต่อการเข้าสู่ระบบด้วย Baidu คุณจำเป็นต้องลงทะเบียนที่แพลตฟอร์ม Baidu ก่อน ที่อยู่สำหรับการตอบกลับ ：[โดเมน]+/wmcms/notify/apilogin.php',3,''), (5,2,0,'เข้าสู่ระบบด้วย Sina',NULL,'weibologin','','','','a:3:{s:9:\"api_appid\";a:1:{s:4:\"mast\";i:0;}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"App Key\";s:6:\"remark\";s:28:\"โปรดกรอก App Key\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:10:\"App Secret\";s:6:\"remark\";s:31:\"โปรดกรอก App Secret\";}}','ในการเข้าสู่ระบบด้วยบัญชี Sina คุณจำเป็นต้องลงทะเบียนที่แพลตฟอร์ม Sina ก่อน',2,''), (6,3,1,'สแกนจ่ายด้วย WeChat','WeChat','wxpay','','','123','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:20:\"โปรดกรอก APPID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"API Key\";s:6:\"remark\";s:24:\"โปรดกรอก API Key\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','ส่วนติดต่อการสแกนจ่ายด้วย WeChat คุณจำเป็นต้องลงทะเบียนเป็นธุรกิจที่แพลตฟอร์ม WeChat ก่อน',3,'a:1:{#123}s:5:{#34}mchid{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:9:{#34}ไอดีธุรกิจ{#34};s:5:{#34}ค่า{#34};s:1:{#34}0{#34};s:4:{#34}ข้อมูล{#34};s:17:{#34}ไอดี WeChat ธุรกิจ{#34};{#125}{#125}'), (7,4,0,'Alibaba Cloud OSS',NULL,'oss','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:11:\"AccessKeyId\";s:6:\"remark\";s:26:\"AccessKey ID\";}s:10:\"api_apikey\";a:1:{s:4:\"mast\";i:0;}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"AccessKeySecret\";s:6:\"remark\";s:30:\"AccessKeySecret ที่ได้รับจาก OOS\";}}','Alibaba Cloud OSS',1,'a:2:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:9:{#34}ชื่อ Bucket{#34};s:5:{#34}ค่า{#34};s:0:{#34}{#34};s:4:{#34}ข้อมูล{#34};s:0:{#34}{#34};{#125}s:5:{#34}point{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:12:{#34}ที่ตั้ง{#34};s:5:{#34}ค่า{#34};s:0:{#34}{#34};s:4:{#34}ข้อมูล{#34};s:81:{#34}ตั้งค่าตามที่ตั้งเซิร์ฟเวอร์ของคุณ ค่าพื้นฐานคือ http://oss-cn-shenzhen.aliyuncs.com{#34};{#125}{#125}'), (8,4,0,'Tencent Cloud COS',NULL,'cos','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:6:\"APP_ID\";s:6:\"remark\";s:21:\"APP ID ที่ได้รับจาก COS\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:7:\"API_KEY\";s:6:\"remark\";s:22:\"API Key ที่ได้จาก COS\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:6:\"SC_KEY\";s:6:\"remark\";s:21:\"SC KEY ที่ได้จาก COS\";}}','Tencent Cloud Storage',2,'a:2:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:9:{#34}ชื่อ Bucket{#34};s:5:{#34}ค่า{#34};s:0:{#34}{#34};s:4:{#34}ข้อมูล{#34};s:0:{#34}{#34};{#125}s:5:{#34}point{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:12:{#34}ที่ตั้ง{#34};s:5:{#34}ค่า{#34};s:0:{#34}{#34};s:4:{#34}ข้อมูล{#34};s:35:{#34}จีนตอนใต้ -{#gt}gz；จีนตอนกลาง-{#gt}sh;จีนตอนเหนือ-{#gt}tj{#34};{#125}{#125}'), (9,4,0,'Qiniu Cloud',NULL,'qiniu','','','','a:3:{s:9:\"api_appid\";a:1:{s:4:\"mast\";i:0;}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"accessKey\";s:6:\"remark\";s:42:\"accessKey ที่ได้รับจาก Qiniu Cloud\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"secretKey\";s:6:\"remark\";s:42:\"secretKey ที่ได้รับจาก Qiniu Cloud\";}}','Qiniu Cloud Storage',3,'a:2:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:9:{#34}ชื่อ Bucket{#34};s:5:{#34}ค่า{#34};s:0:{#34}{#34};s:4:{#34}ข้อมูล{#34};s:0:{#34}{#34};{#125}s:6:{#34}โดเมน{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:12:{#34}โดเมนที่เข้าถึง{#34};s:5:{#34}ค่า{#34};s:0:{#34}{#34};s:4:{#34}ข้อมูล{#34};s:70:{#34}เข้าสู่ระบบพื้นหลังของ Qiniu Cloud เพื่อดูชื่อโดเมนในการเข้าถึง จำเป็นต้องมี http:// !{#34};{#125}{#125}'), (10,4,0,'Sina Cloud',NULL,'scs','','','','a:3:{s:9:\"api_appid\";a:1:{s:4:\"mast\";i:0;}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"AccessKey\";s:6:\"remark\";s:42:\"AccessKey ที่ได้รับจาก Sina Cloud\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"SecretKey\";s:6:\"remark\";s:42:\"SecretKey ที่ได้รับจาก Sina Cloud\";}}','Sina Cloud storage',4,'a:1:{#123}s:6:{#34}bucket{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:9:{#34}ชื่อ Bucket{#34};s:5:{#34}ค่า{#34};s:0:{#34}{#34};s:4:{#34}ข้อมูล{#34};s:0:{#34}{#34};{#125}{#125}'), (11,5,0,'Baidu ตัวส่งลิ้งก์',NULL,'bdurl','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:6:\"ชื่อโดเมน\";s:6:\"remark\";s:40:\"โปรดกรอกชื่อโดเมน ไม่ต้องมี http://\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"token\";s:6:\"remark\";s:20:\"โปรดกรอกโทเค็นของคุณ\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','ใช้ส่งลิ้งก์สำหรับเว็บ กรอกชื่อโดเมนใน Appid โดยไม่ต้องมี http:// APIKey กรอกใส่ในโทเค็น',1,NULL), (12,2,0,'เข้าสู่ระบบด้วย Alipay',NULL,'alipaylogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:3:\"PID\";s:6:\"remark\";s:17:\"ไอดี\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:3:\"KEY\";s:6:\"remark\";s:15:\"โค้ดตรวจสอบความปลอดภัย\";}s:13:\"api_secretkey\";a:1:{s:4:\"mast\";i:0;}}','เข้าสู่ระบบด้วย Alipay คุณจำเป็นต้องลงทะเบียนที่แพลตฟอร์ม Alipay ก่อน',4,''), (13,2,0,'สแกนเข้าสู่ระบบด้วย WeChat',NULL,'wxlogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:23:\"โปรดกรอกแอปฯ ไอดี\";}s:10:\"api_apikey\";a:1:{s:4:\"mast\";i:0;}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"Appsecret\";s:6:\"remark\";s:30:\"โปรดกรอก Appsecret\";}}','เข้าสู่ระบบด้วย WeChat คุณจำเป็นต้องจ่าย 300 หยวน เพื่อตรวจสอบคุณสมบัติของคุณ',5,''), (14,6,1,'Alipay ชำระบน WAP','Alipay WAP','alipay_wap','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:8:\"ไอดีแอปฯ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"Alipay Secret Key\";s:6:\"remark\";s:15:\"Alipay Secret Key\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:15:\"Alipay Public Key\";s:6:\"remark\";s:15:\"Alipay Public Key\";}}','การชำระเงินผ่าน WAP ด้วย A;ipay คุณสามารถใช้การกำหนดคีาเดียวกันกับแบบพีซีได้ หรือสามารถใช้บัญชีบัญชีแยกกันได้',2,NULL), (15,6,1,'จ่ายด้วยบัญชี WeChat ทางการ','WeChat','wxpay_jsapi','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:5:\"APPID\";s:6:\"remark\";s:20:\"โปรดกรอก APPID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"API Key\";s:6:\"remark\";s:24:\"โปรดกรอก API Key\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";i:1;s:4:\"name\";s:9:\"Appsecret\";s:6:\"remark\";s:24:\"โปรดกรอก Secret Key\";}}','ชำระเงินในบัญชี WeChat ทางการจะรองรับการชำระเงินบนเบราว์เซอร์ WeChat เท่านั้น สามารถกำหนดค่ากับการชำระเงินผ่านคิวอาร์โค้ดได้',4,'a:1:{#123}s:5:{#34}mchid{#34};a:3:{#123}s:5:{#34}ชื่อ{#34};s:9:{#34}ไอดีธุรกิจ{#34};s:5:{#34}ค่า{#34};s:1:{#34}0{#34};s:4:{#34}ข้อมูล{#34};s:17:{#34}ไอดี WeChat ธุรกิจ{#34};{#125}{#125}'), (16,2,1,'เข้าสู่ระบบด้วยมินิแอปฯ WeChat','WeChat','wxapplogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:5:\"AppID\";s:6:\"remark\";s:11:\"ไอดีมินิแอปฯ\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:0:\"\";s:6:\"remark\";s:0:\"\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:9:\"AppSecret\";s:6:\"remark\";s:15:\"Secret Key\";}}','การตั้งค่าส่วนติดต่อมินิแอปฯ WeChat',6,''), (17,2,0,'เข้าสู่ระบบด้วยบัญชี WeChat ทางการ','WeChat','wxmplogin','','','','a:3:{s:9:\"api_appid\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:9:\"api_appid\";s:6:\"remark\";s:5:\"appID\";}s:10:\"api_apikey\";a:3:{s:4:\"mast\";s:1:\"0\";s:4:\"name\";s:10:\"api_apikey\";s:6:\"remark\";s:12:\"API Key\";}s:13:\"api_secretkey\";a:3:{s:4:\"mast\";s:1:\"1\";s:4:\"name\";s:13:\"api_secretkey\";s:6:\"remark\";s:9:\"appsecret\";}}','ในการเข้าสู่ระบบบัญชี WeChat ทางการ (บัญชีบริการ) คุณจำเป็นต้องจ่าย 300 หยวน เพื่อตรวจสอบคุณสมบัติของคุณ',7,'');

/*Table structure for table `wm_api_type` */
DROP TABLE IF EXISTS `wm_api_type`;

CREATE TABLE `wm_api_type` (`type_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
 `type_title` varchar(30) DEFAULT NULL COMMENT '接口类型名字 /* SubMaRk */',
 `type_name` varchar(20) DEFAULT NULL COMMENT '接口类型标识',
 `type_order` int(4) DEFAULT NULL COMMENT '排序',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT
CHARSET=utf8 COMMENT='api接口类型表';

/*Data for the table `wm_api_type` */
INSERT INTO `wm_api_type`(`type_id`, `type_title`, `type_name`, `type_order`) VALUES (1,'ส่วนติดต่อเว็บไซต์','system',1), (2,'ส่วนติดต่อการเข้าศู่ระบบ','login',2), (3,'ส่วนติดต่อการชำระเงินผ่าน PC','pay',3), (4,'ส่วนติดต่อที่เก็บข้อมูล','oss',4), (5,'ส่วนติดต่อ SEO','seo',5), (6,'ส่วนติดต่อการชำระเงินผ่านมือถือ','pay_wap',3);

/*Table structure for table `wm_app_app` */
DROP TABLE IF EXISTS `wm_app_app`;

CREATE TABLE `wm_app_app` (`app_id` int(11) NOT NULL AUTO_INCREMENT,
 `type_id` int(4) NOT NULL DEFAULT '1' COMMENT '应用分类id',
 `app_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否审核',
 `app_rec` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
 `app_ico` varchar(120) DEFAULT NULL COMMENT '应用图标',
 `app_simg` varchar(120) DEFAULT NULL COMMENT '引用缩略图',
 `app_pinyin` varchar(50) DEFAULT NULL COMMENT '应用拼音',
 `app_name` varchar(50) NOT NULL COMMENT '应用标题',
 `app_cname` varchar(50) DEFAULT NULL COMMENT '应用简称',
 `app_lid` varchar(100) DEFAULT '0' COMMENT '语言id',
 `app_lid_text` varchar(200) DEFAULT NULL COMMENT '语言文字',
 `app_cid` varchar(100) DEFAULT '0' COMMENT '费用id',
 `app_cid_text` varchar(200) DEFAULT NULL COMMENT '费用文字',
 `app_tocn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为不是，1为是汉化应用',
 `app_ver` varchar(20) NOT NULL DEFAULT '0' COMMENT '版本',
 `app_size` varchar(20) NOT NULL DEFAULT '0' COMMENT '大小',
 `app_tags` varchar(50) DEFAULT NULL COMMENT '应用标签',
 `app_aid` int(4) DEFAULT '0' COMMENT '开发商',
 `app_oid` int(4) DEFAULT '0' COMMENT '运营公司',
 `app_info` varchar(100) DEFAULT NULL COMMENT '点评，预览',
 `app_content` varchar(10000) DEFAULT NULL COMMENT '简介',
 `app_read` int(4) NOT NULL DEFAULT '0' COMMENT '应用浏览量',
 `app_replay` int(4) NOT NULL DEFAULT '0' COMMENT '应用评论量',
 `app_ding` int(4) NOT NULL DEFAULT '0' COMMENT '应用顶',
 `app_cai` int(4) NOT NULL DEFAULT '0' COMMENT '应用踩',
 `app_start` decimal(2, 1) NOT NULL DEFAULT '0.0' COMMENT '星级',
 `app_score` decimal(2, 1) NOT NULL DEFAULT '0.0' COMMENT '应用评分',
 `app_paid` varchar(100) NOT NULL DEFAULT '0' COMMENT '运行平台',
 `app_paid_text` varchar(200) DEFAULT NULL COMMENT '运行平台文字',
 `app_osver` varchar(20) NOT NULL DEFAULT '0' COMMENT '系统要求',
 `app_downnum` int(4) NOT NULL DEFAULT '0' COMMENT '应用下载量',
 `app_down1` varchar(120) DEFAULT NULL COMMENT '应用下载地址1',
 `app_down2` varchar(120) DEFAULT NULL COMMENT '应用下载地址2',
 `app_down3` varchar(120) DEFAULT NULL COMMENT '应用下载地址3',
 `app_addtime` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间年月日时分秒',
 PRIMARY KEY (`app_id`), KEY `tid` (`type_id`, `app_addtime`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='应用表';

/*Data for the table `wm_app_app` */ /*Table structure for table `wm_app_attr` */
DROP TABLE IF EXISTS `wm_app_attr`;

CREATE TABLE `wm_app_attr` (`attr_id` int(4) NOT NULL AUTO_INCREMENT,
 `attr_type` varchar(10) NOT NULL COMMENT 'c费用，p平台，l语言',
 `attr_name` varchar(20) NOT NULL COMMENT '属性名',
 PRIMARY KEY (`attr_id`)) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT
CHARSET=utf8 COMMENT='应用资费系统表';

/*Data for the table `wm_app_attr` */
INSERT INTO `wm_app_attr`(`attr_id`, `attr_type`, `attr_name`) VALUES (5,'c','ชำระเงิน'), (4,'p','แอนดรอยด์'), (6,'p','ไซปัน'), (7,'l','อังกฤษ'), (8,'p','แอปเปิ้ล'), (9,'l','จีน'), (10,'c','แคร็ก'), (11,'c','ฟรี');

/*Table structure for table `wm_app_firms` */
DROP TABLE IF EXISTS `wm_app_firms`;

CREATE TABLE `wm_app_firms` (`firms_id` int(4) NOT NULL AUTO_INCREMENT,
 `firms_type` varchar(10) DEFAULT NULL COMMENT 'a是开发商，o是运营商，s自研自营',
 `firms_name` varchar(30) NOT NULL COMMENT '开发商名字',
 `firms_cname` varchar(10) DEFAULT NULL COMMENT '开发商简称',
 `firms_url` varchar(120) DEFAULT NULL COMMENT '官网',
 `firms_adress` varchar(120) DEFAULT NULL COMMENT '联系地址',
 `firms_phone` varchar(15) DEFAULT NULL COMMENT '开发商电话',
 `firms_email` varchar(20) DEFAULT NULL COMMENT '开发商邮件',
 `firms_content` varchar(5000) DEFAULT NULL COMMENT '开发商描述',
 `firms_addtime` int(4) DEFAULT NULL COMMENT '添加时间',
 PRIMARY KEY (`firms_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='应用开发商表';

/*Data for the table `wm_app_firms` */ /*Table structure for table `wm_app_type` */
DROP TABLE IF EXISTS `wm_app_type`;

CREATE TABLE `wm_app_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_name` varchar(40) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_cname` varchar(10) DEFAULT NULL COMMENT '类型简称',
 `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
 `type_order` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
 `type_ico` varchar(200) DEFAULT NULL COMMENT '类型图标',
 `type_info` varchar(200) DEFAULT NULL COMMENT '类型简介',
 `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类模版',
 `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类内容模版',
 `type_title` varchar(80) DEFAULT NULL COMMENT '分类标题',
 `type_key` varchar(100) DEFAULT NULL COMMENT '分类关键字',
 `type_desc` varchar(120) DEFAULT NULL COMMENT '分类描述',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT
CHARSET=utf8 COMMENT='应用分类表';

/*Data for the table `wm_app_type` */
INSERT INTO `wm_app_type`(`type_id`, `type_topid`, `type_pid`, `type_name`, `type_cname`, `type_pinyin`, `type_order`, `type_ico`, `type_info`, `type_tempid`, `type_ctempid`, `type_title`, `type_key`, `type_desc`) VALUES (12,0,'0','การแข่งขันรถ','กีฬา','tiyu',5,NULL,'',0,0,'','',''), (11,0,'0','ยุทธศาสตร์','กลยุทธ์','celue',4,NULL,'',0,0,'','',''), (8,0,'0','บทบาทสมมติ','บทบาท','jiaose',1,NULL,'',0,0,'','',''), (9,0,'0','การผจญภัย','ต่อสู้','dongzuo',2,'','',0,0,'','',''), (10,0,'0','ต่อสู้ด้วยปืน','ต่อสู้','feixing',3,NULL,'',0,0,'','',''), (13,0,'0','ปริศนาคลายสมอง','ปริศนา','yizhi',6,NULL,'',0,0,'','',''), (14,0,'0','เกมกระดาน','เกมการ์ด','kapai',7,NULL,'',0,0,'','',''), (15,0,'0','จำลองการพัฒนา','พัฒนา','yangcheng',9,NULL,'',0,0,'','',''), (16,0,'0','การแปลจีน','การแปล','hanhua',8,NULL,'',0,0,'','','');

/*Table structure for table `wm_article_article` */
DROP TABLE IF EXISTS `wm_article_article`;

CREATE TABLE `wm_article_article` (`article_id` int(11) NOT NULL AUTO_INCREMENT,
 `type_id` int(4) NOT NULL DEFAULT '1' COMMENT '新闻分类id',
 `article_display` tinyint(1) DEFAULT '1' COMMENT '是否显示、生成html',
 `article_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0为审核，1为正常，2为回收站',
 `article_weight` int(4) NOT NULL DEFAULT '0' COMMENT '文章权重，越大越靠前',
 `article_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
 `article_head` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否头条',
 `article_strong` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
 `article_name` varchar(50) NOT NULL COMMENT '文章标题',
 `article_cname` varchar(35) DEFAULT NULL COMMENT '文章简称',
 `article_color` varchar(20) DEFAULT NULL COMMENT '标题颜色',
 `article_simg` varchar(200) DEFAULT NULL COMMENT '缩略图',
 `article_source` varchar(20) DEFAULT NULL COMMENT '文章来源',
 `article_tags` varchar(50) DEFAULT NULL COMMENT '标签',
 `article_url` varchar(120) DEFAULT NULL COMMENT '是否跳转',
 `article_author` varchar(20) DEFAULT 'admin' COMMENT '作者',
 `article_author_id` int(11) DEFAULT '0' COMMENT '文章作者',
 `article_editor` varchar(20) DEFAULT 'admin' COMMENT '编辑',
 `article_editor_id` int(4) DEFAULT '1' COMMENT '编辑的id',
 `article_info` varchar(250) DEFAULT NULL COMMENT '简介',
 `article_save_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章内容保存类型，1为入库，2为文件',
 `article_save_path` varchar(250) DEFAULT NULL COMMENT '文件保存的路径',
 `article_content` mediumtext COMMENT '内容',
 `article_read` int(4) NOT NULL DEFAULT '0' COMMENT '阅读量',
 `article_replay` int(4) NOT NULL DEFAULT '0' COMMENT '回复量',
 `article_score` decimal(2, 1) DEFAULT '0.0' COMMENT '文章评分',
 `article_ding` int(4) NOT NULL DEFAULT '0' COMMENT '顶',
 `article_cai` int(4) NOT NULL DEFAULT '0' COMMENT '踩',
 `article_addtime` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间年月日时分秒',
 `article_examinetime` int(4) NOT NULL DEFAULT '0' COMMENT '审核时间',
 PRIMARY KEY (`article_id`), KEY `tid_index` (`type_id`, `article_addtime`),
 KEY `attr_index` (`article_display`, `article_status`, `article_weight`, `article_rec`, `article_head`, `article_strong`),
 KEY `list_index` (`article_status`, `type_id`),
 KEY `status_index` (`article_status`),
 KEY `type_index` (`type_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='文章内容表';

/*Data for the table `wm_article_article` */ /*Table structure for table `wm_article_author` */
DROP TABLE IF EXISTS `wm_article_author`;

CREATE TABLE `wm_article_author` (`author_id` int(4) NOT NULL AUTO_INCREMENT,
 `author_type` varchar(2) NOT NULL DEFAULT 'a' COMMENT '是作者还是文章来源,a是作者，s是文章来源',
 `author_name` varchar(20) NOT NULL COMMENT '作者或者来源名字',
 `author_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认数据',
 `author_data` int(11) DEFAULT '0' COMMENT '当前属性配对的数据条数',
 PRIMARY KEY (`author_id`)) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT
CHARSET=utf8 COMMENT='文章作者表';

/*Data for the table `wm_article_author` */
INSERT INTO `wm_article_author`(`author_id`, `author_type`, `author_name`, `author_default`, `author_data`) VALUES (1,'s','ต้นฉบับ',1,10), (32,'a','admin',1,10), (65,'e','admin',0,10);

/*Table structure for table `wm_article_type` */
DROP TABLE IF EXISTS `wm_article_type`;

CREATE TABLE `wm_article_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_status` tinyint(1) DEFAULT '1' COMMENT '是否显示',
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_name` varchar(40) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_cname` varchar(10) DEFAULT NULL COMMENT '分类简称',
 `type_pinyin` varchar(50) DEFAULT NULL COMMENT '分类拼音',
 `type_order` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
 `type_ico` varchar(200) DEFAULT NULL COMMENT '图标',
 `type_info` varchar(100) DEFAULT NULL COMMENT '分类简介',
 `type_add` tinyint(1) DEFAULT '1' COMMENT '分类是否允许投稿',
 `type_titempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类首页',
 `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类列表',
 `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT '内容页的模版id',
 `type_title` varchar(80) DEFAULT NULL COMMENT '分类标题',
 `type_key` varchar(100) DEFAULT NULL COMMENT '分类关键字',
 `type_desc` varchar(120) DEFAULT NULL COMMENT '分类描述',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT
CHARSET=utf8 COMMENT='文章分类表';

/*Data for the table `wm_article_type` */
INSERT INTO `wm_article_type`(`type_id`, `type_status`, `type_topid`, `type_pid`, `type_name`, `type_cname`, `type_pinyin`, `type_order`, `type_ico`, `type_info`, `type_add`, `type_titempid`, `type_tempid`, `type_ctempid`, `type_title`, `type_key`, `type_desc`) VALUES (1,1,0,'0','ประกาศเว็บไซต์','ประกาศ','gg',1,'','',0,0,0,0,'','',''), (2,1,0,'0','ข่าวสาร','ข่าว','news',2,'','',0,0,0,0,'','',''), (3,1,1,'1','ces','','',1,'','',0,0,0,0,'','',''), (4,1,0,'0','หมวดหมู่',NULL,NULL,0,NULL,NULL,1,0,0,0,NULL,NULL,NULL);

/*Table structure for table `wm_author_author` */
DROP TABLE IF EXISTS `wm_author_author`;

CREATE TABLE `wm_author_author` (`author_id` int(4) NOT NULL AUTO_INCREMENT,
 `user_id` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `author_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为审核中,1为正常,2为不通过',
 `author_nickname` varchar(40) NOT NULL COMMENT '作者笔名，不允许更改 /* SubMaRk */',
 `author_info` varchar(100) NOT NULL COMMENT '作者简介',
 `author_notice` varchar(500) DEFAULT NULL COMMENT '作者公告',
 `author_time` int(4) NOT NULL DEFAULT '0' COMMENT '开通时间',
 `author_toptime` int(4) NOT NULL DEFAULT '0' COMMENT '上次登录的时间',
 PRIMARY KEY (`author_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='作者表';

/*Data for the table `wm_author_author` */ /*Table structure for table `wm_author_draft` */
DROP TABLE IF EXISTS `wm_author_draft`;

CREATE TABLE `wm_author_draft` (`draft_id` int(11) NOT NULL AUTO_INCREMENT,
 `draft_author_id` int(4) NOT NULL COMMENT '草稿的作者',
 `draft_module` varchar(20) NOT NULL COMMENT '草稿箱所属模块',
 `draft_cid` int(4) NOT NULL DEFAULT '0' COMMENT '草稿所属的内容id',
 `draft_title` varchar(100) NOT NULL COMMENT '草稿标题',
 `draft_content` text NOT NULL COMMENT '草稿内容',
 `draft_number` int(4) NOT NULL DEFAULT '0' COMMENT '草稿字数',
 `draft_option` varchar(2000) DEFAULT NULL COMMENT '其他数据的选项',
 `draft_createtime` int(4) NOT NULL COMMENT '草稿创建时间',
 PRIMARY KEY (`draft_id`), KEY `draft_index` (`draft_author_id`, `draft_module`, `draft_cid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='草稿箱';

/*Data for the table `wm_author_draft` */ /*Table structure for table `wm_author_end` */
DROP TABLE IF EXISTS `wm_author_end`;

CREATE TABLE `wm_author_end` (`end_id` int(4) NOT NULL AUTO_INCREMENT,
 `end_module` varchar(20) DEFAULT NULL COMMENT '完结奖励模块',
 `end_type` varchar(20) DEFAULT NULL COMMENT '完结奖励验证类型（字数、章节）',
 `end_number` int(4) DEFAULT NULL COMMENT '奖励数字要求',
 `end_gold1` decimal(5, 2) DEFAULT NULL COMMENT '奖励金币1',
 `end_gold2` decimal(5, 2) DEFAULT NULL COMMENT '奖励金币2',
 PRIMARY KEY (`end_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='完结奖励表';

/*Data for the table `wm_author_end` */ /*Table structure for table `wm_author_exp` */
DROP TABLE IF EXISTS `wm_author_exp`;

CREATE TABLE `wm_author_exp` (`exp_id` int(4) NOT NULL AUTO_INCREMENT,
 `exp_module` varchar(20) NOT NULL COMMENT '经验值所属的模块',
 `exp_number` int(4) NOT NULL DEFAULT '0' COMMENT '经验值',
 `exp_author_id` int(4) NOT NULL COMMENT '作者id',
 PRIMARY KEY (`exp_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='作者经验等级表';

/*Data for the table `wm_author_exp` */ /*Table structure for table `wm_author_level` */
DROP TABLE IF EXISTS `wm_author_level`;

CREATE TABLE `wm_author_level` (`level_id` int(4) NOT NULL AUTO_INCREMENT,
 `level_module` varchar(15) DEFAULT NULL COMMENT '等级模块',
 `level_name` varchar(40) NOT NULL COMMENT '等级名字 /* SubMaRk */',
 `level_start` int(4) NOT NULL DEFAULT '0' COMMENT '开始经验',
 `level_end` int(4) NOT NULL DEFAULT '0' COMMENT '结束经验',
 `level_order` int(4) NOT NULL DEFAULT '0' COMMENT '显示位置',
 PRIMARY KEY (`level_id`)) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT
CHARSET=utf8 COMMENT='经验等级';

/*Data for the table `wm_author_level` */
INSERT INTO `wm_author_level`(`level_id`, `level_module`, `level_name`, `level_start`, `level_end`, `level_order`) VALUES (1,'novel','ก้าวสู่โลกนักเขียน',0,100,1), (2,'novel','นักเขียนฝึกหัด',100,300,2), (3,'novel','นักเขียนขั้นต้น',300,600,3), (4,'novel','นักเขียนขั้นกลาง',600,1000,4), (5,'novel','นักเขียนขั้นปลาย',1000,1500,5), (6,'novel','นักเขียนมืออาชีพ',1500,2100,6), (22,'article','สุดยอดนักเขียน',0,100,1), (23,'article','นักเขียนอาวุโส',100,500,2), (24,'article','ปรมาจารย์นักเขียน',500,2000,3), (25,'article','จักรพรรดินักเขียน',2000,5000,4);

/*Table structure for table `wm_author_module_income` */
DROP TABLE IF EXISTS `wm_author_module_income`;

CREATE TABLE `wm_author_module_income` (`income_id` int(4) NOT NULL AUTO_INCREMENT,
 `income_module` varchar(20) NOT NULL COMMENT '收入的模块',
 `income_author_id` int(4) NOT NULL COMMENT '作者id',
 `income_cid` int(4) NOT NULL COMMENT '模块的内容',
 `income_gold1_now` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '当前累积的金币1',
 `income_gold2_now` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '当前累积的金币2',
 `income_gold1` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '总共累积的金币1',
 `income_gold2` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '总共累积的金币2',
 PRIMARY KEY (`income_id`), KEY `user_index` (`income_module`, `income_author_id`, `income_cid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='作者模块内容收入记录表';

/*Data for the table `wm_author_module_income` */ /*Table structure for table `wm_author_sign` */
DROP TABLE IF EXISTS `wm_author_sign`;

CREATE TABLE `wm_author_sign` (`sign_id` int(4) NOT NULL AUTO_INCREMENT,
 `sign_module` varchar(20) NOT NULL COMMENT '模块',
 `sign_name` varchar(40) NOT NULL COMMENT '签约等级名字 /* SubMaRk */',
 `sign_divide` varchar(5) NOT NULL DEFAULT '7:3' COMMENT '道具打赏收入分成比例',
 `sign_gold1` decimal(5, 2) NOT NULL DEFAULT '0.00' COMMENT '千字金币1',
 `sign_gold2` decimal(5, 2) NOT NULL DEFAULT '0.00' COMMENT '千字金币2',
 `sign_order` tinyint(2) DEFAULT '0' COMMENT '排序',
 PRIMARY KEY (`sign_id`)) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT
CHARSET=utf8 COMMENT='小说作者签约等级';

/*Data for the table `wm_author_sign` */
INSERT INTO `wm_author_sign`(`sign_id`, `sign_module`, `sign_name`, `sign_divide`, `sign_gold1`, `sign_gold2`, `sign_order`) VALUES (1,'novel','ระดับ D','9:1','1.00','10.00',1), (2,'novel','ระดับ C','8:2','2.00','20.00',2), (3,'novel','ระดับ B','7:3','3.00','30.00',3), (4,'novel','ระดับ A','6:4','4.00','40.00',4), (5,'novel','ระดับเงิน','5:5','5.00','50.00',5), (6,'novel','ระดับทอง','4:6','6.00','60.00',6), (7,'novel','ระดับทองคำขาว','3:7','7.00','70.00',7);

/*Table structure for table `wm_author_word` */
DROP TABLE IF EXISTS `wm_author_word`;

CREATE TABLE `wm_author_word` (`word_id` int(4) NOT NULL AUTO_INCREMENT,
 `word_module` varchar(20) DEFAULT NULL COMMENT '模块',
 `word_author_id` int(4) DEFAULT NULL COMMENT '作者id',
 `word_cid` int(4) DEFAULT NULL COMMENT '内容id',
 `word_time` int(4) DEFAULT NULL COMMENT '时间',
 PRIMARY KEY (`word_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='字数更新记录表';

/*Data for the table `wm_author_word` */ /*Table structure for table `wm_bbs_bbs` */
DROP TABLE IF EXISTS `wm_bbs_bbs`;

CREATE TABLE `wm_bbs_bbs` (`bbs_id` int(4) NOT NULL AUTO_INCREMENT,
 `bbs_isreplay` int(1) NOT NULL DEFAULT '0' COMMENT '是否需要回复',
 `bbs_islogin` int(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录',
 `bbs_ispay` int(1) NOT NULL DEFAULT '0' COMMENT '是否付费',
 `type_id` int(4) NOT NULL COMMENT '分类id',
 `bbs_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为审核中，1为正常',
 `bbs_rec` int(1) NOT NULL DEFAULT '0' COMMENT '推荐',
 `bbs_es` int(1) NOT NULL DEFAULT '0' COMMENT '精华',
 `bbs_top` int(1) NOT NULL DEFAULT '0' COMMENT '1为全站置顶，2为分类置顶，3为当前置顶',
 `bbs_simg` varchar(120) DEFAULT NULL COMMENT '缩略图',
 `bbs_title` varchar(150) NOT NULL COMMENT '帖子标题 /* SubMaRk */',
 `bbs_content` text NOT NULL COMMENT '帖子内容',
 `user_id` int(4) NOT NULL DEFAULT '0' COMMENT '发帖用户',
 `bbs_time` int(4) NOT NULL DEFAULT '0' COMMENT '发帖时间',
 `bbs_replay_time` int(4) NOT NULL DEFAULT '0' COMMENT '最后回帖时间',
 `bbs_replay_nickname` varchar(20) DEFAULT NULL COMMENT '回帖用户昵称',
 `bbs_replay_uid` int(4) NOT NULL DEFAULT '0' COMMENT '回帖用户id',
 `bbs_read` int(4) NOT NULL DEFAULT '0' COMMENT '浏览量',
 `bbs_replay` int(4) NOT NULL DEFAULT '0' COMMENT '回复量',
 `bbs_tags` varchar(50) DEFAULT NULL COMMENT '标签',
 `bbs_ding` int(4) NOT NULL DEFAULT '0' COMMENT '顶',
 `bbs_cai` int(4) NOT NULL DEFAULT '0' COMMENT '踩',
 `bbs_score` decimal(5, 2) NOT NULL DEFAULT '0.00' COMMENT '评分',
 PRIMARY KEY (`bbs_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='论坛主题表';

/*Data for the table `wm_bbs_bbs` */ /*Table structure for table `wm_bbs_moderator` */
DROP TABLE IF EXISTS `wm_bbs_moderator`;

CREATE TABLE `wm_bbs_moderator` (`moderator_id` int(4) NOT NULL AUTO_INCREMENT,
 `user_id` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `type_id` int(4) NOT NULL DEFAULT '0' COMMENT '版块id',
 PRIMARY KEY (`moderator_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='论坛版主表';

/*Data for the table `wm_bbs_moderator` */ /*Table structure for table `wm_bbs_type` */
DROP TABLE IF EXISTS `wm_bbs_type`;

CREATE TABLE `wm_bbs_type` (`type_id` int(11) NOT NULL AUTO_INCREMENT,
 `type_post_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为开启',
 `type_replay_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为开启',
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_name` varchar(40) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_cname` varchar(10) NOT NULL COMMENT '类型简称',
 `type_pinyin` varchar(50) NOT NULL COMMENT '类型拼音',
 `type_order` int(2) NOT NULL DEFAULT '50' COMMENT '排序',
 `type_info` varchar(200) DEFAULT NULL COMMENT '简介',
 `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类页模版',
 `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT '内容页模版',
 `type_rtempid` int(4) NOT NULL DEFAULT '0' COMMENT '评论页模版',
 `type_ico` varchar(225) DEFAULT NULL COMMENT '图标地址',
 `type_title` varchar(80) DEFAULT NULL COMMENT '版块标题',
 `type_key` varchar(100) DEFAULT NULL COMMENT '版块关键字',
 `type_desc` varchar(120) DEFAULT NULL COMMENT '版块描述',
 `type_last_post` int(4) NOT NULL DEFAULT '0' COMMENT '最后发帖',
 `type_last_replay` int(4) NOT NULL DEFAULT '0' COMMENT '最后回帖',
 `type_uptime` int(4) NOT NULL DEFAULT '0' COMMENT '数据更新时间',
 `type_sum_post` int(4) NOT NULL DEFAULT '0' COMMENT '总帖子',
 `type_sum_replay` int(4) NOT NULL DEFAULT '0' COMMENT '总回复',
 `type_sum_read` int(4) NOT NULL DEFAULT '0' COMMENT '总浏览',
 `type_today_post` int(4) NOT NULL DEFAULT '0' COMMENT '日帖子',
 `type_today_replay` int(4) NOT NULL DEFAULT '0' COMMENT '日回复',
 `type_today_read` int(4) NOT NULL DEFAULT '0' COMMENT '日浏览',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='论坛版块表';

/*Data for the table `wm_bbs_type` */ /*Table structure for table `wm_config_config` */
DROP TABLE IF EXISTS `wm_config_config`;

CREATE TABLE `wm_config_config` (`config_id` int(4) NOT NULL AUTO_INCREMENT,
 `config_status` tinyint(1) DEFAULT '1' COMMENT '是否显示配置',
 `group_id` int(4) DEFAULT '0' COMMENT '配置分组id',
 `config_module` varchar(20) NOT NULL COMMENT '配置所属的模块',
 `config_title` varchar(60) NOT NULL COMMENT '配置的标题 /* SubMaRk */',
 `config_name` varchar(35) NOT NULL COMMENT '配置的字段名',
 `config_value` varchar(2000) NOT NULL COMMENT '配置的字段值',
 `config_formtype` varchar(20) DEFAULT NULL COMMENT '配置的表单类型',
 `config_remark` varchar(200) DEFAULT NULL COMMENT '配置的备注信息',
 `config_order` int(4) DEFAULT NULL COMMENT '配置的显示顺序',
 PRIMARY KEY (`config_id`,
 `config_title`)) ENGINE=MyISAM AUTO_INCREMENT=431 DEFAULT
CHARSET=utf8 COMMENT='系统配置表';

/*Data for the table `wm_config_config` */
INSERT INTO `wm_config_config`(`config_id`, `config_status`, `group_id`, `config_module`, `config_title`, `config_name`, `config_value`, `config_formtype`, `config_remark`, `config_order`) VALUES (1,1,1,'system','ชื่อเว็บไซต์','webname','WMCMS เว็บทดสอบ','input','ชื่อเว็บไซต์',1), (2,1,1,'system','ลิ้งก์โดเมนหลัก','weburl','wmcms.com','input','ชื่อโดเมนหลักเว็บไซต์ (ห้ามลงท้ายด้วย / และไม่ต้องกรอก http://)',2), (3,1,1,'system','อีเมล์ผู้ดูแล','email','1747699213@qq.com','input','อีเมล์ติดต่อผู้ดูแล',3), (14,1,1,'system','หมายเลขบันทึก','beian','渝ICP证030173号','input','หมายเลขเว็บไซต์ประจำโดเมน',4), (7,1,1,'system','เปิดเว็บไซต์','siteopen','1','radio','เปิด / ปิดเว็บไซต์',5), (8,1,1,'system','ข้อความปิดเว็บ','closeinfo','ขออภัย! เว็บไซต์ปิดปรับปรุงชั่วคราว','textarea','ข้อความเมื่อปิดเว็บไซต์',6), (9,1,1,'templates','เทมเพลตเรียบง่าย','tp1','wmcms-web','input','เทมเพลตสำหรับ wap 1.0',9), (10,1,1,'templates','เทมเพลต 3G','tp2','wmcms-web','input','เทมเพลตเว็บไซต์ 3G',10), (11,1,1,'templates','เทมเพลตรุ่นสัมผัส','tp3','wmcms-m','input','เทมเพลตสำหรับรุ่นสัมผัส',11), (12,1,1,'templates','เทมเพลตพีซี','tp4','wmcms-web','input','เทมเพลตสำหรับพีซี',12), (13,1,15,'urlmode','เปิดใช้รูปแบบลิ้งก์','url_type','1','select','การเปิดใช้รูปแบบลิ้งก์จะใช้ทรัพยากรเซิร์ฟเวอร์มากขึ้น',8), (15,1,1,'domain','โดเมนพีซี','domain4','','input','เข้าถึงเวอร์ชั่นพีซีโดยตรงผ่านโดเมนนี้',8), (16,1,1,'domain','โดเมนรุ่นสัมผัส','domain3','','input','เข้าถึงเวอร์ชั่นรุ่นสัมผัสโดยตรงผ่านโดเมนนี้',7), (17,1,1,'domain','โดเมน 3G','domain2','','input','เข้าถึงเวอร์ชั่นสำหรับ 3G โดยตรงผ่านโดเมนนี้',6), (18,1,1,'domain','โดเมนรุ่นเรียบง่าย','domain1','','input','เข้าถึงเวอร์ชั่นสำหรับรุ่นเรียบง่ายโดยตรงผ่านโดเมนนี้',5), (25,1,4,'user','คำที่ห้ามใช้','shieldkey','Administrator,Webmaster,System,Admin','input','ชื่อผู้ใช้ที่ห้ามใช้',50), (28,1,1,'system','บันทึกการส่งอีเมล์','emaillog_open','0','select','จะบันทึกข้อมูลการส่งอีเมล์หรือไม่',13), (390,1,1,'cache','การแคชข้อมูล','cache_queuetype','file','select','ประเภทการแคชข้อมูล',16), (391,1,1,'cache','แคช SQL ไว้ที่โฟลเดอร์','sql_folder','sql','input','SQL จะถูกแคชเป็นไฟล์ไว้ที่โฟลเดอร์',5), (392,1,1,'cache','คำนำหน้าไฟล์แคช SQL','sql_ext','.sql','input','คำนำหน้าไฟล์แคช SQL',5), (39,1,1,'system','QQ ผู้ดูแล','qq','1747699213','input','หมายเลข QQ ของผู้ดูแลระบบ',9), (40,1,1,'system','เบอร์มือถือผู้ดูแล','phone','15123931801','input','เบอร์มือถือผู้ดูแล',10), (47,1,1,'domain','แสดง pt กำกับ','pt_rep','0','input','เลือกว่าจะให้แสดง pt หรือไม่',11), (42,1,1,'tongji','โค้ดรุ่นมือถือ','tongji','','textarea','แสดงสัญลักษณ์รุ่นมือถือ',0), (43,1,1,'domain','โค้ดรุ่นเรียบง่าย','tpmark1','m','input','แสดงสัญลักษณ์รุ่นเรียบง่าย',13), (44,1,1,'domain','โค้ดรุ่น 3G','tpmark2','3g','input','แสดงสัญลักษณ์รุ่น 3G',12), (45,1,1,'domain','โค้ดรุ่นสัมผัส','tpmark3','m','input','แสดงสัญลักษณ์รุ่นสัมผัส',10), (46,1,1,'domain','โค้ดรุ่นพีซี','tpmark4','web','input','แสดงสัญลักษณ์รุ่นพีซี',9), (50,1,1,'domain','โดเมนตั้งต้น','bdomain','','input','ชื่อโดเมนตั้งต้น',1), (51,1,1,'domain','ชื่อโดเมนใหม่','ndomain','','input','กระโดดไปยังโดเมนใหม่',2), (53,1,1,'domain','เชื่อมโยงโดเมนในพื้นหลัง','admin_domain','','input','ชื่อโดเมนที่ถูกเชื่อมโยงในการจัดการพื้นหลัง',3), (54,1,1,'system','ที่ตั้งพื้นหลัง','admin_path','admin','input','ดำแหน่งที่ไฟล์พื้นหลังอยู่ เช่น admin',2), (57,1,1,'code','โค้ดยืนยันเข้าสู่ระบบพื้นหลัง','code_admin_login','0','radio','จำเป็นต้องกรอกโค้ดยืนยันในการเข้าสู่ระบบพื้นหลังหรือไม่?',1), (67,1,1,'upload','ครอบตัดอัตโนมัติ','upload_cut','0','radio','ต้องการเปิดใช้การครอบตัดภาพโดยอัตโนมัติหรือไม่',3), (58,1,1,'upload','ชนิดไฟล์ที่อัพโหลดได้','upload_type','jpeg,jpg,gif,png,gif,txt,doc,apk','input','ชนิดไฟล์ที่อนุญาตให้อัพโหลด ใช้ , แยก',2), (59,1,1,'upload','ขนาดอัพโหลด','upload_size','1024','input','จำกัดขนาดไฟล์ หน่วยเป็น Kb',2), (60,1,1,'upload','เปิดใช้ลายน้ำ','watermark_open','1','radio','ต้องการเปิดใช้ฟังก์ชั่นลายน้ำหรือไม่',20), (61,1,1,'upload','ความกว้างที่ใช้ลายน้ำ','watermark_width','100','input','เมื่อความกว้างของรูปภาพใหญ่เกินกว่าค่านี้',21), (62,1,1,'upload','ความสูงที่ใช้ลายน้ำ','watermark_height','200','input','เมื่อความสูงยาวเกินค่านี้',22), (63,1,1,'upload','รูปแบบลายน้ำ','watermark_type','text','radio','รูปแบบลายน้ำ！ที่ตั้งรูปลายน้ำ /files/images/watermark.png',23), (64,1,1,'upload','ตำแหน่งลายน้ำ','watermark_location','9','radio','ตำแหน่งที่แสดงลายน้ำ',27), (65,1,1,'upload','สีลายน้ำ','watermark_color','#e01515','input','สีอักษรลายน้ำ',25), (66,1,1,'upload','ขนาดอักษร','watermark_size','5','input','ขนาดอักษรลายน้ำในหน่วยพิกเซล',26), (68,1,1,'upload','ความกว้างที่จะครอบตัด','upload_imgwidth','1200','input','เมื่อความกว้างของรูปภาพใหญ่เกินกว่าค่านี้',4), (69,1,1,'upload','ความสูงที่จะครอบตัด','upload_imgheight','800','input','เมื่อความสูงยาวเกินค่านี้',5), (70,1,1,'upload','ความกว้างหลังครอบตัด','upload_cutwidth','500','input','ความกว้างรูปภาพหลังการครอบตัด',6), (71,1,1,'upload','ความสูงหลังครอบตัด','upload_cutheight','500','input','ความสูงของรูปภาพการหลังครอบตัด',7), (72,1,1,'upload','ข้อความลายน้ำ','watermark_text','ใช้ระบบ WMCMS','input','เนื้อหาข้อความลายน้ำ',24), (73,1,1,'system','ภาษาที่ใช้','lang','zh_cn','radio','ภาษาที่ใช้ในระบบ',15), (389,1,1,'cache','รูปแบบแคช SQL','cache_sqltype','file','select','รูปแบบการแคช SQL ที่ใช้อยู่',16), (75,1,1,'system','อนุญาตให้เข้าถึงผ่านพร็อกซี่','proxy_visit','1','radio','อนุญาตให้เข้าถึงผ่านพร็อกซี่หรือไม่',16), (77,1,1,'system','คำร้องผู้ดูแล','request_open','0','radio','เลือกว่าจะบันทึกคำร้องของผู้ดูแลในพื้นหลังหรือไม่',11), (78,1,1,'system','การดำเนินการของผู้ดูแล','operation_open','0','radio','เลือกว่าจะเปิดใช้งานผู้ดูแลพื้นหลังเพื่อแก้ไขบันทึกสำรองข้อมูลได้หรือไม่',14), (79,1,2,'article','พารามิเตอร์ตรวจสอบหน้าบทความ','par_article','1','radio','เลือกตรวจสอบพารามิเตอร์หน้าบทความทั้งหมดว่าถูกต้องหรือไม่',1), (80,1,2,'article','พารามิเตอร์ตรวจสอบหน้าความคิดเห็น','par_replay','1','radio','เลือกตรวจสอบพารามิเตอร์หน้าความคิดเห็นทั้งหมดว่าถูกต้องหรือไม่',2), (81,1,2,'article','สถานะเผยแพร่บทความในพื้นหลัง','admin_add','1','radio','สถานะพื้นฐานการเผยแพร่บทความในการจัดการพื้นหลัง',3), (82,1,11,'author','เปิดฟังก์ชั่นการส่งบทความ','author_article_open','1','radio','เปิดให้ผู้ใช้สามารถส่งบทความได้',24), (84,1,2,'article','เปิดการค้นหาบทความ','search_open','1','radio','เปิดให้สามารถค้นหาบทความได้',5), (85,1,2,'article','ช่วงเวลาค้นหา','search_time','3','input','เวลาในการค้นหาแต่ละครั้ง (หน่วย : วินาที)',6), (86,1,2,'article','เปิดการแสดงความรู้สึก','dingcai_open','1','select','เลือกว่าจะเป็นการแสดงความรู้สึกต่อบทความหรือไม่',7), (87,1,2,'article','ขีดจำกัดการแสดงความรู้สึก','dingcai_count','2','input','ขีดจำกัดการแสดงความรู้สึกในแต่ละวัน',8), (88,1,1,'system','บันทึกข้อผิดพลาด','err_open','0','select','เปิดการบันทึกข้อผิดพลาดบนเว็บไซต์',12), (89,1,2,'article','ลบข้อมูลโดยตรง','admin_del','1','select','คุณต้องการลบบทความโดยตรงหรือย้ายไปถังรีไซเคิลก่อน',3), (90,1,2,'article','เปิดให้แสดงความคิดเห็น','replay_open','0','select','เปิดใช้ฟังก์ชั่นแสดงความคิดเห็นในโมดูลบทความ',9), (91,1,2,'article','เข้าสู่ระบบเพื่อแสดงความคิดเห็น','replay_login','1','select','จำเ้ป็นต้องเข้าสู่ระบบก่อนแสดงความคิดเห็นหรือไม่',11), (92,1,3,'novel','พารามิเตอร์ตรวจสอบหน้านิยาย','par_info','1','select','จะตรวจสอบหน้ารายละเอียด ไอดีหมวดหมู่ ไอดีหนังสือพร้อมกันในคราวเดียว',1), (93,1,3,'novel','พารามิเตอร์ตรวจสอบหน้าความคิดเห็น','par_replay','0','select','จะตรวจสอบหน้ารายละเอียด ไอดีหมวดหมู่ ไอดีหนังสือพร้อมกันในคราวเดียว',2), (94,1,3,'novel','พารามิเตอร์ตรวจสอบหน้าหมวดหมู่','par_menu','1','select','จะตรวจสอบหน้ารายละเอียด ไอดีหมวดหมู่ ไอดีหนังสือพร้อมกันในคราวเดียว',3), (95,1,3,'novel','พารามิเตอร์ตรวจสอบหน้าอ่าน','par_read','1','select','จะตรวจสอบหน้ารายละเอียด ไอดีหมวดหมู่ ไอดีหนังสือพร้อมกันในคราวเดียว',4), (96,1,3,'novel','ที่ตั้งจัดเก็บนิยาย','novel_save','/files/txt/novel/{#123}tid{#125}/{#123}nid{#125}/index.txt','input','ที่จัดเก็บไฟล์ txt ที่สร้างขึ้นจากนิยาย',5), (97,1,3,'novel','ที่ตั้งจัดเก็บบทนิยาย','chapter_save','/files/txt/novel/{#123}tid{#125}/{#123}nid{#125}/{#123}cid{#125}.txt','input','ที่จัดเก็บไฟล์ txt ที่สร้างขึ้นจากบทนิยาย',6), (98,1,3,'novel','ปกนิยายพื้นฐาน','cover','/files/images/nocover.jpg','input','ที่อยู่ปกนิยายพื้นฐาน',7), (99,1,3,'novel','สถานะเผยแพร่หนังสือในพื้นหลัง','admin_novel_add','1','select','สถานะพื้นฐานการเผยแพร่หนังสือในการจัดการพื้นหลัง',8), (100,1,3,'novel','สถานะเผยแพร่บทในพื้นหลัง','admin_chapter_add','100','select','สถานะพื้นฐานการเผยแพร่บทในการจัดการพื้นหลัง',9), (101,1,3,'novel','ประเภทการเผยแพร่','type','1','select','ค่าพื้นฐานการเผยแพร่นิยาย',10), (102,1,3,'novel','โหมดจัดเก็บข้อมูล','data_type','1','radio','โหมดจัดเก็บข้อมูล',11), (103,1,3,'novel','เปิดให้ดาวน์โหลดนิยาย','down_open','1','radio','ต้องการเปิดให้ดาวน์โหลดนิยายบนเว็บได้หรือไม่',12), (104,1,3,'novel','ค่าพื้นฐานชื่อบทล่าสุด','new_cname','ยังไม่ได้้เริ่มเขียน','input','ค่าพื้นฐานชื่อบทล่าสุดเมื่อเพิ่มนิยายเรื่องใหม่',13), (105,1,3,'novel','เทมเพลตข้อความส่วนหัวนิยาย','novel_head','เว็บไซต์นิยายนี้ปลอดภัย','textarea','เทมเพลตข้อความส่วนหัวนิยายเมื่อสร้างใหม่',14), (106,1,3,'novel','เทมเพลตข้อความต้นบท','chapter_start','ยินดีต้อนรับสู่รายการที่ชอบ','textarea','เทมเพลตข้อความต้นบทเมื่อสร้างใหม่',15), (107,1,3,'novel','เทมเพลตข้อความท้ายบท','chapter_end','โปรดจดจำลิ้งก์นี้ไว้','textarea','เทมเพลตข้อความท้ายบทเมื่อสร้างใหม่',16), (108,1,3,'novel','เข้าสู่ระบบเพื่ออ่านบท','chapter_isvip','0','radio','เมื่อเผยแพร่บท คุณต้องการให้เข้าสู่ระบบก่อนเพื่ออ่านหรือไม่',17), (109,1,3,'novel','เหรียญที่ใช้ในการซื้อบท','buy_gold_type','2','radio','กำหนดค่าเหรียญที่ใช้ในการซื้อบท',13), (110,1,3,'novel','ขีดจำกัดคำที่อ่านฟรี','buy_wordnumber','500','input','ไม่เก็บเงินเมื่อบทมีจำนวนคำน้อยกว่าที่ตั้งไว้',19), (111,1,3,'novel','เปิดการแสดงความรู้สึก','dingcai_open','1','select','เปิดให้สามารถแสดงความรู้สึกได้',20), (112,1,3,'novel','ขีดจำกัดการแสดงความรู้สึก','dingcai_count','1','input','ขีดจำกัดการแสดงความรู้สึกในแต่ละวัน',21), (113,1,3,'novel','ขีดจำกัดการให้คะแนน','score_count','1','input','ขีดจำกัดการให้คะแนนในแต่ละวัน',23), (114,1,3,'novel','เปิดการให้คะแนน','score_open','1','select','เปิดให้สามารถให้คะแนนได้',22), (115,1,3,'novel','เข้าสู่ระบบเพื่อให้คะแนน','score_login','0','select','จำเป้นต้องเข้าสู่ระบบก่อนถึงให้คะแนนได้หรือไม่',24), (116,1,3,'novel','เปิดให้แสดงความคิดเห็น','replay_open','0','select','เปิดให้แสดงความคิดเห็นได้',25), (117,1,3,'novel','เข้าสู่ระบบเพื่อแสดงความคิดเห็น','replay_login','1','select','จำเป้นต้องเข้าสู่ระบบก่อนถึงแสดงความคิดเห็นได้หรือไม่',26), (118,1,3,'novel','ฟังก์ชั่นเรื่องที่ชอบ','coll_open','1','select','กำหนดว่าจะเปินฟังก์ชั่นเรื่องที่ชอบหรือไม่',27), (119,1,3,'novel','ฟังก์ชั่นแนะนำ','rec_open','1','select','กำหนดว่าจะเปิดฟังก์ชั่นแนะนำหรือไม่',28), (120,1,3,'novel','ค่าประสบการณ์แฟนคลับเมื่อใช้เหรียญ','fans_exp_gold1','200','input','จะเปิดใช้งานเมื่อใช้ฟังก์ชั่นซื้อนิยาย',30), (121,1,3,'novel','ฟังก์ชั่นเหรียญรางวัล','reward_open','1','select','กำหนดว่าจะเปิดฟังก์ชั่นเหรียญรางวัลหรือไม่',31), (122,1,3,'novel','ฟังก์ชั่นค้นหา','search_open','1','select','กำหนดว่าจะเปิดฟังก์ชั่นค้นหาหรือไม่',32), (123,1,3,'novel','ช่วงเวลาค้นหา','search_time','3','input','ช่วงเวลาค้นหาในการค้นหานิยาย',33), (124,1,3,'novel','กระโดดไปผลค้นหา','search_jump','0','radio','กระโดดไปหน้านิยายที่ค้นเจอทันทีเมื่อมีผลลัพธ์เพียงหนึ่งเดียว',34), (125,1,3,'novel','เปิดชั้นหนังสือ','shelf_open','1','select','กำหนดว่าจะเป็นฟังก์ชั่นชั้นหนังสือหรือไม่',31), (126,1,4,'user','ฟังก์ชั่นลงทะเบียน','reg_open','1','select','เปิดให้ลงทะเบียนได้หรือไม่',1), (127,1,4,'user','ฟังก์ชั่นเข้าสู่ระบบ','login_open','1','select','เปิดให้เข้าสู่ระบบได้หรือไม่',2), (128,1,4,'user','บันทึกการเข้าสู่ระบบ','login_log','1','select','ต้องการเปิดให้บันทึกการเข้าสู่ระบบหรือไม่',3), (129,1,4,'user','ประเภทอวตาลเริ่มต้นของผู้ใช้','user_head','1','select','อวตาลเริ่มต้นของผู้ใช้ใหม่เมื่อลงทะเบียน',4), (130,1,4,'user','อวตาลเริ่มต้นของผู้ใช้','default_head','/files/images/nohead.gif','input','ที่ตั้งอวตาลเริ่มต้น',5), (131,1,4,'user','สถานะการลงทะเบียนเป็นผูใช้ใหม่','reg_status','1','select','สถานะเริ่มต้นสำหรับผู้ใช้ที่เพิ่งลงทะเบียน',6), (132,1,4,'user','ความกว้างอวตาล','head_width','100','input','ความกว้างอวตาลของผู้ใช้',7), (133,1,4,'user','ความสูงอวตาล','head_height','100','input','ความสูงอวตาลของผู้ใช้',8), (134,1,4,'user','อวตาลระบบ','msg_head','/files/images/system.jpg','input','อวตาลระบบ',9), (135,1,4,'user','เหรียญ 1 ฟรีเมื่อลงทะเบียน','reg_gold1','2','input','จำนวนเหรียญ 1 ที่จะได้รับเมื่อผู้ใช้ทำการลงทะเบียน',10), (136,1,4,'user','เหรียญ 2 ฟรีเมื่อลงทะเบียน','reg_gold2','0','input','จำนวนเหรียญ 2 ที่จะได้รับเมื่อผู้ใช้ทำการลงทะเบียน',11), (137,1,4,'user','ประสบการณ์เมื่อลงทะเบียน','reg_exp','0','input','ค่าประสบการณ์ที่จะได้รับเมื่อผู้ใช้ทำการลงทะเบียน',12), (138,1,4,'user','ลายเซ็นต์เริ่มต้น','reg_sign','~ สนุกเพลิดเพลินไปกับ WeimengCMS ~','textarea','ลายเซ็นต์เริ่มต้นของผู้ใช้เมื่อทำการลงทะเบียน',13), (139,1,4,'user','ชื่อประสบการณ์','exp_name','Exp','input','ชื่อประสบการณ์บนเว็บไซต์',14), (140,1,4,'user','ชื่อเหรียญ 1','gold1_name','เงิน','input','ชื่อเหรียญ 1 บนเว็บไซต์',15), (141,1,4,'user','ชื่อเหรียญ 2','gold2_name','ทอง','input','ชื่อเหรียญ 2 บนเว็บไซต์',16), (142,1,4,'user','หน่วยเหรียญ 1','gold1_unit','เหรียญ','input','หน่วยเหรียญ 1 บนเว็บไซต์',17), (143,1,4,'user','หน่วยเหรียญ 2','gold2_unit','เหรียญ','input','หน่วยเหรียญ 2 บนเว็บไซต์',18), (144,1,4,'user','รางวัลประสบการณืเมื่อเข้าสู่ระบบ','login_exp','1','input','ค่าประสบการณ์ที่จะได้รับเมื่อเข้าสู่ระบบครั้งแรกของทุกวัน',19), (145,1,4,'user','เข้าสู่ระบบรับเหรียญ 1 ฟรี','login_gold1','0','input','จำนวนเหรียญ 1 ที่จะได้รับเมื่อเข้าสู่ระบบครั้งแรกของทุกวัน',20), (146,1,4,'user','เข้าสู่ระบบรับเหรียญ 2 ฟรี','login_gold2','0','input','จำนวนเหรียญ 2 ที่จะได้รับเมื่อเข้าสู่ระบบครั้งแรกของทุกวัน',21), (147,1,1,'system','ตรวจอักษรที่สงวนไว้','check_shield','0','select','ตรวจสอบอักษรที่ทำการสงวนไว้',98), (148,1,1,'system','ตรวจอักษรต้องห้าม','check_disable','0','select','ตรวจสอบอักษรที่มีในรายการต้องห้ามไว้',99), (149,1,4,'user','ฟังก์ชั่นเช็คชื่อ','sign_open','1','select','กำหนดว่าจะเปิดใช้ฟังก์ชั่นเช็คชื่อหรือไม่',24), (150,1,4,'user','รางวัลเมื่อเช็คชื่อ','sign_reward','0','select','กำหนดว่าจะมอบรางวัลเมื่อเช็คชื่อหรือไม่',25), (151,1,4,'user','ค่าประสบการณ์เมื่อเช็คชื่อ','sign_exp','1','input','ค่าประสบการณ์เมื่อทำการเช็คชื่อในแต่ละวัน',26), (152,1,4,'user','จำนวนเหรียญ 1 เมื่อเช็คชื่อ','sign_gold1','0','input','จำนวนเหรียญ 1 เมื่อทำการเช็คชื่อในแต่ละวัน',27), (153,1,4,'user','จำนวนเหรียญ 2 เมื่อเช็คชื่อ','sign_gold2','0','input','จำนวนเหรียญ 2 เมื่อทำการเช็คชื่อในแต่ละวัน',28), (154,1,5,'replay','ฟังก์ชั่นความคิดเห็น','replay_open','1','select','กำหนดว่าจะเปิดใช้งานฟังก์ชั่นแสดงความคิดเห็นหรือไม่',1), (155,1,5,'replay','การตั้งค่าแบบรวม','unify','1','select','กำหนดว่าโมดูลอื่น ๆ จะถูกตั้งค่าตามโมดูลความคิดเห็นหรือไม่',2), (156,1,5,'replay','เข้าสู่ระบบเพื่อแสดงความคิดเห็น','replay_login','0','select','กำหนดว่าจำเป็นต้องเข้าสู่ระบบเพื่อแสดงความคิดเห็นหรือไม่',3), (157,1,5,'replay','สถานะพื้นฐานความคิดเห็น','status','1','select','กำหนดว่าจะเผยแพร่ความคิดเห็นทันทีหรือรอตรวจสอบจากผู้ดูแลก่อน',4), (158,1,5,'replay','ช่วงเวลาแสดงความคิดเห็น','top_time','15','input','ช่วงเวลาในการแสดงความคิดเห็นในแต่ละครั้ง',5), (159,1,5,'replay','ขีดจำกัดความคิดเห็นต่อวัน','everyday_count','100','input','ขีดจำกัดในการแสดงความคิดเห็นต่อวัน',6), (160,1,5,'replay','เปิดการแสดงความรู้สึก','dingcai_open','1','select','เปิดให้สามารถแสดงความรู้สึกได้',7), (161,1,5,'replay','ขีดจำกัดการแสดงความรู้สึก','dingcai_count','1','input','ขีดจำกัดการแสดงความรู้สึกในแต่ละวัน',8), (162,1,5,'replay','ชื่อของผู้เยี่ยมชม','nickname','ผู้ผ่านทางมา','input','ชื่อผู้เยี่ยมชมเมื่อทำการแสดงความคิดเห็น',9), (163,1,5,'replay','รางวัลความคิดเห็นแรก','reward_count','0','input','รางวัลเมื่อแสดงความคิดเห็รครั้งแรกในแต่ละวัน',10), (164,1,5,'replay','รางวัลเหรียญ 1','replay_gold1','0','input','จำนวนเหรียญ 1 ที่จะได้รับเมื่อแสดงความคิดเห็นครั้งแรกในแต่ละวัน',11), (165,1,5,'replay','รางวัลเหรียญ 2','replay_gold2','0','input','จำนวนเหรียญ 2 ที่จะได้รับเมื่อแสดงความคิดเห็นครั้งแรกในแต่ละวัน',12), (166,1,5,'replay','ค่าประสบการณ์','replay_exp','0','input','ค่าประสบการณ์ที่จะได้รับเมื่อเข้าสู่ระบบครั้งแรกของทุกวัน',13), (167,1,5,'replay','ชื่อช่องความคิดเห็น JS','boxname','ชุมชนคนรักการอ่าน','input','ชื่อช่องความคิดเห็น JS',14), (168,1,5,'replay','ข้อความเมื่อไม่มีความคิดเห็น','no_data','รอให้คุณแสดงความคิดเห็นอยู่นะ','input','ข้อความที่แสดงเมื่อช่องความคิดเห็น JS ยังไม่มีความคิดเห็น',15), (169,1,5,'replay','ข้อความช่องอักษร','input','ลองพิมพ์สักสองสามประโยคได้ไหม?','input','ข้อความที่แสดงที่ช่องความคิดเห็น JS ',16), (170,1,5,'replay','แสดงความคิดเห็นมาแรง','hot','1','select','กำหนดว่าจะให้แสดงความคิดเห็นที่มาแรงหรือไม่',17), (171,1,5,'replay','จำนวนไลค์ที่จะเป็นความเห็นมาแรง','hot_display','2','input','จำนวนไลค์ที่จะทำให้เป็นความเห็นมาแรง',18), (172,1,5,'replay','จำนวนความคิดเห็นมาแรง','hot_count','2','input','จำนวนความคิดเห็นมาแรงที่จะแสดง',19), (173,1,5,'replay','ขีดจำกัดต่อหน้า','list_limit','6','input','ขีดจำกัดรายการความคิดเห็นต่อหน้า',20), (174,1,5,'replay','จำนวนปุ่มหน้าที่แสดง','page_count','5','input','จำนวนปุ่มหน้าที่แสดง',21), (175,1,6,'link','พารามิเตอร์ตรวจสอบหน้าลิ้งก์พันธมิตร','par_link','0','select','กำหนดว่าจะเปิดฟังก์ชั่นลิ้งก์พันธมิตรหรือไม่',1), (176,1,6,'link','เปิดการลงทะเบียนเข้าร่วม','join','1','select','กำหนดว่าจะเปิดให้ลงทะเบียนเข้าร่วมลิ้งก์พันธมิตรหรือไม่',2), (177,1,6,'link','ประเภทลิ้งก์คลิ๊ก','click_type','0','select','ประเภทลิ้งก์คลิ๊ก',3), (178,1,6,'link','หน่วงเวลา','ref_time','3600','input','เวลาในการหน่วงก่อนรีเฟรช',4), (179,1,6,'link','ตรวจสอบ UA','check_ua','1','select','กำหนดว่าจะตรวจสอบ UA เมื่อทำการคลิ๊กบนลิ้งก์พันธมิตรหรือไม่',5), (180,1,6,'link','บันทึกเพียงไอพีเดียว','check_oneip','1','select','จะบันทึกไอพีที่คลิ๊กเพียงไอพีเดียวในวันเดียวกัน',6), (181,1,6,'link','บันทึกการคลิ๊ก','click_log','1','select','เปิดใช้การบันทึกสถิติการคลิ๊ก',7), (182,1,6,'link','เปิดใช้สถิติไอพี','getip_open','1','select','เปิดใช้สถิติที่อยู่ไอพี',8), (183,1,6,'link','เปิดสถิติลิ้งก์','getadress_open','0','select','เปิดใช้สถิติลิ้งก์',9), (184,1,6,'link','สถานะพื้นฐานในการลงทะเบียนส่วนหน้า','join_status','0','select','สถานะพื้นฐานการลงทะเบียนลิ้งก์พันธมิตรในส่วนหน้า',10), (185,1,6,'link','สถานะพื้นฐานในการลงทะเบียนส่วนหลัง','admin_status','1','select','สถานะพื้นฐานการลงทะเบียนลิ้งก์พันธมิตรในส่วนหลัง',11), (186,1,6,'link','กระโดดเมื่อรคลิ๊กลิ้งก์พันธมิตร','in_jump','','input','หน้าเว็บที่จะกระโดดไปเมื่อคลิ๊กที่ลิ้งก์พันมิตร หากปล่อยว่างจะกระโดดไปหน้าหลัก',12), (187,1,7,'picture','พารามิเตอร์ตรวจสอบหน้ารูปภาพ','par_picture','0','select','เลือกตรวจสอบพารามิเตอร์หน้ารูปภาพทั้งหมดว่าถูกต้องหรือไม่',1), (188,1,7,'picture','พารามิเตอร์ตรวจสอบหน้าความคิดเห็น','par_replay','0','select','เลือกตรวจสอบพารามิเตอร์หน้าความคิดเห็นทั้งหมดว่าถูกต้องหรือไม่',2), (189,1,7,'picture','ตรวจสอบเมื่อเพิ่มในพื้นหลัง','admin_add','1','select','กำหนดว่าจะตรวจสอบการอัปโหลดจากพื้นหลังหรือไม่',3), (190,1,7,'picture','ตรวจสอบเมื่อเพิ่มจากผู้ใช้','user_add','1','select','กำหนดว่าจะตรวจสอบการอัปโหลดจากพผู้ใช้หรือไม่',4), (191,1,7,'picture','เปิดการแสดงความรู้สึก','dingcai_open','1','select','เปิดให้สามารถแสดงความรู้สึกได้',5), (192,1,7,'picture','ฟังก์ชั่นให้คะแนน','score_open','1','select','กำหนดว่าจะเปิดใช้ฟังก์ชั่นให้คะแนนหรือไม่',6), (193,1,7,'picture','ฟังก์ชั่นความคิดเห็น','replay_open','1','select','กำหนดว่าจะเปิดฟังก์ชั่นแสดงความคิดเห็นหรือไม่',7), (194,1,7,'picture','เข้าสู่ระบบเพื่อให้คะแนน','score_login','1','select','จำเป็นต้องเข้าสู่ระบบเพื่อทำการให้คะแนน',8), (195,1,7,'picture','เปิดการค้นหา','search_open','1','select','เปิดให้ทำการค้นหาได้',9), (196,1,7,'picture','ขีดจำกัดการแสดงความรู้สึก','dingcai_count','1','input','ขีดจำกัดการแสดงความรู้สึกในแต่ละวัน',10), (197,1,7,'picture','ขีดจำกัดการให้คะแนน','score_count','1','input','ขีดจำกัดการให้คะแนนในแต่ละวัน',11), (198,1,7,'picture','ช่วงเวลาค้นหา','search_time','3','input','ช่วงเวลาค้นหาในการค้นหาแต่ละครั้ง',12), (199,1,7,'picture','เข้าสู่ระบบเพื่อแสดงความคิดเห็น','replay_login','1','select','เข้าสู่ระบบเพื่อแสดงความคิดเห็น',14), (200,1,8,'app','พารามิเตอร์ตรวจสอบหน้าแอปฯ','par_app','0','select','เลือกตรวจสอบพารามิเตอร์หน้าแอปฯ ว่าถูกต้องหรือไม่',1), (201,1,8,'app','พารามิเตอร์ตรวจสอบหน้าความคิดเห็น','par_replay','0','select','เลือกตรวจสอบพารามิเตอร์หน้าความคิดเห็นทั้งหมดว่าถูกต้องหรือไม่',2), (202,1,8,'app','ไอคอนเริ่มต้นแอปฯ','default_ico','/files/images/noimage.gif','input','ไอคอนเริ่มต้นแอปฯ',3), (203,1,8,'app','ปกเริ่มต้นแอปฯ','default_simg','/files/images/noimage.gif','input','ปกเริ่มต้นแอปฯ',4), (204,1,8,'app','ตรวจสอบเมื่อเพิ่มในพื้นหลัง','admin_add','1','select','กำหนดว่าจะตรวจสอบเนื้อหาที่เพิ่มจากพื้นหลังหรือไม่',5), (205,1,8,'app','เปิดให้ดาวน์โหลดแอปฯ','down_open','1','select','กำหนดว่าจะเปิดใช้งานฟังก์ชั่นดาวน์โหลดแอปฯ หรือไม่',6), (206,1,8,'app','เปิดการแสดงความรู้สึก','dingcai_open','1','select','เปิดให้สามารถแสดงความรู้สึกได้',6), (207,1,8,'app','ขีดจำกัดการแสดงความรู้สึก','dingcai_count','1','input','ขีดจำกัดการแสดงความรู้สึกในแต่ละวัน',7), (208,1,8,'app','ฟังก์ชั่นให้คะแนน','score_open','1','select','กำหนดว่าจะเปิดใช้ฟังก์ชั่นให้คะแนนหรือไม่',8), (209,1,8,'app','ขีดจำกัดการให้คะแนน','score_count','1','input','ขีดจำกัดการให้คะแนนในแต่ละวัน',9), (210,1,8,'app','เข้าสู่ระบบเพื่อให้คะแนน','score_login','0','select','จำเป็นต้องเข้าสู่ระบบเพื่อทำการให้คะแนน',10), (211,1,8,'app','ฟังก์ชั่นความคิดเห็น','replay_open','1','select','กำหนดว่าจะเปิดฟังก์ชั่นแสดงความคิดเห็นหรือไม่',11), (212,1,8,'app','เข้าสู่ระบบเพื่อแสดงความคิดเห็น','replay_login','0','select','เข้าสู่ระบบเพื่อแสดงความคิดเห็น',12), (213,1,8,'app','เปิดการค้นหา','search_open','1','select','เปิดให้ทำการค้นหาได้',13), (214,1,8,'app','ช่วงเวลาค้นหา','search_time','3','input','ช่วงเวลาค้นหาในการค้นหาแต่ละครั้ง',14), (215,1,9,'bbs','พารามิเตอร์ตรวจสอบหน้าบอร์ด','par_bbs','0','select','เลือกตรวจสอบพารามิเตอร์หน้าบอร์ดทั้งหมดว่าถูกต้องหรือไม่',1), (216,1,9,'bbs','พารามิเตอร์ตรวจสอบหน้าตอบกลับ','par_relist','0','select','เลือกตรวจสอบพารามิเตอร์หน้าตอบกลับทั้งหมดว่าถูกต้องหรือไม่',2), (217,1,9,'bbs','นักเขียนดูได้','author_look','1','select','กำหนดว่านักเขียนจะัสามารถดูหัวเรื่องที่รอการตรวจสอบได้หรือไม่',3), (218,1,9,'bbs','นักเขียนแก้ไขได้','author_up','1','select','นักเขียนสามารถแก้ไขกระทู้ของตนเองได้',4), (219,1,9,'bbs','นักเขียนลบได้','author_del','1','select','นักเขียนสามารถลบกระทู้ของตนเองได้',5), (220,1,9,'bbs','สถานะเริ่มต้นกระทู้','user_post','1','select','สถานะเริ่มต้นของกระทู้',6), (221,1,9,'bbs','สถานะเริ่มต้นของโพสต์ตอบกลับ','user_replay','1','select','สถานะเริ่มต้นของโพสต์ตอบกลับ',7), (222,1,9,'bbs','ตรวจสอบเมื่อมีการแก้ไข','up_status','1','select','กำหนดว่าจะให้ผู้ดูแลตรวจสอบเมื่อมีการแก้ไขหรือไม่',8), (223,1,9,'bbs','ฟังก์ชั่นกระทู้','post_open','0','select','กำหนดว่าจะเปิดฟังก์ชั่นกระทู้หรือไม่',9), (224,1,9,'bbs','ฟังก์ชั่นโพสต์ตอบกลับ','replay_open','0','select','กำหนดว่าจะเปิดฟังก์ชั่นโพสต์ตอบกลับหรือไม่',10), (225,1,9,'bbs','ขีดจำกัดการตั้งกระทู้','post_num','0','input','กำหนดขีดจำกัดในการสร้างกระทู้ในแต่ละวัน',11), (226,1,9,'bbs','รางวัลเมื่อตั้งกระทู้','post_top','5','input','รางวัลที่จะได้รับเมื่อตั้งกระทู้ครั้งแรกในแต่ละวัน',12), (227,1,9,'bbs','รางวัลเหรียญ 1','post_gold1','1','input','รางวัลเหรียญ 1 ที่จะได้รับเมื่อทำการตั้งกระทู้',13), (228,1,9,'bbs','รางวัลเหรียญ 2','post_gold2','0','input','รางวัลเหรียญ 2 ที่จะได้รับเมื่อทำการตั้งกระทู้',14), (229,1,9,'bbs','ค่าประสบการณ์','post_exp','1','input','ค่าประสบการณ์ที่จะได้รับเมื่อทำการตั้งกระทู้',15), (230,1,9,'bbs','ขีดจำกัดโพสต์ตอบกลับ','everyday_count','0','input','ขีดจำกัดโพสต์ตอบกลับในแต่ละวัน',16), (231,1,9,'bbs','รางวัลเมื่อโพสต์ตอบกลับ','reward_count','5','input','รางวัลที่จะได้รับเมื่อโพสต์ตอบกลับครั้งแรกในแต่ละวัน',17), (232,1,9,'bbs','รางวัลเหรียญ 1','replay_gold1','1','input','รางวัลเหรียญ 1 ที่จะได้รับเมื่อทำการโพสต์ตอบกลับ',18), (233,1,9,'bbs','รางวัลเหรียญ 2','replay_gold2','0','input','รางวัลเหรียญ 2 ที่จะได้รับเมื่อทำการโพสต์ตอบกลับ',18), (234,1,9,'bbs','ค่าประสบการณ์','replay_exp','1','input','ค่าประสบการณ์ที่จะได้รับเมื่อทำการโพสต์ตอบกลับ',19), (235,1,9,'bbs','ไอคอนบอร์ดเริ่มต้น','default_ico','/files/images/forum.png','input','ไอคอนบอร์ดเริ่มต้น',20), (236,1,9,'bbs','ช่วงเวลาค้นหา','search_time','3','input','ช่วงเวลาในการค้นหาแต่ละครั้ง',22), (237,1,9,'bbs','เปิดการค้นหา','search_open','1','select','กำหนดว่าจะเปิดให้ค้นหากระทู้ได้หรือไม่',21), (238,1,2,'article','รูปย่อเริ่มต้นในส่วนหน้า','default_simg','/files/images/noimage.gif','input','รูปปกเริ่มต้นเมื่อไม่มีรูปย่อไปแสดงในส่วนหน้า',0), (239,1,1,'logo','โลโก้เรียบง่าย','logo_1','','input','โลโก้เรียบง่าย',1), (240,1,1,'logo','โลโก้สี','logo_2','','input','โลโก้สี',2), (241,1,1,'logo','โลโก้รุ่นสัมผัส','logo_3','/files/images/logo.png','input','โลโก้รุ่นสัมผัส',3), (242,1,1,'logo','โลโกัพีซี','logo_4','/files/images/logo.png','input','โลโกัพีซี',4), (243,1,1,'system','ประเภทฐานข้อมูล','db','mysql','select','ประเภทฐานข้อมูลที่ใช้',17), (244,1,10,'message','ฟังก์ชั่นข้อความ','message_open','1','select','กำหนดว่าจะเปิดใช้ฟังก์ชั่นข้อความหรือไม่',1), (245,1,10,'message','ขีดจำกัดข้อความ','message_count','3','input','ขีดจำกัดจำนวนการส่งข้อความในแต่ละวัน',2), (246,1,1,'logo','WeChat สแกนคิวอาร์โค้ด','ewm_wx','','input','WeChat สแกนคิวอาร์โค้ด',5), (247,1,1,'logo','Alipay สแกนคิวอาร์โค้ด','ewm_alipay','/files/images/ewm_alipay.png','input','Alipay สแกนคิวอาร์โค้ด',6), (248,1,1,'logo','Weibo สแกนคิวอาร์โค้ด','ewm_weibo','','input','Weibo สแกนคิวอาร์โค้ด',7), (249,1,1,'logo','QQ สแกนคิวอาร์โค้ด','ewm_qun','/files/images/ewm_qun.png','input','QQ สแกนคิวอาร์โค้ด',8), (250,1,1,'cache','เปิดการแคช','cache_open','0','select','กำหนดว่าจะเปิดใช้การแคชหรือไม่',1), (251,1,1,'cache','ประเภทแึคช','cache_type','file','select','ประเภทแึคช',2), (252,1,1,'cache','ที่ตั้งแคช','cache_path','cache','input','ที่ตั้งแคช',3), (253,1,1,'cache','ที่จัดเก็บแคช','file_folder','site','input','ที่จัดเก็บแคช',4), (254,1,1,'cache','คำต่อท้ายไฟล์แคช','file_ext','.cache','input','คำนำหน้าไฟล์แคช',5), (255,1,1,'cache','โฟลเดอร์จัดเก็บคิวแคช','queue_folder','queue','input','โฟลเดอร์จัดเก็บคิวแคช',6), (256,1,1,'cache','คำต่อท้ายไฟล์คิวแคช','queue_ext','.queue','input','คำนำหน้าไฟล์คิวแคช',7), (257,1,1,'cache','เซิร์ฟเวอร์ Redis','redis_host','127.0.0.1','input','เซิร์ฟเวอร์ Redis',8), (258,1,1,'cache','พอร์ต Redis','redis_port','6379','input','พอร์ต Redis',9), (259,1,1,'cache','เซิร์ฟเวอร์ Memcached','memcached_host','127.0.0.1','input','เซิร์ฟเวอร์ Memcached',10), (260,1,1,'cache','พอร์ต Memcached','memcached_port','11211','input','พอร์ต Memcached',11), (261,1,1,'cache','กลไกการแคช','cache_mechanism','page','select','กลไกการแคช',1), (262,1,1,'cache','แคช SQL','cache_sql','0','radio','แคช SQL',1), (263,1,1,'cache','เวลาแคช','cache_time','300','input','เวลาแคช (หน่วย : วินาที)',12), (268,1,4,'user','เข้าสู่ระบบด้วย Ajax','ajax_login','ref','select','การเข้าสู่ระบบด้วย Ajax',29), (265,1,1,'cache','เปิดการแคชคิว','cache_queue','0','radio','เปิดการแคชคิว',14), (266,1,1,'cache','เวลาแคชคิว','cache_queuetime','300','input','เวลาแคชคิว',15), (267,1,1,'cache','เวลาแคช SQL','cache_sqltime','300','input','เวลาแคช SQL',16), (269,1,11,'author','สถานะเริ่มต้นเมื่อลงทะเบียนเป็นนักเขียน','apply_author_status','0','select','สถานะเริ่มต้นเมื่อลงทะเบียนเป็นนักเขียน',2), (270,1,11,'author','เปิดการลงทะเบียนเป็นนักเขียน','apply_author_open','1','select','เปิดการลงทะเบียนเป็นนักเขียน',1), (271,1,11,'author','ข้อมูลนักเขียนเริ่มต้น','author_default_info','คนนี้ขีเกียจนะรู้หรือเปล่าล่ะ!','input','ข้อมูลนักเขียนเริ่มต้นเมื่อลงทะเบียน',3), (272,1,11,'author','ประกาศเริ่มต้น','author_default_notice','ยังไม่มีประกาศจากนักเขียน!','input','ประกาศเริ่มต้นเมื่อลงทะเบียน',4), (273,1,4,'user','ชื่อยอดเงิน','money_name','เหรียญ','input','ชื่อยอดบัญชี',30), (274,1,11,'author','วิธีตรวจสอบนิยาย','author_novel_createnovel','0','select','วิธีตรวจสอบนิยายที่เพิ่มมาใหม่',5), (275,1,11,'author','วิธีตรวจสอบบท','author_novel_createchapter','0','select','วิธีตรวจสอบบทนิยายที่เพิ่มมาใหม่',6), (276,1,11,'author','ความกว้างปก','author_novel_coverwidth','400','input','ความกว้างปกนิยาย',7), (277,1,11,'author','ความสูงปก','author_novel_coverheight','500','input','ความสูงปกนิยาย',8), (278,1,11,'author','วิธีตรวจสอบปก','author_novel_uploadcover','0','radio','วิธีตรวจสอบปกนิยายที่อัปโหลด',9), (279,1,11,'author','ข้อความรอตรวจสอบ','author_apply_0','สวัสดี, การลงทะเบียนเป็นนักเขียนถูกยื่นเข้าระบบแล้ว โปรดรอให้ผู้ดูแลตรวจสอบอีกครั้ง','textarea','เหตุผลที่จะใช้แจ้งนักเขียนเมื่อต้องรอการตรวจสอบ',10), (280,1,11,'author','ข้อความเมื่อผ่านการตรวจสอบ','author_apply_1','สวัสดี, ข้อมูลการลงทะเบียนเป็นนักเขียนถูกตรวจสอบแล้ว ตอนนี้คุณสามารถลงมือเขียนนิยายได้เลย!','textarea','เหตุผลที่จะใช้แจ้งนักเขียนเมื่อผ่านการตรวจสอบ',11), (281,1,11,'author','ข้อความปฏิเสธ','author_apply_2','ขออภัย, ข้อมูลการลงทะเบียนเป็นนักเขียนไม่ผ่านการตรวจสอบ!\r\nอาจเนื่องด้วยเหตุผลดังนี้ : \r\n1.ข้อมูลไม่สมบูรณ์ครบถ้วน\r\n2.นามปากกามีอักษรหรือคำที่ห้ามใช้','textarea','เหตุผลที่จะใช้แจ้งนักเขียนเมื่อถูกปฏิเสธการลงทะเบียน',12), (282,1,11,'author','ข้อความรอตรวจสอบ','author_novel_cover_0','สวัสดี, รูปปกที่คุณอัปโหลดเข้ามาในระบบจะแสดงก็ต่อเมื่อผู้ดูแลระบบทำการตรวจสอบแล้ว!','textarea','เหตุผลว่าทำไมรูปปกถึงต้องรอตรวจสอบ',13), (283,1,11,'author','ข้อความเมื่อผ่านการตรวจสอบ','author_novel_cover_1','ยินดีด้วย, รูปปกนิยายที่คุณอัปโหลดผ่านการตรวจสอบแล้ว!','textarea','เหตุผลเมื่อรูปปกผ่านการตรวจสอบ',14), (284,1,11,'author','ข้อความปฏิเสธ','author_novel_cover_2','ขออภัย, รูปปกที่คุณอัปโหลดเข้ามาในระบบไม่ผ่านการตรวจสอบ!\r\nอาจเนื่องด้วยเหตุผลดังนี้ : \r\n1.รูปปกอาจมีเนื้อหาเชิงลามกหรือความรุนแรง\r\n2.ผิดตามข้อกฎหมายของประเทศ!','textarea','เหตุผลเมื่อรูปปกไม่ผ่านการตรวจสอบ',15), (285,1,11,'author','วิธีตรวจสอบการแก้ไขนิยาย','author_novel_editnovel','0','select','กำหนดว่าจะให้มีการตรวจสอบการแก้ไขนิยายหรือไม่',16), (286,1,11,'author','วิธีตรวจสอบการแก้ไขบท','author_novel_editchapter','0','select','กำหนดว่าจะให้มีการตรวจสอบการแก้ไขบทหรือไม่',17), (287,1,11,'author','ข้อความรอตรวจสอบ','author_novel_editnovel_0','สวัสดี, โปรดรอให้ผู้ดูแลตรวจสอบการแก้ไขอีกครั้ง!','textarea','เหตุผลที่จะใช้แจ้งนักเขียนเมื่อต้องรอการตรวจสอบการแก้ไข',18), (288,1,11,'author','ข้อความเมื่อผ่านการตรวจสอบ','author_novel_editnovel_1','ยินดีด้วย, ข้อมูลการแก้ไขได้รับการตรวจสอบแล้ว!','textarea','เหตุผลเมื่อการแก้ไขได้รับการตรวจสอบแล้ว',19), (289,1,11,'author','ข้อความปฏิเสธ','author_novel_editnovel_2','ขออภัย, ข้อมูลการแก้ไขของคุณไม่ผ่านการตรวจสอบ!\r\nอาจเนื่องด้วยเหตุผลดังนี้ : \r\n1.เนื้อหาอาจเข้าข่ายเชิงลามกหรือความรุนแรง!\r\n2.ผิดตามข้อกฎหมายของประเทศ!','textarea','เหตุผลที่จะใช้แจ้งนักเขียนเมื่อถูกปฏิเสธ',20), (290,1,11,'author','ข้อความรอตรวจสอบ','author_novel_editchapter_0','สวัสดี, โปรดรอให้ผู้ดูแลตรวจสอบการแก้ไขอีกครั้ง!','textarea','เหตุผลที่จะใช้แจ้งนักเขียนเมื่อต้องรอการตรวจสอบการแก้ไข',21), (291,1,11,'author','ข้อความเมื่อผ่านการตรวจสอบ','author_novel_editchapter_1','ยินดีด้วย, ข้อมูลการแก้ไขได้รับการตรวจสอบแล้ว!','textarea','เหตุผลเมื่อการแก้ไขได้รับการตรวจสอบแล้ว',22), (292,1,11,'author','ข้อความปฏิเสธ','author_novel_editchapter_2','ขออภัย, ข้อมูลการแก้ไขของคุณไม่ผ่านการตรวจสอบ!\r\nอาจเนื่องด้วยเหตุผลดังนี้ : \r\n1.เนื้อหาอาจเข้าข่ายเชิงลามกหรือความรุนแรง!\r\n2.ผิดตามข้อกฎหมายของประเทศ!','textarea','เหตุผลที่จะใช้แจ้งนักเขียนเมื่อถูกปฏิเสธ',23), (293,1,11,'author','วิธีตรวจสอบบทความ','author_article_createarticle','0','select','วิธีตรวจสอบบทความ',24), (294,1,11,'author','วิธีตรวจสอบการแก้ไขบทความ','author_article_editarticle','0','select','วิธีตรวจสอบการแก้ไขบทความ',25), (295,1,11,'author','ข้อความรอตรวจสอบ','author_article_editarticle_0','สวัสดี, โปรดรอให้ผู้ดูแลตรวจสอบการแก้ไขบทความของคุณอีกครั้ง!','textarea','เหตุผลที่การแก้ไขบทความของคุณยังรอการตรวจสอบ',26), (296,1,11,'author','ข้อความเมื่อผ่านการตรวจสอบ','author_article_editarticle_1','ยินดีด้วย, บทความที่คุณแก้ไขได้ผ่านการตรวจสอบแล้ว!','textarea','เหตุผลเมื่อบทความที่แก้ไขผ่านการตรวจสอบ',27), (297,1,11,'author','ข้อความปฏิเสธ','author_article_editarticle_2','ขออภัย, การแก้ไขบทความของคุณถูกปฏิเสธ!\r\nอาจเนื่องด้วยเหตุผลดังนี้ : \r\n1.เนื้อหาอาจเข้าข่ายเชิงลามกหรือความรุนแรง!\r\n2.ผิดตามข้อกฎหมายของประเทศ!','textarea','เหตุผลที่การแก้ไขบทความถูกปฏิเสธ',28), (302,1,1,'system','อัปโหลดข้อผิดพลาดอัตโนมัติ','err_auto_upload','1','select','กำหนดว่าจะให้อัปโหลดรายงานข้อผิดพลาดที่พบไปยังคลาวด์เซิร์ฟเวอร์เพื่อประมวลผลหรือไม่',13), (301,1,15,'urlmode','เปิดใช้ HTML','ishtml','0','radio','เปิดการเข้าถึงผ่าน HTML หรือไม่',6), (303,1,3,'novel','จำนวนเหรียญ 1','cons_gold1','200','input','จำนวนเหรียญ 1',30), (304,1,3,'novel','จำนวนรายเดือนของเหรียญ 1','cons_gold1_month','0','input','เมื่อใช้เหรียญ 1 ถึงจำนวนที่ระบุไว้จะถูกปรับเป็นรายเดือนทันที',31), (322,1,3,'novel','จำนวนตั๋วแนะนำของเหรียญ 1','cons_gold1_rec','1','input','เมื่อใช้เหรียญ 1 ถึงจำนวนที่ระบุไว้จะได้รับตั๋วแนะนำฟรี',32), (305,1,4,'user','รับตั๋วแนะนำเมื่อเข้าสู่ระบบ','login_rec','0','input','จำนวนตั๋วแนะนำที่จะได้รับเมื่อเข้าสู่ระบบในแต่ละวัน',31), (306,1,4,'user','รับรายเดือนเมื่อเข้าสู่ระบบ','login_month','0','input','จำนวนรายเดือนที่จะได้รับเมื่อเข้าสู่ระบบในแต่ละวัน',32), (307,1,4,'user','รับรายเดือนเมื่อเช็คชื่อ','sign_month','0','input','จำนวนรายเดือนที่จะได้รับเมื่อเช็คชื่อในแต่ละวัน',33), (308,1,4,'user','รับตั๋วแนะนำเมื่อเช็คชื่อ','sign_rec','0','input','จำนวนตั๋วแนะนำที่จะได้รับเมื่อเช็คชื่อในแต่ละวัน',34), (309,1,4,'user','ชื่อตั๋วแนะนำ','ticket_rec','ตั๋วแนะนำ','input','กำหนดชื่อให้ตั๋วแนะนำ',35), (310,1,4,'user','ชื่อรายเดือน','ticket_month','รายเดือน','input','กำหนดชื่อให้ชื่อรายเดือน',36), (311,1,12,'finance','เปิดการเติมเงิน','recharge_open','1','select','กำหนดว่าจะเปิดให้เติมเงินหรือไม่',1), (312,1,12,'finance','แลกยอดคงเหลือเป็นเหรียญ 2','money_to_gold2_open','1','select','กำหนดว่าต้องการให้สามารถแลกยอดคงเหลือเป็นเหรียญ 2 ได้หรือไม่',2), (313,1,12,'finance','แลกเหรียญ 2 เป็นเหรียญ 1','gold2_to_gold1_open','0','select','กำหนดว่าต้องการให้สามารถแลกเหรียญ 2 เป็นเหรียญ 1 หรือไม่',3), (314,1,12,'finance','แลกเหรียญ 1 เป็นเหรียญ 2','gold1_to_gold2_open','0','select','กำหนดว่าต้องการให้สามารถแลกเหรียญ 1 เป็นเหรียญ 2 หรือไม่',4), (315,1,12,'finance','แลกเหรียญ 2 เป็นยอดคงเหลือ','gold2_to_money_open','1','select','กำหนดว่าต้องการให้สามารถแลกเหรียญ 2 เป็นยอดคงเหลือหรือไม่',5), (316,1,12,'finance','เปิดการถอนเงิน','cash_open','1','select','กำหนดว่าจะเปิดให้ถอนเงินได้หรือไม่',6), (317,1,12,'finance','อัตราส่วนการเติมเงิน','rmb_to_gold2','10','input','อัตราการเติม',7), (318,1,12,'finance','อัตราส่วนยอดคงเหลือเป็นเหรียญ 2','money_to_gold2','1','input','กำหนดอัตราส่วนการแลกเปลี่ยนยอดคงเหลือเป็นเหรียญ 2',8), (319,1,12,'finance','อัตราส่วนเหรียญ 2 เป็นเหรียญ 1','gold2_to_gold1','10','input','กำหนดอัตราส่วนการแลกเปลี่ยนเหรียญ 2 เป็นเหรียญ 1',9), (320,1,12,'finance','อัตราส่วนเหรียญ 1 เป็นเหรียญ 2','gold1_to_gold2','0','input','กำหนดอัตราส่วนการแลกเปลี่ยนเหรียญ 1 เป็นเหรียญ 2',10), (321,1,12,'finance','อัตราส่วนเหรียญ 2 เป็นยอดคงเหลือ','gold2_to_money','0.1','input','กำหนดอัตราส่วนการแลกเปลี่ยนเหรียญ 2 เป็นยอดคงเหลือ',11), (323,1,3,'novel','จำนวนการใช้เหรียญ 2','cons_gold2','100','input','จำนวนการใช้เหรียญ 2',33), (324,1,3,'novel','จำนวนรายเดือนของเหรียญ 2','cons_gold2_month','2','input','เมื่อใช้เหรียญ 2 ถึงจำนวนที่ระบุไว้จะถูกปรับเป็นรายเดือนทันที',34), (325,1,3,'novel','จำนวนตั๋วแนะนำของเหรียญ 2','cons_gold2_rec','3','input','เมื่อใช้เหรียญ 2 ถึงจำนวนที่ระบุไว้จะได้รับตั๋วแนะนำฟรี',35), (326,1,4,'user','รับตั๋วแนะนำเมื่อลงทะเบียน','reg_rec','0','input','รับตั๋วแนะนำฟรีเมื่อลงทะเบียน',48), (327,1,4,'user','รับรายเดือนเมื่อลงทะเบียน','reg_month','0','input','รับรายเดือนฟรีเมื่อลงทะเบียน',49), (328,1,3,'novel','ใช้เหรียญ 2 เพื่อรับค่าประสบการณ์','fans_exp_gold2','15','input','ใช้เหรียญ 2 จนถึงค่าที่กำหนดไว้เพื่อรับค่าประสบการณ์แฟนคลับ',36), (329,1,11,'author','รางวัลเข้าสู่ระบบ','login_exp','10','input','รับค่าประสบการณ์เมื่อนักเขียนเข้าสู่ระบบเป็นประจำทุำกวัน',29), (330,1,11,'author','ประสบการณ์จากตั๋วแนะนำ','income_rec','5','input','ค่าประสบการณ์ที่ได้รับจากตั๋วแนะนำ',30), (331,1,11,'author','ประสบการณ์จากสมัครรายเดือน','income_month','10','input','ค่าประสบการณ์ที่ได้รับจากสมัครรายเดือน',31), (332,1,11,'author','จำนวนเหรียญ 1 ที่ได้รับ','income_gold1','100','input','ทุกเหรียญ 1 ที่ได้รับจะได้ค่าประสบการณ์นักเขียน',32), (333,1,11,'author','จำนวนเหรียญ 2 ที่ได้รับ','income_gold2','50','input','ทุกเหรียญ 2 ที่ได้รับจะได้ค่าประสบการณ์นักเขียน',33), (334,1,3,'novel','ฟังก์ชั่นมอบของขวัญ','give_open','1','select','กำหนดว่าจะเปิดฟังก์ชั่นมอบของขวัญหรือไม่',37), (335,1,3,'novel','เข้าสู่ระบบเพื่อแสดงความรู้สึก','dingcai_login','1','select','จำเป็นต้องเข้าสู่ระบบเพื่อแสดงความรู้สึก',38), (336,1,3,'novel','วิธีแจ้งเตือนหน้าอ่านที่ต้องซื้อ','read_sub_prompt','1','select','วิธีแจ้งเตือนหน้าอ่านที่ต้องซื้อ',39), (337,1,12,'finance','ที่อยู่ในการซื้อบัตรลับ','card_buy_url','http://www.weimengcms.com','input','ที่อยู่ในการซื้อบัตรลับ',12), (338,1,12,'finance','รางวัลเติมเงินครั้งแรก','recharge_reward_gold2','10','input','จำนวนเหรียญ 2 ที่จะได้รับเมื่อเติมเงินครั้งแรก',13), (339,1,12,'finance','เปิดกิจกรรมเติมเงิน','activity_open','1','radio','กำหนดว่าจะเป็นกิจกรรมเติมเงินหรือไม่',14), (340,1,12,'finance','เวลาเริ่มต้นกิจกรรม','activity_starttime','1524055804','input','เวลาเริ่มต้นกิจกรรม',15), (341,1,12,'finance','เวลาสิ้นสุดกิจกรรม','activity_endtime','1524919806','input','เวลาสิ้นสุดกิจกรรม',16), (342,1,12,'finance','ค่าธรรมเนียมการถอนเงิน','cash_cost','8','input','ค่าธรรมเนียมการถอนเงิน',17), (343,1,12,'finance','จำนวนเงินขั้นต่ำ','cash_lowest','100','input','จำนวนเงินขั้นต่ำที่ถอนได้',18), (344,1,1,'upload','วิธีจัดเก็บการอัปโหลด','upload_savetype','0','select','กำหนดที่ตั้งที่จะจัดเก็บไฟล์ที่อัปโหลด',1), (345,1,1,'upload','จัดเก็บไฟล์ระยะไกล','upload_savepath','','input','ที่ตั้งที่จะจัดเก็บไฟล์ที่อัปโหลดผ่านระยะไกล',1), (346,1,2,'article','ฟังก์ชั่นให้คะแนนบทความ','score_open','1','select','กำหนดว่าจะเปิดใช้การให้คะแนนบทความหรือไม่',12), (347,1,2,'article','เข้าสู่ระบบเพื่อแสดงความรู้สึก','dingcai_login','1','select','ต้องเข้าสู่ระบบเพื่อแสดงความรู้สึกต่อบทความ',13), (348,1,2,'article','เข้าสู่ระบบเพื่อให้คะแนน','score_login','1','select','ต้องเข้าสู่ระบบเพื่อให้คะแนนต่อบทความ',14), (349,1,2,'article','ขีดจำกัดคะแนนต่อบทความ','score_count','1','input','ขีดจำกัดการมห้คะแนนบทความต่อวัน',15), (350,1,5,'replay','เข้าสู่ระบบเพื่อแสดงความรู้สึก','dingcai_login','1','select','ต้องเข้าสู่ระบบเพื่อแสดงความรู้สึก',22), (351,1,1,'system','ตรวจสอบ UA และกระโดดอัตโนมัติ','auto_jump','1','select','กำหนดว่าจะเปิดให้มีการตรวจสอบอัตโนมัติเพื่อกระโดดไปยังหน้าสำหรับมือถือหรือพีซีที่ถูกต้องหรือไม่',4), (352,1,1,'code','โค้ดยืนยันการลงทะเบียนผู้ใช้','code_user_reg','1','radio','กำหนดว่าจะเปิดใช้โค้ดยืนยันการในการลงทะเบียนผู้ใช้หรือไม่',2), (353,1,1,'code','โค้ดยืนยันการเข้าสู่ระบบ','code_user_login','1','radio','กำหนดว่าจะเปิดใช้โค้ดยืนยันในการเข้าสู่ระบบหรือไม่',3), (354,1,1,'code','โค้ดยืนยันเมื่อเปลี่ยนรหัสผ่าน','code_user_uppsw','1','radio','กำหนดว่าจะเปิดใช้โค้ดยืนยันเมื่อเปลี่ยนรหัสผ่านหรือไม่',4), (355,1,1,'code','โค้ดยืนยันเมื่อกู้คืนรหัสผ่าน','code_user_getpsw','1','radio','กำหนดว่าจะเปิดใช้โค้ดยืนยันเมื่อกู้คืนรหัสผ่านหรือไม่',5), (356,1,1,'code','โค้ดยืนยันเมื่อแสดงความคิดเห็น','code_replay','0','radio','กำหนดว่าจะเปิดใช้โค้ดยืนยันเมื่อแสดงความคิดเห็นหรือไม่',6), (357,1,1,'code','โค้ดยืนยันเมื่อตั้งกระทู้','code_bbs_post','1','radio','กำหนดว่าจะเปิดใช้โค้ดยืนยันเมื่อตั้งกระทู้หรือไม่',7), (358,1,1,'code','โค้ดยืนยันเมื่อโพสต์ตอบกลับ','code_bbs_replay','1','radio','กำหนดว่าจะเปิดใช้โค้ดยืนยันเมื่อโพสต์ตอบกลับหรือไม่',8), (359,1,1,'code','โค้ดยืนยันแบบถามตอบ','code_question','ลิ้งก์เว็บ WeimengCMS อย่างเป็นทางการ?|www.weimengcms.com\r\nผู้ก่อนตั้ง WeimengCMS คือใคร?|Weimeng\r\nผู้ดูแลโครงการแปลไทยคือใคร?|SubMaRk','textarea','ช่องกรอกคำถามและคำตอบสำหรับใช้เป็นโค้ดยืนยัน',9), (360,1,1,'code','ประเภทโค้ดยืนยันการเข้าสู่ระบบพื้นหลัง','code_admin_login_type','2','select','ประเภทโค้ดยืนยันการเข้าสู่ระบบพื้นหลัง',10), (361,1,1,'code','ประเภทโค้ดยืนยันการลงทะเบียนผู้ใช้','code_user_reg_type','2','select','ประเภทโค้ดยืนยันการลงทะเบียนผู้ใช้',11), (362,1,1,'code','ประเภทโค้ดยืนยันการเข้าสู่ระบบ','code_user_login_type','2','select','ประเภทโค้ดยืนยันการเข้าสู่ระบบ',12), (363,1,1,'code','ประเภทโค้ดยืนยันเมื่อเปลี่ยนรหัสผ่าน','code_user_uppsw_type','2','select','ประเภทโค้ดยืนยันเมื่อเปลี่ยนรหัสผ่าน',13), (364,1,1,'code','ประเภทโค้ดยืนยันเมื่อกู้คืนรหัสผ่าน','code_user_getpsw_type','2','select','ประเภทโค้ดยืนยันเมื่อกู้คืนรหัสผ่าน',14), (365,1,1,'code','ประเภทโค้ดยืนยันเมื่อแสดงความคิดเห็น','code_replay_type','1','select','ประเภทโค้ดยืนยันเมื่อแสดงความคิดเห็น',15), (366,1,1,'code','ประเภทโค้ดยืนยันเมื่อตั้งกระทู้','code_bbs_post_type','1','select','ประเภทโค้ดยืนยันเมื่อตั้งกระทู้',16), (367,1,1,'code','ประเภทโค้ดยืนยันเมื่อโพสต์ตอบกลับ','code_bbs_replay_type','1','select','ประเภทโค้ดยืนยันเมื่อโพสต์ตอบกลับ',17), (368,1,1,'cache','แคชหน้าหลัก','cache_index','300','input','เวลาที่จะแคชหน้าหลัก',17), (369,1,1,'cache','แคชโมดูลหน้าหลัก','cache_module_index','300','input','เวลาที่จะแคชโมดูลหน้าหลัก',18), (370,1,1,'cache','แคชโมดูลหน้าหลักหมวดหมู่','cache_module_tindex','300','input','เวลาที่จะแคชโมดูลหน้าหลักหมวดหมู่',19), (371,1,1,'cache','แคชโมดูลหน้าหลักอันดับ','cache_module_topindex','36000','input','เวลาที่จะแคชโมดูลหน้าหลักอันดับ',20), (372,1,1,'cache','แคชโมดูลรายการ','cache_module_type','600','input','เวลาที่จะแคชโมดูลรายการ',21), (373,1,1,'cache','แคชโมดูลความคิดเห็น','cache_module_replay','600','input','เวลาที่จะแคชโมดูลความคิดเห็น',22), (374,1,1,'cache','แคชโมดูลค้นหา','cache_module_search','600','input','เวลาที่จะแคชโมดูลค้นหา',23), (375,1,1,'cache','แคชโมดูลรายการอันดับ','cache_module_toplist','36000','input','เวลาที่จะแคชโมดูลรายการอันดับ',24), (376,1,1,'cache','แคชโมดูลเนื้อหา','cache_module_content','1800','input','เวลาที่จะแคชโมดูลเนื้อหา',25), (377,1,1,'cache','แคชโมดูลสารบัญ','cache_module_menu','1800','input','เวลาที่จะแคชโมดูลไดเรกทอรี่',26), (378,1,1,'cache','แคชโมดูลรายละเอียด','cache_module_info','360000','input','เวลาที่จะแคชโมดูลรายละเอียด',27), (379,1,2,'article','สร้าง HTML บทความอัตโนมัติ','auto_create_html','0','select','เมื่อมีการเขียน/แก้ไข/ลบ จะสร้าง HTML บทความโดยอัตโนมัติ',16), (380,1,3,'novel','สร้าง HTML บทอัตโนมัติ','auto_create_html','0','select','เมื่อมีการเขียน/แก้ไข/ลบ จะสร้าง HTML บทโดยอัตโนมัติ',40), (381,1,8,'app','สร้าง HTML แอปฯ อัตโนมัติ','auto_create_html','0','select','เมื่อมีการเขียน/แก้ไข/ลบ จะสร้าง HTML แอปฯ โดยอัตโนมัติ',14), (382,1,1,'system','วิธีแชร์คุ๊กกี้','cookie_type','0','select','การแชร์คุ๊กกี้ของเว็บไซต์',15), (383,1,1,'site','เปิดเว็บไซต์','site_open','0','select','กำหนดว่าจะเปิดหรือปิดเว็บไซต์',1), (384,1,5,'replay','ลำดับชั้น','replay_floor_nickname','โซฟา\r\nม้านั่ง\r\nพื้น','textarea','เริ่มจากโซฟาลงไปเรื่อย ๆ ไม่มีขีดจำกัดชั้น',23), (385,1,5,'replay','ชื่อชั้น','replay_floor_name','ชั้น','input','ชื่อของชั้น : อาทิเช่น "ชั้น"',24), (386,1,3,'novel','เปรียบเทียบบท','chapter_compare','2','select','การตรวจสอบบทที่อาจจะมีเนื้อหาซ้ำกัน',41), (387,1,3,'novel','ความคล้ายคลึง','chapter_compare_number','70','input','ค่าความคล้ายคลึงของเนื้อหาว่าเหมือนกันขนาดไหน',42), (393,1,3,'novel','ประวัติการอ่าน','read_open','1','select','กำหนดว่าจะเปิดให้มีการประวัติการอ่านหรือไม่',43), (394,1,4,'user','ส่วนติดต่อการผูกบัญชี','api_login_bind','0','select','กำหนดว่าการเข้าสู่ระบบผ่านบุคคลที่สามจำเป็ฯต้องผูกบัญชีบนเว็บไซต์หรือไม่',50), (395,1,1,'domain','การรับรองชื่อโดเมนพื้นหลัง','admin_domain_access','0','select','การเข้าสู่ระบบพื้นหลังต้องเข้าผ่านชื่อโดเมนนี้เท่านั้น',14), (397,1,3,'novel','การเข้ารหัสไฟล์นิยาย','novel_en_str','','input','กำหนดสตริงในการเข้ารหัสชื่ิอไฟล์นิยาย',5), (396,1,1,'system','โปรโตคอลเครือข่าย','tcp_type','http','select','ประเภทโปรโตคอล TCP สำหรับเข้าถึงเครือข่าย',2), (398,1,1,'upload','เปิดการอัปโหลด','upload_open','1','select','กำหนดว่าจะเปิดให้ทำการอัปโหลดจากส่วนหน้าขึ้นบนเว็บไซต์หรือไม่',0), (399,1,1,'code','ขีดจำกัดการเข้าสู่ระบบพื้นหลัง','admin_login_error_number','5','input','ขีดจำกัดในการเข้าสู่ระบบที่ผิดพลาดได้สูงสุด',1), (400,1,1,'code','ระยะเวลาที่เข้าสู่ระบบพื้นหลัง','admin_login_error_time','1440','input','ระยะเวลาที่จะปิดกั้นการเข้าสู่ระบบเมื่อเกินขีดจำกัด',1), (401,1,1,'code','ขีดจำกัดการเข้าสู่ระบบผู้ใช้','user_login_error_number','5','input','ขีดจำกัดในการเข้าสู่ระบบที่ผิดพลาดได้สูงสุด',3), (402,1,1,'code','ระยะเวลาที่เข้าสู่ระบบผู้ใช้','user_login_error_time','1440','input','ระยะเวลาที่จะปิดกั้นการเข้าสู่ระบบเมื่อเกินขีดจำกัด',3), (403,1,6,'link','โหมดลิ้งก์ขาออกสาธารณะ','link_url_outtype','1','select','โหมดลิ้งก์ขาออกสาธารณะ',1), (404,1,14,'zt','พารามิเตอร์ตรวจสอบหน้ากระทู้','par_zt','1','radio','เลือกตรวจสอบพารามิเตอร์หน้ากระทู้ทั้งหมดว่าถูกต้องหรือไม่',1), (405,1,14,'zt','พารามิเตอร์ตรวจสอบหน้าความคิดเห็น','par_replay','1','radio','เลือกตรวจสอบพารามิเตอร์หน้าความคิดเห็นทั้งหมดว่าถูกต้องหรือไม่',2), (406,1,14,'zt','เปิดการแสดงความรู้สึก','dingcai_open','0','select','กำหนดว่าจะเปิดให้แสดงความรู้สึกต่อกระทู้หรือไม่',11), (407,1,14,'zt','เข้าสู่ระบบเพื่อแสดงความรู้สึก','dingcai_login','1','select','กำหนดว่าจำเป็นต้องเข้าสู่ระบบเพื่อแสดงความรู้สึกต่อกระทู้หรือไม่',12), (408,1,14,'zt','ขีดจำกัดการแสดงความรู้สึก','dingcai_count','2','input','ขีดจำกัดการแสดงความรู้สึกต่อกระทู้ในแต่ละวัน',13), (409,1,14,'zt','เปิดการให้คะแนน','score_open','0','select','กำหนดว่าจะเปิดการให้คะแนนหรือไม่',14), (410,1,14,'zt','เข้าสู่ระบบเพื่อให้คะแนน','score_login','1','select','กำหนดว่าจำเป็นต้องเข้าสู่ระบบเพื่อให้คะแนนหรือไม่',15), (411,1,14,'zt','ขีดจำกัดการให้คะแนน','score_count','1','input','ขีดจำกัดการให้คะแนนกระทู้ในแต่ละวัน',16), (412,1,14,'zt','เปิดการแสดงความคิดเห็น','replay_open','0','select','กำหนด่าจะเปิดให้แสดงความคิดเห็นต่อกระทู้หรือไม่',17), (413,1,14,'zt','เข้าสู่ระบบเพื่อแสดงความคิดเห็น','replay_login','1','select','กำหนดว่าจำเป็นต้องเข้าสู่ระบบเพื่อแสดงความคิดเห็นหรือไม่',18), (414,1,15,'urlmode','พารามิเตอร์สัญลักษณ์ที่ใช้แบ่งลิ้งก์','urlmode_exp','/','input','พารามิเตอร์สัญลักษณ์ที่ใช้แบ่งลิ้งก์',3), (415,1,15,'urlmode','คำต่อท้ายลิ้งก์','urlmode_suffix','.html','input','คำต่อท้ายลิ้งก์ ปล่อยว่างได้',4), (416,1,15,'urlmode','ชื่อพารามิเตอร์โมดูลโหมดปกติ','urlmode_par_odnr1','module','input','ชื่อพารามิเตอร์โมดูลในโหมดปกติ',5), (417,1,15,'urlmode','ชื่อพารามิเตอร์ไฟล์โหมดปกติ','urlmode_par_odnr2','file','input','ชื่อพารามิเตอร์ไฟล์ในโหมดปกติ',6), (418,1,15,'urlmode','ชื่อพารามิเตอร์โหมดเข้ากันได้','urlmode_par_cptb','path','input','ชื่อพารามิเตอร์ในโหมดเข้ากันได้',7), (419,1,15,'urlmode','กำหนดเส้นทางลิ้งก์','urlmode_route','','textarea','การจับคู่เส้นทางพารามิเตอร์ลิ้งก์',8), (420,1,2,'article','วิธีจัดเก็บข้อมูล','data_save_type','2','radio','วิธีจัดเก็บข้อมูลบทความ',17), (421,1,2,'article','ที่ตั้งที่ใช้จัดเก็บ','data_save_path','/files/txt/article/{#123}tid{#125}/{#123}aid{#125}.txt','input','ที่ตั้งที่ใช้จัดเก็บบทความ',18), (422,1,1,'upload','สร้างรูปย่ออัตโนมัติ','upload_simg','1','select','กำหนดว่าจะเปิดใช้การสร้างรูปย่ออัตโนมัติหรือไม่',8), (423,1,1,'upload','ความกว้างที่จะสร้างรูปย่อ','upload_simg_width','900','input','ขนาดความกว้างของต้นฉบับที่จะสร้างรูปย่อ',9), (424,1,1,'upload','ความสูงที่จะสร้างรูปย่อ','upload_simg_height','600','input','ขนาดความสูงของต้นฉบับที่จะสร้างรูปย่อ',10), (425,1,1,'upload','ความกว้างรูปย่อ','upload_simgwidth','540','input','ความกว้างรูปย่อที่สร้าง',11), (426,1,1,'upload','ความสูงรูปย่อ','upload_simgheight','370','input','ความสูงรูปย่อที่สร้าง',12), (427,1,5,'replay','โหมดแสดงความคิดเห็น','replay_type','1','select','โหมดแสดงรายการความคิดเห็น',25), (428,1,5,'replay','จำนวนเริ่มต้นการตอบกลับ','replay_replay_number','5','input','จำนวนเริ่มต้นในการแสดงการตอบกลับในแต่ละความคิดเห็น',26), (429,1,5,'replay','จำนวนความคิดเห็นต่อหน้า','replay_replay_page','10','input','จำนวนความคิดเห็นที่จะแสดงต่อหน้า',27), (430,1,5,'replay','วิธีเรียงลำดับ','replay_replay_order','replay_time','select','วิธีในการเรียงลำดับจำนวนการตอบกลับความคิดเห็น',28);

/*Table structure for table `wm_config_field` */
DROP TABLE IF EXISTS `wm_config_field`;

CREATE TABLE `wm_config_field` (`field_id` int(4) NOT NULL AUTO_INCREMENT,
 `field_name` varchar(20) DEFAULT NULL COMMENT '字段名字',
 `field_module` varchar(20) NOT NULL COMMENT '所属模块',
 `field_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为分类字段，2为内容字段',
 `field_type_id` int(4) NOT NULL COMMENT '所属分类的id',
 `field_type_child` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否对子级分类有效',
 `field_type_pids` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类的级别关系',
 `field_option` varchar(2000) NOT NULL COMMENT '选项',
 PRIMARY KEY (`field_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='自建字段表';

/*Data for the table `wm_config_field` */ /*Table structure for table `wm_config_field_value` */
DROP TABLE IF EXISTS `wm_config_field_value`;

CREATE TABLE `wm_config_field_value` (`value_id` int(4) NOT NULL AUTO_INCREMENT,
 `value_field_id` int(4) NOT NULL COMMENT '选项的id',
 `value_field_module` varchar(20) DEFAULT NULL COMMENT '值的模块',
 `value_field_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '值的类型',
 `value_content_id` int(4) NOT NULL DEFAULT '0' COMMENT '内容的id，默认为0',
 `field_option` varchar(2000) DEFAULT NULL COMMENT '选项的标题',
 `value_option` varchar(2000) NOT NULL COMMENT '选项的值',
 PRIMARY KEY (`value_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='自建字段的值';

/*Data for the table `wm_config_field_value` */ /*Table structure for table `wm_config_group` */
DROP TABLE IF EXISTS `wm_config_group`;

CREATE TABLE `wm_config_group` (`group_id` int(4) NOT NULL AUTO_INCREMENT,
 `group_name` varchar(10) DEFAULT NULL COMMENT '分组的名',
 `group_remark` varchar(50) DEFAULT NULL COMMENT '分组备注信息',
 PRIMARY KEY (`group_id`)) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT
CHARSET=utf8 COMMENT='配置分组';

/*Data for the table `wm_config_group` */
INSERT INTO `wm_config_group`(`group_id`, `group_name`, `group_remark`) VALUES (1,'web','กลุ่มกำหนดค่าระบบ'), (2,'article','กลุ่มกำหนดค่าบทความ'), (3,'novel','กลุ่มกำหนดค่านิยาย'), (4,'user','กลุ่มกำหนดค่าผู้ใช้'), (5,'replay','กลุ่มกำหนดค่าความคิดเห็น'), (6,'link','กลุ่มกำหนดค่าลิ้งก์พันธมิตร'), (7,'picture','กลุ่มกำหนดค่ารูปภาพ'), (8,'app','กลุ่มกำหนดค่าแอปฯ'), (9,'bbs','กลุ่มกำหนดค่าบอร์ด'), (10,'message','กลุ่มกำหนดค่าข้อความ'), (11,'author','กลุ่มกำหนดค่านักเขียน'), (12,'finance','กลุ่มกำหนดค่าการเงิน'), (13,'site','กลุ่มกำหนดค่าเว็บไซต์'), (14,'zt','กลุ่มกำหนดกระทู้'), (15,'route','กลุ่มกำหนดค่าเส้นทาง');

/*Table structure for table `wm_config_label` */
DROP TABLE IF EXISTS `wm_config_label`;

CREATE TABLE `wm_config_label` (`label_id` int(4) NOT NULL AUTO_INCREMENT,
 `label_title` varchar(20) DEFAULT NULL COMMENT '标签标题',
 `label_name` varchar(20) DEFAULT NULL COMMENT '标签名字',
 `label_value` varchar(500) DEFAULT NULL COMMENT '标签的值',
 PRIMARY KEY (`label_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='自定义标签表';

/*Data for the table `wm_config_label` */ /*Table structure for table `wm_config_option` */
DROP TABLE IF EXISTS `wm_config_option`;

CREATE TABLE `wm_config_option` (`option_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
 `config_id` int(4) DEFAULT '0' COMMENT '配置的id',
 `option_title` varchar(50) DEFAULT NULL COMMENT '选项标题',
 `option_value` varchar(50) DEFAULT NULL COMMENT '选项的值',
 `option_order` int(4) DEFAULT '9' COMMENT '选项的排序',
 PRIMARY KEY (`option_id`)) ENGINE=MyISAM AUTO_INCREMENT=387 DEFAULT
CHARSET=utf8 COMMENT='系统配置选项';

/*Data for the table `wm_config_option` */
INSERT INTO `wm_config_option`(`option_id`, `config_id`, `option_title`, `option_value`, `option_order`) VALUES (1,7,'เปิดเว็บไซต์','1',1), (2,7,'ปิดเว็บไซต์','0',2), (3,13,'เปิดใช้รูปแบบลิ้งก์','2',2), (4,13,'ปิดใช้รูปแบบลิ้งก์','1',1), (5,57,'เปิดใช้โค้ดยืนยัน','1',1), (6,57,'ปิดใช้โค้ดยืนยัน','0',2), (7,73,'Chinese-simplified','zh_cn',1), (8,67,'ปิดใช้การครอบตัดอัตโนมัติ','0',1), (9,67,'เปิดใช้การครอบตัดอัตโนมัติ','1',2), (10,60,'ปิดใช้ลายน้ำ','0',1), (11,60,'เปิดใช้ลายน้ำ','1',2), (12,63,'รูปภาพลายน้ำ','img',1), (13,63,'ข้อความลายน้ำ','text',2), (14,75,'ห้ามเข้าถึงผ่านพร็อกซี่','0',1), (15,75,'อนุญาตให้เข้าถึงผ่านพร็อกซี่','1',2), (16,77,'เปิดใช้สถิติ','1',1), (17,77,'ปิดใช้สถิติ','0',2), (18,78,'เปิดใช้การบันทึก','1',1), (19,78,'ไม่บันทึก','0',2), (35,80,'ปิดการตรวจสอบ','0',1), (34,80,'เปิดการตรวจสอบ','1',0), (25,79,'เปิดการตรวจสอบ','1',1), (26,79,'ปิดการตรวจสอบ','0',2), (36,81,'ไม่ต้องตรวจสอบ','0',2), (37,81,'ตรวจสอบ','1',1), (38,82,'ปิดการส่ง','0',1), (39,82,'เปิดการส่ง','1',2), (40,84,'เปิดการค้นหา','1',0), (41,84,'ปิดการค้นหา','0',1), (42,86,'เปิดให้แสดงความรู้สึก','1',1), (43,86,'ปิดการแสดงความรู้สึก','0',2), (44,88,'ปิดการบันทึกข้อผิดพลาด','0',2), (45,88,'เปิดการบันทึกข้อผิดพลาด','1',1), (46,89,'ลบลงถังขยะ','0',1), (47,89,'ลบถาวร','1',2), (48,90,'ปิดการแสดงความคิดเห็น','0',2), (49,90,'เปิดการแสดงความคิดเห็น','1',1), (50,91,'ต้องเข้าสู่ระบบ','1',2), (51,91,'ไม่ต้องเข้าสู่ระบบ','0',1), (52,92,'เปิดการตรวจสอบ','1',2), (53,92,'ปิดการตรวจสอบ','0',1), (54,93,'เปิดการตรวจสอบ','1',2), (55,93,'ปิดการตรวจสอบ','0',1), (56,94,'เปิดการตรวจสอบ','1',2), (57,94,'ปิดการตรวจสอบ','0',1), (58,95,'เปิดการตรวจสอบ','1',2), (59,95,'ปิดการตรวจสอบ','0',1), (60,101,'เริ่มเมื่อ','2',2), (61,101,'เปิดตัวครั้งแรก','1',1), (62,102,'สร้างไฟล์ TXT','1',1), (63,102,'จัดเก็บโดยตรง','2',2), (64,103,'ปิดการดาวน์โหลดนิยาย','0',2), (65,103,'เปิดการดาวน์โหลดนิยาย','1',1), (66,99,'รอดำเนินการ','0',2), (67,99,'ผ่านแล้ว','1',1), (68,100,'รอดำเนินการ','0',2), (69,100,'ผ่านแล้ว','1',1), (70,108,'เข้าส่ระบบเพื่อดู','1',2), (71,108,'ไม่ต้องเข้าสู่ระบบ','0',1), (73,109,'เหรียญ 2','2',2), (72,109,'เหรียญ 1','1',1), (74,111,'เปิดให้แสดงความรู้สึก','0',1), (75,111,'ปิดการแสดงความรู้สึก','1',2), (76,114,'ปิดการให้คะแนน','0',1), (77,114,'เปิดการให้คะแนน','1',2), (78,115,'ต้องเข้าสู่ระบบ','1',1), (79,115,'ไม่ต้องเข้าสู่ระบบ','0',2), (80,116,'เปิดให้แสดงความคิดเห็น','1',2), (81,116,'ปิดให้แสดงความคิดเห็น','0',1), (82,117,'ไม่ต้องเข้าสู่ระบบ','0',1), (83,117,'ต้องเข้าสู่ระบบ','1',2), (84,118,'ปิดการเก็บเข้าคลัง','0',1), (85,118,'เปิดการเก็บเข้าคลัง','1',2), (86,119,'เปิดการแนะนำ','1',2), (87,119,'ปิดการแนะนำ','0',1), (88,120,'เปิดการสมัคร','1',2), (89,120,'ปิดการสมัคร','0',1), (251,311,'เปิดการเติมเงิน','1',2), (250,311,'ปิดการเติมเงิน','0',1), (92,122,'ปิดการค้นหา','0',1), (93,122,'เปิดการค้นหา','1',2), (94,124,'แสดงรายการ','0',1), (95,124,'หน้ากระโดด','1',2), (96,125,'ปิดชั้นหนังสือ','0',1), (97,125,'เปิดชั้นหนังสือ','1',2), (98,126,'เปิดให้ลงทะเบียน','1',1), (99,126,'ปิดการลงทะเบียน','0',2), (100,127,'ปิดการเข้าสู่ระบบ','0',2), (101,127,'เปิดการเข้าสู่ระบบ','1',1), (102,128,'เปิดการบันทึก','1',2), (103,128,'ปิดการบันทึก','0',1), (104,129,'อวตาลเริ่มต้น','0',2), (105,129,'สุ่มอวตาล','1',1), (106,131,'สถานะปกติ','1',2), (107,131,'รอดำเนินการ','0',1), (108,147,'เปิดการตรวจสอบ','1',2), (109,147,'ไม่ต้องตรวจสอบ','0',1), (110,148,'เปิดการตรวจสอบ','1',2), (111,148,'ไม่ต้องตรวจสอบ','0',1), (112,149,'เปิดการเช็คชื่อ','1',2), (113,149,'ปิดการเช็คชื่อ','0',1), (114,150,'ปิดการให้รางวัลเมื่อเช็คชื่อ','0',2), (115,150,'เปิดการให้รางวัลเมื่อเช็คชื่อ','1',1), (116,154,'เปิดการแสดงความคิดเห็น','1',2), (117,154,'ปิดการแสดงความคิดเห็น','0',1), (118,155,'เปิดการตั้งค่าแบบรวม','1',2), (119,155,'ปิดการตั้งค่าแบบรวม','0',1), (120,156,'แสดงความคิดเห็นโดยไม่ต้องเข้าสู่ระบบ','0',2), (121,156,'ต้องเข้าสู่ระบบเพื่อแสดงความคิดเห็น','1',1), (122,157,'สถานะตรวจสอบ','0',1), (123,157,'สถานะผ่าน','1',2), (124,160,'ปิดการแสดงความรู้สึก','0',2), (125,160,'เปิดให้แสดงความรู้สึก','1',1), (126,170,'ปิดความคิดเห็นยอดนิยม','0',2), (127,170,'แสดงความเห็นยอดนิยม','1',1), (128,175,'เปิดการตรวจสอบ','1',2), (129,175,'ปิดการตรวจสอบ','0',1), (130,176,'ปิดการลงทะเบียน','0',2), (131,176,'เปิดการลงทะเบียน','1',1), (132,177,'เปลี่ยนโดยตรง','0',1), (133,177,'ไปยังหน้ารายละเอียด','1',2), (134,179,'ปิดการตรวจสอบ','0',2), (135,179,'เปิดการตรวจสอบ','1',1), (136,180,'เวลาบันทึกไม่จำกัด','0',2), (137,180,'บันทึกเฉพาะไอพีเดียวกันต่อวัน','1',1), (138,181,'เปิดการบันทึกการดู','1',1), (139,181,'ปิดการบันทึกการดู','0',2), (140,182,'ปิดสถิติไอพี','0',1), (141,182,'เปิดสถิติไอพี','1',2), (142,183,'ปิดสถิติลิ้งก์','0',1), (143,183,'เปิดสถิติลิ้งก์','1',2), (144,184,'ไม่ต้องตรวจสอบ','1',1), (145,184,'ต้องตรวจสอบ','0',2), (146,185,'สถานะปกติ','1',1), (147,185,'รอตรวจสอบ','0',2), (148,187,'ปิดการตรวจสอบ','0',1), (149,187,'เปิดการตรวจสอบ','1',2), (150,188,'เปิดการตรวจสอบ','1',2), (151,188,'ปิดการตรวจสอบ','0',1), (152,189,'ไม่ต้องตรวจสอบ','1',1), (153,189,'ต้องตรวจสอบ','0',2), (154,190,'ไม่ต้องตรวจสอบ','1',2), (155,190,'ต้องตรวจสอบ','0',1), (156,191,'เปิดให้แสดงความรู้สึก','1',1), (157,191,'ปิดให้แสดงความรู้สึก','0',2), (158,192,'ปิดการให้คะแนน','0',2), (159,192,'เปิดการให้คะแนน','1',1), (160,193,'ปิดการแสดงความคิดเห็น','0',2), (161,193,'เปิดการแสดงความคิดเห็น','1',1), (162,194,'ต้องเข้าสู่ระบบ','1',1), (163,194,'ไม่ต้องเข้าสู่ระบบ','0',2), (164,195,'เปิดการค้นหา','1',1), (165,195,'ปิดการค้นหา','0',2), (166,199,'ผู้เยี่ยมชมแสดงความคิดเห็นได้','0',2), (167,199,'เข้าสู่ระบบเพื่อแสดงความคิดเห็น','1',1), (168,200,'ปิดการตรวจสอบ','0',1), (169,200,'เปิดการตรวจสอบ','1',2), (170,201,'เปิดการตรวจสอบ','1',2), (171,201,'ปิดการตรวจสอบ','0',1), (172,204,'ไม่ต้องตรวจสอบ','1',1), (173,204,'ต้องตรวจสอบ','0',2), (174,205,'เปิดการดาวน์โหลด','1',2), (175,205,'ปิดการดาวน์โหลด','0',1), (176,206,'เปิดให้แสดงความรู้สึก','1',1), (177,206,'ปิดให้แสดงความรู้สึก','0',2), (178,208,'ปิดการให้คะแนน','0',2), (179,208,'เปิดการให้คะแนน','1',1), (180,211,'ปิดการแสดงความคิดเห็น','0',2), (181,211,'เปิดการแสดงความคิดเห็น','1',1), (182,212,'ต้องเข้าสู่ระบบ','1',1), (183,212,'ไม่ต้องเข้าสู่ระบบ','0',2), (184,213,'เปิดการค้นหา','1',1), (185,213,'ปิดการค้นหา','0',2), (186,215,'ปิดการตรวจสอบ','0',1), (187,215,'เปิดการตรวจสอบ','1',2), (188,216,'ปิดการตรวจสอบ','0',1), (189,216,'เปิดการตรวจสอบ','1',2), (190,217,'นักเขียนดูได้','1',1), (191,217,'นักเขียนดูไม่ได้','0',2), (192,218,'นักเขียนแก้ไขได้','1',1), (193,218,'นักเขียนแก้ไขไม่ได้','0',2), (194,219,'นักเขียนลบได้','1',1), (195,219,'นักเขียนลบไม่ได้','0',2), (196,220,'ไม่ต้องตรวจสอบ','1',1), (197,220,'ต้องตรวจสอบ','0',2), (198,221,'ไม่ต้องตรวจสอบ','1',1), (199,221,'ต้องตรวจสอบ','0',2), (200,222,'ไม่ต้องตรวจสอบ','1',1), (201,222,'ต้องตรวจสอบ','0',2), (202,223,'เปิดการโพสต์','1',1), (203,223,'ปิดการโพสต์','0',2), (227,268,'กระโดดไปศูนย์ผู้ใช้','jump',2), (206,237,'เปิดการค้นหา','1',1), (207,237,'ปิดการค้นหา','0',2), (208,243,'MYSQL','mysql',1), (209,244,'เปิดข้อความ','1',1), (210,244,'ปิดข้อความ','0',2), (211,210,'ไม่ต้องเข้าสู่ระบบ','0',1), (212,210,'ต้องเข้าสู่ระบบ','1',2), (213,250,'ปิดแคช','0',1), (214,250,'เปิดแคช','1',2), (215,251,'แคชไฟล์','file',1), (216,251,'แคช Redis','redis',2), (217,251,'แคช Memcached','memcached',3), (218,261,'แคชหน้าเว็บ','page',1), (219,261,'แคชบล็อก','block',2), (220,262,'ปิดแคช SQL','0',1), (221,262,'เปิดแคช SQL','1',2), (222,265,'ปิดแคชการเรียก','0',1), (223,265,'เปิดแคชการเรียก','1',2), (226,268,'รีเฟรชหน้าปัจจุบัน','ref',1), (225,389,'แคชไฟล์','file',1), (204,224,'เปิดการตอบกลับ','1',1), (205,224,'ปิดการตอบกลับ','0',2), (228,269,'ตรวจด้วยตัวเอง','0',1), (229,269,'ตรวจอัตโนมัติ','1',2), (230,270,'ปิดการลงทะเบียน','0',1), (231,270,'เปิดการลงทะเบียน','1',2), (232,274,'ตรวจสอบอัตโนมัติ','1',2), (233,274,'ตรวจด้วยตัวเอง','0',1), (234,275,'ตรวจด้วยตัวเอง','0',1), (235,275,'ตรวจสอบอัตโนมัติ','1',2), (236,278,'ตรวจด้วยตัวเอง','0',1), (237,278,'ตรวจสอบอัตโนมัติ','1',2), (238,285,'ตรวจด้วยตัวเอง','0',1), (239,285,'ตรวจสอบอัตโนมัติ','1',2), (240,286,'ตรวจด้วยตัวเอง','0',1), (241,286,'ตรวจสอบอัตโนมัติ','1',2), (242,293,'ตรวจด้วยตัวเอง','0',1), (243,293,'ตรวจสอบอัตโนมัติ','1',2), (244,294,'ตรวจด้วยตัวเอง','0',1), (245,294,'ตรวจสอบอัตโนมัติ','1',2), (246,301,'เส้นทางแบบไดนามิก','0',1), (247,301,'เส้นทางแบบคงที่','1',2), (248,302,'เปิดการอัปโหลดอัตโนมัติ','1',1), (249,302,'ปิดการอัปโหลดอัตโนมัติ','0',2), (252,312,'ปิดการแลกเปลี่ยน','0',1), (253,312,'เปิดการแลกเปลี่ยน','1',2), (254,313,'ปิดการแลกเปลี่ยน','0',1), (255,313,'เปิดการแลกเปลี่ยน','1',2), (256,314,'ปิดการแลกเปลี่ยน','0',1), (257,314,'เปิดการแลกเปลี่ยน','1',2), (258,315,'ปิดการแลกเปลี่ยน','0',1), (259,315,'เปิดการแลกเปลี่ยน','1',2), (260,316,'ปิดการถอน','0',1), (261,316,'เปิดการถอน','1',2), (262,121,'ปิดรางวัลเหรียญ','0',1), (263,121,'เปิดรางวัลเหรียญ','1',2), (264,334,'ปิดใช้ของขวัญ','0',1), (265,334,'เปิดใช้ของขวัญ','1',2), (266,335,'ไม่ต้องเข้าสู่ระบบ','0',1), (267,335,'ต้องเข้าสู่ระบบ','1',2), (268,336,'คำแนะนำป้ายกำกับ','1',1), (269,336,'หน้าต่างข้อผิดพลาดทั่วไป','2',2), (270,339,'ปิดกิจกรรม','0',1), (271,339,'เปิดกิจกรรม','1',2), (272,344,'จัดเก็บภายใน','0',1), (273,344,'Alibaba Cloud OSS','oss',2), (274,344,'Tencent Cloud COS','cos',3), (275,344,'Qiniu Cloud','qiniu',4), (276,344,'Sina Cloud','scs',5), (277,346,'ปิดการให้คะแนน','0',1), (278,346,'เปิดการให้คะแนน','1',2), (279,347,'ไม่ต้องเข้าสู่ระบบ','0',1), (280,347,'ต้องเข้าสู่ระบบ','1',2), (281,348,'ไม่ต้องเข้าสู่ระบบ','0',1), (282,348,'ต้องเข้าสู่ระบบ','1',2), (283,350,'ไม่ต้องเข้าสู่ระบบ','0',1), (284,350,'ต้องเข้าสู่ระบบ','1',2), (285,351,'กระโดดอัตโนมัติ','1',1), (286,351,'ไม่ต้องกระโดด','0',2), (287,352,'เปิดโค้ดยืนยัน','1',1), (288,352,'ปิดโค้ดยืนยัน','0',2), (289,353,'เปิดโค้ดยืนยัน','1',1), (290,353,'ปิดโค้ดยืนยัน','0',2), (291,354,'เปิดโค้ดยืนยัน','1',1), (292,354,'ปิดโค้ดยืนยัน','0',2), (293,355,'เปิดโค้ดยืนยัน','1',1), (294,355,'ปิดโค้ดยืนยัน','0',2), (295,356,'เปิดโค้ดยืนยัน','1',1), (296,356,'ปิดโค้ดยืนยัน','0',2), (297,357,'เปิดโค้ดยืนยัน','1',1), (298,357,'ปิดโค้ดยืนยัน','0',2), (299,358,'เปิดโค้ดยืนยัน','1',1), (300,358,'ปิดโค้ดยืนยัน','0',2), (301,360,'โค้ดยืนยันทั่วไป','1',1), (302,360,'โค้ดยืนยันแบบคำนวณ','2',2), (303,360,'โค้ดยืนยันแบบถามตอบ','3',3), (304,361,'โค้ดยืนยันทั่วไป','1',1), (305,361,'โค้ดยืนยันแบบคำนวณ','2',2), (306,361,'โค้ดยืนยันแบบถามตอบ','3',3), (307,362,'โค้ดยืนยันทั่วไป','1',1), (308,362,'โค้ดยืนยันแบบคำนวณ','2',2), (309,362,'โค้ดยืนยันแบบถามตอบ','3',3), (310,363,'โค้ดยืนยันทั่วไป','1',1), (311,363,'โค้ดยืนยันแบบคำนวณ','2',2), (312,363,'โค้ดยืนยันแบบถามตอบ','3',3), (313,364,'โค้ดยืนยันทั่วไป','1',1), (314,364,'โค้ดยืนยันแบบคำนวณ','2',2), (315,364,'โค้ดยืนยันแบบถามตอบ','3',3), (316,365,'โค้ดยืนยันทั่วไป','1',1), (317,365,'โค้ดยืนยันแบบคำนวณ','2',2), (318,365,'โค้ดยืนยันแบบถามตอบ','3',3), (319,366,'โค้ดยืนยันทั่วไป','1',1), (320,366,'โค้ดยืนยันแบบคำนวณ','2',2), (321,366,'โค้ดยืนยันแบบถามตอบ','3',3), (322,367,'โค้ดยืนยันทั่วไป','1',1), (323,367,'โค้ดยืนยันแบบคำนวณ','2',2), (324,367,'โค้ดยืนยันแบบถามตอบ','3',3), (325,379,'ไม่ต้องสร้าง HTML','0',1), (326,379,'สร้าง HTML','1',2), (327,380,'ไม่ต้องสร้าง HTML','0',1), (328,380,'สร้าง HTML','1',2), (329,381,'ไม่ต้องสร้าง HTML','0',1), (330,381,'สร้าง HTML','1',2), (331,382,'หลัก/โดเมนย่อยเดี่ยว','0',1), (332,382,'หลัก/โดเมนย่อยแบบแบ่งปัน','1',2), (333,383,'ปิดโหมดกลุ่มโมดูล','0',1), (334,383,'เปิดโหมดกลุ่มโมดูล','1',2), (335,28,'ปิดการส่งบันทึก','0',1), (336,386,'เปรียบเทียบเฉพาะชื่อบท','1',1), (337,386,'เปรียบเทียบชื่อบทและเนื้อหา','2',2), (340,28,'เปิดการส่งบันทึก','1',2), (341,389,'แคช Redis','redis',2), (342,389,'แคช Memcached','memcached',3), (343,390,'แคชไฟล์','file',1), (344,390,'แคช Redis','redis',2), (345,390,'แคช Memcached','memcached',3), (346,393,'ปิดประวัติการอ่าน','0',1), (347,393,'เปิดประวัติการอ่าน','1',2), (348,394,'บังคับผูกบัญชี','1',1), (349,394,'สร้างบัญชีอัตโนมัติ','0',2), (350,395,'ปิดการรับรองโดเมน','0',1), (351,395,'เปิดการรับรองโดเมน','1',2), (352,396,'HTTP','http',1), (353,396,'HTTPS','https',2), (354,398,'ปิดการอัพโหลด','0',1), (355,398,'เปิดการอัพโหลด','1',2), (356,403,'กระโดดออกโดยตรง','1',1), (357,403,'ไปยังหน้ารายละเอียด','2',2), (358,404,'เปิดการตรวจสอบ','1',1), (359,404,'ปิดการตรวจสอบ','0',2), (360,405,'เปิดการตรวจสอบ','1',1), (361,405,'ปิดการตรวจสอบ','0',2), (362,406,'เปิดให้แสดงความรู้สึก','1',1), (363,406,'ปิดการแสดงความรู้สึก','0',2), (364,407,'ต้องเข้าสู่ระบบ','1',1), (365,407,'ไม่ต้องเข้าสู่ระบบ','0',2), (366,409,'เปิดการให้คะแนน','1',1), (367,409,'ปิดการให้คะแนน','0',2), (368,410,'ต้องเข้าสู่ระบบ','1',1), (369,410,'ไม่ต้องเข้าสู่ระบบ','0',2), (370,412,'เปิดให้แสดงความคิดเห็น','1',1), (371,412,'ปิดให้แสดงความคิดเห็น','0',2), (372,413,'ต้องเข้าสู่ระบบ','1',1), (373,413,'ไม่ต้องเข้าสู่ระบบ','0',2), (374,13,'โหมดปกติ','3',3), (375,13,'โหมดเข้ากันได้','4',4), (376,13,'โหมดข้อมูลที่ตั้ง','5',5), (377,13,'โหมด REWRITE','6',6), (378,420,'จัดเก็บลงฐานข้อมูล','1',1), (379,420,'จัดเก็บเป็นไฟล์','2',2), (380,422,'ปิดการสร้างอัตโนมัติ','0',1), (381,422,'เปิดการสร้างอัตโนมัติ','1',2), (382,427,'โหมดรายการ','1',1), (383,427,'โฆมดกระทู้','2',2), (384,430,'ล่าสุด','replay_time',1), (385,430,'ยอดนิยม','replay_ding',2), (386,430,'ตามลำดับ','replay_id',3);

/*Table structure for table `wm_diy_diy` */
DROP TABLE IF EXISTS `wm_diy_diy`;

CREATE TABLE `wm_diy_diy` (`diy_id` int(4) NOT NULL AUTO_INCREMENT,
 `diy_status` tinyint(1) DEFAULT '1' COMMENT '自定义页面的状态',
 `diy_read` int(4) DEFAULT '0' COMMENT '阅读量',
 `diy_name` varchar(20) NOT NULL COMMENT '自定义页面名字',
 `diy_pinyin` varchar(20) NOT NULL COMMENT '拼音',
 `diy_title` varchar(100) DEFAULT NULL COMMENT '标题',
 `diy_key` varchar(120) DEFAULT NULL COMMENT '关键字',
 `diy_desc` varchar(150) DEFAULT NULL COMMENT '描述',
 `diy_content` varchar(2000) NOT NULL COMMENT '内容',
 `diy_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间',
 `diy_ctempid` int(4) DEFAULT '0' COMMENT '专题的模版id',
 PRIMARY KEY (`diy_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='自定义页面表';

/*Data for the table `wm_diy_diy` */ /*Table structure for table `wm_fans_module` */
DROP TABLE IF EXISTS `wm_fans_module`;

CREATE TABLE `wm_fans_module` (`fans_id` int(4) NOT NULL AUTO_INCREMENT,
 `fans_module` varchar(20) DEFAULT NULL COMMENT '所属模块',
 `fans_user_id` int(4) NOT NULL COMMENT '粉丝id',
 `fans_cid` int(4) DEFAULT NULL COMMENT '内容id',
 `fans_exp` int(4) DEFAULT '0' COMMENT '粉丝经验值',
 `fans_addtime` int(4) DEFAULT NULL COMMENT '关注时间',
 PRIMARY KEY (`fans_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='模块内容粉丝表。';

/*Data for the table `wm_fans_module` */ /*Table structure for table `wm_fans_module_consume` */
DROP TABLE IF EXISTS `wm_fans_module_consume`;

CREATE TABLE `wm_fans_module_consume` (`consume_id` int(4) NOT NULL AUTO_INCREMENT,
 `consume_module` varchar(20) DEFAULT NULL COMMENT '消费的模块',
 `consume_user_id` int(4) DEFAULT NULL COMMENT '用户id',
 `consume_cid` int(4) DEFAULT NULL COMMENT '内容id',
 `consume_gold1_exp` decimal(10, 2) DEFAULT '0.00' COMMENT '粉丝经验值当前累积消费金币1',
 `consume_gold2_exp` decimal(10, 2) DEFAULT '0.00' COMMENT '粉丝经验值当前累积消费金币2',
 `consume_gold1_ticket` decimal(10, 2) DEFAULT '0.00' COMMENT '票类当前阶段累积的消费金币1',
 `consume_gold2_ticket` decimal(10, 2) DEFAULT '0.00' COMMENT '票类当前阶段累积的消费金币2',
 `consume_gold1` decimal(15, 2) DEFAULT '0.00' COMMENT '总共消费的金币1',
 `consume_gold2` decimal(15, 2) DEFAULT '0.00' COMMENT '总共消费的金币2',
 PRIMARY KEY (`consume_id`), KEY `user_index` (`consume_module`, `consume_user_id`, `consume_cid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='模块内容粉丝消费记录表';

/*Data for the table `wm_fans_module_consume` */ /*Table structure for table `wm_fans_module_level` */
DROP TABLE IF EXISTS `wm_fans_module_level`;

CREATE TABLE `wm_fans_module_level` (`level_id` int(4) NOT NULL AUTO_INCREMENT,
 `level_module` varchar(20) NOT NULL COMMENT '等级所属模块',
 `level_cid` int(4) NOT NULL DEFAULT '0' COMMENT '0为所有内容，否则为单独定制的粉丝等级。',
 `level_name` varchar(40) NOT NULL COMMENT '等级名字 /* SubMaRk */',
 `level_start` int(4) NOT NULL DEFAULT '0' COMMENT '等级开始经验',
 `level_end` int(4) NOT NULL DEFAULT '0' COMMENT '等级结束经验',
 `level_order` int(41) NOT NULL DEFAULT '0' COMMENT '等级排序',
 PRIMARY KEY (`level_id`)) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT
CHARSET=utf8 COMMENT='模块内容粉丝等级表';

/*Data for the table `wm_fans_module_level` */
INSERT INTO `wm_fans_module_level`(`level_id`, `level_module`, `level_cid`, `level_name`, `level_start`, `level_end`, `level_order`) VALUES (1,'novel',0,'ผู้ติดตาม',0,500,1), (2,'novel',0,'สาวก',500,1000,2), (3,'novel',0,'ศิษย์ภายนอกขั้นต้น',1000,2000,3), (4,'novel',0,'ศิษย์ภายนอกขั้นกลาง',2000,4000,4), (5,'novel',0,'ศิษย์ภายนอกขั้นปลาย',4000,6000,5), (6,'novel',0,'ศิษย์ภายในขั้นต้น',6000,10000,6), (7,'novel',0,'ศิษย์ภายในขั้นกลาง',10000,20000,7), (8,'novel',0,'ศิษย์ภายในขั้นปลาย',20000,30000,8), (9,'novel',0,'ศิษย์ที่แท้จริง',30000,50000,9), (10,'novel',0,'ผู้สืบทอดลำดับสาม',50000,60000,10), (11,'novel',0,'ผู้สืบทอดลำดับสอง',60000,70000,11), (12,'novel',0,'ผู้สืบทอดลำดับหนึ่ง',70000,80000,12), (13,'novel',0,'ศิษย์ผู้สืบทอดที่แท้จริง',80000,100000,13);

/*Table structure for table `wm_finance_apply` */
DROP TABLE IF EXISTS `wm_finance_apply`;

CREATE TABLE `wm_finance_apply` (`apply_id` int(4) NOT NULL AUTO_INCREMENT,
 `apply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为待审核，1为已处理，2为未通过',
 `apply_module` varchar(20) DEFAULT NULL COMMENT '结算来源模块，可以为空',
 `apply_cid` int(4) NOT NULL DEFAULT '0' COMMENT '模块内容id',
 `apply_month` int(4) NOT NULL COMMENT '结算的月份',
 `apply_time` int(4) NOT NULL COMMENT '结算的时间',
 `apply_manager_id` int(4) NOT NULL COMMENT '结算申请人',
 `apply_total` decimal(10, 2) NOT NULL COMMENT '结算申请总金额',
 `apply_bonus` decimal(10, 2) DEFAULT NULL COMMENT '奖励金额',
 `apply_bonus_remark` varchar(50) DEFAULT NULL COMMENT '奖励备注',
 `apply_deduct` decimal(10, 2) DEFAULT NULL COMMENT '惩罚备注',
 `apply_deduct_remark` varchar(50) DEFAULT NULL COMMENT '惩罚备注',
 `apply_real` decimal(10, 2) NOT NULL COMMENT '实际到账金额',
 `apply_remark` varchar(50) DEFAULT NULL COMMENT '结算申请备注',
 `apply_to_user_id` int(4) NOT NULL DEFAULT '0' COMMENT '结算申请给哪个用户',
 `apply_handle_manager_id` int(4) NOT NULL DEFAULT '0' COMMENT '处理申请的管理员id',
 `apply_handle_remark` varchar(50) DEFAULT NULL COMMENT '处理申请的备注',
 `apply_handle_time` int(4) NOT NULL DEFAULT '0' COMMENT '处理申请的时间',
 PRIMARY KEY (`apply_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='财务申请记录表';

/*Data for the table `wm_finance_apply` */ /*Table structure for table `wm_finance_level` */
DROP TABLE IF EXISTS `wm_finance_level`;

CREATE TABLE `wm_finance_level` (`level_id` int(4) NOT NULL AUTO_INCREMENT,
 `level_money` int(1) NOT NULL DEFAULT '0' COMMENT '充值的金额',
 `level_real` int(1) NOT NULL DEFAULT '0' COMMENT '折扣后应付的价格',
 `level_reward_gold2` int(1) NOT NULL DEFAULT '0' COMMENT '赠送的金币2',
 PRIMARY KEY (`level_id`), KEY `money_index` (`level_money`)) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT
CHARSET=utf8 COMMENT='充值等级表';

/*Data for the table `wm_finance_level` */
INSERT INTO `wm_finance_level`(`level_id`, `level_money`, `level_real`, `level_reward_gold2`) VALUES (1,10,10,0), (2,20,20,0), (3,50,50,0), (4,100,100,0), (5,200,200,0), (7,500,500,100), (8,80,80,0), (9,150,150,0);

/*Table structure for table `wm_finance_order_cash` */
DROP TABLE IF EXISTS `wm_finance_order_cash`;

CREATE TABLE `wm_finance_order_cash` (`cash_id` int(4) NOT NULL AUTO_INCREMENT,
 `cash_status` tinyint(1) DEFAULT '0' COMMENT '0为申请中，1为已经处理，2为已拒绝',
 `cash_user_id` int(4) NOT NULL COMMENT '申请用户',
 `cash_money` decimal(10, 2) NOT NULL COMMENT '提现金额',
 `cash_real` decimal(10, 2) NOT NULL COMMENT '实际到账',
 `cash_cost` tinyint(3) NOT NULL DEFAULT '0' COMMENT '提现手续费',
 `cash_remark` varchar(200) DEFAULT NULL COMMENT '备注信息',
 `cash_time` int(4) DEFAULT '0' COMMENT '申请时间',
 `cash_handletime` int(4) DEFAULT '0' COMMENT '处理时间',
 PRIMARY KEY (`cash_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='提现申请订单表';

/*Data for the table `wm_finance_order_cash` */ /*Table structure for table `wm_finance_order_charge` */
DROP TABLE IF EXISTS `wm_finance_order_charge`;

CREATE TABLE `wm_finance_order_charge` (`charge_id` int(4) NOT NULL AUTO_INCREMENT,
 `charge_sn` varchar(60) NOT NULL COMMENT '本站充值订单号',
 `charge_paysn` varchar(60) DEFAULT NULL COMMENT '第三方充值订单号',
 `charge_status` tinyint(1) DEFAULT '0' COMMENT '订单状态，0为待付款，1为已付款',
 `charge_type` varchar(20) NOT NULL COMMENT '充值方式。card卡密充值',
 `charge_user_id` int(4) NOT NULL DEFAULT '0' COMMENT '充值用户',
 `charge_tuser_id` int(4) NOT NULL DEFAULT '0' COMMENT '好友的id',
 `charge_money` decimal(10, 2) DEFAULT NULL COMMENT '充值金额',
 `charge_gold2` decimal(10, 2) DEFAULT NULL COMMENT '获得金币2',
 `charge_first` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '是否有首冲奖励',
 `charge_reward` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '是否有充值奖励',
 `charge_addtime` int(4) DEFAULT '0' COMMENT '下单时间',
 `charge_paytime` int(4) DEFAULT '0' COMMENT '支付时间',
 `charge_remark` varchar(200) DEFAULT NULL COMMENT '备注',
 PRIMARY KEY (`charge_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='充值记录';

/*Data for the table `wm_finance_order_charge` */ /*Table structure for table `wm_flash_flash` */
DROP TABLE IF EXISTS `wm_flash_flash`;

CREATE TABLE `wm_flash_flash` (`flash_id` int(4) NOT NULL AUTO_INCREMENT,
 `flash_status` tinyint(1) DEFAULT '1' COMMENT '状态',
 `type_id` int(4) NOT NULL DEFAULT '0' COMMENT '幻灯片分组',
 `flash_order` int(4) NOT NULL COMMENT '排序',
 `flash_module` varchar(20) NOT NULL COMMENT '属于哪个模块',
 `flash_pid` int(11) NOT NULL COMMENT '页面id',
 `flash_title` varchar(20) NOT NULL COMMENT '标题',
 `flash_info` varchar(100) DEFAULT NULL COMMENT '简介',
 `flash_desc` varchar(200) NOT NULL COMMENT '描述',
 `flash_url` varchar(200) NOT NULL COMMENT '跳转地址',
 `flash_img` varchar(500) DEFAULT NULL COMMENT '幻灯片图标',
 `flash_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间',
 PRIMARY KEY (`flash_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='幻灯片表';

/*Data for the table `wm_flash_flash` */ /*Table structure for table `wm_flash_type` */
DROP TABLE IF EXISTS `wm_flash_type`;

CREATE TABLE `wm_flash_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_name` varchar(20) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
 `type_order` int(4) NOT NULL DEFAULT '0' COMMENT '分类排序',
 `type_info` varchar(100) DEFAULT NULL COMMENT '分类备注',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='幻灯片表';

/*Data for the table `wm_flash_type` */ /*Table structure for table `wm_link_click` */
DROP TABLE IF EXISTS `wm_link_click`;

CREATE TABLE `wm_link_click` (`click_id` int(4) NOT NULL AUTO_INCREMENT,
 `click_lid` int(4) NOT NULL,
 `click_type` varchar(30) NOT NULL COMMENT '进还是出 /* SubMaRk */',
 `click_ua` varchar(250) DEFAULT NULL COMMENT 'UA信息',
 `click_ip` varchar(15) DEFAULT NULL COMMENT '点击IP',
 `click_adress` varchar(30) DEFAULT NULL COMMENT '地理位置',
 `click_browser` varchar(30) DEFAULT NULL COMMENT '浏览器',
 `click_browser_ver` varchar(30) DEFAULT NULL COMMENT '浏览器版本',
 `click_system` varchar(250) DEFAULT NULL COMMENT '系统类型',
 `click_system_ver` varchar(30) DEFAULT NULL COMMENT '系统版本',
 `click_time` int(4) NOT NULL COMMENT '点击时间',
 PRIMARY KEY (`click_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='友链点击记录表';

/*Data for the table `wm_link_click` */ /*Table structure for table `wm_link_link` */
DROP TABLE IF EXISTS `wm_link_link`;

CREATE TABLE `wm_link_link` (`link_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_id` int(4) NOT NULL COMMENT '分类id',
 `link_name` varchar(30) NOT NULL COMMENT '友链名字 /*SubMaRk */',
 `link_cname` varchar(15) DEFAULT NULL COMMENT '友链简称 /*SubMaRk */',
 `link_pinyin` varchar(20) DEFAULT NULL COMMENT '拼音',
 `link_ico` varchar(120) DEFAULT NULL COMMENT '图标',
 `link_order` int(4) NOT NULL DEFAULT '99' COMMENT '排序',
 `link_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
 `link_show` tinyint(1) DEFAULT '1' COMMENT '1为显示跳转链接，0为直链',
 `link_url` varchar(120) NOT NULL COMMENT '友链地址',
 `link_fixed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '固链',
 `link_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
 `link_jointime` int(4) NOT NULL DEFAULT '0' COMMENT '加入时间',
 `link_in_jump` varchar(200) DEFAULT NULL COMMENT '友链进入跳转连接',
 `link_info` varchar(150) DEFAULT NULL COMMENT '友链简介 /*SubMaRk */',
 `link_qq` varchar(20) DEFAULT NULL COMMENT '联系QQ',
 `link_read` int(4) NOT NULL DEFAULT '0' COMMENT '阅读量',
 `link_ding` int(4) NOT NULL DEFAULT '0' COMMENT '顶',
 `link_cai` int(4) NOT NULL DEFAULT '0' COMMENT '踩',
 `link_lastintime` int(4) NOT NULL DEFAULT '0' COMMENT '最后点入',
 `link_lastouttime` int(4) NOT NULL DEFAULT '0' COMMENT '最后点出',
 `link_outday` int(4) NOT NULL DEFAULT '0' COMMENT '日点出',
 `link_outweek` int(4) NOT NULL DEFAULT '0' COMMENT '周点出',
 `link_outmonth` int(4) NOT NULL DEFAULT '0' COMMENT '月点出',
 `link_outyear` int(4) DEFAULT '0' COMMENT '年点出',
 `link_outsum` int(4) NOT NULL DEFAULT '0' COMMENT '总点处',
 `link_inday` int(4) NOT NULL DEFAULT '0' COMMENT '日点入',
 `link_inweek` int(4) NOT NULL DEFAULT '0' COMMENT '周点入',
 `link_inmonth` int(4) NOT NULL DEFAULT '0' COMMENT '月点入',
 `link_inyear` int(4) DEFAULT '0' COMMENT '年点入',
 `link_insum` int(4) NOT NULL DEFAULT '0' COMMENT '总点入',
 PRIMARY KEY (`link_id`)) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT
CHARSET=utf8 COMMENT='友链表';

/*Data for the table `wm_link_link` */
INSERT INTO `wm_link_link`(`link_id`, `type_id`, `link_name`, `link_cname`, `link_pinyin`, `link_ico`, `link_order`, `link_status`, `link_show`, `link_url`, `link_fixed`, `link_rec`, `link_jointime`, `link_in_jump`, `link_info`, `link_qq`, `link_read`, `link_ding`, `link_cai`, `link_lastintime`, `link_lastouttime`, `link_outday`, `link_outweek`, `link_outmonth`, `link_outyear`, `link_outsum`, `link_inday`, `link_inweek`, `link_inmonth`, `link_inyear`, `link_insum`) VALUES (1,2,'WMCMS','','','',99,1,0,'http://www.weimengcms.com',1,1,1494685926,'','','',3,0,0,0,0,0,0,0,0,0,0,0,0,0,0), (2,2,'ตัวช่วย','','','',99,1,1,'http://help.weimengcms.com',0,0,1552653211,'','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

/*Table structure for table `wm_link_type` */
DROP TABLE IF EXISTS `wm_link_type`;

CREATE TABLE `wm_link_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐分类',
 `type_name` varchar(30) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_cname` varchar(10) DEFAULT NULL COMMENT '类型简称',
 `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
 `type_order` int(2) NOT NULL COMMENT '排序',
 `type_ico` varchar(200) DEFAULT NULL COMMENT '分类图标',
 `type_info` varchar(100) DEFAULT NULL COMMENT '分类信息',
 `type_in_jump` varchar(200) DEFAULT NULL COMMENT '该分类友链点入跳转连接',
 `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类页模版',
 `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT '展示页模版',
 `type_title` varchar(80) DEFAULT NULL COMMENT '页面标题',
 `type_key` varchar(100) DEFAULT NULL COMMENT '页面关键字',
 `type_desc` varchar(120) DEFAULT NULL COMMENT '页面描述',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT
CHARSET=utf8 COMMENT='友链分类表';

/*Data for the table `wm_link_type` */
INSERT INTO `wm_link_type`(`type_id`, `type_topid`, `type_pid`, `type_rec`, `type_name`, `type_cname`, `type_pinyin`, `type_order`, `type_ico`, `type_info`, `type_in_jump`, `type_tempid`, `type_ctempid`, `type_title`, `type_key`, `type_desc`) VALUES (2,0,'0',0,'ลิ้งก์พันธมิตร','','',0,'','','',0,0,'','','');

/*Table structure for table `wm_manager_login` */
DROP TABLE IF EXISTS `wm_manager_login`;

CREATE TABLE `wm_manager_login` (`login_id` int(4) NOT NULL AUTO_INCREMENT,
 `manager_id` int(4) NOT NULL COMMENT '管理员id',
 `login_status` tinyint(1) DEFAULT NULL COMMENT '0为登录失败，1为登录成功，2为密码错误',
 `login_remark` varchar(100) DEFAULT NULL COMMENT '备注详情',
 `login_ip` varchar(150) NOT NULL COMMENT '登录ip',
 `login_time` int(4) NOT NULL COMMENT '登录时间',
 `login_ua` varchar(1000) NOT NULL COMMENT '登录UA',
 `login_browser` varchar(250) DEFAULT NULL COMMENT '登录浏览器',
 PRIMARY KEY (`login_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='管理员登录记录';

/*Data for the table `wm_manager_login` */ /*Table structure for table `wm_manager_manager` */
DROP TABLE IF EXISTS `wm_manager_manager`;

CREATE TABLE `wm_manager_manager` (`manager_id` int(11) NOT NULL AUTO_INCREMENT,
 `manager_status` int(1) NOT NULL DEFAULT '1' COMMENT '0为禁用,1为正常',
 `manager_cid` int(4) NOT NULL DEFAULT '0' COMMENT '管理员权限ID',
 `manager_name` varchar(20) NOT NULL COMMENT '管理员账号',
 `manager_psw` varchar(50) NOT NULL COMMENT '管理员密码',
 `manager_salt` varchar(50) DEFAULT NULL COMMENT '管理员密码盐',
 `manager_lastip` varchar(150) DEFAULT NULL COMMENT '最后登录ip',
 `manager_lasttime` int(4) NOT NULL DEFAULT '0' COMMENT '最后登陆',
 PRIMARY KEY (`manager_id`)) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT
CHARSET=utf8 COMMENT='管理员账号表';

/*Data for the table `wm_manager_manager` */
INSERT INTO `wm_manager_manager`(`manager_id`, `manager_status`, `manager_cid`, `manager_name`, `manager_psw`, `manager_salt`, `manager_lastip`, `manager_lasttime`) VALUES (1,1,0,'admin','d4b6232e4aa20cd032009cbb79b3452507a24830','a8e52ffc28e3300ee098aec5b1415b6cea5befcb','127.0.0.1',1591327032), (4,1,1,'sdasd','b8dbfcaea467bc655229df4a370cabe063f7daa4',NULL,'127.0.0.1',1499091969);

/*Table structure for table `wm_manager_operation` */
DROP TABLE IF EXISTS `wm_manager_operation`;

CREATE TABLE `wm_manager_operation` (`operation_id` int(4) NOT NULL AUTO_INCREMENT,
 `operation_manager_id` int(4) DEFAULT '0' COMMENT '操作的管理员',
 `operation_module` varchar(20) DEFAULT NULL COMMENT '操作的模块',
 `operation_table` varchar(50) DEFAULT NULL COMMENT '操作的表',
 `operation_type` varchar(20) DEFAULT NULL COMMENT '操作的类型，insert，updata,delete',
 `operation_data` text COMMENT '操作的新数据',
 `operation_where` text COMMENT '操作数据的条件',
 `operation_backdata` text COMMENT '操作的镜像原始数据',
 `operation_remark` varchar(500) DEFAULT NULL COMMENT '操作的备注信息',
 `operation_time` int(4) DEFAULT '0' COMMENT '操作的时间',
 PRIMARY KEY (`operation_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='管理员操作记录表';

/*Data for the table `wm_manager_operation` */ /*Table structure for table `wm_manager_recycle` */
DROP TABLE IF EXISTS `wm_manager_recycle`;

CREATE TABLE `wm_manager_recycle` (`recycle_id` int(4) NOT NULL AUTO_INCREMENT,
 `recycle_manager_id` int(4) NOT NULL DEFAULT '0' COMMENT '管理员的id',
 `recycle_module` varchar(20) NOT NULL COMMENT '操作的是哪个模块',
 `recycle_data_id` int(4) NOT NULL DEFAULT '0' COMMENT '删除的数据id',
 `recycle_title` varchar(100) DEFAULT NULL COMMENT '删除数据的标题',
 `recycle_time` int(4) DEFAULT '0' COMMENT '删除的时间',
 PRIMARY KEY (`recycle_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='管理员删除数据回收站';

/*Data for the table `wm_manager_recycle` */ /*Table structure for table `wm_manager_request` */
DROP TABLE IF EXISTS `wm_manager_request`;

CREATE TABLE `wm_manager_request` (`request_id` int(4) NOT NULL AUTO_INCREMENT,
 `request_manager_id` int(4) NOT NULL COMMENT '管理员的id',
 `request_file` varchar(30) NOT NULL COMMENT '访问的控制器文件',
 `request_type` varchar(20) NOT NULL DEFAULT 'GET' COMMENT '访问的类型',
 `request_ip` varchar(20) DEFAULT NULL COMMENT '访问的ip',
 `request_time` int(4) DEFAULT '0' COMMENT '访问的时间',
 `request_get` text COMMENT 'GET请求的参数',
 `request_post` text COMMENT 'POST请求的参数',
 PRIMARY KEY (`request_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='管理员请求记录';

/*Data for the table `wm_manager_request` */ /*Table structure for table `wm_message_message` */
DROP TABLE IF EXISTS `wm_message_message`;

CREATE TABLE `wm_message_message` (`message_id` int(4) NOT NULL AUTO_INCREMENT,
 `message_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为未读',
 `message_content` varchar(100) NOT NULL COMMENT '留言内容',
 `message_time` int(4) NOT NULL COMMENT '留言时间',
 `message_ip` varchar(15) DEFAULT NULL COMMENT '留言IP',
 PRIMARY KEY (`message_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='留言表';

/*Data for the table `wm_message_message` */ /*Table structure for table `wm_novel_chapter` */
DROP TABLE IF EXISTS `wm_novel_chapter`;

CREATE TABLE `wm_novel_chapter` (`chapter_id` int(11) NOT NULL AUTO_INCREMENT,
 `chapter_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0为审核中,1为正常,2为不通过',
 `chapter_islogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录才能查看',
 `chapter_isvip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要会员,0为不需要',
 `chapter_ispay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要付费',
 `chapter_istxt` tinyint(1) NOT NULL DEFAULT '2' COMMENT '2为入库，1为是txt文件',
 `chapter_number` int(1) DEFAULT '0' COMMENT '章节的字数',
 `chapter_name` varchar(200) DEFAULT NULL COMMENT '章节名 /* SubMaRk */',
 `chapter_nid` int(4) NOT NULL DEFAULT '0' COMMENT '书籍id',
 `chapter_vid` int(4) NOT NULL DEFAULT '1' COMMENT '分卷id默认为1',
 `chapter_cid` int(4) NOT NULL DEFAULT '0' COMMENT '内容id',
 `chapter_order` int(4) NOT NULL DEFAULT '999' COMMENT '排序',
 `chapter_path` varchar(250) DEFAULT NULL COMMENT '章节txt完整保存路径',
 `chapter_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间年月日时分秒',
 PRIMARY KEY (`chapter_id`), KEY `nid_vid_time_Index` (`chapter_nid`, `chapter_vid`, `chapter_time`),
 KEY `nid_time_Index` (`chapter_nid`, `chapter_time`),
 KEY `nid_index` (`chapter_nid`),
 KEY `time_index` (`chapter_time`),
 KEY `cid_index` (`chapter_cid`),
 KEY `status_index` (`chapter_status`),
 KEY `order_index` (`chapter_order`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说章节索引表';

/*Data for the table `wm_novel_chapter` */ /*Table structure for table `wm_novel_content` */
DROP TABLE IF EXISTS `wm_novel_content`;

CREATE TABLE `wm_novel_content` (`content_id` int(11) NOT NULL AUTO_INCREMENT,
 `content` mediumtext NOT NULL COMMENT '内容',
 PRIMARY KEY (`content_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='章节内容表';

/*Data for the table `wm_novel_content` */ /*Table structure for table `wm_novel_novel` */
DROP TABLE IF EXISTS `wm_novel_novel`;

CREATE TABLE `wm_novel_novel` (`novel_id` int(11) NOT NULL AUTO_INCREMENT,
 `author_id` int(4) NOT NULL DEFAULT '0' COMMENT '作者id',
 `novel_name` varchar(200) NOT NULL COMMENT '小说名 /* SubMaRk */',
 `novel_wordname` varchar(50) DEFAULT NULL COMMENT '全文字书名',
 `novel_pinyin` varchar(50) NOT NULL COMMENT '拼音',
 `novel_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0为审核,1为正常',
 `novel_copyright` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为无版权，1为签约销售，2为买断版权',
 `novel_sign_id` int(4) NOT NULL DEFAULT '0' COMMENT '签约等级的id',
 `novel_sell` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许上架出售',
 `novel_process` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为连载，2完成，3断更',
 `novel_type` int(1) NOT NULL DEFAULT '1' COMMENT '1为原创首发，2为他站首发',
 `type_id` int(4) NOT NULL COMMENT '类型id',
 `novel_author` varchar(50) NOT NULL COMMENT '作者',
 `novel_cover` varchar(250) NOT NULL COMMENT '封面',
 `novel_comment` varchar(500) DEFAULT NULL COMMENT '编辑点评',
 `novel_info` varchar(2000) NOT NULL COMMENT '小说简介',
 `novel_tags` varchar(80) DEFAULT NULL COMMENT '小说标签',
 `novel_chapter` int(4) NOT NULL DEFAULT '0' COMMENT '总章节数',
 `novel_wordnumber` int(4) NOT NULL DEFAULT '0' COMMENT '总字数',
 `novel_uptime` int(4) NOT NULL DEFAULT '0' COMMENT '最后更新时间年月日时分秒',
 `novel_clicktime` int(4) NOT NULL DEFAULT '0' COMMENT '点击更新日期年月日',
 `novel_score` decimal(2, 1) NOT NULL DEFAULT '0.0' COMMENT '评分',
 `novel_ding` int(4) NOT NULL DEFAULT '0' COMMENT '顶',
 `novel_cai` int(4) NOT NULL DEFAULT '0' COMMENT '踩',
 `novel_replay` int(4) NOT NULL DEFAULT '0' COMMENT '评论条数',
 `novel_startcid` int(4) NOT NULL DEFAULT '0' COMMENT '第一章节的id',
 `novel_startcname` varchar(100) NOT NULL DEFAULT '0' COMMENT '第一章节的名字 /* SubMaRk */',
 `novel_newcid` int(4) NOT NULL DEFAULT '0' COMMENT '最新章节的id',
 `novel_newcname` varchar(100) NOT NULL DEFAULT '0' COMMENT '最新章节的名字 /* SubMaRk */',
 `novel_createtime` int(4) NOT NULL DEFAULT '0' COMMENT '创建时间',
 `novel_todayclick` int(4) NOT NULL DEFAULT '0' COMMENT '今日点击',
 `novel_weekclick` int(4) NOT NULL DEFAULT '0' COMMENT '周点击',
 `novel_monthclick` int(4) NOT NULL DEFAULT '0' COMMENT '本月点击',
 `novel_yearclick` int(4) DEFAULT '0' COMMENT '年点击',
 `novel_allclick` int(4) NOT NULL DEFAULT '0' COMMENT '总点击数',
 `novel_todaycoll` int(4) NOT NULL DEFAULT '0' COMMENT '日收藏',
 `novel_weekcoll` int(4) NOT NULL DEFAULT '0' COMMENT '周收藏',
 `novel_monthcoll` int(4) NOT NULL DEFAULT '0' COMMENT '月收藏',
 `novel_yearcoll` int(4) NOT NULL DEFAULT '0' COMMENT '年收藏',
 `novel_allcoll` int(4) NOT NULL DEFAULT '0' COMMENT '总收藏',
 `novel_colltime` int(4) NOT NULL DEFAULT '0' COMMENT '收藏更新时间',
 `novel_todayrec` int(4) NOT NULL DEFAULT '0' COMMENT '日用户推荐',
 `novel_weekrec` int(4) NOT NULL DEFAULT '0' COMMENT '周用户推荐',
 `novel_monthrec` int(4) NOT NULL DEFAULT '0' COMMENT '月用户推荐',
 `novel_yearrec` int(4) NOT NULL DEFAULT '0' COMMENT '年用户推荐',
 `novel_allrec` int(4) NOT NULL DEFAULT '0' COMMENT '总用户推荐',
 `novel_path` varchar(250) DEFAULT NULL COMMENT '小说完本txt保存地址',
 `novel_rectime` int(4) NOT NULL DEFAULT '0' COMMENT '推荐更新时间',
 PRIMARY KEY (`novel_id`), KEY `UPTIME_INDEX` (`novel_uptime`),
 KEY `LIST_INDEX` (`novel_status`, `type_id`),
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
 KEY `PRE_NEXT_INDEX` (`type_id`, `novel_id`),
 KEY `AUTHOR_INDEX` (`novel_author`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说书籍表';

/*Data for the table `wm_novel_novel` */ /*Table structure for table `wm_novel_rec` */
DROP TABLE IF EXISTS `wm_novel_rec`;

CREATE TABLE `wm_novel_rec` (`rec_id` int(4) NOT NULL AUTO_INCREMENT,
 `rec_nid` int(4) NOT NULL COMMENT '小说id',
 `rec_img3` varchar(250) DEFAULT NULL COMMENT '触屏推荐图片地址',
 `rec_img4` varchar(250) DEFAULT NULL COMMENT '电脑推荐图片地址',
 `rec_rt` varchar(20) DEFAULT NULL COMMENT '推荐显示的标题',
 `rec_icr` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页封面',
 `rec_ibr` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页精品',
 `rec_ir` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页推荐',
 `rec_ccr` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类封面',
 `rec_cbr` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类精品',
 `rec_cr` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类推荐',
 `rec_order` int(1) NOT NULL DEFAULT '99' COMMENT '排序',
 `rec_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间',
 PRIMARY KEY (`rec_id`), KEY `nid_index` (`rec_nid`),
 KEY `rec_index` (`rec_rt`, `rec_icr`, `rec_ibr`, `rec_ir`, `rec_ccr`, `rec_cbr`, `rec_cr`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说推荐表';

/*Data for the table `wm_novel_rec` */ /*Table structure for table `wm_novel_rewardlog` */
DROP TABLE IF EXISTS `wm_novel_rewardlog`;

CREATE TABLE `wm_novel_rewardlog` (`log_id` int(4) NOT NULL AUTO_INCREMENT,
 `log_nid` int(4) NOT NULL DEFAULT '0' COMMENT '小说id',
 `log_cid` int(4) DEFAULT '0' COMMENT '章节id，可以为0',
 `log_uid` int(4) NOT NULL DEFAULT '0' COMMENT '打赏的用户id',
 `log_gold1` decimal(10, 2) DEFAULT '0.00' COMMENT '打赏消耗的金币1',
 `log_gold2` decimal(10, 2) DEFAULT '0.00' COMMENT '打赏消耗的金币2',
 `log_time` int(4) NOT NULL DEFAULT '0' COMMENT '订打赏的时间',
 PRIMARY KEY (`log_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说打赏记录日志表';

/*Data for the table `wm_novel_rewardlog` */ /*Table structure for table `wm_novel_sell` */
DROP TABLE IF EXISTS `wm_novel_sell`;

CREATE TABLE `wm_novel_sell` (`sell_id` int(4) NOT NULL AUTO_INCREMENT,
 `sell_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为上架，0为下架',
 `sell_novel_id` int(4) NOT NULL DEFAULT '0' COMMENT '小说id',
 `sell_type` varchar(10) CHARACTER
 SET latin1 DEFAULT '1' COMMENT '销售类型,1为单章，2为全本，3为包月',
 `sell_number` decimal(8, 2) DEFAULT '0.00' COMMENT '单章千字价格【金币2】',
 `sell_all` decimal(8, 2) DEFAULT '0.00' COMMENT '全本销售价格【金币2】',
 `sell_month` decimal(8, 2) DEFAULT '0.00' COMMENT '包月价格【金币2】',
 `sell_time` int(4) NOT NULL DEFAULT '0' COMMENT '上架时间',
 PRIMARY KEY (`sell_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说上架销售记录表';

/*Data for the table `wm_novel_sell` */ /*Table structure for table `wm_novel_sign` */
DROP TABLE IF EXISTS `wm_novel_sign`;

CREATE TABLE `wm_novel_sign` (`sign_id` int(4) NOT NULL AUTO_INCREMENT,
 `sign_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为签约，0为解除签约',
 `sign_novel_id` int(4) NOT NULL COMMENT '小说id',
 `sign_manager_id` int(4) NOT NULL DEFAULT '1' COMMENT '签约的管理员',
 `sign_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '签约类型，1为分成销售，2为买断版权',
 `sign_sign_id` int(4) DEFAULT '0' COMMENT '签约等级',
 `sign_time` int(4) NOT NULL COMMENT '签约的时间',
 PRIMARY KEY (`sign_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说签约买断记录表';

/*Data for the table `wm_novel_sign` */ /*Table structure for table `wm_novel_sublog` */
DROP TABLE IF EXISTS `wm_novel_sublog`;

CREATE TABLE `wm_novel_sublog` (`log_id` int(4) NOT NULL AUTO_INCREMENT,
 `log_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订阅类型，1是单章，2是全本，3是包月',
 `log_nid` int(4) NOT NULL DEFAULT '0' COMMENT '小说id',
 `log_cid` int(4) DEFAULT '0' COMMENT '章节id，可以为0',
 `log_uid` int(4) NOT NULL DEFAULT '0' COMMENT '订阅的用户id',
 `log_gold1` decimal(10, 2) DEFAULT '0.00' COMMENT '订阅消耗的金币1',
 `log_gold2` decimal(10, 2) DEFAULT '0.00' COMMENT '订阅消耗的金币2',
 `log_time` int(4) NOT NULL DEFAULT '0' COMMENT '订阅的时间',
 PRIMARY KEY (`log_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说订阅记录表';

/*Data for the table `wm_novel_sublog` */ /*Table structure for table `wm_novel_timelimit` */
DROP TABLE IF EXISTS `wm_novel_timelimit`;

CREATE TABLE `wm_novel_timelimit` (`timelimit_id` int(4) NOT NULL AUTO_INCREMENT,
 `timelimit_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '布尔值，是否可用',
 `timelimit_nid` int(4) NOT NULL COMMENT '小说id',
 `timelimit_starttime` int(4) NOT NULL COMMENT '限时免费开始时间',
 `timelimit_endtime` int(4) NOT NULL COMMENT '限时免费结束时间',
 `timelimit_order` int(4) NOT NULL COMMENT '显示顺序',
 `timelimit_time` int(4) NOT NULL COMMENT '添加时间',
 PRIMARY KEY (`timelimit_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说限时免费表';

/*Data for the table `wm_novel_timelimit` */ /*Table structure for table `wm_novel_type` */
DROP TABLE IF EXISTS `wm_novel_type`;

CREATE TABLE `wm_novel_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_name` varchar(40) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_cname` varchar(20) DEFAULT NULL COMMENT '类型简称 /* SubMaRk */',
 `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
 `type_order` int(4) NOT NULL COMMENT '排序',
 `type_ico` varchar(200) DEFAULT NULL COMMENT '分类图标',
 `type_info` varchar(100) DEFAULT NULL COMMENT '分类简介',
 `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类页模版',
 `type_titempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类首页的模版',
 `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT 'info模版',
 `type_mtempid` int(4) NOT NULL DEFAULT '0' COMMENT 'menu模版',
 `type_rtempid` int(4) NOT NULL DEFAULT '0' COMMENT 'read模版',
 `type_title` varchar(80) DEFAULT NULL COMMENT '分类标题',
 `type_key` varchar(100) DEFAULT NULL COMMENT '分类关键字',
 `type_desc` varchar(120) DEFAULT NULL COMMENT '分类描述',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT
CHARSET=utf8 COMMENT='小说分类表';

/*Data for the table `wm_novel_type` */
INSERT INTO `wm_novel_type`(`type_id`, `type_topid`, `type_pid`, `type_name`, `type_cname`, `type_pinyin`, `type_order`, `type_ico`, `type_info`, `type_tempid`, `type_titempid`, `type_ctempid`, `type_mtempid`, `type_rtempid`, `type_title`, `type_key`, `type_desc`) VALUES (1,0,'0','แฟนตาซี','fantasy','xuanhuanmofa',1,'','นิยายที่จะนำคุณเข้าสูู่โลกแห่งเวทย์มนต์',0,0,0,0,0,'','',''), (2,0,'0','ศิลปะการต่อสู้','martialarts','wuxiaxiuzhen',3,'','นิยายที่มีเนื้อหาเน้นหนักไปทางด้านการต่อสู้',0,0,0,0,0,'','',''), (3,0,'0','โรแมนติก','romance','dushiyanqing',5,'','นิยายที่มีเนื้อหาเกี่ยวกับความสัมพันธ์อันโรแมนติก',0,0,0,0,0,'','',''), (4,0,'0','ประวัติศาสตร์','historical','lishijunshi',7,'','นิยายที่มีเนื้อหาอ้างอิงหรือเกี่ยวเนื่องกับประวัติศาสตร์',0,0,0,0,0,'','',''), (5,0,'0','เรื่องลึกลับ','mystery','xuanyijiqing',9,'','นิยายที่จะนำคุณไปสู่โลกอีกด้านที่คุณอาจไม่คาดคิดว่าจะมีอยู่จริง',0,0,0,0,0,'','',''), (6,0,'0','เกมออนไลน์','game','wangyoujingji',11,'','นิยายที่จะนำคุณเข้าไปมีส่วนร่วมกับเกม',0,0,0,0,0,'','',''), (7,0,'0','ไซไฟ','scifi','kehuanqihuan',13,'','นิยายที่มีเนื้อหากาต่อสู้ด้วยความคิดด้านวิทยาศาสตร์',0,0,0,0,0,'','',''), (8,0,'0','สยองขวัญ','horror','kongbulingyi',15,'','นิยายที่จะกระตุ้นสัมผัสที่ 6 ของคุณให้ตื่นขึ้น',0,0,0,0,0,'','','');

/*Table structure for table `wm_novel_volume` */
DROP TABLE IF EXISTS `wm_novel_volume`;

CREATE TABLE `wm_novel_volume` (`volume_id` int(11) NOT NULL AUTO_INCREMENT,
 `volume_name` varchar(60) NOT NULL COMMENT '分卷名 /* SubMaRk */',
 `volume_nid` int(4) NOT NULL DEFAULT '0' COMMENT '书籍id0为默认分卷',
 `volume_desc` varchar(200) DEFAULT NULL COMMENT '分卷描述 /* SubMaRk */',
 `volume_order` int(4) NOT NULL DEFAULT '0' COMMENT '排序',
 `volume_time` int(4) NOT NULL DEFAULT '0' COMMENT '创建时间年月日时分秒',
 PRIMARY KEY (`volume_id`,
 `volume_time`)) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT
CHARSET=utf8 COMMENT='小说分卷表';

/*Data for the table `wm_novel_volume` */
INSERT INTO `wm_novel_volume`(`volume_id`, `volume_name`, `volume_nid`, `volume_desc`, `volume_order`, `volume_time`) VALUES (1,'ข้อมูลทั่วไป',0,'ข้อมูลทั่วไปของนิยายสามารถใส่ไว้ในส่วนนี้',0,22);

/*Table structure for table `wm_novel_welfare` */
DROP TABLE IF EXISTS `wm_novel_welfare`;

CREATE TABLE `wm_novel_welfare` (`welfare_id` int(4) NOT NULL AUTO_INCREMENT,
 `welfare_nid` int(4) NOT NULL COMMENT '小说id',
 `welfare_type` varchar(250) DEFAULT NULL COMMENT '允许的小说分成方式',
 `welfare_number` decimal(5, 2) DEFAULT NULL COMMENT '小说字数奖励',
 `welfare_finish` varchar(500) DEFAULT NULL COMMENT '小说完本奖励',
 `welfare_update` varchar(500) DEFAULT NULL COMMENT '小说更新奖励，每月结算',
 `welfare_full` varchar(500) DEFAULT NULL COMMENT '每月出勤奖励，每月结算',
 PRIMARY KEY (`welfare_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='小说福利设置表';

/*Data for the table `wm_novel_welfare` */ /*Table structure for table `wm_operate_operate` */
DROP TABLE IF EXISTS `wm_operate_operate`;

CREATE TABLE `wm_operate_operate` (`operate_id` int(4) NOT NULL AUTO_INCREMENT,
 `operate_module` varchar(20) NOT NULL COMMENT '操作模块',
 `operate_type` varchar(30) NOT NULL COMMENT '操作类型',
 `operate_cid` int(4) NOT NULL DEFAULT '0' COMMENT '操作内容的id',
 `operate_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1' COMMENT 'ip',
 `operate_time` int(4) NOT NULL DEFAULT '0' COMMENT '时间',
 PRIMARY KEY (`operate_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户顶踩，评分等操作记录';

/*Data for the table `wm_operate_operate` */ /*Table structure for table `wm_operate_score` */
DROP TABLE IF EXISTS `wm_operate_score`;

CREATE TABLE `wm_operate_score` (`score_id` int(4) NOT NULL AUTO_INCREMENT,
 `score_module` varchar(20) NOT NULL COMMENT '评分的模块',
 `score_cid` int(4) NOT NULL COMMENT '内容id',
 `score_one` int(4) NOT NULL DEFAULT '0' COMMENT '一分的人数',
 `score_two` int(4) NOT NULL DEFAULT '0' COMMENT '两分的人数',
 `score_three` int(4) NOT NULL DEFAULT '0' COMMENT '三分的人数',
 `score_four` int(4) NOT NULL DEFAULT '0' COMMENT '四分的人数',
 `score_five` int(4) NOT NULL DEFAULT '0' COMMENT '五分的人数',
 PRIMARY KEY (`score_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='互动评分操作';

/*Data for the table `wm_operate_score` */ /*Table structure for table `wm_picture_picture` */
DROP TABLE IF EXISTS `wm_picture_picture`;

CREATE TABLE `wm_picture_picture` (`picture_id` int(11) NOT NULL AUTO_INCREMENT,
 `type_id` int(4) NOT NULL DEFAULT '1' COMMENT '新闻分类id',
 `picture_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否审核',
 `picture_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
 `picture_simg` varchar(120) DEFAULT NULL COMMENT '缩略图',
 `picture_name` varchar(50) NOT NULL COMMENT '图集标题',
 `picture_cname` varchar(50) DEFAULT NULL COMMENT '图集段标题',
 `picture_tags` varchar(50) DEFAULT NULL COMMENT '图集标签',
 `picture_info` varchar(100) DEFAULT NULL COMMENT '点评，预览',
 `picture_imgs` text COMMENT '图片序列化数组',
 `picture_count` int(4) NOT NULL DEFAULT '0' COMMENT '图片数量',
 `picture_content` text COMMENT '简介',
 `picture_read` int(4) NOT NULL DEFAULT '0' COMMENT '图集阅读量',
 `picture_replay` int(4) NOT NULL DEFAULT '0' COMMENT '评论量',
 `picture_ding` int(4) NOT NULL DEFAULT '0' COMMENT '顶',
 `picture_cai` int(4) NOT NULL DEFAULT '0' COMMENT '踩',
 `picture_start` decimal(2, 1) NOT NULL DEFAULT '0.0' COMMENT '星级',
 `picture_score` decimal(2, 0) DEFAULT '0' COMMENT '评分',
 `picture_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间年月日时分秒',
 PRIMARY KEY (`picture_id`), KEY `tid` (`type_id`, `picture_time`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='图集表';

/*Data for the table `wm_picture_picture` */ /*Table structure for table `wm_picture_type` */
DROP TABLE IF EXISTS `wm_picture_type`;

CREATE TABLE `wm_picture_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_name` varchar(30) NOT NULL COMMENT '分类名 /* SubMaRk */',
 `type_cname` varchar(10) DEFAULT NULL COMMENT '类型简称',
 `type_pinyin` varchar(50) DEFAULT NULL COMMENT '类型拼音',
 `type_order` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
 `type_simg` varchar(200) DEFAULT NULL COMMENT '分类缩略图',
 `type_ico` varchar(200) DEFAULT NULL COMMENT '分类图标',
 `type_info` varchar(100) DEFAULT NULL COMMENT '分类信息',
 `type_titempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类首页模版',
 `type_tempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类页模板',
 `type_ctempid` int(4) NOT NULL DEFAULT '0' COMMENT '分类内容页模版',
 `type_title` varchar(80) DEFAULT NULL COMMENT '标题',
 `type_key` varchar(100) DEFAULT NULL COMMENT '关键字',
 `type_desc` varchar(120) DEFAULT NULL COMMENT '描述',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='图集分类表';

/*Data for the table `wm_picture_type` */ /*Table structure for table `wm_plugin` */
DROP TABLE IF EXISTS `wm_plugin`;

CREATE TABLE `wm_plugin` (`plugin_id` int(4) NOT NULL AUTO_INCREMENT,
 `plugin_name` varchar(50) NOT NULL COMMENT '插件名字',
 `plugin_floder` varchar(50) NOT NULL COMMENT '插件文件夹',
 `plugin_author` varchar(20) NOT NULL COMMENT '插件作者',
 `plugin_version` varchar(10) NOT NULL COMMENT '插件版本',
 `plugin_time` int(4) NOT NULL COMMENT '插件安装时间',
 PRIMARY KEY (`plugin_id`)) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT
CHARSET=utf8 COMMENT='插件安装表';

/*Data for the table `wm_plugin` */
INSERT INTO `wm_plugin`(`plugin_id`, `plugin_name`, `plugin_floder`, `plugin_author`, `plugin_version`, `plugin_time`) VALUES (6,'ปลั๊กอินทดสอบลงทะเบียน','demo','WMCMS Official','V1.0',1528631159);

/*Table structure for table `wm_plugin_config` */
DROP TABLE IF EXISTS `wm_plugin_config`;

CREATE TABLE `wm_plugin_config` (`config_id` int(4) NOT NULL AUTO_INCREMENT,
 `config_plugin_id` int(4) NOT NULL COMMENT '插件id',
 `config_key` varchar(100) NOT NULL COMMENT '插件键',
 `config_val` text COMMENT '插件值',
 PRIMARY KEY (`config_id`)) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT
CHARSET=utf8 COMMENT='插件参数配置表';

/*Data for the table `wm_plugin_config` */
INSERT INTO `wm_plugin_config`(`config_id`, `config_plugin_id`, `config_key`, `config_val`)
VALUES (4,6,'plugin_demo_site_open','0');

/*Table structure for table `wm_plugin_demo_apply` */
DROP TABLE IF EXISTS `wm_plugin_demo_apply`;

CREATE TABLE `wm_plugin_demo_apply` (`message_id` int(4) NOT NULL AUTO_INCREMENT,
 `message_name` varchar(20) NOT NULL COMMENT '报名用户',
 `message_phone` varchar(11) NOT NULL COMMENT '报名电话',
 `message_time` int(4) NOT NULL COMMENT '报名时间',
 PRIMARY KEY (`message_id`)) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT
CHARSET=utf8 COMMENT='demo插件报名表';

/*Data for the table `wm_plugin_demo_apply` */
INSERT INTO `wm_plugin_demo_apply`(`message_id`, `message_name`, `message_phone`, `message_time`) VALUES (1,'ไร้ฝัน','15123232323',1528631188);

/*Table structure for table `wm_props_props` */
DROP TABLE IF EXISTS `wm_props_props`;

CREATE TABLE `wm_props_props` (`props_id` int(4) NOT NULL AUTO_INCREMENT,
 `props_type_id` int(4) NOT NULL COMMENT '类型',
 `props_status` tinyint(1) DEFAULT '1' COMMENT '是否显示',
 `props_name` varchar(20) NOT NULL COMMENT '道具名字',
 `props_cover` varchar(250) DEFAULT NULL COMMENT '道具图标',
 `props_stock` int(4) NOT NULL DEFAULT '0' COMMENT '剩余库存',
 `props_desc` text COMMENT '道具介绍',
 `props_cost` tinyint(1) DEFAULT '1' COMMENT '1为网站消费类型，金币购买，2为现金购买',
 `props_gold1` decimal(8, 2) DEFAULT '0.00' COMMENT '金币1价格',
 `props_gold2` decimal(8, 2) DEFAULT '0.00' COMMENT '金币2价格',
 `props_money` decimal(10, 2) DEFAULT '0.00' COMMENT '现金价格',
 `props_time` int(4) NOT NULL DEFAULT '0' COMMENT '上架时间',
 `props_option` varchar(500) DEFAULT NULL COMMENT '附加数据，序列化字符串',
 `props_order` int(1) DEFAULT '999' COMMENT '排序，越小越靠前',
 PRIMARY KEY (`props_id`), KEY `index_type` (`props_type_id`)) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT
CHARSET=utf8 COMMENT='礼物道具表';

/*Data for the table `wm_props_props` */
INSERT INTO `wm_props_props`(`props_id`, `props_type_id`, `props_status`, `props_name`, `props_cover`, `props_stock`, `props_desc`, `props_cost`, `props_gold1`, `props_gold2`, `props_money`, `props_time`, `props_option`, `props_order`) VALUES (3,4,1,'เสริมความงาม','/upload/images/20170317/20170317180045804022978302.jpg',99956,'',2,'0.00','200.00','0.00',1488720588,'a:5:{s:3:\"rec\";s:1:\"0\";s:5:\"month\";s:1:\"0\";s:10:\"author_exp\";s:1:\"0\";s:8:\"fans_exp\";s:1:\"0\";s:8:\"user_exp\";s:1:\"0\";}',4), (4,4,1,'ถ้วยทอง','/upload/images/20170317/20170317180040436654527725.jpg',99979,'',1,'0.00','100.00','0.00',1488720588,'a:5:{s:3:\"rec\";s:1:\"0\";s:5:\"month\";s:1:\"0\";s:10:\"author_exp\";s:1:\"0\";s:8:\"fans_exp\";s:1:\"0\";s:8:\"user_exp\";s:1:\"0\";}',3), (7,4,1,'Mac','/upload/images/20170317/20170317180034787516420251.jpg',99950,'',1,'0.00','50.00','0.00',1488720803,'a:5:{s:3:\"rec\";s:1:\"0\";s:5:\"month\";s:1:\"0\";s:10:\"author_exp\";s:1:\"0\";s:8:\"fans_exp\";s:1:\"0\";s:8:\"user_exp\";s:1:\"0\";}',2), (8,4,1,'คอมมือสอง','/upload/images/20170317/20170317180028754600344308.jpg',99935,'',1,'0.00','10.00','0.00',1488721070,'a:5:{s:3:\"rec\";s:1:\"1\";s:5:\"month\";s:1:\"1\";s:10:\"author_exp\";s:1:\"1\";s:8:\"fans_exp\";s:1:\"1\";s:8:\"user_exp\";s:1:\"1\";}',1);

/*Table structure for table `wm_props_sell` */
DROP TABLE IF EXISTS `wm_props_sell`;

CREATE TABLE `wm_props_sell` (`sell_id` int(4) NOT NULL AUTO_INCREMENT,
 `sell_module` varchar(20) NOT NULL COMMENT '销售的模块',
 `sell_cid` int(4) NOT NULL DEFAULT '0' COMMENT '购买的内容id',
 `sell_props_id` int(4) NOT NULL COMMENT '销售产品',
 `sell_user_id` int(4) NOT NULL COMMENT '购买用户',
 `sell_number` int(1) NOT NULL DEFAULT '1' COMMENT '购买数量',
 `sell_gold1` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '购买金币1',
 `sell_gold2` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '购买金币2',
 `sell_money` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '购买现金',
 `sell_remark` varchar(100) DEFAULT NULL COMMENT '留言备注',
 `sell_time` int(4) NOT NULL DEFAULT '0' COMMENT '购买时间',
 PRIMARY KEY (`sell_id`), KEY `index_props` (`sell_props_id`),
 KEY `index_user` (`sell_user_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='道具出售记录表';

/*Data for the table `wm_props_sell` */ /*Table structure for table `wm_props_type` */
DROP TABLE IF EXISTS `wm_props_type`;

CREATE TABLE `wm_props_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_status` tinyint(1) DEFAULT '1' COMMENT '是否显示',
 `type_module` varchar(20) DEFAULT NULL COMMENT '分类所属模块',
 `type_topid` int(4) DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) DEFAULT '0' COMMENT '子栏目id',
 `type_name` varchar(20) DEFAULT NULL COMMENT '分类名字',
 `type_cname` varchar(20) DEFAULT NULL COMMENT '分类简称',
 `type_order` int(1) DEFAULT NULL COMMENT '分类排序',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT
CHARSET=utf8 COMMENT='道具分类表';

/*Data for the table `wm_props_type` */
INSERT INTO `wm_props_type`(`type_id`, `type_status`, `type_module`, `type_topid`, `type_pid`, `type_name`, `type_cname`, `type_order`) VALUES (4,1,'novel',0,'0','รางวัล','',0);

/*Table structure for table `wm_replay_replay` */
DROP TABLE IF EXISTS `wm_replay_replay`;

CREATE TABLE `wm_replay_replay` (`replay_id` int(4) NOT NULL AUTO_INCREMENT,
 `replay_floor` int(4) NOT NULL DEFAULT '1' COMMENT '评论的楼层',
 `replay_pid` varchar(200) NOT NULL DEFAULT '0' COMMENT '祖父楼层id树',
 `replay_rid` int(4) NOT NULL DEFAULT '0' COMMENT '回复的id',
 `replay_status` int(1) NOT NULL DEFAULT '1' COMMENT '1为正常,2为审核中',
 `replay_module` varchar(20) DEFAULT NULL COMMENT '模块',
 `replay_cid` int(4) NOT NULL COMMENT '内容id',
 `replay_uid` int(4) DEFAULT '0' COMMENT '用户id',
 `replay_nickname` varchar(50) NOT NULL COMMENT '姓名',
 `replay_ruid` int(4) DEFAULT '0' COMMENT '回复用户的id',
 `replay_rnickname` varchar(50) DEFAULT NULL COMMENT '回复用户的昵称',
 `replay_content` text NOT NULL COMMENT '内容',
 `replay_count` int(4) NOT NULL DEFAULT '0' COMMENT '回复数量',
 `replay_ding` int(4) NOT NULL DEFAULT '0' COMMENT '顶',
 `replay_cai` int(4) NOT NULL DEFAULT '0' COMMENT '踩',
 `replay_time` int(4) NOT NULL COMMENT '时间',
 `replay_ip` varchar(150) DEFAULT NULL COMMENT 'ip',
 PRIMARY KEY (`replay_id`), KEY `ding` (`replay_ding`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='评论表';

/*Data for the table `wm_replay_replay` */ /*Table structure for table `wm_search_search` */
DROP TABLE IF EXISTS `wm_search_search`;

CREATE TABLE `wm_search_search` (`search_id` int(4) NOT NULL AUTO_INCREMENT,
 `search_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐显示',
 `search_count` int(4) NOT NULL DEFAULT '1' COMMENT '搜索次数',
 `search_module` varchar(20) NOT NULL COMMENT '模块',
 `search_type` int(4) NOT NULL COMMENT '1为标题,2为作者,3为标签',
 `search_key` varchar(20) NOT NULL COMMENT '关键词',
 `search_data` int(4) NOT NULL DEFAULT '0' COMMENT '数据',
 `search_time` int(4) NOT NULL DEFAULT '0' COMMENT '搜索时间',
 PRIMARY KEY (`search_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='搜索记录表';

/*Data for the table `wm_search_search` */ /*Table structure for table `wm_seo_errpage` */
DROP TABLE IF EXISTS `wm_seo_errpage`;

CREATE TABLE `wm_seo_errpage` (`errpage_id` int(4) NOT NULL AUTO_INCREMENT,
 `errpage_code` int(1) DEFAULT '500' COMMENT '错误页面代码类型，404或者500',
 `errpage_url` varchar(255) DEFAULT NULL COMMENT '错误的页面地址',
 `errpage_ua` varchar(255) DEFAULT NULL COMMENT '浏览器ua',
 `errpage_time` int(4) DEFAULT '0' COMMENT '错误记录的时间',
 PRIMARY KEY (`errpage_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='错误页面统计';

/*Data for the table `wm_seo_errpage` */ /*Table structure for table `wm_seo_html` */
DROP TABLE IF EXISTS `wm_seo_html`;

CREATE TABLE `wm_seo_html` (`html_id` int(4) NOT NULL AUTO_INCREMENT,
 `html_module` varchar(20) DEFAULT NULL COMMENT '模块',
 `html_type` varchar(30) DEFAULT NULL COMMENT '类型',
 `html_type_id` int(4) NOT NULL DEFAULT '0' COMMENT '分类id',
 `html_path4` varchar(100) DEFAULT NULL COMMENT 'web静态路径',
 PRIMARY KEY (`html_id`)) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT
CHARSET=utf8 COMMENT='分类和内容静态地址表';

/*Data for the table `wm_seo_html` */
INSERT INTO `wm_seo_html`(`html_id`, `html_module`, `html_type`, `html_type_id`, `html_path4`) VALUES (118,'novel','tindex',4,'/html/novel/{tid}.html'), (119,'novel','list',4,'/html/novel/{tid}_{page}.html'), (120,'novel','content',4,'/html/novel/{nid}.html'), (121,'novel','menu',4,'/html/novel/menu/{nid}/{page}.html'), (122,'novel','read',4,'/html/novel/read/{nid}/{cid}.html'), (123,'novel','tindex',5,'/html/novel/{tid}.html'), (124,'novel','list',5,'/html/novel/{tid}_{page}.html'), (125,'novel','content',5,'/html/novel/{nid}.html'), (126,'novel','menu',5,'/html/novel/menu/{nid}/{page}.html'), (127,'novel','read',5,'/html/novel/read/{nid}/{cid}.html'), (128,'novel','tindex',6,'/html/novel/{tid}.html'), (129,'novel','list',6,'/html/novel/{tid}_{page}.html'), (130,'novel','content',6,'/html/novel/{nid}.html'), (131,'novel','menu',6,'/html/novel/menu/{nid}/{page}.html'), (132,'novel','read',6,'/html/novel/read/{nid}/{cid}.html'), (133,'novel','tindex',7,'/html/novel/{tid}.html'), (134,'novel','list',7,'/html/novel/{tid}_{page}.html'), (135,'novel','content',7,'/html/novel/{nid}.html'), (136,'novel','menu',7,'/html/novel/menu/{nid}/{page}.html'), (137,'novel','read',7,'/html/novel/read/{nid}/{cid}.html'), (138,'novel','tindex',8,'/html/novel/{tid}.html'), (139,'novel','list',8,'/html/novel/{tid}_{page}.html'), (140,'novel','content',8,'/html/novel/{nid}.html'), (141,'novel','menu',8,'/html/novel/menu/{nid}/{page}.html'), (142,'novel','read',8,'/html/novel/read/{nid}/{cid}.html'), (82,'novel','tindex',9,'/html/novel/{tid}.html'), (83,'novel','list',9,'/html/novel/{tid}_{page}.html'), (84,'novel','content',9,'/html/novel/{nid}.html'), (85,'novel','menu',9,'/html/novel/menu/{nid}/{page}.html'), (86,'novel','read',9,'/html/novel/read/{nid}/{cid}.html'), (108,'novel','tindex',1,'/html/novel/{tid}.html'), (109,'novel','list',1,'/html/novel/{tid}_{page}.html'), (110,'novel','content',1,'/html/novel/{nid}.html'), (111,'novel','menu',1,'/html/novel/menu/{nid}/{page}.html'), (112,'novel','read',1,'/html/novel/read/{nid}/{cid}.html'), (113,'novel','tindex',2,'/html/novel/{tid}.html'), (114,'novel','list',2,'/html/novel/{tid}_{page}.html'), (115,'novel','content',2,'/html/novel/{nid}.html'), (116,'novel','menu',2,'/html/novel/menu/{nid}/{page}.html'), (117,'novel','read',2,'/html/novel/read/{nid}/{cid}.html'), (100,'novel','tindex',3,'/html/novel/{tid}.html'), (101,'novel','list',3,'/html/novel/{tid}_{page}.html'), (102,'novel','content',3,'/html/novel/{nid}.html'), (103,'novel','menu',3,'/html/novel/menu/{nid}/{page}.html'), (104,'novel','read',3,'/html/novel/read/{nid}/{cid}.html'), (143,'article','tindex',1,'/html/article/{tid}.html'), (144,'article','list',1,'/html/article/list/{tid}_{page}.html'), (145,'article','content',1,'/html/article/content/{aid}.html'), (146,'article','tindex',2,'/html/article/{tid}.html'), (147,'article','list',2,'/html/article/list/{tid}_{page}.html'), (148,'article','content',2,'/html/article/content/{aid}.html'), (149,'article','tindex',3,'/html/article/{tid}.html'), (150,'article','list',3,'/html/article/list/{tid}_{page}.html'), (151,'article','content',3,'/html/article/content/{aid}.html'), (152,'picture','list',1,'/html/picture/{tid}_{page}.html'), (153,'picture','content',1,'/html/picture/{nid}.html'), (154,'picture','list',2,'/html/picture/{tid}_{page}.html'), (155,'picture','content',2,'/html/picture/{nid}.html');

/*Table structure for table `wm_seo_html_plan` */
DROP TABLE IF EXISTS `wm_seo_html_plan`;

CREATE TABLE `wm_seo_html_plan` (`plan_id` int(4) NOT NULL AUTO_INCREMENT,
 `plan_name` varchar(30) NOT NULL COMMENT '任务名字',
 `plan_url` varchar(250) NOT NULL COMMENT 'url连接',
 `plan_data` varchar(500) DEFAULT NULL COMMENT 'post参数',
 `plan_path` varchar(100) NOT NULL COMMENT '保存路径',
 `plan_lasttime` int(4) NOT NULL DEFAULT '0' COMMENT '最后执行时间',
 `plan_addtime` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间',
 PRIMARY KEY (`plan_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='html任务表';

/*Data for the table `wm_seo_html_plan` */ /*Table structure for table `wm_seo_keys` */
DROP TABLE IF EXISTS `wm_seo_keys`;

CREATE TABLE `wm_seo_keys` (`keys_id` int(11) NOT NULL AUTO_INCREMENT,
 `keys_module` varchar(20) DEFAULT NULL COMMENT '所属模块',
 `keys_page` varchar(50) NOT NULL COMMENT '页面标识',
 `keys_pagename` varchar(30) DEFAULT NULL COMMENT '页面名字 /* SubMaRk */',
 `keys_title` varchar(80) NOT NULL COMMENT '页面标题',
 `keys_key` varchar(150) NOT NULL COMMENT '页面关键字',
 `keys_desc` varchar(250) NOT NULL COMMENT '页面描述',
 PRIMARY KEY (`keys_id`), UNIQUE KEY `page` (`keys_page`)) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT
CHARSET=utf8 COMMENT='seo关键词表';

/*Data for the table `wm_seo_keys` */
INSERT INTO `wm_seo_keys`(`keys_id`, `keys_module`, `keys_page`, `keys_pagename`, `keys_title`, `keys_key`, `keys_desc`) VALUES (1,'all','index','หน้าหลัก','หน้าหลัก - {网站名}','{网站名}','{网站名}'), (2,'novel','novel_type','รายชื่อนิยาย','รายชื่อนิยาย{分类名字}ล่าสุด - {网站名}','รายชื่อนิยาย{分类名字}ล่าสุด，{网站名}','รายชื่อนิยาย{分类名字}ล่าสุด，{网站名}'), (3,'novel','novel_info','อัปเดทบทนิยาย','{名字} บทล่าสุด - {作者} - {类型}','{名字} บทล่าสุด - {作者} - {类型}','{简介:150}'), (4,'novel','novel_menu','สารบัญนิยาย','{名字}','{名字}','{简介:100}'), (5,'novel','novel_read','อ่านนิยาย','{名字} - {章节名字}','{名字} - {章节名字}','{名字} - {章节名字}'), (6,'novel','novel_topindex','หน้าหลักอันดับนิยาย','หน้าหลักอันดับนิยาย','หน้าหลักอันดับนิยาย','หน้าหลักอันดับนิยาย'), (7,'novel','novel_search','ค้นหานิยาย','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}'), (8,'novel','novel_toplist','รายชื่ออันดับนิยาย','อันดับนิยาย {类型排行}','{类型排行},อันดับนิยาย','อันดับนิยาย {类型排行}'), (9,'user','user_reg','ลงทะเบียน','ลงทะเบียน - {网站名}','ลงทะเบียน,{网站名}','{网站名} ศูนย์ลงทะเบียนผู้ใช้ใหม่'), (10,'user','user_login','เข้าสู่ระบบ','เข้าสู่ระบบ - {网站名}','เข้าสู่ระบบ,{网站名}','{网站名} เข้าสู่ระบด้วยบัญชีที่มีอยู่แล้ว'), (11,'user','user_getpsw','กู้คืนรหัสผ่าน','กู้คืนรหัสผ่าน - {网站名}','กู้คืนรหัสผ่าน','กู้คืนรหัสผ่าน'), (12,'user','user_home','ศูนย์ผู้ใช้','ศูนย์ผู้ใช้ - {网站名}','ศูนย์ผู้ใช้,{网站名}','{用户名} ศูนย์ผู้ใช้'), (13,'user','user_repsw','รีเซ็ตรหัสผ่าน','รีเซ็ตรหัสผ่าน - {网站名}','รีเซ็ตรหัสผ่าน,{网站名}','รีเซ็ตรหัสผ่านผู้ใช้'), (14,'user','user_basic','ข้อมูลผู้ใช้','ข้อมูลผู้ใช้ - {网站名}','ข้อมูลผู้ใช้,{网站名}','{用户名} ข้อมูลของผู้ใช้'), (15,'user','user_attribute','คุณสมบัติผู้ใช้','คุณสมบัติผู้ใช้ - {网站名}','คุณสมบัติผู้ใช้,{网站名}','{用户名} คุณสมบัติของผู้ใช้'), (17,'user','user_head','เปลี่ยนอวตาล','เปลี่ยนอวตาล - {网站名}','เปลี่ยนอวตาล,{网站名}','เปลี่ยนอวตาล'), (18,'user','user_uppsw','เปลี่ยนรหัสผ่าน','เปลี่ยนรหัสผ่าน - {网站名}','เปลี่ยนรหัสผ่าน,{网站名}','เปลี่ยนรหัสผ่าน'), (19,'user','user_varemail','ยืนยันอีเมล์','ยืนยันอีเมล์ - {网站名}','ยืนยันอีเมล์,{网站名}','ยืนยันอีเมล์'), (20,'user','user_shelf','ชั้นหนังสือ','ชั้นหนังสือ - {网站名}','ชั้นหนังสือ','ชั้นหนังสือ'), (21,'user','user_coll','รายการที่ชอบ','รายการที่ชอบ - {网站名}','รายการที่ชอบ,{网站名}','รายการที่ชอบ'), (22,'user','user_fhome','ดูโปรไฟล์เพื่อน','ดูโปรไฟล์เพื่อน - {网站名}','ดูโปรไฟล์เพื่อน,{网站名}','โปรไฟล์ของ {用户名}'), (23,'novel','novel_replay','รายการความคิดเห็นนิยาย','รายการความคิดเห็นของ {名字}','{名字} ความคิดเห็น','รายการความคิดเห็นของ {名字}'), (24,'user','user_msglist','รายการข้อความ','รายการข้อความ - {网站名}','รายการข้อความ,网站名}','รายการข้อความ - {网站名}'), (25,'user','user_msg','เนื้อหาข้อความ','เนื้อหาข้อความ - {网站名}','เนื้อหาข้อความ,{网站名}','เนื้อหาข้อความ - {网站名}'), (26,'author','author_index','ศูนย์นักเชียน','ศูนย์นักเชียน - {网站名}','ศูนย์นักเชียน,{网站名}','ศูนย์นักเชียน - {网站名}'), (27,'author','author_novel_novellist','จัดการนิยาย','จัดการงาน - {网站名}','จัดการงาน,{网站名}','จัดการงาน - {网站名}'), (28,'author','author_novel_noveledit','แก้ไขนิยาย','แก้ไขงาน - {网站名}','แก้ไขงาน,{网站名}','แก้ไขงาน - {网站名}'), (29,'author','author_novel_volumelist','รายการเล่มนิยาย','รายการเล่มนิยาย - {网站名}','รายการเล่มนิยาย,{网站名}','รายการเล่มนิยาย - {网站名}'), (30,'author','author_createchapter','เขียนบทใหม่','เขียนบทใหม่ - {网站名}','เขียนบทใหม่,{网站名}','เขียนบทใหม่ - {网站名}'), (31,'author','author_novel_draftlist','ร่างนิยาย','กล่องร่าง - {网站名}','กล่องร่าง,{网站名}','กล่องร่าง - {网站名}'), (32,'author','author_novel_chapterlist','รายการบท','รายการบท - {网站名}','รายการบท,{网站名}','รายการบท - {网站名}'), (33,'author','author_novel_draftedit','แก้ไขร่างนิยาย','แก้ไขร่าง - {网站名}','แก้ไขร่าง,{网站名}','แก้ไขร่าง - {网站名}'), (34,'zt','zt_type','รายการกระทู้','รายการกระทู้ - {网站名}','รายการกระทู้,{网站名}','รายการกระทู้ - {网站名}'), (37,'user','user_vistlist','รายการผู้ชมล่าสุด','รายการผู้ชมล่าสุด - {网站名}','รายการผู้ชมล่าสุด,{网站名}','รายการผู้ชมล่าสุด - {网站名}'), (38,'author','author_basic','ข้อมูลทั่วไปนักเขียน','ข้อมูลทั่วไปนักเขียน - {网站名}','ข้อมูลทั่วไปนักเขียน,{网站名}','ข้อมูลทั่วไปนักเขียน - {网站名}'), (39,'author','author_incomechapter','รายได้จากบท','รายได้จากบท - {网站名}','รายได้จากบท,{网站名}','รายได้จากบท - {网站名}'), (40,'author','author_incomedashang','รายได้จากรางวัล','รายได้จากรางวัล - {网站名}','รายได้จากรางวัล,{网站名}','รายได้จากรางวัล - {网站名}'), (41,'author','author_mentionapply','ยื่นขอถอนเงิน','ยื่นขอถอนเงิน - {网站名}','ยื่นขอถอนเงิน,{网站名}','ยื่นขอถอนเงิน - {网站名}'), (42,'author','author_mentionrecord','บันทึกการถอนเงิน','บันทึกการถอนเงิน - {网站名}','บันทึกการถอนเงิน,{网站名}','บันทึกการถอนเงิน - {网站名}'), (43,'article','article_article','เนื้อหาบทความ','{标题} - {网站名}','{标题} - {网站名}','{标题} - {网站名}'), (44,'article','article_type','รายการหมวดหมู่บทความ','{分类名} - {网站名}','{分类名} - {网站名}','{分类名} - {网站名}'), (45,'article','article_search','ค้นหาบทความ','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}'), (46,'article','article_replay','ความคิดเห็นบทความ','รายการความคิดเห็น่ทั้งหมดของ {标题}','รายการความคิดเห็น่ทั้งหมดของ {标题}','รายการความคิดเห็น่ทั้งหมดของ {标题}'), (47,'message','message_add','เพิ่มคำติชม','เพิ่มคำติชม - {网站名}','เพิ่มคำติชม,{网站名}','เพิ่มคำติชม'), (48,'user','user_sign','เช็คชื่อ','เช็คชื่อ','เช็คชื่อ','เช็คชื่อ'), (49,'bbs','bbs_index','หน้าหลักเว็บบอร์ด','หน้าหลักเว็บบอร์ด - {网站名}','หน้าหลักเว็บบอร์ด,{网站名}','หน้าหลักเว็บบอร์ด - {网站名}'), (50,'bbs','bbs_type','รายการบอร์ด','รายการบอร์ด - {网站名}','รายการบอร์ด,{网站名}','รายการบอร์ด - {网站名}'), (51,'bbs','bbs_list','รายการกระทู้','รายการกระทู้ใน {版块名字}','รายการกระทู้ใน {版块名字}','รายการกระทู้ใน {版块名字}'), (52,'bbs','bbs_bbs','เนื้อหากระทู้','{标题} - {网站名}','{标题},{网站名}','{标题} - {网站名}'), (75,'article','article_tindex','หน้าหลักหมวดหมู่บทความ','{分类名} - {网站名}','{分类名} - {网站名}','{分类名} - {网站名}'), (54,'bbs','bbs_post','ตั้งกระทู้ใหม่','ตั้งกระทู้ใหม่ - {网站名}','ตั้งกระทู้ใหม่,{网站名}','ตั้งกระทู้ใหม่ - {网站名}'), (55,'link','link_index','หน้าหลักลิงก์พันธมิตร','หน้าหลักลิงก์พันธมิตร - {网站名}','หน้าหลักลิงก์พันธมิตร,{网站名}','หน้าหลักลิงก์พันธมิตร - {网站名}'), (56,'link','link_type','หมวดหมู่ลิ้งก์พันธมิตร','{分类名字} - {网站名}','{分类名字},{网站名}','{分类名字} - {网站名}'), (57,'link','link_show','แสดงลิ้งก์พันธมิตร','{友链名字} - {网站名}','{友链名字},{网站名}','{友链名字} - {网站名}'), (58,'link','link_join','ลงทะเบียนลิ้งก์พันธมิตร','ลงทะเบียนลิ้งก์พันธมิตร - {网站名}','ลงทะเบียนลิ้งก์พันธมิตร,{网站名}','ลงทะเบียนลิ้งก์พันธมิตร - {网站名}'), (59,'app','app_type','รายการหมวดหมู่แอปฯ','{类型名} - {网站名}','{类型名},{网站名}','{类型名} - {网站名}'), (60,'app','app_app','ข้อมูลแอปฯ','{名字} - {网站名}','{名字},{网站名}','{名字} - {网站名}'), (61,'app','app_index','หน้าหลักแอปฯ','ศูนย์ดาวน์โหลดแอปฯ - {网站名}','ศูนย์ดาวน์โหลดแอปฯ,{网站名}','ศูนย์ดาวน์โหลดแอปฯ - {网站名}'), (62,'app','app_search','ค้นหาแอปฯ','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}'), (63,'article','article_index','หน้าหลักบทความ','หน้าหลักบทความ - {网站名}','หน้าหลักบทความ,{网站名}','หน้าหลักบทความ - {网站名}'), (64,'bbs','bbs_search','ค้นหาบอร์ด','ค้นหาบอร์ด - {网站名}','ค้นหาบอร์ด,{网站名}','ค้นหาบอร์ด - {网站名}'), (65,'about','about_type','รายการข้อมูลเกี่ยวกับ','{分类名字} - {网站名}','{分类名字},{网站名}','{分类名字} - {网站名}'), (66,'about','about_about','หน้าเนื้อหาข้อมูลเกี่ยวกับ','{标题} - {网站名}','{标题},{网站名}','{标题} - {网站名}'), (67,'user','user_apilogin','ลงทะเบียนผ่านบุคคลที่สาม','ปรับปรุงข้อมูลบัญชี - {网站名}','ปรับปรุงข้อมูลบัญชี,{网站名}','ปรับปรุงข้อมูลบัญชี - {网站名}'), (68,'picture','picture_picture','เนื้อหารูปภาพ','{标题} - {网站名}','{标题} - {网站名}','{标题} - {网站名}'), (69,'picture','picture_type','รายการหมวดหมู่อัลบั้ม','{分类名字} - {网站名}','{分类名字} - {网站名}','{分类名字} - {网站名}'), (70,'picture','picture_search','ค้นหารูปภาพ','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}','ผลการค้่นหาของ {搜索词}'), (71,'picture','picture_replay','ความคิดเห็นอัลบั้ม','รายการความคิดเห็น่ทั้งหมดของ {标题}','รายการความคิดเห็น่ทั้งหมดของ {标题}','รายการความคิดเห็น่ทั้งหมดของ {标题}'), (72,'picture','picture_toplist','รายการอันดับอัลบั้ม','อันดับรูปภาพ {排行类型}','อันดับรูปภาพ {排行类型}','อันดับรูปภาพ {排行类型}'), (73,'user','user_signlist','รายการเช็คชื่อ','รายการเช็คชื่อ','รายการเช็คชื่อ','รายการเช็คชื่อ'), (74,'novel','novel_index','หน้าหลักนิยาย','หน้าหลักนิยาย','หน้าหลักนิยาย','หน้าหลักนิยาย'), (76,'picture','picture_index','หน้าหลักอัลบั้ม','หน้าหลักอัลบั้ม - {网站名}','หน้าหลักอัลบั้ม-{网站名}','หน้าหลักอัลบั้ม - {网站名}'), (77,'user','user_rec','คำแนะนำของฉัน','คำแนะนำของฉัน - {网站名}','คำแนะนำของฉัน','คำแนะนำของฉัน'), (78,'user','user_dingyue','การซื้อของฉัน','การซื้อของฉัน - {网站名}','การซื้อของฉัน','การซื้อของฉัน'), (79,'user','user_fcoll','รายการที่ชอบของเพื่อน','รายการที่ชอบของ {好友昵称} - {网站名}','ายการที่ชอบของ {好友昵称},{网站名}','รายการที่ชอบของ {好友昵称} - {网站名}'), (80,'user','user_fdingyue','การซื้อของเพื่อน','การซื้อของ {好友昵称} - {网站名}','การซื้อของ {好友昵称} ,{网站名}','การซื้อของ {好友昵称} - {网站名}'), (81,'user','user_frec','คำแนะนำของเพื่อน','คำแนะนำของ {好友昵称} - {网站名}','คำแนะนำของ {好友昵称},{网站名}','คำแนะนำของ {好友昵称} - {网站名}'), (82,'user','user_fshelf','ชั้นหนังสือของเพื่อน','ชั้นหนังสือของ {好友昵称} - {网站名}','ชั้นหนังสือของ {好友昵称},{网站名}','ชั้นหนังสือของ {好友昵称} - {网站名}'), (83,'novel','novel_tindex','หน้าหลักหมวดหมู่','{分类名字} - หน้าหลักหมวดหมู่นิยาย - {网站名}','{分类名字} - หน้าหลักหมวดหมู่นิยาย - {网站名}','{分类名字} - หน้าหลักหมวดหมู่นิยาย - {网站名}'), (84,'author','author_apply','ลงทะเบียนเป็นนักเขียน','ลงทะเบียนเป็นนักเขียน - {网站名}','ลงทะเบียนเป็นนักเขียน,{网站名}','ลงทะเบียนเป็นนักเขียน - {网站名}'), (85,'author','author_agreement','ข้อตกลงการลงทะเบียนเป็นนักเขียน','ข้อตกลงการลงทะเบียนเป็นนักเขียน - {网站名}','ข้อตกลงการลงทะเบียนเป็นนักเขียน,{网站名}','ข้อตกลงการลงทะเบียนเป็นนักเขียน - {网站名}'), (86,'author','author_novel_volumeedit','แก้ไขเล่มนิยาย','แก้ไขเล่มนิยาย - {网站名}','แก้ไขเล่มนิยาย,{网站名}','แก้ไขเล่มนิยาย - {网站名}'), (87,'author','author_article_articlelist','รายการบทความที่เขียน','รายการบทความที่เขียน - {网站名}','รายการบทความที่เขียน,{网站名}','รายการบทความที่เขียน - {网站名}'), (88,'author','author_article_draftedit','แก้ไขร่างบทความ','แก้ไขร่าง - {网站名}','แก้ไขร่าง,{网站名}','แก้ไขร่าง - {网站名}'), (89,'author','author_article_draftlist','กล่องร่างบทความ','กล่องร่าง - {网站名}','กล่องร่าง,{网站名}','กล่องร่าง - {网站名}'), (90,'author','author_article_articleedit','แก้ไขบทความ','แก้ไขบทความ - {网站名}','แก้ไขบทความ,{网站名}','แก้ไขบทความ - {网站名}'), (91,'user','user_charge','เติมเงินออนไลน์','เติมเงินออนไลน์ - {网站名}','เติมเงินออนไลน์,{网站名}','เติมเงินออนไลน์ - {网站名}'), (92,'author','author_novel_incomelist','รายการรายได้จากนิยาย','รายการรายได้จากนิยาย - {网站名}','รายการรายได้จากนิยาย,{网站名}','รายการรายได้จากนิยาย - {网站名}'), (93,'user','user_cash_apply','ยื่นถอนเงินออนไลน์','ยื่นถอนเงินออนไลน์ - {网站名}','ยื่นถอนเงินออนไลน์,{网站名}','ยื่นถอนเงินออนไลน์ - {网站名}'), (94,'user','user_cash_list','บันทึกการถอนเงิน','บันทึกการถอนเงิน - {网站名}','บันทึกการถอนเงิน,{网站名}','บันทึกการถอนเงิน - {网站名}'), (95,'about','about_tindex','หน้าหลักเกี่ยวกับ','หน้าหลักเกี่ยวกับ - {网站名}','หน้าหลักเกี่ยวกับ,{网站名}','หน้าหลักเกี่ยวกับ - {网站名}'), (96,'down','down_down','ดาวน์โหลดเนื้อหา','{下载内容} - {网站名}','{下载内容},{网站名}','{下载内容} - {网站名}'), (97,'novel','novel_index_boy','หน้าหลักนิยายผู้ชาย','หน้าหลักนิยายผู้ชาย','หน้าหลักนิยายผู้ชาย','หน้าหลักนิยายผู้ชาย'), (98,'novel','novel_index_girl','หน้าหลักนิยายผู้หญิง','หน้าหลักนิยายผู้หญิง','หน้าหลักนิยายผู้หญิง','หน้าหลักนิยายผู้หญิง'), (99,'user','user_read','ประวัติการอ่าน','ประวัติการอ่าน - {网站名}','ประวัติการอ่าน,{网站名}','ประวัติการอ่าน - {网站名}'), (100,'user','user_sub','การซื้อของฉัน','การซื้อของฉัน - {网站名}','การซื้อของฉัน,{网站名}','การซื้อของฉัน - {网站名}'), (101,'user','user_charge_code','สแกนเพื่อจ่าย','สแกนคิวอาร์โค้ดเพื่อชำระผ่าน {支付方式} - {网站名}','สแกนคิวอาร์โค้ดเพื่อชำระผ่าน {支付方式},{网站名}','สแกนคิวอาร์โค้ดเพื่อชำระผ่าน {支付方式} - {网站名}'), (102,'user','user_charge_success','เติมเงินสำเร็จ','เติมเงินสำเร็จ - {网站名}','เติมเงินสำเร็จ,{网站名}','เติมเงินสำเร็จ - {网站名}'), (103,'zt','zt_zt','รายละเอียดกระทู้','{名字} - {网站名}','{名字},{网站名}','{名字} - {网站名}'), (104,'app','app_replay','รายการความคิดเห็นของ {名字}','รายการความคิดเห็นของ {名字}','ความคิดเห็นของ {名字}','รายการความคิดเห็นของ {名字}'), (105,'picture','picture_tindex','หน้าหลักหมวดหมู่','{分类名字} - หน้าหลักหมวดหมู่อัลบั้ม - {网站名}','{分类名字} - หน้าหลักหมวดหมู่อัลบั้ม - {网站名}','{分类名字} - หน้าหลักหมวดหมู่นิยาย - {网站名}'), (106,'author','author_author','ศูนย์นักเชียน','{笔名} - {网站名}','{笔名},{网站名}','{笔名} - {网站名}');

/*Table structure for table `wm_seo_spider` */
DROP TABLE IF EXISTS `wm_seo_spider`;

CREATE TABLE `wm_seo_spider` (`spider_id` int(4) NOT NULL AUTO_INCREMENT,
 `spider_group` varchar(30) DEFAULT NULL COMMENT '蜘蛛的分组',
 `spider_group_name` varchar(30) DEFAULT NULL COMMENT '蜘蛛分组的名字',
 `spider_name` varchar(30) DEFAULT NULL COMMENT '蜘蛛的名字',
 `spider_title` varchar(30) DEFAULT NULL COMMENT '蜘蛛的标识',
 `spider_url` varchar(1000) DEFAULT NULL COMMENT '蜘蛛爬行的url',
 `spider_ua` varchar(1000) DEFAULT NULL COMMENT '蜘蛛的ua',
 `spider_time` int(4) DEFAULT NULL COMMENT '蜘蛛爬行时间',
 PRIMARY KEY (`spider_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='蜘蛛爬行记录表';

/*Data for the table `wm_seo_spider` */ /*Table structure for table `wm_seo_urls` */
DROP TABLE IF EXISTS `wm_seo_urls`;

CREATE TABLE `wm_seo_urls` (`urls_id` int(4) NOT NULL AUTO_INCREMENT,
 `urls_module` varchar(20) DEFAULT NULL COMMENT '所属模块',
 `urls_page` varchar(50) NOT NULL COMMENT '页面标识',
 `urls_pagename` varchar(40) DEFAULT NULL COMMENT '页面名字 /* SubMaRk */',
 `urls_url1` varchar(250) NOT NULL COMMENT '动态地址',
 `urls_url2` varchar(250) NOT NULL COMMENT '静态地址',
 `urls_url3` varchar(250) DEFAULT NULL COMMENT '普通模式地址',
 `urls_url4` varchar(250) DEFAULT NULL COMMENT '兼容模式地址',
 `urls_url5` varchar(250) DEFAULT NULL COMMENT 'PATHINFO模式地址',
 `urls_url6` varchar(250) DEFAULT NULL COMMENT 'REWRITE模式地址',
 PRIMARY KEY (`urls_id`), UNIQUE KEY `page` (`urls_page`)) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT
CHARSET=utf8 COMMENT='seo伪静态地址';

/*Data for the table `wm_seo_urls` */
INSERT INTO `wm_seo_urls`(`urls_id`, `urls_module`, `urls_page`, `urls_pagename`, `urls_url1`, `urls_url2`, `urls_url3`, `urls_url4`, `urls_url5`, `urls_url6`) VALUES (1,'all','index','หน้าหลัก','/index.php?pt={pt}','/inde x.html','/','/','/','/'), (2,'novel','novel_type','รายชื่อนิยาย','/module/novel/type.php?pt={pt}&tid={tid}&page={page}','/{tid}/list/{page}.html','/?pt={pt}&module=novel&file=type&tid={tid}&page={page}','/?path=/novel/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/novel/type/pt/{pt}/tid/{tid}/page/{page}','/novel/type/pt/{pt}/tid/{tid}/page/{page}'), (3,'novel','novel_info','ข้อมูลนิยาย','/module/novel/info.php?pt={pt}&tid={tid}&nid={nid}','/{tid}/{nid}/info.html','/?module=novel&file=info&pt={pt}&tid={tid}&nid={nid}','/?path=/novel/info/pt/{pt}/tid/{tid}/nid/{nid}','/index.php/novel/info/pt/{pt}/tid/{tid}/nid/{nid}','/novel/info/pt/{pt}/tid/{tid}/nid/{nid}'), (4,'novel','novel_menu','สารบัญนิยาย','/module/novel/menu.php?pt={pt}&tid={tid}&nid={nid}&page={page}','/{tid}/{nid}/menu/{page}.html','/?module=novel&file=menu&pt={pt}&tid={tid}&nid={nid}&page={page}','/?path=/novel/menu/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/index.php/novel/menu/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/novel/menu/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}'), (5,'novel','novel_read','อ่านนิยาย','/module/novel/read.php?pt={pt}&tid={tid}&nid={nid}&cid={cid}','/{tid}/{nid}/read/{cid}.html','/?module=novel&file=read&pt={pt}&tid={tid}&nid={nid}&cid={cid}','/?path=/novel/read/pt/{pt}/tid/{tid}/nid/{nid}/cid/{cid}','/index.php/novel/read/pt/{pt}/tid/{tid}/nid/{nid}/cid/{cid}','/novel/read/pt/{pt}/tid/{tid}/nid/{nid}/cid/{cid}'), (6,'novel','novel_topindex','หน้าหลักอันดับนิยาย','/module/novel/topindex.php?pt={pt}','/top/index.html','/?module=novel&file=topindex&pt={pt}','/?path=/novel/topindex/pt/{pt}','/index.php/novel/topindex/pt/{pt}','/novel/topindex/pt/{pt}'), (7,'novel','novel_search','ค้นหานิยาย','/module/novel/search.php?pt={pt}&type={type}&key={key}&page={page}','/search/{type}/{key}/{page}.html','/?module=novel&file=search&pt={pt}&type={type}&key={key}&page={page}','/?path=/novel/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/index.php/novel/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/novel/search/pt/{pt}/type/{type}/key/{key}/page/{page}'), (8,'novel','novel_toplist','รายการอันดับนิยาย','/module/novel/toplist.php?pt={pt}&tid={tid}&type={type}&page={page}','/top/list/{tid}/{type}/{page}.html','/?module=novel&file=toplist&pt={pt}&tid={tid}&type={type}&page={page}','/?path=/novel/toplist/pt/{pt}/tid/{tid}/type/{type}/page/{page}','/index.php/novel/toplist/pt/{pt}/tid/{tid}/type/{type}/page/{page}','/novel/toplist/pt/{pt}/tid/{tid}/type/{type}/page/{page}'), (9,'user','user_login','เข้าสู่ระบบ','/module/user/login.php?pt={pt}','/module/user/login.php?pt={pt}','/?module=user&file=login&pt={pt}','/?path=/user/login/pt/{pt}','/index.php/user/login/pt/{pt}','/user/login/pt/{pt}'), (10,'user','user_reg','ลงทะเบียน','/module/user/reg.php?pt={pt}','/module/user/reg.php?pt={pt}','/?module=user&file=reg&pt={pt}','/?path=/user/reg/pt/{pt}','/index.php/user/reg/pt/{pt}','/user/reg/pt/{pt}'), (11,'user','user_getpsw','กู้คืนรหัสผ่าน','/module/user/getpsw.php?pt={pt}','/module/user/getpsw.php?pt={pt}','/?module=user&file=getpsw&pt={pt}','/?path=/user/getpsw/pt/{pt}','/index.php/user/getpsw/pt/{pt}','/user/getpsw/pt/{pt}'), (12,'user','user_home','ศูนย์ผู้ใช้','/module/user/home.php?pt={pt}','/module/user/home.php?pt={pt}','/?module=user&file=home&pt={pt}','/?path=/user/home/pt/{pt}','/index.php/user/home/pt/{pt}','/user/home/pt/{pt}'), (13,'user','user_exit','ออกจากระบบ','/module/user/exit.php?pt={pt}','/module/user/exit.php?pt={pt}','/?module=user&file=exit&pt={pt}','/?path=/user/exit/pt/{pt}','/index.php/user/exit/pt/{pt}','/user/exit/pt/{pt}'), (14,'user','user_basic','ข้อมูลผู้ใช้','/module/user/basic.php?pt={pt}','/module/user/basic.php?pt={pt}','/?module=user&file=basic&pt={pt}','/?path=/user/basic/pt/{pt}','/index.php/user/basic/pt/{pt}','/user/basic/pt/{pt}'), (16,'user','user_attribute','คุณสมบัติผู้ใช้','/module/user/attribute.php?pt={pt}','/module/user/attribute.php?pt={pt}','/?module=user&file=attribute&pt={pt}','/?path=/user/attribute/pt/{pt}','/index.php/user/attribute/pt/{pt}','/user/attribute/pt/{pt}'), (18,'user','user_head','เปลี่ยนอวตาล','/module/user/head.php?pt={pt}','/module/user/head.php?pt={pt}','/?module=user&file=head&pt={pt}','/?path=/user/head/pt/{pt}','/index.php/user/head/pt/{pt}','/user/head/pt/{pt}'), (19,'user','user_uppsw','เปลี่ยนรหัสผ่าน','/module/user/uppsw.php?pt={pt}','/module/user/uppsw.php?pt={pt}','/?module=user&file=uppsw&pt={pt}','/?path=/user/uppsw/pt/{pt}','/index.php/user/uppsw/pt/{pt}','/user/uppsw/pt/{pt}'), (20,'user','user_varemail','ยืนยันอีเมล์','/module/user/varemail.php?pt={pt}','/module/user/varemail.php?pt={pt}','/?module=user&file=varemail&pt={pt}','/?path=/user/varemail/pt/{pt}','/index.php/user/varemail/pt/{pt}','/user/varemail/pt/{pt}'), (22,'user','user_coll','รายการชื่นชอบ','/module/user/coll.php?module={module}&type={type}&page={page}&pt={pt}','/module/user/coll.php?module={module}&type={type}&page={page}&pt={pt}','/?module=user&file=coll&module={module}&type={type}&page={page}&pt={pt}','/?path=/user/coll/module/{module}/type/{type}/page/{page}/pt/{pt}','/index.php/user/coll/module/{module}/type/{type}/page/{page}/pt/{pt}','/user/coll/module/{module}/type/{type}/page/{page}/pt/{pt}'), (24,'novel','novel_replay','รายการความคิดเห็น','/module/novel/replay.php?pt={pt}&tid={tid}&nid={nid}&page={page}','/{tid}/{nid}/replay/{page}.html','/?module=novel&file=replay&pt={pt}&tid={tid}&nid={nid}&page={page}','/?path=/novel/replay/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/index.php/novel/replay/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}','/novel/replay/pt/{pt}/tid/{tid}/nid/{nid}/page/{page}'), (26,'diy','diy_diy','หน้าเดี่ยว','/module/diy/diy.php?pt={pt}&did={did}','/diy/{pinyin}/index.html','/?module=diy&file=diy&pt={pt}&did={did}','/?path=/diy/diy/pt/{pt}/did/{did}','/index.php/diy/diy/pt/{pt}/did/{did}','/diy/diy/pt/{pt}/did/{did}'), (27,'user','user_msglist','รายการข้อความ','/module/user/msglist.php?pt={pt}&page={page}','/module/user/msglist.php?pt={pt}&page={page}','/?module=user&file=msglist&pt={pt}&page={page}','/?path=/user/msglist/pt/{pt}/page/{page}','/index.php/user/msglist/pt/{pt}/page/{page}','/user/msglist/pt/{pt}/page/{page}'), (28,'user','user_msg','เนื้อหาข้อความ','/module/user/msg.php?pt={pt}&mid={mid}','/module/user/msg.php?pt={pt}&mid={mid}','/?module=user&file=msg&pt={pt}&mid={mid}','/?path=/user/msg/pt/{pt}/mid/{mid}','/index.php/user/msg/pt/{pt}/mid/{mid}','/user/msg/pt/{pt}/mid/{mid}'), (29,'author','author_index','หน้าหลักนักเขียน','/module/author/index.php?pt={pt}','/module/author/index.php?pt={pt}','/?module=author&file=index&pt={pt}','/?path=/author/index/pt/{pt}','/index.php/author/index/pt/{pt}','/author/index/pt/{pt}'), (30,'author','author_novel_noveledit','เพิ่มนิยายใหม่','/module/author/novel_noveledit.php?pt={pt}&nid={nid}','/module/author/novel_noveledit.php?pt={pt}&nid={nid}','/?module=author&file=novel_noveledit&pt={pt}&nid={nid}','/?path=/author/novel_noveledit/pt/{pt}/nid/{nid}','/index.php/author/novel_noveledit/pt/{pt}/nid/{nid}','/author/novel_noveledit/pt/{pt}/nid/{nid}'), (31,'author','author_novel_novellist','จัดการนิยาย','/module/author/novel_novellist.php?pt={pt}&page={page}','/module/author/novel_novellist.php?pt={pt}&page={page}','/?module=author&file=novel_novellist&pt={pt}&page={page}','/?path=/author/novel_novellist/pt/{pt}/page/{page}','/index.php/author/novel_novellist/pt/{pt}/page/{page}','/author/novel_novellist/pt/{pt}/page/{page}'), (32,'author','author_novel_volumelist','รายการเล่มนิยาย','/module/author/novel_volumelist.php?pt={pt}&nid={nid}&page={page}','/module/author/novel_volumelist.php?pt={pt}&nid={nid}&page={page}','/?module=author&file=novel_volumelist&pt={pt}&nid={nid}&page={page}','/?path=/author/novel_volumelist/pt/{pt}/nid/{nid}/page/{page}','/index.php/author/novel_volumelist/pt/{pt}/nid/{nid}/page/{page}','/author/novel_volumelist/pt/{pt}/nid/{nid}/page/{page}'), (33,'author','author_createchapter','เขียนบทใหม่','/module/author/createchapter.php?pt={pt}&cid={cid}','/module/author/createchapter.php?pt={pt}&cid={cid}','/?module=author&file=createchapter&pt={pt}&cid={cid}','/?path=/author/createchapter/pt/{pt}/cid/{cid}','/index.php/author/createchapter/pt/{pt}/cid/{cid}','/author/createchapter/pt/{pt}/cid/{cid}'), (34,'author','author_novel_draftlist','รายการร่างนิยาย','/module/author/novel_draftlist.php?nid={nid}&page={page}&pt={pt}','/module/author/novel_draftlist.php?nid={nid}&page={page}&pt={pt}','/?module=author&file=novel_draftlist&nid={nid}&page={page}&pt={pt}','/?path=/author/novel_draftlist/nid/{nid}/page/{page}/pt/{pt}','/index.php/author/novel_draftlist/nid/{nid}/page/{page}/pt/{pt}','/author/novel_draftlist/nid/{nid}/page/{page}/pt/{pt}'), (36,'author','author_novel_draftedit','แก้ไขร่างนิยาย','/module/author/novel_draftedit.php?pt={pt}&nid={nid}&did={did}','/module/author/novel_draftedit.php?pt={pt}&nid={nid}&did={did}','/?module=author&file=novel_draftedit&pt={pt}&nid={nid}&did={did}','/?path=/author/novel_draftedit/pt/{pt}/nid/{nid}/did/{did}','/index.php/author/novel_draftedit/pt/{pt}/nid/{nid}/did/{did}','/author/novel_draftedit/pt/{pt}/nid/{nid}/did/{did}'), (37,'author','author_novel_chapterlist','รายการบทนิยาย','/module/author/novel_chapterlist.php?pt={pt}&nid={nid}&page={page}','/module/author/novel_chapterlist.php?pt={pt}&nid={nid}&page={page}','/?module=author&file=novel_chapterlist&pt={pt}&nid={nid}&page={page}','/?path=/author/novel_chapterlist/pt/{pt}/nid/{nid}/page/{page}','/index.php/author/novel_chapterlist/pt/{pt}/nid/{nid}/page/{page}','/author/novel_chapterlist/pt/{pt}/nid/{nid}/page/{page}'), (38,'zt','zt_zt','เนื้อหากระทู้','/module/zt/zt.php?pt={pt}&zid={zid}','/module/zt/zt.php?pt={pt}&zid={zid}','/?module=zt&file=zt&pt={pt}&zid={zid}','/?path=/zt/zt/pt/{pt}/zid/{zid}','/index.php/zt/zt/pt/{pt}/zid/{zid}','/zt/zt/pt/{pt}/zid/{zid}'), (39,'zt','zt_type','หมวดหมู่กระทู้','/module/zt/type.php?pt={pt}&tid={tid}&page={page}','/module/zt/type.php?pt={pt}&tid={tid}&page={page}','/?module=zt&file=type&pt={pt}&tid={tid}&page={page}','/?path=/zt/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/zt/type/pt/{pt}/tid/{tid}/page/{page}','/zt/type/pt/{pt}/tid/{tid}/page/{page}'), (42,'user','user_fvistlist','รายการเยี่ยมชมของเพื่อน','/module/user/fvistlist.php?pt={pt}&uid={uid}&page={page}','/module/user/fvistlist.php?pt={pt}&uid={uid}&page={page}','/?module=user&file=fvistlist&pt={pt}&uid={uid}&page={page}','/?path=/user/fvistlist/pt/{pt}/uid/{uid}/page/{page}','/index.php/user/fvistlist/pt/{pt}/uid/{uid}/page/{page}','/user/fvistlist/pt/{pt}/uid/{uid}/page/{page}'), (43,'author','author_basic','ข้อมูลทั่วไปนักเขียน','/module/author/basic.php?pt={pt}','/module/author/basic.php?pt={pt}','/?module=author&file=basic&pt={pt}','/?path=/author/basic/pt/{pt}','/index.php/author/basic/pt/{pt}','/author/basic/pt/{pt}'), (44,'author','author_incomechapter','รายได้จากบท','/module/author/incomechapter.php?pt={pt}&page={page}','/module/author/incomechapter.php?pt={pt}&page={page}','/?module=author&file=incomechapter&pt={pt}&page={page}','/?path=/author/incomechapter/pt/{pt}/page/{page}','/index.php/author/incomechapter/pt/{pt}/page/{page}','/author/incomechapter/pt/{pt}/page/{page}'), (45,'author','author_incomedashang','รายได้จากรางวัล','/module/author/incomedashang.php?pt={pt}&page={page}','/module/author/incomedashang.php?pt={pt}&page={page}','/?module=author&file=incomedashang&pt={pt}&page={page}','/?path=/author/incomedashang/pt/{pt}/page/{page}','/index.php/author/incomedashang/pt/{pt}/page/{page}','/author/incomedashang/pt/{pt}/page/{page}'), (46,'author','author_mentionapply','ยื่นถอนเงิน','/module/author/mentionapply.php?pt={pt}','/module/author/mentionapply.php?pt={pt}','/?module=author&file=mentionapply&pt={pt}','/?path=/author/mentionapply/pt/{pt}','/index.php/author/mentionapply/pt/{pt}','/author/mentionapply/pt/{pt}'), (47,'author','author_mentionrecord','บันทึกการถอนเงิน','/module/author/mentionrecord.php?pt={pt}&page={page}','/module/author/mentionrecord.php?pt={pt}&page={page}','/?module=author&file=mentionrecord&pt={pt}&page={page}','/?path=/author/mentionrecord/pt/{pt}/page/{page}','/index.php/author/mentionrecord/pt/{pt}/page/{page}','/author/mentionrecord/pt/{pt}/page/{page}'), (48,'article','article_type','รายการบทความ','/module/article/type.php?pt={pt}&tid={tid}&page={page}','/module/article/type.php?pt={pt}&tid={tid}&page={page}','/?module=article&file=type&pt={pt}&tid={tid}&page={page}','/?path=/article/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/article/type/pt/{pt}/tid/{tid}/page/{page}','/article/type/pt/{pt}/tid/{tid}/page/{page}'), (49,'article','article_article','เนื้อหาบทความ','/module/article/article.php?pt={pt}&tid={tid}&aid={aid}','/module/article/article.php?pt={pt}&tid={tid}&aid={aid}','/?module=article&file=article&pt={pt}&tid={tid}&aid={aid}','/?path=/article/article/pt/{pt}/tid/{tid}/aid/{aid}','/index.php/article/article/pt/{pt}/tid/{tid}/aid/{aid}','/article/article/pt/{pt}/tid/{tid}/aid/{aid}'), (50,'article','article_search','ค้นหาบทความ','/module/article/search.php?pt={pt}&key={key}&type={type}&page={page}','/module/article/search.php?pt={pt}&key={key}&type={type}&page={page}','/?module=article&file=search&pt={pt}&key={key}&type={type}&page={page}','/?path=/article/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/index.php/article/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/article/search/pt/{pt}/key/{key}/type/{type}/page/{page}'), (51,'article','article_replay','ความคิดเห็นต่อบทความ','/module/article/replay.php?pt={pt}&tid={tid}&aid={aid}&page={page}','/module/article/replay.php?pt={pt}&tid={tid}&aid={aid}&page={page}','/?module=article&file=replay&pt={pt}&tid={tid}&aid={aid}&page={page}','/?path=/article/replay/pt/{pt}/tid/{tid}/aid/{aid}/page/{page}','/index.php/article/replay/pt/{pt}/tid/{tid}/aid/{aid}/page/{page}','/article/replay/pt/{pt}/tid/{tid}/aid/{aid}/page/{page}'), (52,'novel','novel_index','หน้าหลักนิยาย','/module/novel/index.php?pt={pt}','/novel/index.html','/?module=novel&file=index&pt={pt}','/?path=/novel/index/pt/{pt}','/index.php/novel/index/pt/{pt}','/novel/index/pt/{pt}'), (54,'message','message_add','เขียนข้อความ','/module/message/add.php?pt={pt}','/message/{pt}/add.html','/?module=message&file=add&pt={pt}','/?path=/message/add/pt/{pt}','/index.php/message/add/pt/{pt}','/message/add/pt/{pt}'), (55,'user','user_sign','เช็คชื่อ','/module/user/sign.php?pt={pt}','/module/user/sign.php?pt={pt}','/?module=user&file=sign&pt={pt}','/?path=/user/sign/pt/{pt}','/index.php/user/sign/pt/{pt}','/user/sign/pt/{pt}'), (56,'bbs','bbs_index','หน้าหลักบอร์ด','/module/bbs/index.php?pt={pt}','/module/bbs/index.php?pt={pt}','/?module=bbs&file=index&pt={pt}','/?path=/bbs/index/pt/{pt}','/index.php/bbs/index/pt/{pt}','/bbs/index/pt/{pt}'), (57,'bbs','bbs_bbs','เนื้อหาหลัก','/module/bbs/bbs.php?pt={pt}&tid={tid}&bid={bid}&page={page}','/module/bbs/bbs.php?pt={pt}&tid={tid}&bid={bid}&page={page}','/?module=bbs&file=bbs&pt={pt}&tid={tid}&bid={bid}&page={page}','/?path=/bbs/bbs/pt/{pt}/tid/{tid}/bid/{bid}/page/{page}','/index.php/bbs/bbs/pt/{pt}/tid/{tid}/bid/{bid}/page/{page}','/bbs/bbs/pt/{pt}/tid/{tid}/bid/{bid}/page/{page}'), (58,'bbs','bbs_type','หมวดหมู่บอร์ด','/module/bbs/type.php?pt={pt}&tid={tid}','/module/bbs/type.php?pt={pt}&tid={tid}','/?module=bbs&file=type&pt={pt}&tid={tid}','/?path=/bbs/type/pt/{pt}/tid/{tid}','/index.php/bbs/type/pt/{pt}/tid/{tid}','/bbs/type/pt/{pt}/tid/{tid}'), (59,'bbs','bbs_list','รายการกระทู้','/module/bbs/list.php?pt={pt}&tid={tid}&page={page}','/module/bbs/list.php?pt={pt}&tid={tid}&page={page}','/?module=bbs&file=list&pt={pt}&tid={tid}&page={page}','/?path=/bbs/list/pt/{pt}/tid/{tid}/page/{page}','/index.php/bbs/list/pt/{pt}/tid/{tid}/page/{page}','/bbs/list/pt/{pt}/tid/{tid}/page/{page}'), (83,'article','article_tindex','หน้าหลักหมวดหมู่บทความ','/module/article/tindex.php?pt={pt}&tid={tid}','/module/article/tindex.php?pt={pt}&tid={tid}','/?module=article&file=tindex&pt={pt}&tid={tid}','/?path=/article/tindex/pt/{pt}/tid/{tid}','/index.php/article/tindex/pt/{pt}/tid/{tid}','/article/tindex/pt/{pt}/tid/{tid}'), (61,'bbs','bbs_post','สร้างกระทู้','/module/bbs/post.php?pt={pt}&tid={tid}&bid={bid}','/module/bbs/post.php?pt={pt}&tid={tid}&bid={bid}','/?module=bbs&file=post&pt={pt}&tid={tid}&bid={bid}','/?path=/bbs/post/pt/{pt}/tid/{tid}/bid/{bid}','/index.php/bbs/post/pt/{pt}/tid/{tid}/bid/{bid}','/bbs/post/pt/{pt}/tid/{tid}/bid/{bid}'), (62,'link','link_index','หน้าหลักลิ้งก์พันธมิตร','/module/link/index.php?pt={pt}','/module/link/index.php?pt={pt}','/?module=link&file=index&pt={pt}','/?path=/link/index/pt/{pt}','/index.php/link/index/pt/{pt}','/link/index/pt/{pt}'), (63,'link','link_show','แสดงลิ้งก์พันธมิตร','/module/link/show.php?pt={pt}&tid={tid}&lid={lid}','/module/link/show.php?pt={pt}&tid={tid}&lid={lid}','/?module=link&file=show&pt={pt}&tid={tid}&lid={lid}','/?path=/link/show/pt/{pt}/tid/{tid}/lid/{lid}','/index.php/link/show/pt/{pt}/tid/{tid}/lid/{lid}','/link/show/pt/{pt}/tid/{tid}/lid/{lid}'), (64,'link','link_link','คลิ๊กลิ้งก์พันธมิตร','/module/link/click.php?lid={lid}&t={t}','/module/link/click.php?lid={lid}&t={t}','/?module=link&file=click&lid={lid}&t={t}','/?path=/link/click/lid/{lid}/t/{t}','/index.php/link/click/lid/{lid}/t/{t}','/link/click/lid/{lid}/t/{t}'), (65,'link','link_type','รายการหมวดหมู่ลิ้งก์พันธมิตร','/module/link/type.php?pt={pt}&tid={tid}&page={page}','/module/link/type.php?pt={pt}&tid={tid}&page={page}','/?module=link&file=type&pt={pt}&tid={tid}&page={page}','/?path=/link/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/link/type/pt/{pt}/tid/{tid}/page/{page}','/link/type/pt/{pt}/tid/{tid}/page/{page}'), (66,'link','link_join','ลงทะเบียนลิ้งก์พันธมิตร','/module/link/join.php?pt={pt}','/module/link/join.php?pt={pt}','/?module=link&file=join&pt={pt}','/?path=/link/join/pt/{pt}','/index.php/link/join/pt/{pt}','/link/join/pt/{pt}'), (67,'app','app_type','รายการหมวดหมุ่แอปฯ','/module/app/type.php?pt={pt}&tid={tid}&page={page}','/module/app/type.php?pt={pt}&tid={tid}&page={page}','/?module=app&file=type&pt={pt}&tid={tid}&page={page}','/?path=/app/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/app/type/pt/{pt}/tid/{tid}/page/{page}','/app/type/pt/{pt}/tid/{tid}/page/{page}'), (111,'app','app_type_retrieval','รายการตัวกรองแอปฯ','/module/app/type.php?pt={pt}&tid={tid}&page={page}&rec={rec}&lang={lang}&cost={cost}&size={size}&platform={platform}&order={order}','/{tid}/list/{rec}_{lang}_{cost}_{size}_{platform}_{order}_{page}.html','/?module=app&file=type&pt={pt}&tid={tid}&page={page}&rec={rec}&lang={lang}&cost={cost}&size={size}&platform={platform}&order={order}','/?path=/app/type/pt/{pt}/tid/{tid}/page/{page}/rec/{rec}/lang/{lang}/cost/{cost}/size/{size}/platform/{platform}/order/{order}','/index.php/app/type/pt/{pt}/tid/{tid}/page/{page}/rec/{rec}/lang/{lang}/cost/{cost}/size/{size}/platform/{platform}/order/{order}','/app/type/pt/{pt}/tid/{tid}/page/{page}/rec/{rec}/lang/{lang}/cost/{cost}/size/{size}/platform/{platform}/order/{order}'), (68,'app','app_app','เนื้อหาแอปฯ','/module/app/app.php?pt={pt}&tid={tid}&aid={aid}','/module/app/app.php?pt={pt}&tid={tid}&aid={aid}','/?module=app&file=app&pt={pt}&tid={tid}&aid={aid}','/?path=/app/app/pt/{pt}/tid/{tid}/aid/{aid}','/index.php/app/app/pt/{pt}/tid/{tid}/aid/{aid}','/app/app/pt/{pt}/tid/{tid}/aid/{aid}'), (69,'app','app_index','应用首页','/module/app/index.php?pt={pt}','/module/app/index.php?pt={pt}','/?module=app&file=index&pt={pt}','/?path=/app/index/pt/{pt}','/index.php/app/index/pt/{pt}','/app/index/pt/{pt}'), (70,'down','down_down','下载内容','/module/down/down.php?pt={pt}&module={module}&fid={fid}&cid={cid}','/module/down/down.php?pt={pt}&module={module}&fid={fid}&cid={cid}','/?module=down&file=down&pt={pt}&module={module}&fid={fid}&cid={cid}','/?path=/down/down/pt/{pt}/module/{module}/fid/{fid}/cid/{cid}','/index.php/down/down/pt/{pt}/module/{module}/fid/{fid}/cid/{cid}','/down/down/pt/{pt}/module/{module}/fid/{fid}/cid/{cid}'), (71,'app','app_search','ค้นหาแอปฯ','/module/app/search.php?pt={pt}&type={type}&key={key}&page={page}','/module/app/search.php?pt={pt}&type={type}&key={key}&page={page}','/?module=app&file=search&pt={pt}&type={type}&key={key}&page={page}','/?path=/app/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/index.php/app/search/pt/{pt}/type/{type}/key/{key}/page/{page}','/app/search/pt/{pt}/type/{type}/key/{key}/page/{page}'), (72,'article','article_index','หน้าหลักบทความ','/module/article/index.php?pt={pt}','/html/article/index_{pt}.html','/?module=article&file=index&pt={pt}','/?path=/article/index/pt/{pt}','/index.php/article/index/pt/{pt}','/article/index/pt/{pt}'), (73,'bbs','bbs_search','ค้นหาบอร์ด','/module/bbs/search.php?pt={pt}&key={key}&type={type}&page={page}','/module/bbs/search.php?pt={pt}&key={key}&type={type}&page={page}','/?module=bbs&file=search&pt={pt}&key={key}&type={type}&page={page}','/?path=/bbs/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/index.php/bbs/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/bbs/search/pt/{pt}/key/{key}/type/{type}/page/{page}'), (74,'about','about_type','รายการข้อมูลเกี่ยวกับ','/module/about/type.php?pt={pt}&tid={tid}','/module/about/type.php?pt={pt}&tid={tid}','/?module=about&file=type&pt={pt}&tid={tid}','/?path=/about/type/pt/{pt}/tid/{tid}','/index.php/about/type/pt/{pt}/tid/{tid}','/about/type/pt/{pt}/tid/{tid}'), (75,'about','about_about','เนื้อหาข้อมูลเกี่ยวกับ','/module/about/about.php?pt={pt}&aid={aid}','/module/about/about.php?pt={pt}&aid={aid}','/?module=about&file=about&pt={pt}&aid={aid}','/?path=/about/about/pt/{pt}/aid/{aid}','/index.php/about/about/pt/{pt}/aid/{aid}','/about/about/pt/{pt}/aid/{aid}'), (76,'picture','picture_type','รายการอัลบั้ม','/module/picture/type.php?pt={pt}&tid={tid}&page={page}','/module/picture/type.php?pt={pt}&tid={tid}&page={page}','/?module=picture&file=type&pt={pt}&tid={tid}&page={page}','/?path=/picture/type/pt/{pt}/tid/{tid}/page/{page}','/index.php/picture/type/pt/{pt}/tid/{tid}/page/{page}','/picture/type/pt/{pt}/tid/{tid}/page/{page}'), (77,'picture','picture_picture','เนื้อหาอัลบั้ม','/module/picture/picture.php?pt={pt}&tid={tid}&pid={pid}&page={page}','/module/picture/picture.php?pt={pt}&tid={tid}&pid={pid}&page={page}','/?module=picture&file=picture&pt={pt}&tid={tid}&pid={pid}&page={page}','/?path=/picture/picture/pt/{pt}/tid/{tid}/pid/{pid}/page/{page}','/index.php/picture/picture/pt/{pt}/tid/{tid}/pid/{pid}/page/{page}','/picture/picture/pt/{pt}/tid/{tid}/pid/{pid}/page/{page}'), (78,'picture','picture_search','ค้นหาอัลบั้ม','/module/picture/search.php?pt={pt}&key={key}&type={type}&page={page}','/module/picture/search.php?pt={pt}&key={key}&type={type}&page={page}','/?module=picture&file=search&pt={pt}&key={key}&type={type}&page={page}','/?path=/picture/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/index.php/picture/search/pt/{pt}/key/{key}/type/{type}/page/{page}','/picture/search/pt/{pt}/key/{key}/type/{type}/page/{page}'), (79,'picture','picture_replay','ความคิดเห็นต่ออัลบั้ม','/module/picture/replay.php?pt={pt}&tid={tid}&cid={cid}&page={page}','/module/picture/replay.php?pt={pt}&tid={tid}&cid={cid}&page={page}','/?module=picture&file=replay&pt={pt}&tid={tid}&cid={cid}&page={page}','/?path=/picture/replay/pt/{pt}/tid/{tid}/cid/{cid}/page/{page}','/index.php/picture/replay/pt/{pt}/tid/{tid}/cid/{cid}/page/{page}','/picture/replay/pt/{pt}/tid/{tid}/cid/{cid}/page/{page}'), (80,'picture','picture_toplist','รายการอันดับอัลบั้ม','/module/picture/toplist.php?pt={pt}&tid={tid}&page={page}','/module/picture/toplist.php?pt={pt}&tid={tid}&page={page}','/?module=picture&file=toplist&pt={pt}&tid={tid}&page={page}','/?path=/picture/toplist/pt/{pt}/tid/{tid}/page/{page}','/index.php/picture/toplist/pt/{pt}/tid/{tid}/page/{page}','/picture/toplist/pt/{pt}/tid/{tid}/page/{page}'), (81,'user','user_signlist','รายการเช็คชื่อ','/module/user/signlist.php?pt={pt}&page={page}','/module/user/signlist.php?pt={pt}&page={page}','/?module=user&file=signlist&pt={pt}&page={page}','/?path=/user/signlist/pt/{pt}/page/{page}','/index.php/user/signlist/pt/{pt}/page/{page}','/user/signlist/pt/{pt}/page/{page}'), (23,'user','user_fhome','โปรไฟล์เพื่อน','/module/user/fhome.php?pt={pt}&uid={uid}','/module/user/fhome.php?pt={pt}&uid={uid}','/?module=user&file=fhome&pt={pt}&uid={uid}','/?path=/user/fhome/pt/{pt}/uid/{uid}','/index.php/user/fhome/pt/{pt}/uid/{uid}','/user/fhome/pt/{pt}/uid/{uid}'), (82,'user','user_apilogin','ส่วนติดต่อการเข้าสู่ระบบ','/module/user/apilogin.php','/module/user/apilogin.php','/?module=user&file=apilogin','/?path=/user/apilogin','/index.php/user/apilogin','/user/apilogin'), (84,'picture','picture_index','หน้าหลักอัลบั้ม','/module/picture/index.php?pt={pt}','/module/picture/index.php?pt={pt}','/?module=picture&file=index&pt={pt}','/?path=/picture/index/pt/{pt}','/index.php/picture/index/pt/{pt}','/picture/index/pt/{pt}'), (85,'user','user_fcoll','ชั้นหนังสือของเพื่อน','/module/user/fcoll.php?module={module}&type={type}&page={page}&pt={pt}&uid={uid}','/module/user/fcoll.php?module={module}&type={type}&page={page}&pt={pt}&uid={uid}','/?module=user&file=fcoll&module={module}&type={type}&page={page}&pt={pt}&uid={uid}','/?path=/user/fcoll/module/{module}/type/{type}/page/{page}/pt/{pt}/uid/{uid}','/index.php/user/fcoll/module/{module}/type/{type}/page/{page}/pt/{pt}/uid/{uid}','/user/fcoll/module/{module}/type/{type}/page/{page}/pt/{pt}/uid/{uid}'), (86,'novel','novel_tindex','หน้าหลักหมวดหมู่นิยาย','/module/novel/tindex.php?pt={pt}&tid={tid}','/{tid}/index.html','/?module=novel&file=tindex&pt={pt}&tid={tid}','/?path=/novel/tindex/pt/{pt}/tid/{tid}','/index.php/novel/tindex/pt/{pt}/tid/{tid}','/novel/tindex/pt/{pt}/tid/{tid}'), (87,'author','author_apply','ลงมทะเบียนนักเขียน','/module/author/apply.php?pt={pt}','/module/author/apply.php?pt={pt}','/?module=author&file=apply&pt={pt}','/?path=/author/apply/pt/{pt}','/index.php/author/apply/pt/{pt}','/author/apply/pt/{pt}'), (88,'author','author_agreement','ข้อตกลงการลงทะเบียนเป็นนักเขียน','/module/author/agreement.php?pt={pt}','/module/author/agreement.php?pt={pt}','/?module=author&file=agreement&pt={pt}','/?path=/author/agreement/pt/{pt}','/index.php/author/agreement/pt/{pt}','/author/agreement/pt/{pt}'), (89,'author','author_novel_volumeedit','แก้ไขเล่มนิยาย','/module/author/novel_volumeedit.php?pt={pt}&nid={nid}&vid={vid}','/module/author/novel_volumeedit.php?pt={pt}&nid={nid}&vid={vid}','/?module=author&file=novel_volumeedit&pt={pt}&nid={nid}&vid={vid}','/?path=/author/novel_volumeedit/pt/{pt}/nid/{nid}/vid/{vid}','/index.php/author/novel_volumeedit/pt/{pt}/nid/{nid}/vid/{vid}','/author/novel_volumeedit/pt/{pt}/nid/{nid}/vid/{vid}'), (90,'author','author_article_articlelist','รายการบทความ','/module/author/article_articlelist.php?pt={pt}&page={page}','/module/author/article_articlelist.php?pt={pt}&page={page}','/?module=author&file=article_articlelist&pt={pt}&page={page}','/?path=/author/article_articlelist/pt/{pt}/page/{page}','/index.php/author/article_articlelist/pt/{pt}/page/{page}','/author/article_articlelist/pt/{pt}/page/{page}'), (91,'author','author_article_draftedit','แก้ไขร่างบทความ','/module/author/article_draftedit.php?did={did}&pt={pt}','/module/author/article_draftedit.php?did={did}&pt={pt}','/?module=author&file=article_draftedit&did={did}&pt={pt}','/?path=/author/article_draftedit/did/{did}/pt/{pt}','/index.php/author/article_draftedit/did/{did}/pt/{pt}','/author/article_draftedit/did/{did}/pt/{pt}'), (92,'author','author_article_draftlist','รายการร่างบทความ','/module/author/article_draftlist.php?page={page}&pt={pt}','/module/author/article_draftlist.php?page={page}&pt={pt}','/?module=author&file=article_draftlist&page={page}&pt={pt}','/?path=/author/article_draftlist/page/{page}/pt/{pt}','/index.php/author/article_draftlist/page/{page}/pt/{pt}','/author/article_draftlist/page/{page}/pt/{pt}'), (93,'author','author_article_articleedit','แก้ไขบทความ','/module/author/article_articleedit.php?id={id}&pt={pt}','/module/author/article_articleedit.php?id={id}&pt={pt}','/?module=author&file=article_articleedit&id={id}&pt={pt}','/?path=/author/article_articleedit/id/{id}/pt/{pt}','/index.php/author/article_articleedit/id/{id}/pt/{pt}','/author/article_articleedit/id/{id}/pt/{pt}'), (94,'sitemap','sitemap_html_index','แผนผังเว็บไซต์ HTML','/wmcms/module/sitemap/index.php?type=html','/html/sitemap/index.html','/wmcms/module/sitemap/index.php?type=html','/wmcms/module/sitemap/index.php?type=html','/wmcms/module/sitemap/index.php?type=html','/wmcms/module/sitemap/index.php?type=html'), (95,'sitemap','sitemap_xml_index','แผนผังเว็บไซต์ XML','/wmcms/module/sitemap/index.php?type=xml','/html/sitemap/sitemap.xml','/wmcms/module/sitemap/index.php?type=xml','/wmcms/module/sitemap/index.php?type=xml','/wmcms/module/sitemap/index.php?type=xml','/wmcms/module/sitemap/index.php?type=xml'), (96,'sitemap','sitemap_rss_index','แผนผังเว็บไซต์ RSS','/wmcms/module/sitemap/index.php?type=rss','/html/sitemap/rss.html','/wmcms/module/sitemap/index.php?type=rss','/wmcms/module/sitemap/index.php?type=rss','/wmcms/module/sitemap/index.php?type=rss','/wmcms/module/sitemap/index.php?type=rss'), (97,'sitemap','sitemap_rss_list','รายการแผนผังเว็บไซต์','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/html/sitemap/rss/{module}/{tid}.xml','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}','/wmcms/module/sitemap/list.php?type={type}&module={module}&tid={tid}'), (98,'user','user_charge','เติมเงินออนไลน์','/module/user/charge.php?pt={pt}','/module/user/charge.php?pt={pt}','/?module=user&file=charge&pt={pt}','/?path=/user/charge/pt/{pt}','/index.php/user/charge/pt/{pt}','/user/charge/pt/{pt}'), (99,'author','author_novel_incomelist','รายการรายได้จากนิยาย','/module/author/novel_incomelist.php?type={type}&page={page}&pt={pt}','/module/author/novel_incomelist.php?type={type}&page={page}&pt={pt}','/?module=author&file=novel_incomelist&type={type}&page={page}&pt={pt}','/?path=/author/novel_incomelist/type/{type}/page/{page}/pt/{pt}','/index.php/author/novel_incomelist/type/{type}/page/{page}/pt/{pt}','/author/novel_incomelist/type/{type}/page/{page}/pt/{pt}'), (100,'user','user_cash_apply','ยื่นถอนเงินออนไลน์','/module/user/cash_apply.php?pt={pt}','/module/user/cash_apply.php?pt={pt}','/?module=user&file=cash_apply&pt={pt}','/?path=/user/cash_apply/pt/{pt}','/index.php/user/cash_apply/pt/{pt}','/user/cash_apply/pt/{pt}'), (101,'user','user_cash_list','บันทึกการถอนเงิน','/module/user/cash_list.php?page={page}&pt={pt}','/module/user/cash_list.php?page={page}&pt={pt}','/?module=user&file=cash_list&page={page}&pt={pt}','/?path=/user/cash_list/page/{page}/pt/{pt}','/index.php/user/cash_list/page/{page}/pt/{pt}','/user/cash_list/page/{page}/pt/{pt}'), (102,'about','about_tindex','หน้าหลักเกี่ยวกับ','/module/about/tindex.php?pt={pt}&tid={tid}','/module/about/tindex.php?pt={pt}&tid={tid}','/?module=about&file=tindex&pt={pt}&tid={tid}','/?path=/about/tindex/pt/{pt}/tid/{tid}','/index.php/about/tindex/pt/{pt}/tid/{tid}','/about/tindex/pt/{pt}/tid/{tid}'), (103,'sitemap','sitemap_site_index','โครงสร้างข้อมูล','/wmcms/module/sitemap/index.php?type=site','/html/sitemap/site.xml','/wmcms/module/sitemap/index.php?type=site','/wmcms/module/sitemap/index.php?type=site','/wmcms/module/sitemap/index.php?type=site','/wmcms/module/sitemap/index.php?type=site'), (104,'novel','novel_type_retrieval','รายการตัวกรองนิยาย','/module/novel/type.php?pt={pt}&tid={tid}&page={page}&process={process}&word={word}&chapter={chapter}©={copy}&cost={cost}&letter={letter}&order={order}','/{tid}/list/{process}_{word}_{chapter}_{copy}_{cost}_{letter}_{order}_{page}.html','/?module=novel&file=type&pt={pt}&tid={tid}&page={page}&process={process}&word={word}&chapter={chapter}©={copy}&cost={cost}&letter={letter}&order={order}','/?path=/novel/type/pt/{pt}/tid/{tid}/page/{page}/process/{process}/word/{word}/chapter/{chapter}/copy/{copy}/cost/{cost}/letter/{letter}/order/{order}','/index.php/novel/type/pt/{pt}/tid/{tid}/page/{page}/process/{process}/word/{word}/chapter/{chapter}/copy/{copy}/cost/{cost}/letter/{letter}/order/{order}','/novel/type/pt/{pt}/tid/{tid}/page/{page}/process/{process}/word/{word}/chapter/{chapter}/copy/{copy}/cost/{cost}/letter/{letter}/order/{order}'), (105,'novel','novel_index_boy','หน้าหลักนิยายผู้ชาย','/module/novel/index_boy.php?pt={pt}','/index_boy.thml','/?module=novel&file=index_boy&pt={pt}','/?path=/novel/index_boy/pt/{pt}','/index.php/novel/index_boy/pt/{pt}','/novel/index_boy/pt/{pt}'), (106,'novel','novel_index_girl','หน้าหลักนิยายผู้หญิง','/module/novel/index_girl.php?pt={pt}','/index_girl.thml','/?module=novel&file=index_girl&pt={pt}','/?path=/novel/index_girl/pt/{pt}','/index.php/novel/index_girl/pt/{pt}','/novel/index_girl/pt/{pt}'), (107,'user','user_read','ประวัติการอ่าน','/module/user/read.php?pt={pt}&module={module}&page={page}','/module/user/read.php?pt={pt}&module={module}&page={page}','/?module=user&file=read&pt={pt}&module={module}&page={page}','/?path=/user/read/pt/{pt}/module/{module}/page/{page}','/index.php/user/read/pt/{pt}/module/{module}/page/{page}','/user/read/pt/{pt}/module/{module}/page/{page}'), (108,'user','user_charge_code','สแกนคิวอาร์โค้ดออนไลน์','/module/user/charge_code.php?pt={pt}&code={code}&sn={sn}','/module/user/charge_code.php?pt={pt}&code={code}&sn={sn}','/?module=user&file=charge_code&pt={pt}&code={code}&sn={sn}','/?path=/user/charge_code/pt/{pt}/code/{code}/sn/{sn}','/index.php/user/charge_code/pt/{pt}/code/{code}/sn/{sn}','/user/charge_code/pt/{pt}/code/{code}/sn/{sn}'), (109,'user','user_charge_success','ชำระสำเร็จ','/module/user/charge_success.php?pt={pt}','/module/user/charge_success.php?pt={pt}','/?module=user&file=charge_success&pt={pt}','/?path=/user/charge_success/pt/{pt}','/index.php/user/charge_success/pt/{pt}','/user/charge_success/pt/{pt}'), (110,'replay','replay_list','รายการความคิดเห็น','/module/replay/list.php?pt={pt}&module={module}&page={page}','/module/replay/list.php?pt={pt}&module={module}&page={page}','/?module=replay&file=list&pt={pt}&module={module}&page={page}','/?path=/replay/list/pt/{pt}/module/{module}/page/{page}','/index.php/replay/list/pt/{pt}/module/{module}/page/{page}','/replay/list/pt/{pt}/module/{module}/page/{page}'), (112,'picture','picture_tindex','หน้าหลักหมวดหมู่อัลบั้ม','/module/picture/tindex.php?pt={pt}&tid={tid}','/{tid}/index.html','/?module=picture&file=tindex&pt={pt}&tid={tid}','/?path=/picture/tindex/pt/{pt}/tid/{tid}','/index.php/picture/tindex/pt/{pt}/tid/{tid}','/picture/tindex/pt/{pt}/tid/{tid}'), (113,'author','author_author','ศูนย์นักเขียน','/module/author/author.php?pt={pt}&aid={aid}','/module/author/author.php?pt={pt}&aid={aid}','/module/author/author.php?pt={pt}&aid={aid}','/?path=/author/author/pt/{pt}/aid/{aid}','/index.php/author/author/pt/{pt}/aid/{aid}','/author/author/pt/{pt}/aid/{aid}');

/*Table structure for table `wm_site_product` */
DROP TABLE IF EXISTS `wm_site_product`;

CREATE TABLE `wm_site_product` (`product_id` int(4) NOT NULL AUTO_INCREMENT,
 `product_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用',
 `product_title` varchar(20) NOT NULL COMMENT '站点名字',
 `product_domain` varchar(100) NOT NULL COMMENT '域名',
 `product_admin` varchar(80) NOT NULL COMMENT '后台文件夹',
 `product_name` varchar(20) NOT NULL COMMENT '后台登录账号',
 `product_psw` varchar(50) NOT NULL COMMENT '后台登录密码',
 `product_order` int(4) NOT NULL DEFAULT '99' COMMENT '显示排序，越小越靠前',
 `product_time` int(4) NOT NULL COMMENT '创建时间',
 PRIMARY KEY (`product_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='产品线站群表';

/*Data for the table `wm_site_product` */ /*Table structure for table `wm_site_site` */
DROP TABLE IF EXISTS `wm_site_site`;

CREATE TABLE `wm_site_site` (`site_id` int(4) NOT NULL AUTO_INCREMENT,
 `site_status` tinyint(1) DEFAULT '1' COMMENT '是否可用',
 `site_title` varchar(30) DEFAULT NULL COMMENT '站点名字',
 `site_domain` varchar(30) DEFAULT NULL COMMENT '站点域名',
 `site_domain_type` tinyint(1) DEFAULT '1' COMMENT '域名类型，1为单域名，2为泛解析',
 `site_type` tinyint(1) DEFAULT '1' COMMENT '站点类型，1为数据独享站群，2为数据共享站群(泛解析时必为2)',
 `site_template` varchar(30) DEFAULT NULL COMMENT '使用的模版文件夹名字',
 `site_order` int(4) DEFAULT '99' COMMENT '排序',
 `site_time` int(4) DEFAULT '0' COMMENT '创建的时间',
 PRIMARY KEY (`site_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='站群站内站点表';

/*Data for the table `wm_site_site` */ /*Table structure for table `wm_system_apply` */
DROP TABLE IF EXISTS `wm_system_apply`;

CREATE TABLE `wm_system_apply` (`apply_id` int(4) NOT NULL AUTO_INCREMENT,
 `apply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为申请中，1为通过，2为拒绝',
 `apply_module` varchar(20) NOT NULL COMMENT '申请的模块',
 `apply_type` varchar(20) NOT NULL COMMENT '模块中申请的类型',
 `apply_uid` int(4) NOT NULL COMMENT '用户id或者作者id',
 `apply_cid` int(4) NOT NULL DEFAULT '0' COMMENT '所属内容的id',
 `apply_createtime` int(4) NOT NULL COMMENT '申请时间',
 `apply_manager_id` int(4) NOT NULL DEFAULT '0' COMMENT '操作的管理员',
 `apply_updatetime` int(4) NOT NULL DEFAULT '0' COMMENT '处理的时间',
 `apply_remark` varchar(200) NOT NULL COMMENT '处理备注',
 `apply_option` text COMMENT '特殊的数据',
 PRIMARY KEY (`apply_id`), KEY `status_index` (`apply_status`),
 KEY `module_index` (`apply_module`),
 KEY `type_index` (`apply_type`),
 KEY `uid_index` (`apply_uid`),
 KEY `cid_index` (`apply_cid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='全系统申请记录表';

/*Data for the table `wm_system_apply` */ /*Table structure for table `wm_system_competence` */
DROP TABLE IF EXISTS `wm_system_competence`;

CREATE TABLE `wm_system_competence` (`comp_id` int(4) NOT NULL AUTO_INCREMENT,
 `comp_name` varchar(20) NOT NULL COMMENT '权限名',
 `comp_site` varchar(5000) NOT NULL DEFAULT '0' COMMENT '账号管理站点权限，0为所有站点',
 `comp_content` varchar(5000) NOT NULL COMMENT '权限内容',
 PRIMARY KEY (`comp_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='系统权限表';

/*Data for the table `wm_system_competence` */ /*Table structure for table `wm_system_domain` */
DROP TABLE IF EXISTS `wm_system_domain`;

CREATE TABLE `wm_system_domain` (`domain_id` int(4) NOT NULL AUTO_INCREMENT,
 `domain_title` varchar(30) NOT NULL COMMENT '模块标题 /* SubMaRk */',
 `domain_name` varchar(10) NOT NULL COMMENT '模块名字',
 `domain_domain` varchar(30) NOT NULL COMMENT '模块绑定域名',
 `domain_index` varchar(30) DEFAULT NULL COMMENT '模块首页',
 `domain_order` int(4) DEFAULT '9' COMMENT '域名排序',
 PRIMARY KEY (`domain_id`)) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT
CHARSET=utf8 COMMENT='模块绑定域名表';

/*Data for the table `wm_system_domain` */
INSERT INTO `wm_system_domain`(`domain_id`, `domain_title`, `domain_name`, `domain_domain`, `domain_index`, `domain_order`) VALUES (1,'โมดูลบทความ','article','','index',9), (2,'โมดูลเว็บบอร์ด','bbs','','index',9), (3,'โมดูลแอปฯ','app','','index',9), (4,'โมดูลผู้ใช้','user','','homne',9), (5,'โมดูลลิ้งก์พันธมิตร','link','','index',9), (6,'โมดูลนักเขียน','author','','index',9), (7,'โมดูลนิยาย','novel','','index',9);

/*Table structure for table `wm_system_email` */
DROP TABLE IF EXISTS `wm_system_email`;

CREATE TABLE `wm_system_email` (`email_id` int(4) NOT NULL AUTO_INCREMENT,
 `email_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邮件服务使用状态，0为禁用，1为启用',
 `email_type` tinyint(1) DEFAULT '1' COMMENT '邮箱类型，1为smtp，2为sendmail,3为php smtp函数',
 `email_smtp` varchar(20) DEFAULT NULL COMMENT 'smtp服务器',
 `email_port` varchar(10) DEFAULT NULL COMMENT 'smtp端口',
 `email_name` varchar(30) DEFAULT NULL COMMENT '邮箱登录账号',
 `email_psw` varchar(50) DEFAULT NULL COMMENT '邮箱登录密码',
 `email_send` varchar(30) DEFAULT NULL COMMENT '发信账户',
 PRIMARY KEY (`email_id`)) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT
CHARSET=utf8 COMMENT='邮件服务配置';

/*Data for the table `wm_system_email` */
INSERT INTO `wm_system_email`(`email_id`, `email_status`, `email_type`, `email_smtp`, `email_port`, `email_name`, `email_psw`, `email_send`) VALUES (1,0,1,'smtp.163.com','25','user@163.com','1TFfVrRCnfnximMmLHE','user@163.com');

/*Table structure for table `wm_system_email_log` */
DROP TABLE IF EXISTS `wm_system_email_log`;

CREATE TABLE `wm_system_email_log` (`log_id` int(11) NOT NULL AUTO_INCREMENT,
 `log_status` tinyint(1) DEFAULT '0' COMMENT '0为等待发送，1为发送成功，2为发送失败',
 `log_sendmail` varchar(30) NOT NULL COMMENT '发信账户',
 `log_getmail` varchar(30) NOT NULL COMMENT '收信账户',
 `log_title` varchar(200) NOT NULL COMMENT '邮件主题',
 `log_content` text NOT NULL COMMENT '邮件正文',
 `log_remark` varchar(50) DEFAULT '发送成功' COMMENT '备注信息',
 `log_time` int(4) DEFAULT '0' COMMENT '邮件任务创建的时间',
 `log_sendtime` int(4) DEFAULT '0' COMMENT '邮件发送的时间',
 PRIMARY KEY (`log_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='邮件任务记录日志表';

/*Data for the table `wm_system_email_log` */ /*Table structure for table `wm_system_email_temp` */
DROP TABLE IF EXISTS `wm_system_email_temp`;

CREATE TABLE `wm_system_email_temp` (`temp_id` varchar(20) NOT NULL COMMENT '模版的id',
 `temp_status` tinyint(1) DEFAULT '1' COMMENT '0为禁用，1为起启用',
 `temp_name` varchar(20) DEFAULT NULL COMMENT '模版标题',
 `temp_desc` varchar(100) DEFAULT NULL COMMENT '模版描述',
 `temp_title` varchar(200) NOT NULL COMMENT '发信标题',
 `temp_content` text NOT NULL COMMENT '发信内容',
 PRIMARY KEY (`temp_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='邮件模版表';

/*Data for the table `wm_system_email_temp` */
INSERT INTO `wm_system_email_temp`(`temp_id`, `temp_status`, `temp_name`, `temp_desc`, `temp_title`, `temp_content`) VALUES ('reg',0,'ลงทะเบียนผู้ใช้','อีเมล์ที่ส่งเมื่อผู้ใช้ลงทะเบียน','ยินดีต้อนรับเข้าสู่การลงทะเบียนที่ {网站名}','{#lt}p{#gt}เรียนคุณ {用户名} ทางเรายินดีต้อนรับคุณเข้าสู่การลงทะเบียนกับ {网站名}{#lt}/p{#gt}'), ('getpsw',1,'กู้คืนรหัสผ่าน','อีเมล์ที่ส่งเมื่อผู้ใช้แจ้งลืมรหัสผ่าน','อีเมล์กู้คืนรหัสผ่านของ {用户名}','{#lt}p{#gt}เรียนคุณ {用户名} {#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}นี่เป็นข้อความที่ส่งอัตโนมัติจาก {网站名} {#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}การที่คุณได้รับอีเมล์ฉบับนี้จาก {网站名} เป็นเพราะว่าคุณได้ใช้ {#lt}span style={#34}color: rgb(255, 0, 0);{#34}{#gt}บริการกู้คืนรหัสผ่าน{#lt}/span{#gt} หากคุณไม่ได้เป็นคนดำเนินการเรื่องนี้ที่ {网站名} โปรดมองข้ามอีเมล์ฉบับนี้ได้ และคุณไม่จำ้ป็นต้องหยุดการสมัครหรือดำเนินการใด ๆ เพิ่มเติม{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}โปรดคลิ๊กลิ้งก์ต่อไปนี้เพื่อดำเนินการกู้คืนรหัสผ่านของคุณ หากคลิ๊กลิ้งก์ไม่ได้ โปรดคัดลอกเพื่อเข้าชมด้วยตนเอง!{#lt}/p{#gt}{#lt}p{#gt}{找回链接}{#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}'), ('varemail',1,'ยืนยันอีเมล์','ยืนยันอีเมล์ผู้ใช้','อีเมล์ยืนยันของ {用户名}','{#lt}p{#gt}เรียนคุณ {用户名} {#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}นี่เป็นข้อความที่ส่งอัตโนมัติจาก {网站名} {#lt}/p{#gt}{#lt}p{#gt}{#lt}br/{#gt}{#lt}/p{#gt}{#lt}p{#gt}การที่คุณได้รับอีเมล์ฉบับนี้จาก {网站名} เป็นเพราะว่าคุณได้ใช้ {#lt}span style={#34}color: rgb(255, 0, 0);{#34}{#gt}บริการยืนยันอีเมล์ผู้ใช้{#lt}/span{#gt} หากคุณไม่ได้เป็นคนดำเนินการเรื่องนี้ที่ {网站名} โปรดมองข้ามอีเมล์ฉบับนี้ได้ และคุณไม่จำ้ป็นต้องหยุดการสมัครหรือดำเนินการใด ๆ เพิ่มเติม{#lt}/p{#gt}{#lt}p{#gt}โปรดคลิ๊กลิ้งก์ต่อไปนี้เพื่อดำเนินการยืนยันอีเมล์ของคุณ หากคลิ๊กลิ้งก์ไม่ได้ โปรดคัดลอกเพื่อเข้าชมด้วยตนเอง!{#lt}/p{#gt}{#lt}p{#gt}{验证链接}{#lt}/p{#gt}');

/*Table structure for table `wm_system_errlog` */
DROP TABLE IF EXISTS `wm_system_errlog`;

CREATE TABLE `wm_system_errlog` (`errlog_id` int(4) NOT NULL AUTO_INCREMENT,
 `errlog_status` tinyint(1) DEFAULT '0' COMMENT '是否上传，0为没有',
 `errlog_url` varchar(255) DEFAULT NULL COMMENT '错误的url',
 `errlog_state` varchar(20) DEFAULT NULL COMMENT 'SQLSTATE 错误码',
 `errlog_code` varchar(20) DEFAULT NULL COMMENT '驱动错误码',
 `errlog_msg` varchar(255) DEFAULT NULL COMMENT '驱动错误信息',
 `errlog_sql` varchar(2000) DEFAULT NULL COMMENT '错误的sql语句',
 `errlog_ip` varchar(15) DEFAULT NULL COMMENT '访问ip',
 `errlog_time` int(4) DEFAULT NULL COMMENT '错误的时间',
 PRIMARY KEY (`errlog_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='系统sql错误记录表';

/*Data for the table `wm_system_errlog` */ /*Table structure for table `wm_system_menu` */
DROP TABLE IF EXISTS `wm_system_menu`;

CREATE TABLE `wm_system_menu` (`menu_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
 `menu_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单的显示状态，0为隐藏，1为显示',
 `menu_title` varchar(60) NOT NULL COMMENT '目录标题 /* SubMaRk */',
 `menu_name` varchar(50) NOT NULL COMMENT '目录名字，如果为权限菜单的时候，此值为t的类型',
 `menu_pid` int(4) NOT NULL DEFAULT '0' COMMENT '父级id',
 `menu_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为普通目录，1为组目录,2为权限菜单',
 `menu_order` int(1) DEFAULT '10' COMMENT '显示顺序',
 `menu_file` varchar(40) DEFAULT NULL COMMENT '目录文件名字',
 `menu_url` tinyint(1) DEFAULT '0' COMMENT '是否加上name为type值',
 `menu_ico` varchar(50) DEFAULT NULL COMMENT '菜单的图标名',
 PRIMARY KEY (`menu_id`)) ENGINE=MyISAM AUTO_INCREMENT=847 DEFAULT
CHARSET=utf8 COMMENT='系统目录菜单表';

/*Data for the table `wm_system_menu` */
INSERT INTO `wm_system_menu`(`menu_id`, `menu_status`, `menu_title`, `menu_name`, `menu_pid`, `menu_group`, `menu_order`, `menu_file`, `menu_url`, `menu_ico`) VALUES (1,1,'จัดการระบบ','system',0,0,1,NULL,0,'fa-cog'), (2,1,'ตั้งค่าเว็บไซต์','set',1,0,1,NULL,0,'fa-cogs'), (3,1,'ตั้งค่าทั่วไป','config',2,0,1,'system.set.config',0,'fa-wrench'), (4,1,'จัดการ API','api',2,0,2,'system.set.api',0,'fa-random'), (5,1,'จัดการลายน้ำ','water',2,0,3,'system.set.water',0,'fa-cloud-upload'), (6,1,'ตั้งค่าโดเมน','domain',2,0,4,'system.set.domain',0,'fa-bars'), (7,1,'จัดการเทมเพลต','templates',2,0,5,'system.set.templates',0,'fa-clone'), (8,1,'นำ BOM ออก','delbom',2,0,8,'system.set.delbom',0,'fa-ban'), (9,1,'จัดการเมนู','menu',1,0,2,NULL,0,'fa-align-justify'), (10,0,'เพิ่มเมนู','add',9,0,1,'system.menu.edit',0,NULL), (11,1,'รายการเมนู','menu',9,0,2,'system.menu.menu',0,'fa-list-ul'), (12,1,'SEO เว็บไซต์','seo',1,0,4,NULL,0,'fa-recycle'), (13,1,'ตั้งค่า SEO','config',12,0,1,'system.seo.keys',0,'fa-refresh'), (14,1,'จัดการลิ้งก์','rewrite',12,0,2,'system.seo.rewrite',0,'fa-square'), (15,1,'สร้างลิ้งก์','html',12,0,3,'system.seo.html',0,'fa-sticky-note'), (16,1,'จัดการสิทธิ์','competence',1,0,7,'',0,'fa-arrows-alt'), (17,1,'เพิ่มสิทธิ์','edit',16,0,1,'system.competence.edit',0,'fa-plus-square'), (18,1,'รายการสิทธิ์','list',16,0,2,'system.competence.list',0,'fa-list-ul'), (19,1,'บัญชีพื้นหลัง','manager',1,0,8,NULL,0,'fa-user-secret'), (20,1,'การจัดการใหม่','edit',19,0,1,'system.manager.edit',0,'fa-user-plus'), (22,1,'จัดการความปลอดภัย','safe',1,0,9,'',0,'fa-tasks'), (21,1,'รายการจัดการ','manager',19,0,2,'system.manager.list',0,'fa-list-ul'), (23,1,'บันทึกการลงทะเบียน','log',22,0,5,'system.safe.log',0,'fa-location-arrow'), (24,1,'เปลี่ยนรหัสผ่าน','uppsw',22,0,20,'system.safe.account.uppsw',0,'fa-unlock-alt'), (25,1,'จัดการโมดูล','module',0,0,2,'',0,'fa-th-large'), (26,1,'โมดูลบทความ','article',25,0,1,NULL,0,'fa-file-text'), (27,1,'จัดการหมวดหมู่','type',26,1,1,NULL,0,NULL), (28,1,'เพิ่มหมวดหมู่','add',27,0,1,'article.type.edit',0,NULL), (29,1,'รายการหมวดหมู่','list',27,0,2,'article.type.list',0,NULL), (30,1,'จัดการบทความ','article',26,1,2,'',0,NULL), (31,1,'เพิ่มบทคาวม','add',30,0,1,'article.article.edit',0,NULL), (32,1,'รายการบทความ','list',30,0,2,'article.article.list',0,NULL), (33,1,'ตั้งค่าโมดูล','set',26,0,3,NULL,0,NULL), (34,1,'นักเขียน','author',33,0,1,'article.author.list',0,NULL), (35,1,'กำหนดค่าโมดูล','config',33,0,2,'article.set.config',0,NULL), (36,1,'โมดูลเกี่ยวกับ','about',25,0,2,'',0,'fa-info-circle'), (37,1,'หมวดหมู่เกี่ยวกับ','type',36,1,1,'',0,NULL), (38,1,'เพิ่มหมวดหมู่','add',37,0,1,'about.type.edit',0,NULL), (39,1,'รายการหมวดหมู่','list',37,0,2,'about.type.list',0,NULL), (40,1,'ข้อมูลเกี่ยวกับ','about',36,1,2,'',0,NULL), (41,1,'เพิ่มข้อมูล','add',40,0,1,'about.about.edit',0,NULL), (42,1,'รายการข้อมูล','list',40,0,2,'about.about.list',0,NULL), (43,1,'โมดูลรูปภาพ','picture',25,0,3,'',0,'fa-picture-o'), (44,1,'จัดการหมวดหมู่','type',43,1,1,'',0,NULL), (45,1,'เพิ่มหมวดหมู่','add',44,0,1,'picture.type.edit',0,NULL), (46,1,'รายการหมวดหมู่','list',44,0,2,'picture.type.list',0,NULL), (47,1,'จัดการรูปภาพ','picture',43,1,2,'',0,NULL), (48,1,'เพิ่มรูปภาพ','add',47,0,1,'picture.picture.edit',0,NULL), (49,1,'รายการรูปภาพ','list',47,0,2,'picture.picture.list',0,NULL), (50,1,'ตั้งค่าโมดูล','set',43,1,3,'',0,NULL), (51,1,'กำหนดค่าโมดูล','config',50,0,1,'picture.set.config',0,NULL), (52,1,'โมดูลเว็บบอร์ด','bbs',25,0,4,'',0,'fa-comments'), (53,1,'จัดการบอร์ด','type',52,1,1,'',0,NULL), (54,1,'เพิ่มบอร์ด','add',53,0,1,'bbs.type.edit',0,NULL), (55,1,'รายการบอร์ด','type',53,0,2,'bbs.type.list',0,NULL), (56,1,'จัดการเทมเพลต','bbs',52,1,3,'',0,NULL), (57,1,'รายการกระทู้','bbs',56,0,1,'bbs.bbs.list',0,NULL), (58,1,'รายการตอบกลับ','replay',56,0,2,'bbs.replay.list',0,NULL), (59,1,'ตั้งค่าโมดูล','set',52,1,4,'',0,NULL), (60,1,'กำหนดค่าโมดูล','config',59,0,1,'bbs.set.config',0,NULL), (61,1,'โมดูลแอปพลิเคชั่น','app',25,0,5,'',0,'fa-android'), (62,1,'จัดการหมวดหมู่','type',61,1,1,'',0,NULL), (63,1,'เพิ่มหมวดหมู่','add',62,0,1,'app.type.edit',0,NULL), (64,1,'รายการหมวดหมู่','list',62,0,2,'app.type.list',0,NULL), (65,1,'จัดการแอปฯ','app',61,1,2,'',0,NULL), (66,1,'เพิ่มแอปฯ','add',65,0,1,'app.app.edit',0,NULL), (67,1,'รายการแอปฯ','list',65,0,2,'app.app.list',0,NULL), (68,1,'คุณสมบัติข้อมูล','attr',61,1,3,'',0,NULL), (69,1,'ข้อมูลพื้นฐาน','abs',68,0,1,'app.attr.abs',0,NULL), (70,1,'เพิ่มบริษัท','add',68,0,2,'app.firms.edit',0,NULL), (71,1,'รายการบริษัท','list',68,0,3,'app.firms.list',0,NULL), (72,1,'ตั้งค่าโมดูล','set',61,1,4,'',0,NULL), (73,1,'กำหนดค่าโมดูล','config',72,0,1,'app.set.config',0,NULL), (74,1,'โมดูลนิยาย','novel',25,0,0,'',0,'fa-book'), (75,1,'จัดการหมวดหมู่','type',74,1,1,'',0,NULL), (76,1,'เพิ่มหมวดหมู่','add',75,0,1,'novel.type.edit',0,NULL), (77,1,'รายการหมวดหมู่','list',75,0,2,'novel.type.list',0,NULL), (78,1,'จัดการนิยาย','novel',74,1,2,'',0,NULL), (79,1,'เพิ่มนิยาย','add',78,0,1,'novel.novel.edit',0,NULL), (80,1,'รายการนิยาย','list',78,0,2,'novel.novel.list',0,NULL), (81,1,'จัดการเล่ม','volume',74,1,3,'',0,NULL), (82,1,'เพิ่มเล่มใหม่','add',81,0,1,'novel.volume.edit',0,NULL), (83,1,'รายการเล่ม','list',81,0,2,'novel.volume.list',0,NULL), (84,1,'จัดการบท','chapter',74,1,4,'',0,NULL), (85,1,'เพิ่มบทใหม่','add',84,0,1,'novel.chapter.edit',0,NULL), (86,1,'รายการบท','list',84,0,2,'novel.chapter.list',0,NULL), (87,1,'ตั้งค่าโมดูล','set',74,1,6,'',0,NULL), (88,1,'จัดการเรื่องแนะนำ','rec',78,0,3,'novel.novel.rec',0,NULL), (91,1,'กำหนดค่านิยาย','config',87,0,4,'novel.set.config',0,NULL), (92,1,'โมดูลนักเขียน','author',25,0,7,'',0,'fa-users'), (93,1,'จัดการนักเขียน','author',92,1,1,'',0,NULL), (94,1,'เพิ่มนักเขียน','add',93,0,1,'author.author.edit',0,NULL), (95,1,'รายการนักเชียน','list',93,0,2,'author.author.list',0,NULL), (96,1,'นิยาย','novel',92,1,2,'',0,NULL), (97,1,'รายการนิยาย','list',96,0,2,'author.novel.novel.list',0,NULL), (98,1,'สถานะ','status',96,0,3,'author.novel.chapter.list',0,NULL), (99,1,'จัดการเงิน','finance',107,1,5,'',0,'fa-jpy'), (100,1,'ยื่นถอนเงิน','cash',99,0,1,'finance.order.cash',0,'fa-money'), (101,1,'บันทึกการเงิน','log',99,0,2,'finance.finance.list',0,'fa-vine'), (102,1,'บันทึกการเติม','charge',99,0,3,'finance.order.charge',0,' fa-buysellads'), (103,1,'ตั้งค่าโมดูล','set',92,1,9,'',0,NULL), (104,1,'ระดับนักเขียน','level',103,0,1,'author.level.author',0,NULL), (105,1,'ระดับการเขียน','sign',103,0,2,'author.level.sign',0,NULL), (106,1,'กำหนดค่าโมดูล','config',103,0,3,'author.set.config',0,NULL), (107,1,'โมดูลผู้ใช้','user',0,0,3,'',0,'fa-user'), (108,1,'จัดการผู้ใช้','user',107,1,1,'',0,'fa-user'), (109,1,'เพิ่มผู้ใช้','add',108,0,1,'user.user.edit',0,'fa-user-plus'), (110,1,'รายการผู้ใช้','list',108,0,2,'user.user.list',0,'fa-users'), (111,1,'จัดการที่ตั้งไว้','preset',107,1,2,'',0,'fa-tachometer'), (112,1,'รูปประจำตัว','head',111,0,1,'user.preset.head',0,'fa-smile-o'), (113,1,'กำหนดค่าระดับ','lv',111,0,2,'user.preset.lv',0,'fa-plane'), (114,1,'จัดการโต้ตอบ','interactive',107,1,3,'',0,'fa-commenting'), (115,1,'ส่งข้อความ','send',114,0,2,'user.msg.send',0,'fa-paper-plane'), (116,1,'รายการข้อความ','list',114,0,3,'user.msg.list',0,'fa-envelope'), (117,1,'ตั้งค่าโมดูล','set',107,1,4,'',0,'fa-th-large'), (118,1,'กำหนดค่าผู้ใช้','config',117,0,1,'user.set.config',0,'fa-user-secret'), (119,1,'โมดูลลิ้งก์พันธมิตร','link',25,0,8,'',0,'fa-link'), (120,1,'จัดการหมวดหมู่','type',119,1,1,'',0,NULL), (121,1,'เพิ่มหมวดหมู่','add',120,0,1,'link.type.edit',0,NULL), (122,1,'รายการหมวดหมู่','list',120,0,2,'link.type.list',0,NULL), (123,1,'จัดการลิ้งก์พันธมิตร','link',119,0,2,'',0,NULL), (124,1,'เพิ่มลิ้งก์พันธมิตร','add',123,0,1,'link.link.edit',0,NULL), (125,1,'รายการลิ้งก์พันธมิตร','list',123,0,2,'link.link.list',0,NULL), (126,1,'ตั้งค่าโมดูล','set',119,1,3,'',0,NULL), (127,1,'จำนวนเว็บ','owed',126,0,1,'link.owed.list',1,NULL), (128,1,'บันทึกการเข้าถึง','click',126,0,2,'link.click.list',0,NULL), (129,1,'กำหนดค่าโมดูล','config',126,0,3,'link.set.config',0,NULL), (130,1,'ดำเนินการ','operations',0,0,4,'',0,'fa-arrows'), (131,1,'จัดการความคิดเห็น','replay',130,1,1,'',0,'fa-comment'), (132,1,'ความเห็นวันนี้','today',131,0,1,'operate.replay.list',1,'fa-square'), (133,1,'ความเห็นสูงสุด','hot',131,0,2,'operate.replay.list',1,'fa-th-large'), (134,1,'ความเห็นทั้งหมด','all',131,0,3,'operate.replay.list',1,'fa-th'), (135,1,'กหนดค่าความคิดเห็น','config',131,0,4,'operate.replay.config',0,'fa-wrench'), (136,1,'จัดการค้นหา','search',130,1,2,'',0,'fa-search'), (137,1,'ค้นทั้งหมด','all',136,0,1,'operate.search.list',1,'fa-search-plus'), (138,1,'ค้นชื่อเรื่อง','name',136,0,2,'operate.search.list',1,'fa-search-minus'), (139,1,'ค้นนักเขียน','author',136,0,3,'operate.search.list',1,'fa-search-minus'), (140,1,'ค้นตามป้ายกำกับ','tag',136,0,4,'operate.search.list',1,'fa-search-minus'), (141,1,'จัดการสไลด์','falsh',130,1,3,'',0,'fa-file-video-o'), (142,1,'เพิ่มสไลด์','add',141,0,3,'operate.flash.edit',0,'fa-plus-circle'), (143,1,'รายการสไลด์','flash',141,0,4,'operate.flash.list',0,'fa-file-text-o'), (144,1,'จัดการข้อความ','message',130,1,4,'',0,'fa-commenting'), (145,1,'รายการข้อความ','message',144,0,1,'operate.message.list',0,'fa-list'), (146,1,'เทมเพลตพื้นฐาน','templates',130,1,5,'',0,'fa-align-justify'), (147,1,'อัพโหลดเทมเพลต','add',146,0,1,'system.templates.edit',0,'fa-cloud-upload'), (148,1,'รายการเทมเพลต','list',146,0,2,'system.templates.list',0,'fa-list'), (149,1,'จัดการกระทู้','zt',130,1,6,'',0,'fa-newspaper-o'), (150,1,'สร้างกระทู้ใหม่','add',149,0,3,'operate.zt.edit',0,'fa-plus-circle'), (151,1,'รายการกระทู้','list',149,0,4,'operate.zt.list',0,'fa-indent'), (152,1,'จัดการหน้าเดี่ยว','diy',130,1,7,'',0,'fa-cubes'), (153,1,'เพิ่มหน้าเดี่ยว','add',152,0,1,'operate.diy.edit',0,'fa-plus-circle'), (154,1,'รายการหน้าเดี่ยว','list',152,0,2,'operate.diy.list',0,'fa-list-alt'), (155,1,'จัดการสถิติ','tongji',130,1,8,'',0,'fa-bar-chart'), (156,1,'โค้ดสถิติ','code',155,0,1,'operate.tongji.code',0,'fa-file-code-o'), (157,1,'จัดการโฆษณา','ad',130,1,9,'',0,'fa-dollar'), (158,1,'เพิ่มโฆษณา','add',157,0,3,'operate.ad.edit',0,'fa-plus-circle'), (159,1,'รายการโฆษณา','list',157,0,4,'operate.ad.list',0,'fa-list-ul'), (160,1,'ศูนย์ข้อมูล','data',0,0,5,'',0,'fa-bar-chart'), (161,1,'ข้อมูลสถิติ','chart',160,0,3,'',0,'fa-area-chart'), (162,1,'กราฟข้อมูล','graph',161,1,1,'',0,NULL), (163,1,'แผนภูมิข้อมูล','tongji',162,0,1,'data.chart.tongji',0,NULL), (164,1,'กราฟเติบโตข้อมูล','week',162,0,2,'data.chart.add',1,NULL), (165,0,'การเก็บข้อมูล','collection',160,0,4,'',0,'fa-list-ul'), (166,1,'จัดการกฎ','rules',165,1,1,'',0,NULL), (167,1,'เพิ่มกฎ','edit',166,0,1,'data.collection.rules',0,NULL), (168,1,'รายการกฎ','rules',166,0,2,'data.collection.rules',0,NULL), (169,1,'จัดการงาน','task',165,1,2,'',0,NULL), (170,1,'เพิ่มงาน','edit',169,0,1,'data.collection.rules',0,NULL), (171,1,'รายการงาน','task',169,0,2,'data.collection.rules',0,NULL), (172,1,'เตรียมงาน','start',169,0,3,'data.collection.rules',0,NULL), (173,1,'จัดการอีเมล์','email',2,0,6,'system.set.email',0,'fa-envelope'), (177,1,'แก้ไขการตั้งค่าทั่วไป','system',3,2,1,'system.set.config',0,NULL), (178,1,'แก้ไขการตั้งค่า API','api',4,2,1,'system.set.api',0,NULL), (179,1,'แก้ไขการตั้งค่าอัพโหลด','config',5,2,1,'system.set.water',0,NULL), (180,1,'แก้ไขการตั้งค่าโดเมน','domain',6,2,1,'system.set.domain',0,NULL), (181,1,'แก้ไขเทมเพลต','update',7,2,1,'system.set.templates',0,NULL), (182,1,'ถอนเทมเพลต','uninstall',7,2,2,'system.set.templates',0,NULL), (183,1,'ติดตั้งเทมเพลต','install',7,2,3,'system.set.templates',0,NULL), (184,1,'แก้ไขการกำหนดค่าอีเมล์','update',173,2,5,'system.set.email',0,NULL), (185,0,'ส่งข้อความทดสอบ','test',173,2,6,'system.email.email',0,NULL), (186,1,'ลบ BOM','delbom',8,2,1,'system.set.delbom',0,NULL), (187,1,'แก้ไขลำดับเมนู','order',11,2,1,'system.menu.menu',0,NULL), (188,1,'แก้ไขเมนู','edit',11,2,3,'system.menu.menu',0,NULL), (189,1,'ลบเมนู','del',11,2,4,'system.menu.menu',0,NULL), (190,1,'เพิ่มเมนู','add',11,2,0,'system.menu.menu',0,NULL), (191,1,'เพิ่มหน้า SEO','add',13,0,1,'system.seo.keys.edit',0,NULL), (192,1,'แก้ไข SEO','edit',13,0,2,'system.seo.keys.edit',0,NULL), (193,1,'เพิ่มการดำเนินการ SEO','add',191,2,10,'system.seo.keys',0,NULL), (194,1,'แก้ไขการดำเนินการ SEO','edit',192,2,10,'system.seo.keys',0,NULL), (195,1,'เพิ่มลิ้งก์','add',14,0,1,'system.seo.rewrite.edit',0,NULL), (196,1,'แก้ไขลิ้งก์','edit',14,0,1,'system.seo.rewrite.edit',0,NULL), (197,1,'เพิ่มการดำเนินการลิ้งก์','add',195,2,1,'system.seo.rewrite',0,NULL), (198,1,'แก้ไขการดำเนินการลิ้งก์','edit',196,2,1,'system.seo.rewrite',0,NULL), (199,1,'เพิ่มสิทธิ์ดำเนินการ','add',17,2,1,'system.competence.competence',0,NULL), (200,1,'แก้ไขสิทธิ์ดำเนินการ','edit',17,2,2,'system.competence.competence',0,NULL), (201,1,'เพิ่มผู้ดูแล','add',20,2,1,'system.manager.manager',0,NULL), (202,1,'แก้ไขของผู้ดูแล','edit',20,2,2,'system.manager.manager',0,NULL), (203,1,'ปิดใช้การกู้คืน','status',20,2,3,'system.manager.manager',0,NULL), (204,1,'ลบบัญชีผู้ดูแล','del',20,2,4,'system.manager.manager',0,NULL), (205,1,'ลบบันทึกการเข้าสู่ระบบ','del',23,2,1,'system.safe.log',0,NULL), (206,1,'รายละเอียดบันทึกการเข้าสู่ระบบ','detail',23,0,2,'system.safe.log.detail',0,NULL), (207,1,'เปลี่ยนรหัสผ่าน','uppsw',24,2,1,'system.safe.account',0,NULL), (208,1,'สร้างแคชคำหลัก','config',13,2,3,'system.seo.keys',0,NULL), (209,1,'สร้างแคชลิ้งก์','config',14,2,4,'system.seo.rewrite',0,NULL), (210,1,'เพิ่มหมวดหมู่บทความ','add',28,2,1,'article.type',0,NULL), (211,1,'แก้ไขหมวดหมู่บทความ','edit',28,2,1,'article.type',0,NULL), (212,1,'แก้ไขเทมเพลต','edit',147,0,2,'system.templates.edit',0,NULL), (213,1,'เพิ่มเทมเพลต','add',147,2,1,'system.templates.templates',0,NULL), (214,1,'ค้นหาเทมเพลต','lookup',148,0,1,'system.templates.lookup',0,NULL), (215,1,'บันทึกคำร้อง','requset',22,0,7,'system.safe.request',0,'fa-random'), (216,1,'รายละเอียดคำร้อง','detail',215,0,1,'system.safe.request.detail',0,NULL), (217,0,'ลบบันทึกคำร้อง','del',215,2,2,'system.safe.request',0,NULL), (218,0,'ล้างบันทึกคำร้อง','clear',215,2,3,'system.safe.request',0,NULL), (219,0,'ล้างบันทึกเข้าสู่ระบบ','clear',23,2,4,'system.safe.log',0,NULL), (220,1,'บันทึกการดำเนินงาน','operation',22,0,9,'system.safe.operation',0,'fa-list'), (221,0,'ลบบันทึกการดำเนินงาน','del',220,2,1,'system.safe.operation',0,NULL), (222,0,'ล้างบันทึกการดำเนินงาน','clear',220,2,2,'system.safe.operation',0,NULL), (223,0,'รายละเอียดบันทึกการดำเนินงาน','detail',220,0,1,'system.safe.operation.detail',0,NULL), (224,0,'จัดการสิทธิ์การลบ','del',18,2,2,'system.competence.competence',0,NULL), (225,0,'แก้ไขบทความ','edit',31,2,1,'article.article',0,NULL), (226,0,'เพิ่มบทความ','add',31,2,2,'article.article',0,NULL), (227,0,'แก้ไขหมวดหมู่บทความ','edit',27,0,10,'article.type.edit',0,NULL), (228,1,'ลบหมวดหมู่บทความ','del',28,2,2,'article.type',0,NULL), (229,1,'ลบบทความ','del',31,2,3,'article.article',0,NULL), (230,1,'ตรวจสอบบทความ','status',31,2,4,'article.article',0,NULL), (231,1,'ย้ายบทความ','move',31,2,5,'article.article',0,NULL), (232,1,'กำหนดบทความ','attr',31,2,6,'article.article',0,NULL), (233,1,'แก้ไขเนื้อหาบทความ','edit',31,0,2,'article.article.edit',0,NULL), (234,1,'แก้ไขการกระืทำ','edit',31,2,7,'article.author',0,NULL), (235,1,'ลบนักเขียน','del',31,2,8,'article.author',0,NULL), (236,1,'เพิ่มนักเขียน','add',31,2,9,'article.author',0,NULL), (237,1,'แก้ไขแหล่งที่มา','edit',34,0,1,'article.author.edit',0,NULL), (238,1,'เพิ่มแหล่งที่มา','add',34,0,2,'article.author.edit',0,NULL), (239,1,'รายการกำหนดค่า','list',245,0,1,'system.config.list',0,'fa-list-ul'), (240,1,'แก้ไขกำหนดค่า','edit',239,0,1,'system.config.edit',0,NULL), (241,1,'เพิ่มกำหนดค่า','add',239,0,2,'system.config.edit',0,NULL), (242,1,'เพิ่มกำหนดค่า','add',241,2,1,'system.config.config',0,NULL), (243,1,'แก้ไขกำหนดค่า','edit',241,2,2,'system.config.config',0,NULL), (244,1,'ลบกำหนดค่า','del',241,2,3,'system.config.config',0,NULL), (245,1,'จัดการกำหนดค่า','option',1,0,2,'',0,'fa-server'), (246,1,'จัดการตัวเลือก','optionlist',245,0,2,'system.config.option.list',0,'fa-file-text-o'), (247,1,'เพิ่มตัวเลือก','add',246,0,3,'system.config.option.edit',0,NULL), (248,1,'แก้ไขตัวเลือก','edit',246,0,4,'system.config.option.edit',0,NULL), (249,1,'ลบตัวเลือก','edit',246,2,1,'system.config.option',0,NULL), (250,1,'เพิ่มตัวเลือก','add',246,2,2,'system.config.option',0,NULL), (251,1,'ดึงกลุ่มการกำหนดค่า','getconfig',246,2,3,'system.config.config',0,NULL), (252,1,'ลบตัวเลือก','del',246,2,4,'system.config.option',0,NULL), (253,1,'แก้ไขกำหนดค่า','edit',35,2,1,'article.config',0,NULL), (254,1,'บันทึกข้อผิดพลาด','errlog',22,0,11,'system.safe.errlog',0,'fa-bug'), (255,1,'รายละเอียดบันทึกข้อผิดพลาด','detail',254,0,1,'system.safe.errlog.detail',0,NULL), (256,1,'ลบบันทึก','del',254,2,1,'system.safe.errlog',0,NULL), (257,1,'ล้างบันทึก','clear',254,2,2,'system.safe.errlog',0,NULL), (258,1,'เลือกแหล่งที่มา','lookup',31,0,10,'article.author.lookup',0,NULL), (259,1,'ถังรีไซเคิล','recycle',30,0,3,'article.article.recycle',0,NULL), (260,1,'กู้คืน','reduction',259,2,1,'article.article',0,NULL), (261,1,'ลบอย่างสมบูรณ์','realdel',259,2,2,'article.article',0,NULL), (262,0,'เพิ่มหมวดหมู่นิยาย','add',76,2,1,'novel.type',0,NULL), (263,0,'แก้ไขหมวดหมู่นิยาย','edit',76,2,2,'novel.type',0,NULL), (264,0,'ลบหมวดหมู่นิยาย','del',77,2,1,'novel.type',0,NULL), (265,1,'เพิ่มนิยาย','add',79,2,1,'novel.novel',0,NULL), (266,1,'ลบนิยาย','del',80,2,1,'novel.novel',0,NULL), (267,1,'ตรวจสอบนิยาย','status',80,2,2,'novel.novel',0,NULL), (268,1,'ย้ายนิยาย','move',80,2,3,'novel.novel',0,NULL), (269,0,'แนะนำหลายรายการ','rec',80,2,4,'novel.rec',0,NULL), (270,1,'แก้ไขนิยาย','edit',79,2,2,'novel.novel',0,NULL), (271,1,'เพิ่มเล่ม','add',82,2,1,'novel.volume',0,NULL), (272,1,'ค้นหานิยาย','search',80,2,5,'novel.novel',0,NULL), (273,1,'ลบเล่ม','del',83,2,1,'novel.volume',0,NULL), (274,0,'แก้ไขหมวดหมู่นิยาย','edit',75,0,2,'novel.type.edit',0,NULL), (275,0,'แก้ไขนิยาย','edit',78,0,10,'novel.novel.edit',0,NULL), (276,0,'แก้ไขเล่ม','edit',81,0,10,'novel.volume.edit',0,NULL), (277,0,'ดึงเล่ม','getvolume',81,2,3,'novel.volume',0,NULL), (278,1,'เพิ่มบท','add',85,2,1,'novel.chapter',0,NULL), (279,0,'แก้ไขบท','edit',85,0,2,'novel.chapter.edit',0,NULL), (280,1,'แก้ไขเนื้อหาบท','edit',279,2,1,'novel.chapter',0,NULL), (281,1,'ลบบท','del',86,2,1,'novel.chapter',0,NULL), (282,1,'ล้างบท','clear',86,2,2,'novel.chapter',0,NULL), (283,0,'ลบการแนะนำ','del',80,2,2,'novel.rec',0,NULL), (284,0,'แก้ไขการแนะนำ','edit',80,0,1,'novel.novel.rec.edit',0,NULL), (285,0,'แก้ไขการแนะนำ','edit',80,2,10,'novel.rec',0,NULL), (286,1,'แก้ไขกำหนดค่า','edit',91,2,10,'novel.config',0,NULL), (287,1,'แก้ไขเล่ม','edit',82,2,2,'novel.volume',0,NULL), (288,1,'เพิ่มผู้ใช้','add',109,2,1,'user.user',0,NULL), (290,1,'ลบผู้ใช้','del',110,2,1,'user.user',0,NULL), (289,1,'แก้ไขผู้ใช้','edit',109,2,2,'user.user',0,NULL), (291,1,'ตรวจสอบผู้ใช้','status',110,2,2,'user.user',0,NULL), (292,0,'แก้ไขผู้ใช้','edit',108,0,1,'user.user.edit',0,NULL), (293,0,'ลบอวตาล','del',112,2,1,'user.head',0,NULL), (294,0,'เพิ่มอวตาล','add',112,2,2,'user.head',0,NULL), (295,0,'เพิ่มระดับ','add',113,2,1,'user.lv',0,NULL), (296,1,'แก้ไขระดับ','edit',113,2,2,'user.lv',0,NULL), (297,0,'ลบระดับ','del',113,2,3,'user.lv',0,NULL), (298,0,'ส่งข้อความ','send',115,2,1,'user.msg',0,NULL), (299,0,'ลบข้อความ','del',116,2,1,'user.msg',0,NULL), (300,0,'ล้างข้อความ','clear',116,2,1,'user.msg',0,NULL), (475,0,'ย้ายลำดับบท','order',74,0,3,'novel.chapter.order',0,NULL), (302,0,'แก้ไขกำหนดค่า','edit',118,2,1,'user.config',0,NULL), (303,0,'ลบความคิดเห็น','del',131,2,1,'operate.replay',0,NULL), (304,0,'ล้างความคิดเห็น','clear',131,2,2,'operate.replay',0,NULL), (305,0,'ตรวจสอบความคิดเห็น','status',131,2,3,'operate.replay',0,NULL), (306,0,'แก้ไขกำหนดค่า','edit',135,2,1,'operate.replay.config',0,NULL), (307,0,'ลบการค้นหา','del',137,2,1,'operate.search',0,NULL), (308,0,'ล้างการค้นหา','clear',137,2,2,'operate.search',0,NULL), (309,0,'แก้ไขสไลด์','edit',141,0,1,'operate.flash.edit',0,NULL), (310,0,'เพิ่มสไลด์','add',142,2,1,'operate.flash',0,NULL), (311,0,'แก้ไขสไลด์','edit',142,2,2,'operate.flash',0,NULL), (312,0,'แสดงสไลด์','status',143,2,1,'operate.flash',0,NULL), (313,0,'ลบสไลด์','del',143,2,2,'operate.flash',0,NULL), (314,0,'ล้างสไลด์','clear',143,2,3,'operate.flash',0,NULL), (315,0,'ตรวจสอบข้อความ','status',145,2,1,'operate.message',0,NULL), (316,0,'ลบข้อความ','del',145,2,2,'operate.message',0,NULL), (317,0,'ล้างข้อความ','clear',145,2,3,'operate.message',0,NULL), (318,0,'ดึงหมวดหมู่โมดูล','gettype',147,2,1,'system.templates.templates',0,NULL), (319,0,'ลบเทมเพลตที่ตั้งไว้','del',147,2,1,'system.templates.templates',0,NULL), (320,0,'ล้างเทมเพลตที่ตั้งไว้','clear',147,2,2,'system.templates.templates',0,NULL), (321,0,'แก้ไขเทมเพลตที่ตั้งไว้','edit',147,2,2,'system.templates.templates',0,NULL), (322,0,'เพิ่มหน้าเดี่ยว','add',153,2,1,'operate.diy',0,NULL), (323,0,'ลบหน้าเดี่ยว','del',154,2,1,'operate.diy',0,NULL), (324,0,'ล้างหน้าเดี่ยว','clear',154,2,2,'operate.diy',0,NULL), (325,0,'ตรวจสอบหน้าเดี่ยว','status',154,2,3,'operate.diy',0,NULL), (326,0,'แก้ไขหน้าเดี่ยว','edit',153,2,2,'operate.diy',0,NULL), (327,0,'แก้ไขหน้าเดี่ยว','edit',154,0,1,'operate.diy.edit',0,NULL), (328,0,'แก้ไขสถิติ','edit',156,2,1,'operate.tongji',0,NULL), (329,0,'เพิ่มโฆษณา','add',158,2,1,'operate.ad',0,NULL), (330,0,'แก้ไขโฆษณา','edit',158,2,1,'operate.ad',0,NULL), (331,1,'ตรวจสอบโฆษณา','status',159,2,1,'operate.ad',0,NULL), (332,1,'ลบโฆษณา','del',159,2,2,'operate.ad',0,NULL), (333,1,'ล้างโฆษณา','clear',159,2,3,'operate.ad',0,NULL), (334,0,'แก้ไขโฆษณา','edit',157,0,1,'operate.ad.edit',0,NULL), (335,1,'เพิ่มหมวดหมู่','add',157,0,1,'operate.ad.type.edit',0,'fa-plus-circle'), (336,1,'รายการหมวดหมู่','list',157,0,2,'operate.ad.type.list',0,'fa-list'), (337,0,'เพิ่มหมวดหมู่','add',335,2,1,'operate.ad.type',0,NULL), (338,0,'แก้ไขหมวดหมู่','edit',335,2,2,'operate.ad.type',0,NULL), (339,0,'ลบหมวดหมู่','del',336,2,1,'operate.ad.type',0,NULL), (340,0,'ล้างหมวดหมู่','clear',336,2,2,'operate.ad.type',0,NULL), (341,0,'แก้ไขหมวดหมู่','edit',157,0,2,'operate.ad.type.edit',0,NULL), (342,0,'สถิติเดือนนี้','month',162,0,3,'data.chart.add',0,NULL), (343,0,'สถิติปีนี้','year',162,0,4,'data.chart.add',0,NULL), (344,0,'เพิ่มกระทู้','add',150,2,1,'operate.zt',0,NULL), (345,0,'ลบกระทู้','del',151,2,1,'operate.zt',0,NULL), (346,0,'ล้างกระทู้','clear',151,2,2,'operate.zt',0,NULL), (347,0,'ตรวจสอบกระทู้','status',151,2,3,'operate.zt',0,NULL), (348,0,'แก้ไขกระทู้','edit',151,2,4,'operate.zt',0,NULL), (349,0,'แก้ไขกระทู้','edit',151,0,1,'operate.zt.edit',0,NULL), (350,0,'รายการกระทู้','node',149,0,1,'operate.zt.node.list',0,NULL), (351,0,'เพิ่มกระทู้','add',149,0,2,'operate.zt.node.edit',0,NULL), (352,0,'แก้ไขกระทู้','edit',149,0,3,'operate.zt.node.edit',0,NULL), (353,1,'เพิ่มกระทู้','add',351,2,1,'operate.zt.node',0,NULL), (354,1,'แก้ไขกระทู้','edit',352,2,1,'operate.zt.node',0,NULL), (355,1,'ลบกระทู้','del',350,2,1,'operate.zt.node',0,NULL), (356,1,'ล้างกระทู้','clear',350,2,2,'operate.zt.node',0,NULL), (357,1,'บันทึกความรู้สึก','dingcai',359,0,1,'operate.operate.list',1,'fa-list-ul'), (358,1,'บันทึกคะแนน','score',359,0,2,'operate.operate.list',1,'fa-list-ul'), (359,1,'จัดการโต้ตอบ','interaction',130,0,2,'',0,'fa-thumbs-up'), (360,1,'ลบการโต้ตอบ','del',359,2,1,'operate.operate',0,NULL), (361,1,'ล้างการโต้ตอบ','clear',359,2,1,'operate.operate',0,NULL), (362,1,'บันทึกเช็คชื่อ','sign',114,0,1,'user.sign.list',0,'fa-list-ul'), (363,1,'ลบบันทึกเช็คชื่อ','del',362,2,10,'user.sign',0,NULL), (364,1,'ล้างบันทึกเช็คชื่อ','clear',362,2,10,'user.sign',0,NULL), (365,1,'จัดการไฟล์','file',160,0,2,'',0,'fa-file'), (366,1,'รายการไฟล์','list',365,0,2,'data.file.list',0,'fa-list-ul'), (367,0,'เปลี่ยนชื่อไฟล์','rename',366,0,1,'data.file.rename',0,NULL), (368,0,'เปลี่ยนชื่อ','rename',367,2,1,'data.file',0,NULL), (370,0,'สร้างโฟลเดอร์','createfolder',367,0,3,'data.file.createfolder',0,NULL), (369,0,'ลบ','del',367,2,2,'data.file',0,NULL), (371,0,'สร้างโฟลเดอร์','createfolder',370,2,1,'data.file',0,NULL), (373,1,'ย้ายไฟล์','movefile',372,2,1,'data.file',0,NULL), (372,0,'ย้ายไฟล์','movefile',365,0,1,'data.file.movefile',0,NULL), (374,0,'เพิ่มไฟล์','create',366,0,1,'data.file.file',0,NULL), (375,0,'แก้ไขไฟล์','edit',366,0,1,'data.file.file',0,NULL), (376,1,'เพิ่มไฟล์','create',374,2,1,'data.file',0,NULL), (377,1,'แก้ไขไฟล์','edit',375,2,1,'data.file',0,NULL), (378,1,'จัดการฐานข้อมูล','mysql',160,0,1,'data.mysql',0,'fa-cubes'), (379,1,'ดำเนินการ SQL','runsql',378,0,2,'data.mysql.runsql',0,'fa-list-ul'), (380,1,'ดำเนินการ SQL','runsql',379,2,1,'data.mysql',0,NULL), (381,1,'รายการตารางฐานข้อมูล','table',378,0,1,'data.mysql.table',0,'fa-list-ul'), (382,1,'เพิ่มประสิทธิภาพตาราง','optimize',381,2,1,'data.mysql',0,NULL), (383,1,'ซ่อมแซมตาราง','repair',381,2,2,'data.mysql',0,NULL), (384,1,'เพิ่มหมวดหมู่','add',121,2,1,'link.type',0,NULL), (385,1,'แก้ไขหมวดหมู่','edit',122,2,1,'link.type',0,NULL), (386,0,'แก้ไขหมวดหมู่ลิ้งก์พันธมิตร','edit',120,0,2,'link.type.edit',0,NULL), (387,0,'ลบหมวดหมู่','del',122,2,2,'link.type',0,NULL), (388,0,'เพิ่มลิงก์พันธมิตร','add',124,2,1,'link.link',0,NULL), (389,0,'แก้ไขลิ้งก์พันธมิตร','edit',125,2,2,'link.link',0,NULL), (390,0,'ลบลิ้งก์พันธมิตร','del',125,2,3,'link.link',0,NULL), (391,0,'ล้างลิ้งก์พันธมิตร','clear',125,2,4,'link.link',0,NULL), (392,0,'ตรวจสอบลิ้งก์พันธมิตร','status',125,2,5,'link.link',0,NULL), (393,0,'ลิ้งก์พันธมิตรแนะนำ','attr',125,2,6,'link.link',0,NULL), (394,0,'ย้ายลิ้งก์พันธมิตร','move',125,2,7,'link.link',0,NULL), (395,0,'แก้ไขลิ้งก์พันธมิตร','edit',125,0,1,'link.link.edit',0,NULL), (396,0,'ลบประวัติการคลิ๊ก','del',128,2,1,'link.click',0,NULL), (397,0,'ล้างประวัติการคลิ๊ก','clear',128,2,2,'link.click',0,NULL), (398,0,'แก้ไขกำหนดค่าลิ้งก์พันธมิตร','edit',129,2,1,'link.config',0,NULL), (399,0,'เพิ่มหมวดหมู่','add',41,2,1,'about.type',0,NULL), (400,0,'แก้ไขหมวดหมู่','edit',42,2,1,'about.type',0,NULL), (401,0,'แก้ไขข้อมูลหมวดหมู่','edit',42,0,1,'about.type.edit',0,NULL), (402,1,'ลบหมวดหมู่','del',42,2,2,'about.type',0,NULL), (403,0,'แก้ไขข้อมูล','edit',42,0,1,'about.about.edit',0,NULL), (404,0,'ลบข้อมูล','del',42,2,3,'about.about',0,NULL), (405,0,'ล้างข้อมูล','clear',42,2,4,'about.about',0,NULL), (406,0,'เพิ่มข้อมูล','add',42,2,5,'about.about',0,NULL), (407,0,'แก้ไขข้อมูล','edit',42,2,6,'about.about',0,NULL), (408,0,'ย้ายข้อมูล','move',42,2,7,'about.about',0,NULL), (409,0,'ตรวจสอบลิ้งก์พันธมิตร','checkseo',42,2,8,'link.link',0,NULL), (410,0,'ตรวจสอบลิ้งก์พันธมิตรย้อนกลับ','checkback',42,2,9,'link.link',0,NULL), (411,1,'รางวัลและบทลงโทษผู้ใช้','reward',110,0,3,'user.user.reward',0,NULL), (412,0,'รางวัลและบทลงโทษผู้ใช้','reward',411,2,1,'user.user',0,NULL), (413,0,'แก้ไขหมวดหมู่อัลบั้ม','edit',44,0,2,'picture.type.edit',0,NULL), (414,0,'เพิ่มหมวดหมู่อัลบั้ม','add',45,2,1,'picture.type',0,NULL), (415,0,'แก้ไขหมวดหมู่','edit',46,2,1,'picture.type',0,NULL), (416,0,'ลบหมวดหมู่','del',46,2,2,'picture.type',0,NULL), (417,0,'เพิ่มอัลบั้ม','add',48,2,1,'picture.picture',0,NULL), (418,0,'แก้ไขอัลบั้ม','edit',49,2,2,'picture.picture',0,NULL), (419,0,'ลบอัลบั้ม','del',49,2,3,'picture.picture',0,NULL), (420,0,'ตรวจสอบอัลบั้ม','status',49,2,4,'picture.picture',0,NULL), (421,0,'ย้ายอัลบั้ม','move',49,2,5,'picture.picture',0,NULL), (422,0,'คุณสมบัติอัลบั้ม','attr',49,2,6,'picture.picture',0,NULL), (423,0,'แก้ไขอัลบั้ม','edit',49,0,7,'picture.picture.edit',0,NULL), (424,0,'แก้ไขการตั้งค่า','edit',51,2,1,'picture.config',0,NULL), (425,1,'เมนูทางลัด','quick',9,0,3,'system.menu.quick',0,'fa-list-ul'), (426,0,'จัดการทรัพยากรคงที่','static',147,0,3,'system.templates.static',0,NULL), (427,1,'ลบทรัพยากร','delstatic',426,2,1,'system.templates.templates',0,NULL), (428,1,'ลบหมวดหมู่','del',64,2,1,'app.type',0,NULL), (429,1,'เพิ่มหมวดหมู่','add',63,2,2,'app.type',0,NULL), (430,1,'แก้ไขหมวดหมู่','edit',64,2,3,'app.type',0,NULL), (431,0,'แก้ไขหมวดหมู่แอปฯ','edit',62,0,2,'app.type.edit',0,NULL), (432,0,'แก้ไขแอปฯ','edit',65,0,1,'app.app.edit',0,NULL), (433,0,'ลบแอปฯ','del',67,2,1,'app.app',0,NULL), (434,0,'เพิ่มแอปฯ','add',67,2,2,'app.app',0,NULL), (435,0,'แก้ไขแอปฯ','edit',67,2,3,'app.app',0,NULL), (436,0,'ตรวจสอบแอปฯ','status',67,2,4,'app.app',0,NULL), (437,0,'ย้ายแอปฯ','move',67,2,5,'app.app',0,NULL), (438,0,'คุณสมบัติแอปฯ','attr',67,2,6,'app.app',0,NULL), (439,0,'เพิ่มข้อมูล','add',69,0,1,'app.attr.edit',0,NULL), (440,0,'แก้ไขข้อมูล','edit',69,0,1,'app.attr.edit',0,NULL), (441,0,'เพิ่มข้อมูล','add',439,2,1,'app.attr',0,NULL), (442,0,'แก้ไขข้อมูล','edit',440,2,1,'app.attr',0,NULL), (443,0,'ลบข้อมูล','del',69,2,2,'app.attr',0,NULL), (444,0,'แก้ไขการตั้งค่า','edit',73,2,1,'app.config',0,NULL), (445,0,'เพิ่มผู้ขาย','add',70,2,1,'app.firms',0,NULL), (446,0,'แก้ไขผู้ขาย','edit',71,2,2,'app.firms',0,NULL), (447,0,'ลบผู้ใช้','del',71,2,3,'app.firms',0,NULL), (448,0,'แก้ไขผู้ขาย','edit',71,0,1,'app.firms.edit',0,NULL), (449,0,'ค้นหาผู้ขาย','search',71,2,1,'app.firms',0,NULL), (450,0,'สำรองข้อมูล','backup',366,2,1,'data.file',0,NULL), (451,0,'แก้ไขบอร์ด','edit',53,0,2,'bbs.type.edit',0,NULL), (452,0,'เพิ่มบอร์ด','add',54,2,3,'bbs.type',0,NULL), (453,0,'แก้ไขบอร์ด','edit',55,2,1,'bbs.type',0,NULL), (454,0,'ลบบอร์ด','del',55,2,2,'bbs.type',0,NULL), (455,0,'ลบกระทู้','del',57,2,1,'bbs.bbs',0,NULL), (456,0,'ย้ายกระทู้','move',57,2,2,'bbs.bbs',0,NULL), (457,0,'ตรวจสอบกระทู้','status',57,2,3,'bbs.bbs',0,NULL), (458,0,'คุณสมบัติกระทู้','attr',57,2,4,'bbs.bbs',0,NULL), (459,0,'แก้ไขการตั้งค่า','edit',60,2,1,'bbs.config',0,NULL), (460,1,'ป้ายกำกับกำหนดเอง','label',245,0,3,'system.config.label.list',0,'fa-list-ul'), (461,0,'เพิ่มป้ายกำกับ','add',245,0,1,'system.config.label.edit',0,NULL), (462,0,'แก้ไขป้ายกำกับ','edit',245,0,2,'system.config.label.edit',0,NULL), (463,1,'เพิ่มป้ายกำกับ','add',460,2,1,'system.config.label',0,NULL), (464,1,'แก้ไขป้ายกำกับ','edit',460,2,2,'system.config.label',0,NULL), (465,1,'ลบป้ายกำกับ','del',460,2,3,'system.config.label',0,NULL), (466,1,'จัดการโลโก้','logo',2,0,3,'system.set.logo',0,'fa-file-image-o'), (467,1,'แก้ไขโลโก้','logo',466,2,1,'system.set.logo',0,NULL), (468,0,'เพิ่มผู้จัดการ','add',469,0,1,'bbs.moder.edit',0,NULL), (469,0,'จัดการผู้จัดการ','moder',52,0,2,NULL,0,NULL), (470,0,'แก้ไขผู้จัดการ','edit',469,0,2,'bbs.moder.edit',0,NULL), (471,0,'เพิ่มผู้จัดการ','add',470,2,1,'bbs.moder',0,NULL), (472,0,'แก้ไขผู้จัดการ','edit',470,2,1,'bbs.moder',0,NULL), (473,1,'กำหนดค่าข้อความ','config',144,0,2,'operate.message.config',0,'cogs'), (474,0,'แก้ไขกำหนดค่าข้อความ','edit',473,2,10,'operate.message.config',0,NULL), (476,0,'ย้ายลำดับ','order',475,2,1,'novel.chapter',0,NULL), (477,1,'การผูกฟังก์ชั่น','article',33,0,3,'system.module.config',1,NULL), (478,0,'การผูกฟังก์ชั่น','edit',245,2,1,'system.module.config',0,NULL), (479,1,'การผูกฟังก์ชั่น','picture',50,0,3,'system.module.config',1,NULL), (480,1,'การผูกฟังก์ชั่น','bbs',59,0,3,'system.module.config',1,NULL), (481,1,'การผูกฟังก์ชั่น','app',72,0,3,'system.module.config',1,NULL), (482,1,'การผูกฟังก์ชั่น','novel',87,0,5,'system.module.config',1,NULL), (483,1,'การผูกฟังก์ชั่น','author',103,0,3,'system.module.config',1,NULL), (484,1,'การผูกฟังก์ชั่น','link',126,0,3,'system.module.config',1,NULL), (485,1,'การผูกฟังก์ชั่น','user',117,0,3,'system.module.config',1,'lock'), (486,1,'ตั้งค่าโมดูล','config',36,0,3,'',0,NULL), (487,1,'การผูกฟังก์ชั่น','about',486,0,3,'system.module.config',1,NULL), (488,1,'สร้างกฎ','createrewrite',12,0,8,'system.seo.createrewrite',0,'arrows-h'), (489,1,'ฟิลด์ที่กำหนดเอง','field',245,0,4,'system.config.field.list',0,'fa-indent'), (490,1,'เพิ่มฟิลด์','add',489,0,1,'system.config.field.edit',0,NULL), (491,1,'แก้ไขฟิลด์','edit',489,0,2,'system.config.field.edit',0,NULL), (492,0,'ดึงหมวดหมู่โมดูล','gettype',489,2,1,'system.config.field',0,NULL), (493,0,'เพิ่มฟิลด์','add',490,2,1,'system.config.field',0,NULL), (494,0,'แก้ไขฟิลด์','edit',491,2,1,'system.config.field',0,NULL), (495,0,'ลบฟิลด์','del',489,2,3,'system.config.field',0,NULL), (496,0,'ดึงฟิลด์ที่กำหนดเอง','getfield',489,2,2,'system.config.field',0,NULL), (497,1,'ประสิทธิภาพแคช','cache',1,0,3,'',0,'fa-viacoin'), (498,1,'ตั้งค่าแคช','set',497,0,1,'system.cache.set',0,'fa-list-ul'), (499,1,'ล้างแคช','clear',497,0,2,'system.cache.clear',0,'fa-refresh'), (500,0,'ตั้งค่าแคช','config',498,2,1,'system.cache',0,NULL), (501,0,'ล้างแคช','clear',499,2,2,'system.cache',0,NULL), (502,0,'รายละเอียดความคิดเห็น','detail',131,0,1,'operate.replay.detail',0,NULL), (503,1,'การผูกฟังก์ชั่น','search',136,0,4,'system.module.config',1,'lock'), (504,0,'ปฏิเสธนักเขียน','refuse_author_apply',95,0,0,'system.apply.refuse',0,NULL), (505,0,'การตั้งค่าโมดูล','edit',106,2,0,'author.config',0,NULL), (506,0,'ครวจสอบผู้ใช้','status',95,2,1,'author.author',2,NULL), (507,0,'ลบนักเขียน','del',95,2,2,'author.author',2,NULL), (508,0,'ปฏิเสธนักเขียน','refuse_author_apply',95,2,3,'system.apply',0,NULL), (509,0,'เพิ่มนักเขียน','add',94,2,1,'author.author',0,NULL), (510,0,'แก้ไขนักเขียน','edit',94,2,2,'author.author',0,NULL), (511,0,'แก้ไขนักเขียน','edit',95,0,3,'author.author.edit',0,NULL), (512,1,'ปกรอตรวจสอบ','list',96,0,0,'author.novel.cover.list',0,NULL), (513,0,'ตรวจสอบปก','status',512,2,1,'author.novel.cover',0,NULL), (514,0,'ลบปก','del',512,2,2,'author.novel.cover',0,NULL), (515,0,'ปฏิเสธปก','refuse_author_novel_cover',512,0,1,'system.apply.refuse',0,NULL), (516,0,'ปฏิเสธปก','refuse_author_novel_cover',515,2,1,'system.apply',0,NULL), (517,1,'แก้ไขการลงทะเบียนนักเขียน','update',96,0,1,'author.novel.novelapply.list',0,NULL), (518,0,'ลบการลงทะเบียนนักเขียน','del',517,2,1,'author.novel.apply',0,NULL), (519,0,'ตรวจสอบการลงทะเบียนนักเขียน','status',517,2,2,'author.novel.apply',0,NULL), (520,0,'ดูข้อมูลที่เปลี่ยนแปลง','refuse_author_novel_edit',517,0,1,'system.apply.detail',0,NULL), (521,1,'ปฏิเสธการแก้ไขนิยาย','refuse_author_novel_editnovel',517,0,1,'system.apply.refuse',0,NULL), (522,1,'ปฏิเสธการแก้ไขนิยาย','refuse_author_novel_editnovel',521,2,1,'system.apply',0,NULL), (523,0,'ดูข้อมูลที่เปลี่ยนแปลง','refuse_author_chapter_edit',98,0,1,'system.apply.detail',0,NULL), (524,1,'ปฏิเสธการแก้ไขบท','refuse_author_novel_editchapter',98,0,1,'system.apply.refuse',0,NULL), (525,1,'ปฏิเสธการแก้ไขบท','refuse_author_novel_editchapter',98,2,2,'system.apply',0,NULL), (526,1,'ตรวจสอบบท','status',98,2,3,'author.chapter.apply',0,NULL), (527,1,'ล้างบท','clear',98,2,4,'author.chapter.apply',0,NULL), (528,1,'ล้างนิยาย','clear',517,2,3,'author.novel.apply',0,NULL), (529,1,'เพิ่มบทความ','aritcle',92,1,3,'',0,NULL), (530,1,'ตรวจสอบบทความ','aritcle_list',529,0,1,'author.article.list',0,NULL), (531,1,'ลบบท','del',98,2,5,'author.chapter.apply',0,NULL), (532,1,'ลบบทความ','del',529,2,1,'author.article.apply',0,NULL), (533,1,'ล้างบทความ','clear',529,2,2,'author.article.apply',0,NULL), (534,1,'ตรวจสอบบทความ','status',529,2,3,'author.article.apply',0,NULL), (535,0,'ปฏิเสธการแก้ไขบทความ','refuse_author_article_edit',529,0,4,'system.apply.refuse',0,NULL), (536,1,'ปฏิเสธการแก้ไขบทความ','refuse_author_article_editarticle',535,2,10,'system.apply',0,NULL), (537,1,'สร้าง HTML หน้าหลัก','index',15,2,1,'system.seo.html',0,NULL), (538,1,'ดึงหมวดหมู่โมดูล','gettype',15,2,2,'system.seo.html',0,NULL), (539,1,'สร้าง HTML เนื้อหา','content',15,2,3,'system.seo.html',0,NULL), (540,1,'สร้าง HTML รายการ','list',15,2,4,'system.seo.html',0,NULL), (541,1,'สร้าง HTML หน้าหลักหมวดหมู่','tindex',15,2,5,'system.seo.html',0,NULL), (542,1,'สร้าง HTML สารบัญ','menu',15,2,6,'system.seo.html',0,NULL), (543,1,'สร้างแผนผังเว็บไซต์','sitemap',12,0,4,'system.seo.sitemap',0,'fa-sitemap'), (544,1,'สร้าง RSS','rss',12,0,5,'system.seo.rss',0,'fa-rss '), (545,1,'สร้างแผนผังเว็บไซต์','sitemap',543,2,1,'system.seo.sitemap',0,NULL), (546,1,'ดึงหมวดหมู่โมดูล','gettype',544,2,1,'system.seo.sitemap',0,NULL), (547,1,'สร้าง RSS หน้าหลัก','rss',544,2,2,'system.seo.sitemap',0,NULL), (548,1,'สร้าง RSS รายการ','list',544,2,3,'system.seo.sitemap',0,NULL), (549,1,'อัปเดทกำหนดค่า','update',2,0,7,'system.config.update',0,'fa-refresh'), (550,1,'อัปเดทกำหนดค่า','update',549,2,1,'system.config.config',0,NULL), (551,1,'อัปโหลดข้อผิดพลาดอัตโนมัติ','autoupload',254,2,3,'system.safe.errlog',0,NULL), (552,1,'บริการคลาวด์','cloud',0,0,6,NULL,0,'fa-cloud'), (553,1,'จัดการเวอร์ชั่น','version',552,1,1,NULL,0,'fa-random'), (554,1,'รายงานบั๊ก','bug',552,1,2,NULL,0,'fa-bug'), (555,1,'บันทึกข้อผิดพลาด','err',552,1,3,NULL,0,'fa-archive'), (556,1,'อัปเกรดออนไลน์','update',553,0,1,'cloud.version.update',0,' fa-cloud-upload'), (557,1,'คำติชมทั้งหมด','all',554,0,1,'cloud.bug.all',0,'fa-files-o '), (558,1,'คำติชมของฉัน','my',554,0,2,'cloud.bug.my',0,'fa-sticky-note-o '), (559,1,'บั๊กของฉัน','my',555,0,1,'cloud.err.my',0,'fa-bug'), (560,1,'อัปโหลดบันทึกข้อผิดพลาด','upload',254,2,4,'system.safe.errlog',0,NULL), (561,1,'ดึงหมวดหมู่คำติชม','gettype',557,2,1,'cloud.bug',0,NULL), (562,1,'ดึงรายการคำติชม','getlist',557,2,2,'cloud.bug',0,NULL), (563,1,'ดูรายละเอียดคำติชม','detail',557,0,1,'cloud.bug.detail',0,NULL), (564,1,'เพิ่มคำติชม','add',558,0,1,'cloud.bug.add',0,NULL), (565,1,'เพิ่มคำติชม','add',564,2,3,'cloud.bug',0,NULL), (566,1,'ดึงรายการบั๊ก','getlist',559,2,1,'cloud.err',0,NULL), (567,1,'ดึงข้อมูลเวอร์ชั่นใหม่','getnext',559,2,1,'cloud.version',0,NULL), (568,1,'อัปเกรด','update',559,2,2,'cloud.version',0,NULL), (569,1,'ดึงความคืบหน้า','getbarline',559,2,3,'cloud.version',0,NULL), (570,0,'แก้ไขระดับนักเขียน','update',104,2,2,'author.level',0,NULL), (571,0,'ลบระดับนักเขียน','del',104,2,4,'author.level',0,NULL), (572,1,'เพิ่มระดับนักเขียน','add',104,0,0,'author.level.author.edit',0,NULL), (573,1,'เพิ่มระดับนักเขียน','add',104,2,1,'author.level',0,NULL), (574,1,'แก้ไขระดับนักเขียนทั้งหมด','upall',104,2,3,'author.level',0,NULL), (575,1,'เพิ่มระดับสัญญา','add',105,0,1,'author.level.sign.edit',0,NULL), (576,1,'แก้ไขระดับสัญญา','update',105,2,0,'author.sign',0,NULL), (577,1,'ลบระดับสัญญา','del',105,2,2,'author.sign',0,NULL), (578,1,'เพิ่มระดับสัญญา','add',105,2,3,'author.sign',0,NULL), (579,0,'แก้ไขระดับสัญญาทั้งหมด','upall',105,2,4,'author.sign',0,NULL), (589,0,'แก้ไขสิ่งของ','propsedit',580,0,4,'props.props.edit',0,NULL), (580,1,'สิ่งของรางวัล','props',92,1,8,NULL,0,NULL), (581,1,'เพิ่มสิ่งของ','propsadd',580,0,3,'props.props.edit',0,NULL), (582,1,'รายการสิ่งของ','propslist',580,0,4,'props.props.list',0,NULL), (583,1,'เพิ่มหมวดหมู่','typeadd',580,0,1,'props.type.edit',0,NULL), (584,1,'รายการหมวดหมู่','typelist',580,0,2,'props.type.list',0,NULL), (585,0,'เพิ่มหมวดหมู่','add',583,2,1,'props.type',0,NULL), (586,0,'แก้ไขหมวดหมู่','edit',583,2,2,'props.type',0,NULL), (587,1,'ลบหมวดหมู่','del',584,2,1,'props.type',0,NULL), (588,0,'แก้ไขหมวดหมู่','typeedit',580,0,3,'props.type.edit',0,NULL), (590,0,'เพิ่มสิ่งของ','add',585,2,1,'props.props',0,NULL), (591,0,'แก้ไขสิ่งของ','edit',586,2,1,'props.props',0,NULL), (592,0,'ลบสิ่งของ','del',584,2,1,'props.props',0,NULL), (593,0,'แก้ไขสถานะสิ่งของ','status',584,2,2,'props.props',0,NULL), (594,1,'บันทึกการขาย','selllist',580,0,5,'props.sell.list',0,NULL), (595,0,'ลบบันทึกการขาย','del',594,2,1,'props.sell',0,NULL), (596,0,'สัญญาออนไลน์','add',80,0,5,'novel.sign.add',0,NULL), (597,0,'มีเล่มขาย','add',80,0,6,'novel.sell.add',0,NULL), (598,0,'สัญญาออนไลน์','add',596,2,1,'novel.sign',0,NULL), (599,0,'มีเล่มขาย','add',597,2,1,'novel.sell',0,NULL), (600,0,'ลบจากรายการขาย','remove',597,2,2,'novel.sell',0,NULL), (601,1,'จัดการบัตรลับ','card',107,1,7,'',0,'fa-credit-card'), (602,1,'เพิ่มบัตรลับ','cardcreate',601,0,1,'user.card.create',0,'fa-list-ol'), (603,1,'รายการบัตรลับ','cardlist',601,0,2,'user.card.list',0,'fa-cc-mastercard'), (604,0,'เพิ่มบัตรลับ','create',602,2,1,'user.card',0,NULL), (605,1,'ดาวน์โหลดบัตรลับ','carddown',601,0,3,'data.file.list&path=files/card',0,'fa-download'), (606,0,'ดาวน์โหลดไฟล์','down',366,2,5,'data.file',0,NULL), (607,0,'ลบบัตรลับ','del',603,2,1,'user.card',0,NULL), (608,0,'ล้างบัตรลับ','clear',603,2,2,'user.card',0,NULL), (609,1,'โต้ตอบแฟนคลับ','',74,1,5,NULL,0,NULL), (610,1,'บันทึกรางวัล','fansreward',609,0,2,'novel.fans.reward',0,NULL), (611,1,'บันทึกการแนะนำ','fansticket',609,0,3,'novel.fans.ticket',0,NULL), (612,1,'บันทึกการซื้อ','fanssub',609,0,4,'novel.fans.sub',0,NULL), (613,1,'ระดับแฟนคลับ','fanslevel',609,0,1,'novel.fans.level',0,NULL), (614,0,'ลบบันทึกรางวัล','delreward',610,2,1,'novel.fans',0,NULL), (615,0,'ล้างบันทึกรางวัล','clearreward',610,2,2,'novel.fans',0,NULL), (616,0,'ลบบันทึกการแนะนำ','delticket',611,2,3,'novel.fans',0,NULL), (617,0,'ล้างบันทึกการแนะนำ','clearticket',611,2,4,'novel.fans',0,NULL), (618,0,'ลบบันทึกการซื้อ','delsub',612,2,5,'novel.fans',0,NULL), (619,0,'ล้างบันทึกการซื้อ','clearsub',612,2,6,'novel.fans',0,NULL), (620,0,'เพิ่มระดับแฟนคลับ','leveladd',613,2,7,'novel.fans',0,NULL), (621,0,'แก้ไขระดับแฟนคลับ','leveledit',613,2,8,'novel.fans',0,NULL), (622,0,'ลบระดับแฟนคลับ','leveldel',613,2,9,'novel.fans',0,NULL), (623,1,'การตั้งค่าการเงิน','config',99,0,8,'finance.set.config',0,'fa-krw'), (624,1,'ระดับเติมเงิน','level',99,0,5,'finance.level',0,'fa-align-center'), (626,0,'การตั้งค่าการเงิน','edit',623,2,1,'finance.config',0,NULL), (627,0,'เพิ่มระดับเติมเงิน','leveladd',624,2,1,'finance.level',0,NULL), (628,0,'แก้ไขระดับเติมเงิน','leveledit',624,2,2,'finance.level',0,NULL), (629,0,'ลบระดับเติมเงิน','leveldel',624,2,3,'finance.level',0,NULL), (630,0,'ลบบันทึกการเติมเงิน','del',102,2,1,'finance.finance',0,NULL), (631,0,'ล้างบันทึกการเติมเงิน','clear',102,2,2,'finance.finance',0,NULL), (632,1,'บันทึกการใช้บัตร','log',601,0,3,'user.card.log',0,'fa-slack'), (633,0,'ลบบันทึกการใช้บัตร','del',632,2,1,'user.cardlog',0,NULL), (634,0,'ล้างบันทึกการใช้บัตร','clear',632,2,2,'user.cardlog',0,NULL), (635,0,'ลบบันทึกการเติมเงิน','del',102,2,1,'finance.order.charge',0,NULL), (636,0,'ล้างบันทึกการเติมเงิน','clear',102,2,2,'finance.order.charge',0,NULL), (637,0,'ลบคำร้องขอถอนเงิน','del',100,2,1,'finance.order.cash',0,NULL), (638,0,'ล้างคำร้องขอถอนเงิน','clear',100,2,2,'finance.order.cash',0,NULL), (639,0,'ตรวจสอบคำร้องขอถอนเงิน','status',100,2,3,'finance.order.cash',0,NULL), (640,0,'ดูรายละเอียดบทความ','refuse_author_article_edit',529,0,1,'system.apply.detail',0,NULL), (641,1,'ลิ้งก์โพสต์','urlpost',12,0,3,'system.seo.urlpost',0,'fa-compress'), (642,0,'ลิ้งก์โพสต์','post',641,2,1,'system.seo.urlpost',0,NULL), (643,1,'จัดการไอคอนอารมณ์','face',130,1,2,'',0,'fa-drupal'), (644,1,'ติดตั้งไอคอนอารมณ์','install',643,0,1,'operate.face.install',0,'fa-tripadvisor'), (645,0,'ติดตั้งไอคอนอารมณ์','install',644,2,1,'operate.face',0,NULL), (646,1,'การรับรองการเข้าสู่ระบบ','code',22,0,3,'system.safe.code',3,'codepen'), (647,0,'การตั้งค่าโค้ดยืนยัน','config',646,2,1,'system.safe.code',0,NULL), (648,1,'การกำหนดค่าแบบกลุ่ม','config',662,0,12,'system.site.config',0,'fa-crop'), (649,1,'แก้ไขการกำหนดค่าแบบกลุ่ม','edit',648,2,1,'system.site.config',0,NULL), (650,1,'การติดตั้งโมดูล','module_install',2,0,10,'system.module.install',0,'fa-th-large'), (651,0,'การติดตั้งโมดูล','install',650,2,1,'system.module.install',0,NULL), (652,1,'การตั้งค่าผู้พัฒนา','development',22,0,1,'system.dev.config',0,'fa-connectdevelop'), (653,0,'การตั้งค่าผู้พัฒนา','config',652,2,1,'system.dev.config',0,NULL), (654,1,'หน้าข้อผิดพลาด','errpage',12,0,14,'system.seo.errpage',0,'fa-pagelines'), (655,1,'บันทึกแมงมุม','spider',12,0,15,'system.seo.spider',0,'fa-opencart'), (656,0,'ลบหน้าข้อผิดพลาด','del',654,2,1,'system.seo.errpage',0,NULL), (657,0,'ล้างหน้าข้อผิดพลาด','clear',654,2,2,'system.seo.errpage',0,NULL), (658,0,'ลบบันทึกแมงมุม','del',655,2,1,'system.seo.spider',0,NULL), (659,0,'ล้างบันทึกแมงมุม','clear',655,2,2,'system.seo.spider',0,NULL), (660,1,'แผนภาพหน้าข้อผิดพลาด','errpage',162,0,3,'data.chart.errpage',0,NULL), (661,1,'แผนภาพแมงมุม','spider',162,0,4,'data.chart.spider',0,NULL), (662,1,'จัดการแบบกลุ่ม','site',1,0,5,NULL,0,'fa-object-group'), (663,1,'จัดการเว็บไซต์','site',662,0,1,'system.site.site',0,'fa-indent'), (664,1,'จัดการกลุ่มภายนอก','product',662,0,2,'system.site.product',0,'fa-dedent'), (665,0,'เพิ่มเว็บไซต์นอก','add',664,0,1,'system.site.product.edit',0,NULL), (666,0,'แก้ไขเว็บไซต์นอก','edit',664,0,2,'system.site.product.edit',0,NULL), (667,0,'ลบเว็บไซต์นอก','del',664,2,1,'system.site.product',0,NULL), (668,0,'ล้างเว็บไซต์นอก','clear',664,2,2,'system.site.product',0,NULL), (669,0,'เพิ่มเว็บไซต์นอก','add',665,2,1,'system.site.product',0,NULL), (670,0,'แก้ไขเว็บไซต์นอก','edit',666,2,1,'system.site.product',0,NULL), (671,0,'ทดสอบเว็บไซต์นอก','test',665,2,2,'system.site.product',0,NULL), (672,0,'เพิ่มเว็บไซต์','add',663,0,1,'system.site.site.edit',0,NULL), (673,0,'แก้ไขเว็บไซต์','edit',663,0,2,'system.site.site.edit',0,NULL), (674,0,'ลบเว็บไซต์','del',663,2,1,'system.site.site',0,NULL), (675,0,'ล้างเว็บไซต์','clear',663,2,2,'system.site.site',0,NULL), (676,0,'เพิ่มเว็บไซต์','add',672,2,1,'system.site.site',0,NULL), (677,0,'แก้ไขเว็บไซต์','edit',673,2,1,'system.site.site',0,NULL), (678,0,'ตรวจสอบเว็บไซต์','status',663,2,3,'system.site.site',0,NULL), (679,0,'ตรวจสอบเว็บไซต์นอก','status',664,2,3,'system.site.product',0,NULL), (680,1,'เงื่อนไขการค้นหา','novel_list',87,0,4,'system.retrieval.list',1,NULL), (681,0,'ลบการค้นหา','novel_del',680,2,1,'system.retrieval',0,NULL), (682,0,'ตรวจสอบการค้นหา','novel_status',680,2,2,'system.retrieval',0,NULL), (683,0,'แก้ไขการค้นหา','novel_edit',680,0,3,'system.retrieval.edit',0,NULL), (684,0,'เพิ่มการค้นหา','novel_add',680,0,4,'system.retrieval.edit',0,NULL), (685,0,'เพิ่มการค้นหา','novel_add',684,2,1,'system.retrieval',0,NULL), (686,0,'แก้ไขการค้นหา','novel_edit',683,2,1,'system.retrieval',0,NULL), (687,1,'หมวดหมู่การค้นหา','novel_type',87,0,3,'system.retrieval.type',1,NULL), (688,0,'แก้ไขหมวดหมู่','novel_type',687,2,1,'system.retrieval',0,NULL), (689,0,'แก้ไขสถานะหมวดหมู่','novel_typestatus',687,2,2,'system.retrieval',0,NULL), (690,1,'เพิ่มบริการอีเมล์','add',173,0,1,'system.email.email.edit',0,NULL), (691,1,'แก้ไขบริการอีเมล์','edit',173,0,2,'system.email.email.edit',0,NULL), (692,0,'เพิ่มบริการอีเมล์','add',690,2,11,'system.email.email',0,NULL), (693,0,'แก้ไขบริการอีเมล์','edit',691,2,1,'system.email.email',0,NULL), (694,0,'สถานะบริการอีเมล์','status',173,2,3,'system.email.email',0,NULL), (695,0,'ลบบริการอีเมล์','del',173,2,4,'system.email.email',0,NULL), (696,1,'เพิ่มเทมเพลตอีเมล์','add',173,0,7,'system.email.temp.edit',0,NULL), (697,1,'แก้ไขเทมเพลตอีเมล์','edit',173,0,8,'system.email.temp.edit',0,NULL), (698,0,'เพิ่มเทมเพลตอีเมล์','add',696,2,1,'system.email.temp',0,NULL), (699,0,'แก้ไขเทมเพลตอีเมล์','edit',697,2,1,'system.email.temp',0,NULL), (700,0,'สถานะเทมเพลตอีเมล์','status',173,2,9,'system.email.temp',0,NULL), (701,0,'ลบเทมเพลตอีเมล์','del',173,2,10,'system.email.temp',0,NULL), (702,1,'บันทึกอีเมล์','emaillog',22,0,13,'system.safe.emaillog',0,'fa-university'), (703,1,'รายละเอียดบันทึกอีเมล์','detail',702,0,1,'system.safe.emaillog.detail',0,NULL), (704,0,'ลบบันทึกอีเมล์','del',702,2,1,'system.safe.emaillog',0,NULL), (705,0,'ล้างบันทึกอีเมล์','clear',702,2,2,'system.safe.emaillog',0,NULL), (706,1,'ประวัติการอ่าน','list',609,0,5,'novel.fans.read',0,NULL), (707,0,'ลบประวัติการอ่าน','novel_del',706,2,1,'user.read',0,NULL), (708,0,'ล้างประวัติการอ่าน','novel_clear',706,2,2,'user.read',0,NULL), (709,0,'คีย์เวิร์ดแนะนำ','rec',137,2,3,'operate.search',0,NULL), (710,1,'เครื่องมือในการพัฒนา','development',1,0,10,NULL,0,'fa-joomla'), (711,1,'เพิ่มหน้า','addpage',710,0,1,'system.dev.addpage',0,'fa-bookmark'), (712,0,'เพิ่มหน้า','add',711,2,1,'system.dev.addpage',0,NULL), (713,1,'แผนภูมิสถิติการเงิน','finance',162,0,5,'data.chart.finance',0,NULL), (714,1,'ค่าเริ่มต้นหน้าหลัก','default_index',9,0,4,'system.menu.default_index',0,'fa-list-ul'), (715,0,'ค่าเริ่มต้นหน้าหลัก','default_index',714,0,1,'system.menu.menu',0,NULL), (716,0,'บันทึกการขาย','sell_log',609,0,10,'novel.sell.log',0,NULL), (717,1,'คลาวด์แอปฯ','apps',552,1,0,NULL,0,'fa-cubes'), (718,1,'ปลั๊กอินของฉัน','plugin',717,0,2,'cloud.apps.plugin',0,'fa-plug'), (719,0,'ติดตั้งปลั๊กอิน','install',718,2,1,'cloud.apps.plugin',0,NULL), (720,0,'ถอนการติดตั้งปลั๊กอิน','uninstall',718,2,2,'cloud.apps.plugin',0,NULL), (721,0,'จัดการปลั๊กอิน','manager',718,0,1,'cloud.apps.plugin.manager',0,NULL), (722,0,'หน้าหลักปลั๊กอิน','index',721,0,1,'cloud.apps.plugin.index',0,NULL), (723,0,'จัดการธุรกิจปลั๊กอิน','business',721,0,2,'cloud.apps.plugin.business',0,NULL), (724,0,'แก้ไขกำหนดค่าปลั๊กอิน','config',723,2,1,'cloud.apps.plugin',0,NULL), (725,0,'ทดสอบสร้างลายน้ำ','water_test',5,2,2,'system.set.water',0,NULL), (726,1,'เพิ่มหมวดหมู่','type_add',149,0,1,'operate.zt.typeedit',0,'fa-plus-circle'), (727,1,'รายการหมวดหมู่','type_list',149,0,2,'operate.zt.typelist',0,'fa-indent'), (728,0,'เพิ่มหมวดหมู่','type_add',726,2,1,'operate.zt.type',0,NULL), (729,0,'แก้ไขหมวดหมู่','type_edit',727,2,1,'operate.zt.type',0,NULL), (730,0,'ลบหมวดหมู่','type_del',727,2,2,'operate.zt.type',0,NULL), (731,0,'แก้ไขหมวดหมู่','type_edit',727,0,2,'operate.zt.typeedit',0,NULL), (732,1,'เปลี่ยนการตั้งค่า','config',149,0,9,'operate.zt.config',0,'fa-wrench'), (733,0,'แก้ไขกำหนดค่า','config_edit',732,2,1,'operate.zt.config',0,NULL), (734,1,'เพิ่มหมวดหมู่','type_add',141,0,1,'operate.flash.typeedit',0,'fa-plus-circle'), (735,0,'แก้ไขหมวดหมู่','type_edit',141,0,2,'operate.flash.typeedit',0,NULL), (736,1,'รายการหมวดหมู่','type_list',141,0,2,'operate.flash.typelist',0,'fa-indent'), (737,0,'เพิ่มหมวดหมู่','type_add',734,2,1,'operate.flash.type',0,NULL), (738,0,'แก้ไขหมวดหมู่','type_edit',735,2,1,'operate.flash.type',0,NULL), (739,0,'ลบหมวดหมู่','type_del',736,2,2,'operate.flash.type',0,NULL), (740,0,'จำกัดเวลาฟรี','add',80,0,7,'novel.timelimit.edit',0,NULL), (741,0,'เพิ่มการจำกัดเวลาฟรี','add',740,2,1,'novel.timelimit',0,NULL), (742,1,'จำกัดเวลาฟรี','timelimit',78,0,4,'novel.timelimit.list',0,NULL), (743,0,'แก้ไขจำกัดเวลาฟรี','edit',742,0,1,'novel.timelimit.edit',0,NULL), (744,0,'แก้ไขจำกัดเวลาฟรี','edit',743,2,1,'novel.timelimit',0,NULL), (745,0,'ลบจำกัดเวลาฟรี','del',742,2,2,'novel.timelimit',0,NULL), (746,0,'ตั้งค่าสวัสดิการ','welfare',80,0,7,'novel.sell.welfare',0,NULL), (747,0,'ตั้งค่าสวัสดิการ','edit',746,2,1,'novel.sell.welfare',0,NULL), (748,0,'สถิติการขาย','settlement',80,0,8,'novel.sell.settlement',0,NULL), (749,0,'คำร้องการขาย','apply',748,2,1,'novel.sell.settlement',0,NULL), (750,1,'คำร้องการเงิน','apply_list',99,0,0,'finance.apply.list',0,'fa-gg'), (751,0,'รายละเอียดคำร้องการเงืน','apply_detail',750,0,1,'finance.apply.detail',0,NULL), (752,0,'ตรวจสอบคำร้องการเงิน','status',751,2,1,'finance.apply',0,NULL), (753,0,'ลบคำร้องการเงิน','del',750,2,1,'finance.apply',0,NULL), (754,0,'ล้างคำร้องการเงิน','clear',750,2,2,'finance.apply',0,NULL), (755,1,'เพิ่ม API','addapi',710,0,2,'system.dev.addapi',0,'fa-random'), (756,0,'เพิ่ม API','add',755,2,1,'system.dev.addapi',0,NULL), (757,1,'รูปแบบลิ้งก์','urlmode',12,0,1,'system.seo.urlmode',0,'fa-link'), (758,0,'บันทึกโหมดลิ้งก์แล้ว','config',757,2,1,'system.seo.urlmode',0,NULL), (759,1,'รายการความค้องการ','list',554,0,3,'cloud.together.list',0,'fa-houzz'), (760,0,'ดึงรายการความต้องการ','getlist',759,2,1,'cloud.together',0,NULL), (761,0,'ความต้องการ','operation',759,2,2,'cloud.together',0,NULL), (762,1,'รายละเอียดความต้องการ','detail',759,0,1,'cloud.together.detail',0,NULL), (763,0,'ดึงรายระเอียดความต้องการ','detail',762,2,1,'cloud.together',0,NULL), (764,1,'เพิ่มความต้องการ','add',759,0,2,'cloud.together.add',0,NULL), (765,0,'เพิ่มความต้องการ','add',764,2,1,'cloud.together',0,NULL), (766,0,'อัปโหลด TXT','upload',75,0,10,'novel.txt.upload',0,NULL), (767,0,'เตรียม TXT','init',766,2,1,'novel.txt',0,NULL), (768,0,'ลบ TXT ที่อัปโหลด','del',766,2,2,'novel.txt',0,NULL), (769,0,'นำเข้า TXT','import',766,2,3,'novel.txt',0,NULL), (770,1,'ศูนย์แอปฯ','apps',717,0,1,'cloud.apps.index',0,'fa-th'), (771,0,'ติดตั้งแอปฯ','install',770,2,1,'cloud.apps',0,NULL), (772,1,'แผนแบบคงที่','html_plan',12,0,3,'system.seo.html_plan.list',0,'fa-file-text-o'), (773,0,'เพิ่มแผนแบบคงที่','add',772,2,1,'system.seo.html_plan',0,NULL), (774,0,'ลบแผนแบบคงที่','del',772,2,2,'system.seo.html_plan',0,NULL), (775,0,'ดำเนินการแผนแบบคงที่','run',772,2,3,'system.seo.html_plan',0,NULL), (776,1,'บัญชี WeChat สาธารณะ','weixin',130,1,2,NULL,0,'fa-weixin'), (777,1,'รายการบัญชีสาธารณะ','account_list',776,0,1,'operate.weixin.account.list',0,'fa-list'), (778,0,'เพิ่มบัญชีทางการ','add',777,0,2,'operate.weixin.account.edit',0,NULL), (779,0,'แก้ไขบัญชีทางการ','edit',777,0,2,'operate.weixin.account.edit',0,NULL), (780,0,'เพิ่มบัญชีทางการ','add',778,2,1,'operate.weixin.account',0,NULL), (781,0,'แก้ไขบัญชีทางการ','edit',779,2,2,'operate.weixin.account',0,NULL), (782,0,'ลบบัญชีทางการ','del',777,2,3,'operate.weixin.account',0,NULL), (783,0,'ตรวจสอบบัญชีทางการ','status',777,2,4,'operate.weixin.account',0,NULL), (784,0,'ตรวจสอบบัญชีทางการ','check',777,2,5,'operate.weixin.account',0,NULL), (785,0,'ตั้งเป็นบัญชีหลัก','main',777,2,6,'operate.weixin.account',0,NULL), (786,1,'เมนูที่กำหนด','menu_list',776,0,2,'operate.weixin.menu.list',0,'fa-medium'), (787,0,'เพิ่มเมนูที่กำหนด','add',786,0,2,'operate.weixin.menu.edit',0,NULL), (788,0,'แก้ไขเมนูที่กำหนด','edit',786,0,2,'operate.weixin.menu.edit',0,NULL), (789,0,'เพิ่มเมนูที่กำหนด','add',787,2,1,'operate.weixin.menu',0,NULL), (790,0,'แก้ไขเมนูที่กำหนด','edit',788,2,2,'operate.weixin.menu',0,NULL), (791,0,'ลบเมนูที่กำหนด','del',786,2,3,'operate.weixin.menu',0,NULL), (792,0,'ตรวจสอบเมนูที่กำหนด','status',786,2,4,'operate.weixin.menu',0,NULL), (793,0,'แจ้งเตือนเมนูที่กำหนด','push',786,2,5,'operate.weixin.menu',0,NULL), (794,0,'คัดลอกเมนูท่ี่กำหนด','copy',786,2,6,'operate.weixin.menu',0,NULL), (795,0,'คัดลอกเมนูท่ี่กำหนด','copy',786,0,3,'operate.weixin.menu.copy',0,NULL), (796,1,'ตอบกลับอัตโนมัติ','autoreply_list',776,0,3,'operate.weixin.autoreply.list',0,'fa-retweet'), (797,0,'เพิ่มตอบกลับอัตโนมัติ','add',796,0,2,'operate.weixin.autoreply.edit',0,NULL), (798,0,'แก้ไขตอบกลับอัตโนมัติ','edit',796,0,2,'operate.weixin.autoreply.edit',0,NULL), (799,0,'คัดลอกตอบกลับอัตโนมัติ','copy',796,0,3,'operate.weixin.autoreply.copy',0,NULL), (800,0,'เพิ่มตอบกลับอัตโนมัติ','add',797,2,1,'operate.weixin.autoreply',0,NULL), (801,0,'แก้ไขตอบกลับอัตโนมัติ','edit',798,2,2,'operate.weixin.autoreply',0,NULL), (802,0,'ลบตอบกลับอัตโนมัติ','del',796,2,3,'operate.weixin.autoreply',0,NULL), (803,0,'ตรวจสอบตอบกลับอัตโนมัติ','status',796,2,4,'operate.weixin.autoreply',0,NULL), (804,0,'คัดลอกตอบกลับอัตโนมัติ','copy',799,2,5,'operate.weixin.autoreply',0,NULL), (805,1,'จัดการข้อความ','msg_list',776,0,5,'operate.weixin.msg.list',0,'fa-comment-o'), (806,0,'ลบข้อความ','del',805,2,1,'operate.weixin.msg',0,NULL), (807,0,'ดูรายละเอียดข้อความ','detail',805,0,2,'operate.weixin.msg.detail',0,NULL), (808,1,'จัดการสื่อ','media_list',776,0,4,'operate.weixin.media.list',0,'fa-paperclip'), (809,0,'ดูรายละเอียดสื่อ','detail',808,0,2,'operate.weixin.media.detail',0,NULL), (810,0,'ลบสื่อ','del',808,2,1,'operate.weixin.media',0,NULL), (811,0,'เพิ่มสื่อ','add',808,0,1,'operate.weixin.media.edit',0,NULL), (812,0,'เพิ่มสื่อ','add',811,2,2,'operate.weixin.media',0,NULL), (813,1,'จัดการแฟนคลับ','media_list',776,0,6,'operate.weixin.fans.list',0,'fa-street-view'), (814,0,'ดูรายละเอียดแฟนคลับ','detail',813,0,2,'operate.weixin.fans.detail',0,NULL), (815,0,'ลบแฟนคลับ','del',813,2,1,'operate.weixin.fans',0,NULL), (816,0,'ค้นหาและกู้คืนสื่อ','lookup',808,0,1,'operate.weixin.media.lookup',0,NULL), (817,1,'เงื่อนไขการค้นหา','app_list',68,0,5,'system.retrieval.list',1,NULL), (818,0,'ลบการค้นหา','app_del',817,2,1,'system.retrieval',0,NULL), (819,0,'ตรวจสอบการค้นหา','app_status',817,2,2,'system.retrieval',0,NULL), (820,0,'แก้ไขการค้นหา','app_edit',817,0,3,'system.retrieval.edit',0,NULL), (821,0,'เพิ่มการค้นหา','app_add',817,0,4,'system.retrieval.edit',0,NULL), (822,0,'เพิ่มการค้นหา','app_add',820,2,1,'system.retrieval',0,NULL), (823,0,'แก้ไขการค้นหา','app_edit',819,2,1,'system.retrieval',0,NULL), (824,1,'หมวดหมู่การค้นหา','app_type',68,0,4,'system.retrieval.type',1,NULL), (825,0,'แก้ไขหมวดหมู่','app_type',823,2,1,'system.retrieval',0,NULL), (826,0,'ตรวจสอบสถานะการแก้ไขหมวดหมู่','app_typestatus',823,2,2,'system.retrieval',0,NULL), (827,0,'ดูรายละเอียดข้อความผู้ใช้','detail',116,0,2,'user.msg.detail',0,NULL), (828,1,'เพิ่มปลั๊กอิน','addplugin',710,0,3,'system.dev.addplugin',0,'fa-slack'), (829,0,'เพิ่มปลั๊กอิน','plugin_add',828,2,1,'system.dev.addplugin',0,NULL), (830,0,'เพิ่มกำหนดค่าปลั๊กอิน','config_add',828,2,2,'system.dev.addplugin',0,NULL), (831,0,'ดึงกำหนดค่าปลั๊กอิน','getpluginconfig',828,2,3,'system.dev.addplugin',0,NULL), (832,0,'ลบกำหนดค่าปลั๊กอิน','config_del',828,2,4,'system.dev.addplugin',0,NULL), (833,0,'อัปเดทแอปฯ','update',718,2,3,'cloud.apps',0,NULL), (834,1,'คำที่ห้ามใช้','shield',22,0,22,'system.safe.shield',0,'fa-font'), (835,0,'แก้ไขคำที่ห้ามใช้','config',834,2,1,'system.safe.shield',0,NULL), (836,0,'บทลงโทษผู้ใช้','punish',110,0,4,'user.punish.punish',0,NULL), (837,0,'บทลงโทษผู้ใช้','punish',836,2,1,'user.punish',0,NULL), (838,0,'นำบทลงโทษผู้ใช้ออก','unpunish',836,2,2,'user.punish',0,NULL), (839,1,'บันทึกการลงโทษ','punishlist',108,0,5,'user.punish.list',0,'fa-user-times'), (840,0,'ลบบันทึกการลงโทษ','del',839,2,1,'user.punish',0,NULL), (841,1,'เทมเพลตข้อความ','msglist',245,0,5,'system.config.msg.list',0,'fa-envelope-o'), (842,0,'เพิ่มเทมเพลตข้อความ','add',841,0,1,'system.config.msg.edit',0,NULL), (843,0,'แก้ไขเทมเพลตข้อความ','edit',841,0,2,'system.config.msg.edit',0,NULL), (844,0,'เพิ่มเทมเพลตข้อความ','add',842,2,1,'system.config.msg',0,NULL), (845,0,'แก้ไขเทมเพลตข้อความ','edit',843,2,1,'system.config.msg',0,NULL), (846,0,'ลบเทมเพลตข้อความ','del',841,2,1,'system.config.msg',0,NULL);

/*Table structure for table `wm_system_menu_default` */
DROP TABLE IF EXISTS `wm_system_menu_default`;

CREATE TABLE `wm_system_menu_default` (`default_id` int(4) NOT NULL AUTO_INCREMENT,
 `default_controller` varchar(30) NOT NULL COMMENT '控制器名字',
 `default_mid` int(4) NOT NULL COMMENT '管理员id',
 PRIMARY KEY (`default_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8;

/*Data for the table `wm_system_menu_default` */ /*Table structure for table `wm_system_menu_quick` */
DROP TABLE IF EXISTS `wm_system_menu_quick`;

CREATE TABLE `wm_system_menu_quick` (`quick_id` int(4) NOT NULL AUTO_INCREMENT,
 `quick_menu_id` int(4) DEFAULT NULL COMMENT '菜单的id',
 `quick_order` int(4) DEFAULT '9' COMMENT '快捷菜单的显示顺序',
 `quick_manager_id` int(4) DEFAULT NULL COMMENT '管理员的id',
 PRIMARY KEY (`quick_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='快捷菜单';

/*Data for the table `wm_system_menu_quick` */ /*Table structure for table `wm_system_msg_temp` */
DROP TABLE IF EXISTS `wm_system_msg_temp`;

CREATE TABLE `wm_system_msg_temp` (`temp_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '模版的id',
 `temp_name` varchar(50) NOT NULL COMMENT '模版名字',
 `temp_module` varchar(20) DEFAULT NULL COMMENT '所属的模块',
 `temp_key` varchar(50) NOT NULL COMMENT '模版的标识',
 `temp_content` text NOT NULL COMMENT '发信内容',
 PRIMARY KEY (`temp_id`)) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT
CHARSET=utf8 COMMENT='消息模版表';

/*Data for the table `wm_system_msg_temp` */
INSERT INTO `wm_system_msg_temp`(`temp_id`, `temp_name`, `temp_module`, `temp_key`, `temp_content`) VALUES (1,'ห้ามเข้าสู่ระบบ','user','user_punish_login','<p>คุณถูกห้ามเข้าสู่ระบบจากตัวระบบ เหตุผลเนื่องมาจาก : {原因}</p>'), (2,'ห้ามออกความเห็น','user','user_punish_talk','<p>คุณถูกห้ามออกความคิดเห็นจากตัวระบบ เหตุผลเนื่องมาจาก : {原因}</p>'), (3,'ปลดการห้ามเข้าสู่ระบบ','user','user_punish_unlogin','<p>คุณได้รับอนุญาตให้เข้าสู่ระบบจากตัวระบบแล้ว โปรดหลีกเลี่ยงการละเมิดกฎที่อาจทำให้ถูกห้ามอีกครั้ง</p>'), (4,'ปลดการห้ามออกความเห็น','user','user_punish_untalk','<p>คุณได้รับอนุญาตให้แสเงความคิดเห็นจากตัวระบบแล้ว โปรดหลีกเลี่ยงการละเมิดกฎที่อาจทำให้ถูกห้ามอีกครั้ง</p>');

/*Table structure for table `wm_system_retrieval` */
DROP TABLE IF EXISTS `wm_system_retrieval`;

CREATE TABLE `wm_system_retrieval` (`retrieval_id` int(4) NOT NULL AUTO_INCREMENT,
 `retrieval_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态，0为禁用，1为使用',
 `retrieval_module` varchar(20) NOT NULL COMMENT '所属模块',
 `retrieval_type_id` int(4) NOT NULL DEFAULT '0' COMMENT '检索条件类型ID',
 `retrieval_title` varchar(40) NOT NULL COMMENT '检索条件名字 /* SubMaRk */',
 `retrieval_field` varchar(20) NOT NULL COMMENT '检索条件的字段',
 `retrieval_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '检索类型，-1为倒序，0为顺序，1为等于，2为小于，3为大于，4为区间,5为首字母，6为相似，7为数字开头',
 `retrieval_value` varchar(20) NOT NULL COMMENT '检索的值',
 `retrieval_order` int(1) NOT NULL COMMENT '显示顺序',
 PRIMARY KEY (`retrieval_id`)) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT
CHARSET=utf8 COMMENT='分类检索条件表';

/*Data for the table `wm_system_retrieval` */
INSERT INTO `wm_system_retrieval`(`retrieval_id`, `retrieval_status`, `retrieval_module`, `retrieval_type_id`, `retrieval_title`, `retrieval_field`, `retrieval_type`, `retrieval_value`, `retrieval_order`) VALUES (1,1,'novel',1,'ทั้งหมด','novel_process',1,'-1',1), (2,1,'novel',1,'ยังไม่จบ','novel_process',1,'1',2), (3,1,'novel',1,'จบแล้ว','novel_process',1,'2',3), (4,1,'novel',2,'< 300k คำ','novel_wordnumber',2,'300000',2), (5,1,'novel',2,'300k-1M คำ','novel_wordnumber',4,'300000,1000000',3), (6,1,'novel',2,'1M-2M คำ','novel_wordnumber',4,'1000000,2000000',4), (7,1,'novel',2,'> 2M คำ','novel_wordnumber',3,'2000000',5), (8,1,'novel',2,'ทั้งหมด','novel_wordnumber',1,'-1',1), (9,1,'novel',3,'ทั้งหมด','novel_chapter',1,'-1',1), (10,1,'novel',3,'< 1k บท','novel_chapter',2,'1000',2), (11,1,'novel',3,'1k-2k บท','novel_chapter',4,'1000,2000',3), (12,1,'novel',3,'2k-3k บท','novel_chapter',4,'2000,3000',4), (13,1,'novel',3,'> 3k บท','novel_chapter',3,'3000',5), (14,1,'novel',4,'ทั้งหมด','novel_type',1,'-1',1), (15,1,'novel',4,'ต้นฉบับ','novel_type',1,'1',2), (16,1,'novel',4,'พิมพ์ซ้ำ','novel_type',1,'2',3), (17,1,'novel',4,'เซ็นต์สัญญา','novel_sign_id',1,'1',4), (18,1,'novel',4,'มีจำหน่าย','novel_sell',1,'1',5), (19,1,'novel',4,'ลิขสิทธิ์','novel_copyright',1,'2',6), (20,1,'novel',5,'ทั้งหมด','novel_sell',1,'-1',1), (21,1,'novel',5,'ฟรี','novel_sell',1,'0',2), (22,1,'novel',5,'ซื้อ','novel_sell',1,'1',3), (23,1,'novel',7,'อัปเดท','novel_uptime',-1,'-1',1), (24,1,'novel',7,'เข้าชม','novel_allclick',-1,'',2), (25,1,'novel',7,'แนะนำ','novel_allrec',-1,'',3), (26,1,'novel',7,'ชั้นหนังสือ','novel_allcoll',-1,'',4), (27,1,'novel',7,'จำนวนคำ','novel_wordnumber',-1,'',5), (28,1,'novel',7,'บท','novel_chapter',-1,'',6), (29,1,'novel',6,'ทั้งหมด','novel_pinyin',5,'-1',1), (30,1,'novel',6,'A','novel_pinyin',5,'a',2), (31,1,'novel',6,'B','novel_pinyin',5,'b',3), (32,1,'novel',6,'C','novel_pinyin',5,'c',4), (33,1,'novel',6,'D','novel_pinyin',5,'d',5), (34,1,'novel',6,'E','novel_pinyin',5,'e',6), (35,1,'novel',6,'F','novel_pinyin',5,'f',7), (36,1,'novel',6,'G','novel_pinyin',5,'g',8), (37,1,'novel',6,'H','novel_pinyin',5,'h',9), (38,1,'novel',6,'I','novel_pinyin',5,'i',10), (39,1,'novel',6,'J','novel_pinyin',5,'j',11), (40,1,'novel',6,'K','novel_pinyin',5,'k',12), (41,1,'novel',6,'L','novel_pinyin',5,'l',13), (42,1,'novel',6,'M','novel_pinyin',5,'m',14), (43,1,'novel',6,'N','novel_pinyin',5,'n',15), (44,1,'novel',6,'O','novel_pinyin',5,'o',16), (45,1,'novel',6,'P','novel_pinyin',5,'p',17), (46,1,'novel',6,'Q','novel_pinyin',5,'q',18), (47,1,'novel',6,'R','novel_pinyin',5,'r',19), (48,1,'novel',6,'S','novel_pinyin',5,'s',20), (49,1,'novel',6,'T','novel_pinyin',5,'t',21), (50,1,'novel',6,'U','novel_pinyin',5,'u',22), (51,1,'novel',6,'V','novel_pinyin',5,'v',23), (52,1,'novel',6,'W','novel_pinyin',5,'w',24), (53,1,'novel',6,'X','novel_pinyin',5,'x',25), (54,1,'novel',6,'Y','novel_pinyin',5,'y',26), (55,1,'novel',6,'Z','novel_pinyin',5,'z',27), (56,1,'novel',6,'0-9','novel_pinyin',7,'0,9',28), (57,1,'app',8,'ทั้งหมด','app_rec',1,'-1',1), (58,1,'app',8,'แนะนำ','app_rec',1,'1',2), (59,1,'app',8,'ไม่แนะนำ','app_rec',1,'0',3), (60,1,'app',9,'ทั้งหมด','app_lid',1,'-1',1), (61,1,'app',9,'จีน','app_lid',8,'9',2), (62,1,'app',9,'อังกฤษ','app_lid',8,'7',3), (63,1,'app',10,'ทั้งหมด','app_cid',1,'-1',1), (64,1,'app',10,'ฟรี','app_cid',8,'11',2), (65,1,'app',10,'ชำระภายในแอปฯ','app_cid',8,'5',3), (66,1,'app',10,'เถื่อน','app_cid',8,'10',4), (67,1,'app',11,'< 100MB','app_size',2,'100',1), (68,1,'app',11,'100-500MB','app_size',4,'100,500',2), (69,1,'app',11,'500MB-1GB','app_size',4,'500,1000',3), (70,1,'app',11,'1-2GB','app_size',4,'1000,2000',4), (71,1,'app',11,'> 2G','app_size',3,'2000',5), (72,1,'app',11,'ทั้งหมด','app_size',3,'-1',0), (73,1,'app',12,'ทั้งหมด','app_paid',1,'-1',1), (74,1,'app',12,'แอนดรอยด์','app_paid',8,'4',2), (75,1,'app',12,'แอปเปิ้ล','app_paid',8,'8',3), (76,1,'app',12,'ไซปัน','app_paid',8,'6',4), (77,1,'app',13,'ค่าเริ่มต้น','app_addtime',1,'-1',1), (78,1,'app',13,'มาแรง','app_read',-1,'',2), (79,1,'app',13,'ผลตอบรับ','app_replay',-1,'',2), (80,1,'app',13,'ชอบ','app_ding',-1,'',3), (81,1,'app',13,'ไม่ชอบ','app_cai',-1,'',4), (82,1,'app',13,'ดาว','app_start',-1,'',6), (83,1,'app',13,'คะแนน','app_score',-1,'',7);

/*Table structure for table `wm_system_retrieval_type` */
DROP TABLE IF EXISTS `wm_system_retrieval_type`;

CREATE TABLE `wm_system_retrieval_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类状态，0为隐藏，1为显示',
 `type_module` varchar(20) NOT NULL COMMENT '分类所属模块',
 `type_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为条件，2为排序',
 `type_name` varchar(20) NOT NULL COMMENT '分类名字',
 `type_par` varchar(20) NOT NULL COMMENT '分类的参数名字',
 `type_order` int(1) NOT NULL DEFAULT '99' COMMENT '分类排序',
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT
CHARSET=utf8 COMMENT='检索分类表';

/*Data for the table `wm_system_retrieval_type` */
INSERT INTO `wm_system_retrieval_type`(`type_id`, `type_status`, `type_module`, `type_type`, `type_name`, `type_par`, `type_order`) VALUES (1,1,'novel',1,'กระบวนการ','process',1), (2,1,'novel',1,'จำนวนคำ','word',2), (3,1,'novel',1,'บท','chapter',3), (4,1,'novel',1,'ลิขสิทธิ์','copy',4), (5,1,'novel',1,'ราคา','cost',5), (6,1,'novel',1,'อักษร','letter',6), (7,1,'novel',2,'ลำดับ','order',7), (8,1,'app',1,'แนะนำ','rec',1), (9,1,'app',1,'ภาษา','lang',2), (10,1,'app',1,'ราคา','cost',3), (11,1,'app',1,'ขนาด','size',4), (12,1,'app',1,'แพลตฟอร์ม','platform',5), (13,1,'app',2,'ลำดับ','order',6);

/*Table structure for table `wm_system_tags` */
DROP TABLE IF EXISTS `wm_system_tags`;

CREATE TABLE `wm_system_tags` (`tags_id` int(11) NOT NULL AUTO_INCREMENT,
 `tags_module` varchar(20) NOT NULL COMMENT '标签所属的模块',
 `tags_name` varchar(20) NOT NULL COMMENT '标签名字',
 `tags_pinyin` varchar(50) DEFAULT NULL COMMENT '标签拼音',
 `tags_data` int(4) NOT NULL DEFAULT '1' COMMENT '标签的数据量',
 `tags_search` int(4) DEFAULT '0' COMMENT '标签的搜索次数',
 `tags_time` int(4) NOT NULL DEFAULT '0' COMMENT '标签创建的时间',
 PRIMARY KEY (`tags_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='系统标签表';

/*Data for the table `wm_system_tags` */ /*Table structure for table `wm_system_templates` */
DROP TABLE IF EXISTS `wm_system_templates`;

CREATE TABLE `wm_system_templates` (`temp_id` int(4) NOT NULL AUTO_INCREMENT,
 `temp_module` varchar(20) DEFAULT NULL COMMENT '模版所属的模块',
 `temp_type` varchar(40) DEFAULT NULL COMMENT '模版的类型',
 `temp_name` varchar(20) DEFAULT NULL COMMENT '模版名字',
 `temp_temp4` varchar(100) NOT NULL COMMENT '电脑版的模版',
 `temp_temp3` varchar(100) NOT NULL COMMENT '触屏',
 `temp_temp2` varchar(100) NOT NULL COMMENT '3g',
 `temp_temp1` varchar(100) NOT NULL COMMENT 'wap',
 `temp_address` tinyint(1) DEFAULT '0' COMMENT '模版存在的路径0为当前，1为根目录计算。',
 PRIMARY KEY (`temp_id`)) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT
CHARSET=utf8 COMMENT='预设模块分类和diy、专题的默认模版';

/*Data for the table `wm_system_templates` */
INSERT INTO `wm_system_templates`(`temp_id`, `temp_module`, `temp_type`, `temp_name`, `temp_temp4`, `temp_temp3`, `temp_temp2`, `temp_temp1`, `temp_address`) VALUES (1,'article','list','test','test.html','test.html','test.html','test.html',0), (2,'article','tindex','eee','eee','eee','eee','eee',0), (3,'article','content','dddd','dddd','dddd','dddd','dddd',0);

/*Table structure for table `wm_templates_templates` */
DROP TABLE IF EXISTS `wm_templates_templates`;

CREATE TABLE `wm_templates_templates` (`templates_id` int(4) NOT NULL AUTO_INCREMENT,
 `templates_path` varchar(20) NOT NULL COMMENT '模版文件夹',
 `templates_name` varchar(20) NOT NULL COMMENT '模版名字',
 `templates_appid` varchar(40) NOT NULL COMMENT '模版appid',
 PRIMARY KEY (`templates_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='安装使用模板表';

/*Data for the table `wm_templates_templates` */ /*Table structure for table `wm_upload` */
DROP TABLE IF EXISTS `wm_upload`;

CREATE TABLE `wm_upload` (`upload_id` int(4) NOT NULL AUTO_INCREMENT,
 `upload_module` varchar(20) NOT NULL COMMENT '所属 模块',
 `upload_type` varchar(20) DEFAULT NULL COMMENT '模块处理的类型',
 `upload_ext` varchar(10) DEFAULT NULL COMMENT '附件类型',
 `upload_mid` int(4) NOT NULL DEFAULT '0' COMMENT '所属主要内容的id，如评论的主题',
 `upload_cid` int(4) NOT NULL DEFAULT '0' COMMENT '所属内容的id',
 `user_id` int(4) DEFAULT '0' COMMENT '上传用户的id',
 `upload_alt` varchar(100) DEFAULT NULL COMMENT '描述',
 `upload_simg` varchar(200) DEFAULT NULL COMMENT '缩略图路径',
 `upload_img` varchar(200) DEFAULT NULL COMMENT '文件路径',
 `upload_size` int(4) NOT NULL DEFAULT '0' COMMENT '文件大小',
 `upload_width` int(1) DEFAULT '0' COMMENT '图片宽度',
 `upload_height` int(1) DEFAULT '0' COMMENT '图片高度',
 `upload_time` int(4) NOT NULL DEFAULT '0' COMMENT '上传时间',
 PRIMARY KEY (`upload_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='上传记录表';

/*Data for the table `wm_upload` */ /*Table structure for table `wm_user_apilogin` */
DROP TABLE IF EXISTS `wm_user_apilogin`;

CREATE TABLE `wm_user_apilogin` (`api_id` int(4) NOT NULL AUTO_INCREMENT,
 `api_uid` int(4) NOT NULL DEFAULT '0',
 `api_type` varchar(30) NOT NULL COMMENT '第三方登录类型',
 `api_openid` varchar(120) NOT NULL COMMENT '第三方登录唯一ID',
 `api_unionid` varchar(120) DEFAULT NULL COMMENT '第三方登录联合ID',
 PRIMARY KEY (`api_id`), KEY `type_index` (`api_type`),
 KEY `openid_index` (`api_openid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='第三方登录记录表';

/*Data for the table `wm_user_apilogin` */ /*Table structure for table `wm_user_card` */
DROP TABLE IF EXISTS `wm_user_card`;

CREATE TABLE `wm_user_card` (`card_id` int(4) NOT NULL AUTO_INCREMENT,
 `card_type` tinyint(1) DEFAULT '1' COMMENT '卡号类型，1为充值卡',
 `card_use` tinyint(1) DEFAULT '0' COMMENT '是否已经使用',
 `card_channel` varchar(20) NOT NULL COMMENT '发布渠道',
 `card_key` varchar(50) DEFAULT NULL COMMENT '卡号',
 `card_money` decimal(10, 2) DEFAULT '0.00' COMMENT '卡号金额',
 `card_give` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '使用充值卡可以获赠多少',
 `card_addtime` int(4) DEFAULT '0' COMMENT '添加时间',
 `card_user_id` int(4) NOT NULL DEFAULT '0' COMMENT '领取的用户',
 `card_get_time` int(4) NOT NULL DEFAULT '0' COMMENT '领取的时间',
 PRIMARY KEY (`card_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户充值卡号、邀请码等表';

/*Data for the table `wm_user_card` */ /*Table structure for table `wm_user_card_log` */
DROP TABLE IF EXISTS `wm_user_card_log`;

CREATE TABLE `wm_user_card_log` (`log_id` int(4) NOT NULL AUTO_INCREMENT,
 `log_card_id` int(4) NOT NULL COMMENT '卡号id',
 `log_user_id` int(4) NOT NULL COMMENT '使用的id',
 `log_use_time` int(4) NOT NULL DEFAULT '0' COMMENT '使用的时间',
 `log_touser_id` int(4) NOT NULL DEFAULT '0' COMMENT '对谁使用的',
 PRIMARY KEY (`log_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='卡号使用记录表';

/*Data for the table `wm_user_card_log` */ /*Table structure for table `wm_user_coll` */
DROP TABLE IF EXISTS `wm_user_coll`;

CREATE TABLE `wm_user_coll` (`coll_id` int(4) NOT NULL AUTO_INCREMENT,
 `coll_module` varchar(20) NOT NULL COMMENT '操作的模块',
 `coll_type` varchar(20) NOT NULL COMMENT '操作类型，coll为收藏，rec为推荐，shelf为书架,sub为自动订阅',
 `user_id` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `coll_cid` int(4) NOT NULL DEFAULT '0' COMMENT '操作的内容id',
 `coll_time` int(4) NOT NULL DEFAULT '0' COMMENT '操作的时间',
 PRIMARY KEY (`coll_id`), KEY `uid` (`user_id`, `coll_cid`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户收藏、书架、订阅等表';

/*Data for the table `wm_user_coll` */ /*Table structure for table `wm_user_finance` */
DROP TABLE IF EXISTS `wm_user_finance`;

CREATE TABLE `wm_user_finance` (`finance_id` int(11) NOT NULL AUTO_INCREMENT,
 `finance_user_id` int(11) DEFAULT NULL COMMENT '用户id',
 `finance_realname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
 `finance_cardid` varchar(30) DEFAULT NULL COMMENT '身份证号码',
 `finance_address` varchar(50) DEFAULT NULL COMMENT '家庭住址',
 `finance_zipcode` varchar(10) DEFAULT NULL COMMENT '邮编',
 `finance_bank` varchar(20) DEFAULT NULL COMMENT '开户行',
 `finance_bankaddress` varchar(50) DEFAULT NULL COMMENT '开户行地址',
 `finance_bankcard` varchar(30) DEFAULT NULL COMMENT '开户行卡号',
 `finance_bankmaster` varchar(20) DEFAULT NULL COMMENT '持卡人姓名',
 `finance_alipay` varchar(50) DEFAULT NULL COMMENT '支付宝账号',
 PRIMARY KEY (`finance_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户财务信息表';

/*Data for the table `wm_user_finance` */ /*Table structure for table `wm_user_finance_log` */
DROP TABLE IF EXISTS `wm_user_finance_log`;

CREATE TABLE `wm_user_finance_log` (`log_id` int(4) NOT NULL AUTO_INCREMENT,
 `log_status` tinyint(1) DEFAULT '1' COMMENT '1为收入，2为消费',
 `log_module` varchar(20) DEFAULT NULL COMMENT '模块',
 `log_type` varchar(20) DEFAULT NULL COMMENT '类型',
 `log_user_id` int(4) NOT NULL DEFAULT '0' COMMENT '消费或者收入的用户id',
 `log_tuser_id` int(4) NOT NULL DEFAULT '0' COMMENT '对谁使用或者谁赠送的用户id',
 `log_cid` varchar(35) NOT NULL DEFAULT '0' COMMENT '购买的内容id或者来源id',
 `log_gold1` decimal(10, 3) DEFAULT '0.000' COMMENT '金币1的数量',
 `log_gold2` decimal(10, 3) NOT NULL DEFAULT '0.000' COMMENT '金币2的数量',
 `log_remark` varchar(100) DEFAULT NULL COMMENT '备注信息',
 `log_time` int(4) NOT NULL DEFAULT '0' COMMENT '购买的时间',
 PRIMARY KEY (`log_id`), KEY `status_index` (`log_status`),
 KEY `module_index` (`log_module`),
 KEY `type_index` (`log_type`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户购买使用赠送等财务记录日志';

/*Data for the table `wm_user_finance_log` */ /*Table structure for table `wm_user_head` */
DROP TABLE IF EXISTS `wm_user_head`;

CREATE TABLE `wm_user_head` (`head_id` int(11) NOT NULL AUTO_INCREMENT,
 `head_src` varchar(200) NOT NULL COMMENT '头像地址',
 `head_order` int(4) NOT NULL DEFAULT '50' COMMENT '头像排序',
 PRIMARY KEY (`head_id`)) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT
CHARSET=utf8 COMMENT='预设头像表';

/*Data for the table `wm_user_head` */
INSERT INTO `wm_user_head`(`head_id`, `head_src`, `head_order`) VALUES (1,'/upload/userhead/20141201125121.jpg',20), (2,'/upload/userhead/20141201125122.jpg',20), (5,'/upload/userhead/20141201125124.jpg',20), (6,'/upload/userhead/20141201125125.jpg',20), (7,'/upload/userhead/20141201125126.jpg',20), (8,'/upload/userhead/20141201125128.jpg',20), (9,'/upload/userhead/20141201125129.png',20), (10,'/upload/userhead/20141201125131.jpg',20), (11,'/upload/userhead/20141201125133.jpg',20), (12,'/upload/userhead/20141201125134.jpg',20), (13,'/upload/userhead/20141201125410.jpg',20), (14,'/upload/userhead/20141201125412.jpg',20), (15,'/upload/userhead/20141201125414.jpg',20), (16,'/upload/userhead/20141201125416.png',20), (17,'/upload/userhead/20141201125422.jpg',20), (18,'/upload/userhead/20141201125419.jpg',20), (19,'/upload/userhead/20141201125424.jpg',20), (20,'/upload/userhead/20141201125426.jpg',20), (21,'/upload/userhead/20141201125432.jpg',20), (22,'/upload/userhead/20141201125430.jpg',20), (23,'/upload/userhead/20141201125431.png',20), (24,'/upload/userhead/20141201125428.png',20), (25,'/upload/userhead/20141201125513.png',20), (26,'/upload/userhead/20141201125512.png',20), (27,'/upload/userhead/20141201125511.png',20), (28,'/upload/userhead/20141201125510.jpg',20);

/*Table structure for table `wm_user_level` */
DROP TABLE IF EXISTS `wm_user_level`;

CREATE TABLE `wm_user_level` (`level_id` int(4) NOT NULL AUTO_INCREMENT,
 `level_start` int(4) NOT NULL COMMENT '等级开始经验',
 `level_end` int(4) NOT NULL COMMENT '等级结束经验',
 `level_name` varchar(40) NOT NULL COMMENT '等级名字 /* SubMaRk */',
 `level_order` int(1) DEFAULT NULL COMMENT '等级排序',
 `level_coll` int(4) NOT NULL DEFAULT '0' COMMENT '等级收藏量',
 `level_shelf` int(4) NOT NULL DEFAULT '0' COMMENT '等级总书架量',
 `level_rec` int(4) NOT NULL DEFAULT '0' COMMENT '每日登录赠送推荐量',
 `level_month` int(4) NOT NULL DEFAULT '0' COMMENT '每日登录赠送月票',
 PRIMARY KEY (`level_id`)) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT
CHARSET=utf8 COMMENT='经验等级';

/*Data for the table `wm_user_level` */
INSERT INTO `wm_user_level`(`level_id`, `level_start`, `level_end`, `level_name`, `level_order`, `level_coll`, `level_shelf`, `level_rec`, `level_month`) VALUES (23,0,100,'ปุถุชน',1,5,5,0,0), (24,100,300,'นักพเนจร',2,6,6,0,0), (25,300,600,'นักสู้',3,7,7,0,0), (26,600,1000,'ศิษย์ขั้นต้น',4,8,8,0,0), (27,1000,2000,'ศิษย์ขั้นกลาง',5,9,9,0,0), (28,2000,5000,'ศิษย์ขั้นปลาย',6,10,10,0,0), (29,5000,10000,'ศิษย์ขั้นเชี่ยวชาญ',7,15,15,0,0), (30,10000,20000,'อาจารย์',8,20,20,0,0), (31,20000,50000,'ปรมาจารย์นักสู้',9,25,25,0,0), (32,50000,100000,'จักรพรรดินักสู้',10,30,30,0,0);

/*Table structure for table `wm_user_login` */
DROP TABLE IF EXISTS `wm_user_login`;

CREATE TABLE `wm_user_login` (`login_id` int(4) NOT NULL AUTO_INCREMENT,
 `user_id` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `login_time` int(4) NOT NULL DEFAULT '0' COMMENT '登录时间',
 `login_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为账号',
 `login_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为登录失败，1为登录成功，2为密码错误',
 `login_remark` varchar(100) CHARACTER
 SET gbk DEFAULT '登录成功' COMMENT '备注详情',
 `login_ip` varchar(40) DEFAULT NULL COMMENT '登录IP',
 `login_ua` varchar(1000) DEFAULT NULL COMMENT '登录浏览器ua',
 `login_browser` varchar(250) DEFAULT NULL COMMENT '浏览器',
 PRIMARY KEY (`login_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户登录记录表';

/*Data for the table `wm_user_login` */ /*Table structure for table `wm_user_msg` */
DROP TABLE IF EXISTS `wm_user_msg`;

CREATE TABLE `wm_user_msg` (`msg_id` int(4) NOT NULL AUTO_INCREMENT,
 `msg_fuid` int(4) NOT NULL DEFAULT '0' COMMENT '发送用户id',
 `msg_tuid` int(4) NOT NULL COMMENT '接受用户id',
 `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为未阅读，1为已阅读',
 `msg_content` varchar(1000) DEFAULT NULL COMMENT '消息内容',
 `msg_time` int(4) NOT NULL DEFAULT '0' COMMENT '发送时间',
 PRIMARY KEY (`msg_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户消息记录表';

/*Data for the table `wm_user_msg` */ /*Table structure for table `wm_user_punish` */
DROP TABLE IF EXISTS `wm_user_punish`;

CREATE TABLE `wm_user_punish` (`punish_id` int(4) NOT NULL AUTO_INCREMENT,
 `punish_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0为失效,1为正常',
 `punish_uid` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `punish_type` varchar(20) NOT NULL COMMENT 'login禁止登陆,talk禁言',
 `punish_remark` varchar(50) DEFAULT NULL COMMENT '备注',
 `punish_starttime` int(4) NOT NULL DEFAULT '0' COMMENT '处罚开始时间',
 `punish_endtime` int(4) NOT NULL DEFAULT '0' COMMENT '处罚结束时间',
 `punish_createtime` int(4) NOT NULL DEFAULT '0' COMMENT '处罚创建时间',
 PRIMARY KEY (`punish_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户处罚记录表';

/*Data for the table `wm_user_punish` */ /*Table structure for table `wm_user_read` */
DROP TABLE IF EXISTS `wm_user_read`;

CREATE TABLE `wm_user_read` (`read_id` int(4) NOT NULL AUTO_INCREMENT,
 `read_module` varchar(20) NOT NULL DEFAULT 'novel' COMMENT '阅读模块',
 `read_cid` int(4) NOT NULL DEFAULT '0' COMMENT '内容id',
 `read_nid` int(4) DEFAULT '0' COMMENT '内容的父id',
 `read_title` varchar(50) DEFAULT NULL COMMENT '标题',
 `read_uid` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `read_time` int(4) NOT NULL DEFAULT '0' COMMENT '阅读时间',
 PRIMARY KEY (`read_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='阅读记录表，只存储最新的阅读记录';

/*Data for the table `wm_user_read` */ /*Table structure for table `wm_user_read_log` */
DROP TABLE IF EXISTS `wm_user_read_log`;

CREATE TABLE `wm_user_read_log` (`read_id` int(4) NOT NULL AUTO_INCREMENT,
 `read_module` varchar(20) NOT NULL DEFAULT 'novel' COMMENT '阅读模块',
 `read_cid` int(4) NOT NULL DEFAULT '0' COMMENT '内容id',
 `read_nid` int(4) DEFAULT '0' COMMENT '内容的父id',
 `read_title` varchar(50) DEFAULT NULL COMMENT '标题',
 `read_uid` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `read_time` int(4) NOT NULL DEFAULT '0' COMMENT '阅读时间',
 PRIMARY KEY (`read_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='阅读记录表，所有阅读记录';

/*Data for the table `wm_user_read_log` */ /*Table structure for table `wm_user_sign` */
DROP TABLE IF EXISTS `wm_user_sign`;

CREATE TABLE `wm_user_sign` (`sign_id` int(4) NOT NULL AUTO_INCREMENT,
 `user_id` int(4) NOT NULL DEFAULT '0' COMMENT '签到用户',
 `sign_sum` int(4) NOT NULL DEFAULT '0' COMMENT '总共签到天数',
 `sign_con` int(4) NOT NULL DEFAULT '0' COMMENT '连续签到天数',
 `sign_prerank` int(4) NOT NULL DEFAULT '0' COMMENT '上次签到排名',
 `sign_pretime` int(4) NOT NULL DEFAULT '0' COMMENT '上次签到时间',
 `sign_rank` int(4) NOT NULL DEFAULT '0' COMMENT '本次签到排名',
 `sign_time` int(4) NOT NULL DEFAULT '0' COMMENT '本次签到时间',
 PRIMARY KEY (`sign_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户签到表';

/*Data for the table `wm_user_sign` */ /*Table structure for table `wm_user_ticket` */
DROP TABLE IF EXISTS `wm_user_ticket`;

CREATE TABLE `wm_user_ticket` (`ticket_id` int(4) NOT NULL AUTO_INCREMENT,
 `ticket_user_id` int(4) NOT NULL COMMENT '用户id',
 `ticket_module` varchar(20) CHARACTER
 SET latin1 NOT NULL DEFAULT 'novel' COMMENT '所属模块',
 `ticket_rec` int(4) NOT NULL DEFAULT '0' COMMENT '用户推荐票数量',
 `ticket_month` int(4) NOT NULL DEFAULT '0' COMMENT '用户月票数量',
 PRIMARY KEY (`ticket_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户票类集合表';

/*Data for the table `wm_user_ticket` */ /*Table structure for table `wm_user_ticket_log` */
DROP TABLE IF EXISTS `wm_user_ticket_log`;

CREATE TABLE `wm_user_ticket_log` (`log_id` int(4) NOT NULL AUTO_INCREMENT,
 `log_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为获得，2为使用',
 `log_module` varchar(20) DEFAULT NULL COMMENT '模块，all为全部模块',
 `log_cid` int(4) DEFAULT '0' COMMENT '内容id，',
 `log_user_id` int(4) NOT NULL DEFAULT '0' COMMENT '用户id',
 `log_rec` int(1) NOT NULL DEFAULT '0' COMMENT '推荐票数量',
 `log_month` int(1) NOT NULL DEFAULT '0' COMMENT '月票数量',
 `log_remark` varchar(500) DEFAULT NULL COMMENT '来源/使用说明',
 `log_time` int(4) NOT NULL COMMENT '来源/使用时间',
 PRIMARY KEY (`log_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='月票、推荐票等来源日志记录';

/*Data for the table `wm_user_ticket_log` */ /*Table structure for table `wm_user_user` */
DROP TABLE IF EXISTS `wm_user_user`;

CREATE TABLE `wm_user_user` (`user_id` int(4) NOT NULL AUTO_INCREMENT,
 `user_type` varchar(20) NOT NULL DEFAULT 'default' COMMENT '账号注册来源',
 `user_name` varchar(50) NOT NULL COMMENT '账号/第三方ID',
 `user_salt` varchar(50) DEFAULT '' COMMENT '密码盐',
 `user_psw` varchar(50) NOT NULL COMMENT '密码',
 `user_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常,0为审核中',
 `user_display` tinyint(1) DEFAULT '1' COMMENT '0为永久封禁，1为正常，2为定时封禁',
 `user_nickname` varchar(40) NOT NULL COMMENT '昵称',
 `user_email` varchar(50) DEFAULT NULL COMMENT '邮箱',
 `user_emailtrue` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为验证，0为未验证',
 `user_qq` varchar(15) DEFAULT NULL COMMENT '用户QQ号',
 `user_tel` varchar(18) DEFAULT NULL COMMENT '用户的手机号',
 `user_sex` int(1) NOT NULL DEFAULT '1' COMMENT '性别',
 `user_birthday` date NOT NULL DEFAULT '1991-10-24' COMMENT '用户的出生年月日',
 `user_head` varchar(200) NOT NULL COMMENT '头像',
 `user_sign` varchar(100) NOT NULL COMMENT '签名',
 `user_money` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
 `user_money_freeze` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '账户被冻结的余额',
 `user_gold1` decimal(10, 3) NOT NULL DEFAULT '0.000' COMMENT '金币1',
 `user_gold2` decimal(10, 3) NOT NULL DEFAULT '0.000' COMMENT '金币2',
 `user_ischarge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否首冲过了',
 `user_exp` int(4) NOT NULL DEFAULT '0' COMMENT '经验',
 `user_browse` int(4) NOT NULL DEFAULT '0' COMMENT '空间浏览量',
 `user_topic` int(4) NOT NULL DEFAULT '0' COMMENT '主题量',
 `user_retopic` int(4) NOT NULL DEFAULT '0' COMMENT '回帖数',
 `user_replay` int(4) NOT NULL DEFAULT '0' COMMENT '评论数',
 `user_logintime` int(4) NOT NULL DEFAULT '0' COMMENT '上次登录时间',
 `user_regtime` int(4) NOT NULL DEFAULT '0' COMMENT '注册时间',
 `user_regip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT '注册IP',
 `user_displaytime` int(4) NOT NULL DEFAULT '0' COMMENT '如果是时间段，那么就是封禁的时间段',
 PRIMARY KEY (`user_id`)) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT
CHARSET=utf8 COMMENT='用户表';

/*Data for the table `wm_user_user` */
INSERT INTO `wm_user_user`(`user_id`, `user_type`, `user_name`, `user_salt`, `user_psw`, `user_status`, `user_display`, `user_nickname`, `user_email`, `user_emailtrue`, `user_qq`, `user_tel`, `user_sex`, `user_birthday`, `user_head`, `user_sign`, `user_money`, `user_money_freeze`, `user_gold1`, `user_gold2`, `user_ischarge`, `user_exp`, `user_browse`, `user_topic`, `user_retopic`, `user_replay`, `user_logintime`, `user_regtime`, `user_regip`, `user_displaytime`) VALUES (1,'default','weimeng','','280a2b0b4a054aa53596a1b7106b4060f1f91aad',1,1,'คนงี่เง่า','1747699213@qq.com',1,'1747699213','15123931801',1,'1991-10-24','/upload/userhead/20141201125513.png','สิ่งที่คุณต้องการอาจยังไม่มี แต่ในอนาคตต้องมาแน่!','0.00','0.00','17.000','1.130',1,533,122,10,3,33,1556328091,1452754424,'0.0.0.0',1038770);

/*Table structure for table `wm_user_vist` */
DROP TABLE IF EXISTS `wm_user_vist`;

CREATE TABLE `wm_user_vist` (`vist_id` int(4) NOT NULL AUTO_INCREMENT,
 `vist_fuid` int(4) NOT NULL DEFAULT '0' COMMENT '访客id',
 `vist_uid` int(4) NOT NULL DEFAULT '0' COMMENT '主人id',
 `vist_time` int(4) NOT NULL DEFAULT '0' COMMENT '浏览时间',
 PRIMARY KEY (`vist_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='用户参观记录表';

/*Data for the table `wm_user_vist` */ /*Table structure for table `wm_weixin_account` */
DROP TABLE IF EXISTS `wm_weixin_account`;

CREATE TABLE `wm_weixin_account` (`account_id` int(4) NOT NULL AUTO_INCREMENT,
 `account_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '布尔值，是否使用',
 `account_name` varchar(50) NOT NULL COMMENT '公众号名字',
 `account_account` varchar(50) NOT NULL COMMENT '公众号账号',
 `account_gid` varchar(32) NOT NULL COMMENT '公众号原始id',
 `account_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1订阅号，2服务号',
 `account_auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '布尔值，是否认证',
 `account_appid` varchar(50) NOT NULL COMMENT '公众号appid',
 `account_secret` varchar(100) NOT NULL COMMENT '公众号secret',
 `account_access` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否接入',
 `account_main` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是主公众号',
 `account_follow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要关注后访问',
 `account_token` varchar(100) NOT NULL COMMENT '公众号的token',
 `account_aeskey` varchar(100) NOT NULL COMMENT '公众号的消息加密key',
 `account_welcome` varchar(200) DEFAULT NULL COMMENT '关注公众号的欢迎信息',
 `account_welcome_temp` varchar(500) DEFAULT NULL COMMENT '关注公众号的欢迎信息模版',
 `account_default` varchar(200) DEFAULT NULL COMMENT '没有匹配到消息的时候回复',
 `account_default_temp` varchar(500) DEFAULT NULL COMMENT '没有匹配到消息的时候回复模版',
 `account_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间',
 PRIMARY KEY (`account_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='微信公众号列表';

/*Data for the table `wm_weixin_account` */ /*Table structure for table `wm_weixin_autoreply` */
DROP TABLE IF EXISTS `wm_weixin_autoreply`;

CREATE TABLE `wm_weixin_autoreply` (`autoreply_id` int(11) NOT NULL AUTO_INCREMENT,
 `autoreply_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态，布尔值',
 `autoreply_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为不设置，1为关注回复，2为默认回复',
 `autoreply_account_id` int(4) NOT NULL DEFAULT '0' COMMENT '使用的公众号',
 `autoreply_name` varchar(50) NOT NULL COMMENT '自动回复名字',
 `autoreply_key` varchar(50) NOT NULL COMMENT '自动回复接受的关键字',
 `autoreply_match` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为完全匹配，2为全文模糊匹配，3为开始匹配，4为最后匹配',
 `autoreply_content` varchar(500) NOT NULL COMMENT '回复内容',
 `autoreply_temp` text NOT NULL COMMENT '回复内容的模版',
 `autoreply_type` varchar(20) NOT NULL DEFAULT 'text' COMMENT 'text为文字，image为图片',
 `autoreply_media_id` varchar(100) DEFAULT NULL COMMENT '素材id',
 `autoreply_addtime` int(11) NOT NULL COMMENT '添加时间',
 PRIMARY KEY (`autoreply_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='微信公众号自动回复表';

/*Data for the table `wm_weixin_autoreply` */ /*Table structure for table `wm_weixin_fans` */
DROP TABLE IF EXISTS `wm_weixin_fans`;

CREATE TABLE `wm_weixin_fans` (`fans_id` int(4) NOT NULL AUTO_INCREMENT,
 `fans_account_id` int(4) NOT NULL COMMENT '所属公众号',
 `fans_openid` varchar(100) NOT NULL COMMENT '用户的标识，对当前公众号唯一',
 `fans_unionid` varchar(100) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后才会有这个字段',
 `fans_subscribe` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。',
 `fans_nickname` varchar(50) NOT NULL COMMENT '用户的昵称',
 `fans_headimgurl` varchar(255) NOT NULL COMMENT '用户的头像',
 `fans_sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
 `fans_country` varchar(20) NOT NULL COMMENT '用户所在国家',
 `fans_province` varchar(10) NOT NULL COMMENT '用户所在省份',
 `fans_city` varchar(30) NOT NULL COMMENT '用户所在城市',
 `fans_remark` varchar(200) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
 `fans_subscribe_time` int(4) NOT NULL DEFAULT '0' COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
 `fans_unsubtime` int(4) NOT NULL DEFAULT '0' COMMENT '用户取消关注时间',
 `fans_json` varchar(500) NOT NULL COMMENT '用户数据json',
 `fans_time` int(4) NOT NULL DEFAULT '0' COMMENT '数据入库时间',
 PRIMARY KEY (`fans_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='微信粉丝信息表';

/*Data for the table `wm_weixin_fans` */ /*Table structure for table `wm_weixin_media` */
DROP TABLE IF EXISTS `wm_weixin_media`;

CREATE TABLE `wm_weixin_media` (`media_id` int(4) NOT NULL AUTO_INCREMENT,
 `media_account_id` int(4) NOT NULL DEFAULT '0' COMMENT '公众号id',
 `media_filename` varchar(255) NOT NULL COMMENT '素材名字',
 `media_filepath` varchar(500) NOT NULL COMMENT '素材路径',
 `media_media_id` varchar(255) NOT NULL COMMENT '微信素材id',
 `media_width` int(1) NOT NULL DEFAULT '0' COMMENT '素材宽',
 `media_height` int(1) NOT NULL DEFAULT '0' COMMENT '素材高',
 `media_type` varchar(20) NOT NULL DEFAULT 'image' COMMENT '素材类型，图片image、语音voice、视频video和缩略图thumb',
 `media_islong` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是永久素材，布尔值',
 `media_time` int(4) NOT NULL DEFAULT '0' COMMENT '上传时间',
 PRIMARY KEY (`media_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='微信素材表';

/*Data for the table `wm_weixin_media` */ /*Table structure for table `wm_weixin_menu` */
DROP TABLE IF EXISTS `wm_weixin_menu`;

CREATE TABLE `wm_weixin_menu` (`menu_id` int(4) NOT NULL AUTO_INCREMENT,
 `menu_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '布尔值，使用状态',
 `menu_account_id` int(4) NOT NULL COMMENT '所属公众号id',
 `menu_name` varchar(20) NOT NULL COMMENT '菜单备注名',
 `menu_data` text NOT NULL COMMENT '菜单json数据',
 `menu_addtime` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间',
 `menu_updatetime` int(4) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
 `menu_pushtime` int(4) NOT NULL DEFAULT '0' COMMENT '最后推送时间',
 PRIMARY KEY (`menu_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='微信公众号自定义菜单表';

/*Data for the table `wm_weixin_menu` */ /*Table structure for table `wm_weixin_msg` */
DROP TABLE IF EXISTS `wm_weixin_msg`;

CREATE TABLE `wm_weixin_msg` (`msg_id` int(4) NOT NULL AUTO_INCREMENT,
 `msg_account_id` int(4) NOT NULL DEFAULT '0' COMMENT '所属公众号的id',
 `msg_from` varchar(100) NOT NULL COMMENT '微信用户openid',
 `msg_type` varchar(20) NOT NULL DEFAULT 'text' COMMENT '消息类型',
 `msg_content` varchar(2000) DEFAULT NULL COMMENT '消息内容',
 `msg_attr` varchar(500) DEFAULT NULL COMMENT '附加消息内容',
 `msg_picurl` varchar(255) DEFAULT NULL COMMENT '图片消息的图片地址',
 `msg_url` varchar(255) DEFAULT NULL COMMENT '超链接消息的url',
 `msg_media_id` varchar(255) DEFAULT NULL COMMENT '微信临时素材媒体资源id',
 `msg_recognition` varchar(255) DEFAULT NULL COMMENT '语音消息识别结果',
 `msg_get` varchar(2000) NOT NULL COMMENT '网站接受到的用户消息内容',
 `msg_send` varchar(2000) NOT NULL COMMENT '网站回复消息内容',
 `msg_time` int(4) NOT NULL DEFAULT '0' COMMENT '用户发送消息时间',
 `msg_sendtime` int(4) NOT NULL DEFAULT '0' COMMENT '网站回复消息时间',
 PRIMARY KEY (`msg_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='微信对话消息记录表';

/*Data for the table `wm_weixin_msg` */ /*Table structure for table `wm_zt_node` */
DROP TABLE IF EXISTS `wm_zt_node`;

CREATE TABLE `wm_zt_node` (`node_id` int(4) NOT NULL AUTO_INCREMENT,
 `node_zt_id` int(4) NOT NULL DEFAULT '0' COMMENT '所属的专题id',
 `node_name` varchar(50) DEFAULT NULL COMMENT '节点名字',
 `node_pinyin` varchar(20) NOT NULL COMMENT '专题标识',
 `node_type` tinyint(1) DEFAULT '2' COMMENT '1为图片，2为普通内容输出，3为循环标签',
 `node_img` varchar(200) DEFAULT NULL COMMENT '图片地址',
 `node_content` text COMMENT '内容',
 `node_label` varchar(1000) DEFAULT NULL COMMENT '节点标签',
 `node_time` int(4) DEFAULT NULL COMMENT '节点创建时间',
 PRIMARY KEY (`node_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='专题节点表';

/*Data for the table `wm_zt_node` */ /*Table structure for table `wm_zt_type` */
DROP TABLE IF EXISTS `wm_zt_type`;

CREATE TABLE `wm_zt_type` (`type_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_topid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
 `type_pid` varchar(20) NOT NULL DEFAULT '0' COMMENT '子栏目id',
 `type_rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐分类',
 `type_name` varchar(40) NOT NULL COMMENT '分类名 /* SubMaRk */',
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
 PRIMARY KEY (`type_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='专题分类表';

/*Data for the table `wm_zt_type` */ /*Table structure for table `wm_zt_zt` */
DROP TABLE IF EXISTS `wm_zt_zt`;

CREATE TABLE `wm_zt_zt` (`zt_id` int(4) NOT NULL AUTO_INCREMENT,
 `type_id` int(4) NOT NULL DEFAULT '0' COMMENT '专题分类id',
 `zt_status` tinyint(1) DEFAULT '1' COMMENT '审核状态',
 `zt_name` varchar(40) NOT NULL COMMENT '专题名字 /* SubMaRk */',
 `zt_pinyin` varchar(20) DEFAULT NULL COMMENT '专题拼音',
 `zt_info` varchar(200) DEFAULT NULL COMMENT '导读',
 `zt_banner` varchar(200) DEFAULT NULL COMMENT '专题横幅',
 `zt_simg` varchar(200) DEFAULT NULL COMMENT '专题图片',
 `zt_read` int(4) DEFAULT '0' COMMENT '阅读量',
 `zt_replay` int(4) NOT NULL DEFAULT '0' COMMENT '评论量',
 `zt_content` varchar(2000) NOT NULL COMMENT '内容',
 `zt_time` int(4) NOT NULL DEFAULT '0' COMMENT '添加时间',
 PRIMARY KEY (`zt_id`)) ENGINE=MyISAM DEFAULT
CHARSET=utf8 COMMENT='专题表';