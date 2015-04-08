<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String callBackUrl=(request.isSecure()?"https://":"http://")+request.getServerName()+":"+request.getServerPort()+
		request.getContextPath()+"/plain/member/loginCallback.jsp";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<script type="text/javascript">
	function checkValue(form){
		var value=form.userpin.value;
		if(value=="") {
			alert("必须输入账号！");
			form.userpin.focus();
			return false;
		}
		form.username.value=value;
		if(value.indexOf("@")>0) form.email.value=value;
		return true;
	}
</script>
<link href="/asn/css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.zip{margin: 0px; padding: 0px;}
	.help{color: blue;}
</style> 
</head>
<body class="zip">
<form  class="zip" action="http://appsvr.aiecp.com:8080/ptnsso/registerAction1.sso" method="POST" onsubmit="return checkValue(this);">
<table border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td nowrap>账号</td>
              <td nowrap><INPUT maxLength=20 name=userpin id="userpin">&nbsp;
              <span class="help">手机号、QQ号、邮箱等均可作为账号</span>
              </td>
            </tr>
            <tr>
              <td nowrap>密码</td>
              <td nowrap><INPUT maxLength=22 size=22 
            type=password name=password id="password">&nbsp;
            <span class="help">密码用于保护自己的数据</span></td>
            </tr>
            <tr>
              <td nowrap>密码核对</td>
              <td nowrap><INPUT maxLength=22 size=22 
            type=password name=passwordcheck id="passwordcheck">&nbsp;
            <span class="help">再输入一次密码</span></td>
            </tr> 
            <tr>
              <td nowrap>验 证 码</td>
              <td nowrap><input id="code" type="text" name="code" style="height:20px;" size="4" maxlength="4">
					<img src="http://appsvr.aiecp.com:8080/ptnsso/signon/customer/code.jsp?type=1">
            <span class="help">输入图片中的数字</span></td>
            </tr> 
            <tr>
              <td nowrap>&nbsp;</td>
              <td nowrap><INPUT name="submit" type="submit" value="注 册">
              <INPUT 
      name=register type=hidden id="register" value=OK>
              <INPUT name="backPath" value="<%=callBackUrl%>" type="hidden" />
              <INPUT name=typeId type=hidden id="typeId" value=-1>
              <INPUT name=username type="hidden" id="username" value="匿名顾客" maxLength=10>
              <INPUT name=userType type="hidden" id="userType" value="2" maxLength=10>
              <INPUT name=email type="hidden" id="email" value="anonymouse@yahoo.com" maxLength=10></td>
            </tr>
          </table>
   </form>
</body>
</html>