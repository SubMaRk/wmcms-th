<?php
/**
* 用户卡号处理器
*
* @version        $Id: user.card.php 2017年3月27日 18:25  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$table = '@user_card';

//添加卡号操作
if ( $type == 'create'  )
{
	//卡号类型
	$cType = Post('type');
	//生成条数
	$number = Post('number');
	//发布渠道
	$channel = Post('channel');
	//开头类型
	$start = Post('start');
	//开头字符串
	$startStr = Post('start_str');
	//卡号长度
	$length = Post('length');
	
	
	//充值卡，卡号金额
	$money = Post('money');
	$give  = str::Int(Post('give'));
	
	if( $cType == '' )
	{
		Ajax('ขออภัย! โปรดเลือกรูปแบบหมายเลขบัตรก่อน' , 300);
	}
	else if( $number == '' )
	{
		Ajax('ขออภัย! โปรดกรอกหมายเลขก่อน' , 300);
	}
	else if( $channel == '' )
	{
		Ajax('ขออภัย! โปรดดรอกช่องทางจำหน่ายก่อน' , 300);
	}
	else if( $start == '1' && $startStr == '')
	{
		Ajax('ขออภัย! โปรดกรอกคำที่ระบุก่อน' , 300);
	}
	else if( $cType == 1 && $money == '' )
	{
		Ajax('ขออภัย! โปรดกรอกจำนวนบัตร' , 300);
	}
	
	
	$apiKey = $C['config']['api']['system']['api_apikey'];
	$pre = $C['config']['db']['prefix'];
	$txtContent = $sqls = '';
	//循环生成的数量
	for ($i=1 ; $i <= $number ; $i++ )
	{
		//判断加密字符串的长度
		if( $length == '16' )
		{
			$card = md5_16(str::RandStr(16,'all',$startStr).$apiKey.time().GetMtime());
		}
		else
		{
			$card = md5(str::RandStr(32,'all',$startStr).$apiKey.time().GetMtime());
		}
		
		if( $start == 1 )
		{
			$replace = substr($card, 0, strlen($startStr));
			$card = str_replace($replace, $startStr, $card);
		}
		
		$txtContent .= $card."\r\n";
		$sqls .= 'insert into '.$pre.'user_card(card_type,card_channel,card_key,card_money,card_give,card_addtime) values(\''.$cType.'\',\''.$channel.'\',\''.$card.'\',\''.$money.'\',\''.$give.'\','.time().');';
	}

	//插入数据库
	wmsql::Exec($sqls);
	//生成文件
	$fileName = WMFILE.'card/'.date('Ymd').'/'.md5(time()).'.txt';
	file::CreateFile($fileName, $txtContent);
	
	//写入操作记录
	$info = 'ยินดีด้วย! สร้างหมายเลขบัตรสำเร็จ';
	SetOpLog( 'สร้างหมายเลขบัตร'.$number.'กลุ่มหมายเลขบัตร' , 'user' , 'update' , $table);
	
	Ajax($info , 200 , array('file'=>$fileName));
}
//删除数据
else if ( $type == 'del')
{
	$where['card_id'] = GetDelId();
	//写入操作记录
	SetOpLog( 'ลบหมายเลขบัตร' , 'user' , 'delete' , $table , $where);
	wmsql::Delete($table , $where);
	
	Ajax('ลบหมายเลขบัตรสำเร็จ!');
}
//清空数据
else if ( $type == 'clear')
{
	//写入操作记录
	SetOpLog( 'ล้างหมายเลขบัตร' , 'user' , 'delete' , $table);
	wmsql::Delete($table);
	Ajax('ล้างหมายเลขบัตรสำเร็จ!');
}
?>