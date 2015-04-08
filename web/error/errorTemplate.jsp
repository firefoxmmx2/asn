<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><!--<t:insertAttribute name="title"></t:insertAttribute>--> </title>
<link href="<%=cp%>/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
</head>
<body>

<div style="width: 974px; margin-left: auto; margin-right: auto">
<div id="header">
<!--<t:insertAttribute name="header"></t:insertAttribute>-->
</div>
<div id="body" style="margin-left: 32px; height: 200px; overflow: visible;">
	<!--<t:insertAttribute name="message"></t:insertAttribute>-->
</div>
<div id="footer">
<!--<t:insertAttribute name="footer"></t:insertAttribute>-->
</div>
</div>

</body>
</html>