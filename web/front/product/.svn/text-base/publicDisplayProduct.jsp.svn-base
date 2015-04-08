<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.bornsoft.asn.bean.product.Product" %>
<%@page import="com.bornsoft.asn.bean.product.SpecialProduct" %>


<%@page import="java.util.*" %> 
<%@page import="com.bornsoft.asn.utils.common.Calculator" %> 
<%@page import="com.bornsoft.asn.service.order.*" %> 
<%@page import="com.bornsoft.asn.bean.order.*" %>     

<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:0;padding:0;}
.picbox{ width:100px; height:145px;float:left;padding:0 20px 3px 22px;}	
.picbox a{width:100px; float:left;font-size:12px;}
.picbox img{padding:2px;border:1px solid #e4e4e4;}
.picbox a:link {
	color: #000000;
	text-decoration: none;
}
.picbox a:visited {
	color: #000000;
	text-decoration: none;
}
.picbox a:hover {
	color: #ff0000;
	text-decoration:underline;
}
.picbox a:active {
	color: #000000;
	text-decoration:underline;white-space:nowrap; 
}
.adiv{width: 100px; text-align: center;float:left;white-space:nowrap; overflow:hidden;text-overflow:ellipsis;padding-top:3px;}
.pricediv{width:100px;text-align: center;float:left;;padding-top:0px;}
</style>
</head>

<% String cp = request.getContextPath(); %>

<body topmargin="0" leftmargin="0" rightmargin="0" >


<% 
	List<SpecialProduct> specialProduct = (List<SpecialProduct>)request.getAttribute("specialProduct"); 
	if(specialProduct==null) specialProduct = new ArrayList();
%>
	  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	  	<tr>
	  		<td width="100%" height="100%"  valign="top">
	  		
	  		<div style="width:100%;float: left;border:0px solid #000000;"> 
	  			
	  			<%for(int i =0; i< specialProduct.size(); i++){ 
	  				SpecialProduct sp = specialProduct.get(i);	  			
	  			%>
	  			
	  			<div class="picbox">  
				     <a href="<%=cp%>/front/mall/product/displayDetailProduct.action?productId=<%=sp.getProductId() %>" target="_blank"> 
						<img src="<%=cp%><%=sp.getBigPicPath()%>.100x100" width="100" height="100" border="0">
					 </a>      
					 <a href="<%=cp%>/front/mall/product/displayDetailProduct.action?productId=<%=sp.getProductId() %>" target="_blank">
					 	<div class="adiv" ><%=sp.getName().length()>7?sp.getName().substring(0,7)+"..":sp.getName()%></div>   
					 	<div class="pricediv"><font color="#FF7300">￥<strong><%=sp.getOriginalPrice()==null?"<font color=green>面议</font>":Calculator.keepTwoDecimal(sp.getOriginalPrice())%></div>
					 </a>
  				</div>
  	
	  			<% } %>
			
				</div>
			
	  		</td>
	  	</tr>	  
      </table>	
      
       
           

</body>
</html>