<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>      
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中心审核</title>
<LINK href="../../css/regProcess.css" type=text/css rel=stylesheet> 
<style type="text/css">
<!--
body{font-size:12px; font-family:"宋体";}
#form1 {
	text-align: center;
}
.section_title {
	font-size: 18px;
}
-->
</style>

</head>
<body>

		<% 
			SupplierService supplierservice = new SupplierService();
			String strState = String.valueOf(supplierservice.getSupplier(MemberService.getMemberId(session)).getApproveState()); 
		%>
		
		
		
        <%if(strState == "ManualVerify"){ %>
            <table width="680" border="0" align="center" cellpadding="10" cellspacing="0" style="margin-top:20px;border:1px #6cbc48 solid;font-size:16px;">
              <tr>
                <td align="center"><p><img src="../../image/wait.gif">　</p>
                	<p><strong>供应商服务网络管理中心尚未审核通过您的开通申请，请稍候。</strong></p>
                  </td>
              </tr>
            </table>
            
        <%}else if(strState == "Completed"){ %>        
			
            <table width="680" border="0" align="center" cellpadding="10" cellspacing="0"style="margin-top:20px;border:1px #6cbc48 solid;font-size:16px;">
              <tr>
                <td align="center"><p>[祝贺图片]　</p>
                	<p><strong>祝贺您，您申请的供应商服务已经开通！</strong></p>
                	<p>【<a href="/asn/do">现在进入商务会员中心</a>】</p>
                  </td>
              </tr>
            </table>
            
       <%}else if(strState == "Rejected"){ %>        
			
            <table width="680" border="0" align="center" cellpadding="10" cellspacing="0"style="margin-top:20px;border:1px #6cbc48 solid;font-size:16px; ">
              <tr>
                <td align="center"><p><img src="../../image/sorry.gif">　</p>
                	<p><strong>管理中心拒绝了你的供应商资料！</strong></p>
                	<p><strong>请<a href="updateSupplier">修改后重新提交</a>，若有疑问与中心联系。</strong></p>
                  </td>
              </tr>
            </table>
       <%} %>
           

</body>
</html>