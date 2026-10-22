<?php
/**
* 小说txt导入模型
*
* @version        $Id: txt.model.php 2019年02月20日 19:17  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class TXTModel
{
	/**
	 * 构造函数
	 */
	function __construct(){}

	
	/**
	 * @param string $type 内容
	 * @param string $type 内容类型是文本还是文件
	 * @param string $type 分割类型
	 * @param string $expStr 分割字符串
	 * @param string $expTitle 自定义章回名字
	 */
	function ExpChapter( $content , $type='file' , $expType='1' , $expStr = '' , $expTitle = '章')
	{
		if( $type == 'file' )
		{
			$content = file::GetFile($content);
		}
		
		if( $expType == 1 || $expType == 3 )
		{
			preg_match_all("/第[0-9零一二两三四五六七八九十百千万]*".$expTitle."\s+[\s\S]*?(?:(?=第[0-9零一二两三四五六七八九十百千万]*".$expTitle."\s+)|$)/i",$content,$matches);
		}
		else
		{
			preg_match_all("/".$expStr."([\s\S]*?(?:(?=".$expStr.")|$))/i",$content,$matche);
			$matches[] = $matche[1];
		}
		return $matches;
	}
}
?>