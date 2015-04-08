<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript">
	// 加载地区组件
	butil.loadJs("~/js/geoloc/geoloc.js");
	$(document).ready(function(){
		// 初始化地区输入容器
		geoloc.init("divDiQu1", "- 不限省市 -", "- 不限地州市 -", "- 不限区县 -");
	});
</script>
</head>
<body>
<div id="divDiQu1">&nbsp;</div>
</body>
</html>