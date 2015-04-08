<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%  String cp=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>最新加入的供应商</title>

<style type="text/css">
<!--
.silde{width: 245px;height:30px;float:left;}
#xsSupplier a:link{color:#313131;text-decoration:none;font-size:12px;}
#xsSupplier a:visited{color:#666666;text-decoration:none;font-size:12px;}
#xsSupplier a:hover{color:#FF0000;text-decoration:underline;font-size:12px;}
#xsSupplier a:active{color:#313131;text-decoration:underline;font-size:12px;}   
-->
</style>

</head> 
<body>
 
	<% 
		List list = SupplierService.newSupplier("500241");		
	%>      

	<table align="center" width="980" height="111" cellpadding="0" cellspacing="0" id="xsSupplier">
		<tr>
			<td width="100%" height="100%">
				<%
				for(int i=0; i< list.size(); i++){
					Map<String,Object> m = new HashMap<String,Object>();  
					m = (Map)list.get(i); 
				%>
				<span class="silde">
					<a href="<%=cp%>/front/shop/supplierShopSy?supplierid=<%=m.get("supplierId") %>" target="_blank">[商] <%=m.get("fullName").toString().length()>12?m.get("fullName").toString().substring(0,12)+"...":m.get("fullName") %></a>  
					<img src="<%=cp%>/image/icon_new.gif">
				</span>
				<% } %>			
			</td>
		</tr>	
	</table>

</body>
</html>