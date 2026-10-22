//显示遮罩
function ShowDialogMask(){
    $('.ui-dialog-container').css('display','block');
    $('.ui-dialog').hide();
    $('.ui-dialog-title').html('');
    $('.ui-dialog-body').html('');
    $('.ui-dialog-footer').hide();
}
//显示弹窗内容
function ShowDialog(){
    $('.ui-dialog-container').css('display','block');
    $('.ui-dialog').css({'display':'inline-block','width':'504px'});
    $('.ui-dialog-title').html('当前可选的编辑组有<span class="sub-title">发布审核通过后编辑组将无法修改，请谨慎选择</span>');
    $('.ui-dialog-body').html('aa');
    $('.ui-dialog-footer').show();
}
//关闭弹窗
function HideDialog(){
    ShowDialogMask();
    $('.ui-dialog-container').css('display','none');
}

$(document).ready(function(){
	$("#close,#sure,.icon-close").click(function(){
	    HideDialog();
	});
});