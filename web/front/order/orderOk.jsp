<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="java.util.List" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<%@page import="com.bornsoft.asn.service.order.OrderService"%>
<%@page import="com.bornsoft.asn.service.member.MemberService"%>
<%@page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.*"%>
<%
String cp = request.getContextPath(); 

String template = (String)request.getAttribute("template");
String addUrla = "";
if(template!=null&&template.trim().length()>0)
	addUrla = "&template="+template;
String addUrlb = "";
if(template!=null&&template.trim().length()>0)
	addUrlb = "?template="+template;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>望龙门—农业综合服务网络平台&nbsp;|&nbsp;新农村现代经营服务网络平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta name="Copyright" content="望龙门 CopyRight 2009"/>
<meta name="keywords" content="望龙门,旺龙门,农业综合服务,新农村现代经营服务,网络平台,C2B2B,F2C2B,农业电子商务平台,网上交易市场,农民,农产品,农副产品,供求,买
卖,行情,林下经济,循环经济,网上购物,网上拍卖,网上典当,网上支付,供销合作社,农业社会化服务,新农村现代流通网络,新网工程,农民专业合作社,企业信息化,协同办公,重庆农
业."/>
<meta name="description" content="望龙门是领先的农业综合服务及新农村现代经营服务网络平台,以互联网、多媒体技术和C2B2B/F2C2B复合电子商务为手段,为三农中小客户提
供全方位的综合服务."/>
<link rel="stylesheet" rev="stylesheet" href="<%=cp%>/front/css/payment.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/css/car.css" media="screen" />
</head>
<script type="text/javascript">
	function orderDetailInfo(orderID){
		var displayState = document.getElementById("order"+orderID).style.display;
		if(displayState == "none"){
			document.getElementById("order"+orderID).style.display = "block";
		}else if(displayState == "block"){
			document.getElementById("order"+orderID).style.display = "none";
		}
	}

	function paymentConfirm(){
		if(confirm("你确定进行付款")){
		      return true;
	    }else{
			return false;	
		}
	}

</script>

<body>

<table width="974" border="0" align="center" id="paymentcss" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
		<table width="950" height="50" border="0" align="center" cellpadding="0" cellspacing="0">
	      <tr>
			<td>
			
				<div class="flow-steps">
			         <ol class="num5">
					   <li class="done">
					     <span class="first">加入购物车</span>
				       </li>
				       <li class="done current-prev">
					      <span>确认订单信息</span>
				       </li>
				       <li class="current">
					      <span>付款到银行</span>
				       </li>
					   <li>
					      <span>确认收货</span>
				       </li>
				       <li class="last">
					      <span>交易成功</span>
					   </li>
			         </ol>
		         </div>
		         
		 		</td>
		 	</tr>
		 </table>	

	      <!--  <table width="950" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
	            <tr>
	               <td width="20"></td>
				   <td width="118"><img src="<%=cp%>/front/images/payment/qrfk.jpg" width="118" height="28" /></td>
				   <td width="812"></td>
	            </tr>
	      </table>
	   -->
	  
	      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
               <td valign="top">
			   
			   
			   <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
				    <td height="28">&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				  </tr>
				  <tr>
				    <td width="30" height="22" align="right"><img src="<%=cp%>/front/images/payment/point_hui.jpg" width="14" height="14" /></td>
				    <td width="70"  style="color:#3e8b01; font-weight:bold; font-size:14px; padding-left:3px;">我的账单</td>
				    <td width="700">&nbsp;</td>
				    <td width="109" align="center" style="font-size:12px; color:#000000;">货币单位：元</td>
				  </tr>
				</table>
			<%
				Double totalMoney = 0.0;
				List<Order> list = (List<Order>)request.getAttribute("listOrder");					
				Long[] orderIds=new Long[list.size()];
				for(int i=0;i<list.size();i++){
					Order order = list.get(i);
					totalMoney += order.getPostFee().doubleValue()+order.getTotalAmount().doubleValue();
					orderIds[i]=order.getId();
				}
				
				String out_trade_no = OrderService.generateOrderBatchNumber(orderIds); //所有订单的交易号
			%>
				
               <table width="950" height="107" border="0" align="center" cellpadding="0" cellspacing="0" style="border-top:2px solid #86c81e;">
				  <tr>
				    <td height="30" colspan="2" bgcolor="#fdfbc0">&nbsp;&nbsp;请确认你的订单信息，一旦付款，保证你的交易安全</td>
				    <td colspan="4" bgcolor="#fdfbc0" align="right" class="padding_right">总金额：<span class="bold_red"><%=Calculator.keepTwoDecimal(totalMoney) %></span>元，应付金额：<span class="bold_red"><%=Calculator.keepTwoDecimal(totalMoney) %></span>元</td>
				  </tr>
				  
				  <tr>
				  	<td width="150" height="29"  class="line_hui"  align="center">交易号</td>				    
				    <td class="line_hui" align="center">商品名称</td>
				    <td width="93" class="line_hui" align="center">商品价格</td>				    
				    <td width="92" class="line_hui" align="center">邮费</td>
				    <td width="83" class="line_hui" align="center">总价</td>
				    <td width="78" class="line_hui" align="center">应付款额</td>
				  </tr>
				  
				  <% for(int i=0;i<list.size();i++){
						Order order = list.get(i);  
				  %>
					  <tr>
					    <td height="43" class="line_hui" align="center"><%=order.getId() %></td>
					    <td class="line_hui"><a href="#" onclick="orderDetailInfo('<%=order.getId()%>')"><%=order.getProductName() %></a></td>
					    <td class="line_hui" align="center"><%= Calculator.keepTwoDecimal(order.getTotalAmount().doubleValue()) %></td>
					    <td class="line_hui" align="center"><%= Calculator.keepTwoDecimal(order.getPostFee().doubleValue()) %></td>
					    <td class="line_hui" align="center"><%= Calculator.keepTwoDecimal(order.getTotalAmount().doubleValue()+order.getPostFee().doubleValue()) %></td>
					    <td class="line_hui wz_red" align="center"><%= Calculator.keepTwoDecimal(order.getTotalAmount().doubleValue()+order.getPostFee().doubleValue()) %></td>
					  </tr>				   	  
				  	  <tr>
				  	  	<td colspan="6" height="1">
				  	  	
				  	  	<table width="100%"  id="order<%=order.getId()%>" cellpadding="0" cellspacing="0" style="margin-bottom:10px;display:none;">
				  	  		<tr>
				  	  			<td width="150" height="25" align="right">商品名称  ：&nbsp;</td>
				  	  			<td>
				  	  			<% 
				  	  				List<OrderItem> listItem = OrderService.findOrderItemByOrderId(order.getId());  
				  	  				for(int m=0;m<listItem.size(); m++){
				  	  					OrderItem item2 = listItem.get(m);
				  	  			%>
				  	  			<a href="product/displayDetailProduct.action?productId=<%=item2.getItemProductId()%><%=addUrla %>" target="_blank"><%=item2.getItemProductName() %></a> 
				  	  			<% } %>
				  	  			</td>
				  	  		</tr>
				  	  		<tr>
				  	  			<td width="150" height="25" align="right">卖&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家  ：&nbsp;</td>
				  	  			<td><% 	Member msell = MemberService.getMember(order.getSupplierId()); 
				  	  					out.print(msell.getFullName()+" （"+msell.getEmail()+"）");
				  	  				%>
				  	  			</td>
				  	  		</tr>
				  	  		<tr>
				  	  			<td width="150" height="25" align="right">买&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家  ：&nbsp;</td>
				  	  			<td><% 	Member mbuy = MemberService.getMember(order.getMemberId()); 
				  	  					out.print(mbuy.getFullName()+" （"+mbuy.getEmail()+"）");
				  	  				%>
				  	  			</td>
				  	  		</tr>
				  	  		<tr>
				  	  			<td width="150" height="25" align="right">交&nbsp;&nbsp;易&nbsp;号  ：&nbsp;</td>
				  	  			<td><a href="#"><%=order.getId() %></a></td>
				  	  		</tr>
				  	  		<tr>
				  	  			<td width="150" height="25" align="right">购买时间  ：&nbsp;</td>
				  	  			<td><%=order.getCreateTime()%></td>
				  	  		</tr>
				  	  		<tr>
				  	  			<td width="150" height="25" align="right">收货地址  ：&nbsp;</td>
				  	  			<td><%=order.getCity()%> <%=order.getDetailAddress() %>，<%=order.getZipCode() %>（邮编），
				  	  			<strong><%=order.getDrawerName() %></strong>（收），<%=order.getDrawerNumber() %></td>
				  	  		</tr>
				  	  	</table>
				  	  	</td>
				  	  </tr>
				  <% 
				  	}	
				  %>
				
				</table>

               <table width="909" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:15px;border-top:1px #63A2C3 solid;">
				 <!-- 
				  <tr>
				    <td width="155" height="34" background="<%=cp%>/front/images/payment/nav1.jpg" class="wz_nav">使用网上银行付款</td>
				    <td width="127" background="<%=cp%>/front/images/payment/nav2.jpg" class="wz_nav">使用余额付款</td>
				    <td width="140" background="<%=cp%>/front/images/payment/nav3.jpg" class="wz_nav">使用充值卡付款</td>
				    <td width="380" align="right" background="<%=cp%>/front/images/payment/nav_bg.jpg" class="padding_right"><img src="<%=cp%>/front/images/payment/help.jpg" width="16" height="16" /></td>
				    <td width="102" background="<%=cp%>/front/images/payment/nav_bg.jpg"><a href="#">新手支付操作提示</a> </td>
				  </tr>
				   -->
				  <tr>
				    <td  colspan="5" class="line_lan">		
				    
				    <FORM name=alipayment action="<%=cp%>/front/order/alipayto.jsp" method=post target="_blank">
					<INPUT type="hidden" maxLength=10 size=30 name=alimoney value="<%=Calculator.keepTwoDecimal(totalMoney) %>"/>
					<INPUT type="hidden" maxLength=10 size=30 name=ncp_orderId value="<%=out_trade_no %>"/>			
					<table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
						  <tr><td height="20" colspan="2"></td></tr>
				          <tr>
					        <td width="90" height="25" align="center" style="font-size:14px;">应付总额：</td>
					        <td>&nbsp;</td>
					      </tr>
					      <tr>
					      	 <td height="25">&nbsp;</td>				      	
					        <td align="left" class="wz_ye"><span class="wz_red16"><%=Calculator.keepTwoDecimal(totalMoney) %></span>元</td>
					      </tr>					      
            		</table>		
			
					<table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
	                 <tr>
	                   <td align="center" width="90" style="font-size:14px;">支付方式：</td>
	                   <td height="25"><input type="radio" name="pay_bank" value="directPay"><img src="<%=cp%>/image/alipay/alipay_1.gif" border="0"/></td>
	                 </tr>
	                 <tr>
	                   <td>&nbsp;</td>
	                   <td height="28"><input type="radio" name="pay_bank" value="ICBCB2C" checked/><img src="<%=cp%>/image/alipay/ICBC_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="CMB"/><img src="<%=cp%>/image/alipay/CMB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="CCB"/><img src="<%=cp%>/image/alipay/CCB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="BOCB2C"><img src="<%=cp%>/image/alipay/BOC_OUT.gif" border="0"/></td>
	                 </tr>
	                 <tr>
	                   <td>&nbsp;</td>
	                   <td height="28"><input type="radio" name="pay_bank" value="ABC"/><img src="<%=cp%>/image/alipay/ABC_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="COMM"/><img src="<%=cp%>/image/alipay/COMM_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="SPDB"/><img src="<%=cp%>/image/alipay/SPDB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="GDB"><img src="<%=cp%>/image/alipay/GDB_OUT.gif" border="0"/></td>
	                 </tr>
	                 <tr>
	                   <td>&nbsp;</td>
	                   <td height="28"><input type="radio" name="pay_bank" value="CITIC"/><img src="<%=cp%>/image/alipay/CITIC_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="CEBBANK"/><img src="<%=cp%>/image/alipay/CEB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="CIB"/><img src="<%=cp%>/image/alipay/CIB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="SDB"><img src="<%=cp%>/image/alipay/SDB_OUT.gif" border="0"/></td>
	                 </tr>
	                 <tr>
	                   <td>&nbsp;</td>
	                   <td height="28"><input type="radio" name="pay_bank" value="CMBC"/><img src="<%=cp%>/image/alipay/CMBC_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="HZCBB2C"/><img src="<%=cp%>/image/alipay/HZCB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="SHBANK"/><img src="<%=cp%>/image/alipay/SHBANK_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="NBBANK "><img src="<%=cp%>/image/alipay/NBBANK_OUT.gif" border="0"/></td>
	                 </tr>
	                 <tr height="28">
	                   <td>&nbsp;</td>
	                   <td><input type="radio" name="pay_bank" value="SPABANK"/><img src="<%=cp%>/image/alipay/SPABANK_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="BJRCB"/><img src="<%=cp%>/image/alipay/BJRCB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="ICBCBTB"/><img src="<%=cp%>/image/alipay/ENV_ICBC_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="CCBBTB"/><img src="<%=cp%>/image/alipay/ENV_CCB_OUT.gif" border="0"/></td>
	                 </tr>
	                 <tr>
	                   <td>&nbsp;</td>
	                   <td height="28"><input type="radio" name="pay_bank" value="SPDBB2B"/><img src="<%=cp%>/image/alipay/ENV_SPDB_OUT.gif" border="0"/></td>
	                   <td><input type="radio" name="pay_bank" value="ABCBTB"/><img src="<%=cp%>/image/alipay/ENV_ABC_OUT.gif" border="0"/></td>
					   <td><input type="radio" name="pay_bank" value="fdb101" /><img src="<%=cp%>/image/alipay/FDB_OUT.gif" border="0" /></td>
					   <td><input type="radio" name="pay_bank" value="PSBC-DEBIT" /><img src="<%=cp%>/image/alipay/PSBC_OUT.gif" border="0" /></td>
	                 </tr>
	            </table>
			
				<table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">				
			      <tr>
			        <td height="80" colspan="2" align="center" class="wz_ye">
			        	<input value=" " class="paymentBtn" type='submit' />
			        </td>
			        </tr>
	            </table>
            </form>		
			
	</td>
    </tr>
</table>





			   </td>
            </tr>
      </table>
	
	
	</td>
  </tr>
</table>


</body>
</html>