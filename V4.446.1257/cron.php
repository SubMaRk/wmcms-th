<?php
/**
* 定时任务入口
*
* 建议由系统 cron 每 1-5 分钟调用一次：
*   * /1 * * * * curl -s "http://你的域名/cron.php?key=密钥" > /dev/null
*
* 做三件事：
*  1. 合并计数器队列（点击/推荐/收藏）到数据库
*  2. 清理过期的页面与 sql 缓存文件
*  3. 输出处理结果，方便手动排查
*
* @package        WMCMS
*/
$C['module']['inc']['class'] = array('file','str');
//定时任务不需要页面缓存，也不需要访问统计
$siteCache = false;
require_once __DIR__.'/wmcms/inc/common.inc.php';

header('Content-Type: text/plain; charset=utf-8');

//密钥与站点 api_appid 绑定：知道域名的人依然无法触发重建
$key = C('config.api.system.api_apikey');
$inKey = isset($_GET['key']) ? (string)$_GET['key'] : '';
$isCli = ( php_sapi_name() == 'cli' );
if( !$isCli && ( $inKey == '' || !hash_equals((string)$key, $inKey) ) )
{
	header('HTTP/1.1 403 Forbidden');
	die('forbidden');
}

$startTime = microtime(true);
$counterSer = NewClass('counter');
$flushed = $counterSer ? $counterSer->Flush('' , true) : 0;
$cacheSer = new cache();
$deleted = $cacheSer->Gc(2000 , true);

echo 'counter rows merged: '.$flushed."\n";
echo 'expired cache files removed: '.$deleted."\n";
echo 'elapsed: '.round((microtime(true)-$startTime)*1000)." ms\n";
