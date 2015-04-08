<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String cp = request.getContextPath(); %> 
<%@ page import="java.util.List" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<%@page import="com.bornsoft.asn.bean.ship.Delivery" %>

<link href="<%=cp%>/do/order/css/order.css" type=text/css rel=stylesheet />

<% 
	Order order = (Order)request.getAttribute("order"); 
	List<OrderItem> orderItem = (List<OrderItem>)request.getAttribute("orderItem"); 
	Delivery delivery = (Delivery)request.getAttribute("delivery");
%>

<table width="792" border="0" cellspacing="0" cellpadding="0" height="55" align="center" class="line_lu">
  <tr>
    <td width="50" align="center"><img src="<%=cp%>/image/gou.jpg" width="32" height="32" /></td>
	<td align="left">恭喜您，操作成功</td>
  </tr>
</table>

<table width="792" border="0" cellspacing="0" cellpadding="0" height="160" align="center" class="line_hui">
  <tr>
    <td valign="top"><table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td height="40" colspan="2" class="wz14"><strong>物流信息</strong></td>
        </tr>
      <tr>
        <td width="9%" height="30">物流方式:</td>
        <td width="91%">
        	<%=delivery.getLogisticsId()==1?"中国邮政":delivery.getLogisticsId()==2?"申通快递":delivery.getLogisticsId()==3?"圆通速递":delivery.getLogisticsId()==4?"中通速递":"其它" %>        
        </td>
      </tr>
      <tr>
        <td height="25">物流编号:</td>
        <td><%=delivery.getDeliveryId()%></td>
      </tr>
      <tr>
        <td height="30">下单信息:</td>
        <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getCreateTime()) %> 订单创建</td>
      </tr>
	  <tr>
        <td height="20">&nbsp;</td>
        <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(delivery.getLogisticsTime()) %> 发货完成</td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="792" border="0" cellspacing="0" cellpadding="0" height="160" align="center" class="line_hui2">
  <tr>
    <td valign="top"><table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td height="40" colspan="2" class="wz14"><strong>交易订单详情</strong></td>
        </tr>
		<tr>
        <td height="20" colspan="2"></td>
        </tr>
      <tr>
        <td height="40" colspan="2" >
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;margin-bottom:15px;border:1px #bababa solid;">
         <tr>
				<td height="35" class="step-line st-order">
					订单编号：<%=order.getId()%> &nbsp;&nbsp;
					创建时间：<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getCreateTime()) %>
				</td>
			</tr>
          
          <tr>
				<td><table cellpadding="0" cellspacing="0">
						<tr>
							<td width="60%"><table width="100%" id="ship_product" cellpadding="0" cellspacing="0">
									<%
										for(int i=0;i<orderItem.size();i++){
											OrderItem item = orderItem.get(i);
									%>
									<tr>
										<td height="85" width="70" align="center" class="step-line">
											<img alt="<%=item.getItemProductName()%>" src="<%=cp%>/<%=item.getPicPath()%>" width="50" height="50">
										</td>
										<td width="300" class="step-line"><a href=""><%=item.getItemProductName() %></a></td>
										<td width="120" class="step-line"><%=Calculator.keepTwoDecimal(item.getProPrice()) %> x <%=item.getQuantity() %></td>
									</tr>	
									<%} %>								
								</table>	
							</td>
							<td width="40%" class="step-line" valign="top"><table width="100%" cellpadding="0" cellspacing="0" style="padding-left:10px;">
									<tr>
										<td valign="top" width="65">买家留言：</td>
										<td><%=order.getSpecialExplain()==null?"无":order.getSpecialExplain() %></td>
									</tr>
								</table>
							</td>
						</tr>					
						
					</table>
				</td>
			</tr>           
        </table>
		
		
		</td>
        </tr>
    </table></td>
  </tr>
</table>
