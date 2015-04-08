<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.sms.service.SmsService" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上行短信</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
  </head>
  
<body>
<%
String tmpMobilePhone = request.getParameter("MobilePhones");
String tmpContent = request.getParameter("Content");
String tmpExtNumber = request.getParameter("ExNumber");

System.out.println("MobilePhones:" + tmpMobilePhone);
System.out.println("Content:" + tmpContent);
System.out.println("ExNumber:" + tmpExtNumber);

SmsService smsService = new SmsService();
boolean isSuccess = smsService.receiveSms(tmpMobilePhone, tmpContent, tmpExtNumber);
System.out.print("isSuccess:" + isSuccess);

%>
   
 </body>
</html>
