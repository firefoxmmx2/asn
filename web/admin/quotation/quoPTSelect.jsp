<%-- 
    Document   : quoPTSelect
    Created on : 2010/06/11, 10:19:37
    Author     : hooxin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquilib/ui/jquery-ui-1.8.custom.js"></SCRIPT>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
<style>
<!--
	.selectedRow {
		background-color: blue;
	}
-->
</style>
<table id="quoPTSelect" width="100%" class="table_border" cellpadding="0" cellspacing="0">
	<tr>
		<td align="left" valign="top" scope="col" colspan="4"><span>产品类型名称:</span><input
			type="text" name="qpt.quotationPTName" /> <input type="button"
			name="action:doFindPTList" value="查找" class="button"/></td>
	</tr>
	<tr>
		<td height="23" colspan="4">
		<table width="100%" border="0" id="ptTb" class="table_border" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">ID</td>
				<td align="center">名称</td>
			</tr>
			<s:iterator value="quoPTList" status="s">
				<tr rowData={"quotationPTypeCode":"<s:property value="quotationPTypeCode"/>","quotationPTName":"<s:property value="quotationPTName"/>"}>
					<td><s:property value="quotationPTypeCode" /></td>
					<td><s:property value="quotationPTName" /></td>
				</tr>
			</s:iterator>
		</table>
		</td>
	</tr>
	<tr>
		<td width="89%" align="center" colspan="4"><input id="okbtn"
			type="button" name="ok" value="确认" class="button"/> &nbsp; <input type="button"
			id="cancel" value="取消" class="button"/></td>
	</tr>
</table>
