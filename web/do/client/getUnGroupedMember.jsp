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
		document.myform.action="<%=cp%>/do/client/getUnGroupedMember?ssoAccount="+ssoAccount;
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
			var strURL="<%=cp%>/do/client/checkGroup?memberIdset="+value;
			window.open(strURL,'','height=600,width=200,top=200,left=300,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
		}
	}
</script>

<link href="../../css/comdo.css" rel="stylesheet" type="text/css" />
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
	color: #006600;
	font-weight: bold;
}

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
.str_hidden {
	overflow: hidden;
	width: 200px;
	word-wrap: normal;
	display: block;
	white-space: nowrap;
	-o-text-overflow: ellipsis; /* opera */
	text-overflow: ellipsis; /* ie, safari (webkit) */
	-moz-binding: url '../../../css/ellipsis.xml#ellipsis'; /* firefox */ 
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jqellipsis.js"></script>
<script type="text/javascript">
	$(function()
	{
		$('.str_hidden').ellipsis();
	});
</script>
</head>
<form action="<%=cp%>/do/client/getUnGroupedMember" name="myform" id="myform" >
	<table align="center"  height="51" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="title"><span class="STYLE1">未分组会员列表</span></td>
	</tr>
   	<tr>
         <td class="title" style="font-size:12px;border:1px solid #ffc383; padding:0 10px; line-height:150%; color:#ff7300; background:#fffced;">会员查询:
           <label>
           <input name="ssoAccount" type="text" id="ssoAccount" value="<%=request.getAttribute("ssoAccount")==null?"":request.getAttribute("ssoAccount")%>">
           <input type="button" name="Submit2" value="分组" onClick="goToGroup();" class="sm-buttom5-2">
           </label>
           <label>
           <input type="button" name="Submit" value="查询" onClick="sel();" class="sm-buttom5-2">
           <input name="memberId" type="hidden" id="memberId">
      </label></td>
   	</tr>  
	<tr>
	    <td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_border" style="margin-top:0px;">
                   <tr>
               	  	 <td width="130" height="28" align="center" bgcolor="#e8f5fb" style="font-size:13px"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>全选</td>
						<td width="160"  height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">登录账号</td>
						<td  align="center" bgcolor="#e8f5fb" style="font-size:13px" width="203">类型</td>					
						<td width="439"  height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">名称</td>
						<td width="402"  height="20" align="center" bgcolor="#e8f5fb" style="font-size:13px">所属地区</td>          
                  </tr>
				  <%
				  	if(list!=null)
					{
						String fullName,fullSpace;
						for(int i=0; i<list.size(); i++){
							Member m=list.get(i);
							if(m.getMemberType()!=null){
							
				%>
			  	<tr>
					<td style="font-size:12px"><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" onClick="" value="<%=f.n2s(m.getMemberId())%>"><%=m.getMemberId()%></td>
					<td style="font-size:12px">&nbsp;<%=f.n2s(m.getSsoAccount())%></a></td>
					<td align="center" style="font-size:12px">&nbsp;<%=m.getMemberType().intValue()==1?"单位":"个人" %></td>
					<td style="font-size:12px"><div class="str_hidden" title="<%=f.n2s(m.getFullName())%>"><%=f.n2s(m.getFullName())%></div></td>                               
					<td style="font-size:12px" title="<%=f.n2s(m.getArea())%>">&nbsp;<%=f.n2s(m.getArea())%></td>
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

