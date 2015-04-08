<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.action.member.MemberGroup" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String cp=request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<!-- <link href="../../css/main.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
-->

<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>

<script type="text/javascript">
	function upGroupName()
	{
		var gName=document.getElementById("groupName").value;
		if(gName="")
		{
			alert("修改的新组名不能为空");
		}
		else
		{
			document.myform.action="<%=cp%>/admin/member/upGroupName";
			document.myform.submit();
		}
	}
</script>
	
	<% 
		MemberGroup mgroup = (MemberGroup)request.getAttribute("memberGroup");
		String groupName="";
		String groupId="";
		if(mgroup!=null)
		{
			groupName=mgroup.getGroup_name();
			groupId=mgroup.getID();
		}
		else{
				groupName="";
				groupId="";
		}
	%>
	<s:form  name="myform" id="myform">
	<table align="center"  height="51" cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td style="font-size:12px;border:1px solid #ffc383; padding:0 10px; line-height:150%; color:#ff7300; background:#fffced;">编辑组名:
		  <input name="groupName" type="text" id="groupName" value="<%=groupName%>" size="20">
	      <input type="button" name="Submit3" value="修改" onClick="upGroupName();" class="sm-buttom5-2">
	      <input name="groupId" type="hidden" id="groupId" value="<%=groupId%>">
      </td>
	</tr>
</table>
</s:form>



