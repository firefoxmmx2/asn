<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String cp=request.getContextPath();
%>    
<%@ page import="com.bornsoft.asn.bean.member.Member,java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业会员</title>
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
	function selMember(val,id){
		//向父页面输入框填值的代码
		opener.document.getElementsByName('guaranteeName')[0].value = val;
		opener.document.getElementsByName("supplier.voucherId")[0].value = id;
		window.close();
	}
</script>
</head>
<body>
	<form action="/asn/do/member/checkEnterprise" name="myform" method="post">
	<table width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td  colspan="3"><font color="red">温馨提示：</font>如果你觉得信息太多，请输入企业名称，进行查找</td>
		</tr>
		<tr>
			<td align="right"><strong>企业会员名称：</strong></td>
			<td>
				<input type="text" name="memberName" id="memberName" size="30"/>
				<input type="submit" value="查 询" />
			</td>
		</tr>
	</table>
	</form>
	<table width="99%" cellpadding="0" cellspacing="0" border="1" style="border-collapse:collapse;" id="totbl">
		<tr>
			<td height="30" width="10%" align="center"><strong>序 号</strong></td>
			<td width="70%" align="center"><strong>名 称</strong></td>
			<td width="20%" align="center"><strong>操 作</strong></td>
		</tr>
		<%  int index =1;
			for(Member member:(List<Member>) request.getAttribute("list")){
				if(member != null){		
		%>
		<tr id="toTR<%=index %>" onmouseover="bg('<%=index %>')" ondblclick="selMember('<%=member.getFullName() %>','<%=member.getMemberId() %>')">
			<td align="center" height="20"><%=index %></td>
			<td>&nbsp;&nbsp;<%=member.getFullName() %></td>
			<td align="center"><a href="javascript:" onclick="selMember('<%=member.getFullName() %>','<%=member.getMemberId() %>')">选 择</a></td>
		</tr>
		<% 
				index++;
				}
			} 
		%>
		
	</table>

</body>
</html>