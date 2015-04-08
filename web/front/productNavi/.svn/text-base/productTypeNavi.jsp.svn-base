<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.bornsoft.asn.utils.common.AsnConstLib"%><html>
<head>
<title>test-typeNavi</title>
</head>
<body>
	<div><% String typen = (String)request.getAttribute("typen");
			if(typen.equals(AsnConstLib.NavigatorLevel0)){
		 %>
				<%@ include file="productTypeRoot2.jsp" %>
			 
			<%
			}
			if(typen.equals(AsnConstLib.NavigatorLevel1)) {  
			%>
				<div><%@ include file="typeNavigator.jsp" %> </div>
				<%@ include file="productTypeFirst.jsp" %> 
			<%
			}
			else if(typen.equals(AsnConstLib.NavigatorLevel2)){
			%>
				<div><%@ include file="typeNavigator.jsp" %> </div>
				<%@ include file="productTypeSec.jsp" %> 
			<%
			}
			%>
			
</div>
</body>
</html>