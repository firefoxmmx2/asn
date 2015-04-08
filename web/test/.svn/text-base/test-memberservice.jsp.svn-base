<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"
    pageEncoding="UTF-8"%>
<%
	Member m=MemberService.getMember(session);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
ID:<%=MemberService.getMemberId(session)%><br/>
FullName:<%=MemberService.getMemberFullName(session)%><br/>
ShortName:<%=MemberService.getMemberShortName(session)%> <br/>
Address:<%=m.getAddress()%> <br/>
</body>
</html>