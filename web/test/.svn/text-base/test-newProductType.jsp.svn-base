<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test for asn new productTypeBar</title>
<style>
.hidden {
	display: none;
}

.entry {
	border: 1px solid;
	width: 150px;
}

.items {
	list-style-type: none;
}

.item {
	border-bottom: 1px solid;
}

.extend_item {
	color: gray;
}

.pop-subentry {
	position: absolute;
	width: 300px;
	height: 215px;
	z-index: 1000;
	border: 2px solid;
	border-color: red;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		sub_top = parseInt($('.entry').attr('offsetTop'));
		sub_left = parseInt($('.entry').attr('offsetLeft')) + parseInt($('.entry').css('width')) + 5;
		var offset = {
		left : sub_left,
		top : sub_top
		};
		$('.pop-subentry').offset(offset);
		var delay_close=null;
		
		function hover_active()
		{
			var _self = this;
			
			clearTimeout(delay_close);
			$('.pop-subentry').children().addClass('hidden');
			$('div[id=subentry_' + $(_self).attr('id').split('_')[1] + ']').removeClass('hidden');
			$('.pop-subentry').removeClass('hidden');
		}
		
		function hover_out()
		{
			var _self = this;
			
			delay_close = setTimeout(function(){$('.pop-subentry').addClass('hidden');},1000);
		}
		function hover_active_pop()
		{
			clearTimeout(delay_close);
			$('.pop-subentry').removeClass('hidden');
		}
		
		$('.extend_item').hover(hover_active, hover_out);
		$('.pop-subentry').hover(hover_active_pop, hover_out);
		
	});
</script>
</head>
<body>
<div>
<h2>产品分类:</h2>
<div class="entry">
<div class="items">
<ul>
	<li class="extend_item" id="entry_1">第一层</li>
</ul>
<div>
<ul>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
</ul>
<ul>
	<li class="extend_item" id="entry_2">第第二层层</li>
</ul>
<div>
<ul>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
</ul>
<ul>
	<li class="extend_item" id="entry_3">第第三层层</li>
</ul>
<div>
<ul>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
	<li class="item">第二层</li>
</ul>
</div>
</div>
</div>
<div class="pop-subentry hidden">
<div class="hidden" id="subentry_1">
<div>第一个第二层</div>
</div>
<div class="hidden" id="subentry_2">
<div>第二个的第二层</div>
</div>
<div class="hidden" id="subentry_3">
<div>第三个的第二层</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
