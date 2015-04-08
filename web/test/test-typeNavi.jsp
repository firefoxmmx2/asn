<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.bornsoft.asn.utils.common.AsnConstLib"%>
<html>
<head>
<title>test-typeNavi</title>
</head>
<body>
<dir><%@ include file="typeNavigator.jsp"%>
</dir>
<div>
<%
	String typen = (String) request.getAttribute("typen");
	if (typen.equals(AsnConstLib.NavigatorLevel0)) {  
%> <%@ include file="productTypeRoot.jsp"%>

<%
	}
	if (typen.equals(AsnConstLib.NavigatorLevel1)) {
%> <%@ include file="productTypeFirst.jsp"%>
<%
	} else if (typen.equals(AsnConstLib.NavigatorLevel2)) {
%> <%@ include file="productTypeSec.jsp"%> <%
 	}
	%>
 <%@ include file="productTypeFac.jsp" %>
</div>
</body>
</html>