<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.filter.SecurityFilter" %>
<%
	String loginUrl=SecurityFilter.loginUrl(request);
	String callBackUrl=(request.isSecure()?"https://":"http://")+request.getServerName()+":"+request.getServerPort()+
	request.getContextPath()+"/plain/member/loginCallback.jsp";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript">
	function register(){
		window.location="register.jsp";
	}
</script>
</head>
<body>
<form action="<%=loginUrl%>" method="POST" enctype="application/x-www-form-urlencoded" >
                  <INPUT name="josso_cmd" value="login" type="hidden" />
                  <INPUT name="backPath" value="<%=callBackUrl%>" type="hidden" />
	<span>老顾客请登录，新顾客请注册。</span>
   <table border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td nowrap>用户名</td>
                  <td nowrap><INPUT 
                  maxLength=20 size=19 name=josso_username></td>
                </tr>
                <tr>
                  <td nowrap>密码</td>
                  <td nowrap><INPUT 
                  maxLength=20 size=21 type=password name=josso_password></td>
                </tr>
                <tr>
                  <td nowrap>&nbsp;</td>
                  <td nowrap><INPUT value="登 录" type=submit>
                  <INPUT onclick=register() value="我不是老顾客，我要注册" type=button>
                  </td>
                </tr>
   </table>
</form>
</body>
</html>