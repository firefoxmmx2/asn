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
	//��¼���˺�
	System.out.println(propertyMap.get("account"));
	//��¼������
	System.out.println(propertyMap.get("userName"));
	//��¼�ߵ绰
	System.out.println(propertyMap.get("phone"));
	//��¼���ֻ�
	System.out.println(propertyMap.get("mobile"));
	//��¼�ߵ�ַ�ʱ�
	System.out.println(propertyMap.get("mailno"));
	//��¼�ߵ�ַ
	System.out.println(propertyMap.get("address"));
	//��¼�ߵ�ַ
	System.out.println(propertyMap.get("description"));
	//��¼������
	System.out.println(propertyMap.get("email"));
	//��¼������
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
    This is my JSP page. <%if(isLogin){%>�Ѿ���¼ [<%=loginUserPin%>]-[<%=loginUserName%>]    <a href="<%=Config.getConfig().getSsoQuit()%>?typecode=zxzx&backPath=<%=backPath%>" target="_blank">ע��</a><%}else{%><a href="<%=Config.getConfig().getSsoLogin()%>?backPath=<%=backPath%>">��û��¼</a><%}%><br>
  </body>
</html>