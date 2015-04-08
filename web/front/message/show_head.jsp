<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.bean.common.MessagePage, com.bornsoft.asn.utils.common.AsnConstLib.MessageType"
    pageEncoding="UTF-8"%>
<%
MessagePage mp=(MessagePage)request.getAttribute("messagePage");
String title="提示信息";
switch(mp.getType()){
case Error:
	title="错误信息";
	break;
case Warn:
	title="问题信息";
	break;
}
%>
<title><%=title%></title>
