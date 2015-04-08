<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bornsoft.asn.service.order.*"%>
<%@page import="com.bornsoft.asn.bean.order.*"%>
<%@page import="java.util.*"%>
<% 
	String cp = request.getContextPath(); 
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";
	String addUrl = "";
	String template = (String)request.getAttribute("template");
	if(template!=null&&template.trim().length()>0)
		addUrl = "&template="+template;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>最新订单</title>
<style type="text/css">
.newOrderAreaCode a:link{font-size: 12px;text-decoration:none; color: #666666;}
.newOrderAreaCode a:visited{font-size: 12px;text-decoration:none; color: #666666;}
.newOrderAreaCode a:hover{font-size: 12px;text-decoration: underline; color: #FF0000;}
</style>
</head>
<body topmargin="0px;">
		<%
			List<Order> orList=(List<Order>)request.getAttribute("orderList"); 
			int count = 5;
			if(orList.size() < 5 ){count = orList.size();}
		%>
				<!--***************************最新订单开始*****************************-->
				<table width="185" align="center" border="0" cellspacing="0" cellpadding="0" class="newOrderAreaCode">					
					<tr>
						<td valign="top" class="border_bule">
						
						
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							
							<%for(int j = 0; j < count; j++ ){%>
							<%List<OrderItem> items= OrderService.findOrderItemByOrderId(orList.get(j).getId()); %>
							<tr>
								<td class="square" height="25"><a target="_blank"
									href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=items.get(0).getItemProductId() %><%=addUrl %>">****购买了<%=items.get(0).getItemProductName().length()>7?items.get(0).getItemProductName().substring(0,7)+"...":items.get(0).getItemProductName()%></a></td>
							</tr>
							<% } %>
						</table>
						
						
						</td>
					</tr>
				</table>


</body>
</html>