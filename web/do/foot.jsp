<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>脚注</title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body style=" margin: 2px; text-align: center">
	当前会员： <%=MemberService.getMemberFullName(session)%> 　　　　　　　　　　　(C)2010 农业综合服务网络平台版权所有　　　　　　　　　重庆博恩技术支持 
</body>
</html>