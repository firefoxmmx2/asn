<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  String cp=request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>廣告測試</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<!--<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>-->
</head>
<body>
	<!--<div id="page-wrap" style="overflow: hidden;position: relative; width: 300px;">
		<div id="slider" style="overflow: hidden;position: relative;">
		<div id="mover">
			<div class="slide" style="float: left;"><a href="javascript:void(0);"><img src="/asn/web/pic/product/b1268639473584.jpg" border="0"/></a></div>
			<div class="slide" style="float: left;"><a href="javascript:void(0);"><img src="/asn/web/pic/product/b1268639731568.jpg" border="0"/></a></div>
			<div class="slide" style="float: left;"><a href="javascript:void(0);"><img src="/asn/web/pic/product/b1268641609485.jpg" border="0"/></a></div>
		</div>
		</div>
	</div>-->
	
	<div id="container" class="mobansContainer" style="width:544px;height: 300px;">
		<ul id="slider" class="slider">
			<li><a href="javascript:void(0);"><img src="/asn/web/pic/product/b1268639473584.jpg" border="0"/></a></li>
			<li><a href="javascript:void(0);"><img src="/asn/web/pic/product/b1268639473584.jpg" border="0"/></a></li>
			<li><a href="javascript:void(0);"><img src="/asn/web/pic/product/b1268639473584.jpg" border="0"/></a></li>
		</ul>
		<ul class="numberbar">
			<li>1</li>
			<li>2</li>
			<li>3</li>
		</ul>
	</div>
	<style type="text/css">
	  .mobansContainer{margin:0; padding:0;position:relative;overflow:hidden;}
      .slider{position:absolute;}
      .slider li{ list-style:none;display:inline;}
      .slider img {height:300px;width:544px;border-width:0px;}
      .numberbar{position:absolute; right:5px; bottom:5px;}
      .numberbar li{float: left; color: #FF7300; text-align: center; line-height: 16px; width: 16px; height: 16px; font-family: Arial; font-size: 12px; cursor: pointer; overflow: hidden; margin: 3px 1px; border: 1px solid #FF7300; background-color: #fff;}
      .numberbar li.on{color: #fff; line-height: 21px; width: 21px; height: 21px; font-size: 16px; margin: 0 1px; border: 0; background-color: #FF7300; font-weight: bold;}
      
      a {color:#000000;font-size: 12px;}
	</style>
	<script type="text/javascript">
	/*
	
	function doMove(panelHeight, tooFar) {
	 	var leftValue = $("#slider").css("top");
	 	
	 	// Fix for IE
	 	if (leftValue == "auto") { leftValue = 0; };
	 	
	 	var movement = parseFloat(leftValue, 10) - panelHeight;
	 	
	 	if (movement == tooFar) {
	 		$("#slider").animate({
	 			"top": 0
	 		},2000);
	 	}
	 	else {
	 		$("#slider").animate({
	 			"top": movement
	 		},2000);
	 	}
	 }
	*/

$(document).ready(function(){
	 var $firstmover = $("#container ul li").eq(0);
	 var panelHeight = $firstmover.find("img").css("height");
	 var paddingTop = $firstmover.css("paddingTop");
	 var paddingBottom = $firstmover.css("paddingBottom");
	 //var option = {direction:"top",speed:"normal"};
	  panelHeight = parseFloat(panelHeight,10);
	  paddingTop = parseFloat(paddingTop,10);
	  paddingBottom = parseFloat(paddingBottom,10);
	 panelHeight = panelHeight + paddingTop + paddingBottom;
		var option = {distance:panelHeight,direction:"top",speed:"normal"};
		var gg = new guanggao($("#container"),option,3000);
		gg.draw();
	});
    /**
     * 滚动广告
     * */
    function guanggao(content,option,delaytime){
    	guanggao.option = {};
    	guanggao.defOption = {
    			distance:20,
    			direction:"left",
    			speed:"normal"
    			};
    	guanggao.content = null;
    	guanggao.init = function(content,option,delaytime){
    			guanggao.content = content;
    			if(option != null)
    				guanggao.option = option;
    			guanggao.delaytime = delaytime;
    	};
    	guanggao.delaytime = 0;
    	this.draw = function(){
    		var len  = $(guanggao.content).find(".slider > li").length;
    	    var index = 0;
    	   	if($(guanggao.content).find(".numberbar") != []){
    	   		$(guanggao.content).find(".numberbar li").mouseover(function(){
    	    	    index  =   $(guanggao.content).find(".numberbar li").index(this);
    	    	    domove(index);
    	    	});	
        	}

    	   	$(guanggao.content).hover(
    	    function(){
	    	    if(interval){
	    	    	clearInterval(interval);
	    	    }
	    	    },
    	    function(){
	    	    interval = setInterval(function(){
	    	    	domove(index);
	    	    	index++;
		    	    if(index==len){index=0;}
		    	    } , 
		    	    guanggao.delaytime);
    	    });

    	    
    	    var interval = setInterval(function(){
    	    	domove(index);
    	    index++;
    	    if(index==len){index=0;}
    	    } , guanggao.delaytime);
    	    
        };
        
    	guanggao.domove = function(i){
        	var animateOption = {};
        	var speed = 0;
        	if(guanggao.option["direction"] == "top" || guanggao.option["direction"] == "left")
        		animateOption[guanggao.option["direction"] ] = -guanggao.option["distance"]*i;
        	else
        		animateOption[guanggao.option["direction"] ] = guanggao.option["distance"]*i;
    		if(guanggao.option["speed"] == "fast")
        		speed = 400;
    		else if(guanggao.option["speed"] == "normal")
        		speed = 2000;	
    		else if(guanggao.option["speed"] == "slow")
        		speed = 4000;
    		else 
        		speed = 400;
			$(guanggao.content).find(".slider").stop(true,false).animate(animateOption,speed);
			if($(guanggao.content).find(".numberbar") != [])
				$(guanggao.content).find(".numberbar li").eq(i).addClass("on").siblings().removeClass("on");
        };
        var domove = guanggao.domove;
        guanggao.init(content,option,delaytime);
    };
    
	</script>
</body>
</html>