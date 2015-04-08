<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String cp=request.getContextPath();

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
<!-- <link href="../../css/main.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
-->

<style type="text/css">
	.str_hidden {
	overflow: hidden;
	width: 185px;
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
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

<script type="text/javascript">

var memberUrl="~/admin/member/getMemberById";

//初始化地区组件
geoloc.debugOn();
$(document).ready(function(){
	geoloc.init("divArea", "- 不限省市 -",null, null, "area","${requestScope.member.area }".substring(0,6));
});

// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
function showSelection(){
	var sel=geoloc.getSelection("divArea");
	if(sel==null){
		alert("没有选择");
	} else {
		alert(sel);
	}
}


function operationMember(val,operation){
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
		if(operation == "check"){
			location.href="adminCheckMember?memberIdset="+value+"&checktype="+val;
		}else if(operation == "del"){
			if(confirm('你确定删除?')){
				location.href="delMemberInfo?memberIdset="+value;
			}
		}else if(operation == "lock"){
			if(confirm('你确定冻结用户?')){
				location.href="updMemberLocked?memberIdset="+value+"&lock="+val;
			}
		}
		else if(operation == "unlock"){
			if(confirm('你确定恢复用户?')){
				location.href="updMemberLocked?memberIdset="+value+"&lock="+val;
			}
		}
	}
}

	function addMemberGroupPage()
	{
		var strURL="add_member_group.jsp";
		window.open(strURL,'','height=600,width=520,top=200,left=300,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=yes');
	}
	function upGrade(id)
	{
		location.href = "<%=cp%>/do/client/getUpGradeScore?upId="+id;
	}
</script>

	<form id="myform" name="myform" method="post">
	<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">会员列表</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="6%" class="color_h">
            	<select name="member.memberType">
		  		<option value="">会员类型</option>
		  		<option value="1" <s:if test='member.memberType == "1"'>selected</s:if> >机构</option>
		  		<option value="2" <s:if test='member.memberType == "2"'>selected</s:if> >个人</option>
		  		</select>
		  	</td>
		  	
            <td width="17%" class="color_h">
            	<input type="text" name="member.fullName" id="member.fullName" value="<s:property value="#request.member.fullName"/>" />
            </td>
            <td width="17%" class="color_h">
            	<input type="hidden" name="member.area" id="area"><span id="divArea"></span>
            </td>
            <% Member mb = (Member)request.getAttribute("member"); if(mb == null){mb = new Member();}%>
		  	<td width="17%" class="color_h">
		  		<select name="member.approveState">
		  		<option value="">会员状态</option>
		  		<option value="MailVerify" <%=mb.getApproveState()== AsnConstLib.MemberApproveState.MailVerify?"selected":"" %> >邮件验证</option>
		  		<option value="ManualVerify" <%=mb.getApproveState()== AsnConstLib.MemberApproveState.ManualVerify?"selected":"" %> >人工审核</option>
		  		<option value="Completed" <%=mb.getApproveState()== AsnConstLib.MemberApproveState.Completed?"selected":"" %> >审核完成</option>
		  		<option value="Rejected" <%=mb.getApproveState()== AsnConstLib.MemberApproveState.Rejected?"selected":"" %> >审核拒绝</option>
		  		</select></td>
            <td width="10%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='getClientInfo?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
               	  	 <td width="45" height="28" align="center" bgcolor="#e8f5fb"></input>
               	  	   序号</td>
               	  	 <td width="93" height="28" align="center" bgcolor="#e8f5fb">登录账号</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="35">类型</td>					
						<td height="28" align="center" bgcolor="#e8f5fb">名称</td>
						<td height="28" align="center" bgcolor="#e8f5fb">所属地区</td>
						<!-- <td height="28" align="center" bgcolor="#e8f5fb">固定电话</td> -->
						<!-- <td height="28" align="center" bgcolor="#e8f5fb">联系人</td> -->
						<td width="99" height="28" align="center" bgcolor="#e8f5fb">联系方式</td>
						<td width="44" height="28" align="center" bgcolor="#e8f5fb">等级</td>
						<td width="66" height="28" align="center" bgcolor="#e8f5fb">审核状态</td>
						<td width="78" height="28" align="center" bgcolor="#e8f5fb">修改等级</td>
						<!-- <td height="28" align="center" bgcolor="#e8f5fb">最后登录时间</td> -->	                    
                  </tr>
				  <%
				  	String aName=null;
					for(int i=0; i<list.size(); i++){
						Member m=list.get(i);
						if(m.getArea()!=null)
						{
							aName=f.areaName(m.getArea());
						}
						else
						{f.n2s(aName);}
				%>
			  	<tr>
					<td height="40"><%=f.n2s(m.getMemberId())%></td><td>&nbsp;<a href="<%=cp%>/do/member/getMemberById?id=<%=m.getMemberId() %>"><%=f.n2s(m.getSsoAccount())%></a>
						<%if(m.getApproveState().toString().equals("ManualVerify")){ %><IMG src="<%=cp%>/image/new-green.gif" /><%} %>					</td>
					<td align="center"><%=m.getMemberType().intValue()==1?"单位":"个人" %></td>
				  <td width="197"><div class="str_hidden" title="<%=f.n2s(m.getFullName())%>"><%=f.n2s(m.getFullName())%></div></td>
					<td width="133">&nbsp;<%=aName%></td>
					<td>&nbsp;<%=f.n2s(m.getFixedPhone())%></td>
					<td>&nbsp;<%=f.n2s(m.getGradeScore())%></td>
					<td>&nbsp;<%=f.n2s(f.prop("MemberApproveState."+m.getApproveState()))%></td>
					<td><label>
					  <input type="button" name="upGradeScore"  id="<%=f.n2s(m.getMemberId())%>" value="修改等级" onClick="upGrade(<%=f.n2s(m.getMemberId())%>);">
					</label></td>
		  		</tr>
				<%
					}
				%>
		  </table>
		<table width="790" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
		</table>
		</td>
	</tr>
</table>
</form>



