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
<title>行情产品信息</title>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath }/js/jquilib/ui/jquery-ui-1.8.custom.js"></SCRIPT>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/hxtool.js"></SCRIPT>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/quotation/quotationSelector.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/quotation/quoPdt.js"></script>
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
<form name="quoPdtForm"
	action="${pageContext.request.contextPath}<s:property value="formAction"/>"
	method="post">
	<s:hidden name="mode"></s:hidden>
	<s:hidden name="qp.quotationPT.quotationPTypeCode"></s:hidden>
<table align="center" width="790" height="45" bgcolor="#fffced"
	cellpadding="0" cellspacing="0" class="sm-ts">
	<tr>
		<td width="55" align="center"><img
			src="../../image/comdo/pen.png"></td>
		<td width="737"><s:if test="mode == modeStatus.ADD">添加</s:if> <s:elseif
			test="mode == modeStatus.MODIFY">修改</s:elseif>行情产品信息</td>
	</tr>
</table>

<table width="790" cellpadding="0" cellspacing="0" border="1"
	bordercolor="#CCCCCC"
	style="margin-top: 10px; border-collapse: collapse;">
	<tr>
		<td height="40" align="right" width="80">产品编号：</td>
		<td>&nbsp;<s:textfield name="qp.quotationPCode" size="30"
			 readonly="true" /><span id="errorsDiv_qp.quotationPCode"></span></td>
	</tr>

	<tr>
		<td height="40" align="right">产品名称：</td>
		<td>&nbsp;<s:textfield name="qp.quotationPName" size="40"
			 /><span id="errorsDiv_qp.quotationPName"></span></td>
	</tr>

	<tr>
		<td height="40" align="right">产品别名：</td>
		<td>&nbsp;<s:textfield name="qp.quotationPNameAlias" size="40" /><span
			id="errorsDiv_qp.quotationPNameAlias"></span></td>
	</tr>

	<tr>
		<td height="40" align="right" width="80">产品类型：</td>
		<td>&nbsp;<s:textfield name="qp.quotationPT.quotationPTName" size="20"
			 readonly="true" /> <span id="errorsDiv_qp.quotationPT.quotationPTName"></span></td>
	</tr>

</table>
<table align="center" width="790" cellpadding="0" cellspacing="0"
	height="">
	<tr>
		<td height="50" align="center"><s:if
			test="mode == modeStatus.ADD">
			<input type="button" name="action:addQuoPdt" value="添加"
				class="button" />
		</s:if> <s:elseif test="mode == modeStatus.MODIFY">
			<input type="button" name="action:modQuoPdt" value="修改"
				class="button" />
		</s:elseif> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="cancle"
			value="取消" onclick="javascript: window.history.back();"
			class="button" /></td>
	</tr>
</table>
</form>
</body>
</html>
