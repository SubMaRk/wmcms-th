<?php
/**
* 作者系统类文件
*
* @version        $Id: author.class.php 2016年12月18日 16:00  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
class author
{
	//作者表
	static private $authorTabel = '@author_author';
	//草稿表
	static private $draftTabel = '@author_draft';
	//财务信息表
	static private $financeLog = '@user_finance_log';
	//用户数组
	static public $author;
	//作者经验值表
	static private $expTabel = '@author_exp';
	
	
	function __construct()
	{
		new authorlabel();
	}
	
	

	/**
	 * 根据所得到的条件查询数据
	 * @param 参数1，字符串，type为列表页数据获取，content为内容页数据获取
	 * @param 参数2，传递的sql条件
	 * @param 参数3，选填，没有数据的提示字符串
	 **/
	static function GetData( $type , $where='' , $errInfo='' )
	{
		$wheresql = self::GetWhere($where);
	
		//type为列表页数据获取
		switch ($type)
		{
			//列表页获取
			case 'draft':
				$wheresql['table'] = self::$draftTabel;
				break;

			//小说收入获取
			case 'novel_finance_log':
				$wheresql['table'] = self::$financeLog;
				$wheresql['field'] = self::$financeLog.'.*,novel_name';
				$wheresql['left']['@novel_novel'] = 'log_cid=novel_id';
				$wheresql['where']['log_status'] = '1';
				break;
				
			default:
				tpl::ErrInfo( C('system.module.getdata_no' , null , 'lang' ) );
				break;
		}
		
		//分页处理
		if( @$wheresql['list'] )
		{
			page::Start( C('page.listurl') , wmsql::GetCount($wheresql) , $wheresql['limit'] );
		}
		
		$data = wmsql::GetAll($wheresql);

		if( !$data && $errInfo != '' )
		{
			tpl::ErrInfo($errInfo);
		}
		return $data;
	}
	
	
	/**
	* 获得字符串中的条件sql
	* 返回值字符串
	* @param 参数1：需要查询的字符串。
	**/
	static function GetWhere($where)
	{
		//设置需要替换的字段
		$arr = array(
			'发信时间' =>'msg_time desc',
			'收入时间' =>'log_time desc',
		);

		return tpl::GetWhere($where,$arr);
	}

	/**
	 * 获得作者的基本信息
	 */
	static function GetAuthor()
	{
		if( !self::$author )
		{
			$where['table'] = self::$authorTabel;
			$where['where']['user_id'] = user::GetUid();
			self::$author = wmsql::GetOne($where);
		}
		return self::$author;
	}
	
	
	/**
	 * 检查作者的信息
	 * @param 参数1，选填，没有数据是否执行跳转
	 */
	static function CheckAuthor($isJump = true)
	{
		$author = self::GetAuthor();
		$authorConfig = C('','','authorConfig');
		$lang = C('','','lang');
		//如果没有数据或者状态不是正常的 ，并且没有检查
		if( (!$author || $author['author_status'] != '1' ) && $isJump == true )
		{
			tpl::Jump('author_apply');
		}
		//没有申请作者，并且关闭了申请
		else if( !$author && $authorConfig['apply_author_open'] == '0')
		{
			tpl::ErrInfo( $lang['author']['par']['apply_author_close'] );
		}
		//申请正在审核中
		else if( $author && $author['author_status'] == '0' )
		{
			tpl::ErrInfo( $lang['author']['par']['apply_author_status_0'] );
		}
		//已经通过了
		else if( $author && $author['author_status'] == 1 && $isJump == false)
		{
			tpl::ErrInfo( $lang['author']['par']['apply_author_status_1'] );
		}
		//正常账号切是今日首次登录就进行奖励
		else if ( $author['author_toptime'] < strtotime('today') )
		{
			//每日登录，修改登录时间和赠送经验值
			$authorMod = NewModel('author.author');
			$authorMod->UpLoginTime($author['author_id']);
			//如果奖励经验值大于0，就修改经验值
			if( $authorConfig['login_exp'] > 0 )
			{
				$expMod = NewModel('author.exp');
				$expMod->LoginExp($author['author_id'] , $authorConfig['login_exp']);
			}
		}
	}
	
	/**
	 * 作者id
	 */
	static function GetUid()
	{
		return self::$author['author_id'];
	}
	/**
	 * 作者笔名
	 */
	static function GetNickname()
	{
		return self::$author['author_nickname'];
	}
	/**
	 * 作者姓名
	 */
	static function GetName()
	{
		return self::$author['author_name'];
	}
	/**
	 * 作者签名
	 */
	static function GetInfo()
	{
		return self::$author['author_info'];
	}
	/**
	 * 作者公告
	 */
	static function GetNotice()
	{
		return self::$author['author_notice'];
	}
	/**
	 * 作者qq
	 */
	static function GetQq()
	{
		return self::$author['author_qq'];
	}
	
	
	/**
	 * 检查小说是否存在
	 * @param 参数1，必须，小说id
	 * @param 参数2，选填，错误的提示
	 * @return string
	 */
	static function CheckContent($module, $id , $info ='')
	{
		global $tableSer;
		
		//不检查小说审核状态
		C('page.novel_check_status',0);
		
		$data = '';
		if( $id > 0 )
		{
			$where[$tableSer->tableArr[$module]['id']] = $id;
			$where['author_id'] = author::GetUid();
			$data = str::GetOne($module::GetData( 'content' , $where , C('system.content.no',null,'lang') ));
		}
		
		if( !$data )
		{
			if( $info != '' )
			{
				tpl::ErrInfo($info);
			}
			else
			{
				return false;
			}
		}
		return $data;
	}
}
?>