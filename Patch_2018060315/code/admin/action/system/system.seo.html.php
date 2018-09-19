<?php
/**
* 静态文件生成处理器
*
* @version        $Id: system.seo.html.php 2017年2月13日 23:47  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$httpSer = NewClass('http');
$domain = DOMAIN;
//设置不是为html
tpl::SetIsHtml(0);
		
//检查是否是静态的路径
function pathIsHtml($url)
{
	if( str_replace('.php', '', $url) != $url )
	{
		Ajax('对不起，当前链接没有设置伪静态的保存路径' , 300);
	}
	return $url;
}

//生成首页
if ( $type == 'index' )
{
	$id = $C['config']['web']['tpmark'.Request('id')];
	
	if( $module == '' || $id == '' )
	{
		Ajax('参数错误!',300);
	}
	else
	{
		$urlType = 'index';
		if( $module != 'index')
		{
			$urlType = $module.'_index';
		}
		$url = @$C['config']['seo']['urls'][$urlType]['url1'];
		$path = @$C['config']['seo']['urls'][$urlType]['url2'];
		if($url == '' || $path == '' )
		{
			Ajax('对不起，当前分类首页不存在！');
		}
		else
		{
			$url = str_replace('{pt}', $id, $url);
			$path = pathIsHtml(tpl::PtRep($path , $id));
			if( Request('id')=='4' && $module == 'index')
			{
				$path = '/index.html';
			}
			if( $module == 'novel' )
			{
				for($i=0;$i<3;$i++)
				{
					$tpArr = array('','boy','girl');
					$newUrl = str_replace('{tp}', $tpArr[$i], $url);
					$newPath = str_replace('{tp}', $tpArr[$i], $path);
					$html = $httpSer->GetUrl($domain.$newUrl);
					file::CreateFile(WMROOT.$newPath, $html , 1);
				}
				$path = $newPath;
			}else{
				$html = $httpSer->GetUrl($domain.$url);
				file::CreateFile(WMROOT.$path, $html , 1);
			}
			Ajax($path.'生成成功！');
		}
	}
}
//根据模块获取分类
else if ( $type == 'gettype' )
{
	if( $module == '' )
	{
		$data[] = array('type_id'=>0,'type_topid'=>0,'type_pid'=>0,'type_name'=>'对不起，请选择模块');
		Ajax('获取成功' , 200 , $data);
	}
	else
	{
		$wheresql['table'] = '@'.$module.'_type';
		$wheresql['field'] = 'type_id,type_topid,type_pid,type_name';
		$wheresql['order'] = 'type_order';
		if( $module == 'article' )
		{
			$wheresql['where']['type_status'] = 1;
		}
		$data = wmsql::GetAll($wheresql);

		Ajax('获取成功' , 200 , $data);
	}
}
//生成内容html初始化操作
else if( $type == 'content' && $step == 'init')
{
	$child = Post('child');
	if( Request('module') == '' )
	{
		Ajax('请选择模块!' , 300);
	}
	$cTable = $tableSer->tableArr[$module]['table'];
	$cidName = $tableSer->tableArr[$module]['id'];
	$timeName = $tableSer->tableArr[$module]['time'];
	$cPYName = @$tableSer->tableArr[$module]['pinyin'];
	$tTable = $tableSer->tableArr[$module.'type']['table'];
	$tidName = $tableSer->tableArr[$module.'type']['id'];
	$pidName = $tableSer->tableArr[$module.'type']['pid'];
	$tPYName = $tableSer->tableArr[$module.'type']['pinyin'];
	$cPYField = $tPYField = '';
	if( $cPYName != '' )
	{
		$cPYField = ','.$cPYName.' as cpinyin';
	}
	if( $tPYName != '' )
	{
		$tPYField = ','.$tPYName.' as tpinyin';
	}
	
	$wheresql['table'] = $cTable.' as c';
	$wheresql['field'] = 't.'.$tidName.' as tid,'.$cidName.' as cid'.$cPYField.$tPYField;
	$wheresql['left'][$tTable.' as t'] = 't.'.$tidName.' = c.'.$tidName;
	if( $pagetype == 'read' )
	{
		$wheresql['field'] .= ',chapter_id as rid';
		$wheresql['left']['@novel_chapter as r'] = 'chapter_nid = '.$cidName;
		$wheresql['where']['chapter_id'] = array('>',0);
		$cidName = 'chapter_id';
		$timeName = 'chapter_time';
	}
	if( $module == 'article' )
	{
		$wheresql['where']['article_display'] = 1;
	}
	
	if( $tid != '0' && $child == '1')
	{
		$wheresql['where'][$cidName] = array('string',"(FIND_IN_SET({$tid},t.{$pidName})) or t.{$tidName}={$tid}");
	}
	else if( $tid != '0')
	{
		$wheresql['where']['t.'.$tidName] = $tid;
	}
	
	//id查询条件
	if( $where == 'id' )
	{
		//如果结束id等于0就指定id生成
		if( $endid == '0' )
		{
			$wheresql['where'][$cidName] = $startid;
		}
		else
		{
			$wheresql['where'][$cidName] = array('between',$startid.','.$endid);
		}
	}
	//时间查询条件
	if( $where == 'time' )
	{
		$starttime = strtotime($starttime);
		$endtime = strtotime($endtime);
		$wheresql['where'][$timeName] = array('between',$starttime.','.$endtime);
	}
	$data = wmsql::GetAll($wheresql);
	if( $data )
	{
		Ajax('初始化成功！' , 200 , $data , count($data));
	}
	else
	{
		Ajax('没有需要生成的数据!' , 300);
	}
}
//生成内容html操作
else if( $type == 'content' && $step == 'create')
{
	if( Request('module') == '' || Request('tid') == '')
	{
		Ajax('参数错误!' , 300);
	}
	//默认html保存路径
	$htmlPath = @$C['config']['seo']['htmls'][$module][$tid]['content']['path4'];
	//阅读保存
	if($pagetype == 'read')
	{
		$htmlPath = @$C['config']['seo']['htmls'][$module][$tid]['read']['path4'];
	}
	
	
	if( $htmlPath == '' )
	{
		Ajax('当前分类没有设置内容HTML保存路径!');
	}
	else
	{
		$par = array('pid'=>$cid,'nid'=>$cid,'aid'=>$cid,'tid'=>$tid,'cid'=>@$rid,'tpinyin'=>$tpinyin,'apinyin'=>@$cpinyin,'npinyin'=>@$cpinyin);
		$urlType = $module.'_'.$module;
		switch ($module)
		{
			case "novel":
				$urlType = 'novel_info';
				if($pagetype == 'read')
				{
					$urlType = 'novel_read';
				}
				break;
			default:
				break;
		}
		$htmlPath = tpl::Rep($par , $htmlPath);
		$url = tpl::url( $urlType , $par , 1);

		$html = $httpSer->GetUrl($domain.$url);
		file::CreateFile(WMROOT.$htmlPath, $html , 1);

		if($pagetype == 'read')
		{
			Ajax('ID：'.$rid.'生成成功！');
		}
		else
		{
			Ajax('ID：'.$cid.'生成成功！');
		}
	}
}
//生成列表html初始化操作
else if( $type == 'list' && $step == 'init')
{
	if( Request('module') == '' )
	{
		Ajax('请选择模块!' , 300);
	}
	$child = Post('child');
	$all = Post('all');
	$tTable = $tableSer->tableArr[$module.'type']['table'];
	$tidName = $tableSer->tableArr[$module.'type']['id'];
	$pidName = $tableSer->tableArr[$module.'type']['pid'];
	$tPYName = $tableSer->tableArr[$module.'type']['pinyin'];
	if( $tPYName != '' )
	{
		$tPYField = ','.$tPYName;
	}
	$cTable = $tableSer->tableArr[$module]['table'];
	
	$wheresql['table'] = $tTable;
	$wheresql['field'] = 'type_id,type_tempid'.$tPYField;
	if( $tid != '0' && $child == '1')
	{
		$wheresql['where'][$tidName] = array('string',"(FIND_IN_SET({$tid},{$pidName})) or {$tidName}={$tid}");
	}
	else if( $tid != '0')
	{
		$wheresql['where'][$tidName] = $tid;
	}
	if( $module == 'article' )
	{
		$wheresql['where']['type_status'] = 1;
	}
	
	$data = wmsql::GetAll($wheresql);
	//加入一个全部分类
	if( $all == '1' )
	{
		$data[] = array(
			$tidName =>'0',
			$tPYName =>'all',
			'type_tempid'=>0
		);
	}
	if( $data )
	{
		//每页数量
		$pageCount = 1;
		$count = 1;
		
		//引入模块分类
		NewModuleClass($module);
		//引入模版服务
		$tempSer = AdminNewClass('system.templates');
		//列表页标签
		switch ($module)
		{
			case 'article':
				$listLabel = '文章列表';
				break;
			case 'novel':
				$listLabel = '小说列表';
				break;
			case 'picture':
				$listLabel = '图集列表';
				break;
		}
		
		foreach ($data as $k=>$v)
		{
			$tempId = $v['type_tempid'];
			if($tempId > 0)
			{
				$tempFile = $tempSer->GetTemp($tempId , 'temp_temp4');
			}
			else
			{
				$tempFile = WMTEMPLATE.$C['config']['web']['tp'.Request('id')].'/'.$module.'/type.html';
			}
			//打开模版文件
			$tempCode = file::GetFile($tempFile);
			if( $tempCode != '' )
			{
				//获得分类的标签
				if( $listLabel != '' )
				{
					$labelArr = tpl::Tag('{'.$listLabel.':[s]}[a]{/'.$listLabel.'}', $tempCode);
					//获得条件
					$where = $module::GetWhere(@$labelArr[1][0]);
					$where['table'] = $cTable.' as c';
					$where['left'][$tTable.' as t'] = 't.'.$tidName.' = c.'.$tidName;
					if(@$labelArr[1][0]!= '')
					{
						if( $v[$tidName] > 0 )
						{
							$where['where']['type_pid'] = array('and-or',array('rin',$tid),array('t.'.$tidName=>$tid));
						}
						if( $where['limit'] != '' )
						{
							list($a,$pageCount) = explode(',', $where['limit']);
							unset($where['order']);
							unset($where['limit']);
						}
						$count = wmsql::GetCount($where);
					}
					else
					{
						$count = $pageCount = '1';
					}
				}
				$pageSum = ceil(($count)/$pageCount);
				if( $pageSum == 0 )
				{
					$pageSum = 1;
				}
				else if($page <= $pageSum && $page != 0)
				{
					$pageSum = intval($page);
				}
				$newData[] = array(
					'tid'=>$v[$tidName],
					'tpinyin'=>$v[$tPYName],
					'page'=>$pageSum,
				);
			}
		}
		Ajax('初始化成功！' , 200 , $newData , count($newData));
	}
	else
	{
		Ajax('没有需要生成的数据!' , 300);
	}
}
//生成列表html操作
else if( $type == 'list' && $step == 'create')
{
	if( Request('module') == '' || Request('tid') == '')
	{
		Ajax('参数错误!' , 300);
	}
	
	//html保存路径
	if( $tid == 0)
	{
		$htmlPath = @current($C['config']['seo']['htmls'][$module]);
		$htmlPath = @$htmlPath['list']['path4'];
	}
	else
	{
		$htmlPath = @$C['config']['seo']['htmls'][$module][$tid]['list']['path4'];
	}
	
	//判断保存路径是否为空
	if( $htmlPath == '' )
	{
		Ajax('当前分类没有设置列表HTML保存路径!');
	}
	else
	{
		$par = array('tid'=>$tid,'tpinyin'=>$tpinyin,'page'=>$page);
		$htmlPath = tpl::Rep($par , $htmlPath);

		$urlType = $module.'_type';
		$url = tpl::url( $urlType , $par , 1);
		$html = $httpSer->GetUrl($domain.$url);
		file::CreateFile(WMROOT.$htmlPath, $html , 1);
		Ajax('分类ID：'.$tid.'第'.$page.'页生成成功！');
	}
}
//生成分类首页html初始化操作
else if( $type == 'tindex' && $step == 'init')
{
	if( Request('module') == '' )
	{
		Ajax('请选择模块!' , 300);
	}
	$child = Post('child');
	$tTable = $tableSer->tableArr[$module.'type']['table'];
	$tidName = $tableSer->tableArr[$module.'type']['id'];
	$pidName = $tableSer->tableArr[$module.'type']['pid'];

	$wheresql['table'] = $tTable;
	$wheresql['field'] = 'type_pinyin,type_id,type_tempid';
	if( $tid != '0' && $child == '1')
	{
		$wheresql['where'][$tidName] = array('string',"(FIND_IN_SET({$tid},{$pidName})) or {$tidName}={$tid}");
	}
	else if( $tid != '0')
	{
		$wheresql['where'][$tidName] = $tid;
	}
	$data = wmsql::GetAll($wheresql);
	if( $data )
	{
		foreach ($data as $k=>$v)
		{
			$newData[] = array(
				'tid'=>$v['type_id'],
				'tpinyin'=>$v['type_pinyin'],
			);
		}
		Ajax('初始化成功！' , 200 , $newData , count($data));
	}
	else
	{
		Ajax('没有需要生成的数据!' , 300);
	}
}
//生成分类首页html操作
else if( $type == 'tindex' && $step == 'create')
{
	if( Request('module') == '' || Request('tid') == '')
	{
		Ajax('参数错误!' , 300);
	}
	$htmlPath = @$C['config']['seo']['htmls'][$module][$tid]['tindex']['path4'];
	if( $htmlPath == '' )
	{
		Ajax('当前分类没有设置列表HTML保存路径!');
	}
	else
	{
		$par = array('tid'=>$tid,'tpinyin'=>$tpinyin);
		$htmlPath = tpl::Rep($par , $htmlPath);
		$pageType = $module.'_tindex';
		switch ($module)
		{
			default:
				break;
		}
		$url = tpl::url( $pageType , $par , 1);

		$html = $httpSer->GetUrl($domain.$url);
		file::CreateFile(WMROOT.$htmlPath, $html , 1);
		Ajax('分类ID：'.$tid.'的分类首页生成成功！');
	}
}
//生成目录列表html初始化操作
else if( $type == 'menu' && $step == 'init')
{
	if( Request('module') == '' )
	{
		Ajax('请选择模块!' , 300);
	}
	$child = Post('child');
	$tTable = $tableSer->tableArr[$module.'type']['table'];
	$tidName = $tableSer->tableArr[$module.'type']['id'];
	$pidName = $tableSer->tableArr[$module.'type']['pid'];
	$tPYName = $tableSer->tableArr[$module.'type']['pinyin'];
	if( $tPYName != '' )
	{
		$tPYField = ','.$tPYName;
	}
	$cTable = $tableSer->tableArr[$module]['table'];
	
	$wheresql['table'] = $tTable;
	$wheresql['field'] = 'type_id,type_tempid'.$tPYField;
	if( $tid != '0' && $child == '1')
	{
		$wheresql['where'][$tidName] = array('string',"(FIND_IN_SET({$tid},{$pidName})) or {$tidName}={$tid}");
	}
	else if( $tid != '0')
	{
		$wheresql['where'][$tidName] = $tid;
	}
	$data = wmsql::GetAll($wheresql);
	if( $data )
	{
		$pageCount = '';
		//引入模块分类
		NewModuleClass($module);
		//引入模版服务
		$tempSer = AdminNewClass('system.templates');
		foreach ($data as $k=>$v)
		{
			$tempId = $v['type_mtempid'];
			if($tempId > 0)
			{
				$tempFile = WMROOT.$tempSer->GetTemp($tempId , 'temp_temp4');
			}
			else
			{
				$tempFile = '/'.$module.'/menu.html';
				switch ($module)
				{
					case 'novel':
						$listLabel = '小说章节列表';
						break;
				}
				
				$tempFile = WMTEMPLATE.$C['config']['web']['tp'.Request('id')].$tempFile;
			}
			//打开模版文件
			$tempCode = file::GetFile($tempFile);
			if( $tempCode != '' )
			{
				//获得当前分类的所有小说
				$where['table'] = '@novel_novel as n';
				$where['field'] = 'novel_id,novel_pinyin';
				$where['left']['@novel_chapter as c'] = 'novel_id = chapter_nid';
				$where['left']['@novel_type as t'] = 'n.type_id = t.type_id';
				$where['where']['n.type_id'] = $v['type_id'];
				$where['group'] = 'novel_id';
				$novelData = wmsql::GetAll($where);
				if( $novelData )
				{
					//获得分类的标签
					$labelArr = tpl::Tag('{'.$listLabel.':[s]}[a]{/'.$listLabel.'}', $tempCode);
					//获得条件
					$where = $module::GetWhere($labelArr[1][0]);
					if( $where['limit'] != '' )
					{
						list($a,$pageCount) = explode(',', $where['limit']);
						unset($where['order']);
						unset($where['limit']);
					}
					$pageSum=1;
					foreach ($novelData as $k1=>$v1)
					{
						$chapterWhere['table'] = '@novel_chapter';
						$chapterWhere['field'] = 'chapter_id';
						$chapterWhere['where']['chapter_nid'] = $v1['novel_id'];
						$chapterWhere['where']['chapter_status'] = 1;
						if( $pageCount != '' )
						{
							$pageSum = ceil(wmsql::GetCount($chapterWhere)/$pageCount);
						}
						$menuData[] = array('cid'=>$v1['novel_id'],'cpinyin'=>$v1['novel_pinyin'],'page'=>$pageSum);
					}
					$newData[] = array(
						'tid'=>$v[$tidName],
						'tpinyin'=>$v[$tPYName],
						'menu'=>$menuData,
					);
					$menuData = '';
				}
			}
		}
		Ajax('初始化成功！' , 200 , $newData , count($newData));
	}
	else
	{
		Ajax('没有需要生成的数据!' , 300);
	}
}
//生成目录列表html操作
else if( $type == 'menu' && $step == 'create')
{
	if( Request('module') == '' || Request('tid') == '')
	{
		Ajax('参数错误!' , 300);
	}
	
	//html保存路径
	if( $tid == 0)
	{
		$htmlPath = @current($C['config']['seo']['htmls'][$module]);
		$htmlPath = @$htmlPath['menu']['path4'];
	}
	else
	{
		$htmlPath = @$C['config']['seo']['htmls'][$module][$tid]['menu']['path4'];
	}
	
	//判断保存路径是否为空
	if( $htmlPath == '' )
	{
		Ajax('当前分类没有设置目录HTML保存路径!');
	}
	else
	{
		$par = array('tid'=>$tid,'tpinyin'=>$tpinyin,'nid'=>$cid,'npinyin'=>$cpinyin,'page'=>$page);
		$htmlPath = tpl::Rep($par , $htmlPath);

		$urlType = $module.'_menu';
		$url = tpl::url( $urlType , $par , 1);

		$html = $httpSer->GetUrl($domain.$url);
		file::CreateFile(WMROOT.$htmlPath, $html , 1);
		Ajax('内容ID：'.$cid.'第'.$page.'页生成成功！');
	}
}
?>