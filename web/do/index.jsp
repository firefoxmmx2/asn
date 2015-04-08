<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.product.ProductService" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%@ page import="com.bornsoft.asn.bean.supplier.Supplier" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.service.information.InfoService" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.service.product.DisplayProductService"%>
<%@page import="com.bornsoft.asn.bean.product.Product" %>
<%@page import="com.bornsoft.asn.service.order.OrderService" %>
<%@page import="com.bornsoft.asn.bean.order.Order"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bornsoft.asn.utils.common.Calculator"%>

<%
	String cp=request.getContextPath();
	Long sId=MemberService.getMemberId(session);
	Member member=MemberService.getMember(session);
	Supplier supplier = SupplierService.getSupplier(member.getMemberId());
	String lastLoginIp = (String)session.getAttribute("loginMemberLastIp");
	java.sql.Timestamp lastLoginTimeD = (java.sql.Timestamp)session.getAttribute("loginMemberLastTime");
	String lastLoginTime="";
	if(lastLoginTimeD!=null){ 
		lastLoginTime=new java.text.SimpleDateFormat("yyyy-M-d HH:mm").format(lastLoginTimeD);
	}
%>

<table align="center" width="792" cellpadding="0" cellspacing="0">
	<tr>
		<td><img src="../image/comdo/yuanjiao01.gif" /></td>
	</tr>
	<tr>
		<td height="82" bgcolor="#fffced" class="index-ads">
			<table cellpadding="0" cellspacing="0">          
				<tr>
					<td height="20"><font color="#ff7300"><strong>尊敬的客户：</strong></font></td>
				</tr>
				
				<tr>
					<td style="text-indent:2em;font-size: 12px;">普通会员——只能选购商品、管理订单、发送求购信息、地址管理。</td>
				</tr>				
				<tr>
					<td style="text-indent:2em;font-size: 12px;">供&nbsp;应&nbsp;&nbsp;商——除了可以享受普通会员的服务外，还能够发送供应信息、管理商品、参与折扣活动。</td>
				</tr>
				
				<tr>
					<td style="text-indent:2em;font-size: 12px;">目前，
					<%
					if(supplier == null){
						if(member.getApproveState().toString().equals("None")){
						%>
							你的会员资料不完善，请[<a href="<%=cp%>/do/member/member_update.jsp">补充资料</a>]，补充之后才能发布求购信息或进一步成为供应商，销售自己的商品。	
						<%
						}else if(member.getApproveState().toString().equals("ManualVerify")){
						%>
							网络中心管理员还未审核通过你的会员资料，请等待审核，如果需要尽快通过，请致电管理员。
						<%
						}else if(member.getApproveState().toString().equals("Completed")){
						%>
							您是本站电子商务会员，享有[<a href="<%=cp%>/front/cate0">选购商品</a>]、[<a href="<%=cp%>/front/queryBuyOrder.action?orderStatus=WFK">管理订单</a>] [<a href="<%=cp%>/do/info/toCreatePurchaseInfo">发送求购信息</a>]等服务。
					<%	}
					}
					else if(supplier != null && member.getApproveState().toString().equals("ManualVerify")){
					%>
						你修改了一下重要信息，需要管理员重新审核后，才能享受服务。
					<%
					}
					else{
							if(supplier.getApproveState().toString().equals("None")){
							%>
								你还不是供应商，如果需要在网上销售自己的商品或者发布供应信息，请[<a href="<%=cp%>/do/supplier/supplier_rule.jsp">申请成为供应商</a>]。	
							<%
							}else if(supplier.getApproveState().toString().equals("ManualVerify")){           
							%>
								 网络中心管理员还未审核通过你的供应商资料，请等待审核，如果需要尽快通过，请致电管理员。
							<%
							}else if(supplier.getApproveState().toString().equals("Completed")){
							%>
							你是本站供应商，享有[<a href="<%=cp%>/do/product/toProductListOn">管理商品</a>]、[<a href="<%=cp%>/do/queryBuyOrder.action?orderStatus=WFK">管理订单</a>] [<a href="<%=cp%>/do/info/toCreateSupplyInfo">发送供应信息</a>]等服务。							
					<%	}
					}%>
					</td>
				</tr>
				<% if((supplier != null && !supplier.getApproveState().toString().equals("Completed")) || supplier == null){ %>
				<tr>
					<td height="20"><a href="<%=cp%>/do/member/process">如何成为会员及供应商？</a></td>
				</tr>
				<% } %>
				
			</table>			
		</td>
	</tr>
	<tr>
		<td><img src="../image/comdo/yuanjiao02.gif" /></td>
	</tr>
</table>

<table align="center" width="792" cellpadding="0" cellspacing="0">
	<tr>
		<td width="552" style="padding-right:8px;"  valign="top">
			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr>
					<td height="28" background="../image/comdo/yuanjiao03.gif" class="index-title">消息中心</td>
				</tr>
				<tr>
					<td class="index-border" height="80">
					<table cellpadding="0" cellspacing="0" style=" padding-left:10px;">
							<tr>
								<td height="25">上架商品：</td>
								<td width="200"><a href="#"><%=ProductService.getProductCount(sId.intValue(),"on")%> 种</a></td>
								<td height="25">下架商品：</td>
								<td><a href="#"><%=ProductService.getProductCount(sId.intValue(),"off")%> 种</a></td>
							</tr>
							<tr>
								<td height="25">已发布供应信息：</td>
								<td width="200"><a href="#"><%=InfoService.getSupplyInfoCount(sId.intValue(),"on") %>条</a></td>
								<td height="25">已发布求购信息：</td>
								<td><a href=""><%=InfoService.getPurchaseInfoCount(sId.intValue(),"on") %>条</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr background="../image/comdo/yuanjiao03.gif">
					<td height="28" class="index-title">订单列表</td>
					<td style="border-right:1px #cde4f8 solid;" align="right"><a href="<%=cp%>/do/queryBuyOrder.action">>>更多</a>&nbsp;</td>
				</tr>
				<tr>
					<td class="index-border" style=" padding:10px 0;" colspan="2">
					<table width="95%" align="center" cellpadding="0" border="1" bordercolor="#ffdeb8" cellspacing="0" style=" border-collapse:collapse; background-color:#fffced;">
							<tr>
								<td height="25" align="center">订单编号</td>
								<td align="center">下单时间</td>
								<td align="center">收货人</td>
								<td align="center">交易金额(元)</td>
								<td align="center">订单状态</td>  
							</tr>
							<%List<Order> orderList=OrderService.getDealOrderInfo(sId);
								int orderCount = 0;
								if(orderList == null){
									orderCount = 0;
								}else if(orderList.size() > 10){
									orderCount = 10;
								}else{
									orderCount = orderList.size();
								}
							%>
						    <% for(int i=0;i<orderCount;i++){%>
							<tr>
								<td height="25" align="center">
								   <%if(orderList.get(i).getMemberId()==sId){ %>
									  <a href="<%=request.getContextPath()%>/do/findOrderById.action?orderId=<%=orderList.get(i).getId() %>&orderStatus=<%=orderList.get(i).getOrderStatus() %>">
									    <%=orderList.get(i).getId() %>
									  </a>
									 <%} %>
									 <%if(orderList.get(i).getSupplierId()==sId){ %>
									   <a href="<%=request.getContextPath()%>/do/findOrderById.action?orderId=<%=orderList.get(i).getId() %>&orderStatus=<%=orderList.get(i).getOrderStatus() %>">
									    <%=orderList.get(i).getId() %>
									   </a>
									 <%} %>
								</td>
								<td align="center">
								  <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(orderList.get(i).getCreateTime()) %>
								</td>
								<td align="center">
								  <%=orderList.get(i).getDrawerName() %>
								</td>
								<td align="center">
								  <%=Calculator.keepTwoDecimal(orderList.get(i).getTotalAmount().doubleValue()) %>
								</td>
								 <%if(orderList.get(i).getOrderStatus().equals("WFK")){%>
								   <td align="center">
								               未付款
								   </td>
								   <%} %><%else if(orderList.get(i).getOrderStatus().equals("YFK")) {%>
								     <td align="center">
								                  已付款
								     </td>
								   <%} %><%else if(orderList.get(i).getOrderStatus().equals("YFH")) {%>
								     <td align="center">
								                  已发货
								     </td>
								   <%} %>	
							</tr>
							<%} %>
						</table>
					</td>
				</tr>
			</table>
			
			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr>
					<td height="28" background="../image/comdo/yuanjiao03.gif" class="index-title">安全事项</td>
				</tr>
				<tr>
					<td class="index-border" style="padding:0 10px; line-height:180%;">
						<%
						if(!lastLoginTime.equals("")){
						%>
						<div>你上次进入电子商务系统的时间是<%=lastLoginTime%>，网络地址是<%=lastLoginIp%>。</div>
						<div>如果此记录与实情不符，请向网络管理中心查证。</div>
						<%	
						}
						%>
						

					</td>
				</tr>
			</table>
			


			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr>
					<td height="28" background="../image/comdo/yuanjiao03.gif" class="index-title">最新供应</td>
				</tr>
				<tr>
					<td class="index-border" style="padding:10px 0; line-height:180%;">
					<table width="95%" align="center" cellpadding="0" border="1" bordercolor="#ffdeb8" cellspacing="0" style=" border-collapse:collapse; background-color:#fffced;">
							<tr>
								<td height="25" align="center">供应商</td>
								<td align="center">所在地</td>
								<td align="center">标题</td>
							</tr>
							<tr>
								<td height="25" align="center">新合苗木</td>
								<td align="center">青海省海南藏族自治州</td>
								<td align="center">优质耐寒宿根苗木－－宿根福禄考新优品种</td>
							</tr>
							<tr>
								<td height="25" align="center">渝祥食品</td>
								<td align="center">重庆市奉节县</td>
								<td align="center">合成抗菌素</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>

			
			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr>
					<td height="28" background="../image/comdo/yuanjiao03.gif" class="index-title">身份担保关系</td>
				</tr>
				<tr>
					<td class="index-border" style="padding:0 10px; line-height:180%;">
						<div style="padding-top:10px; ">
							<% 
								Supplier s= SupplierService.getSupplier(MemberService.getMember(session).getMemberId()); 
								if(s != null){
									if(s.getSupplierType().equals("2")){
										Member v=MemberService.getMember(new Long(s.getVoucherId().toString()));
										if(v!=null){
											String vouch = "<font color='blue'>"+v.getFullName()+"</font>";
											if(s.getVouchState().toString().equals("None")){
												out.println(vouch +" 还未查看你的身份担保申请，请与该单位联系。");
											}
											else if(s.getVouchState().toString().equals("Agree")){
												out.println("你的身份担保单位是 "+vouch+"。");
											}
											else if(s.getVouchState().toString().equals("Disagree")){
												out.println(vouch +" 不同意担保你的身份。你可与该单位联系或者更换担保单位。");
											}
										}
										
									}else if(s.getSupplierType().equals("1")){
										Map<String, Object> m=new HashMap<String, Object>();
										// 担保总数
										m.put("memberId",s.getSupplierId());
										long vCount=SupplierService.getVoucherCount(m);
										if(vCount>0){
											out.print("已经为<span class=boldNumber>"+vCount+"</span>个会员提供了身份担保。");
										}else{
											out.print("目前没有为他人提供身份担保。");
										}
										// 未处理担保数
										m.put("vouchState","None");
										vCount=SupplierService.getVoucherCount(m);
										if(vCount>0){
											out.print("<br>未处理担保数<span class=boldNumber>"+SupplierService.getVoucherCount(m)+"</span>。");
											m.put("startCount", 1);
											m.put("endCount", SupplierService.getVoucherCount(m));
											out.println("未处理担保如下：<br>");
											List list = SupplierService.getVoucherByMemberId(m);
											for(int i=0; i< list.size();i++){
												Map ml = (Map)list.get(i);
												out.print("["+ml.get("fullName")+"]、");
											}
											out.println("<br><a href='voucher/listVoucher'>查看详细信息</a>");
										}
									
									}
								}
							%>
						</div>
					</td>
				</tr>
			</table>


		</td>
		<td width="232" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr>
					<td height="29" background="../image/comdo/title_bg.gif" class="index-title">站内公告</td>
				</tr>
				<tr>
					<td class="index-znads" height="125" valign="top"><table cellpadding="0" cellspacing="0" >
							<tr>
								<td height="25"><a href="">诚信保障服务正式发布，欢迎加入！</a></td>								
							</tr>
							<tr>
								<td height="25"><a href="">物流推荐平台，货运服务全新上线！</a></td>								
							</tr>
							<tr>
								<td height="25"><a href="">新升级新体验，图片管家问世啦！</a></td>								
							</tr>
							<tr>
								<td height="25"><a href="">旺铺会员新功能上线了！</a></td>								
							</tr>
							<tr>
								<td height="25"><a href="">预存服务条款，等你了开通！</a></td>								
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr>
					<td height="29" background="../image/comdo/title_bg.gif" class="index-title">诚信服务</td>
				</tr>
				<tr>
					<td class="index-znads" height="150" valign="top"><table cellpadding="0" cellspacing="0" >
							<tr>
								<td height="50" align="center"><img src="../image/comdo/ads.jpg" width="200" height="45"></td>								
							</tr>
							<tr>
								<td height="25"><a href="">物流推荐平台，货运服务全新上线！</a></td>								
							</tr>
							<tr>
								<td height="25"><a href="">新升级新体验，图片管家问世啦！</a></td>								
							</tr>
							<tr>
								<td height="25"><a href="">旺铺会员新功能上线了！</a></td>								
							</tr>
							<tr>
								<td height="25"><a href="">预存服务条款，等你了开通！</a></td>								
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px;">
				<tr>
					<td height="29" background="../image/comdo/title_bg.gif" class="index-title">最近发布的产品</td>
				</tr>
				<tr>
					<td class="index-nearpro" valign="top">
					<%List<Product> list=DisplayProductService.getFrontHotProduct(null,1,6);%>
					   <table width="100%" cellpadding="0" cellspacing="0" >
							<tr>
								<td align="center" width="33%"><img src="<%=request.getContextPath()%><%=list.get(0).getSmallPicPath()%>" width="60" height="60"><br><a href="<%=request.getContextPath()%>/front/product/displayDetailProduct.action?productId=<%=list.get(0).getProductId()%>" target="_blank"><%=list.get(0).getProductName().length()>6?list.get(0).getProductName().substring(0,5):list.get(0).getProductName()%></a></td>	
								<td align="center" width="33%"><img src="<%=request.getContextPath()%><%=list.get(1).getSmallPicPath()%>" width="60" height="60"><br><a href="<%=request.getContextPath()%>/front/product/displayDetailProduct.action?productId=<%=list.get(1).getProductId()%>" target="_blank"><%=list.get(1).getProductName().length()>6?list.get(1).getProductName().substring(0,5):list.get(1).getProductName()%></a></td>
								<td align="center" width="33%"><img src="<%=request.getContextPath()%><%=list.get(2).getSmallPicPath()%>" width="60" height="60"><br><a href="<%=request.getContextPath()%>/front/product/displayDetailProduct.action?productId=<%=list.get(2).getProductId()%>" target="_blank"><%=list.get(2).getProductName().length()>6?list.get(2).getProductName().substring(0,5):list.get(2).getProductName()%></a></td>							
							</tr>	
							<tr>
								<td align="center" width="33%"><img src="<%=request.getContextPath()%><%=list.get(3).getSmallPicPath()%>" width="60" height="60"><br><a href="<%=request.getContextPath()%>/front/product/displayDetailProduct.action?productId=<%=list.get(3).getProductId()%>" target="_blank"><%=list.get(3).getProductName().length()>6?list.get(3).getProductName().substring(0,5):list.get(3).getProductName()%></a></td>	
								<td align="center" width="33%"><img src="<%=request.getContextPath()%><%=list.get(4).getSmallPicPath()%>" width="60" height="60"><br><a href="<%=request.getContextPath()%>/front/product/displayDetailProduct.action?productId=<%=list.get(4).getProductId()%>" target="_blank"><%=list.get(4).getProductName().length()>6?list.get(4).getProductName().substring(0,5):list.get(4).getProductName()%></a></td>
								<td align="center" width="33%"><img src="<%=request.getContextPath()%><%=list.get(5).getSmallPicPath()%>" width="60" height="60"><br><a href="<%=request.getContextPath()%>/front/product/displayDetailProduct.action?productId=<%=list.get(5).getProductId()%>" target="_blank"><%=list.get(5).getProductName().length()>6?list.get(5).getProductName().substring(0,5):list.get(5).getProductName()%></a></td>							
							</tr>						
						</table>
					</td>
				</tr>
			</table>
		
		</td>
	</tr>
</table>
