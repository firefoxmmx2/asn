<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pubsvrUrl = "http://pubsvr.aiecp.com/asn"; %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<%@page import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"%>
<%@page import="com.bornsoft.asn.service.order.OrderService" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/css/comdo.css" type="text/css" />

<style>
<!--
.orderRightLine{border-right:1px #e4e4e4 solid;}
.orderTop1{vertical-align:top;padding-top:10px;}
.orderLine22{border-bottom: 1px #e4e4e4 solid;}
-->
</style>

<table align="center" width="792" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">订单查询</td>
		</tr>      
	</table>   

<s:form  theme="simple" name="formSearch" method="post" action="queryOrderAll?searchType=page">
<table align="center" width="792" height="51" cellpadding="0" cellspacing="0" style="margin-top: 5px;">
    
	<tr>
		<td height="51">
	 	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="color_h" height="30" width="100" align="right">账&nbsp;&nbsp;号：</td>
            <td><s:textfield name="member.ssoAccount" id="ssoAccount" size="20" /></td>
            
            <td class="color_h" height="30" width="100" align="right">会员名称：</td>
            <td><s:textfield name="member.fullName" id="fullName" size="20"/></td>
		  	
            <td class="color_h" align="right" width="100">邮&nbsp;&nbsp;箱：</td>
            <td><s:textfield name="member.email" id="email" /></td>
           </tr>
           
           <tr>
            <td class="color_h" height="30" width="100" align="right">收货人电话：</td>
            <td><s:textfield name="mobileNumber" id="mobileNumber" size="20"/></td>
            
            <td class="color_h" height="30" width="100" align="right">证件编号：</td>
            <td><s:textfield name="member.certId" id="certId" size="20"/></td>		  	
           </tr>
           
           <tr>
            <td class="color_h" height="30" align="right">订单号：</td>
            <td><s:textfield name="orderId" id="orderId" size="20" /></td>  
            
            <td class="color_h" height="30" align="right">收货人名称：</td>
            <td><s:textfield name="drawerName" id="drawerName" size="20" /></td>  
            
            <td class="color_h" height="30" align="right">收货地址：</td>
            <td><s:textfield name="detailAddress" id="detailAddress" size="30" /></td>   
           </tr>         
           <tr>         
            <td align="right"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="formSearch.action='queryOrderAll?searchType=sub';formSearch.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table> 
		</td>  
	</tr>	
</table>

<% 
	String searchType =  request.getAttribute("searchType").toString(); 
	if(searchType  != null && searchType.equals("search")){
		
	}else{
%>

<table width="792" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; background: url('<%=request.getContextPath()%>/image/bg2.png') repeat-x;">
    <tr>
		<td height="31" width="80" align="center">图片</td>
		<td align="center" width="170">货品名称</td> 
		<td align="center" width="90">单价（元）</td>
		<td align="center" width="50">数量</td>
		<td align="center" width="95">收货人名称</td>
		<td align="center" width="95">卖家名称</td>
		<td align="center" width="110">应付款</td>		
		<td align="center" width="100">订单状态</td>                   
    </tr> 	
</table>

<% 
	List<Order> list = (List<Order>)request.getAttribute("orderList");
	for(int i=0; i<list.size(); i++){
		Order order = list.get(i);
%>
<table width="792" border="0" cellspacing="0" cellpadding="0" style="border: 1px #cce2ff solid;margin-top:8px;color:#333333;">
	<tr>
		<td height="28" colspan="5" style="padding:1px;"><table width="100%" height="50" bgcolor="#e8f2ff" border="0" cellspacing="0" cellpadding="0" style="padding-left:20px;">
				<tr>
					<td width="160">订单编号：<font color="#ff5600"><%=order.getId() %></font></td>
					<td width="190">下单时间：<%=new SimpleDateFormat("yyyy-MM-dd HH:ss:mm").format(order.getCreateTime()) %></td>
					<td width="180">联系电话：<%=order.getDrawerNumber() %></td>
					<td width="252">收货人地址：<%=order.getDetailAddress() %></td>
				</tr>
				<%
					Member member = MemberService.getMember(order.getMemberId());
					if(member != null){
				%>
				<tr>
					<td>会员账号：<%=member.getSsoAccount() %></td>
					<td>名称：<%=member.getFullName() %></td>
					<td>邮箱：<%=member.getEmail() %></td>					
					<td>证件编号：<%=member.getCertId() %></td>
				</tr>
				<% } %>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="orderRightLine" width="390"><table border="0" cellspacing="0" cellpadding="0">
			<% 	
				List<OrderItem> items= OrderService.findOrderItemByOrderId(order.getId());
				for(int j=0; j<items.size(); j++){ 
				OrderItem item = items.get(j);	
			%>
			<tr >
				<td height="80" width="80" class="orderLine22" align="center"><img src="<%=request.getContextPath()%><%=item.getPicPath() %>" width="60" height="60" /></td>
				<td width="170" class="orderLine22"><a target="_blank" href="<%=pubsvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=item.getItemProductId() %>"><%=item.getItemProductName()%></a></td>
				<td width="90" class="orderLine22" align="center"><%=Calculator.keepTwoDecimal(item.getProPrice()) %></td>
				<td width="50" class="orderLine22" align="center"><%=item.getQuantity() %></td>
			</tr>	
				<% } %>	  
			</table>
		</td>
		<td width="95" align="center" class="orderRightLine orderTop1"><%=order.getDrawerName()%></td>
		<td width="97" align="center" class="orderRightLine orderTop1">
			<% Member supp = MemberService.getMember(order.getSupplierId()); %>			
			<a target="_blank" href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<%=order.getSupplierId()%>">
			<%=supp.getFullName() %>
			</a>
			<br />			
			<%if(supp.getQq() != null){ %>			
			<a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%=supp.getQq()%>&Exe=QQ&Site=望龙门—农业综合服务网络平台&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=3:<%=supp.getQq()%>:3 alt="和我联系"></a>
			<% }%>
		</td>
		<td width="110" align="center" class="orderRightLine orderTop1" style="color:#ff5600; ">
			<strong><%=Calculator.keepTwoDecimal(order.getTotalAmount().doubleValue()) %></strong><br>
			<font color="#666666">（含运费：<%=Calculator.keepTwoDecimal(order.getPostFee().doubleValue()) %>）</font>
		</td>
		<td width="100" align="center" class="orderRightLine orderTop1" style="color:#ff5600; ">
			<%if(order.getOrderStatus().equals("WFK")){ %>
		                     等待买家付款
		    <%} %>
		    <%if(order.getOrderStatus().equals("YFK")){ %>
		                     等待卖家发货
		    <%} %>
		    <%if(order.getOrderStatus().equals("YFH")){ %>
		                     货已发出,请查收
	        <%} %>
	        <%if(order.getOrderStatus().equals("YGB")){ %>
	         	该订单已经被关闭
	        <%} %>
	        <%if(order.getOrderStatus().equals("JYC")){ %>
	        	 交易成功
	        <%} %>
	        <%if(order.getOrderStatus().equals("YQX")){ %>
	        	 该订单已经被取消
	        <%} %>
		</td>
	</tr>

</table>
	<% } %>
<% } %>

<table width="790" height="40" border="0" cellspacing="1" cellpadding="2" style="text-align:right;">
	<tr>
		<td><s:property value="#request.pageBar" escape="false"/></td>
	</tr>
</table>
</s:form>

