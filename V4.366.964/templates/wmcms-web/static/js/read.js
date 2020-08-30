$(document).ready(function(){
	//反馈提交
	$("#message_sub").click(function(){
		var type = $("[name=type]:checked").val();
		var novel = $("#message_novel").html();
		var content = $("#content_msgg").val();
		if(  content== '' ){
			$("#content").addClass("ac-tip-border");
			$("#content_tip").addClass("ac-tip-error");
		}else{
			content = "【"+novel+"】"+type+content;
			$.ajax({
				type:"POST",
				url:"/wmcms/action/index.php?action=message.add&ajax=yes",
				data:{'content':content},
				dataType:"json",
				success:function(data)
				{
					var msg =  data.msg;
					if( data.code == 200 ){
						msg = '恭喜您，反馈成功，请等待管理员查看并处理！';
					}
					easyDialog.open({container : {content :msg},autoClose : 2000});
				},
				error:function (e)//服务器响应失败处理函数
	            {
					console.log(e);
	                alert(e);
	            },
				async:true,
			});
		}
	});
});