<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.utils.common.PropertyFactory,com.bornsoft.asn.utils.common.WebContext"
    pageEncoding="UTF-8"%>
<%
	String virtualPath=PropertyFactory.getDefaultProperty().getProperty("asn.product.picPath");
	String realPath=WebContext.getRealPath(this.getServletContext(), virtualPath);   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	IMG 连接 href: <%=virtualPath%><br/>
	文件实际存储目录: <%=realPath%>
</body>
</html>