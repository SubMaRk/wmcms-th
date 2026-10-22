/**
 * 检查是否是邮箱
 * 参数1，必须 字符串
 */
function isEmail(str){ 
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	return reg.test(str); 
}

/**
 * 检查是否是正整数。
 * 参数1，必须 字符串
 */
function isPositiveNum(str){
	if( str== '0' ){
		return true;
	}
	var re = /^[0-9]*[1-9][0-9]*$/;
    return re.test(str); 
} 

/**
 * 检查是否是英文、数字和中文。
 * 参数1，必须 字符串
 */
function isString(str){
	var re = /^[\d|A-z|\u4E00-\u9FFF]+$/;
    return re.test(str); 
} 

/**
 * 检查是否是中文或者字母组合
 * 参数1，必须，字符串
 */
function isName(str){  
     var re =  /^[0-9a-zA-Z|\u4E00-\u9FFF]*$/g;
     return re.test(str);
}

/**
 * 判断是否为手机号
 * 参数1，必须，字符串
 */
function isPhone(str){
	var re = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	return re.test(str);
}

/**
 * 判断是否为身份证号
 * 参数1，必须，字符串
 */
function isCardId(sId){
	var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
	var iSum=0;
	var info="";
	if(!/^\d{17}(\d|x)$/i.test(sId)){
		//return "你输入的身份证长度或格式错误";
		return false;
	}
	sId=sId.replace(/x$/i,"a");
	if(aCity[parseInt(sId.substr(0,2))]==null){
		//return "你的身份证地区非法";
		return false;
	}
	sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
	var d=new Date(sBirthday.replace(/-/g,"/")) ;
	if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate())){
		//return "身份证上的出生日期非法";
		return false;
	}
	for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;
	if(iSum%11!=1){
		//return "你输入的身份证号非法";
		return false;
	}
	//aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女");//此次还可以判断出输入的身份证号的人性别
	return true;
}


/**
 * 将对象转为html
 * 参数1，必须，对象
 * 参数2，必须，内容模版
 * 参数3，选填，前置html代码
 * 参数4，选填，后置html代码
 */
function objToHtml(obj , tpl , before , last ){
	var html=field='';
	tplArr = tpl.match(/{(.*?)}/g);
	for(var o in obj){
		newTpl = tpl;
		for(var i=0;i<tplArr.length;i++){
			field = tplArr[i].replace('{','');
			field = field.replace('}','');
			newTpl = newTpl.replace(tplArr[i],obj[o][field]);
		}
		html = html + newTpl;
    }
	if(typeof(before) != 'undefined' ){
		html = before+html;
	}
	if(typeof(last) != 'undefined' ){
		html = html+last;
	}
	return html;
}


/**
 * 中文字数统计
 * 参数1，必须，需要检查的字符串
 */
function wordsNumber(str){
	//先将回车换行符做特殊处理
	str = str.replace(/(\r\n+|\s+|　+)/g,"龘");
	//处理英文字符数字，连续字母、数字、英文符号视为一个单词
	str = str.replace(/[\x00-\xff]/g,"m");	
	//合并字符m，连续字母、数字、英文符号视为一个单词
	str = str.replace(/m+/g,"*");
	//去掉回车换行符
	str = str.replace(/龘+/g,"");
	//返回字数
	sLen = str.length;
	return sLen;
}


/*
 *功能： 模拟form表单的提交
 *参数： URL 跳转地址 PARAMTERS 参数
 */
function Post(URL, PARAMTERS ,Type){
	//创建form表单
	var temp_form = document.createElement("form");
	temp_form.action = URL;
	//如需当前窗口打开，form的target属性要设置为'_self'
	if(!arguments[2]) Type = "_blank";
	if(Type=='_blank'){
		temp_form.target = "_blank";
	}else{
		temp_form.target = "_self";
	}
	temp_form.method = "post";
	temp_form.style.display = "none";
	//添加参数
	for (var item in PARAMTERS){
		var opt = document.createElement("input");
		opt.name = item;
		opt.value = PARAMTERS[item];
		temp_form.appendChild(opt);
	}
	document.body.appendChild(temp_form);
	//提交数据
	temp_form.submit();
 }


/**
 * 获取cookie
 * 参数1，必须，cookie名字
 */
function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	arr = document.cookie.match(reg);
	if (arr){
		return arr[2];
	}else {
		return null;
	}
}

/**
 * 设置cookie
 * 参数1，必须，cookie名字
 * 参数2，必须，cookie值
 * 参数3，必须，超时时间
 * 参数4，必须，存储路径
 * 参数5，必须，保存域名
 */
function setCookie(name, value,expires, path, domain ) {
	if(expires){
		expires = new Date(+new Date() + expires);
	}else{
		expires = new Date(+new Date() + 60*60*24*365*1000);
	}
	var tempcookie = name + '=' + escape(value) +
		((expires) ? '; expires=' + expires.toGMTString() : '') +
		((path) ? '; path=' + path : '') +
		((domain) ? '; domain=' + domain : '');
	if(tempcookie.length < 4096) {
		document.cookie = tempcookie;
	}
}

//全屏
function FullScreen() {
  var element = document.documentElement;
  if (element.requestFullscreen) {
      element.requestFullscreen();
  } else if (element.msRequestFullscreen) {
      element.msRequestFullscreen();
  } else if (element.mozRequestFullScreen) {
      element.mozRequestFullScreen();
  } else if (element.webkitRequestFullscreen) {
      element.webkitRequestFullscreen();
  }
}
//退出全屏 
function ExitFullscreen() {
  if (document.exitFullscreen) {
      document.exitFullscreen();
  } else if (document.msExitFullscreen) {
      document.msExitFullscreen();
  } else if (document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
  } else if (document.webkitExitFullscreen) {
      document.webkitExitFullscreen();
  }
}

/*
 *功能： 秒转换为时分秒
 *参数： second秒
 *参数： temp 模版
 */
function FormatSeconds(second,temp){
    let result = parseInt(second)
    let h = Math.floor(result / 3600) < 10 ? '0' + Math.floor(result / 3600) : Math.floor(result / 3600);
    let m = Math.floor((result / 60 % 60)) < 10 ? '0' + Math.floor((result / 60 % 60)) : Math.floor((result / 60 % 60));
    let s = Math.floor((result % 60)) < 10 ? '0' + Math.floor((result % 60)) : Math.floor((result % 60));
    if( !temp ){
    	return h+':'+h+':'+s;
    }else{
    	temp = temp.replace(/h/, h)
    	temp = temp.replace(/m/, m)
    	temp = temp.replace(/s/, s)
    	return temp;
    }
}

//获得当前窗口区域高度
function GetClientHeight(){
  var clientHeight=0;
  if(document.body.clientHeight&&document.documentElement.clientHeight){
      clientHeight = (document.body.clientHeight<document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
  } else {
      clientHeight = (document.body.clientHeight>document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
  }
  return clientHeight;
}