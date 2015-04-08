<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory"%>
<%@ page import="com.bornsoft.asn.action.member.MemberGroup"%>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<link href="../../css/comdo.css" rel="stylesheet" type="text/css" /> 
<!-- <link href="../../css/main.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
-->
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>


<script type="text/javascript">
	
	function delMemberGroup()
	{
		var value=document.getElementById("hGroupIdSet").value;
		if(value=="")
		{
			alert("请选择要删除的组别");
		}
		else
		{
			if(confirm('删除该组别后，该组别的所有会员将被分配为未分组会员，你确定删除该组别?')){
				location.href="<%=cp%>/do/client/delMemberGroup?groupIdset="+value;
			}
		}
	}
	
	function getMember(id)
	{
		var id=document.getElementsByName("hGroupId")[id-1].value;
		document.getElementById("hGroupIdSet").value=id;
		window.parent.frames["groupMember"].location.href="<%=cp%>/do/client/getGroupMember?groupId="+id;	
	}
	
	function inGroup()
	{
		var groupValue=document.getElementById("hGroupIdSet").value;
		var memberValue=document.getElementById("hMemberId").value;
		if(groupValue=="")
		{
			alert("请选择要操作的组别");
		}
		else if(groupValue.indexOf(",")>=0)
		{
			alert("只能选择一个组别进行分组操作");
		}
		else
		{
			if(confirm('你确定分组?')){
			location.href="<%=cp%>/do/client/inGroup?groupIdset="+groupValue+"&memberIdSet="+memberValue;
			}
		}	
	}
	function addGroup()
	{
		window.parent.frames["groupMember"].location.href="<%=cp%>/do/client/addGroup";	
	}
	function memberInGroup()
	{
		var groupName=document.getElementById("groupName").value;
		location.href="<%=cp%>/do/client/groupChoose?groupName="+groupName;
	}
	function getUnGroupedMember()
	{
		window.parent.frames["groupMember"].location.href="<%=cp%>/do/client/getUnGroupedMember";
	}
	function getGroupMember()
	{
		window.parent.frames["groupMember"].location.href="<%=cp%>/do/client/getGroupMember";
	}
	function getAllMember()
	{
		window.parent.frames["groupMember"].location.href="<%=cp%>/do/client/getAllMember";
	}
	function editGroup(id)
	{
		var id=document.getElementById("hGroupIdSet").value;
		if(id=="")
		{
			alert("请首先单击要进行编辑的组");
		}
		else
		{
			window.parent.frames["groupMember"].location.href="<%=cp%>/do/client/getEditGroup?groupId="+id;
		}
	}
</script>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 14px;
	font-weight: bold;
	color: #112482;
}
.str_hidden {
	overflow: hidden;
	width: 130px;
	word-wrap: normal;
	display: block;
	white-space: nowrap;
	-o-text-overflow: ellipsis; /* opera */
	text-overflow: ellipsis; /* ie, safari (webkit) */
	-moz-binding: url '../../../css/ellipsis.xml#ellipsis'; /* firefox */ 
}
-->
</style>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jqellipsis.js"></script>
<script type="text/javascript">
	$(function()
	{
		$('.str_hidden').ellipsis();
	});
</script>
<body style="background-color:#3683C4">


<form action="<%=cp%>/do/client/groupChoose" name="myform" id="myform" method="post">
<table width="30%">
	<tr>
					<td class="color_h" style="font-size:12px">	
						<input name="groupName" type="text" id="groupName" value="<%=request.getAttribute("groupName")==null?"":request.getAttribute("groupName")%>" size="12" /> 
						<input type="button" name="Submit" value="搜索分组" class="sm-buttom5-2" onClick="memberInGroup();">					
					</td>
				</tr>
	<tr>
		<td colspan="2" class="color_h">
            <input name="addMemberGroup" type="button" class="sm-buttom5-2" id="addMemberGroup"  value="增加组别" onClick="addGroup();">     
            <input name="hGroupIdSet" type="hidden" id="hGroupIdSet">
	  </td>
	</tr>
	<tr>
		<td class="color_h"><input type="button" name="Submit2" value="删除组" class="sm-buttom5-2" onClick="delMemberGroup();"></td>
	</tr>
	<tr>
		<td class="color_h"><input name="buttonGroup" type="button" class="sm-buttom5-2" onClick="editGroup();" value="编辑组" ></td>
	</tr>
	<tr>
		<td class="color_h"><input type="button" name="Submit32" value="显示未分组组员" onClick="getUnGroupedMember();" class="sm-buttom5-2"></td>
	</tr>
</table>
<table width="100%" style="margin-top:0px;">
	<tr>
		<td width="100%">
			<table width="100%" style="margin-top:0px;">		
				<tr>
					<td width="100%">
						<table width="100%"  cellspacing="0" cellpadding="0"  id="tb">
							<tr>
								<td width="95%"  align="center" class="color_h" style="font-size:12"><span class="STYLE1 top-link top-link top-link">组名</span></td>
							</tr>
							<%
								int id=0;
								List<MemberGroup> list = (List<MemberGroup>) request.getAttribute("MemberGroupList");
								if(list!=null)
								{
									for (int i = 0; i < list.size(); i++) 
									{
										MemberGroup mp = list.get(i);
										id=id+1;
							%>
							<tr onClick="var tb = document.getElementById('tb'); for(var k = 0; k < tb.rows.length; k++)
				{ tb.rows[k].style.backgroundColor=''; } if(this.style.backgroundColor != 'green'){getMember(<%=id%>);this.style.backgroundColor = 'green';}else{this.style.backgroundColor = '';offcolor();}"  onmouseover="if(this.style.backgroundColor != 'green'){this.style.backgroundColor = '#ddd';}" onMouseOut="if(this.style.backgroundColor != 'green'){this.style.backgroundColor = '';}">
								<td height="20"><div class="str_hidden" title="<%=mp.getGroup_name()%>"><%=mp.getGroup_name()%><input name="hGroupId" id="<%=id%>" type="hidden" value="<%=mp.getID()%>" /></div></td>
							</tr>
							<%
									}
								}
							%>
						</table>						
					</td>
				</tr>
		</table>		
		</td>
	</tr>
</table>
</form>
</body>
</html>
