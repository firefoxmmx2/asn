<%-- 
    Document   : quoMarketSelect
    Created on : 2010/06/11, 10:19:37
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

.input70 {
	width: 70px;
}

.input100 {
	width: 100px;
}
-->
</style>
<table id="marketSelect" width="100%" class="table_border" border="0"
	cellpadding="0" cellspacing="0">
	<tr>
		<td align="left" valign="top" scope="col" colspan="4"><span>市场名称:</span><input
			type="text" name="qm.marketName" class="input100" /><span>地区:</span><input
			type="text" name="qm.area" class="input70" /> <input type="button"
			name="action:doFindMarket" value="查找" class="button" /></td>
	</tr>
	<tr>
		<td colspan="4" valign="top">
		<table width="100%" id="marktetTb" class="table_border" border="0"
			cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th align="center">名称</th>
					<th>地区</th>
				</tr>
			</thead>
			<s:iterator value="marketList" status="s">
				<tr rowData={"marketCode":"<s:property value="marketCode"/>","marketName":"<s:property value="marketName"/>","area":"<s:property value="area"/>"}>
					<td><s:property value="marketCode" /></td>
					<td><s:property value="marketName" /></td>
					<td><s:property value="area" /></td>
				</tr>
			</s:iterator>
			<tr>
				<td align="right" colspan="4"><s:property value="pageBar"
					escape="false" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td width="89%" align="center" colspan="4"><input id="okbtn"
			type="button" name="ok" value="确认" class="button" /> &nbsp; <input
			type="button" id="cancel" value="取消" class="button" /></td>
	</tr>
</table>
