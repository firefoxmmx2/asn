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
<SCRIPT type="text/javascript" src="<%=cp %>/js/jquilib/ui/jquery-ui-1.8.custom.js"></SCRIPT>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=cp%>/js/hxtool.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/quotation/quotationSelector.js"></script>
<script type="text/javascript" src="<%=cp %>/js/quotation/quo_backlayout.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type="text/css" rel="stylesheet">
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
</head>
<body>
<form action="<%=cp%>/admin/quotation/quotation-control" method="post"  id="quoForm"
	theme="simple">
	<div id="quoMain" style="float:left;width:750px;">
		<t:insertAttribute name="quoContent" />
	</div>
	<div id="quoButtonBar1" style="float:left;width:750px;padding-top:10px;">
		<t:insertAttribute name="quoButtonBar" />
	</div>
	<div id="quoPage"></div>
	
</form>
</body>
</html>