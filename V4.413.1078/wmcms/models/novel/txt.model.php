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
	 * 
	 * @param string $type
	 * @param string $type
	 * @param string $expStr
	 */
	function ExpChapter( $content , $type='file' , $expType='1' , $expStr = '' )
	{
		if( $type == 'file' )
		{
			$content = file::GetFile($content);
		}
		
		if( $expType == 1 )
		{
			preg_match_all("/第[0-9零一二两三四五六七八九十百千万]*章\s+[\s\S]*?(?:(?=第[0-9零一二两三四五六七八九十百千万]*章\s+)|$)/i",$content,$matches);
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