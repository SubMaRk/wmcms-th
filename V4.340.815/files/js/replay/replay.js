//by 未梦
//评论js系统
//使用方法：
//id="wmcms_replay" 容器
//设置初始属性cid内容id，和module
//引用js文件 /files/js/replay.js
var replayconfig;
document.write('<script src="/files/js/insertContent.js"></script>');
$(document).ready(function(){
	var isOpenFace = false;
	var faceTitle = faceTitleCur = faceListHtml = faceList = fileName = file = '' ;
	var codeHtml = '';
	//获得当前区域的宽度，$("#wmcms_replay").width(); 
	//加载评论框的css
	$("<link>").attr({ rel: "stylesheet",type: "text/css",href: "/files/js/replay/default/default.css"}).appendTo("head");

	//加载表情
	$.getJSON('/files/face/replay.json',null,function(faceObj){
		for(var i in faceObj){
			faceTitleCur = '';
			if(i==0){
				faceTitleCur = 'wmcms_replay_face_title_cur';
			}
			faceTitle += '<li data-id="'+faceObj[i]['floder']+'" class="'+faceTitleCur+'">'+faceObj[i]['title']+'</li>';
			faceList = '';
			for(var j=1;j<=faceObj[i]['number'];j++){
				if(j>40){break;}
				fileName = faceObj[i]['url'].replace('{i}',j);
				file = fileName.split("."); //字符分割 
				faceList += '<li data-face="{face:'+faceObj[i]['floder']+'|'+file[0]+'}"><img src="/files/face/'+faceObj[i]['floder']+'/'+fileName+'"/></li>';
			}
			faceListBox = '';
			if(i>0){
				faceListBox= 'display:none';
			}
			faceListHtml +='<ul id="face_'+faceObj[i]['floder']+'_list" class="wmcms_replay_face_list" style="'+faceListBox+'">'+faceList+'</ul>';
		}
		$(".wmcms_replay_face_box").html('<ul class="wmcms_replay_face_title">'+faceTitle+'</ul><div style="clear:both"></div>'+faceListHtml);
	});
	//标题。
	if(codeOpen == '1'){
		var codeHtml = '<div class="wmcms_replay_codebox">验证码：'+$("#wmcms_replay_code_form").html()+'<input type="text" id="wmcms_replay_code"></div>';
	}
	var titlebox='<div class="wmcms_replay_titlebox"><span id="wmcms_repaly_title">最新评论</span>(<i id="wmcms_replay_sum">0</i>人参与 , <i id="wmcms_replay_num">0</i>条评论)</div>';
	var frombox='<div class="wmcms_replay_frombox"><div class="wmcms_replay_header"><img src="/files/images/nohead.gif" width="80" height="80" /><div class="wmcms_repaly_nickname" id="wmcms_repaly_nickname">游客</div></div><div class="wmcms_replay_from"><textarea  class="wmcms_replay_textarea" id="wmcms_replay_content" placeholder=""></textarea><div class="wmcms_replay_tool"><div class="wmcms_replay_buttonbox"><input class="wmcms_replay_button" id="submit" type="button" value="发 布" /></div>'+codeHtml+'<div class="wmcms_replay_face"></div></div><div class="wmcms_replay_face_box"></div></div></div><div class="wmcms_replay_listbox"><div class="wmcms_replay_nodata" id="wmcms_replay_loding"><img src="/files/js/replay/default/waiting.gif" style="vertical-align:middle"/> &nbsp;&nbsp;加载评论中...</div><div class="wmcms_replay_nodata" style="display:none" id="wmcms_replay_nodata"></div><div class="wmcms_replay_listbox" id="wmcms_replay_listhotbox" style="display:none"><div class="wmcms_replay_listtitle">热门评论</div><div class="wmcms_replay_hotlist"><ul></ul></div></div><div class="wmcms_replay_listbox" id="wmcms_replay_listbox" style="display:none" ><div class="wmcms_replay_listtitle">最新评论</div><div class="wmcms_replay_list"><ul></ul></div></div></div><div class="clear"></div>';
	//插入到网页相关ID中
	$("#wmcms_replay").html(titlebox+frombox);

	//表情修改鼠标悬浮样式
	$(".wmcms_replay_face").hover(function(){
		$(this).removeClass("wmcms_replay_face").addClass("wmcms_replay_facehover");
	},function(){
		if(isOpenFace == false){
			$(this).removeClass("wmcms_replay_facehover").addClass("wmcms_replay_face");
		}
	});
	//开启表情操作
	$(".wmcms_replay_face").click(function(){
		isOpenFace = true;
		$(this).addClass('wmcms_replay_facehover');
		$(".wmcms_replay_face_box").show();
	});
	//发票评论按钮
	$(".wmcms_replay_button").hover(function(){
		$(this).removeClass("wmcms_replay_button").addClass("wmcms_replay_buttonhover");
	},function(){
		$(this).removeClass("wmcms_replay_buttonhover").addClass("wmcms_replay_button");
	});
	//表情分类点击
	$("#wmcms_replay").on("click",".wmcms_replay_face_title li",function(){//修改成这样的写法
		$(".wmcms_replay_face_title li").removeClass('wmcms_replay_face_title_cur');
		$(this).addClass('wmcms_replay_face_title_cur');
		$(".wmcms_replay_face_list").hide();
		$('#face_'+$(this).data('id')+'_list').show();
	});
	//表情点击
	$("#wmcms_replay").on("click",".wmcms_replay_face_list li",function(){//修改成这样的写法
		$("#wmcms_replay_content").insertContent($(this).data('face'));
	});
	
	//读取默认配置
	replayconfig = load_config();
	//读取第一页评论
	var pageconfig=get_replaylist(1,'id','list');
	//修改网页默认配置
	$("#wmcms_repaly_title").html(replayconfig.boxname);
	$("#wmcms_repaly_nickname").html(replayconfig.nickname);
	$("#wmcms_replay_content").attr('placeholder',replayconfig.input);
	$(".wmcms_replay_header img").attr('src',replayconfig.head);
	$("#wmcms_replay_sum").html(pageconfig.sum);
	$("#wmcms_replay_num").html(pageconfig.datacount);
	//读取分页
	if(parseInt(pageconfig.datacount)>parseInt(replayconfig.list_limit)){
		$(".wmcms_replay_list").append('<div class="wmcms_replay_pagelist">'+replay_pagelist(pageconfig.page,pageconfig.sumpage,pageconfig.datacount,replayconfig.page_count)+'</div>');
	}
	//读取热门评论
	if(parseInt(pageconfig.datacount)>parseInt(replayconfig.hot_display)){
		get_replaylist(1,'hot','hot');
	}
	
	//数字翻页的样式
	$(".wmcms_replay_pagelist li").hover(function(){
		if($(this).attr("class")!="wmcms_replay_list_hover"){
			$(this).attr("style","border:#4d82a2 1px solid");
		}
	},function(){
		$(this).attr("style","");
	});
	
	
	//监听关闭表情事件
	$(document).on('mousedown',function(e){
        if( !$(e.target).is($('.wmcms_replay_facehover') ) && !$(e.target).is($('.wmcms_replay_face_box') ) && $(e.target).parents('.wmcms_replay_face_box').length === 0){
			$('.wmcms_replay_face_box').hide();
			$('.wmcms_replay_facehover').removeClass('wmcms_replay_facehover').addClass('wmcms_replay_face');
        }
    });
	
	//提交数据
	var ispost='0';//防止重复提交设置
	$("#submit").click(function(){
		if(ispost=='0'){
			var content=$("#wmcms_replay_content").val();
			var code=$("#wmcms_replay_code").val();
			if(content==''){
				alert("对不起，请输入评论内容!");
			}else if(codeOpen == '1' && code==''){
				alert("对不起，请输入验证码!");
			}else{
				ispost='1';
				$("#submit").addClass("wmcms_replay_buttonclick");
				$("#submit").val("发表中");
				$.ajax({
					type:"POST",
					url:"/wmcms/action/index.php?action=replay.add",
					data:{
						'module':module,
						'cid':cid,
						'ajax':'yes',
						'content':content,
						'form_token':token,
						'code':code,
					},
					dataType:"json",
					success:function(data){
						if(data.code == "200"){
							token = data.token;
							$(".wmcms_replay_list ul").prepend('<li><div class="wmcms_replay_replayheader"><img src="'+data.data.user_head+'" width="80" height="80" /></div><div class="wmcms_replay_replay"><div><div class="wmcms_replay_replaytime">刚刚</div><div class="wmcms_replay_replaynickname"><a href="javascript:void(0)">'+data.data.replay_nickname+'</a> [中国用户]</div></div><div><div class="wmcms_replay_replaycontent">'+data.data.replay_content+'</div><div class="wmcms_replay_replaydc"><div class="curc" onmouseover="dingcaihover(this,\'c\')" onmouseout="dingcaiout(this,\'c\')"><div class="right">0</div><i class="wmcms_replay_replayc"></i></div><i style=" width:10px;" class="right">&nbsp;</i><div class="curd" onmouseover="dingcaihover(this,\'d\')" onmouseout="dingcaiout(this,\'d\')"><div class="right">0</div><i class="wmcms_replay_replayd"></i></div></div></div></div></li>');
							$("#wmcms_replay_nodata").hide();
							$("#wmcms_replay_listbox").show();
							$("#wmcms_replay_sum").html(parseInt($("#wmcms_replay_sum").html())+1);
							$("#wmcms_replay_num").html(parseInt($("#wmcms_replay_num").html())+1);
						}else{
							alert(data.msg);
						}
						$("#submit").removeClass("wmcms_replay_buttonclick");
						$("#submit").val("发 布");
						ispost='0';
					},
					async:false,
				});
			}
		}
	});
});

//顶踩的悬浮样式
function dingcaihover(obj,t){
	$(obj).addClass("wmcms_replay_replaytext");
	$(obj).children("i").addClass("wmcms_replay_replay"+t+"hover");
}
function dingcaiout(obj,t){
	$(obj).removeClass("wmcms_replay_replaytext");
	$(obj).children("i").removeClass("wmcms_replay_replay"+t+"hover");
}
//处理顶踩操作
function dingcaiclick(obj,t,id){
	if(t=='d'){
		type='ding';
	}else{
		type='cai';
	}
	$.ajax({
		type:"POST",
		url:"/wmcms/action/index.php?action=dingcai."+type,
		data:{
			'cid':id,
			'module':'replay',
			'ajax':'yes',
		},
		
		dataType:"json",
		success:function(data){
			if(data.code == "200"){
				$(obj).children("div").html(parseInt($(obj).children("div").html())+1);
			}else{
				alert(data.msg);
			}
		},
	});
}

//读取小说评论配置。
function load_config(){
	var result;
	$.ajax({
		type:"POST",
		url:"/wmcms/action/index.php?action=replay.config",
		data:{
			'ajax':'yes',
			'module':module,
		},
		dataType:"json",
		success:function(data){
			if(data.code == "200"){
				result = data.data;
			}else{
				alert(data.msg);
			}
		},
		async:false,
	});
	return result;
}
//读取评论列表内容
function get_replaylist(page,order,lt){
	var result;
	$.ajax({
		type:"POST",
		url:"/wmcms/action/index.php?action=replay.list",
		data:{
			'ajax':'yes',
			'module':module,
			'cid':cid,
			'page':page,
			'order':order,
		},
		dataType:"json",
		success:function(data){
			token = data.data.token;
			if(data.data.datacount=='0'){
				$("#wmcms_replay_loding").hide();
				if( order != 'hot' )
				{
					$("#wmcms_replay_nodata").html(replayconfig.no_data);
					$("#wmcms_replay_nodata").show();
				}
			}else{
				$("#wmcms_replay_loding").hide();
				$("#wmcms_replay_listbox").show();
				var lists=data.data.data;

				var listhtml='';
				for(var o in lists){
					if( lists[o].user_head == '' ){
						lists[o].user_head = replayconfig.no_head;
					}
					listhtml+='<li><div class="wmcms_replay_replayheader"><img src="'+lists[o].user_head+'" width="80" height="80" /></div><div class="wmcms_replay_replay"><div><div class="wmcms_replay_replaytime">'+getTime(lists[o].replay_time)+'</div><div class="wmcms_replay_replaynickname"><a href="'+lists[o].fhome+'">'+lists[o].replay_nickname+'</a> [中国用户]</div></div><div><div class="wmcms_replay_replaycontent">'+lists[o].replay_content+'</div><div class="wmcms_replay_replaydc"><div class="curc" onmouseover="dingcaihover(this,\'c\')" onmouseout="dingcaiout(this,\'c\')" onclick="dingcaiclick(this,\'c\','+lists[o].replay_id+')"><div class="right">'+lists[o].replay_cai+'</div><i class="wmcms_replay_replayc"></i></div><i style=" width:10px;" class="right">&nbsp;</i><div class="curd" onmouseover="dingcaihover(this,\'d\')" onmouseout="dingcaiout(this,\'d\')" onclick="dingcaiclick(this,\'d\','+lists[o].replay_id+')"><div class="right">'+lists[o].replay_ding+'</div><i class="wmcms_replay_replayd"></i></div></div></div></div></li>'
				}

				//数据向最后插入
				if(lt=='list'){
					$(".wmcms_replay_list ul").html(listhtml);
				}else{
					$("#wmcms_replay_listhotbox").show();
					$(".wmcms_replay_hotlist ul").html(listhtml);
					$(".wmcms_replay_hotlist .curd").addClass("wmcms_replay_replaytext");
					$(".wmcms_replay_hotlist .wmcms_replay_replayd").addClass("wmcms_replay_replaydhover");
				}
			}
			result = data.data;
		},
		async:false,
	});
	return result;
}

//格式化时间
function getTime(/** timestamp=0 **/) {
	var ts = arguments[0] || 0;
	var t,y,m,d,h,i,s;
	t = ts ? new Date(ts*1000) : new Date();
	y = t.getFullYear();
	m = t.getMonth()+1;
	d = t.getDate();
	h = t.getHours();
	i = t.getMinutes();
	s = t.getSeconds();
	// 可根据需要在这里定义时间格式
	return y+'年'+(m<10?'0'+m:m)+'月'+(d<10?'0'+d:d)+'日 '+(h<10?'0'+h:h)+':'+(i<10?'0'+i:i)+':'+(s<10?'0'+s:s);
}

//更换数字
function jumppage(page){
	var pageconfig=get_replaylist(page,'id','list');
	$(".wmcms_replay_pagelist").html(replay_pagelist(page,pageconfig.sumpage,pageconfig.datacount,replayconfig.page_count));
}

/**
 * 跳页函数
 * 参数1，当前页数
 * 参数2，总页数
 * 参数3，总数据量
 * 参数4，每页显示的条数
 */
function replay_pagelist(page,sumpage,datacount,replaypagenum){
	page=parseInt(page);
	sumpage=parseInt(sumpage);
	datacount=parseInt(datacount);
	replaypagenum=parseInt(replaypagenum);
	
	if(datacount>replaypagenum){
		var indexpage='',lastpage='',pagelist='',startnum=1,endnum=1;
		if(sumpage>3){
			if(page>replaypagenum){
				indexpage='<li onclick="jumppage(1)">1</li><li>...</li>';
			}
			if(sumpage>page){
				lastpage='<li>...</li><li onclick="jumppage('+sumpage+')">'+sumpage+'</li>';
			}
			if(page-replaypagenum<1){
				startnum=1;
				endnum=replaypagenum*2+1;
			}else if(page-replaypagenum>1){
				if(replaypagenum*2+page>=sumpage){
					startnum=page-replaypagenum;
					endnum=startnum+replaypagenum*2;
					if(endnum>sumpage){
						endnum=sumpage;
					}
				}else{
					startnum=page-replaypagenum;
					endnum=replaypagenum*2+page-replaypagenum;
				}
			}
		}else{
			startnum=1;
			endnum=sumpage;
		}
		for(i=startnum;i<=endnum;i++){
			if(page==i){
				pagelist+='<li class="wmcms_replay_list_hover">'+i+'</li>';
			}else{
				pagelist+='<li onclick="jumppage('+i+')">'+i+'</li>';
			}
		}
	}
	return indexpage+pagelist+lastpage;
}