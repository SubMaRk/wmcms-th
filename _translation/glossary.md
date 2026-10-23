# WMCMS Thai translation — glossary and rules

## Hard rules

1. Translate **only** human-readable text. Never change: PHP code, `$lang[...]` keys, array keys, HTML tags, attribute names, attribute values that are code (class/id/href/src/name/value/onclick/data-*), template placeholders in braces `{...}`, template tag names, `%s`, `%d`, `@`, `|` separators, numbers, URLs, file names.
2. Keep the exact number of placeholders. `{小说名字}` becomes `{ชื่อนิยาย}` ONLY when inside a translated natural-language sentence — if the whole string is a placeholder (e.g. `{小说名字}`, `{推荐小说:首页推荐=是;数量=10}`), leave it untouched.
3. Keep HTML entities (`&nbsp;`, `&raquo;`) and self-closing tags as-is.
4. Thai has no spaces between words in normal prose; use a space only between clauses or before/after numbers and Latin words.
5. Never invent features. Translate meaning, not word-by-word.
6. Preserve trailing/leading punctuation style (。！？ become . ! ?), and keep line breaks where the original had them.
7. Do not add or remove entries. Output must cover every input line.

## Glossary (use exactly these terms)

| Chinese | Thai |
|---|---|
| 网站 / 站 | เว็บไซต์ |
| 首页 | หน้าแรก |
| 后台 | หลังบ้าน |
| 前台 | หน้าเว็บ |
| 小说 | นิยาย |
| 章节 | ตอน |
| 卷 | เล่ม |
| 目录 | สารบัญ |
| 分类 | หมวดหมู่ |
| 类型 | ประเภท |
| 作者 | ผู้แต่ง |
| 用户 | ผู้ใช้ |
| 会员 | สมาชิก |
| 管理员 | ผู้ดูแลระบบ |
| 评论 | ความคิดเห็น |
| 回复 | ตอบกลับ |
| 收藏 | รายการโปรด |
| 推荐 | แนะนำ |
| 点击 | คลิก |
| 浏览 / 浏览量 | ยอดเข้าชม |
| 人气 | ความนิยม |
| 字数 | จำนวนคำ |
| 状态 | สถานะ |
| 审核 | ตรวจสอบ |
| 添加 / 新增 / 增加 | เพิ่ม |
| 编辑 / 修改 | แก้ไข |
| 删除 | ลบ |
| 列表 | รายการ |
| 管理 | จัดการ |
| 设置 / 配置 | ตั้งค่า |
| 保存 | บันทึก |
| 提交 | ส่งข้อมูล |
| 搜索 | ค้นหา |
| 排序 | เรียงลำดับ |
| 分页 | แบ่งหน้า |
| 上传 | อัปโหลด |
| 下载 | ดาวน์โหลด |
| 模板 / 模版 | เทมเพลต |
| 登录 | เข้าสู่ระบบ |
| 退出 | ออกจากระบบ |
| 注册 | สมัครสมาชิก |
| 密码 | รหัสผ่าน |
| 账号 | บัญชี |
| 邮箱 | อีเมล |
| 手机 | มือถือ |
| 验证码 | รหัสยืนยัน |
| 权限 | สิทธิ์ |
| 金币 | เหรียญ |
| 充值 | เติมเงิน |
| 订单 | คำสั่งซื้อ |
| 提现 | ถอนเงิน |
| 插件 | ปลั๊กอิน |
| 模块 | โมดูล |
| 缓存 | แคช |
| 数据库 | ฐานข้อมูล |
| 备份 | สำรองข้อมูล |
| 水印 | ลายน้ำ |
| 图片 | รูปภาพ |
| 视频 | วิดีโอ |
| 标签 | แท็ก |
| 专题 | หัวข้อพิเศษ |
| 文章 | บทความ |
| 论坛 | ฟอรัม |
| 留言 | ข้อความ |
| 友链 | ลิงก์เพื่อน |
| 单页 | หน้าเดียว |
| 应用 | แอป |
| 原创 | ต้นฉบับ |
| 签约 | เซ็นสัญญา |
| 推荐票 | โหวตแนะนำ |
| 月票 | โหวตรายเดือน |
| 书架 | ชั้นหนังสือ |
| 阅读 | อ่าน |
| 连载 | กำลังเขียน |
| 完结 | จบแล้ว |
| 免费 | ฟรี |
| 收费 / 付费 | เสียเงิน |
| 版权 | ลิขสิทธิ์ |
| 简介 | เรื่องย่อ |
| 封面 | ปก |
| 最新 | ล่าสุด |
| 热门 | ยอดนิยม |
| 全部 | ทั้งหมด |
| 成功 | สำเร็จ |
| 失败 | ล้มเหลว |
| 对不起 | ขออภัย |
| 恭喜 | ยินดีด้วย |
| 不存在 | ไม่พบ |
| 不能为空 | ห้ามว่าง |
| 请稍候 / 请稍等 | กรุณารอสักครู่ |
| 提交成功 | ส่งข้อมูลสำเร็จ |
| 操作成功 | ดำเนินการสำเร็จ |
| 操作失败 | ดำเนินการไม่สำเร็จ |
| 确定 | ยืนยัน |
| 取消 | ยกเลิก |
| 关闭 | ปิด |
| 开启 / 打开 | เปิด |
| 显示 | แสดง |
| 隐藏 | ซ่อน |
| 名称 | ชื่อ |
| 标题 | หัวข้อ |
| 内容 | เนื้อหา |
| 时间 | เวลา |
| 日期 | วันที่ |
| 数量 | จำนวน |
| 大小 | ขนาด |
| 地址 | ที่อยู่ |
| 域名 | โดเมน |
| 文件名 | ชื่อไฟล์ |
| 路径 | พาธ |
| 版本 | เวอร์ชัน |
| 语言 | ภาษา |
| 提示 | คำแนะนำ |
| 注意 | หมายเหตุ |
| 暂无数据 | ยังไม่มีข้อมูล |
| 请选择 | กรุณาเลือก |
| 请输入 | กรุณากรอก |
| 是否 | ใช่หรือไม่ |
| 确认删除 | ยืนยันการลบ |
