$(document).ready(function(){

	$("#menu-popbar").hover(function(){
		
		$("#menu-pop").show();
									 
	}, function(){
		
		$("#menu-pop").hide();
		
	}); 								 
	
	$("#navcart-popbar").hover(function(){
		
		$("#navcart-pop").show();
		
	}, function(){
		
		$("#navcart-pop").hide();
		
	}); 
	
	$(".pin").hover(function(){
		
		$(this).find('.pin-name').addClass('pin-name-on');
		$(this).find('.pin-time').fadeIn();
		
	}, function(){
		
		$(this).find('.pin-name').removeClass('pin-name-on');
		$(this).find('.pin-time').fadeOut();
		
	}); 
	
//	$(".pins dt,.pin-pins-img").live("mouseover mouseout",function (event) {
//      if (event.type == "mouseover"){
//        $(this).find('.pins-share').show();
//      }else{
//        if($(this).find('.like23').hasClass('like23-on')){
//    		  $(this).find('.pins-share').show().animate({width:"25px"});
//    		}else{
//    		  $(this).find('.pins-share').hide().animate({width:"25px"});
//    		}
//      }
//  });
	
//	$(".pins dt,.pin-pins-img").hover(function(){
//		
//		$(this).find('.pins-share').show();
//		
//		
//	}, function(){
//	  $(this).find('.pins-share').hide().animate({width:"25px"});
//	}); 
	
	  likehover();
//	$(".like23").click(function(){
//		if($(this).hasClass('like23-on')){
//		  $(this).parent().animate({width:"300px"},1000,'linear');	
//		}else{
//		  alert('hide');
//		}
//	}); 
	
	$('.pl-btn').live("click",function(){	

	}); 
	
	
	$('.flash').hover(function(){
		$('.flash .fbox-info').slideToggle();	
	}, function(){
		$('.flash .fbox-info').slideToggle();
	});
	

});

function getnowtime() {  
 var timestamp = (new Date()).valueOf().toString().substr(0,10);  
 return parseInt(timestamp);  
}

//导航购物车
function minicart(nocount){
  if(nocount){
    var data = 	"countdown=0";
  }else{
    var data = 	"countdown=1";
  }
  
  $.ajax({
		type: "POST",
		url: "/shopping/cart",
		dataType:"json",
		cache: false,
		data: data+"&m=" + Math.random(),
		beforeSend:function(){},
		success:function(re){
		  $('#cart_total_quantity_value').html(re.data.num);
		  $('#navcart-pop').html(re.data.html);
		  $('#navcart-popbar').show();
		},error:function(){
				//alert('未知错误');
				return;
			}
	});
}

function DownCount(){
  if(actnum <= 0){
    return;
  }
	for(var i=0;i<actnum;i++){
		if(endtimes[i]<=0){
			$("#ongoing_"+i).html("0秒"); 
		}else{			
			timechange(endtimes[i],i);	
			endtimes[i] = endtimes[i]-1;
		}
	}
}
function timechange(expires,i){
	if(expires > 0){
		var second = expires;
	}else{
		var second = "分";
		return second;
	}
	var day = hour = minutes = "";
	if(second>86400){
		day = Math.floor(second/86400)+" 天";
		second = second%86400;
	}
	if(second>3600){
		hour = Math.floor(second/3600);
		hour = hour.toString();
		if(hour.length==1){
			hour = hour + " 小时";
		}else{
			hour = hour + " 小时";
		}
		second = second%3600;
	}
	if(second>60){
		minutes = Math.floor(second/60);
		minutes = minutes.toString();
		if(minutes.length==1){
			minutes = minutes + "分";
		}else{
			minutes = minutes + "分";
		}
		second = second%60;
	}
	second = second.toString();
	if(second.length==1){
		second = second + "秒";
	}else{
		second = second + "秒";
	}
	$("#ongoing_"+i).html(day+hour+minutes+second); 
}

function likehover(){
  $(".pins dt,.pin-pins-img").hover(function(){
		
		$(this).find('.pins-share').show();
		
		
	}, function(){

		if($(this).find('.like23').hasClass('like23-on')){
		  $(this).find('.pins-share').show().animate({width:"25px"});
		}else{
		  $(this).find('.pins-share').hide().animate({width:"25px"});
		}
	  
	}); 
}

function popdiv(popdiv,width,height,alpha){
	
	var A = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0; 
	var D = 0;
	D = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
	if (D == 0) {
	D = Math.max(document.body.clientHeight, document.documentElement.clientHeight)
	} 
	var topheight = (A + (D - 300) / 2)-50 + "px"; 	
	$("#popbg").css({height:$(document).height(),filter:"alpha(opacity="+alpha+")",opacity:alpha})
	$("#popbg").fadeIn();
	$(popdiv).removeClass();
	$(popdiv).attr("class","pop_out ");
	$(popdiv).css({left:(($(document).width())/2-(parseInt(width)/2))+"px",top:topheight});
	$(popdiv).fadeIn();
}
//参数：分享网站 分享url 分享内容类型 分享内容名 分享来源页面
function shareto(stype, url, ptype, pname, page){
  mixpanel.track('Share', {'mp_note':'user shared '+pname+' using '+stype,'Share Content':ptype,'Share Name':pname ,'Share Page':page,'Share SNS':stype});
  window.open(url);
}

//参数：分享内容类型 分享内容名 分享来源页面
function tracklike(ptype, pname, page){
  mixpanel.track('Like ', {'mp_note':'user liked '+pname,'Like Content':ptype,'Like Name':pname ,'Like Page':page});
}

//参数：分享内容名 分享来源页面
function trackcomment(pname, page){
  mixpanel.track('Comment ', {'mp_note':'user commented on '+pname,'Comment Name':pname ,'Comment Page': page});
}

