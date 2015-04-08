<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>长会话</title>
<!-- 长会话脚本 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/noop.js"></script>
</head>
<body>
本网页的会话永远不会超时。
上次回报是：<%=session.getAttribute("noop")%>
</body>
</html>