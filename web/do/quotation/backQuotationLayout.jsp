<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>价格行情后台管理</title>
<SCRIPT type="text/javascript" src="<%=cp %>/js/jquery-1.4.2.min.js"></SCRIPT>
<link type="text/css" href="<%=cp %>/css/ui-lightness/jquery-ui-1.8rc3.custom.css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="<%=cp %>/js/jquery-ui-1.8rc3.custom.min.js"></SCRIPT>
<script type="text/javascript" src="<%=cp %>/js/quotation/quo_backlayout.js"></script>
<SCRIPT type="text/javascript" src="<%=cp %>/js/json.js"></SCRIPT>
<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<style type="text/css">
</style>
</head>
<body>
<s:form action="quotation-control" method="post" namespace="/admin/quotation" id="quoForm"
	theme="simple">
	<div id="quoMain" style="float:left;width:750px;">
		<t:insertAttribute name="quoContent" />
	</div>
	<div id="quoButtonBar1" style="float:left;width:750px;padding-top:10px;">
		<t:insertAttribute name="quoButtonBar" />
	</div>
	<div id="quoPage"></div>
	
</s:form>
</body>
</html>