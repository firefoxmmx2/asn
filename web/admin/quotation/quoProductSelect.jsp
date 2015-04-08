<%-- 
    Document   : test-quoProductSelect
    Created on : 2010/06/07, 22:02:37
    Author     : hooxin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    String cp = request.getContextPath();
%>
<style>
<!--
	.selectedRow {
		background-color: blue;
	}
-->
</style>
<table id="quoPSelect" width="100%" border="0" cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td align="left" valign="top" scope="col" colspan="4"><span>产品名称或者别名:</span><input
			type="text" name="productNameOrAlias" /> <input type="button"
			name="action:doFindQuoProduct" value="查找" class="button"/></td>
	</tr>
	<tr>
		<td height="23" colspan="4">
		<table width="100%" border="0" id="quoProductTb" class="table_border" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">ID</td>
				<td align="center">名称</td>
				<td align="center">别名</td>
				<td align="center">类型名称</td>
			</tr>
			<s:iterator value="quoPList" status="s">
				<tr rowData={"quotationPCode":"<s:property value="quotationPCode"/>","quotationPName":"<s:property value="quotationPName"/>","quotationPNameAlias":"<s:property value="quotationPNameAlias"/>","quotationPT":{"quotationPTName":"<s:property value="quotationPT.quotationPTName"/>","quotationPTypeCode":"<s:property value="quotationPT.quotationPTypeCode"/>"}}>
					<td><s:property value="quotationPCode" /></td>
					<td><s:property value="quotationPName" /></td>
					<td><s:property value="quotationPNameAlias" /></td>
					<td><s:property value="quotationPT.quotationPTName" /></td>
				</tr>
			</s:iterator>
			<tr>
				<td align="right" colspan="4">
					<s:property value="pageBar" escape="false"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td width="89%" align="center"><input id="okbtn" type="button"
			name="ok" value="确认" class="button"/> &nbsp; <input type="button" id="cancel" class="button"
			value="取消" /></td>
		<td width="11%" align="center"><input type="button"
			name="toNewQuoProduct" value="添加产品" class="button"/></td>
	</tr>
</table>
