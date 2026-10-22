<?php
/**
* 后台登录处理文件
*
* @version        $Id: login.php 2016年3月23日 11:01  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
*
*/
$code = 300;
$loginOk = false;
if( FormTokenCheck(true) == false )
{
	$tishi = '表单token错误！';
}
else if ( FormCodeCheck('code_admin_login' , true) == false )
{
	$tishi = '对不起，验证码错误！';
}
else
{
	$userName = Post('name');
	$passWord = Post('psw');
	$imgCode = Post('code');

	//账号密码检测
	if( trim($userName) == '' || trim($passWord) == '' )
	{
		$tishi = '对不起，账号密码不能为空!';
	}
	else if( str::StrLen($imgCode) <> 4 && C('config.web.admin_login_code') =='1' )
	{
		$tishi = '对不起，验证码格式错误!';
	}
	else if( $imgCode <> strtolower(Session('imgCode')) && C('config.web.admin_login_code') == '1' )
	{
		$tishi = '对不起，验证码错误!';
	}
	else
	{
		$loginSer = AdminNewClass('system.login');
		$loginCount = $loginSer->GetCount();
		//检查是否达到最高错误次数
		if( $loginCount >= C('config.web.admin_login_error_number') )
		{
			$tishi = '对不起，错误次数超过上限，请'.C('config.web.admin_login_error_time').'分钟后重试！';
		}
		else
		{
			$wheresql['table'] = '@manager_manager';
			$wheresql['where']['manager_name'] = $userName;
			$arr = wmsql::GetOne($wheresql);
			if( !$arr )
			{
				$tishi = '管理员账号不存在！';
				$loginSer->SetLog(0,0,$tishi);
			}
			else
			{
				//同一个管理员连续失败也要封锁，避免换 IP 绕过
				if( $loginSer->GetNameCount($arr['manager_id']) >= C('config.web.admin_login_error_number') )
				{
					$tishi = '对不起，错误次数超过上限，请'.C('config.web.admin_login_error_time').'分钟后重试！';
					$code = 300;
					Ajax($tishi,$code);
				}
				$salt = $arr['manager_salt'];
				//密码错误
				$pswOk = str::PswCheck($passWord, $arr['manager_psw'], $salt);
				if( !$pswOk )
				{
					$tishi = '密码错误！';
					//写入错误日志
					$loginSer->SetLog($arr['manager_id'],2);
				}
				//封禁的账号
				else if( $arr['manager_status'] == 0 )
				{
					$tishi="对不起,您的账号已经被禁用！如有疑问请联系超级管理员！";
					$loginSer->SetLog($arr['manager_id'],0,$tishi);
				}
				//账号密码正确
				else
				{
					$loginOk = true;
					//两步验证：开了就必须带对验证码，否则按登录失败处理
					$twofaMod = NewModel('system.twofa');
					$twofaSecret = $twofaMod->GetSecret($arr['manager_id']);
					if( $twofaSecret != '' && !TotpVerify($twofaSecret, Request('totp')) )
					{
						$tishi = '驗證碼ไม่ถูกต้อง';
						$loginSer->SetLog($arr['manager_id'],2,$tishi);
						$loginOk = false;
					}
				}
				if ( $loginOk )
				{
					$code = 200;
					$tishi="登录成功!";
					
					//检查网站的基本配置
					CheckBasicConfig(true);
					
					//不是接口登陆才写入登录日志
					if( Get('name') == '' && Get('psw') == '' )
					{
						$loginSer->SetLog($arr['manager_id'],1,$tishi);
					}
					
					//修改账号最后登录
					$data['manager_lastip'] = GetIp();
					$data['manager_lasttime'] = time();
					//还是旧哈希就在登录成功时顺手升级成 bcrypt
					$pswHash = $arr['manager_psw'];
					if( str::PswIsLegacy($pswHash) )
					{
						$pswHash = str::PswHash($passWord);
						$data['manager_salt'] = '';
						$data['manager_psw'] = $pswHash;
					}
					$where['manager_id'] = $arr['manager_id'];
					wmsql::Update('@manager_manager', $data, $where);
					
					//登录状态变化时换一个 session id，避免会话固定
					if( session_status() == PHP_SESSION_ACTIVE )
					{
						session_regenerate_id(true);
					}
					//写入session信息
					Session( 'admin_id' , $arr['manager_id'] );
					Session( 'admin_cid' , $arr['manager_cid'] );
					Session( 'admin_name' , $arr['manager_name'] );
					//session 里存的是数据库中的密码哈希，CheckLogin 用它做等值查询
					Session( 'admin_account' , str::A( $userName , $pswHash ) );
					
					//不是超级管理进行站群权限检测
					Session( 'admin_site' , '0' );//所有站点
					Session( 'admin_site_id' , '0' );//当前管理站点
					if( $arr['manager_cid'] != '0' )
					{
						$compWhere['table'] = '@system_competence';
						$compWhere['where']['comp_id'] =$arr['manager_cid'];
						$compData = wmsql::GetOne($compWhere);
						$siteArr = explode(',', $compData['comp_site']);
						//判断是否是站群模式
						$siteOpen = $C['config']['web']['site_open'];
						if( $siteOpen== '1' || ($siteOpen == '0' && $siteArr[0] == '0') )
						{
							//表单token删除
							FormDel();
							
							Session( 'admin_site' , $compData['comp_site']);
							Session( 'admin_site_id' , $siteArr[0]);
						}
						else
						{
							$code = 300;
							$tishi="对不起，站长关闭了站群模式，无法使用该帐号登录!";
							//写入错误日志
							$loginSer->SetLog($arr['manager_id'],0,$tishi);
						}
					}
				}
			}
        	//登录通知	
    	    $msgData = array(
    	        'admin_login_ip'=>str::DelHtml(GetIp()),
    	        'admin_login_name'=>$userName,
    	        'admin_login_time'=>date('Y-m-d H:i:s'),
    	        'admin_login_status'=>$tishi
	        );
            NewClass('msg');msg::SendWarring('warning_admin_login',$msgData);
		}
	}
}

if( Request('isAjax') == '0' )
{
	if( $code == '200' )
	{
		$backUrl = 'index.php?c=index';
	}
	else
	{
		$backUrl = 'index.php?c=login';
	}
	
	//如果账号和密码不等于空才提示，否则就是站群后台来源，不进行提示，直接进行跳转。
	if ( Get('name') == '' && Get('psw') == '' && $code != '200' )
	{
		echo "<script>alert('$tishi');</script>";
	}
	die("<script>location='$backUrl';</script>");
}
else
{
	if( Request('isAjax') == '1' || $code != 200 )
	{
		Ajax($tishi,$code);
	}
}
?>