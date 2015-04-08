<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String value=request.getParameter("key");
    String value2=request.getParameter("key2");
    if(value==null) value="";
    if(value2==null) value2="";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" charset="gb2312">
	function encodeMe(form){
		//var s="key2="+escape(form.key.value)+"&name="+escape(form.memo.value);
		//form.action=form.action+"?"+s;
		//alert(form.action);
	}
</script>
</head>
<body>
We got: <%=value%>, <%=value2%>
<form action="test-chinese.jsp" method="GET" onsubmit="encodeMe(this)" enctype="application/x-www-form-urlencoded">
	关键词：<input name="key" >
	备注：<input name="memo" >
	<input type="submit" value="提交">
</form>
<a href="test-chinese.jsp?key=你好&key2=我好！！！">浏览</a>

</body>
</html>