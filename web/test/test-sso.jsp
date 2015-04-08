<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.bornsoft.sso.util.*"%>
<%@ page import="com.bornsoft.sso.config.*" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = "http://pubsvr.aiecp.com/asn/test/";

boolean isLogin = Validate.checkLogin(request);
System.out.println(isLogin);
String backPath = "http://pubsvr.aiecp.com/asn/test/test-sso.jsp";

String loginUserPin = (String)request.getAttribute("loginUserPin");
System.out.println("loginUserPin>>" + loginUserPin);
String loginUserName = (String)request.getAttribute("loginUserName");
System.out.println("loginUserName>>" + loginUserName);

Map propertyMap = (Map)request.getAttribute("propertyMap");
if(propertyMap!=null)
{
	//登录者账号
	System.out.println(propertyMap.get("account"));
	//登录者姓名
	System.out.println(propertyMap.get("userName"));
	//登录者电话
	System.out.println(propertyMap.get("phone"));
	//登录者手机
	System.out.println(propertyMap.get("mobile"));
	//登录者地址邮编
	System.out.println(propertyMap.get("mailno"));
	//登录者地址
	System.out.println(propertyMap.get("address"));
	//登录者地址
	System.out.println(propertyMap.get("description"));
	//登录者邮箱
	System.out.println(propertyMap.get("email"));
	//登录者生日
	System.out.println(propertyMap.get("birthday"));
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
  <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    This is my JSP page. <%if(isLogin){%>已经登录 [<%=loginUserPin%>]-[<%=loginUserName%>]    <a href="<%=Config.getConfig().getSsoQuit()%>?typecode=zxzx&backPath=<%=backPath%>" target="_blank">注销</a><%}else{%><a href="<%=Config.getConfig().getSsoLogin()%>?backPath=<%=backPath%>">还没登录</a><%}%><br>
  </body>
</html>