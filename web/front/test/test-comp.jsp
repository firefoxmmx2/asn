<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="divDiQu1">&nbsp;</div>
<script type="text/javascript">
	// 允许显示调试信息
	butil.setDebug(true);
	// 加载地区组件
	butil.loadJs("~/js/geoloc/geoloc.jsx");
	$(document).ready(function(){
		// 初始化地区输入容器
		geoloc.init("divDiQu1", "- 不限省市 -", "- 不限地州市 -", "- 不限区县 -");
	});
	butil.debug("很好很强大！");
	butil.debug("The basic dialog window is an overlay positioned within the viewport and is protected from page content (like select elements) shining through with an iframe. It has a title bar and a content area, and can be moved, resized and closed with the 'x' icon by default.");
	butil.debug("The basic dialog window is an overlay positioned within the viewport and is protected from page content (like select elements) shining through with an iframe. It has a title bar and a content area, and can be moved, resized and closed with the 'x' icon by default.");
</script>
<div id="myDiv">&nbsp;</div>
<script>$("#myDiv").html(butil.getUrl("~/front/broswerF"));</script>
