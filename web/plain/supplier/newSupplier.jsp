<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%  String cp=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>最新加入的供应商</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/newsupplier.js"></script>
<link href="<%=cp%>/css/index-newsupplier.css" type="text/css" rel="stylesheet" rev="stylesheet" >
</head>    
<body> 

	<% 
		List list = SupplierService.newSupplier();
		int col = list.size()/8;		
	%>

	<div id="page-wrap">	
		
		<div id="slider">

			<div id="mover">
				<%for(int n = 0; n < col; n++){ %>
				<div <%=n==0?"id='slide-1'":"" %> class="slide" style="width:960px;">
					<p>
					<% 
						for(int i=8*n; i< 8*(n+1); i++){
							Map<String,Object> m = new HashMap<String,Object>();  
							m = (Map)list.get(i);        
					%>        
					<span><a href="<%=cp%>/front/shop/supplierShopSy?supplierid=<%=m.get("supplierId") %>" target="_blank">[商] <%=m.get("fullName").toString().length()>12?m.get("fullName").toString().substring(0,12)+"...":m.get("fullName") %></a>  <img src="<%=cp%>/image/icon_new.gif"></span>
					
					<%	} %>     
					</p>
				</div>			 
				<%} %>  
				
			</div>
		
		</div>
	</div>

</body>
</html>