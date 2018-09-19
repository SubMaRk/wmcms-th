V4.223.430升级到V4.230.442更新包
更新后请更新网站seo设置。

新增【总计7项】：
1.新增API接口添加工具。
2.新增小程序登录API接口设置。
3.微信账号类新增apikey变量。
4.新增处理返回用户信息方法。
5.新增清除api登录数据方法。
6.API登录新增自动绑定。
7.用户模块语言包新增三项提示。

修复【总计12项】：
1.修复模块表类文件bbs的name字段不正确。
2.优化程序打包文件时间条件。
3.后台升级会先删除已经下载的版本，然后下载最新的线上版本。
4.修复评论表情失效问题。
5.修复统计代码标签大括号没有进行转义。
6.修复小说删除提示错误。
7.优化APIlogin集权，获取跳转url类下发到api文件。
8.修复弹窗登录和注册关闭了验证码还是会提示输入验证码。
9.优化api登录的出口和入口文件。
10.修复ReturnData的注释错误。
11.修改小说排行页面的标签名字。
12.修复后台编辑器打开上传图片等出现404，请修改伪静态规则。
将如下：
LINUX：RewriteRule ^(.*?)templates/(.*?).html$ /404.php
WINDOWS：RewriteRule /(.*?)templates/(.*?).html$ /404\.php

LINUX修改为：
RewriteRule ^templates/(.*?).html$ /404.php
RewriteRule ^plugin/(.*?)templates/(.*?).html$ /404.php

WINDOWS修改为：
RewriteRule /templates/(.*?).html$ /404.php
RewriteRule /plugin/(.*?)templates/(.*?).html$ /404.php