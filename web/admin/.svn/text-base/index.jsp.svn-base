<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.supplier.*" %>
<%@ page import="com.bornsoft.asn.service.member.*" %>
<%@ page import="com.bornsoft.asn.service.product.*" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib"%>
<%@ page import="java.util.*" %>
<meta http-equiv="Refresh" content="60"> <!-- 页面自动刷新 -->
<% String cp = request.getContextPath(); %>
<style type="text/css">
.wel{font-size:12px;border:1px solid #ffc383; line-height:150%;}
.wel_td{font-size:14px; font-weight:bold; color:#000000}
.aum_td{border-bottom:1px solid #DBECFD}
.aum_td span{font-weight:bold; color:#FF0000;}
.do_td{font-size:12px;border:1px solid #ffc383; line-height:150%;}
.con_td{font-weight:bold; font-size:12px; color:#0066FF}
.con_td a:link{text-decoration:underline;color:#FF0000;}
.con_td a:visited{text-decoration:underline;color:#FF0000;}
.con_td a:hover{text-decoration:underline;color:#336699;}
</style>
	
	<% 
		Map<String, Object> para=new HashMap<String, Object>();		
	%>

	<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">   
	<tr>                       
		<td height="51" class="wel">
	 	 <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
         <td height="39" class="wel_td">欢迎来到管理中心！</td>
		 <td style="color:#999999; font-size:12px;">本页统计信息每分钟自动刷新一次。</td>
   </tr>
   
   <tr>
       <td height="28" colspan="2" class="aum_td">&nbsp;会员总数：<span><%=MemberService.getMemberCount(para) %></span> 个</td>
	   </tr>
   <tr>
       <td height="28" colspan="2" class="aum_td">&nbsp;供 应 商：<span><%=SupplierService.getSupplierCount(para) %></span> 家</td>
	   </tr>
   <tr>
       <td height="28" colspan="2" class="aum_td">&nbsp;商品总数：<span><%=ProductService.getAllProductCount(null,null,null,null,null,null,null) %></span> 件</td>
	   </tr>
	   
   <tr><td colspan="2" height="20"></td></tr>             
   
   <%para.put("approveState",AsnConstLib.SupplierApproveState.ManualVerify); %>
   <tr><td colspan="2" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="35" class="do_td">
     <tr>
       <td width="70">&nbsp;代办事项：</td>          
	   <td class="con_td" align="left">有 <a href="<%=cp%>/admin/member/listMemberByParam?pageType=sub&approveState=<%=AsnConstLib.SupplierApproveState.ManualVerify%>"><%=MemberService.getMemberCount(para) %></a> 个新会员等待审批</td>
	   <td class="con_td" align="left">有 <a href="<%=cp%>/admin/supplier/listSupplier?pageType=sub&approveState=<%=AsnConstLib.SupplierApproveState.ManualVerify%>"><%=SupplierService.getSupplierCount(para) %></a> 个新供应商等待审批</td>
     </tr>
   </table></td></tr>
   
   <tr><td colspan="2" height="20"></td></tr>
        </table>		</td>
	</tr>
</table>

