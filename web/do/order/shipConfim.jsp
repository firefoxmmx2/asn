<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String cp = request.getContextPath(); %>    
<%@ page import="java.util.List" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<%@page import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"%>
<%@page import="com.bornsoft.asn.bean.ship.Logistics" %>
<link href="<%=cp%>/do/order/css/order.css" type=text/css rel=stylesheet />

<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/datetime2.js"></SCRIPT>

<script type="text/javascript">
<!--
//function cancelOrder(id,str){
//		window.location.href="<%=cp%>/do/shipOver?orderId="+id+"&orderStatus="+str;
//	}

//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(		
			"delivery.logisticsId:物流公司|required",
			"delivery.deliveryId:运单号码|required",
			"delivery.logisticsMan:配送人|required",
			"delivery.logisticsTime:配送时间|required"
	);
	
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
});
//-->
</script>



<% 
	Order order = (Order)request.getAttribute("order"); 
	List<OrderItem> orderItem = (List<OrderItem>)request.getAttribute("orderItem"); 
	List<Logistics> logisticsList = (List<Logistics>)request.getAttribute("logisticsList");
%>


 <table width="792" cellpadding="0" cellspacing="0" style="color:#434343;">
	<tr>
		<td><table height="40" cellpadding="0" cellspacing="0">
				<tr>
					<td width="60" class="step">第一步</td>
					<td class="step-content">确认收货信息和交易详情</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td><table cellpadding="0" width="100%" cellspacing="0" class="st-li-all">
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
										<td height=<%=orderItem.size()==1?"100":"70"%> width="70" align="center" class="step-line">
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
										<td height="20" width="65">买家选择：</td>
										<td style="color:#999999;">
											<% 
												if(order.getPostFee().intValue() ==-1) out.print("卖家承担"); 
												else if(order.getPostFee().intValue() ==-2) out.print("卖家承担");
												else out.print(Calculator.keepTwoDecimal(order.getPostFee().doubleValue())+"元（运费）");
											%>
										</td>
									</tr>
									<tr>
										<td height="20">买家留言：</td>
										<td style="color:#999999;">
											<% if(order.getSpecialExplain() == null) out.print("无");
											else out.print(order.getSpecialExplain());
											%>
										</td>
									</tr>
									
									<tr>
										<td valign="top">我的备注：</td>
										<td>
											<textarea cols="30" rows="2" class="st-li-all" style="color:#999999;">你可以在此输入你想告诉买家的信息</textarea>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td height="40" colspan="2" style="padding-left:10px;">
							买家收货信息：<%=order.getCity() %><%=order.getDetailAddress()%>，<%=order.getZipCode()%>，<%=order.getDrawerName()%>，&nbsp;&nbsp;&nbsp;
							<%=order.getDrawerNumber()%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>		
		</td>
	</tr>
	
	<tr>
		<td><table height="40" cellpadding="0" cellspacing="0">				
				<tr>
					<td width="60" class="step">第二步</td>
					<td class="step-content">确认发货/取货信息</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<% Member m = MemberService.getMember(order.getMemberId());%>
	<tr>
		<td height="50" class="st-li-all" style="padding:10px;">
			物流取货信息：<%=m.getArea()==null?"无":m.getArea().length()<7?"无":m.getArea().substring(7,m.getArea().length())%>
						 <%=m.getAddress()==null?"无":m.getAddress()%>，
						 <%=m.getZip()==null?"无":m.getZip() %>，<%=m.getFullName() %>，&nbsp;&nbsp;&nbsp;
			<%=m.getMobilePhone()==null?"":m.getMobilePhone() %>
		</td>
	</tr>
	
	<tr>
		<td><table height="40" cellpadding="0" cellspacing="0">
				<tr>
					<td width="60" class="step">第三步</td>
					<td class="step-content">选择物流服务</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td style="background:url('<%=request.getContextPath()%>/image/hzx/change_bg.gif') repeat-x;"><table height="33" cellpadding="0" cellspacing="0">
				<tr>
					<td style="background:url('<%=request.getContextPath()%>/image/hzx/change2.gif') repeat-x;color:#333333;font-size:14px;font-weight:700;" align="center" width="117">自己联系物流</td>
				</tr>
			</table>
		</td>	
	</tr>
	
	<tr>
		<td height="50" class="st-li-all2" align="center">
		
		<form action="<%=cp%>/do/shipOver" name="form1" id="form1" method="post">
 		<input type="hidden" name="orderId" id="orderId" value="<%=order.getId() %>" /> 
		<table width="80%" cellpadding="0" cellspacing="0">
				<tr>
					<td height="30" width="150" align="right">物流公司名称：</td>
					<td>
						<select name="delivery.logisticsId" id="logisticsId" style="width: 130px;">
							<option value="">---选择物流---</option>
							<%
								for(int i =0; i < logisticsList.size(); i++){
									Logistics log = logisticsList.get(i);
							%>
							<option value="<%=log.getId()%>"><%=log.getLogiName() %></option>
							<% } %>
						</select><span id="errorsDiv_delivery.logisticsId"></span>
					</td>					
				</tr>
				<tr>
					<td height="30" width="150" align="right">运单号码：</td>
					<td><input type="text" name="delivery.deliveryId" id="deliveryId" size="27"><span id="errorsDiv_delivery.deliveryId"></span></td>
				</tr>
				
				<tr>
					<td height="30" width="150" align="right">配送人：</td>
					<td><input type="text" name="delivery.logisticsMan" id="logisticsMan" size="27"><span id="errorsDiv_delivery.logisticsMan"></span></td>
				</tr>
				
				<tr>
					<td height="30" width="150" align="right">配送时间：</td>
					<td><input type="text" name="delivery.logisticsTime" id="logisticsTime" readonly="readonly" size="27" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss');">
						<span id="errorsDiv_delivery.logisticsTime"></span>
					</td>
				</tr>
				<tr>
					<td height="30" width="150" align="right">&nbsp;</td>
					<td><input type="submit" value="确认" class="sm-btnOrder2"/></td><!--  onclick="javascript:cancelOrder('<%=order.getId()%>','YFH');"  -->
				</tr>
			</table>		
			</form>
		</td>
	</tr>
	
</table>

