<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.filter.SecurityFilter" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%
	boolean isLogin = MemberService.isLogin(request);
	long memberId=MemberService.getMemberId(session);
	if(memberId==0){
		isLogin = MemberService.isLogin(request);
		memberId=MemberService.getMemberId(session);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
<script type="text/javascript">
	window.parent.loginCallback(<%=memberId%>);
</script>
</head>
<body>

</body>
</html>