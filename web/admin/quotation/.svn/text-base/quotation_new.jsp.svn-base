<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
<!--
* {
	padding: 0;
	margin: 0;
}

body {
	font-size: 12px;
}

.tongji_1 {
	width: 110px;
	color: #0f6ce5;
	font-weight: 700;
	background: url('<%=cp%>/image/hzx/nav2.gif') no-repeat center;
	height: 33px;
	cursor: pointer;
	text-align: center;
	border-bottom: 1px solid #b4cfed;
}

.tongji_2 {
	width: 110px;
	color: #0048a3;
	font-weight: 700;
	background: url('<%=cp%>/image/hzx/nav1.gif') no-repeat center;
	height: 33px;
	cursor: pointer;
	text-align: center;
	border-bottom: 1px solid #b4cfed;
}
-->
</style>
<script type="text/javascript">
	function tj(val)
	{
		for ( var i = 1; i < 3; i++)
		{
			if (val == i)
			{
				document.getElementById("tjTitle" + i).className = "tongji_1";
				document.getElementById("tjcontent" + i).style.display = "block";
			}
			else
			{
				document.getElementById("tjTitle" + i).className = "tongji_2";
				document.getElementById("tjcontent" + i).style.display = "none";
			}
		}
	}
</script>

<s:hidden name="flag" id="flag" label="页面状态" />
<s:hidden name="quoInfo.updatePerson" label="更新人" />
<s:hidden name="quoInfo.updateDate" label="更新时间" />
<div id="toControl" align="center">

<table align="center" width="790" height="45" bgcolor="#fffced"
	cellpadding="0" cellspacing="0" class="sm-ts">
	<tr>
		<td width="55" align="center"><img
			src="../../image/comdo/pen.png"></td>
		<td width="737">新增行情</td>
	</tr>
</table>

<table align="center" width="790" height="40" cellpadding="0"
	cellspacing="0" style="padding-top: 10px;">
	<tr>
		<td width="5">&nbsp;</td>
		<td width="785" class="sm-title" align="left">基本信息</td>
	</tr>
</table>

<table width="790" cellpadding="0" cellspacing="0" border="1"
	bordercolor="#CCCCCC"
	style="margin-top: 10px; border-collapse: collapse;">
	<tr>
		<td height="40" align="right" width="80">行情编号：</td>
		<td align="left">&nbsp;<s:textfield name="quoInfo.quotationCode"
			size="30" label="行情编号" /><span id="errorsDiv_quoInfo.quotationCode"></span></td>
	</tr>

	<tr>
		<td height="40" align="right">行情标题：</td>
		<td align="left">&nbsp;<s:textfield name="quoInfo.quotationName"
			size="40" label="行情标题" /><span id="errorsDiv_quoInfo.quotationName"></span></td>
	</tr>

	<tr>
		<td height="40" align="right">来 源：</td>
		<td align="left">&nbsp;<s:textfield name="quoInfo.source"
			size="40" label="来源" /><span id="errorsDiv_quoInfo.source"></span></td>
	</tr>


	<tr>
		<td height="40" align="right" width="80">发布人：</td>
		<td align="left">&nbsp;<s:textfield name="quoInfo.releasePerson"
			size="20" label="发布人" /> <span id="errorsDiv_quoInfo.releasePerson"></span></td>
	</tr>

	<tr>
		<td height="40" align="right" width="80">发布时间：</td>
		<td align="left">&nbsp;<input name="quoInfo.releaseDate"
			size="20"
			value="<s:date name="quoInfo.releaseDate" format="yyyy-MM-dd"/>" />
		<span id="errorsDiv_quoInfo.releaseDate"></span></td>
	</tr>
	<tr>
		<td height="40" align="right" width="80">市场：</td>
		<td align="left">&nbsp;<s:textfield name="marketName" size="20"
			label="市场" /><s:hidden name="marketCode" /> <span
			id="errorsDiv_marketCode"></span></td>
	</tr>
</table>
<table width="790" height="40" cellpadding="0"
	cellspacing="0" style="padding-top: 10px;">
	<tr>
		<td width="5">&nbsp;</td>
		<td width="785" class="sm-title" align="left">统计信息</td>
	</tr>
</table>

<table width="790" cellpadding="0" cellspacing="0" border="0"
	align="left">
	<tr>
		<td>
		<table width="790" cellpadding="0" cellspacing="0" border="0"
			align="left">
			<tr>
				<td class="tongji_1" id="tjTitle1" onmousedown="tj('1')"
					align="left">快速录入</td>
				<td class="tongji_2" id="tjTitle2" onmousedown="tj('2')"
					align="left">标准录入</td>
				<td style="border-bottom: 1px solid #b4cfed;">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>

	<tr>
		<td colspan="3" style="padding-top: 10px;">
		<table id="tjcontent1" width="790" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<td height="30" align="right" valign="top">行情内容：</td>
				<td><s:textarea name="quoInfo.quotationContent" label="行情内容"
					cssStyle="width: 703px; height:220px; word-wrap : break-word;" /></td>
			</tr>
		</table>

		<table id="tjcontent2" width="790" cellpadding="0" cellspacing="0"
			border="0" style="display: none;">
			<tr>
				<td>
				<table id="quoStat" align="left"></table>
				</td>
			</tr>

			<tr>
				<td align="left"><input type="button"
					class="sm-buttom4" value=" 增加价格统计" id="newStat"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<table align="left" width="790" height="40" cellpadding="0" cellspacing="0" style="clear: both;">
	<tr>
		<td height="50" align="center">
			<input type="button"
			name="action:quotation-control!doNew" value="发布"
			action="quotation-control" method="doNew" class="sm-submit2"/>
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="cancle" value="取消"
			onclick="javascript: window.history.back();" class="sm-submit2"/>
		</td>
	</tr>
</table>
</div>

