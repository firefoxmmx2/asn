<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String cp=request.getContextPath();
%>    
<%@ page import="com.bornsoft.asn.bean.member.Member,java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有会员</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<style type="text/css">
	body{font-size: 12px;font-family:'新宋体'}
	a:link { color:#0066CC; text-decoration: none} 
	a:visited { color:#0066CC; text-decoration: none} 
	a:hover { color: #800080; background-color:#FF9900; text-decoration: underline} 
	a:active { color: #800080; text-decoration: underline} 
</style>
<script type="text/javascript">
	function bg(val){
		var numRows = $("#totbl")[0].rows.length-1; //行数
		for(var i=1; i<=numRows;i++){
			if(i==val){
				document.getElementById("toTR"+i).bgColor ="#999999";
			}else{
				document.getElementById("toTR"+i).bgColor ="#FFFFFF";
			}
		}
	}
	function selMember(val){
		//向父页面输入框填值的代码
		opener.document.getElementsByName('smsSend.mobileNo')[0].value = val+","+opener.document.getElementsByName('smsSend.mobileNo')[0].value;
		window.close();
	}

	function checkAll(obj){
		var checkbox=document.getElementsByName("tblistbox");
		for(var i = 0;i < checkbox.length; i++){
			if(checkbox[i].type == "checkbox")
	        {
				checkbox[i].checked = obj.checked;
	        }
		}
	}

	function operationMember(){
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

		//向父页面输入框填值的代码
		opener.document.getElementsByName('smsSend.mobileNo')[0].value = value+","+opener.document.getElementsByName('smsSend.mobileNo')[0].value;
		window.close();
	}
</script>
</head>
<body>
	<form action="<%=cp%>/admin/sms/allMember" name="myform" method="post">
	<table width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td  colspan="3"><font color="red">温馨提示：</font>如果你觉得信息太多，请输入用户名称，进行查找</td>
		</tr>
		<tr>
			<td align="right"><strong>会员名称：</strong></td>
			<td>
				<input type="text" name="memberName" id="memberName" size="30"/>
				<input type="button" value="查 询" onClick="myform.action='<%=cp%>/admin/sms/allMember?pageType=sub';myform.submit();" />
			</td>
		</tr>
	</table>
	
	<table width="99%" cellpadding="0" cellspacing="0" border="1" style="border-collapse:collapse;" id="totbl">
		<tr>
			<td height="30" width="15%" align="center"><label><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>序号</label></td>
			<td width="65%" align="center"><strong>名 称</strong></td>
			<td width="20%" align="center"><strong>联系电话</strong></td>
		</tr>
		  <%int index =1;
			for(Member member:(List<Member>) request.getAttribute("listMember")){
				if(member != null){		
		  %>
			<tr id="toTR<%=index %>" onmouseover="bg('<%=index %>')" ondblclick="selMember('<%=member.getMobilePhone() %>')">
				<td height="20">&nbsp;<label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=member.getMobilePhone()%>"><%=member.getMemberId() %></label></td>
				<td>&nbsp;&nbsp;<%=member.getFullName() %></td>
				<td align="center"><%=member.getMobilePhone() %></td>
			</tr>
		  <%          
				index++;
				}
			} 
		 %>
		
	</table>
	
	<table width="99%" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
			<tr>
				<td align="left" height="40">
					<input type="button" value="选择" onClick="operationMember('1','check')" class="sm-buttom4-2" >
				</td>		
			</tr>
		</table>
	
	<table width="99%" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
	</table>
	</form>
</body>
</html>
	
	
	