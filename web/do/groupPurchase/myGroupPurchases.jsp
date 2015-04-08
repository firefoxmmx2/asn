<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo" %> 
<%@ page import="com.bornsoft.asn.service.groupPurchase.GroupPurchaseService" %>   
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<SCRIPT src="<%=request.getContextPath()%>/js/datetime2.js"></SCRIPT>
	<table align="center" width="792" height="39" cellpadding="0" cellspacing="0">
	   	<tr>
	         <td height="39" class="title">团购信息列表</td>
	   	</tr> 
	</table> 

	<form action="myGroupPurchases" method="post" name="myform">
	<table class="boder_y" width="792" height="51" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><table>
					<tr>
						<td align="right" height="30" width="120">团购标题：</td>
						<td><input type="text" name="title" id="title" value="<s:property value="title" />" size="30"></td>
						<td align="right" height="28" width="100">团购产品：</td>
						<td><input type="text" name="productName" id="productName" value="<s:property value="productName" />" size="20"></td>					
					</tr>
					<tr> 
						<td align="right" height="28" width="120">团购状态：</td>
						<td colspan="3"><s:select list="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseService@status" headerKey="" headerValue="--全部--" listKey="key" listValue="value" name="status" id="status" cssStyle="width:150px;"></s:select> </td> 
					</tr> 
					<tr>
						<td align="right" height="30" width="120">团购开始时间：</td>
						<td colspan="2">
							从<input type="text" name="startTimeStart" id="startTimeStart" readonly="readonly" value="<s:property value="#request.startTimeStart" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss');">&nbsp;到&nbsp;
							  <input type="text" name="endTimeStart" id="endTimeStart" readonly="readonly" value="<s:property value="#request.endTimeStart" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss');">								
						</td>					
					</tr>
					<tr>
						<td align="right" height="30" width="120">团购结束时间：</td>
						<td colspan="2">
							从<input type="text" name="startTimeEnd" id="startTimeEnd" readonly="readonly" value="<s:property value="#request.startTimeEnd" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss');">&nbsp;到&nbsp;
							  <input type="text" name="endTimeEnd" id="endTimeEnd" readonly="readonly" value="<s:property value="#request.endTimeEnd" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss');">								
						</td>					
						<td align="right" width="100">
						<img src="<%=request.getContextPath()%>/image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='myGroupPurchases?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>					
					</tr>
				</table>		
			</td>
		</tr>	
	</table>
	<table width="792" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;" align="center">
	<s:if test="listGroupPurchaseInfo.size > 0">
		<tr>
			<td height="28" width="220" align="center" bgcolor="#e8f5fb"><strong>团购标题</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>团购产品</strong></td>
			<td height="28" width="50" align="center" bgcolor="#e8f5fb"><strong>已参团人数</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>开始时间</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>结束时间</strong></td>
			<td height="28" width="80" align="center" bgcolor="#e8f5fb"><strong>状态</strong></td>
        </tr>        
       <s:iterator value="listGroupPurchaseInfo" status="s" var="groupList">
       		<tr bgcolor='<s:if test="#s.index % 2 == 0"></s:if><s:else>#e8f5fb</s:else>'>
       			<td>&nbsp;<a href="displayMyGroupPD?groupPurchaseInfo.id=<s:property value="id"/>"><s:property value="title"/></a> 
       			</td>
       			<td>&nbsp;<s:property value="productName"/> </td>
       			<td align="center"><s:property value="currentUsers"/> </td>
       			<td align="center">&nbsp;<s:date name="statTime" format="yyyy-MM-dd HH:mm"/> </td>
       			<td align="center">&nbsp;<s:date name="stopTime" format="yyyy-MM-dd HH:mm"/> </td>
       			<td align="center">&nbsp;<s:property value="@com.bornsoft.asn.service.groupPurchase.GroupPurchaseService@status[status]"/> </td>
       		</tr>
       </s:iterator>
       </s:if>
       <s:else>
       		<tr>
       			<td colspan="5" height="50">没有查找到相关数据</td>
       		</tr>       	
		</s:else>
	</table>
	
	
	<table width="790" height="40" border="0" cellspacing="1" cellpadding="2">
			<s:property value="pageBar" escape="false"/>
	</table>
	</form>
	
	