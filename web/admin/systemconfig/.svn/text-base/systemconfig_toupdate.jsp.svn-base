<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<LINK href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>
	<SCRIPT src="${pageContext.request.contextPath}/js/yav/yav.js"></SCRIPT>
	<SCRIPT src="${pageContext.request.contextPath}/js/yav/yav-config.js"></SCRIPT>
<script type="text/javascript">
<!--
//yav 验证框架配置规则
rules = null;
$(document).ready(function(){
	rules=[	"config.configId:配置编号|required",
			"config.itemTitle:配置名称|required",
			"config.itemName:配置鍵|required",
			"config.itemValue:配置值|required"
			];
	yav.init('syscForm',rules);
	$("#syscForm").submit(function(){
		return yav.performCheck("syscForm", rules, "inline");
	});
});
//-->
</script>
<table align="center" width="790" height="45" cellspacing="0" cellpadding="0" bgcolor="#fffced" class="sm-ts">
		<tbody><tr>
			<td align="center" width="55"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			系統配置修改
			</td>
		</tr>
</tbody></table>

<form action="<s:property value="formPath"/>" method="post" id="syscForm">
<table align="center" cellspacing="0" cellpadding="10" width="90%">
	<tr>
		<td><span style="color: red;">*</span>配置编号:</td>
		<td><s:textfield name="config.configId" readonly="true"/><span id="errorsDiv_config.configId"></span> </td>
	</tr>
	<tr>
		<td><span style="color: red;">*</span>配置名称:</td>
		<td><s:textfield name="config.itemTitle"/> <span ></span> <span id="errorsDiv_config.itemTitle"></span> 
		</td>
	</tr>
	<tr>
		<td><span style="color: red;">*</span>配置鍵:</td>
		<td><s:textfield name="config.itemName"/> <span id="errorsDiv_config.itemName"></span> </td>
	</tr>
	<tr>
		<td><span style="color: red;">*</span>配置值:</td>
		<td><s:textarea name="config.itemValue" cols="50" rows="15" cssClass="inputNormal"></s:textarea><br></br><span id="errorsDiv_config.itemValue"></span> </td>
	</tr>
	<tr>
		<td>配置分组:</td>
		<td><s:textfield name="config.groupName"/></td>
	</tr>
	<tr>
		<td></td>
		<td align="center"> <table width="50%"> <tr><td> <input name="doUpdate" value="修改" type="submit"/> </td><td><input onclick="javascript:history.back();" name="cancel" type="button" value="取消"/> </td></tr></table> </td>
	</tr>
</table>
</form>