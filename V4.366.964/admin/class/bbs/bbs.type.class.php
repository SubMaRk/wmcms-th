<?php
/**
 * 论坛版块的类文件
 *
 * @version        $Id: bbs.type.class.php 2016年5月18日 14:10  weimeng
 * @package        WMCMS
 * @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
 * @link           http://www.weimengcms.com
 * @uptime         2016年6月5日 22:45  weimeng
 *
 */
class BbsType
{
	public $table = '@bbs_type';
	
	//电脑板的分类列表
	function GetHtml( $v , $lv = '')
	{
		$tabSign = '';
		if( $lv >= 3)
		{
			$tabSign = '<span class="tab-sign-s"></span>';
		}
		//是否有版主
		if( $v['moder'] == '' )
		{
			$moder = 'ไม่มีผู้จัดการ';
		}
		else
		{
			$moder = $v['moder'];
		}
		echo '<dt class="cf"><div class="btn-toolbar opt-btn cf">
				ผู้จัดการ : '.$moder.'&nbsp;&nbsp;
				<a href="index.php?d=yes&c=bbs.moder.edit&t=edit&tid='.$v['type_id'].'&tname='.$v['type_name'].'" data-toggle="dialog" data-width="510" data-height="210" data-mask="true" data-title="แก้ไขผู้จัดการบอร์ด"><span class="btn btn-secondary size-MINI radius">จัดการผู้จัดการ</span></a>
				<a href="index.php?d=yes&c=bbs.type.edit&t=edit&id='.$v['type_id'].'" data-toggle="navtab" data-id="bbs-type-edit" data-title="แก้ไขบอร์ด"><span class="btn btn-secondary size-MINI radius">แก้ไข</span></a>
				<a class="btn btn-danger radius" onclick="'.GetCFun().'delAjax('.$v['type_id'].')">ลบ</a>
			</div>
			<div class="fold"><i></i></div>
			<div class="order">'.$v['type_id'].'</div>
			<div class="order">'.$v['type_order'].'</div>
			<div class="name">'.$tabSign.'<span class="tab-sign"></span>'.$v['type_name'].'</div></dt>';
	}
	
	
	/**
	 * 获得所有分类
	 * @param 参数1，选填，sql条件
	 */
	function GetType( $where = array() )
	{
		$wheresql = $where;
		$wheresql['table'] = $this->table;
		$typeArr = wmsql::GetAll($wheresql);
		return $typeArr;
	}
	

	/**
	 * 检查应用是否存在
	 */
	function CheckName( $wheresql )
	{
		//应用名字检查
		$where['table'] = $this->table;
		$where['where'] = $wheresql;
		$data = wmsql::GetOne($where);
	
		if ( $data )
		{
			return $data;
		}
		else
		{
			return false;
		}
	}
}
?>