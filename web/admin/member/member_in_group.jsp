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
<!-- <link href="../../css/main.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
-->
<%
	String cp = request.getContextPath();
	/*String memberId=(String)request.getAttribute("memberIdset");
	if(memberId==null)
	{
		memberId="暂无";
	}*/
%>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>

<script type="text/javascript">
	function checkAll(obj)
	{
		var checkbox=document.getElementsByName("grouplistbox");
		for(var i = 0;i < checkbox.length; i++){
			if(checkbox[i].type == "checkbox")
			{
				checkbox[i].checked = obj.checked;
			}
		}
	}
	function delMemberGroup()
	{
		var value=document.getElementById("hGroupIdSet").value;
		if(confirm('你确定删除?')){
			location.href="<%=cp%>/admin/member/delMemberGroup?groupIdset="+value;
		}
	}
	
	function getMember(id)
	{
		var id=document.getElementsByName("grouplistbox")[id-1].value;
		//alert(id);
		//location.href="<%=cp%>/admin/member/memberInGroup?groupId="+id;
	}
	
	function checkGroupId()
	{
		var checkboxArray = document.getElementsByName("grouplistbox");
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
		document.getElementById("hGroupIdSet").value=value;
	}
	function inGroup()
	{
		var groupValue=document.getElementById("hGroupIdSet").value;
		//var memberValue=document.getElementById("hMemberId").value;
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
			location.href="<%=cp%>/admin/member/inGroup?groupIdset="+groupValue+"&memberIdSet="+memberValue;
			}
		}	
	}
	function addGroup()
	{
		var addGroupName=document.getElementById("addGroupName").value;
		if(addGroupName=="")
		{
			alert("要增加的组别名不能为空");
		}
		else
		{
			location.href="<%=cp%>/admin/member/addMemberGroup?addGroupName="+addGroupName;
		}
	}
	function memberInGroup()
	{
		var groupName=document.getElementById("groupName").value;
		location.href="<%=cp%>/admin/member/memberInGroup?groupName="+groupName;
	}
</script>
</head>

<body>


<form action="" name="myform" id="myform" method="post">
<table width="100%">
			<tr>
				<td width="20%" valign="top"><iframe src="<%=cp%>/admin/member/groupChoose"  id="groupChoose" name="groupChoose" align="MIDDLE" width="100%" height="425" marginwidth="1" marginheight="1" frameborder="none" style="margin-top:1;"  scrolling="YES"></iframe></td><td id="td1" valign="top" width="80%"><iframe src="<%=cp%>/admin/member/getAllMember"  id="groupMember" name="groupMember" align="MIDDLE" width="100%" height="425" marginwidth="1" marginheight="1" frameborder="none" style="margin-top:1;"  scrolling="YES"></iframe></td>
			</tr>
		</table>
</form>


</body>
</html>
