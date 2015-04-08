<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String cp = request.getContextPath(); %>
<style>
<!--
.buttonb{width:50px; height: 25px;border:0; background:url('<%=cp%>/image/comdo/button_g25.gif');cursor:pointer; }
.border-b{border-bottom:solid 1px #999999;}
.title-c{color:#666666;}
.title-b{color:#ff8041;height:30px;}
-->
</style>


<table width="792" cellpadding="0" cellspacing="0" class="border-b">
	<tr>
		<td height="40">
			<s:submit cssClass="buttonb" method="doNews" action="quotation-control" value="确定" />
			<input type="button" class="buttonb" value="取消" onclick="javascript: window.history.back();">&nbsp;&nbsp;
		</td>
	</tr>
</table>

<table width="792" cellpadding="0" cellspacing="0">

	<s:hidden name="flag" />
	<s:hidden name="formAction"/> 
	<s:iterator value="quoL" status="stat">	
	<tr>
		<td width="30" class="border-b" valign="top" style="padding-top:12px;"><input type="checkbox"	name="quoInfoCodeArr" value="<s:property value="quotationCode"/>" checked="checked"></td>
		<td width="762" class="border-b" style="padding:10px 0;">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td height="20">行情名称：</td>
					<td class="title-c" width="300"><s:property	value="quotationName" /></td>
					<td>来 源：</td>
					<td class="title-c"><s:property	value="source" /></td>
				</tr>
				<tr>
					<td height="20">发布人：</td>
					<td class="title-c" width="300"><s:property	value="releasePerson" /></td>
					<td>发布时间：</td>
					<td class="title-c"><s:property	value="releaseDate" /></td>
				</tr>
			</table>
			
			<table width="100%" cellpadding="0" cellspacing="0">
				<s:iterator value="quoInfoStat" status="s" id="quoSL">
					<s:if test="#s.index == 0">
						<tr>
							<td class="title-b">产品名称</td>
							<td class="title-b">平均价格</td>
							<td class="title-b">备注</td>
						</tr>
					</s:if>
					<tr>
						<td height="25"><s:property value="quotationProduct.quotationPName" /></td>
						<td><s:property value="avgPrice" /> 元/公斤</td>
						<td><s:property value="comments" /></td>
					</tr>
				</s:iterator>
			</table>
		</td>
	</tr>
	</s:iterator>
	
	
</table>
