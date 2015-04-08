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
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<!-- <link href="../../css/main.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
-->

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

function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }
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

</script>


	<s:form action="listMemberByParam" name="myform" id="myform" method="post">
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
            <td width="10%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listMemberByParam?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                   	  	<td height="28" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>序号</td>
						<td height="28" align="center" bgcolor="#e8f5fb">登录账号</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="40">类型</td>					
						<td height="28" align="center" bgcolor="#e8f5fb">名称</td>
						<td height="28" align="center" bgcolor="#e8f5fb">所属地区</td>
						<!-- <td height="28" align="center" bgcolor="#e8f5fb">固定电话</td> -->
						<!-- <td height="28" align="center" bgcolor="#e8f5fb">联系人</td> -->
						<td height="28" align="center" bgcolor="#e8f5fb">审核状态</td>
						<td height="28" align="center" bgcolor="#e8f5fb">锁定状态</td>
						<td height="28" align="center" bgcolor="#e8f5fb">注册时间</td>
						<!-- <td height="28" align="center" bgcolor="#e8f5fb">最后登录时间</td> -->	                    
                  </tr>
				  <%
					for(int i=0; i<list.size(); i++){
						Member m=list.get(i);
						System.out.println(f.prop("MemberApproveState."+m.getApproveState()));
				%>
			  	<tr>
					<td height="40"><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=f.n2s(m.getMemberId())%>"><%=f.n2s(m.getMemberId())%></td>
					<td>&nbsp;<a target="_blank" href="<%=cp%>/admin/member/getMemberById?id=<%=m.getMemberId() %>"><%=f.n2s(m.getSsoAccount())%></a>
						<%if(m.getApproveState().toString().equals("ManualVerify")){ %><IMG src="<%=cp%>/image/new-green.gif" /><%} %>
					</td>
					<td align="center"><%=m.getMemberType().intValue()==1?"单位":"个人" %></td>
					<td width="200">&nbsp;<%=f.n2s(m.getFullName())%></td>
					<td width="200">&nbsp;<%=f.n2s(f.areaName(m.getArea()==null?"":m.getArea()))%></td>
					<!-- <td class="zuo"><%=f.n2s(m.getFixedPhone())%></td>
					<td>&nbsp;<%=f.n2s(m.getContactor())%></td> -->
					<td>&nbsp;<%=f.n2s(f.prop("MemberApproveState."+m.getApproveState()))%></td>
					<td>&nbsp;<%=f.n2s(f.prop("MemberLockState."+m.getLockState())) %></td>
					<td>&nbsp;<%=f.n2s(m.getRegisterTime()== null?"":m.getRegisterTime().toString().substring(0,10))%></td>
					<!-- <td class="zuo"><%=f.n2s(m.getLastLoginTime()== null?"":m.getLastLoginTime().toString().substring(0,10))%></td> -->
		  		</tr>
				<%
					}
				%>
				  
		  </table>
		  
		  <table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
			<tr>
				<td align="left" height="40">
					<input type="button" value="审核通过" onClick="operationMember('1','check')" class="sm-buttom4-2" >
					<input type="button" value="审核不通过" onClick="operationMember('2','check')" class="sm-buttom5-2" >
					<input type="button" value="删除" onClick="operationMember('0','del')" class="sm-buttom2-2" >
					<input type="button" value="冻结" onClick="operationMember('Locked','lock')" class="sm-buttom2-2" >
					<input type="button" value="恢复" onClick="operationMember('Unlocked','unlock')" class="sm-buttom2-2" >
				</td>		
			</tr>
		</table>
		<table width="790" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
		</table>
		</td>
	</tr>
</table>
</s:form>



