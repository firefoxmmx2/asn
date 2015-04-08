<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.bean.account.Account"%>
<%@ page
	import="com.bornsoft.asn.service.groupPurchase.GroupPurchaseService"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<SCRIPT src="<%=request.getContextPath()%>/js/datetime2.js"></SCRIPT>
<%
	String cp = request.getContextPath();
%>
<table align="center" width="792" height="39" cellpadding="0"
	cellspacing="0">
	<tr>
		<td height="39" class="title">账单列表</td>
	</tr>
</table>

<form id="myform" name="myform" method="post"
	action="<%=cp %>/admin/account/qryAccount">
<table class="boder_y" width="792" height="51" border="0"
	cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%">
			<tr>
				<td align="right" height="30">账单编号：</td>
				<td><input type="text" name="id" id="id"
					value="<s:property value="account.id" />"></td>
				<td align="right">订单号：</td>
				<td><input type="text" name="orderId" id="orderId"
					value="<s:property value="account.orderId" />"></td>
			</tr>
			<tr>
				<td align="right" height="30">开始时间：</td>
				<td ><input type="text" name="startTime"
					id="startTime" readonly="true"
					value="<s:property value="account.startTime" />"
					onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss');">
				</td>
				<td align="right" height="30" width="120">结束时间：</td>
				<td ><input type="text" name="endTime" id="endTime"
					readonly="true" value="<s:property value="account.endTime" />"
					onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss');"></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><img
					src="<%=request.getContextPath()%>/image/comdo/button_qd.gif"
					width="50" height="25"
					onClick="myform.action='qryAccount?pageType=sub';myform.submit();"
					style="cursor: pointer;" /></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"
	style="margin-top: 15px;">
	<tr>
		<td height="28" align="center" bgcolor="#e8f5fb"><strong>账单编号</strong></td>
		<td align="center" bgcolor="#e8f5fb"><strong>订单号</strong></td>
		<td align="center" bgcolor="#e8f5fb"><strong>收入</strong></td>
		<td align="center" bgcolor="#e8f5fb"><strong>支出</strong></td>
		<td align="center" bgcolor="#e8f5fb"><strong>帐期余额</strong></td>
		<td align="center" bgcolor="#e8f5fb"><strong>创建时间</strong></td>
		<td align="center" bgcolor="#e8f5fb"><strong>支付类型</strong></td>
		<td align="center" bgcolor="#e8f5fb"><strong>说明</strong></td>
	</tr>

	<s:iterator value="accountList" status="s">
		<tr>
			<td align="center"><s:property value="id" /></td>
			<td align="center"><s:property value="orderId" /></td>
			<td align="center"><s:property value="income" /></td>
			<td align="center"><s:property value="expenditure" /></td>
			<td align="center"><s:property value="balance" /></td>
			<td align="center"><s:property value="createTime" /></td>
			<td align="center"><s:property value="payType" /></td>
			<td align="center"><s:property value="description" /></td>
		</tr>
	</s:iterator>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	style="margin-top: 5px;">
	<tr>
		<td align="right"><s:property value="pageBar"
			escape="false" /></td>
	</tr>
</table>
</form>
