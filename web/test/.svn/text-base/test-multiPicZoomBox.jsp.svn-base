<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>多图缩放显示</title>
<script type="text/javascript" src="/asn/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="/asn/js/jqzoom_ev1.0.1/js/jqzoom.pack.1.0.1.js"></script>
<link rel="stylesheet" href="/asn/js/jqzoom_ev1.0.1/css/jqzoom.css"
	type="text/css">
<script type="text/javascript"
	src="/asn/js/jcarousel-0.2.4/lib/jquery.jcarousel.js"></script>
<link rel="stylesheet" href="/asn/js/jcarousel-0.2.4/skins/tango/skin.css"
	type="text/css">
</head>
<body>
<script type="text/javascript">
	picList = [
	       	{url:"/asn/pic/product/s1268639473584.jpg"},
	       	{url:"/asn/pic/product/s1268640358884.jpg"},
	       	{url:"/asn/pic/product/s1268640191945.jpg"},
	       	{url:"/asn/pic/product/s1268640605378.jpg"}
	];
	$(document).ready(function() {
		$("*[rel=jqzoom]").jqzoom({
			zoomWidth : 200,
			zoomHeight : 180,
			xOffset : 10,
			yOffset : 0,
			position : "right"
		});
		$("#picbox").jcarousel({
			size: picList.length,
	        itemLoadCallback: {onBeforeAnimation: picbox_itemLoadCallback}
		});
		$(".jcarousel-skin-tango").css("margin", "8px");
		$("#picbox").find("li").each(function(){
				
		});
	});

	function picbox_itemLoadCallback(picbox,state) {
		 for (var i = picbox.first; i <= picbox.last; i++) {
		        if (picbox.has(i)) {
		            continue;
		        }
		        if (i > picList.length) {
		            break;
		        }

		        picbox.add(i, picbox_getItem(picList[i-1]));
		 }
	}

	function picbox_getItem(it) {
		return '<img src="' + it.url + '" width="55" height="55" alt="' + it.url + '" />';
	}
	
</script>
<!-- 多图显示需要使用A标签 -->
<!--<div style="float:left;" id="smlpics">
	<ul>
		<li><img src="/asn/pic/product/s1268639473584.jpg"/></li>
		<li><img src="/asn/pic/product/s1268640358884.jpg"/></li>
		<li><img src="/asn/pic/product/s1268640191945.jpg"/></li>
		<li><img src="/asn/pic/product/s1268640605378.jpg"/></li>
	</ul>
</div>-->
<div id="wrap">
<a href="/asn/pic/product/b1268639731568.jpg" rel="jqzoom"> <img
	src="/asn/pic/product/b1268639731568.jpg"/> </a>
<ul id="picbox" class="jcarousel-skin-tango"></ul>
</div>
</body>
</html>