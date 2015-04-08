<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"
    pageEncoding="UTF-8"%>
    
<%
	Member m=new MemberService().getMember(2);

%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test member</title>
</head>
<body>
	全称：<%=m.getFullName()%>，简称：<%=m.getShortName()%>
</body>
</html>