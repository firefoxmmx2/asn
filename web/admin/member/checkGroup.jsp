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
	String memberId=(String)request.getAttribute("memberIdset");
%>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>


<script type="text/javascript">	
	function inGroup()
	{
		var groupValue=document.getElementById("checkedGroupId").value;
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
			if(confirm('你确定对选定的会员进行分组?')){
				document.myform.action="<%=cp%>/admin/member/inGroup";
				document.myform.submit();
				window.parent.myform.action="<%=cp%>/admin/member/getGroupMember";
				window.parent.myform.submit();
				window.close();
			}
		}	
	}
	
	function checkGroup(id)
	{
		var grouopId=document.getElementsByName("hGroupId")[id-1].value;
		document.getElementById("checkedGroupId").value=grouopId;
	}
	
	function sel()
	{
		document.myform.action="<%=cp%>/admin/member/checkGroup";
		document.myform.submit();
	}
</script>
<style type="text/css">
<!--
.STYLE1 {
	color: #006699;
	font-weight: bold;
}
-->
</style>
</head>

<body>


<form  action="<%=cp%>/admin/member/checkGroup" name="myform" id="myform" >

<table width="30%" border="0">
	<tr>
		<td width="100%">
			<table width="100%" class="table_border">
				<tr>
					<td class="title" align="center"><span class="STYLE1">组列表</span>
			      <input name="memberId" type="hidden" id="memberId" value="<%=memberId%>"></td>	
				</tr>
				<tr>
				  <td class="color_h" style="font-size:12px">组名:	
						<input name="groupName" type="text" id="groupName" value="" size="25" /> 
						<input type="button" name="Submit" value="搜索分组" class="sm-buttom4-2" onClick="sel();">
						<input type="button" name="Submit2" value="确定分组" onClick="inGroup();">
						<input name="checkedGroupId" type="hidden" id="checkedGroupId" >						</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 0px;" id="tb">
							<tr>
								<td width="95%"  align="center" bgcolor="#e8f5fb" style="font-size:12">组名</td>
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
				
							<tr onClick="for(var k = 0; k < tb.rows.length; k++)
				{tb.rows(k).runtimeStyle.backgroundColor=''; } if(this.runtimeStyle.backgroundColor != 'green'){checkGroup(<%=id%>);this.runtimeStyle.backgroundColor = 'green';}else{this.runtimeStyle.backgroundColor = '';}"  onmouseover="if(this.runtimeStyle.backgroundColor != 'green'){this.runtimeStyle.backgroundColor = '#ddd';}" onMouseOut="if(this.runtimeStyle.backgroundColor != 'green'){this.runtimeStyle.backgroundColor = '';}">
								<td><%=mp.getGroup_name()%><input name="hGroupId" id="<%=id%>" type="hidden" value="<%=mp.getID()%>" /></td>
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
