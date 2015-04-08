<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>      
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>担保审核 | 中心审核</title>
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
			String strState = supplierservice.getSupplier(MemberService.getMemberId(session)).getVouchState().toString(); 
		%>
			
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr><td height="4px" ></td></tr>
		<tr><td class="daohang" width="98%" height="30">供应商申请与审批流程</td></tr>
		<tr><td height="4px" ></td></tr>
		</table>
		
			<table width="760" class="tbl" height="23" align="center" cellpadding="0" cellspacing="0"  style="margin-top:10px;">
				<tr align="center">				
					<td class="pbgray1"><span class="spw">1. 阅读规定</span>	<span class="spyello">&nbsp;</span></td>
					<td class="pbyello1"><span class="spw">2. 填报资料</span><span class="spgray">&nbsp;</span></td>
					<td class="pbg1"><span class="spw">3. 相关人员审核</span><span class="spg">&nbsp;</span></td>				
					<td class="pbgray"><span class="spw">4. 完成</span><span class="spgrayend">&nbsp;</span>	</td>
				</tr>				
			</table>        	
            
            <table width="680" border="0" align="center" cellpadding="10" cellspacing="0" style="margin-top:20px;border:1px #6cbc48 solid;font-size:16px;">
              <tr>
                <td align="center">
                	<% if(strState.equals("None")){
                	%>
                		<p><img src="../../image/wait.gif">　</p>
                		<p><strong>请等待担保企业的审核，如果长时间没有回应，请主动与担保企业联系。</strong></p>
                	<%
                	}else if(strState.equals("Disagree")){ %>
	                	<p><img src="../../image/sorry.gif">　</p>
	                	<p><strong>很抱歉，担保企业拒绝了你的担保请求，请主动与担保企业联系。</strong></p>
                	<%} %>
                  </td>
              </tr>
            </table>
        

</body>
</html>