<?php
/**
* 下载模型
*
* @version        $Id: down.model.php 2017年4月28日 10:11  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class DownModel
{
	public $table = '@upload';
	
	/**
	 * 构造函数
	 */
	function __construct()
	{
	}
	
	
	/**
	 * 获得下载内容的信息
	 * @param 参数1，选填，所属的模块
	 * @param 参数2，选填，模块内容id
	 * @param 参数3，选填，下载的文件id
	 * @param 参数4，选填，是否生成文件
	 */
	function GetDownInfo( $module = '' , $cid = 0 , $fid = 0 , $isCreate = '0' )
	{
		$info = array();
		if( $fid > 0 )
		{
			$uploadMod = NewModel('upload.upload');
			$data = $uploadMod->GetOne($fid);
			$info['name'] = $data['upload_alt'];
			$info['file'] = WMROOT.$data['upload_img'];
		}
		else
		{
			global $tableSer;
			$data = $tableSer->GetData($module,$cid);
			switch ($module)
			{
				//小说模块
				case 'novel':
					$chapterMod = NewModel('novel.chapter');
					$info['name'] = $data['novel_name'];
					if( $data && $data['novel_path'] != '' && file_exists(WMROOT.$data['novel_path']) )
					{
						$info['file'] = WMROOT.$data['novel_path'];
					}
					else
					{
						$info['file'] = $chapterMod->GetNovelFileName($data['type_id'],$data['novel_id']);
					}
					//小说是已经开始写作了的。并且是生成txt
					if( $isCreate == '1' && $data['novel_chapter'] > 0 && $chapterMod->GetConfig('data_type') == '1')
					{
						$chapterMod->UpdateNovel($info['file'],$data);
					}
					break;
			}
		}

		if( $data  )
		{
			//判断是否是本地文件
			$info['is_local'] = true;
			//如果是url就设置不是本地文件
			if ( str::CheckUrl( $info['file']) )
			{
				$info['is_local'] = false;
			}
			$info['file_name'] = basename($info['file']);
			list($name,$info['ext']) = explode('.', $info['file_name']);
			return $info;
		}
		else
		{
			return false;
		}
	}
	

	/**
	 * 加密下载参数
	 * @param 参数1，选填，所属的模块
	 * @param 参数2，选填，模块内容id
	 * @param 参数3，选填，下载的文件id
	 */
	function E($module='', $cid='' , $fid='')
	{
		$time = time();
		Session('down_time',$time);
		return urlencode(str::Encrypt( $module.'|||'.$cid.'|||'.$fid , 'E' , $time.C('config.api.system.api_apikey')));
	}
	/**
	 * 解密下载参数
	 * @param 参数1，必须，需要解密的字符串
	 */
	function D($str)
	{
		$data = array();
		$time = Session('down_time');
		$str = str::Encrypt( $str , 'D' , $time.C('config.api.system.api_apikey'));
		@list($data['module'],$data['cid'],$data['fid']) = explode('|||', $str);
		return $data;
	}
}
?>