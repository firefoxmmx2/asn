<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo" %> 
<%@ page import="com.bornsoft.asn.service.groupPurchase.GroupPurchaseService" %>   
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<SCRIPT src="<%=request.getContextPath()%>/js/datetime2.js"></SCRIPT>

<script type="text/javascript">
<!--
function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }
	}
}
function operation(val,operation){
	var checkboxArray = document.getElementsByName("tblistbox");
	var value = "";
	for(var i = 0;i < checkboxArray.length; i++){
		if(checkboxArray[i].checked)
        {
			if(value == ""){
				value += checkboxArray[i].value;
			}else{
				value += ","+checkboxArray[i].value;
			} 
        }
	}
	if(value == ""){
		alert("请选择！");
	}else{
		if(operation == "check"){
			location.href="adminCheckMember";
		}else if(operation == "delete"){
			if(confirm('你确定删除?')){
				location.href="removeGroupPurchase?idset="+value;
			}
		}
		else if(operation == "publish"){
			if(confirm('你确定发布该团购?')){
				location.href="statusGroupPurchase?idset="+value+"&operationType="+val;
			}
		}
		else if(operation == "close"){
			if(confirm('你确定关闭该团购?')){
				location.href="statusGroupPurchase?idset="+value+"&operationType="+val;
			}
		}
		else if(operation == "end"){
			if(confirm('你确定结束该团购?')){
				location.href="statusGroupPurchase?idset="+value+"&operationType="+val;
			}
		}
	}
	
}
//-->
</script>

	<%
		List<GroupPurchaseInfo> listGroupPurchaseInfo = (List<GroupPurchaseInfo>)request.getAttribute("listGroupPurchaseInfo");
	%>

	<table align="center" width="792" height="39" cellpadding="0" cellspacing="0">
	   	<tr>
	         <td height="39" class="title">团购信息列表</td>
	   	</tr> 
	</table> 

	<form action="<%=request.getContextPath()%>/admin/groupPurchase/listGroupPurchase" method="post" name="myform">
	<table class="boder_y" width="792" height="51" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><table width="560">
					<tr>
						<td align="right" height="30" width="120">团购标题：</td>
						<td><input type="text" name="title" id="title" value="<s:property value="#request.title" />" size="30"></td>
						<td align="right" height="28" width="100">团购产品：</td>
						<td><input type="text" name="productName" id="productName" value="<s:property value="#request.productName" />" size="20"></td>					
					</tr>
					<tr> 
						<td align="right" height="28" width="120">团购状态：</td>
						<td colspan="3"><s:select list="#{'':'选择状态','N':'未发布','Y':'发布','C':'关闭','O':'结束'}" name="status" id="status" cssStyle="width:150px;"></s:select> </td> 
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
						<img src="<%=request.getContextPath()%>/image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listGroupPurchase?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>					
					</tr>
				</table>		
			</td>
		</tr>	
	</table>
	
	
	<table width="792" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;">
		<tr>
            <td height="28" width="60" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>序号</td>
			<td height="28" width="220" align="center" bgcolor="#e8f5fb"><strong>团购标题</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>团购产品</strong></td>
			<td height="28" width="50" align="center" bgcolor="#e8f5fb"><strong>已参团人数</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>开始时间</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>结束时间</strong></td>
			<td height="28" width="80" align="center" bgcolor="#e8f5fb"><strong>状态</strong></td>
			<td height="28" width="120" align="center" bgcolor="#e8f5fb"><strong>操作</strong></td>
        </tr>        
       
       <% 
       if(listGroupPurchaseInfo != null){     
       	for(int i=0; i<listGroupPurchaseInfo.size(); i++){
       		GroupPurchaseInfo g = listGroupPurchaseInfo.get(i);
       %>
       		<tr bgcolor="<%=i%2==0?"":"#e8f5fb"%>">
       			<td height="40"><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=g.getId()%>"><%=g.getId()%></td>
       			<td>&nbsp;<a href="displayGroupPD?groupPurchaseInfo.id=<%=g.getId()%>"><%=g.getTitle() %></a> 
       			
       			</td>
       			<td>&nbsp;<%=g.getProductName() %></td>
       			<td align="center"><%=g.getCurrentUsers() %></td>
       			<td align="center">&nbsp;<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(g.getStartTime()) %></td>
       			<td align="center">&nbsp;<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(g.getStopTime()) %></td>
       			<td align="center">&nbsp;<%= GroupPurchaseService.status.get(g.getStatus()) %></td>
       			<td align="center">
       			
       				<a href="displayGroupPD?groupPurchaseInfo.id=<%=g.getId()%>">订购详情</a> | 
       				<a href="toUpdateGroupPurchase?id=<%=g.getId()%>">修改</a>
       			
       			</td>
       		</tr>
       <% }
       	}else{
       	%>
       		<tr>
       			<td colspan="5" height="50">没有查找到相关数据</td>
       		</tr>       	
       	<% } %>
	
	</table>
	
	<table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
			<tr>
				<td align="left" height="40">
					<input type="button" value="新增团购" onClick="window.location.href='toCreateGroupPurchase'" class="sm-buttom4-2" >
					<input type="button" value="发布团购" onClick="operation('yes','publish')" class="sm-buttom4-2" >
					<input type="button" value="关闭团购" onClick="operation('no','close')" class="sm-buttom4-2" >
					<input type="button" value="结束团购" onClick="operation('end','end')" class="sm-buttom4-2" >
					<input type="button" value="删除团购" onClick="operation('','delete')" class="sm-buttom4-2" >
				</td>		
			</tr>
		</table>
	
	<table width="790" height="40" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
	</table>
	</form>
	
	