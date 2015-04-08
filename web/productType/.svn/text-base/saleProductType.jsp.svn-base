<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType" %>     

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>前台产品分类列表</title>
<script type="text/javascript">
	function onselProductType(val,code,show,typeName){
	   // window.open="saleProductInfo.action?code="+code;
	    window.open("saleProductInfo.action","_self","");
	}

</script>
</head>
<style type="text/css">
<!--
body{ font-size:12px;}
a:link { color:#0066CC; text-decoration: none} 
a:visited { color:#0066CC; text-decoration: none} 
a:hover { color: #800080; background-color:#FF9900; text-decoration: underline} 
a:active { color: #800080; text-decoration: underline} 
a { display: inline-block; padding-left:5px; padding-right:5px; padding-top:2px;}  
.tds{ width:70px; padding-top:3px;}
-->
</style>
<body>
<table width="100%" cellpadding="0" cellspacing="0">
	<%
		for(ProductType item:(List<ProductType>)request.getAttribute("firstType")) {
	%>	
		
	<tr>
		<td width="100%" height="25" bgcolor="#F5F5F5" style="color:#FF9900;">
			<STRONG><%=item.getPttypeName() %></STRONG>
		</td>
	</tr>
	
	<tr>	
		<td><table width="100%" cellpadding="0" cellspacing="0">
			<%
				for(ProductType item1:(List<ProductType>)request.getAttribute("secondType")) {
					if(item1.getPtparentid() == item.getPtid()){
			%>	  
		
			<tr style="padding-top:3px;">
				<td valign="top" class="tds"><strong><%=item1.getPttypeName() %>:</strong></td>
				<td width="540">
				<%
					for(ProductType item2:(List<ProductType>)request.getAttribute("thridType")) {
						if(item2.getPtparentid() == item1.getPtid()){
				%>				
					<a href="javascript:" onclick="javascript:onselProductType('<%=item.getPttypeName() %>-<%=item1.getPttypeName() %>-<%=item2.getPttypeName() %>','<%=item2.getPtcode() %>','<%=request.getParameter("show") %>','<%=item2.getPttypeName() %>')">	<%=item2.getPttypeName() %></a>
				<% 
						}
					}
				%>																
				</td>
			</tr>
			<% 
						}
					}
			%>			
		</table></td>		
	</tr>	
	
	<% 
		}
	%>	
	
</table>

</body>
</html>
