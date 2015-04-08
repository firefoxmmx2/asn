<%-- 
    Document   : quoMarketNew
    Created on : 2010/06/21, 12:59:22
    Author     : hooxin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>市场信息</title>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath }/js/jquilib/ui/jquery-ui-1.8.custom.js"></SCRIPT>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/quotation/quoMarket.js"></script>
<LINK href="${pageContext.request.contextPath}/js/yav/yav-style.css"
	type="text/css" rel="stylesheet">
<SCRIPT src="${pageContext.request.contextPath}/js/yav/yav.js"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/js/yav/yav-config.js"></SCRIPT>
<style type="text/css">
<!--
* {
	padding: 0;
	margin: 0;
}

body {
	font-size: 12px;
}
-->
</style>
</head>
<body>
<form name="marketForm"
	action="${pageContext.request.contextPath}<s:property value="formAction"/>"
	method="post">
	<s:hidden name="mode"></s:hidden>
<table align="center" width="790" height="45" bgcolor="#fffced"
	cellpadding="0" cellspacing="0" class="sm-ts">
	<tr>
		<td width="55" align="center"><img
			src="../../image/comdo/pen.png"></td>
		<td width="737"><s:if test="mode == modeStatus.ADD">添加</s:if> <s:elseif
			test="mode == modeStatus.MODIFY">修改</s:elseif>市场信息</td>
	</tr>
</table>

<table width="790" cellpadding="0" cellspacing="0" border="1"
	bordercolor="#CCCCCC"
	style="margin-top: 10px; border-collapse: collapse;">
	<tr>
		<td height="40" align="right" width="80">市场编号：</td>
		<td>&nbsp;<s:textfield name="qm.marketCode" size="30"
			label="市场编号" readonly="true" /><span id="errorsDiv_qm.marketCode"></span></td>
	</tr>

	<tr>
		<td height="40" align="right">市场名称：</td>
		<td>&nbsp;<s:textfield name="qm.marketName" size="40"
			label="市场名称" /><span id="errorsDiv_qm.marketName"></span></td>
	</tr>

	<tr>
		<td height="40" align="right">地 区：</td>
		<td>&nbsp;<s:textfield name="qm.area" size="40" label="地区" /><span
			id="errorsDiv_qm.area"></span></td>
	</tr>


	<tr>
		<td height="40" align="right" width="80">最后维护人：</td>
		<td>&nbsp;<s:textfield name="qm.updatePerson" size="20"
			label="最后维护人" readonly="true" /> <span id="errorsDiv_qm.updatePerson"></span></td>
	</tr>

	<tr>
		<td height="40" align="right" width="80">最后维护时间：</td>
		<td>&nbsp;<s:textfield name="qm.updateTime" size="20"
			label="最后维护时间" readonly="true" /> <span id="errorsDiv_qm.updateTime"></span></td>
	</tr>
</table>
<table align="center" width="790" cellpadding="0" cellspacing="0"
	height="">
	<tr>
		<td height="50" align="center"><s:if
			test="mode == modeStatus.ADD">
			<input type="button" name="action:addMarket" value="添加"
				class="button" />
		</s:if> <s:elseif test="mode == modeStatus.MODIFY">
			<input type="button" name="action:modMarket" value="修改"
				class="button" />
		</s:elseif> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="cancle"
			value="取消" onclick="javascript: window.history.back();"
			class="button" /></td>
	</tr>
</table>
</form>
</body>
</html>
