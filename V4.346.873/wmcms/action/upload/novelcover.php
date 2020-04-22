<?php
/**
* 用户上传小说封面请求处理
*
* @version        $Id: novelcover.php 2016年12月29日 10:37  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
//是否登录了
str::EQ( $uid , 0 , $lang['upload']['no_login'] );
//是否是作者
$authorMod = NewModel('author.author');
$author = $authorMod->GetAuthor();
if( !$author )
{
	ReturnData($lang['upload']['no_author'] , $ajax);
}

//检查图片的信息
$authorConfig = GetModuleConfig('author');
$imgInfo = img::Info($_FILES[$fileBtnName]['tmp_name']);
if( $imgInfo['width'] > $authorConfig['author_novel_coverwidth'] || $imgInfo['height'] > $authorConfig['author_novel_coverheight'] )
{
	$arr = array('宽'=>$authorConfig['author_novel_coverwidth'] , '高'=>$authorConfig['author_novel_coverheight']);
	$info = tpl::Rep($arr,$lang['upload']['author_cover_size']);
	ReturnData($info , $ajax);
}

//设置模块
$module = 'author';
$type = 'novel_cover';
//设置图片默认描述
$alt = '小说封面上传';
//允许上传类型
$uploadType = 'jpg,jpeg,png,gif';
//剪裁
$uploadCut = 0;
//水印
$waterMark = 0;
//允许上传的大小
$uploadSize = '512';


//回调插入封面申请记录
$status = $authorConfig['author_novel_uploadcover'];
function CallBack($result)
{
	global $lang,$status,$uid;
	$applyMod = NewModel('system.apply' , 'author');
	
	$data['apply_module'] = 'author';
	$data['apply_type'] = 'novel_cover';
	$data['apply_status'] = $status;
	$data['apply_uid'] = $uid;
	$data['apply_cid'] = str::Int(Request('cid'));
	$data['apply_remark'] = $lang['upload']['author_cover_reamrk_'.$status];
	//需要保存的数据
	$data['apply_option']['file'] = $result['file'];
	$applyMod->Insert($data , 0);
}

//如果封面是人工审核就设置返回提示语言
if( $status == '0' )
{
	$lang['upload']['operate']['upload']['success'] = $lang['upload']['author_cover_info_0'];
}
?>