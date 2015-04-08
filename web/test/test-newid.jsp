<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.idmaker.IdMakerService"%>
<%
	// Get a new id
	long id=IdMakerService.newId("product");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New ID</title>
</head>
<body>
	The new ID of product is <%=id%>;    
</body>
</html>