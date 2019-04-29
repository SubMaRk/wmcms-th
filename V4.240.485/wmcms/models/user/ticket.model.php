<?php
/**
* 推荐票模型
*
* @version        $Id: ticket.model.php 2017年3月15日 19:48  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*/
class TicketModel
{
	public $table = '@user_ticket';
	
	
	/**
	 * 构造函数
	 */
	function __construct()
	{
	}
	
	
	/**
	 * 获得模块的数组
	 * @param 参数1，必须,是否是所有模块
	 */
	function GetModuleArr( $module = 'all' )
	{
		if( $module == 'all' )
		{
			$module = 'novel';
		}
		return explode(',', $module);
	}

	/**
	 * 插入注册用户票数
	 * @param 参数1，必须，用户id
	 * @param 参数2，选填，推荐票
	 * @param 参数3，选填，月票
	 * @param 参数4，选填，插入数据的模块
	 * @param 参数5，选填，票数变更记录的备注信息
	 */
	function RegInsert( $uid , $rec = '0' , $month = '0' , $module = 'all' , $remark = '注册账号赠送！')
	{
		//需要插入的数据
		$data['ticket_user_id'] = $uid;
		$data['ticket_rec'] = $rec;
		$data['ticket_month'] = $month;
		$data['ticket_module'] = $module;

		
		$moduleArr = $this->GetModuleArr($module);
		foreach ($moduleArr as $k=>$v)
		{
			$data['ticket_module'] = $v;
			wmsql::Insert($this->table , $data);
		}

		if( $month > 0 || $rec >0 )
		{
			$logData['log_status'] = 1;
			$logData['log_user_id'] = $uid;
			$logData['log_rec'] = $rec;
			$logData['log_month'] = $month;
			$logData['log_remark'] = $remark;
			$logData['log_module'] = $module;
			return $this->InsertLog($logData);
		}
	}
	
	/**
	 * 更新用户推荐票信息
	 * @param 参数1，必填，用户id
	 * @param 参数2，选填，推荐票
	 * @param 参数3，选填，月票
	 * @param 参数4，选填，是系统赠送还是使用
	 * @param 参数5，选填，备注信息
	 * @param 参数6，选填，指定修改的模块
	 */
	function Update( $uid , $data , $status = '1')
	{
		//初始化数据
		$rec = $data['rec'];
		$month = $data['month'];
		$remark = $data['remark'];
		$module = @$data['module'];
		$cid = @$data['cid'];
		if( $module == '' )
		{
			$module = 'all';
		}
		if( $cid == '' )
		{
			$cid = '0';
		}
		
		if( $rec == '0' && $month == '0' )
		{
			return false;
		}
		else
		{
			//获得用户的推荐票
			$this->GetTicket($uid , $module);
			$where['ticket_user_id'] = $uid;
			if( $module != 'all' )
			{
				$where['ticket_module'] = $module;
			}
			
			//奖励推荐票
			if( $status == 1 )
			{
				$ticketData['ticket_rec'] = array('+' , $rec);
				$ticketData['ticket_month'] = array('+' , $month);
			}
			//使用推荐票
			else
			{
				$ticketData['ticket_rec'] = array('-' , $rec);
				$ticketData['ticket_month'] = array('-' , $month);
			}

			//插入票的记录
			$logData['log_status'] = $status;
			$logData['log_module'] = $module;
			$logData['log_cid'] = $cid;
			$logData['log_user_id'] = $uid;
			$logData['log_rec'] = $rec;
			$logData['log_month'] = $month;
			$logData['log_remark'] = $remark;
			$this->InsertLog($logData);
			return wmsql::Update( $this->table , $ticketData , $where);
		}
	}
	
	
	/**
	 * 获得用户的推荐票和月票数量
	 * @param 参数1，选填，模块id
	 * @param 参数2，选填，用户id
	 */
	function GetTicket( $uid = '0' , $module = 'all')
	{
		if( $uid > '0')
		{
			$where['table'] = $this->table;
			$where['field'] = 'ticket_month,ticket_rec';
			if( $module != 'all' )
			{
				$where['where']['ticket_module'] = $module;
			}
			$where['where']['ticket_user_id'] = $uid;
			$data = wmsql::GetOne($where);
			if( !$data )
			{
				$data['ticket_rec'] = C('reg_rec',null,'userConfig');
				$data['ticket_month'] = C('reg_month',null,'userConfig');
				$this->RegInsert($uid, $data['ticket_rec'] , $data['ticket_month'] , $module );
			}
		}
		else
		{
			$data['ticket_month'] = $data['ticket_rec'] = 0;
		}
		return $data;
	}
	
	
	/**
	 * 插入票使用、获得记录
	 * @param 参数1，必须，插入的数据
	 */
	function InsertLog($data)
	{
		$logMod = NewModel('user.ticket_log');
		return $logMod->Insert($data);
	}
}
?>