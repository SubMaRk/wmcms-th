(function() {

    function isMoblie() {
        if(!navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
            $("body").addClass("app_NoMoblie");
        }else{
            $("body").removeClass("app_NoMoblie");
        }
    }

    $('body').on('click','.app_meskSection',function () {
        $('.app_header_second').hide();
        $('.app_meskSection').hide();
        $('#header').removeClass('app_headerFixed2');
        $('.moreIco').removeClass('closeIco');
    });

    $('.app_header_back').click(function () {
        window.history.go(-1);
    });

    $('.moreIco').click(function () {
        if($(this).hasClass('closeIco')){
            $('#header').removeClass('app_headerFixed2');
            $(this).removeClass('closeIco');
            $('.app_header_second').hide();
            $('.app_meskSection').hide();
        }else{
            $('#header').addClass('app_headerFixed2');
            $(this).addClass('closeIco');
            $('.app_header_second').show();
            $('.app_meskSection').show();
        }
    });

    /** 点击完成按钮 */
    $('#success').click(function () {
        $('#administration').show();
        $(this).hide();
        $('#list .rightJustTime').show();
        $('#list .deleteBlock').hide();
    });

    /** 点击管理 */
    $('#administration').click(function () {
        $(this).hide();
        $('#success').show();
        $('#list .rightJustTime').hide();
        $('#list .deleteBlock').show();

    });
		
		/*上传头像按妞*/
		$('#hide_button').on('change',function(){
		    $.ajaxFileUpload({
		        url: '/wmcms/action/index.php?action=upload.userhead', //用于文件上传的服务器端请求地址
						type: 'post',
		        secureuri: false, //是否需要安全协议，一般设置为false
		        fileElementId: 'hide_button', //文件上传域的ID
		        data:{ajax:'yes',module: 'user'},
		        dataType: 'json', //返回值类型 一般设置为json
		        success: function (data){ //服务器成功响应处理函数
		        	if( data.code == 500 ){
		        		alert(data.msg);
		        	}else{
							//设置头像url
			        $("#head").attr("src", data.data.file);
			        var headImg = data.data.file;
			        $.ajax({
							type:"POST",
							url:"/wmcms/action/index.php?action=user.savehead",
							data:{'src':headImg,'ajax':'yes'},
							dataType:"json",
							success:function(data)
							{
								var code = 1;
								if (data.code==200) {
									code = 4;
								}
								layer.open({content: data.msg,time: 2});
							},
							error:function (e)//服务器响应失败处理函数
									{
											alert(e);
									},
							async:true,
							});
		        	}
		        },
		        error: function(e) {
		        	alert(e);
		        } 
		     })
		});

    $(window).resize(function () {
        isMoblie();
    });

    newcode=function(){
        var verifyimg = $("#imgCode").attr("src");
        if (verifyimg.indexOf('?') > 0) {
            $("#imgCode").attr("src", verifyimg + '&random=' + Math.random());
        } else {
            $("#imgCode").attr("src", verifyimg.replace(/\?.*$/, '') + '?' + Math.random());
        }
        $("#code").val('');
    }

    $("#imgCode").click(function() {
        newcode();
    });

})();