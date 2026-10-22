<?php
/**
* 获得推荐的标签
*
* @version        $Id: get_rec_tags.php 2022年04月01日 20:34  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
if(!defined('WMINC')){ exit("dont alone open!"); }

$nid = str::Int(Request('nid'));
$module = str::IsEmpty(Request('module'),$lang['author']['tags_module_err']);
$novelMod = NewModel('novel.novel');
$tagsMod = NewModel('system.tags');
$where = array();
$tagList = array();
$tags = array();
$contentTag = '';

//如果是小说模块
if( $module == 'novel' )
{
    $where['novel_id'] = $nid;
    $where['author_id'] = $author['author_id'];
}

//模块不存在
if( empty($where) )
{
    $info =  $lang['author']['tags_module_err'];
}
else
{
    $code = 200;
    $content = $tableSer->GetData( $module , $where );
    if( $content )
    {
        $contentTag = $content[$tableSer->tableArr[$module]['tag']];
        $tags = explode(',',$contentTag);
        $tagsMod->SetTags($module,$contentTag);
    }
    //获得推荐标签
    $tagWhere['where']['tags_module'] = $module;
    $tagWhere['where']['tags_author_rec'] = 1;
    $tagWhere['where']['tags_id'] = array('string',"1=1 or (FIND_IN_SET(tags_name,'{$contentTag}'))");
    $tagData = $tagsMod->GetAll($tagWhere);
    if( $tagData )
    {
        foreach ($tagData as $v)
        {
            $select = 0;
            if( in_array($v['tags_name'],$tags) )
            {
                $select = 1;
            }
            $data[] = array('tags_name'=>$v['tags_name'],'select'=>$select);
        }
    }
	$info = $lang['system']['operate']['success'];
}
ReturnData($info , $ajax , $code , $data);
?>