<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.bornsoft.asn.service.member.MemberService" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="com.bornsoft.asn.bean.member.Member" %>
<%@page import="com.bornsoft.asn.service.order.OrderService" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator"%>
<%@page import="com.bornsoft.asn.utils.common.NavigatorUtils" %>
<%@page import="com.bornsoft.asn.bean.ship.Delivery" %>
<%@page import="java.text.SimpleDateFormat" %>

<%
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";
  	Order info=(Order)request.getAttribute("order");
  	Member member=  MemberService.getMember(info.getMemberId());
  	
  	String addUrl = "";
  	String webTemplate = NavigatorUtils.getNavigatorName((String)session.getAttribute("mainSite"));
  	if(webTemplate!=null&&webTemplate.trim().length()>0)
  		addUrl="&template="+webTemplate;
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>订单信息(买家)</TITLE>
	<LINK href="<%=request.getContextPath()%>/do/order/css/orderdetail.css" type=text/css rel=stylesheet>
	<META http-equiv=Content-Type content="text/html; charset=UTF-8">
	<META http-equiv=X-UA-Compatible content=IE=7>
	<META content= name=description>
	<META name=keywords>
	<META content="MSHTML 6.00.2900.3676" name=GENERATOR>
</HEAD>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=10 marginwidth="0" marginheight="0">
<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
	<tr>
		<td width="55" align="center"><img src="<%=request.getContextPath() %>/image/comdo/pen.png"></td>
		<td width="500">
		交易管理（订单详情）
		</td>
		<td width="237" align="right"><a href="javascript:history.go(-1);">返回</a>&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
	
<DIV class=w952 id=doc style="width:792px;"> 
<DIV id=bd>
<!--等待买家付款-->

<DIV id=message>
   <DIV class=m  style="color:#404040;">当前订单状态&nbsp;：
	   <SPAN class=orange>
	   		<s:if test="order.orderStatus=='JYC'">交易成功 </s:if>
            <s:if test="order.orderStatus=='YFH'">已发货</s:if>
            <s:if test="order.orderStatus=='YFK'">已付款 </s:if>
            <s:if test="order.orderStatus=='YQX'">顾客取消  </s:if>
            <s:if test="order.orderStatus=='YGB'">卖家关闭         </s:if>  
            <s:if test="order.orderStatus=='WFK'">未付款,等待买家付款   </s:if>
	   </SPAN>     
   </DIV> 
   <div class="m" style="border-top: 1px #e9e9e9 solid;margin-top:10px;">
   		<table style="color:#404040;"> 
   			<tr>
   				<td height="25"><font color="#FF6600"><strong>平台提醒您</strong></font></td>
   			</tr>
   			<tr>
   				<td height="20">1、交易已成功，如果你还未收到货物，或者收到的货物无法正常使用，请及时联系卖家协商处理。</td>
   			</tr>
   			<tr>
   				<td height="20">2、如果卖家没有解决你的上述问题，你可以在交易成功后的15天内发起售后维权，要求平台客服介入处理。</td>
   			</tr>	
   		</table>
   </div>
</DIV>

<DIV id=tabPanel>
	<UL class=tab>
	  <LI class=current>
	      <A href="#">订单信息</A>
	  </LI>
	</UL>
    <DIV class=tab-context>
    
    	<DIV class=box>          
	        <H4><font color="#404040">买家信息</font></H4>
	           <TABLE><!--  class=seller -->
	               <TBODY>
	                   <TR class=first>
	                      <td>买家名称：<A href="<%=request.getContextPath()%>/front/shop/supplierShopSy?supplierid=<%=member.getMemberId()%>" target="_blank" ><%=member.getFullName() %></A>
	                         <IMG alt="诚信通会员" src="<%=request.getContextPath()%>/do/order/css/trust.gif">
	                      </TD>
	                      <td>联系人：<%=member.getContactor()==null?"暂无":member.getContactor() %></TD>
	                      <td>城市：<%=member.getArea()==null?"暂无":member.getArea().substring(member.getArea().indexOf("|")+1,member.getArea().length()) %></TD>
	                  </TR>
	                  <TR class=first>
		                  <td>电子邮箱：<%=member.getEmail()==null?"暂无":member.getEmail() %> </TD>
		                  <td>手机：<%=member.getMobilePhone()==null?"暂无":member.getMobilePhone() %></TD>
		                  <td>电话：<%=member.getFixedPhone()==null?"暂无":member.getFixedPhone() %></TD>
	                  </TR>	                 
	              </TBODY>
	          </TABLE>
	       </div> 
    
    	 <DIV class=split></DIV> 
         <div class=box>
         	<H4><font color="#404040">订单信息</font></H4>
         		<table>
         		<TBODY>
	                   <TR class=first>
	                      <td> 订单号：<s:property value="order.id"/></TD>
	                      <td>下单时间：<s:date name="order.createTime" format="yyyy-MM-dd HH:mm:ss" /> </TD>
	                  </TR>	                                
	            </TBODY>
         		</table>
         		
         	<!-- 	
                                       订单号：<s:property value="order.id"/>  
               <font color="red">         
               <s:if test="order.orderStatus=='JYC'">
                                             （交易成功）
               </s:if>
               <s:if test="order.orderStatus=='YFH'">
                                             （已发货）
               </s:if>
               <s:if test="order.orderStatus=='YFK'">
                                             （已付款）
               </s:if>
               <s:if test="order.orderStatus=='YQX'">
                                             （顾客取消）
               </s:if>
               <s:if test="order.orderStatus=='YGB'">
                                             （卖家关闭）
               </s:if>  
               <s:if test="order.orderStatus=='WFK'">
                                             （未付款,等待买家付款）
               </s:if>
               </font>	 
               <br>
                                        下单时间：<s:date name="order.createTime" format="yyyy-MM-dd HH:mm:ss" /> 
               <br>
               <s:if test="order.orderStatus=='JYC'">
                                             成功交易时间：<s:date name="order.operatorTime" format="yyyy-MM-dd HH:mm:ss" /> 
               </s:if>
               <s:if test="order.orderStatus=='YFH'">
                                              发货时间：<s:date name="order.operatorTime" format="yyyy-MM-dd HH:mm:ss" /> 
               </s:if>
               <s:if test="order.orderStatus=='YFk'">
                                             付款时间：<s:date name="order.operatorTime" format="yyyy-MM-dd HH:mm:ss" /> 
               </s:if>
               <s:if test="order.orderStatus=='YQX'">
                                             顾客取消时间：<s:date name="order.operatorTime" format="yyyy-MM-dd HH:mm:ss" /> 
               </s:if>
               <s:if test="order.orderStatus=='YGB'">
                                             卖家关闭时间：<s:date name="order.operatorTime" format="yyyy-MM-dd HH:mm:ss" /> 
               </s:if> 
                -->                         
           </div>
           
	       
	      <DIV class=deal-wrap>
	        <TABLE class=deal>
	               <TBODY>
					  <TR>
					    <TH class=col1>图片</TH>
					    <TH class=col2>货品</TH> 
					    <TH class=col3>单价(元)</TH>
					    <TH class=col4>数量</TH>
					    <TH class=col5>货品总价(元)</TH>
					    <TH class=col6>运费(元)</TH>
					    <TH class=col7>涨价或折扣(元)</TH>
					  </TR>
					  <TR>
					     <TD colSpan=4>
						      <TABLE>
						        <TBODY>
						          <%List<OrderItem> items= OrderService.findOrderItemByOrderId(info.getId()); %>
						           <%Double val=new Double(0); %>
								   <%for(int i=0;i<items.size();i++) { %>
								   <%val+=(items.get(i).getProPrice()*items.get(i).getQuantity());%>
							        <TR>
							          <TD class=col1>
							             <A href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=items.get(i).getItemProductId() %><%=addUrl %>" target="_blank">
							                <IMG alt="" src="<%=request.getContextPath()%>/<%=items.get(i).getPicPath()%>" width="80" height="80" >
							             </A>
							          </TD>
							          <TD class=col2>
							              <A href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=items.get(i).getItemProductId() %><%=addUrl %>" target="_blank"><%=items.get(i).getItemProductName() %></A>
							          </TD> 
							          <TD class=col3>
							              <DIV title='<%=items.get(i).getProPrice()%>'><%=Calculator.keepTwoDecimal(items.get(i).getProPrice()) %></DIV>
							          </TD>
							          <TD class=col4>
							              <DIV title='<%=items.get(i).getQuantity() %>'><%=items.get(i).getQuantity() %></DIV>
							          </TD>
							        </TR>
							        <%} %>
							    </TBODY>
							  </TABLE>
						 </TD>
					     <TD class=col5 style="border-left:1px #e4e4e4 solid; "><%=Calculator.keepTwoDecimal(val) %></TD>
					     <TD class=col6 style="border-left:1px #e4e4e4 solid; "><%=Calculator.keepTwoDecimal(info.getPostFee().doubleValue()) %></TD>
					     <TD class=col7 style="border-left:1px #e4e4e4 solid; ">0.00</TD>
					  </TR>
			    </TBODY>
			</TABLE>
	    </DIV>
	    <DIV class=total>实付款：<SPAN class="orange bold"><%=Calculator.keepTwoDecimal(info.getTotalAmount().doubleValue()) %></SPAN>元</DIV>
		<DIV class=split></DIV>
		<DIV class=box>
			<H4><font color="#404040">买家留言</font></H4>
			<P>
				<s:if test="order.specialExplain == null">买家没任何留言。</s:if>
				<s:else><s:property value="order.specialExplain"/></s:else>
			</P>
	    </DIV>
	    <!-- 
		<DIV class=split></DIV>
		<DIV class=box>
			<H3>更新时间</H3>
			<TABLE>
			  <TBODY>
				  <TR>
				    <TH>订单编号：</TH>
				    <TD><s:property value="order.id"/></TD>
				  </TR>
				  <TR>
				    <TH>下单时间：</TH>
				    <TD><s:date name="order.createTime" format="yyyy-MM-dd HH:mm:ss" /></TD>
				 </TR>
			 </TBODY>
			</TABLE>
		</DIV>
		 -->
	    <DIV class=split></DIV>
	    <DIV class=box>
	    	<H4 style="height:25px;"><font color="#404040">物流信息</font></H4>
			<TABLE>
			  <TBODY>
				  <TR>
				    <TH>收货地址：</TH>
				    <TD>
				        &nbsp;<s:property value="order.drawerName"/>，&nbsp;<s:property value="order.drawerNumber"/>，&nbsp;<s:property value="order.detailAddress"/>
				    </TD>
				  </TR>
				  <%
						Delivery delivery = (Delivery)request.getAttribute("delivery");
						if(delivery != null){
				  %>
				  <TR>
				    <TH>物流方式：</TH>
				    <TD>
				        &nbsp;<%=delivery.getLogistics().getLogiName()%>&nbsp;&nbsp;
				        	  <a href="<%=delivery.getLogistics().getQuerySite() %>" target="_blank">物流查询</a>  （根据 物流编号 进行查询）
				    </TD>
				  </TR>	
				  <TR>
				    <TH>物流编号：</TH>
				    <TD>
				        &nbsp;<%=delivery.getDeliveryId()%>
				    </TD>
				  </TR>
				  <TR>
				    <TH>发货时间：</TH>
				    <TD>
				        &nbsp;<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(delivery.getLogisticsTime()) %>
				    </TD>
				  </TR>					  
				  <% } %>	
				  
			  </TBODY>
			</TABLE>
	    </DIV>	    
	    
   </DIV>
 
</DIV>
</DIV>
</DIV>
</BODY>
</HTML>
