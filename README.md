# Weimeng CMS (WMCMS) ระบบจัดการเนื้อหาสำเร็จรูป
  WMCMS เป็นระบบจัดการเนื้อหาสำเร็จรูป ก่อตั้งขั้นในเดือนมกราคมปีพุทธศักราช 2555 เป็นระบบที่ตั้งอยู่บนพื้นฐานของ PHP + MySQL ที่มุ่งในการพัฒนาให้ใช้ได้ฟรีและโอเพนซอร์ส ตัวระบบเน้นไปที่การจัดการนิยายเป็นหลัก โดยตัวระบบถูกสร้างขึ้นเพื่ออำนวยความสะดวกแก่ผู้ดูแลเว็บไซต์ ซึ่งสามารถจัดการส่วนต่าง ๆ ได้อย่างง่ายดายโดยที่ไม่ต้องทำระบบด้วยตนเอง ในส่วนของนักเขียนหรือนักแปลเองก็สามารถลงผลงานด้วยตนเอง รวมไปถึงหารายได้จากการเขียนหรือแปลจากผลงานได้โดยตรงด้วยระบบ VIP ที่สามารถซื้อเป็นบท เป็นเล่ม หรือทั้งเรื่องได้

## หน้าเว็บอย่างเป็นทางการ >> [WeimengCMS](http://www.weimengcms.com)

## โมดูล
- โมดูลบทความ
- โมดูลเกี่ยวกับ
- โมดูลนิยาย
- โมดูลคุณลักษณะ
- โมดูลหน้าเดี่ยว
- โมดูลรูปภาพ
- โมดูลเว็บเพื่อนบ้าน
- โมดูลผู้ใช้
- โมดูลเว็บบอร์ด
- โมดูลแอปพลิเคชั่น
- โมดูลค้นหา

## การนำไปใช้
- เว็บบล็อกส่วนตัว
- เว็บองค์กร
- เว็บไซต์แสดงรูปภาพ
- เว็บนิยาย
- เว็บการ์ตูน
- เว็บวีดีโอ
- เว็บหนัง
- เว็บอนิเมะ
- อื่น ๆ

# อัปเดทจาก 4.444.1244 เป็น V4.446.1257

## รายการอัพเดท
### เพิ่มใหม่ [ 2 รายการ ]
- หลังบ้านค้นหานิยายที่ไม่มีบทได้
- เพิ่มโหมดนำเข้านิยาย

## รายการแก้ไข
### แก้ไข [ 12 รายการ ]
- แก้ไขข้อผิดพลาดเมื่อจับคู่เนื้อหานิยายไม่พบ
- แก้ไขการเพิ่มโฆษณาข้อความที่แจ้งว่าความกว้างและความสูงของภาพต้องไม่ว่าง
- แก้ไขการเพิ่มหน้าเดี่ยวที่แจ้งว่า ID เทมเพลตว่าง
- แก้ไขคำเตือนในรายละเอียดบันทึกการส่งอีเมล
- แก้ไขปกนิยายของการติดตามและรายการโปรดที่เกินขนาด
- แก้ไขการนำขึ้นขายไม่ได้หลังเซ็นสัญญาแบบซื้อขาด
- แก้ไขคำเตือนเมื่อประเภทการแจ้งเตือนในการตั้งค่านักพัฒนาว่าง
- แก้ไขข้อผิดพลาดสถิติข้อมูลในกรณีที่ไม่ทราบสาเหตุ
- แก้ไขคำเตือนของป้ายกำกับคำนวณในบางกรณี
- แก้ไขคำเตือนของเมธอด getKey เมื่อ key ไม่มีอยู่
- แก้ไขคำเตือนบางส่วนของการนำเข้า TXT
- เพิ่มประสิทธิภาพเมธอดเพิ่ม/ลดอัตโนมัติให้ส่งจำนวนได้

# V4.446.1257-CustomPatch

สาขานี้เริ่มจาก V4.446.1257 แล้วไล่แก้ช่องโหว่ที่ตรวจพบในโค้ดเดิม
ไม่ได้อัปเกรดเวอร์ชันใหม่ เพราะ 4.446.1257 คือรุ่นสุดท้ายที่ผู้พัฒนาเดิมปล่อย

## รายการแก้ไขด้านความปลอดภัย

### วิกฤต
- **ลบการประมวลผลโค้ดจากระยะไกลใน `CheckBasicConfig()`** — เดิมฟังก์ชันนี้ดึงข้อมูลจาก `server.weimengcms.com` ด้วย http แล้ว `eval()` ทุกครั้งที่เรนเดอร์หน้า เนื้อหาที่ได้มีเพียง `tpl::$tempContent = tpl::$tempCode;` จึงเปลี่ยนเป็นกำหนดค่าในเครื่องตรง ๆ ตัดการเชื่อมต่อและการ eval ออกทั้งหมด พร้อมลบ `cloud::GetBasic()` ที่ไม่มีผู้เรียกแล้ว
- **ปิดการอัปเกรดออนไลน์** — เดิมดาวน์โหลด zip ผ่าน http แล้ว `require` ไฟล์ `update.php` ในแพ็ค โดยไม่มีการตรวจลายเซ็น ลบโค้ดดาวน์โหลด/แตกไฟล์/คัดลอกทั้งชุดและปุ่มบนหน้าจอทิ้ง เหลือเพียงข้อความให้อัปโหลดแพ็คและรัน `update.php` เอง

### สูง
- **SQL injection ที่ `orderField` / `orderDirection`** — เดิมต่อค่าจาก URL เข้า `order by` ตรง ๆ ทำให้ `char()`, `if()`, `ascii()` หลุด blacklist ของ `CheckSql` ไปได้ เพิ่ม `SafeOrderField()` / `SafeOrderDirection()` รับเฉพาะชื่อฟิลด์เดียว (มี table alias ได้) และทิศทาง asc/desc แล้วใช้ทั้งตอน parse พารามิเตอร์, `GetListOrder()` และตอน echo JSON
- **เปิดเผย schema ที่ `/install/sql.sql`** — ลบไฟล์ทันทีหลังนำเข้าฐานข้อมูลใน `step4.php` (เดิมลบเฉพาะตอนจบตัวช่วยติดตั้งใน `step5.php`) และเพิ่มกฎปฏิเสธใน `.htaccess` / `httpd.ini` (ต้องเปิด `AllowOverride` ให้ทำงาน)

### กลาง
- **เติม guard ให้ไฟล์ entry 10 ไฟล์** ที่เดิมยิงตรงแล้ว fatal พร้อมเผย path เต็ม: `wmcms/action/index{,.before,.after}.php`, `action/user/varemail{,next}.php`, `ajax/index.php`, `ajax/get_chapter.php`, `ajax/get_draft.php`, `ajax/author/getdraft.php`, `ajax/api/login/wxmplogin/autoload.php`
- **รองรับ PHP 8** — เปลี่ยน `$str{0}` เป็น `$str[0]` สองจุดที่เหลือ (`weibologin/saetv2.ex.class.php`, `oss/scs/class/SCS.php`) ทำให้ lint ผ่านทั้ง PHP 7.2 และ 8.3
- **ยกระดับการเก็บรหัสผ่านเป็น bcrypt** — เพิ่ม `str::PswHash()`, `str::PswCheck()`, `str::PswIsLegacy()` ทุกจุดที่เขียนรหัสผ่านใช้ bcrypt และล้างค่า salt ระบบตรวจรหัสผ่านแบบเก่า `sha1(md5())` ได้และจะเปลี่ยนเป็น bcrypt ให้ทันทีเมื่อเข้าสู่ระบบสำเร็จ ขยายคอลัมน์ `*_psw` เป็น `VARCHAR(255)` ใน `install/sql.sql` และมีไฟล์ `upgrade/V4.446.1257-CustomPatch.sql` สำหรับเว็บที่ติดตั้งไปแล้ว

## รายการแก้ไขรอบที่สอง (จากการไล่ทดสอบจริง)

### วิกฤต
- **CSRF ทั้งหลังบ้าน → RCE** — ทุกคำขอ `a=yes` ไม่มี token และไม่ตรวจแหล่งที่มา จึงมีเพียง cookie ของแอดมินก็ยิงคำสั่งได้ (ทดสอบแล้ว: สร้าง `upload/_csrf.php` ผ่าน `data.file&t=create` แล้วเรียกไฟล์นั้นได้) เพิ่ม `AdminCsrfCheck()` ใน `admin/index.php` ตรวจ `Origin`/`Referer` ให้ตรงกับโฮสต์ปัจจุบัน ถ้าไม่มีทั้งคู่หรือไม่ตรงจะปฏิเสธทันที (ข้อยกเว้นเดียวคือ CLI)
- **ตัวจัดการไฟล์เขียนไฟล์ PHP ได้** — `data.file&t=create|edit` ปฏิเสธนามสกุล `php/php3/php4/php5/phtml/phar/pht/inc/htaccess/htpasswd` และไฟล์ที่ขึ้นต้นด้วยจุด

### สูง
- **SQL injection ที่ `novel.sell.settlement`** — `year`/`month` ถูกต่อเข้าเงื่อนไข `array('string',...)` ตรง ๆ (ทดสอบ: `month=01 OR 1` เปลี่ยนจำนวนบทที่แสดงจริง) เปลี่ยนเป็น `str::Int()` และจำกัดเดือน 1–12
- **SQL injection แฝงที่ตัวสร้าง HTML/sitemap** — `tid`, `startid`, `endid` ใน `system.seo.html` / `system.seo.sitemap` ถูกต่อเข้า `FIND_IN_SET()` ตรง ๆ ปัจจุบันถูกบล็อกเพราะยังไม่เปิด static HTML แต่จะกลายเป็นช่องทันทีที่เปิด เปลี่ยนเป็น `str::Int()` แล้ว
- **Path traversal ที่ `data.file&t=rename`** — `oldname`/`newname` ไม่ถูกตรวจเลย (ทดสอบ: `../` ย้ายไฟล์ออกนอก `upload/` ได้จริง) เปลี่ยนเป็น `basename()` + `ClearPath()`

### กลาง
- **`GetIp()` ปลอมได้** — เดิมเชื่อ `HTTP_CLIENT_IP` และ `HTTP_X_FORWARDED_FOR` ก่อน `REMOTE_ADDR` ทำให้หมุน header หนีการจำกัดจำนวนครั้งล็อกอิน 5 ครั้ง/วัน และหลบการแบนได้ เปลี่ยนให้ใช้ `REMOTE_ADDR` เป็นหลัก, ตรวจรูปแบบ IP, และใช้ proxy header เฉพาะเมื่อ `define('TRUST_PROXY', true)` เท่านั้น
- **คุกกี้/เซสชันไม่มีการป้องกัน** — `setcookie()` และ session cookie ไม่มี `HttpOnly`/`SameSite` เพิ่ม `HttpOnly` + `SameSite=Lax` (และ `Secure` เมื่อเป็น HTTPS) ผ่าน `CookieOptions()` และ `session_set_cookie_params()`

### แก้บั๊กที่เกิดจากการแก้รอบแรก
- `wmcms/action/index.php` และ `wmcms/ajax/index.php` เป็น entry point ที่หน้าเว็บเรียกจริง (เช่น `?action=replay.add`) ไม่ใช่ไฟล์ include — การเติม guard ในรอบแรกทำให้โพสต์คอมเมนต์พังทั้งเว็บ ถอน guard ออกแล้ว

### ข้อจำกัดที่ยังเหลือ (โดยเจตนา)
- `module/link/click.php` ยังยอมให้ redirect ไป URL `http/https` ภายนอกได้ เพราะเป็นฟังก์ชันของโมดูลลิงก์เอง (ตัวนับคลิกออก) แต่ตัด `javascript:` และ `//host` ที่ใช้เป็นช่องทางหลอกได้แล้ว
- เปิด `AllowOverride` ให้ `.htaccess` ทำงาน ถ้าต้องการให้กฎปฏิเสธไฟล์ `*.sql/*.ini/*.log` มีผล (Laragon ค่าเริ่มต้นคือ `None`)

## รองรับ PHP 8.3 / 8.4 / 8.5

ทดสอบจริงบน PHP 8.3.33, 8.4.14 และ 8.5.6 (MySQL 8.4.3) โดยติดตั้งใหม่ทั้งชุดแล้วไล่ยิง **116 หน้า** ต่อเวอร์ชัน ครอบคลุมหน้าเว็บ หน้า AJAX และหน้า/คำสั่งหลังบ้าน

| เวอร์ชัน | หน้ามีปัญหา | deprecation ที่บันทึก |
|---|---|---|
| 8.3 | 0 | 0 |
| 8.4 | 0 | 0 |
| 8.5 | 0 | 0 |

### สิ่งที่แก้เพื่อให้รันได้บน 8.x

- **ตัวจัดการข้อผิดพลาดเดิมทำให้หน้าขาว** — `WMException::ErrorHandler()` เรียก `die()` กับทุก error level รวมถึง `E_DEPRECATED` (8192) ซึ่ง 8.x ฟ้องตลอดเวลา เพิ่ม `$softCode` ให้ DEPRECATED/NOTICE/STRICT ถูกเขียนลง `cache/log/soft/` แทนการหยุด request พร้อมเติมชื่อระดับที่ขาด (`DEPRECATED`, `RECOVERABLE_ERROR`, `USER_DEPRECATED`)
- **ส่ง `null` ให้ฟังก์ชันที่ต้องการ string** — จุดที่ร้อนที่สุดคือ `C()` (`trim()`), `tpl::Rep()` (`str_replace()`) และ `str::Escape()` (`strtr()`) เติม `(string)` ที่ต้นทาง ลด deprecation จาก ~1,700 ครั้งต่อรอบเหลือ 0
- **dynamic property (8.2+)** — ประกาศ property ที่เดิมสร้างตอนรัน: `cache::$queueCacheTime/$queuePath/$sqlPath`, `cloud::$apikey/$secret`, `ChapterModel::$novelMp3Save/$chapterMp3Save`, `ReadModel::$moduleTable`
- **`$str{0}` string offset** — แก้เป็น `$str[0]` (แก้ไปแล้วรอบก่อน, ยืนยันบน 8.5)
- **`ereg()` ที่ถูกถอดใน PHP 7** — แทนด้วย `preg_match()` ใน `pclzip.class.php`
- **`strftime()` (deprecated 8.1)** — เปลี่ยนเป็น `date()` ใน SDK Alipay
- **implicit nullable parameter (deprecated 8.4)** — `?Zone $z = null` ใน SDK Qiniu
- **non-canonical cast (deprecated 8.5)** — `(integer)`/`(boolean)`/`(double)` → `(int)`/`(bool)`/`(float)`
- **`curl_close()` (deprecated 8.5)** — เรียกเฉพาะ PHP < 8.0
- **`array_key_exists(null, …)` (deprecated 8.5)** — cast เป็น string ก่อน
- **`case 'x';` (deprecated 8.5)** — เปลี่ยนเป็น `case 'x':` ใน `manager.class.php`
- **`false` แล้วเอาตัวแปรไปใช้เป็น array** — `data.chart.class.php`, `chapter.model.php`, `novel.label.php` เติม `is_array()` guard
- **`ob_end_clean()` โดยไม่มี buffer** — ตรวจ `ob_get_level()` ก่อน
- **`file::GetFile()` อ่านโฟลเดอร์** — `file_exists()` เป็นจริงกับ directory ด้วย เติม `!is_dir()`
- **installer ปฏิเสธ PHP > 7.2** — เปลี่ยนเป็นยอมรับ 7.2–8.5

### MySQL รุ่นใหม่

`wmsql` ตั้ง `SET SESSION sql_mode='NO_ENGINE_SUBSTITUTION'` ต่อการเชื่อมต่อ เพราะโค้ดชุดนี้เขียนตาม sql_mode แบบหลวมของ MySQL 5.6 (เช่น insert ค่าว่างลงคอลัมน์ NOT NULL) ถ้าใช้ `STRICT_TRANS_TABLES` ของ 5.7+ จะพังทันที และหน้า `system.config.option.list` เปลี่ยนจาก `group by` เป็น `distinct` เพราะ `ONLY_FULL_GROUP_BY` ไม่ยอมรับ `SELECT c.*,g.*` คู่กับ `GROUP BY c.config_id`

## รายการแก้ไขรอบที่สาม (ช่องโหว่ความปลอดภัย)

รอบนี้ตรวจทั้งโค้ดด้วยการอ่านและยิงทดสอบจริงบนเว็บที่ติดตั้งใหม่ (Apache 2.4 + PHP 8.3/8.4/8.5 + MySQL 8.4) ทุกข้อด้านล่างมี commit แยกของตัวเอง

### วิกฤต

- **ยึดเซิร์ฟเวอร์ผ่านแท็กในเทมเพลต** — `{php}`, `{wmphp}`, `{运算:}`, `{wmsql:}` ถูกประมวลผลบนเนื้อหาที่ผ่านการแทนที่ข้อมูลจากฐานข้อมูลแล้ว ชื่อนิยายที่ตั้งว่า `ProbeB{php}echo "PWNED";{/php}End` จึงถูก **execute จริง** โดยไม่ต้องล็อกอิน (ทดสอบแล้วได้ `PWNED`) และ `ProbeA{运算:7*7}End` กลายเป็น `ProbeA49End`
  - เทมเพลต源码ถูก "ใส่เกลือ" (salt สุ่มต่อ request) ก่อนแทนที่ข้อมูล แล้วทุกรอบประมวลผลค้นหาแท็กที่ใส่เกลือแล้วเท่านั้น ข้อมูลจาก DB จึงไม่มีทางกลายเป็นแท็ก
  - `{wmphp}` ถูกลบทั้งแท็ก; `{php}` ต้องเปิด `TPL_PHP_ALLOW` เอง (ค่าเริ่มต้นปิด)
  - `{运算:}` เลิกใช้ `eval()` เปลี่ยนเป็น parser ที่รับเฉพาะตัวเลขกับ `+ - * / % ( )` (ทดสอบ: `7*7`=49, `phpinfo()`/`system("id")` ถูกปฏิเสธ)
- **Object injection จากคุกกี้/เซสชัน** — `Session()` และ `Cookie()` เอา `$_COOKIE` ไป `unserialize()` ตรง ๆ เพิ่ม `SafeUnserialize()` ที่บังคับ `allowed_classes=false` และตรวจซ้ำว่าไม่มี object หลงเหลือ (payload แบบ object, nested object, string ขาด ถูกปฏิเสธทั้งหมด)
- **แจกเครดิตโดยไม่ตรวจยอดเงิน** — `OrderFinish()` รับแค่เลขออเดอร์ เดิมจ่ายจริง 0.01 ก็เติมเต็มจำนวนได้ ตอนนี้เทียบ `total_amount` (alipay), `total_fee` (wxpay, หน่วยสตางค์), `mc_gross` (paypal) กับ `charge_money` ±1 สตางค์, ตรวจ `app_id`/`appid` กับค่าที่ตั้งไว้, และเปลี่ยนสถานะด้วย `UPDATE ... WHERE charge_status='0'` แล้วเครดิตเฉพาะเมื่อมีแถวถูกแก้ 1 แถว (ยิงซ้ำ/ยิงพร้อมกันไม่เติมซ้ำ) — ทดสอบแล้ว: ยอดถูกเติมครั้งเดียว, ยิงซ้ำไม่เติม, 0.01 ถูกปฏิเสธ, ไม่มียอดถูกปฏิเสธ, appid ปลอมถูกปฏิเสธ

### สูง

- **ติดตั้งระบบโดยไม่มีการตรวจค่า** — `install/step4.php` ต่อค่าจาก POST เข้า `UPDATE` และเข้าไฟล์ config ตรง ๆ (ตั้งชื่อฐานข้อมูล/รหัสผ่านให้มี quote ก็ Inject ได้) ตอนนี้ตรวจรูปแบบทุกค่าและใช้ prepared statement ทั้งหมด, เขียน config ด้วย `var_export()`, และ `step5` เปลี่ยนชื่อโฟลเดอร์ install ทั้งโฟลเดอร์ (ถ้าเปลี่ยนไม่ได้จะเปลี่ยนชื่อไฟล์ .php เป็น `.removed` + ใส่ `.htaccess` ปฏิเสธทั้งหมด)
- **อัปโหลดเชื่อ MIME จากเบราว์เซอร์** — เดิม改名 `shell.php` เป็น `.jpg` แล้วส่ง `type=image/jpeg` ผ่านได้ ตอนนี้ตรวจเนื้อไฟล์จริงด้วย `getimagesize()` (`str::IsRealImg()`) และมี `upload/.htaccess` + `files/.htaccess` ที่ปิดการ execute สคริปต์ทุกชนิด
- **เขียนไฟล์ config ด้วยการต่อสตริง** — `domain.config.php` เดิมต่อค่าจาก DB ใน single quote (มี `'` ตัวเดียวก็ Inject โค้ดได้) ตอนนี้ใช้ `var_export()` และรับเฉพาะชื่อโฮสต์ที่ถูกรูปแบบ, ชื่อโมดูลที่ใช้สร้าง path ต้องเป็นโมดูลที่มีอยู่จริง
- **ปิดการตรวจใบรับรอง TLS ทั้งระบบ** — 11 ไฟล์ตั้ง `CURLOPT_SSL_VERIFYPEER=false` (รวม Alipay SDK, SMS, OSS ทั้งชุด) ตอนนี้เปิดหมด, `CurlCaFile()` หา CA bundle ให้เอง (bundled `wmcms/config/cacert.pem`) ทดสอบ: `example.com` ผ่าน, self-signed และ expired ถูกปฏิเสธ
- **SSRF ผ่านการดึงรูปจาก URL** — เดิมเช็คแค่ `NO_PRIV_RANGE` (ไม่ครอบ 127.0.0.1, 169.254.169.254, `file://`, `user:pass@host`) ตอนนี้ `IsPublicHttpUrl()` บังคับ http/https, resolve ทุก A record และปฏิเสธ private/reserved ทั้งหมด
- **`session_id` จาก query string** — `imgcode.php` รับ `session_id` แล้ว `session_id()` ก่อน `session_start()` โดยไม่ตรวจรูปแบบ (fixation + เขียน captcha ลง session ที่รู้ค่า) ตอนนี้บังคับรูปแบบ 22–64 ตัวอักษรและไม่สลับเมื่อมี session อยู่แล้ว
- **CSRF หลังบ้านด้วย Origin/Referer อย่างเดียว** — เพิ่ม token ต่อ session (`X-WM-Token` / `_wmtoken`) ตรวจด้วย `hash_equals()` สำหรับทุก POST; token ถูกฉีดอัตโนมัติผ่าน buffer + `jQuery.ajaxSetup`
- **Token เดาได้** — `FormTokenCreate()` เดิมใช้ `md5(apikey|wmcms|time())` และรหัสยืนยันใช้ `rand()` ตอนนี้ใช้ `random_bytes(16)` / `random_int()` และเทียบด้วย `hash_equals()`

### กลาง

- **`display_errors` เปิดถาวร + `DEBUG=true`** — หน้าเว็บโชว์ path, SQL และ internals ทั้งหมด ตอนนี้ `display_errors` ผูกกับ `DEBUG` (ปิดเป็นค่าเริ่มต้น) และ error ยังลง log ตามปกติ
- **`unserialize()` จาก DB/cache อีก 34 ไฟล์** — ทั้งหมดเปลี่ยนไปใช้ `SafeUnserialize()`
- **รหัสผ่านผู้ใช้ 6–16 ตัวและจำกัดแค่ `[a-zA-Z0-9_.]`** — ตัวอักษรพิเศษ/ช่องว่าง/ภาษาไทยใช้ไม่ได้ ตอนนี้ `str::CheckPsw()` บังคับ 8–72 ไบต์ (ขอบเขตจริงของ bcrypt) และไม่จำกัดชนิดตัวอักษร; ตอน login ตรวจแค่ขอบเขต 72 เพื่อให้บัญชีเก่ายังเข้าได้
- **ล็อกอินล็อกที่ IP อย่างเดียว** — เปลี่ยน IP ก็ยิงรหัสต่อได้ ตอนนี้มีตัวนับต่อบัญชี (`GetUserCount`, `GetNameCount`) ล็อกเมื่อผิดครบจำนวนแม้รหัสจะถูก
- **ไม่มีการยืนยันตัวตนสองขั้นตอน** — เพิ่ม TOTP (RFC 6238) สำหรับแอดมิน: หน้าตั้งค่าความปลอดภัยมีปุ่มสร้างคีย์/เปิด/ปิด, เก็บ secret ใน `@manager_2fa` (สร้างตารางให้เอง), ล็อกอินต้องใส่รหัส 6 หลักเมื่อเปิดใช้, และ `session_regenerate_id(true)` ทั้ง login ผู้ใช้และแอดมิน
- **ไม่มี audit log ของการกระทำสำคัญ** — เพิ่ม `AuditLog()` เขียน `cache/log/audit/YYYY-MM/DD.log` (เวลา, uid, IP, การกระทำ) ครอบการเขียน/ลบไฟล์ผ่านตัวจัดการไฟล์, เปลี่ยน/รีเซ็ตรหัสผ่าน, และการเติมเงินสำเร็จ
- **ไม่มีการป้องกัน clickjacking / MIME sniffing** — เพิ่ม `SendSecurityHeaders()`: `X-Content-Type-Options`, `X-Frame-Options`, `Referrer-Policy`, `Permissions-Policy`, CSP (`object-src 'none'; base-uri 'self'; frame-ancestors 'self'`) และ HSTS เมื่อเป็น HTTPS
- **`.htaccess` เดิมบล็อก `/wmcms/` ทั้งโฟลเดอร์** — ทำให้ AJAX หน้าเว็บ, action (`/wmcms/action/index.php`) และภาพ captcha (`/wmcms/inc/imgcode.php`) โดน 403 ทั้งหมด (ผู้ใช้ล็อกอินไม่ได้) ตอนนี้เปิดเฉพาะ 4 ทางเข้า: `notify/`, `action/`, `ajax/`, `inc/imgcode.php` ที่เหลือยังปฏิเสธ (ทดสอบบน Apache จริง: ทางเข้า 200, `class/`, `config/`, `cache/`, `install/sql.sql` 403)

### นำออก

- โมดูล cloud ทั้งชุด (`admin/{action,controller,templates/web}/cloud`, `wmcms/class/cloud.class.php`) — ตัวเดียวที่ทำให้ระบบเชื่อมต่อไป `http://server.weimengcms.com` แบบ明文 และส่ง appid/apikey/secret/domain ออกไป; installer ไม่ขอ credential จากเซิร์ฟเวอร์แล้ว (สร้างในเครื่องด้วย `random_bytes`)
- `wmcms/notify/pay_test.php` (ปลายทางทดสอบการจ่ายเงิน), `wmcms/class/snoopy.class.php` (ไม่ถูกใช้ + `exec curl -k`), `weibologin/saetv2.ex.class.php`, `plugin/apps/demo/`
- PHPMailer 2009 (`class.phpmailer.php` รุ่น `$Id: 447 2009`) → **PHPMailer 6.9.3** พร้อม alias ชื่อคลาสเดิมให้ปลั๊กอินเก่ายังใช้ได้ (ทดสอบส่งเมลจริงผ่าน SMTP: ส่งสำเร็จและจดหมายถึงผู้รับ)

### ยังต้องทำเอง (ระบบทำให้ไม่ได้)

- **อัปเดต SDK จ่ายเงิน/คลาวด์ที่ vendor ให้มา** — Alipay, WxPay, OSS/COS/Qiniu ยังเป็นชุดที่ vendor แจกในแพ็ค ต้องขอรุ่นใหม่จากผู้ให้บริการและทดสอบด้วยบัญชีจริง (ผมเปิด TLS verify ให้แล้ว แต่ไม่ได้แทนที่ SDK)
- เปิด `code_admin_login` (captcha หลังบ้าน) ในหน้าความปลอดภัยถ้าไม่ต้องการพึ่ง 2FA อย่างเดียว — ค่าเริ่มต้นในแพ็คคือปิด
- ตั้ง `TRUST_PROXY` เป็น true **เฉพาะ**เมื่ออยู่หลัง reverse proxy ที่คุณควบคุม (ใช้ตัดสิน IP สำหรับ rate limit)

## รายการปรับปรุงประสิทธิภาพ (รอบที่สี่)

วัดบนเครื่องเดียวกัน PHP 8.3.33 + MySQL 8.4.3 + OPcache เปิดทั้งสองฝั่ง ข้อมูลทดสอบ 300 เรื่อง / 300 ตอน ยิงหน้าเดิม 50 ครั้งต่อหน้า เอาค่ากลาง (p50)

| หน้า | ก่อน (ค่าเริ่มต้นเดิม) | หลัง | ผล |
|---|---|---|---|
| หน้าแรก | 104.0 ms | **24.0 ms** | เร็วขึ้น ~4.3 เท่า |
| หน้านิยาย | 63.8 ms | **5.4 ms** | ~11.8 เท่า |
| อ่านตอน | 29.0 ms | **4.3 ms** | ~6.7 เท่า |
| หมวดหมู่ | 47.4 ms | **4.8 ms** | ~9.9 เท่า |

จำนวน query ต่อหน้า (แคชเย็น): หน้าแรก 108 → **71**, หน้านิยาย 57 → **47**, หมวดหมู่ 34 → **31**

### 1. ประมวลผลเร็วขึ้น

- **OPcache** — หน้าติดตั้ง (step2) รายงานสถานะให้แล้ว และ README แนะนำค่า `opcache.enable=1`, `opcache.validate_timestamps=0` บน production (ต้องรีสตาร์ต PHP-FPM หลังอัปเดตโค้ด)
- **memoize query ซ้ำใน `wmsql::Query`** — query เดียวกัน (รวมค่าที่ bind) ในคำขอเดียวกันคืนผลจาก memory ทันที จำกัด 300 รายการ และ **นับผลว่างด้วย** (เดิม query ที่ไม่พบแถวจะไม่ถูกจำ ทำให้ query เดิมยิงซ้ำได้ถึง 29 ครั้งต่อหน้า)
- **ฟิลด์กำหนดเอง** — เปลี่ยน `FIND_IN_SET` ต่อค่าเป็น `IN (...)` จริง (`array('in-id', ...)`) และระบุคอลัมน์ที่ใช้แทน `SELECT *`
- **`Encrypt()` ออกจากเส้นทางแคช** — ชื่อไฟล์แคชเดิมคำนวณด้วย `md5(Encrypt(...))` ซึ่งวิ่ง RC4 เขียนมือ 256 รอบทุก query ตอนนี้ใช้ `WmCacheKey()` = `md5()` ตรง ๆ
- **ไม่เก็บ SQL list ตอนรันปกติ** — `wmsql::$sqlList` เก็บเฉพาะเมื่อ `DEBUG` หรือ `RUNLOG` เปิด (ลดทั้งเวลาและหน่วยความจำ)
- **`RUNLOG` ปิดเป็นค่าเริ่มต้น** — เดิมเขียนไฟล์ log พร้อม SQL ทุกคำขอ
- **ตัวนับคลิกเป็นคิว** — `wmcms/class/counter.class.php` รวมยอดในไฟล์ แล้วเขียนเป็น `UPDATE` ครั้งเดียวต่อรายการภายในหน้าต่าง 5 วินาที (เดิมเปิดหน้านิยายหนึ่งครั้ง = `UPDATE` หนึ่งครั้งบนตารางหลัก) ทดสอบแล้ว: 5 ครั้งที่เปิดหน้า → 1 `UPDATE`, ตัวเลขบนหน้าจอยัง +1 ทันที และตัวนับรายวัน/สัปดาห์/เดือน/ปี/ทั้งหมดยังรีเซ็ตถูกต้องตามคาบ

### 2. แคช

- **เปิดเป็นค่าเริ่มต้น** — `cache_open=1`, `cache_sql=1`, `cache_time=300`, `cache_sqltime=300` ทั้งใน `web.config.php` และ `install/sql.sql`
- **ล้างไฟล์หมดอายุ** — `cache::Gc()` สุ่มทำงาน ~1% ของคำขอ (ครั้งละไม่เกิน 200 ไฟล์) และเรียกแบบบังคับได้จาก `cron.php`; ทดสอบแล้วไฟล์ที่หมดอายุถูกลบ ไฟล์ที่ยังไม่หมดอายุอยู่ครบ
- **เขียนแบบ atomic** — เขียนไฟล์ชั่วคราวแล้ว `rename()` (fallback เป็น `LOCK_EX` บน Windows) กันคนอ่านไปเจอไฟล์ที่เขียนครึ่งเดียวแล้ว unserialize พัง
- **อ่านถูกกว่าเดิม** — เช็กหมดอายุจากหัวไฟล์ (`explode` จำกัด 3 ชิ้น) และถ้าหมดอายุ/ไม่มีไฟล์ให้คืน `false` ทันที ไม่ต้องเสียเวลาอ่านทั้งไฟล์
- **คีย์แคชหน้า** — เดิมใช้แค่ `PHP_SELF` ตอนนี้เป็น path + **query string + โดเมน + อุปกรณ์** และ **ไม่แคชให้ผู้ใช้ที่ล็อกอิน** (`user_account`) ทั้งอ่านและเขียน
- **memcache/memcached** — เดิมเชื่อมด้วย `Memcache` แต่ตอน get/set เช็ก `memcached` (ชื่อไม่ตรงกัน) ตอนนี้ตรวจคลาสที่ใช้จริงครั้งเดียวแล้วใช้ชื่อนั้นตลอด
- **ล้าง sql cache เมื่อข้อมูลเปลี่ยน** — ทุก `UPDATE/INSERT/DELETE` ที่มีผลกับแถวจะล้างโฟลเดอร์แคชของตารางนั้น (`PurgeTableCache`) และล้าง memo ของคำขอนั้น

### 3. หน่วยความจำ

- ต่อคำขอยังต่ำ (จริง 0.5–3.4 MB, จองสูงสุด 2–6 MB) ไม่ต้องเพิ่ม `memory_limit` เกิน 128 MB
- `admin/page.php` จำกัด `pageSize` ไม่เกิน 200 (เดิมรับค่าจาก request ได้ไม่จำกัด ทำให้ดึงทั้งตารางเข้าหน่วยความจำ)
- `file::GetFile()` ตรวจ encoding จาก 4KB แรก แทนการส่งทั้งบทให้ `mb_detect_encoding`
- session: เพิ่ม `SESSION_EARLY_CLOSE` (ปิดไว้เป็นค่าเริ่มต้น) สำหรับปลดล็อกไฟล์ session เมื่อจบงาน และแนะนำย้าย session ไป Redis ใน README

### ต้องทำเองหลังอัปเดต

- เพิ่ม `cron.php` ใน cron ทุก 1–5 นาที: `curl -s "https://โดเมน/cron.php?key=<api_apikey>"` (ใช้รวมคิวตัวนับและล้างแคชหมดอายุ)
- ตั้งค่า PHP-FPM: `pm=dynamic`, `pm.max_children` ≈ (RAM ว่าง ÷ 40MB), `pm.start_servers` = จำนวน CPU, `pm.max_requests=500`
- เปิด OPcache ตามหัวข้อ 1

## หมายเหตุการติดตั้ง
- PHP ที่รองรับ: **7.2 – 8.5** — ติดตั้งและใช้งานได้จริงบน 7.2.34, 8.3.33, 8.4.14 และ 8.5.6,
  และ `php -l` ผ่านทุกไฟล์บนทั้ง 7.2 / 8.3 / 8.4 / 8.5
- ต้องมี extension: `pdo_mysql`, `mbstring`, `curl`, `gd`, `openssl`, `fileinfo`, `zip`
- ต้องตั้ง `AllowOverride All` ให้ `.htaccess` (Apache) หรือใช้ `nginx.conf.example` (nginx)
  ไม่งั้นไฟล์ `wmcms/config/*`, `cache/*`, `install/sql.sql` จะถูกดาวน์โหลดได้
- ถ้าใช้ Apache ต้องมี `mod_rewrite` + `mod_authz_core` ตามไฟล์ `.htaccess`
- MySQL: ต้องมี `sql_mode` ที่ไม่ใช่ strict — ตัวโปรแกรมตั้ง `SET SESSION sql_mode='NO_ENGINE_SUBSTITUTION'`
  ให้เองทุกครั้งที่เชื่อมต่อ จึงใช้ MySQL 5.7/8.x ได้โดยไม่ต้องแก้ `my.ini`
- ถ้าเคยติดตั้ง 4.446.1257 มาก่อน ให้รัน `upgrade/V4.446.1257-CustomPatch.sql` หนึ่งครั้ง
- หลังติดตั้งเสร็จให้ลบโฟลเดอร์ `install` ด้วย (ไฟล์ `sql.sql` ถูกลบอัตโนมัติแล้ว)

## แปลไทยโดย [SubMaRk](https://naynum.engineer)
### งานแปลนี้ไม่ตรงตามความหมาย 100% เป็นงานแปลเท่าที่สามารถแปลได้ หากพบคำผิด สามารถ Fork หรือ Clone git นี้ไปแก้ไขได้เลยครับ