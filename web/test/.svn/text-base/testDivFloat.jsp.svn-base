<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test div float</title>
<script type="text/javascript" src="<%=cp %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		floatDiv('floatDiv',200,200,5, 100, true,'<p>销售门店：                                      门市电话：'+
				''+
				'重庆渝北区双龙大道81号                          023-67177188'+
				'重庆渝北区鲁能星城九街区13-1-11                 023-67969703'+
				'重庆渝中区五一路264号                           023-63716939'+
				'重庆同创国际学校操场边（长安丽都1号大门对面）   023-67754293'+
				'重庆龙湖水晶郦城一组团西门旁（重庆会馆背后）    023-67035968</p>');
		floatDiv('floatDiv2',200,200,900, 200, true,'hello world2');
	});
	
	/**
		浮动图层 ctID 容器div ID,width宽度，height高度,left相对左边位置,top相对右边的位置,
		isFollow是不是要跟随，contentHTML展示内容，里面写HTML格式
	*/
	function floatDiv(ctId,width,height,left,top,isFollow,contentHTML){
		var $ct = $("#"+ctId);
		if($ct.length==0){
			$ct=$('<div>',{id:ctId});
			$ct.appendTo('body');
		}
		
		$ct.width(width);
		$ct.height(height);
		$ct.css('position','absolute');
		$ct.offset({top:top,left:left});
		
		if(contentHTML)
			$ct.html(contentHTML);
		
		if(isFollow){
			$(document).scroll(function(){
				$ct.offset({top:$(document).scrollTop()+top});
			});
		}
		
	}
</script>
</head>
<body>
	<!--<div id="floatDiv">
	
	</div>
	<div id="floatDiv2"></div>-->
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>