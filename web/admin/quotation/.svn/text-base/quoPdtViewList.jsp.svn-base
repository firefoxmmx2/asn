<%-- 
    Document   : quoMarketViewList
    Created on : 2010/06/21, 10:12:40
    Author     : hooxin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>行情产品列表</title>
<style type="text/css">
<!--
* {
	padding: 0;
	margin: 0;
}

body {
	font-size: 12px;
}

.table_border a {
	font-weight: 100;
}

.table_border a:link {
	color: #333333;
	font-size: 12px;
	text-decoration: none;
}

.table_border a:visited {
	color: #333333;
	font-size: 12px;
	text-decoration: none
}

.table_border a:hover {
	color: #FF0000;
	font-size: 12px;
	text-decoration: underline
}
.input120 {
	width:120px;
}
#huzxPageDiv {
	width: 100%;
}
-->
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/hxtool.js"></script>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath }/js/jquilib/ui/jquery-ui-1.8.custom.js"></SCRIPT>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/quotation/quoPdt.js"></script>
</head>
<body>
<table align="center" width="792" cellpadding="0" cellspacing="0">
	<tr>
		<td height="39" class="title">行情统计产品列表</td>
	</tr>
	<tr>
		<td height="51" class="boder_y">
		<form action="<%=request.getContextPath() %><s:property value="formAction2"/>" name="findForm">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>产品编号：</td><td><s:textfield name="qp.quotationPCode" cssClass="input120"></s:textfield> </td>
				<td>产品名称：</td><td><s:textfield name="qp.quotationPName" cssClass="input120"></s:textfield> </td>
				<td>产品别名：</td><td><s:textfield name="qp.quotationPNameAlias" cssClass="input120"></s:textfield></td>
				<td>产品类型：</td><td><s:select list="quoPTList" name="qpt.quotationPTypeCode" listKey="quotationPTypeCode" listValue="quotationPTName" headerKey="" headerValue="全部"></s:select> </td>
				<td><input type="button" name="action:findPdt" value="查询" class="button">
			</tr>
		</table>
		</form>
		</td>
	</tr>
	<tr>
		<td>
		<form
			action="${pageContext.request.contextPath}<s:property value="formAction"/>"
			 method="post" name="delQuoPdtForm">
			<s:hidden name="mode"></s:hidden>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;" class="table_border">
			<tr>
				<td align="right"><input type="button" value="删除"
					class="button-2 button" name="action:delPdt" /></td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;" class="table_border">
			<tr>
				<td width="5%" height="28" align="center" bgcolor="#e8f5fb"><input
					type="checkbox" id="selectAll" /></td>
				<td width="50%" align="center" bgcolor="#e8f5fb"><strong>产品名称</strong></td>
				<td width="20%" align="center" bgcolor="#e8f5fb"><strong>产品别名</strong></td>
				<td width="10%" align="center" bgcolor="#e8f5fb"><strong>产品类别</strong></td>
			</tr>
			<s:iterator id="list" value="quoPList" status="stat">
				<tr>
					<td align="center" height="30"><input type="checkbox"
						name="codes" value="<s:property value="quotationPCode"/>" /></td>
					<td>&nbsp;<a
						href="<%=request.getContextPath() %><s:property value="authorAction"/>?qp.quotationPCode=<s:property value="quotationPCode"/>">
					<s:property value="quotationPName" /> </a></td>
					<td align="center"><s:property value="quotationPNameAlias" /></td>
					<td align="center"><s:property value="quotationPT.quotationPTName" /></td>
				</tr>
			</s:iterator>
		</table>
		</form>
		</td>
	</tr>
</table>
<table align="center" width="792" cellpadding="0" cellspacing="0">
	<tr>
		<td align="right">
		<form action="${pageContext.request.contextPath }<s:property value="formAction2"/>" method="post">
			<s:hidden name="qp.quotationPCode"></s:hidden>
			<s:hidden name="qp.quotationPName"></s:hidden>
			<s:hidden name="qp.quotationPNameAlias"/>
			<s:hidden name="qpt.quotationPTypeCode" />
			<s:property value="pageBar" escape="false"/>
		</form>
			
		</td>
	</tr>
</table>