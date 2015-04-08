<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.product.ProductSupplyService" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%@ page import="com.bornsoft.asn.bean.supplier.Supplier" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.utils.common.WebContext" %>
<%
String cp=request.getContextPath();

String mainSite = (String)WebContext.session(session, "mainSite");
//if(mainSite==null||mainSite.trim().length()<=0)
//	mainSite = (String)request.getAttribute("mainSite");
//request.setAttribute("mainSite", mainSite);
//out.println("mainSite:"+ mainSite);

Long sId=MemberService.getMemberId(session);
Member member=MemberService.getMember(session);

%>

<%@page import="com.bornsoft.asn.utils.common.WebContext"%><table width="950" height="78" background="<%=cp%>/image/comdo/head01.jpg" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="350">&nbsp;</td>
		<td width="340" class="top-account">您好，&nbsp;&nbsp;&nbsp;<%=member.getShortName()%>&nbsp;&nbsp;[&nbsp;<a href="<%=cp%>/logout?mainSite=<%=mainSite%>">退出</a>&nbsp;]&nbsp;&nbsp;&nbsp;</td>
		<td width="260"><table width="100%" height="63" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td height="50%"  class="top-link"><!-- 
					<a href="http://www.aiecp.com">系统首页</a>&nbsp;|&nbsp;
					<a href="<%=cp%>/front/cate0">商城首页</a>&nbsp;|&nbsp;
					<a href="<%=cp%>/front/info/showSupplyInfoList">供应信息</a>&nbsp;|&nbsp;
					<a href="<%=cp%>/front/info/showPurchaseInfoList">求购信息</a>-->&nbsp;</td>
				</tr>
				<tr><td height="50%">&nbsp;</td></tr>          
			</table>
		</td>
	</tr>
</table>
<table width="950" height="27" background="<%=cp%>/image/comdo/head02.gif" align="center" cellpadding="0" cellspacing="0" bgcolor="#deebfe" style="margin-bottom:6px;">
	<tr>
		<td class="top-menu">最新消息：09.27 13:30 [重庆南方野生菌销售有限公司]注册成功。</td>  
	</tr>   
</table>

