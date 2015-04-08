<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
	//查询未分组的组员
	function sel()
	{
		var ssoAccount=document.getElementById("ssoAccount").value;
		document.myform.action="<%=cp%>/admin/member/getUnGroupedMember?ssoAccount="+ssoAccount;
		document.myform.submit();
	}
	
	//全选
	function checkAll(obj){
		var checkbox=document.getElementsByName("tblistbox");
		for(var i = 0;i < checkbox.length; i++){
			if(checkbox[i].type == "checkbox")
	        {
				checkbox[i].checked = obj.checked;
	        }
		}
	}
	function operationMember()
	{
		var checkboxArray = document.getElementsByName("tblistbox");
		var value = "";
		for(var i = 0;i < checkboxArray.length; i++)
		{
			if(checkboxArray[i].checked)
			{
				if(value == "")
				{
					value += checkboxArray[i].value;
				}
				else
				{
					value += ","+checkboxArray[i].value;
				} 
			}
		}
		document.getElementById("memberId").value=value;
		/*if(value!="")
		{
			document.myform.action="<%=cp%>/admin/member/addMemberGroup?memberId="+value;
		}
		else
		{*/
			document.myform.action="<%=cp%>/admin/member/addMemberGroup";
		//}
			document.myform.submit();
		
	}

	function goToGroup()
	{
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
			alert("请选择用户！");
		}else{
			var strURL="<%=cp%>/admin/member/checkGroup?memberIdset="+value;
			window.open(strURL,'','height=600,width=200,top=200,left=300,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
		}
	}
</script>


<%


class Locafunction{
		public String prop(Object key){
			return PropertyFactory.getProperty("member.properties", key.toString());
		}
		public String n2s(Object obj){
			return obj==null?"&nbsp;":obj.toString();
		}
		public String areaName(Object area){
			String ret=area.toString();
			if(ret!=null && ret.indexOf("|")>0) ret=ret.substring(ret.indexOf("|")+1);
			return ret;
		}
	}
	Locafunction f=new Locafunction();
	
		List<Member> list=(List<Member>)request.getAttribute("memberList");
		if(list==null)
		{
			out.print("11fff");
		}
		String pFile="member.properties";
		PropertyFactory.getPropertiesByFileName("member.properties");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
<style type="text/css">
<!--
.STYLE1 {
	color: #006699;
	font-weight: bold;
	font-size: 14px;
}
.STYLE3 {font-size: 13px}
-->
a:link {
 text-decoration: none;
}


a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: underline;
 color: #FF0000;
}

</style>
</head>
<form action="<%=cp%>/admin/member/getUnGroupedMember" name="myform" id="myform" >
	<table align="center"  height="51" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="title"><span class="STYLE1">未分组会员列表</span></td>
	</tr>
   	<tr>
         <td class="title" style="font-size:12px;border:1px solid #ffc383; padding:0 10px; line-height:150%; color:#ff7300; background:#fffced;">会员查询:
           <label>
           <input name="ssoAccount" type="text" id="ssoAccount">
           <input type="button" name="Submit2" value="分组" onClick="goToGroup();" class="sm-buttom5-2">
           </label>
           <label>
           <input type="button" name="Submit" value="查询" onClick="sel();" class="sm-buttom5-2">
           <input name="memberId" type="hidden" id="memberId">
      </label></td>
   	</tr>  
	<tr>
	    <td>
		    <table width="100%" border="1" bordercolor="#999999" cellspacing="0" cellpadding="0" style="margin-top:0px;" class="table_border">
                   <tr>
               	  	 <td width="139" height="28" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>
               	  	    <span class="STYLE3">全选</span></td>
						<td width="57" height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">登录账号</td>
						<td height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px" width="35">类型</td>					
						<td width="220" height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">名称</td>
						<td width="52" height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">所属地区</td>          
                  </tr>
				  <%
				  	if(list!=null)
					{
						String fullName,fullSpace;
						for(int i=0; i<list.size(); i++){
							Member m=list.get(i);
							if(m.getMemberType()!=null){
								if((f.n2s(m.getFullName())).length()>17)
								{
									fullName=(f.n2s(m.getFullName())).substring(0,17)+"...";
								}
								else
								{
									fullName=f.n2s(m.getFullName());
								}
								if((f.n2s(m.getArea())).length()>13)
								{
									fullSpace=(f.n2s(m.getArea())).substring(0,13)+"..";
								}
								else
								{
									fullSpace=f.n2s(m.getArea());
								}
				%>
			  	<tr>
					<td style="font-size:12px"><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" onClick="" value="<%=f.n2s(m.getMemberId())%>"><%=m.getMemberId()%></td>
					<td style="font-size:12px">&nbsp;<%=f.n2s(m.getSsoAccount())%></a></td>
					<td align="center" style="font-size:12px" width="35">&nbsp;<%=m.getMemberType().intValue()==1?"单位":"个人" %></td>
					<td style="font-size:12px">&nbsp;
					<a href="<%=cp%>/admin/member/getMemberById?id=<%=m.getMemberId() %>" title="<%=f.n2s(m.getFullName())%>"><%=fullName%></a>
					</td>
					<td style="font-size:12px">&nbsp;
						<a href="<%=cp%>/admin/member/getMemberById?id=<%=m.getMemberId() %>" title="<%=f.n2s(m.getArea())%>"><%=fullSpace%></a>
					</td>
		  		</tr>
				<%
					}}}
				%>
		  </table>
		</td>
	</tr>
</table>
</form>

</html>

