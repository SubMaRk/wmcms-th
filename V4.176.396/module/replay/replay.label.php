<?php
/**
* 评论标签处理文件
*
* @version        $Id: replay.label.php 2015年8月9日 21:43  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @update 		  2015年12月28日 16:07
*
*/
class replaylabel extends replay
{	
	function __construct()
	{
		//数组键：类名，值：方法名
		$CF['replay'] = 'GetData';
		
		$repFun['t']['replaylabel'] = 'PublicLabel';
		tpl::Label('{评论:[s]}[a]{/评论}', null , $CF, $repFun['t']);
		tpl::Label('{评论列表:[s]}[a]{/评论列表}', null , $CF, $repFun['t']);
		
		$nickname = parent::$replayConfig['nickname'];
		if( class_exists('user') && user::GetNickname() !== false)
		{
			$nickname = user::GetNickname();
		}
		
		//固定标签替换
		$arr = array(
			'评论框标题'=>parent::$replayConfig['boxname'],
			'评论无数据提示'=>parent::$replayConfig['no_data'],
			'评论输入框提示'=>parent::$replayConfig['input'],
			'评论人数'=>parent::$sum,
			'评论数量'=>parent::$count,
			'评论列表'=>tpl::Rep( array('page'=>1) , parent::$url),
			'评论提交地址'=>'/wmcms/action/index.php?action=replay.add',
			'评论提交昵称'=>$nickname,
			'评论隐藏表单'=>'<input type="hidden" name="module" value="'.parent::$module.'"><input type="hidden" name="cid" value="'.parent::$cid.'">',
		);
		
		$replayCode = '';
		if( str::in_string('{发表评论验证码}') )
		{
			$replayCode = $arr['发表评论验证码'] = FormCodeCreate('code_replay');
		}
		if( str::in_string('{js评论}') )
		{
			if($replayCode == '' )
			{
				$replayCode = FormCodeCreate('code_replay');
			}
			$arr['js评论']="<div id='wmcms_replay_code_form' style='display:none'>".$replayCode."</div><script type=\"text/javascript\">\r\nvar codeOpen = '".C('config.web.code_replay')."';\r\nvar token = '".FormTokenCreate(true)."';\r\nvar cid=".parent::$cid.";\r\nvar replaysum=".parent::$count.";\r\nvar module='".parent::$module."';\r\n</script>\r\n<script charset=\"utf-8\" type=\"text/javascript\" src=\"/files/js/replay/replay.js\"></script>\r\n";
		}
		tpl::Rep($arr);

		//发表评论验证码
		tpl::IfRep( C('config.web.code_replay') , '=' , 1 , '发表评论验证码开启');
		
		//更多标签替换
		$this->More();
	}

	/**
	 * 评论标签替换
	 * @param 参数1，必须，数据
	 * @param 参数2，必须，模版字符
	 */
	static function PublicLabel( $data , $blcode )
	{
		$code = '';
		$page =  C('page.page');
		$pageCount =  C('page.page_count');
		if ( $page > 0 )
		{
			$i = ($page - 1) * $pageCount + 1;
		}
		else
		{
			$i = 1;
		}
		//循环数据
		foreach ($data as $k => $v)
		{
			//没组数据循环，以字段名为标签名
			foreach ($v as $key => $val)
			{
				$arr1[L.$key]=$v[$key];
			}
			//每次循环重新调取原始标签
			$lcode = $blcode;
				
			//计数器标签和选中标签替换
			$lcode = tpl::I( $lcode , $i );
			
			//匹配自定义时间标签
			$time = tpl::Tag('{评论时间:[s]}',$lcode);
			
			
			switch ( $v['replay_uid'] )
			{
				case '0':
					$v['user_name'] = '';
					$v['user_nickname'] = parent::$replayConfig['nickname'];
					$v['user_head'] = C('default_head',null,'userConfig');
					$url = 'javascript:void(0);';
					break;
					
				default:
					$url = tpl::Url( 'user_fhome' , array( 'uid'=>$v['replay_uid'] ) );
					break;
			}
			
			//顶踩连接
			$urlData['module'] = 'replay';
			$urlData['cid'] = $v['replay_id'];
		
			//楼层
			$floor = $v['replay_floor'].parent::$replayConfig['replay_floor_name'];
			if( $v['replay_floor'] <= count(self::$floorArr) )
			{
				$floor = @parent::$floorArr[$v['replay_floor']-1];
			}

			//设置自定义中文标签
			$arr2 = array(
				'i'=>$i,
				'评论楼号'=>$v['replay_floor'],
				'评论楼层'=>$floor,
				'url'=>$url,
				'评论id'=>$v['replay_id'],
				'评论顶'=>$v['replay_ding'],
				'评论踩'=>$v['replay_cai'],
				'评论内容'=>$v['replay_content'],
				'评论用户名'=>$v['user_name'],
				'评论用户id'=>$v['replay_uid'],
				'评论用户昵称'=>$v['user_nickname'],
				'评论用户性别码'=>$v['user_sex'],
				'评论用户头像'=>$v['user_head'],
				'评论用户空间'=>$url,
				'评论顶链接'=>common::GetUrl('dingcai.ding' , $urlData),
				'评论踩链接'=>common::GetUrl('dingcai.cai' , $urlData),
				
				'评论时间'=>date("Y-m-d H:i:s",$v['replay_time']),
				'up:年'=>date("Y",$v['replay_time']),
				'up:月'=>date("m",$v['replay_time']),
				'up:日'=>date("d",$v['replay_time']),
				'up:时'=>date("H",$v['replay_time']),
				'up:分'=>date("i",$v['replay_time']),
				'up:秒'=>date("s",$v['replay_time']),
				'评论时间:'.@$time[1][0]=>tpl::Time(@$time[1][0], $v['replay_time']),
			);
			//合并两组标签
			$arr = array_merge($arr1,$arr2);
			//替换标签
			$code.=tpl::rep($arr,$lcode);
			$i++;
		}
	
		//返回最后的结果
		return $code;
	}
	
	//更多评论判断
	function More()
	{
		$count = parent::$count;
		$limit = parent::$limit;
		if ( str_replace(',','',$limit) != $limit )
		{
			list($page,$limit) = explode( ',' , $limit );
		}
		
		if( $count >= $limit )
		{
			tpl::Rep( array('更多评论'=>'','/更多评论'=>'') );
		}
		else
		{
			tpl::Rep( array('{更多评论}[a]{/更多评论}'=>'') , null , 3 );
		}
	}
}
?>