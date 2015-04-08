<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"%>
<%
	String topCp=request.getContextPath();
	String memberName=MemberService.getMemberShortName(session);
%>
<link href="<%=topCp%>/top_files/inside.css" rel="stylesheet" type="text/css">
<table width="974" align="center" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0">
<tr><td>
<table width="950" align="center" bgcolor="#ffffff" border="0" 
cellpadding="0" cellspacing="0" height="137">
       <tbody><tr>
	       
    <td colspan="2" class="tex12_huise" valign="top" 
background="<%=topCp%>/top_files/line_31.jpg" height="31"><a 
href="http://www.aiecp.com/aiecp/72057594037927936/index.html">首页</a>
 
       | <a 
href="<%=topCp%>/front/cate0">产品</a>|
 
      <a href="<%=topCp%>/front/supplier/searchSupplier">供应商</a> | 
      <a href="<%=topCp%>/front/info/showSupplyInfoList" >供应信息</a> |
       <a href="<%=topCp%>/front/info/showPurchaseInfoList" >求购信息</a> |
       <a href="<%=topCp%>/front/quotation/QuotationList">行情</a>
  
<%if(memberName.equals("")){%>
	<a href="<%=topCp%>/do">会员中心(登录)</a> 
<%} else{%>
	<a href="<%=topCp%>/do">会员中心(<%=memberName%>)</a>
	 | <a href="<%=topCp%>/logout">注销</a>
<%}%> | <a href="javascript:void(bcart.showCart());">查看购物车</a>
	 | <a href="#anchorHelp">使用帮助</a>
	 </td>
	   </tr>
	   <tr>
	       <td colspan="2" valign="top" height="13"></td>
	   </tr>
	   <tr>
	       <td valign="top" width="224" height="80"><img 
src="<%=topCp%>/top_files/logo_80.jpg" width="223" height="80"></td>
    <td valign="top" width="726" height="80"><object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="726" height="80">
      <param name="movie" value="<%=topCp%>/top_files/w726.swf" />
      <param name="quality" value="high" />
      <param name="wmode" value="opaque" />
      <param name="swfversion" value="8.0.35.0" />
      <!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don’t want users to see the prompt. -->
      <param name="expressinstall" value="../Scripts/expressInstall.swf" />
      <!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="<%=topCp%>/top_files/w726.swf" width="726" height="80">
        <!--<![endif]-->
        <param name="quality" value="high" />
        <param name="wmode" value="opaque" />
        <param name="swfversion" value="8.0.35.0" />
        <param name="expressinstall" value="<%=topCp%>/Scripts/expressInstall.swf" />
        <!--[if !IE]>-->
      </object>
      <!--<![endif]-->
    </object></td>
	   </tr>
	   
  </tbody></table>
  </td></tr></table>  
<script type="text/javascript" src="<%=topCp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=topCp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=topCp%>/js/bcart/bcart.js"></script>