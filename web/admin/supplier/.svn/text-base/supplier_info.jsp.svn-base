<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.bean.supplier.*" %>
<%@ page import="com.bornsoft.asn.bean.member.*" %>
<%@ page import="com.bornsoft.asn.bean.bank.*" %>
<%@ page import="com.bornsoft.asn.bean.license.*" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="com.bornsoft.asn.utils.common.Str"%>
<%@ page import="java.util.List" %>
<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>供应商详细信息</title>
</head>
<body>
	<%
	Supplier s = (Supplier)request.getAttribute("supplier");
	Member m = (Member)request.getAttribute("member");
	BankInfo b = (BankInfo)request.getAttribute("bankinfo");
	List list = (List)request.getAttribute("querylist");
	%>

		  <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>供应商状态信息</strong></td>	
				<td width="50">[<a href="javascript:history.go(-1);">返 回</a>]</td>	
			</tr>
		  </table>
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="margin:10px 0; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right">审核状态：</td>
	            <td style="color: #FF0000;">&nbsp;<strong><%=s.getApproveState()==AsnConstLib.SupplierApproveState.Rejected?"审核未通过":s.getApproveState()==AsnConstLib.SupplierApproveState.Completed?"审核完成":s.getApproveState()==AsnConstLib.SupplierApproveState.ManualVerify?"相关人员审核":"未知" %></strong></td>
	            <td height="40" width="90" align="right">运营状态：</td>
	            <td style="color: #FF0000;">&nbsp;<strong><%=s.getRunState()==AsnConstLib.SupplierRunState.Opening?"正在营业":s.getRunState()==AsnConstLib.SupplierRunState.Suspend?"暂停营业":s.getRunState()==AsnConstLib.SupplierRunState.Closed?"清算退出":"未知" %></strong></td>
	            <td height="40" width="90" align="right">锁定状态：</td>
	            <td style="color: #FF0000;">&nbsp;<strong><%=s.getLocked()=="Locked"?"冻结":"<font color=blue>自由</font>" %></strong></td>          	
			</tr>
		  </table>
		
          <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="margin-bottom:10px;background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="785"><strong>供应商基本信息</strong></td>						
			</tr>
		  </table>
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right">供应商名称：</td>
	            <td>&nbsp;<strong><%=m.getFullName() %></strong></td>          	
			</tr>	
			<tr>
				<td height="40" align="right">供应商类型：</td>
	            <td>&nbsp;<%=s.getSupplierType().equals("1")?"单位":"个人" %></td>          	
			</tr>
			<%if(s.getSupplierType().equals("2")){ %>
			<tr>
				<td height="40" align="right">担 保 人：</td>
	            <td>&nbsp;<%=request.getAttribute("voucherkey")==null?"无担保人":request.getAttribute("voucherkey") %>
	            	&nbsp;&nbsp;&nbsp;&nbsp;
	            	<%if(request.getAttribute("voucherkey")!=null){ %>
	            	[<font color="red"><strong><%=s.getVouchState()==AsnConstLib.VouchState.Agree?"同意担保":s.getVouchState()==AsnConstLib.VouchState.Disagree?"拒绝担保":"未查看" %></strong></font>]
	            	<% } %>
	            </td>          	
			</tr>
			<% } %>
			<tr>
				<td height="40" align="right">供应种类：</td>
	            <td>&nbsp;<%=Str.get(s.getProductType()) %></td>          	
			</tr>	
			<tr>
				<td height="80" align="right">经营范围：</td>
	            <td>&nbsp;<%=Str.get(s.getBizDomain()) %></td>          	
			</tr>
			<tr>
				<td height="40" align="right">网          店：</td>
	            <td>&nbsp;<%=Str.get(s.getStoreName()) %></td>          	
			</tr>				
		  </table>
		  
		  
		   <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="margin:10px 0;background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>银行信息</strong></td>	
			</tr>
		  </table>
		
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right">银行名称：</td>
	            <td>&nbsp;<%=Str.get(b.getBankName()) %></td>          	
			</tr>
			<tr>
				<td height="40" align="right">银行账户：</td>
	            <td>&nbsp;<%=Str.get(b.getAccount()) %></td>          	
			</tr>
			<tr>
				<td height="40" align="right">开户人名称：</td>
	            <td>&nbsp;<%=Str.get(b.getOwnerName()) %></td>          	
			</tr>	
		  </table>
		  
		  <%if(s.getSupplierType().equals("1")){ %>
		  <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="margin-top:10px;background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>证件信息</strong></td>	
			</tr>
		  </table>
			
		  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:10px 0;" class="table_border">
                <tr>
                   		<td height="28" align="center" bgcolor="#e8f5fb">证件名称</td>
						<td align="center" bgcolor="#e8f5fb">许可单位</td>
						<td align="center" bgcolor="#e8f5fb">编号</td>
						<td align="center" bgcolor="#e8f5fb">扫描件</td>	
                </tr>
                <%
                	for(int i=0; i<list.size(); i++){ 
                	License l = (License)list.get(i);
                %>
				<tr>
					<td height="60"><%=l.getSerial() %></td>
					<td><%=l.getAuthority() %></td>
					<td><%=l.getTitle() %></td>
					<td align="center">
						<a href="/asn/pic/member/supplier_<%=l.getLicenseid() %>.jpg" target="_blank">
						<img src='<%=cp %>/pic/member/sml_supplier_<%=l.getLicenseid() %>.jpg' width='50' height='50'>
						</a>
					</td>	
				</tr>
				<% } %>
		  </table>
		  
		  <% } %>
		  
		  <%if(s.getSupplierType().equals("1")){ %>
		  <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>企业信息</strong></td>	
			</tr>
		  </table>
		  
		  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:10px 0; padding:5px; line-height:150%; border:1px #cccccc solid; color:#666666;" >
		  	<tr>
		  		<td><%=Str.get(s.getIntroduction()) %></td>
		  	</tr>
		  </table>
		  <% } %>
</body>
</html>