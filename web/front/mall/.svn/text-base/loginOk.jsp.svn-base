<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>


<% 
	Object loginMemberId = request.getSession().getAttribute("loginMemberId");
	Member member = null;
	if(loginMemberId != null){
		member = MemberService.getMember(session);
	}
	if(member!=null)
	{
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="29" background="<%=request.getContextPath()%>/image/platform/welcome_bg.jpg" class="baib" align="center">欢迎你，<%=member.getSsoAccount() %>  退出</td>
</tr>
<tr>
    <td valign="top" class="border_bule">
		<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		    <td height="24" align="left">我的购物车<span class="yellow">(0)</span></td>
		</tr>
		<tr>
		    <td height="24" align="left">产品总金额:<span class="yellow">0 </span>元</td>
		</tr> 
		<tr>
		    <td height="24" align="left">待定中</td>
		</tr>                 
		<tr>
		    <td height="28" align="left">重要提醒：</td>
		</tr>
		<tr>
		    <td height="24" align="left"><span class="yellow">完善公司信息，</span>马上开通网站</td>
		</tr>
		<tr>
		    <td height="24" align="left"><span class="yellow">发布供求信息，</span>保证信息的真实</td>
		</tr>
		</table>
	</td>
</tr>
</table>
<%
	}
	else
	{
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="29" background="<%=request.getContextPath()%>/image/platform/welcome_bg.jpg" class="baib" align="center">会员中心</td>
</tr>
<tr>
    <td valign="top" class="border_bule">
    	<iframe src="http://appsvr.aiecp.com:8080/ptnsso/signon/indexLoginncp.sso" width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
    
    	<!-- 
		<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		    <td height="24" align="left">我的购物车<span class="yellow">(0)</span></td>
		</tr>
		<tr>
		    <td height="24" align="left">产品总金额:<span class="yellow">0 </span>元</td>
		</tr> 
		<tr>
		    <td height="24" align="left">待定中</td>
		</tr>                 
		<tr>
		    <td height="28" align="left">重要提醒：</td>
		</tr>
		<tr>
		    <td height="24" align="left"><span class="yellow">完善公司信息，</span>马上开通网站</td>
		</tr>
		<tr>
		    <td height="24" align="left"><span class="yellow">发布供求信息，</span>保证信息的真实</td>
		</tr>
		</table>
		 -->
	</td>
</tr>
</table>

<%
	}
%>

