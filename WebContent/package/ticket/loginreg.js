$(document).ready(function(){
//回车绑定事件
document.onkeydown=function(event){
	e = event ? event :(window.event ? window.event : null); 

	if(e.keyCode==13){ 
	   if($('#login-area').css('display') != 'none'){
	      checklogin();
	   }else{
	      checkreg();
	   }
	};
};

$("#login-btn").click(function(){
	checklogin();
});
$("#reg-btn").click(function(){
	checkreg();
});

$(".logreg-box .close-button").click(function(){
	$(this).parent().hide();
	$('.pop-bg').fadeOut();
});

$("#to-reg").click(function(){
  $(".error-txt").html('').hide();
  $('#login-area').hide();
  $("#login-area").css('z-index','9999998'); 
  $("#reg-area").css('z-index','9999999'); 
  $('#reg-area').fadeIn();
});
$("#to-login").click(function(){
  $(".error-txt").html('').hide();
  $('#reg-area').hide();
  $("#reg-area").css('z-index','9999998'); 
  $("#login-area").css('z-index','9999999'); 
  $('#login-area').fadeIn();
});
$(".logreg-zonebg").Slider({prevId:'.arrw-left',nextId:'.arrw-right',shownum:1,offbtn:'off_btn',offline:1});
});


//登录
function checklogin(){
  var uemail=$("#uemail"),upassword=$("#upassword"),uerror=$(".error-txt");
  
  if(uemail.val()==""){
		uerror.eq(0).html('请填写邮箱').show();
		return false;
	}else{
		
		var filter=/^\s*([A-Za-z0-9_-]+(\.\w+)*@(\w+\.)+\w{2,3})\s*$/;
		if (!filter.test(uemail.val())) { 
			uerror.eq(0).html("邮箱格式有误").show();
			return false; 
		}else{
			uerror.eq(0).html('').hide();		
		}
	}
	
	if(upassword.val()==""){
		uerror.eq(1).html('请填写密码').show();
		return false;
	}else{
		uerror.eq(1).html('').hide();
	}
	
	var remember = $('input[name=remember]:checked').val();
	
	var data = 'isajax=1&remember='+remember+'&email='+uemail.val()+'&password='+upassword.val();

	$('#login-area').hide();
	$('.pop-bg').fadeOut();
	$.cookie('aier_user_name', uemail.val());
	$("#user-name").html( uemail.val() );
}
//注册
function checkreg(){
  var isshareshow = $("input[name='isshareshow']").val();
  var isinvite = $("input[name='isinvite']").val();
  
  var s = window.location.search;
 
  //u = gettourl(s);
  //alert(u);
  //return;
  var uemail=$("#reguemail"),upassword=$("#regupassword"),uerror=$(".error-txt");
  
  if(uemail.val()==""){
		uerror.eq(3).html('请填写邮箱').show();
		return false;
	}else{
		
		var filter=/^\s*([A-Za-z0-9_-]+(\.\w+)*@(\w+\.)+\w{2,3})\s*$/;
		if (!filter.test(uemail.val())){ 
			uerror.eq(3).html("邮箱格式有误").show();
			return false; 
		}else{
			uerror.eq(3).html('').hide();		
		}
	}
	
	if(upassword.val()==""){
		uerror.eq(4).html('请填写密码').show();
		return false;
	}else{
		uerror.eq(4).html('').hide();
	}
	var agreeterms = $('input[name=agreeterms]:checked').val();
	//alert();
	if(agreeterms){
	  uerror.eq(5).html('').hide();
	}else{
	  uerror.eq(5).html('请勾选同意服务条款').show();
		return false;
	}
	var book = $('input[name=book]:checked').val();
	var data = 'isajax=1&agreeterms='+agreeterms+'&book='+book+'&email='+uemail.val()+'&password='+upassword.val();
  
	$('#reg-area').hide();
	$('.pop-bg').fadeOut();
	$.cookie('aier_user_name', uemail.val());
	$("#user-name").html( uemail.val() );
	//$("#regform").submit();
}
//获取跳转链接
function gettourl(param){
  var url = window.location.href;
  var len = window.location.href.toLowerCase().indexOf('share_show');
  if(param != ''){
    url = "http://"+window.location.host+'/'+param;
  }else{
    if(len > 0){
      url = url.substring(0,len); 
    }else{
      url = "http://"+window.location.host;
    }
  }
  
  return url;
}