/*
 * 	Easy Slider 1.5 - jQuery plugin
 *	written by Alen Grakalic	
 *	http://cssglobe.com/post/4004/easy-slider-15-the-easiest-jquery-plugin-for-sliding
 *
 *	Copyright (c) 2009 Alen Grakalic (http://cssglobe.com)
 *	Dual licensed under the MIT (MIT-LICENSE.txt)
 *	and GPL (GPL-LICENSE.txt) licenses.
 *
 *	Built for jQuery library
 *	http://jquery.com
 */


(function($) {

	$.fn.Slider = function(options){
	  
		// default configuration properties
		var defaults = {			
			prevId: 		'prevBtn',
			nextId: 		'nextBtn',	
			controlsShow:	true,
			controlsBefore:	'',
			controlsAfter:	'',	
			controlsFade:	true,
			vertical:		false,
			speed: 			800,
			auto:			false,
			pause:			2000,
			continuous:		false,
			offbtn:			'',
			offline:		1,
			shownum:		0			
		}; 
		
		var options = $.extend(defaults, options);  
			
		this.each(function() {  
			var line = 	options.offline;		   
			var obj = $(this); 				
			var s = $("li", obj).length;
			var w = $("li", obj).width(); 
			var h = $("li", obj).height(); 
			var ts = s % line;	
			if(ts != 0)
			{
				ts =parseInt((s/line));
				
			}
			else
			{
				ts =parseInt((s/line))-1;
			}
			var t = 0;
			if(!options.vertical)$("ul", obj).css('width',s*w);
	       	
			$(options.nextId).click(function(){
													 
				animate("next",true);
			});
			$(options.prevId).click(function(){	
										 
				animate("prev",true);				
			});				
			
			function animate(dir,clicked){
				var ot = t;				
				switch(dir){
					case "next":
						t = (ot>=ts) ? (options.continuous ? 0 : ts) : t+1;						
						break; 
					case "prev":
						t = (t<=0) ? (options.continuous ? ts : 0) : t-1;
						break; 
					case "first":
						t = 0;
						break; 
					case "last":
						t = ts;
						break; 
					default:
						break; 
				};	
				
				var diff = Math.abs(ot-t);
				var speed = diff*options.speed;						
				if(!options.vertical) {
					p = (t*w*-1);
					$("ul",obj).animate(
						{ marginLeft: line*p }, 
						speed
					);				
				} else {
					p = (t*h*-1);
					$("ul",obj).animate(
						{ marginTop: line*p }, 
						speed
					);					
				};
				
				if(!options.continuous && options.controlsFade){	
				//alert(t+"|"+ts);				
					if(t==ts){
						$(options.nextId).addClass(options.offbtn);
					} else {
						$(options.nextId).removeClass(options.offbtn);				
					};
					if(t==0){
						$(options.prevId).addClass(options.offbtn);
					} else {
						$(options.prevId).removeClass(options.offbtn);	
					};					
				};				
				
				if(clicked) clearTimeout(timeout);
				if(options.auto && dir=="next" && !clicked){;
					timeout = setTimeout(function(){
						animate("next",false);
					},diff*options.speed+options.pause);
				};
				
			};
			// init			
			var timeout;
			if(options.auto){
				timeout = setTimeout(function(){
					animate("next",false);
				},options.pause);
			};		
		
			if(!options.continuous && options.controlsFade){				
				$(options.prevId).addClass(options.offbtn);		
			};				
			
		});
	  
	};

})(jQuery);