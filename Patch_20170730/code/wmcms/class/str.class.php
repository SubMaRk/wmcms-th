<?php
/**
* 字符串操作类
*
* @version        $Id: str.class.php 2015年8月20日 21:50  weimeng
* @package        WMCMS
* @copyright      Copyright (c) 2015 WeiMengCMS, Inc.
* @link           http://www.weimengcms.com
* @uptime 		  2016年10月10日 11:22 weimeng
*
*/
class str{
	/**
	 * 更多字符操作函数
	 * floor($val) ，去除小数
	 * ceil($val) ， 进一法
	 * round($val,$number) ， 四舍五入 ，第二个参数为保留几个小数
	 */

	static function Int($number , $str = '' , $val = 0)
	{
		//当不为正整数时
		if(preg_match("/^[0-9]*[1-9][0-9]*$/",$number) !=1 && $number != '0')
		{
			//如果提示信息为空则转为数字返回
			if( $val >= 0 )
			{
				return $val;
			}
			else if( $str == '' )
			{
				return intval($number);
			}
			else
			{
				//调用提示
				tpl::errinfo($str);
			}
		}
		else
		{
			return $number;
		}
	}
	
	
	/**
	* @param 判断字符串是否在数组中
	* @param 参数1，必须，需要检测的参数。
	* @param 参数2，选填，包含的数组。
	* @param 参数3，选填，返回错误的提示信息。
	**/
	static function In($val , $arr , $str = '')
	{
		if( !in_array($val, $arr[0]) )
		{
			$val = $arr[1];
		}
		if( $str == '' )
		{
			return $val;
		}
		else
		{
			tpl::errinfo($str);
		}
	}
	
	
	/**
	 * 检查是否是日期格式
	 * @param 参数1，必须，需要检查的字符串
	 * @param 参数2，选填，错误的提示信息
	 * @return boolean
	 */
	static function IsTime($str , $info = '')
	{
		if( !(strtotime($str) !== false) )
		{
			if ( $info == '' )
			{
				return false;
			}
			return tpl::ErrInfo($info);
		}
		return $str;
	}
	
	/**
	 * 检查非中文字符
	 * @param 参数1，必须，检查的字符串
	 * @param 参数2，非必须，字符串的长度
	 * @param 参数3，非必须，错误的提示字符串，为空则返回false
	 */
	static function NCN( $str , $len = '6,16' , $info = '')
	{
		if ( $len == '' )
		{
			$preg = "/[a-z0-9A-Z_\.]$/";
		}
		else
		{
			$preg = "/[a-z0-9A-Z_\.]{".$len."}$/";
		}
		if ( !preg_match_all($preg,$str,$array) )
		{
			if ( $info == '' )
			{
				return false;
			}
			return tpl::ErrInfo($info);
		}
		return true;
	}
	
	
	/**
	 * 检查是否是邮箱
	 * @param 参数1，必须，邮箱地址
	 * @param 参数2，错误提示信息，为空则返回false
	 */
	static function CheckEmail( $email , $info = '')
	{
		if ( !preg_match_all("/[a-zA-Z0-9_.-]*@[0-9a-zA-Z]+(.[a-zA-Z]+)+$/",$email,$array) )
		{
			if ( $info == '' )
			{
				return false;
			}
			return tpl::ErrInfo($info);
		}
		return true;
	}
	
	
	/**
	 * 检查字母和数组的组合 letter_number
	 * @param 参数1，必须，检查的字符串
	 * @param 参数2，非必须，字符串的长度
	 * @param 参数3，非必须，错误的提示字符串，为空则返回false
	 */
	static function LN( $str , $info = '' , $len = '' )
	{
		if ( $len == '' )
		{
			$preg = "/[a-z0-9A-Z]$/";
		}
		else
		{
			$preg = "/[a-z0-9A-Z]{".$len."}$/";
		}
		if ( !preg_match_all($preg,$str,$array) )
		{
			if ( $info == '' )
			{
				return false;
			}
			return tpl::ErrInfo($info);
		}
		return true;
	}
	/**
	 * 检查字母、数字和中文的组合 letter_number_cn
	 * @param 参数1，必须，检查的字符串
	 * @param 参数2，非必须，错误的提示字符串，为空则返回false
	 * @param 参数3，非必须，字符串的长度
	 */
	static function LNC( $str , $info = '' , $len = '' )
	{
		if ( $len == '' )
		{
			$preg = "/[a-z0-9A-Z|\x7f-\xff]$/";
		}
		else
		{
			$preg = "/[a-z0-9A-Z|\x7f-\xff]{".$len."}$/";
		}
		if ( !preg_match_all($preg,$str,$array) )
		{
			if ( $info == '' )
			{
				return false;
			}
			return tpl::ErrInfo($info);
		}
		return $str;
	}
	

	
	/**
	 * 页数检测
	 * @param 参数1，选填，需要检测的页数。
	 **/
	static function Page( $page = '' )
	{
		//如果没有传入页数
		if ( $page == '' )
		{
			$page =  Get('page') ;
		}
		
		//当不为正整数时
		if( !self::Number($page) || $page < 1)
		{
			$page = 1;
		}
		
		C('page.page',$page);
		return $page;
	}
	
	
	/**
	* 取得数组第一条数据
	* @param 参数1，数组。
	* @param 参数2，是否直接取出某个字段
	**/
	static function GetOne($arr , $key = '')
	{
		if( is_array($arr) )
		{
			if( $key != '' )
			{
				return @$arr[0][$key];
			}
			else
			{
				return @$arr[0];
			}
		}
		else
		{
			return '';
		}
	}

	/**
	 * 取得数组指定的键值
	 * @param 参数1，数组。
	 * @param 参数2，是否直接取出某个字段
	 **/
	static function GetKey($arr , $key)
	{
		return $arr[$key];
	}
	
	/**
	 * 删除数组指定的键
	 * @param 参数1，数组。
	 * @param 参数2，需要删除的键值
	 **/
	static function DelKey($arr,$unKey)
	{
		if(!empty($arr))
		{
			$unKeyArr = explode(',', $unKey);
			foreach($unKeyArr as $k=>$v)
			{
				unset($arr[$v]);
			}
			return $arr;
		}
	}

	
	/**
	* 作用，纯数字检测。
	* @param 参数1，字符。
	*/
	static function Number($str)
	{
		//当不为整数时
		if( $str == '' || !is_string($str))
		{
			return false;
		}
		else
		{
			if( preg_match("/^[0-9]*[1-9][0-9]*$/",$str) != 1 && $str != '0')
			{
				//调用提示
				return false;
			}
			else
			{
				return true;
			}
		}
	}
	

	/**
	 * 布尔值检查
	 * @param 参数1，必须。接受的参数
	 * @param 参数2，必须。true的参数值
	 * @param 参数3，选填，是否保存到数组里面
	 * @return boolean
	 */
	static function IsTrue( $str , $val , $key = '' )
	{
		if( trim($str) == $val )
		{
			$res = true;
		}
		else
		{
			$res = false;
		}

		if ( trim($key) != '' )
		{
			C($key , $res);
		}
		return $res;
	}


	/**
	 * 布尔值参数返回
	 * @param 参数1，必须。参数
	 * @param 参数2，必须。true的返回值
	 * @param 参数3，必填。false的返回值
	 * @return boolean
	 */
	static function ReturnTrue( $str , $true , $false )
	{
		if( $str === true )
		{
			return $true;
		}
		else
		{
			return $false;
		}
	}
	
	
	/**
	 * 检查布尔值的返回值
	 * @param 参数1，必须。参数，字符串或者数组
	 * @param 参数2，必须。参数的值
	 * @param 参数3，选填。true的返回值
	 * @param 参数4，选填。false的返回值
	 * @return boolean
	 */
	static function CheckElse( $str , $val , $true = '' , $false = '' )
	{
		if( $str == $val )
		{
			return $true;
		}
		else if ( is_array($str) && in_array($val, $str) )
		{
			return $true;
		}
		else
		{
			return $false;
		}
	}
	
	
	/**
	 * 图片检查
	 * @param 参数1，选填。后缀名，如果为空则返回图片数组
	 */
	static function IsImg( $ext = '' )
	{
		$imgArr = array( 'jpeg','jpg','image/jpeg', 'png','image/png', 'bmp','image/bmp' ,'ico','image/x-icon', 'gif','image/gif', 'svg','image/svg+xml');

		//如果类型为空则直接返回数组
		if( $ext == '' )
		{
			return $imgArr;
		}
		else
		{
			//如果不是图片
			if ( !in_array($ext, $imgArr) )
			{
				return false;
			}
			return true;
		}
	}
	
	
	/**
	 * 验证字符串长度
	 * @param 参数1，必填，需要验证的字符串
	 * @param 参数2，必填，字符串的长度范围
	 * @param 参数3，必填，字符串不符合长度的时候给出的提示
	 */
	static function CheckLen( $str , $len = '6,16' , $info = '')
	{
		list($start , $end) = explode( ',' , $len );
		
		if ( $start == '' )
		{
			$start = 0;
		}
		if( $end == '' )
		{
			$end = 0;
		}
		
		//字符串长度
		$strLen = (int)self::StrLen( $str );
		
		
		if( ( $start > 0 && $end > 0 && ( $start > $strLen || $end < $strLen ) )
			|| ( $start > 0 &&  $start > $strLen )
			|| ( $end > 0 && $end < $strLen )
		)
		{
			if( $info == '' )
			{
				return false;
			}
			else
			{
				tpl::ErrInfo( $info );
			}
		}
		
		return true;
	}

	/**
	* @param 参数为空检查
	* @param 参数1，需要检测的字符串。
	* @param 参数2，如果为空的提示
	* @param 参数3，选填，参数1为空的时候默认值
	*/
	static function IsEmpty(  $str , $info = '' , $default = '')
	{
		if( trim($str) == '' && $info != '')
		{
			tpl::errinfo( $info );
		}
		else if( trim($str) == '' && $info == '' && $default == '')
		{
			return false;
		}
		else if( trim($str) != '' && $info == '' && $default == '')
		{
			return true;
		}
		else
		{
			if ( $default != '' && $str == '')
			{
				$str = $default;
			}
			return $str;
		}
	}


	/**
	 * 生成随机的字符串组合
	 * @param 参数1：数字类型，需要生成的字符串长度
	 * @param 参数2：生成的随机字符串类型，all为全部，num为数字，str为字母
	 * @param 参数3：开头固定的字符串
	 **/
	static function RandStr($len = 4,$type = 'all' , $start = '')
	{
		$returnStr = $strlen = $content = '';
		$number = '1234567890';
		$str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLOMNOPQRSTUVWXYZ';
		//strlen：字符串的总长度
		switch ($type)
		{
			case 'num':
				$content = $number;
				$strlen = '9';
				break;
			case 'str':
				$content = $str;
				$strlen = '52';
				break;
			default:
				$content = $number.$str;
				$strlen = '61';
				break;
		}
		
		//如果开头字符不为空，就减去生成的字符串长度
		if( $start != '' )
		{
			$len = $len-strlen($start);
		}
		for($i = 0; $i < $len; $i ++)
		{
			$returnStr .= $content {mt_rand (0,$strlen)};
		}
		//如果开头字符不为空就加到最前面
		if( $start != '' )
		{
			$returnStr = $start.$returnStr;
		}
		return $returnStr;
	}

	
	
	/**
	 * 检查字符是否等于某个值
	 * @param 参数1，字符串
	 * @param 参数2，预设值
	 * @param 参数3，错误提示
	 * @param 参数4，是否是ajax
	 * @param 参数5，运算符号，默认等于
	 */
	static function EQ( $str , $val , $info = '' , $ajax = false , $p = '=' )
	{
		$exit = false;
		switch ( $p )
		{
			case "=":
				if ( $str == $val )
				{
					$exit = true;
				}
				break;
				
			case ">":
				if ( $str > $val )
				{
					$exit = true;
				}
				break;
				
			case ">=":
				if ( $str >= $val )
				{
					$exit = true;
				}
				break;
				
			case "<":
				if ( $str < $val )
				{
					$exit = true;
				}
				break;
				
			case "<=":
				if ( $str < $val )
				{
					$exit = true;
				}
				break;
				
			case "!=":
				if ( $str != $val )
				{
					$exit = true;
				}
				break;
		}

		if ( $exit )
		{
			if ( $info == '' )
			{
				return true;
			}
			else
			{
				ReturnData( $info , $ajax );
			}
		}
		else
		{
			return false;
		}
	}
	/**
	 * @param 参数同上，用于检测是否不等于预设值
	 */
	static function NEQ( $str , $val , $info = '' , $ajax = false )
	{
		self::EQ( $str , $val , $info , $ajax , '!=' );
	}
	/**
	 * @param 参数同上，用于检测是否大于预设值
	 */
	static function RT( $str , $val , $info = '' , $ajax = false )
	{
		self::EQ( $str , $val , $info , $ajax , '>' );
	}
	/**
	 * @param 参数同上，用于检测是否大于等于预设值
	 */
	static function RTEQ( $str , $val , $info = '' , $ajax = false )
	{
		self::EQ( $str , $val , $info , $ajax , '>=' );
	}
	/**
	 * @param 参数同上，用于检测是否小于预设值
	 */
	static function LT( $str , $val , $info = '' , $ajax = false )
	{
		self::EQ( $str , $val , $info , $ajax , '<' );
	}
	/**
	*参数同上，用于检测是否小于等于预设值
	*/
	static function LTEQ( $str , $val , $info = '' , $ajax = false )
	{
		self::EQ( $str , $val , $info , $ajax , '<=' );
	}

	
	
	/**
	 * 将字符串转成条件
	 * @param 参数1，必须，字符串用,分开
	 * @param 参数2，每个数组的文本标记
	 * @param 参数3，用什么分开，默认为or
	 */
	static function StrToWhere( $str , $label , $exp = 'or' , $filer = ',' )
	{
		$strSql = '';
		$strArr = explode( $filer , $str );
		
		$i = 1;
		$count = count( $strArr );
		foreach ( $strArr as $k=>$v)
		{
			$code = $label;
			$strSql.= str_replace( '{i}' , $v , $code);
			
			//如果不是最后一个指针就加上字段分号
			if( $count != $i )
			{
				$strSql.= ' '.$exp.' ';
			}
			$i++;
		}
		return $strSql;
	}
	
	
	/**
	 * 将数组转换成有规律的字符串格式。
	 * @param 参数1，必填，数组。
	 * @param 参数2，选填，数组之间用什么分割。
	 * @param 参数3，参数4，选填，两个参数不为空则直接调用把字符串转换成条件。
	 * @param 参数5，选填，键名， 不为空则是多维数组
	 */
	static function ArrToStr( $arr , $exp = ',' , $label = '' , $wexp = '' , $key = '')
	{
		$str = '';
		if( is_array($arr) )
		{
			//不是多维数组
			if ( $key == '' )
			{
				$str = implode( $exp , $arr );
				
				if ( $label != '' && $wexp != '' )
				{
					$str = self::StrToWhere( $str, $label , $wexp );
				} 
			}
			//是多维数组
			else
			{
				$i=1;
				foreach ( $arr as $k=>$v)
				{
					$str.=$v[$key];
					if ( $i < count($arr) )
					{
						$str.=$exp;
					}
					$i++;
				}
			}
		}
		else
		{
			$str = $arr;
		}
		
		return $str;
	}
	
	
	/**
	 * 将有规律的字符串转换成数组格式。
	 * @param 参数1，必填，字符串。
	 * @param 参数2，选填，字符串之间用什么分割。
	 */
	static function StrToArr( $str , $exp = ',')
	{
		$arr = explode( $exp , $str );
		return $arr;
	}

	
	
	/**
	 * 对账号密码进行混淆加密
	 * @param 参数1，必填，需要加密的字符串
	 * @param 参数2，选填，默认为解密，传入密码则为加密
	 */
	static function A( $name , $psw = 'D' )
	{
		if ( $psw == 'D' )
		{
			$str = str::Encrypt( $name , 'D' , C('config.api.system.api_apikey'));
			$str = explode( '|wmcms|' , $str );
		}
		else
		{
			$str = $name.'|wmcms|' .$psw;
			$str = str::Encrypt( $str , 'E' , C('config.api.system.api_apikey'));
		}
		return $str;
	}
	
	/**
	 * 对密码进行加密
	 * @param 参数1，必填，密码加密
	 */
	static function E( $psw )
	{
		return sha1(md5($psw));
	}
	
	/**
	* 字符串加密解密函数
	* @param 参数1：字符串类型，需要加密的字符串。
	* @param 参数2：字符串类型，加密解密方式，D为解密，E为加密。
	* @param 参数3：字符串类型，加解密混淆的字符串。
	**/
	static function Encrypt($string,$operation='E',$key='')
	{
		//默认为系统密匙混淆
		if( $key == '' )
		{
			$key = C('config.api.system.api_apikey');
		}
		$key = md5($key);
		$key_length = strlen($key);
		$string = $operation == 'D' ? base64_decode($string) : substr(md5($string . $key) , 0, 8) . $string;
		$string_length = strlen($string);
		$rndkey = $box = array();
		$result = '';
		for ($i = 0; $i <= 255; $i++) {
		    $rndkey[$i] = ord($key[$i % $key_length]);
		    $box[$i] = $i;
		}
		for ($j = $i = 0; $i < 256; $i++) {
		    $j = ($j + $box[$i] + $rndkey[$i]) % 256;
		    $tmp = $box[$i];
		    $box[$i] = $box[$j];
		    $box[$j] = $tmp;
		}
		for ($a = $j = $i = 0; $i < $string_length; $i++) {
		    $a = ($a + 1) % 256;
		    $j = ($j + $box[$a]) % 256;
		    $tmp = $box[$a];
		    $box[$a] = $box[$j];
		    $box[$j] = $tmp;
		    $result.= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
		}
		if ($operation == 'D') {
		    if (substr($result, 0, 8) == substr(md5(substr($result, 8) . $key) , 0, 8)) {
		        return substr($result, 8);
		    } else {
		        return '';
		    }
		} else {
		    return str_replace('=', '', base64_encode($result));
		}
	}
	
	/**
	 * 把html代码替换成文本
	 * @param 参数1，需要进行替换的内容
	 * 返回值，字符串
	 */
	static function ToTxt($str)
	{
		$array = array(
				'&quot;'	=>	'"',
				'&amp;'		=>	'&',
				'&lt;'		=>	'<',
				'&gt;'		=>	'>',
				'&nbsp;'	=>	' ',
				"\t"		=>	'　　',
				'\r\n'		=>	"\r\n",
				'\r'		=>	"\r",
				'\n'		=>	"\n",
				'{#39}'		=>	"'",
				'{#34}'		=>	'"',
				'{#lt}'		=>	"<",
				'{#gt}'		=>	'>',
		);
		$str = strtr($str,$array);

		$str = preg_replace('/<br(.*?)>/',"\r\n",$str);
		$str = preg_replace('/<BR(.*?)>/',"\r\n",$str);
		$str = preg_replace('/<\/(.*?)>/','',$str);
		$str = preg_replace('/<(.*?)>/','',$str);

		//转换编码
		$str = self::EnCoding($str);
		
		return $str;
	}
	
	/**
	 * 把字符串转成html代码
	 * @param 参数1，需要进行替换的字符串
	 * 返回值，字符串
	 */
	static function ToHtml($str)
	{
		//键为需要替换的字符，值为替换后的字符
		//注：此函数在同条件下，比str_replace循环替换百万次快一半
		$array = array(
			"\r\n"	=>	'<br/>',
			"\r"	=>	'<br/>',
			"\n"	=>	'<br/>',
			"\t"	=>	'　　',
			'&#39;'		=>	"'",
			'{#lt}'		=>	"<",
			'{#gt}'		=>	'>',
		);
	
		return strtr($str,$array);
	}
	
	
	/**
	 * 删除含有XSS攻击的代码
	 * @param 参数1，需要进行替换的字符串
	 * 返回值，字符串
	 */
	static function ClearXSS($str)
	{
		$apiStr = md5(C('config.api.system.api_apikey').time());
		$ltTag = '{&lt;'.$apiStr.'}';
		$gtTag = '{'.$apiStr.'&gt;}';
		//检测的html标签。
		$tagArr = array('frameset','strong','iframe','blockquote','table','colgroup','tbody','thead','strike','script','font','span','pre','code','div','col','ol','tr','th','td','img','ul','br','h1','hr','li','a','b','i','p','u');
		//单个标签匹配
		$lonArr = array('img','hr','br','col');
		//检测出来直接替换的标签。
		$repArr = Array('script', 'style', 'iframe', 'frame','link',  'frameset', 'bgsound', 'title'); 
		//可以存在的元素
		$yArr = array('style','width','height','src','href','align','target','color');
		//不能存在的属性直接替换掉，目前该项没有使用，引用的可以存在的元素数组。
		$aArr = Array('id','name', 'javascript','class', 'onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
		foreach($tagArr as $k=>$v)
		{
			//图片等单标签匹配
			if( in_array($v,$lonArr) )
			{
				$pattern = '/<'.$v.'\s*?([\s\S]*?)>/i';
			}
			//其他类型
			else
			{
				$pattern = '/<'.$v.'\s*?([\s\S]*?)>([\s\S]*?)<\/'.$v.'\s*?(.*?)>/i';
			}
			preg_match_all($pattern,$str,$matches);
			if( @!empty($matches[0]) )
			{
				foreach($matches[0] as $k1=>$v1)
				{
					if( in_array($v,$repArr) )
					{
						$str = str_replace($matches[0][$k1],htmlspecialchars($matches[0][$k1]),$str);
					}
					else
					{
						$attrData = array();
						$mStr = str_replace("\r\n",'',$matches[1][$k1]);
						$mStr = str_replace("\r",'',$mStr);
						$mStr = str_replace("\n",'',$mStr);
						foreach($yArr as $key=>$val)
						{
							preg_match_all('/\s*?'.$val.'.*?=.*?"(.*?)"/i',$mStr,$attrMatch);
							if( @!empty($attrMatch[0]) )
							{
								//如果是超链接。
								if( $val == 'href')
								{
									$url = $attrMatch[1][0];
									//出现java就替换成首页
									$url = preg_replace('/javascript:.*/i','#',$url);
									if($url != '#' && substr($url,0,33) !='/module/link/click.php?t=out&url=' )
									{
										//替换成跳转链接。
										$url = '/module/link/click.php?t=out&url='.urlencode($url);
									}
									$attrMatch[1][0] = $url;
								}
								//暂时不进行img的src排除。
								//else if($v=='img' && $val=='src')
								//{
								//$attrMatch[1][0] = preg_replace('/\?.*/i','',$attrMatch[1][0]);
								//$ext = strrchr($attrMatch[1][0],'.'); 
								//不是有效图片路径
								//if($ext != 'jpg'){
								//	$attrMatch[1][0] = '/files/images/noimage.gif';
								//}
								//}
								$attrData[] = $val.'="'.$attrMatch[1][0].'"';
							}
						}

						//图片标签
						if( in_array($v,$lonArr) )
						{
							$str = str_replace($matches[0][$k1],$ltTag.$v.' '.implode(' ',$attrData).'/'.$gtTag,$str);
						}
						//其他类型
						else
						{
							$str = str_replace($matches[0][$k1],$ltTag.$v.' '.implode(' ',$attrData).$gtTag.$matches[2][$k1].$ltTag.'/'.$v.$gtTag,$str);
						}
					}
				}
			}
		}
		
		$array = array("<"=>'&lt;',">"=>'&gt;',$ltTag=>'<',$gtTag=>'>','{'=>'&#123;','}'=>'&#125;');
		return strtr($str,$array);
	}
	
	
	/**
	 * 删除html代码
	 * @param 参数1，需要进行替换的字符串
	 * 返回值，字符串
	 */
	static function DelHtml($str)
	{
		//键为需要替换的字符，值为替换后的字符
		$array = array(
				'<br/>'		=>	'<br />',
				'<br />'	=>  "\r\n",
				"<"			=>	'&lt;',
				">"			=>	'&gt;',
				"'"			=>	'&#39;',
				'"'			=>	'&quot;',
				'{'			=>	'&#123;',
				'}'			=>	'&#125;',
		);

		return strtr($str,$array);
	}
	
	
	/**
	 * 对数据进行转义
	 * @param 参数1，必须，需要转义的字符串或者数组
	 * @param 参数2，选填，e为转义，d为反转义
	 */
	static function Escape( $str , $type = 'd')
	{
		if( $str != '' )
		{
			switch ($type)
			{
				case "e":
					$array = array(
						'"'	=>	'{#34}',
						"'"	=>	'{#39}',
						"<"	=>	'{#lt}',
						">"	=>	'{#gt}',
					);
					break;
						
				default:
					$array = array(
						'{#39}'	=>	"'",
						'{#34}'	=>	'"',
						'{#lt}'	=>	"<",
						'{#gt}'	=>	'>',
					);
					break;
			}

			//如果是数组
			if( is_array($str) )
			{
				foreach ($str as $k=>$v)
				{
					if( is_array($v) )
					{
						foreach ($v as $k1=>$v1)
						{
							//如果v1的值为数组就取出第一个键的值
							if( is_array($v1) )
							{
								foreach ($v1 as $k2=>$v2)
								{
									//如果v1的值为数组就取出第一个键的值
									if( is_array($v2) )
									{
										foreach ($v2 as $k3=>$v3)
										{
											//如果v1的值为数组就取出第一个键的值
											$str[$k][$k1][$k2][$k3] = strtr($v3,$array);
										}
									}
									else
									{
										//如果v1的值为数组就取出第一个键的值
										$str[$k][$k1][$k2] = strtr($v2,$array);
									}
								}
							}
							else
							{
								$str[$k][$k1] = strtr($v1,$array);
							}
						}
					}
					else
					{
						$str[$k] = strtr($v,$array);
					}
				}
				return $str;
			}
			else
			{
				return strtr($str,$array);
			}
		}
		else
		{
			return $str;
		}
	}
	
	
	/**
	 * 获得内容的长度
	 * 先调用删除所有标点符号在查询字符串的长度
	 * @param 参数1，需要获取长度的字符串
	 */
	static function StrLen($str , $delhml = TRUE)
	{
		if( $delhml )
		{
			return mb_strlen(self::DelHtml($str),'utf-8');
		}
		else
		{
			return mb_strlen($str,'utf-8');
		}
	}

	
	/**
	 * 删除所有标点符号
	 * @param 参数1，需要删除符号的字符串
	 **/
	static function DelSymbol($str)
	{
		if( trim($str) == '' )
		{
			return '';
		}
		$str=preg_replace("/[[:punct:]\s]/",'',$str);
		$str=urlencode($str);
		$str=preg_replace("/(%7E|%60|%21|%40|%23|%24|%25|%5E|%26|%27|%2A|%28|%29|%2B|%7C|%5C|%3D|\-|_|%5B|%5D|%7D|%7B|%3B|%22|%3A|%3F|%3E|%3C|%2C|\.|%2F|%A3%BF|%A1%B7|%A1%B6|%A1%A2|%A1%A3|%A3%AC|%7D|%A1%B0|%A3%BA|%A3%BB|%A1%AE|%A1%AF|%A1%B1|%A3%FC|%A3%BD|%A1%AA|%A3%A9|%A3%A8|%A1%AD|%A3%A4|%A1%A4|%A3%A1|%E3%80%82|%EF%BC%81|%EF%BC%8C|%EF%BC%9B|%EF%BC%9F|%EF%BC%9A|%E3%80%81|%E2%80%A6%E2%80%A6|%E2%80%9D|%E2%80%9C|%E2%80%98|%E2%80%99|%EF%BD%9E|%EF%BC%8E|%EF%BC%88)+/",'',$str);
		$str=urldecode($str);
		return trim($str);
	}
	
	
	/**
	 * 从字符串中截取出域名
	 * @param 参数1，需要提取的字符串
	 * 返回值，域名。
	 */
	static function GetUrl($url)
	{
		if( strpos($url,'.') > 0 )
		{
			if( substr($url,0,7) != 'http://' )
			{
				$url.='http://';
			}
			$arr= parse_url($url);
			return 'http://'.$arr['host'];
		}
		else
		{
			return false;
		}
	}
	
	
	/**
	 * 检查url是否是正确的
	 * @param 参数1，必须，需要检查的url
	 * @param 参数2，选填，是否有错误提示
	 */
	static function CheckUrl( $url , $info = '')
	{
		if ( !preg_match('/http:\/\/(.*?)\.(.*?)/', $url) )
		{
			if( $info == '' )
			{
				return false;
			}
			else
			{
				tpl::ErrInfo($info);
			}
		}
		else
		{
			return true;
		}
	}

	/**
	 * 补全url
	 * @param 参数1，原始地址。例：http://weimengcms.com/html/
	 * @param 参数2，需要补全的地址。例：1.html
	 * 返回值，例：http://weimengcms.com/html/1.html
	 */
	static function CloseUrl($ourl,$url)
	{
		$ourl=str_replace('&amp;','&',$ourl);
		$url=str_replace('&amp;','&',$url);
		
		//如果是http开头就直接返回url
		if ( substr($url,0,7)=='http://' ) {
			return $url;
		}
		else
		{
			//获得原始地址的域名。
			$domain = self::GetUrl($ourl);
			
			//判断是否以/开头
			if(substr($url,0,1)=='/')
			{
				return $domain.$url;
			}
			else
			{
				$arr = explode('/',$ourl);
				//数组行数
				$count = count($arr)-1;
				//最后的字符
				$lastStr = $arr[$count];
				
				//如果最后的字符串不为空表示原始地址不是以/结尾
				if( $lastStr != '' )
				{
					//如果最后的字符串有.则表示当前是一个文件
					//如：/html/1.html
					if ( strpos($lastStr,'.') > 0 )
					{
						$ourl = str_replace($lastStr, '', $ourl);
						return $ourl.$url;
					}
					//否则为 /html/idnex
					else
					{
						return $ourl.'/'.$url;
					}
				}
				//如果网址以/结尾，直接返回原始网址+当前url
				else
				{
					return $ourl.$url;
				}
			}
		}
	}

	
	
	/**
	 * 字符串编码转换
	 * @param 参数1，需要转换的url
	 * @param 参数2，目标编码
	 */
	static function EnCoding($str,$enCode = 'utf-8')
	{
		$strEncode = mb_detect_encoding($str, array("ASCII",'UTF-8',"GB2312","GBK",'BIG5'));
		
		if( strtolower($strEncode) != strtolower($enCode) )
		{
			$str=mb_convert_encoding($str,$enCode,$strEncode);
		}
		return $str;
	}


	/**
	 * 把数据转换为树形结构
	 * @param 参数1，必须，数组。
	 * @param 参数2，必须，父级id字段名字
	 * @param 参数3，必须，id字段名字
	 * @param 参数4，选填，父id默认从0开始。
	 */
	static function Tree( $arr , $pidName , $idName , $pid=0 )
	{
		$tree=array();
	
		if ( !is_array($arr) )
		{
			return $arr;
		}
	
		foreach ($arr as $k=> $v)
		{
	
			if( $v[$pidName] == $pid )
			{
				$v['child'] = self::Tree( $arr , $pidName , $idName , $v[$idName] );
				$tree[]=$v;
			}
		}
		return $tree;
	}


	/**
	 * 规则符号转义
	 * @param 参数1，必须，需要转义的字符串
	 */
	static function ERules( $str )
	{
		$array = array(
			'{a}'	=>	'[\s\S]*?',
			'{*}'	=>	'([\s\S]*?)',
		);
		$str = strtr($str,$array);
	
		return $str;
	}
	
	
	/**
	 * 取出中间字符
	 * @param 参数1，必须，匹配规则
	 * @param 参数2，必须，字符串
	 */
	static function GetBetween($rules , $str)
	{
		preg_match_all('/'.self::ERules($rules).'/', $str, $lable);
		return @$lable[1][0];
	}
	

	/**
	 * 检查身份证号码
	 * @param 参数1，必须，身份证号码
	 * @param 参数2，选填，格式错误的时候给出提示
	 */
	static function CheckCardId($cardId , $info = '')
	{
		$isTrue = true;
		$id = strtoupper($cardId);
		$regx = "/(^\d{15}$)|(^\d{17}([0-9]|X)$)/";
		$arr_split = array();
		if(!preg_match($regx, $id))
		{
			$isTrue = false;
		}
		if(15==strlen($id)) //检查15位
		{
			$regx = "/^(\d{6})+(\d{2})+(\d{2})+(\d{2})+(\d{3})$/";
			@preg_match($regx, $id, $arr_split);
			//检查生日日期是否正确
			$dtm_birth = "19".$arr_split[2] . '/' . $arr_split[3]. '/' .$arr_split[4];
			if(!strtotime($dtm_birth))
			{
				$isTrue = false;
			}
		}
		else if(18 == strlen($id))   //检查18位
		{
			$regx = "/^(\d{6})+(\d{4})+(\d{2})+(\d{2})+(\d{3})([0-9]|X)$/";
			@preg_match($regx, $id, $arr_split);
			$dtm_birth = @$arr_split[2] . '/' . @$arr_split[3]. '/' .@$arr_split[4];
			if(!strtotime($dtm_birth)) //检查生日日期是否正确
			{
				$isTrue = false;
			}
			else
			{
				//检验18位身份证的校验码是否正确。
				//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
				$arr_int = array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
				$arr_ch = array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
				$sign = 0;
				for ( $i = 0; $i < 17; $i++ )
				{
					$b = (int) $id{$i};
					$w = $arr_int[$i];
					$sign += $b * $w;
				}
				$n = $sign % 11;
				$val_num = $arr_ch[$n];
				if ($val_num != substr($id,17, 1))
				{
					$isTrue = false;
				}
			}
		}

		if( $isTrue == false )
		{
			if ( $info == ''  )
			{
				return false;
			}
			return tpl::ErrInfo($info);
		}
		else
		{
			return $cardId;
		}
	}
	

	/**
	 * 检查手机号码
	 * @param 参数1，必须，手机号码
	 * @param 参数2，选填，格式错误的时候给出提示
	 */
	static function IsTel($tel , $info = '')
	{
		$isTrue = true;
		if ( !is_numeric($tel) )
		{
			$isTrue = false;
		}
		else if( !preg_match('#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#', $tel) )
		{
			$isTrue = false;
		}
		
		if( $isTrue == false )
		{
			if ( $info == ''  )
			{
				return false;
			}
			return tpl::ErrInfo($info);
		}
		else
		{
			return $tel;
		}
	}
	
	
	/**
	 * 获得最后一个字符串
	 * @param 参数1，必须，数组或者字符串
	 * @param 参数2，选填，如果参数1是字符串此参数为分隔符。
	 */
	static function GetLast($obj , $exp='')
	{
		//如果是字符串并且分隔符不是空
		if( $exp != '' && !is_array($obj) )
		{
			$obj = explode($exp, $obj);
		}
		
		return end($obj);
	}

	
	/**
	 * 获得本月剩余天数和总天数
	 */
	static function GetMonthDay()
	{
		$firstDay = date('Y-m-01');
		$sumDay = date('d', strtotime("$firstDay +1 month -1 day"));
		$surplusDay = $sumDay-date('d')+1;
		return array($surplusDay,$sumDay);
	}
	
	
	/**
	 * 字符串1是否包含在字符串2中
	 * @param 参数1，必须，判断包含的字符串
	 * @param 参数2，选填，原始字符串，默认为模版。
	 * @param 参数3，选填，0为默认，1为转为小写，2为大写。
	 */
	static function in_string($str1,$str2='',$lower='0')
	{
		if( $str2 == '' )
		{
			$str2 = tpl::$tempCode;
		}
		//1为全部转为小写
		if($lower == '1')
		{
			$str1 = strtolower($str1);
			$str2 = strtolower($str2);
		}
		//2为全部转为大写
		else if($lower == '2')
		{
			$str1 = strtoupper($str1);
			$str2 = strtoupper($str2);
		}
		
		if( str_replace($str1,'',$str2) != $str2 )
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
?>