<?php
$urlsTable = wmsql::table('seo_urls');
$keysTable = wmsql::table('seo_keys');
$apiTable = wmsql::table('api_api');
$logTable = wmsql::table('user_finance_log');
$orderTable = wmsql::table('finance_order_charge');

wmsql::exec("ALTER TABLE `{$orderTable}` CHANGE `charge_sn` `charge_sn` VARCHAR(60) CHARSET utf8 COLLATE utf8_general_ci NULL COMMENT '本站充值订单号', ADD COLUMN `charge_paysn` VARCHAR(60) NULL COMMENT '第三方充值订单号' AFTER `charge_sn`; 
INSERT INTO `{$urlsTable}` (`urls_module`, `urls_page`, `urls_pagename`, `urls_url1`, `urls_url2`) VALUES ('user', 'user_charge_code', '在线扫码支付', '/module/user/charge_code.php?pt={pt}&code={code}&sn={sn}', '/module/user/charge_code.php?pt={pt}&code={code}&sn={sn}');
INSERT INTO `{$keysTable}` (`keys_module`, `keys_page`, `keys_pagename`, `keys_title`, `keys_key`, `keys_desc`) VALUES ('user', 'user_charge_code', '扫码支付', '{支付方式}在线扫码支付-{网站名}', '{支付方式}在线扫码支付,{网站名}', '{支付方式}在线扫码支付-{网站名}'); 
ALTER TABLE `{$orderTable}` CHANGE `charge_user_id` `charge_user_id` INT(4) DEFAULT 0 NOT NULL COMMENT '充值用户', ADD COLUMN `charge_tuser_id` INT(4) DEFAULT 0 NOT NULL COMMENT '好友的id' AFTER `charge_user_id`; 
UPDATE `{$apiTable}` SET `api_option` = 'a:1:{s:5:{#34}mchid{#34};a:3:{s:5:{#34}title{#34};s:9:{#34}商户号{#34};s:5:{#34}value{#34};s:1:{#34}0{#34};s:4:{#34}info{#34};s:17:{#34}微信商户号id{#34};}}' WHERE `api_id` = '6'; 
UPDATE `{$apiTable}` SET `api_title` = '支付宝支付' WHERE `api_id` = '3'; 
ALTER TABLE `{$orderTable}` CHANGE `charge_sn` `charge_sn` VARCHAR(60) CHARSET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '本站充值订单号'; ");

wmsql::exec("INSERT INTO `{$urlsTable}` (`urls_module`, `urls_page`, `urls_pagename`, `urls_url1`, `urls_url2`) VALUES ('user', 'user_charge_success', '支付成功', '/module/user/charge_success.php?pt={pt}', '/module/user/charge_success.php?pt={pt}'); 
INSERT INTO `{$keysTable}` (`keys_module`, `keys_page`, `keys_pagename`, `keys_title`, `keys_key`, `keys_desc`) VALUES ('user', 'user_charge_success', '支付成功', '支付成功-{网站名}', '支付成功,{网站名}', '支付成功-{网站名}'); 
ALTER TABLE `{$apiTable}` ADD COLUMN `api_ctitle` VARCHAR(10) NULL COMMENT '接口简称' AFTER `api_title`; 
UPDATE `{$apiTable}` SET `api_ctitle` = '微信' WHERE `api_id` = '6'; 
UPDATE `{$apiTable}` SET `api_ctitle` = '支付宝' WHERE `api_id` = '3';
ALTER TABLE `{$orderTable}` ADD COLUMN `charge_first` DECIMAL(10,2) DEFAULT 0 NOT NULL COMMENT  '是否有首冲奖励' AFTER `charge_gold2`, ADD COLUMN `charge_reward` DECIMAL(10,2) DEFAULT 0 NOT NULL COMMENT '是否有充值奖励' AFTER `charge_first`; 
ALTER TABLE `{$apiTable}` CHANGE `api_apikey` `api_apikey` VARCHAR(5000) CHARSET utf8 COLLATE utf8_general_ci NULL COMMENT 'apikey', CHANGE `api_secretkey` `api_secretkey` VARCHAR(5000) CHARSET utf8 COLLATE utf8_general_ci NULL COMMENT 'skey';
ALTER TABLE `{$apiTable}` ADD COLUMN `api_base` VARCHAR(500) NULL COMMENT '基本接口配置参数' AFTER `api_secretkey`;");

$SDSDSQL = 
<<<EOF
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:2:{s:4:"mast";i:1;s:6:"remark";s:20:"请输入您的appid";}s:10:"api_apikey";a:2:{s:4:"mast";i:1;s:6:"remark";s:21:"请输入您的apikey";}s:13:"api_secretkey";a:2:{s:4:"mast";i:1;s:6:"remark";s:24:"请输入您的secretkey";}}' WHERE `api_id` = '1';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:6:"APP ID";s:6:"remark";s:27:"请输入您的应用APP ID";}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:7:"APP Key";s:6:"remark";s:28:"请输入您的应用APP Key";}s:13:"api_secretkey";a:1:{s:4:"mast";i:0;}}' WHERE `api_id` = '2';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:5:"APPID";s:6:"remark";s:8:"应用id";}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:15:"支付宝私匙";s:6:"remark";s:15:"支付宝私匙";}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:15:"支付宝公匙";s:6:"remark";s:15:"支付宝公匙";}}' WHERE `api_id` = '3';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:2:"ID";s:6:"remark";s:23:"请输入您的应用ID";}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:7:"API Key";s:6:"remark";s:28:"请输入您的应用API Key";}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:10:"Secret Key";s:6:"remark";s:31:"请输入您的应用Secret Key";}}' WHERE `api_id` = '4';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:1:{s:4:"mast";i:0;}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:7:"App Key";s:6:"remark";s:28:"请输入您的应用App Key";}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:10:"App Secret";s:6:"remark";s:31:"请输入您的应用App Secret";}}' WHERE `api_id` = '5';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:5:"APPID";s:6:"remark";s:20:"请输入您的APPID";}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:9:"API密钥";s:6:"remark";s:24:"请输入您的API密钥";}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:9:"Appsecret";s:6:"remark";s:24:"请输入您的Appsecret";}}' WHERE `api_id` = '6';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:11:"AccessKeyId";s:6:"remark";s:26:"从OSS获得的AccessKeyId";}s:10:"api_apikey";a:1:{s:4:"mast";i:0;}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:15:"AccessKeySecret";s:6:"remark";s:30:"从OSS获得的AccessKeySecret";}}' WHERE `api_id` = '7';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:6:"APP_ID";s:6:"remark";s:21:"从COS获得的APP_ID";}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:7:"API_KEY";s:6:"remark";s:22:"从COS获得的API_KEY";}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:6:"SC_KEY";s:6:"remark";s:21:"从COS获得的SC_KEY";}}' WHERE `api_id` = '8';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:1:{s:4:"mast";i:0;}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:9:"accessKey";s:6:"remark";s:42:"从七牛云对象存储获得的accessKey";}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:9:"secretKey";s:6:"remark";s:42:"从七牛云对象存储获得的secretKey";}}' WHERE `api_id` = '9';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:1:{s:4:"mast";i:0;}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:9:"AccessKey";s:6:"remark";s:42:"从新浪云对象存储获得的AccessKey";}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:9:"SecretKey";s:6:"remark";s:42:"从新浪云对象存储获得的SecretKey";}}' WHERE `api_id` = '10';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:6:"域名";s:6:"remark";s:40:"请输入您的域名，无需加http://";}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:5:"token";s:6:"remark";s:20:"请输入您的token";}s:13:"api_secretkey";a:1:{s:4:"mast";i:0;}}' WHERE `api_id` = '11';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:3:"PID";s:6:"remark";s:17:"合作身份者id";}s:10:"api_apikey";a:3:{s:4:"mast";i:1;s:4:"name";s:3:"KEY";s:6:"remark";s:15:"安全检验码";}s:13:"api_secretkey";a:1:{s:4:"mast";i:0;}}' WHERE `api_id` = '12';
UPDATE `{$apiTable}` SET `api_base` = 'a:3:{s:9:"api_appid";a:3:{s:4:"mast";i:1;s:4:"name";s:5:"APPID";s:6:"remark";s:23:"请输入您的应用ID";}s:10:"api_apikey";a:1:{s:4:"mast";i:0;}s:13:"api_secretkey";a:3:{s:4:"mast";i:1;s:4:"name";s:9:"Appsecret";s:6:"remark";s:30:"请输入您的应用Appsecret";}}' WHERE `api_id` = '13';
ALTER TABLE `{$logTable}` CHANGE `log_cid` `log_cid` VARCHAR(35) CHARSET utf8 COLLATE utf8_general_ci DEFAULT '0' NOT NULL COMMENT '购买的内容id或者来源id';
EOF;
wmsql::exec($SDSDSQL);
?>