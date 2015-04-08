<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"%>
<%@page import="com.bornsoft.asn.service.order.OrderService" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>

<%String rootPath=request.getContextPath(); %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
		<TITLE>我买的商品</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<LINK href="<%=request.getContextPath()%>/front/order/css/al-calender.css" type=text/css rel=stylesheet>
		<!-- 
		<script src="<%=rootPath%>/common/changedate.jsp" language="javascript"></script>
		 -->
		<link type="text/css" href="<%=request.getContextPath()%>/css/jquilib/themes/base/jquery.ui.all.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
	</HEAD>
	<script type="text/javascript">
	   function cancelOrder(id,str){
                 if(str=="YQX"){
       	            if(confirm("你确定要取消该订单"))
       			       window.location.href="changeOrderStatus.action?orderId="+id+"&orderStatus="+str;
    			       
                 } if(str=="YFK"){
	    	   if(confirm("你确定要对该订单进行付款"))
   			       window.location.href="changeOrderStatus.action?orderId="+id+"&orderStatus="+str;
		       }
                 if(str=="JYC"){
	    	   window.location.href="changeOrderStatus.action?orderId="+id+"&orderStatus="+str;
		       }
	    }
	   function selectAll(obj){
		   var checkbox=document.getElementsByName("tblistbox");
			var value = "";
			var val=0.0;
			for(var i = 0;i < checkbox.length; i++){
				if(checkbox[i].type == "checkbox")
		        {
					checkbox[i].checked = obj.checked;
		        }		
			}
		}
		function mergeOrder(){
			var checkboxArray = document.getElementsByName("tblistbox");
			var value = "";
			for(var i = 0;i < checkboxArray.length; i++){
				if(checkboxArray[i].checked)
		        {
					if(value == ""){
						value += checkboxArray[i].value;
					}else{
						value += ","+checkboxArray[i].value;
					} 
		        }
			}
			if(value.length>0){
			     window.location.href="/asn/front/mall/mergeOrderPay?proIds="+value;
			}else{
		         alert("请选择需要合并的订单！");
			}
		}

		function paymentOrder(ip){
			 window.location.href="/asn/front/mall/mergeOrderPay?proIds="+ip;
		}

		$(document).ready(function() {
			$("#beginDate").datepicker();
			$("#beginDate").datepicker("option", {dateFormat:"yy-mm-dd"});
			$("#endDate").datepicker();
			$("#endDate").datepicker("option", {dateFormat:"yy-mm-dd"});
			$("#beginDate").attr("value","${requestScope.beginDate}");
			$("#endDate").attr("value","${requestScope.endDate}");
		});
		
	</script>
	<BODY>
<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
<tr>
	<td width="55" align="center"><img src="<%=request.getContextPath() %>/image/comdo/pen.png"></td>
	<td width="500">
	交易管理&nbsp;>&nbsp;买入订单
	</td>
	<td width="237" align="right"><a href="#" onclick="javascript:window.history.back();">返回</a>&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>
	  <s:form  theme="simple" name="frm_search" method="post" action="queryBuyOrder.action">
	  <!--content-->
		<DIV class="f-resetcss f-typecss" id=new-content>
			<DIV class=tp id=orderList>
				<!--<DIV class="H2 m-b" style="margin: 0;">
				  <SPAN class=xuanTitle>已买到的货品</SPAN>
				</DIV> --><!--查询导航栏-->
				<DIV class=sBox> 
					   <table width="70%" cellpadding="0" cellspacing="0">
					   	<tr>
					   		<td width="100" height="28" align="right">卖家名称：</td>
					   		<td><s:textfield name="supplierName" id="supplierName" size="20"/></td>
					   		<td width="100" align="right"> 时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
					   		<td><input type="text" name="beginDate" id="beginDate" size="10" value="<s:property value="#request.beginDate"/>">&nbsp;-&nbsp;
					   			<input type="text" name="endDate" id="endDate" size="10" value="<s:property value="#request.endDate"/>"></td>
					   	</tr>
					   	
					   	<tr>
					   		<td width="100" height="28" align="right">订单号：</td>
					   		<td><s:textfield name="orderId" id="orderId" size="20"></s:textfield></td>
					   		<td width="100" align="right">货品名称：</td>
					   		<td><s:textfield name="productName" id="productName" size="20"></s:textfield></td>
					   	</tr>
					   	
					   	<tr>
					   		<td width="100" height="28" align="right">交易状态：</td>
					   		<td><s:select list="#{'':'所有','WFK':'未付款','YFK':'已付款','YFH':'已发货','YQX':'已取消','YGB':'交易关闭','JYC':'交易成功'}" cssStyle="WIDTH: 132px" name="orderStatus"></s:select></td>
					   		<td colspan="2" align="center"><INPUT class=sc  type="submit" value="搜 索" style="cursor: pointer;"> </td>
					   	</tr>
					   
					   </table>
					   
					   
					   <!-- 
					   <P>卖家名称：<s:textfield name="supplierName" id="supplierName" size="20"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                时&nbsp;&nbsp;&nbsp;&nbsp;间：<input type="text" name="beginDate" id="beginDate" size="10" value="<s:property value="#request.beginDate"/>">
		  				  &nbsp;-&nbsp;<input type="text" name="endDate" id="endDate" size="10" value="<s:property value="#request.endDate"/>">
					   </P>				  
					   <P class=pl-28>
					               订单号：<s:textfield name="orderId" id="orderId" size="20"></s:textfield>&nbsp;&nbsp;&nbsp;&nbsp;
					              货品名称：<s:textfield name="productName" id="productName" size="20"></s:textfield>
					   </P>
					    <P class=pl-16>交易状态：<s:select list="#{'':'所有','WFK':'未付款','YFK':'已付款','YFH':'已发货','YQX':'已取消','YGB':'交易关闭','JYC':'交易成功'}" cssStyle="WIDTH: 150px" name="orderStatus">
						   			</s:select>&nbsp;&nbsp;&nbsp;&nbsp;
						   <INPUT class=sc  type="submit" value="搜 索" style="cursor: pointer;"> 
					   </P>
					    -->
					 
				</DIV>
				<!--列表页面标题栏-->
				<DIV class=block style="margin-top:5px;BACKGROUND: url(<%=rootPath%>/do/order/images/bg2.png) repeat-x; ">
					<DIV class="content-detail hd">
						<DIV class=s1>图片
						  <DIV><!-- <IMG src="one_HRCA4]0][EJS0@KU~F7@DLI.gif" sysface=0>--> </DIV>
						</DIV>
						<DIV class=s2>货品名称</DIV>
						<DIV class=s3>单价（元）</DIV>
						<DIV class=s4>数量</DIV>
						<DIV class=s5>联络卖家</DIV>
						<DIV class=s6>实付款</DIV>
						<DIV class=s7>状态</DIV>
						<DIV class=s8>操作</DIV>
					</DIV>
				</DIV>
				<div id="mergeOrder">
					<span class="checkboxcss"><input type="checkbox" name="" onclick="selectAll(this)" /></span>
					<span class="allsel">全选</span>
					<span class="butMerge"><input type="button" value="合并付款" class="sm-btnOrder4" onclick="mergeOrder()" /></span>
				</div>
				<DIV id=listBox>
				<UL>
				        
				 <% 
				    List<Order>  ls=  (List)request.getAttribute("orderList");
				    for(int j=0;j<ls.size();j++){
				 %>
				 <LI>
					  <DIV class=title>
					  		<span class="checkboxcss"><input type="checkbox" name="tblistbox" id="tblistbox" value="<%=ls.get(j).getId() %>"></span>					 
							<SPAN class=left>订单编号：<%=ls.get(j).getId()%><!-- (共<EM>1</EM>种) --></SPAN> 
							<SPAN class=date>下单时间：<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ls.get(j).getCreateTime())%></SPAN>
					  </DIV>
					  <DIV>
					      <TABLE cellSpacing=0 cellPadding=0>
					           <TBODY>
					               <TR>
								      <TD class=detail>
								        <TABLE cellSpacing=0 cellPadding=0>
								          <TBODY>
								             <%List<OrderItem> items= OrderService.findOrderItemByOrderId(ls.get(j).getId()); %>
								             <%for(int i=0;i<items.size();i++) { %>
									          <TR>
									            <TD class=s1>
									              <A href="findOrderById.action?orderStatus=N&orderId=<%=ls.get(j).getId()%>">
									                 <IMG alt="" src="<%=rootPath%>/<%=items.get(i).getPicPath()%>" width="60" height="60">
									              </A>
									            </TD>
									            <TD class=s2>
									              <A href="findOrderById.action?orderStatus=N&orderId=<%=ls.get(j).getId()%>">
									                  <%=items.get(i).getItemProductName() %>                         
									              </A>
									            </TD>
									            <TD class=s3>
									              <DIV title="<%=Calculator.keepTwoDecimal(items.get(i).getProPrice()) %>"><%=Calculator.keepTwoDecimal(items.get(i).getProPrice()) %></DIV>
									            </TD>
									            <TD class=s4>
									              <DIV title="<%=items.get(i).getQuantity() %>"><%=items.get(i).getQuantity() %></DIV>
									            </TD>
									          </TR>
									          <%
									             }
									          %>
								          </TBODY>
								       </TABLE>
								      </TD>
								      <TD class=s5 align="center">
									        <DIV class=corp>
									          <% Member member=  MemberService.getMember(ls.get(j).getSupplierId()); %>
									          <a target="_blank" href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<%=ls.get(j).getSupplierId()%>"><%=member.getFullName()%></a>
									        </DIV>
									        <!--  
									        <DIV>
									          <A href="#"><%=ls.get(j).getSupplierId()%></A>
									        </DIV>
									        -->
									        <!--
									        <DIV>
									           <A href="#" >在线洽谈</A>
									        </DIV>
									         -->
								      </TD>
								      <TD class=s6>
								        <DIV class=total title="<%=Calculator.keepTwoDecimal(ls.get(j).getTotalAmount().doubleValue())%>"><%=Calculator.keepTwoDecimal(ls.get(j).getTotalAmount().doubleValue()+ls.get(j).getPostFee().doubleValue())%> </DIV>
								        <DIV class=fare title="<%=Calculator.keepTwoDecimal(ls.get(j).getPostFee().doubleValue())%>">(含 运费：<%=Calculator.keepTwoDecimal(ls.get(j).getPostFee().doubleValue())%>) </DIV>
								      </TD>
									  <TD class=s7>
									  <%if(ls.get(j).getOrderStatus().equals("WFK")){ %>
									         <DIV class=red>等待买家付款</DIV>
									    <%} %>
									    <%if(ls.get(j).getOrderStatus().equals("YFK")){ %>
									         <DIV class=red>等待卖家发货</DIV>
									     <%} %>
									     <%if(ls.get(j).getOrderStatus().equals("YFH")){ %>
									         <DIV class=red>货已发出,请查收</DIV>
									       <%} %>
									       <%if(ls.get(j).getOrderStatus().equals("YGB")){ %>
									         <DIV class=red>该订单已经被关闭</DIV>
									        <%} %>
									        <%if(ls.get(j).getOrderStatus().equals("JYC")){ %>
									         <DIV class=red>交易成功</DIV>
									        <%} %>
									        <%if(ls.get(j).getOrderStatus().equals("YQX")){ %>
									         <DIV class=red>该订单已经被取消</DIV>
									        <%} %>
									       <DIV>
									            <A href="findOrderById.action?orderStatus=N&orderId=<%=ls.get(j).getId()%>">详情</A>
									       </DIV>
									       <%if(ls.get(j).getOrderStatus().equals("WFK")){ %>
										       <DIV class=pay>
										       		<input type="button" value="付款" class="sm-btnpayment2" onclick="paymentOrder('<%=ls.get(j).getId()%>')">
										            <!-- <A href="javascript:" onclick="javascript:cancelOrder('<%=ls.get(j).getId()%>','YFK');">付款</A> -->
										            <br>
										            <br>
										            <A href="javascript:" onclick="javascript:cancelOrder('<%=ls.get(j).getId()%>','YQX');">取消</A>
										       </DIV>
									       <%} %>
									        <%if(ls.get(j).getOrderStatus().equals("YFH")){ %>
									           <DIV class=pay>
										            <A href="javascript:" onclick="javascript:cancelOrder('<%=ls.get(j).getId()%>','JYC');">成功</A>
										       </DIV>
									        <%} %>
									       <% int [] reviewed = (int [])request.getAttribute("reviewed");
									       	if( reviewed != null){
									       		
									       		if(reviewed[j] == 0){
									       	%>
									       		<div class=pay> <a href="<%=rootPath %>/do/tReview/toView?supplierId=<%=ls.get(j).getSupplierId() %>&orderId=<%=ls.get(j).getId() %>">评价</a> </div>	
									       	<%
									       		}
									       		else if(reviewed[j] == 1){
									       	%>
									       			<div class=pay> 已经评价 </div>
									       	<%
									       		}
									       	}
									       %>
									  </TD>
					                  <TD class=s8 style="WIDTH: 60px">-- </TD>
					              </TR>
					           </TBODY>
					        </TABLE>
					    </DIV>
				  </LI>        
				  <%
				    } 
				   %>
				</UL>
				
				
					<div>
						<table width="792" height="40" cellpadding="0" cellspacing="0" style="text-align: right;">
							<tr>
								<td style="vertical-align: middle;"> ${request.pageBar}</td>
							</tr>
						</table>
					</div>
					
				</DIV>
			</DIV>
		</DIV>
		 </s:form>
	</BODY>
</HTML>
