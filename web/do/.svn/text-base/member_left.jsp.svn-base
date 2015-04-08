<%@page import="com.bornsoft.asn.bean.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.member.Permission" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="com.bornsoft.asn.utils.common.TimeDebug" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib.MemberApproveState" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib.SupplierApproveState" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.bean.supplier.Supplier" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%@ page import="com.bornsoft.util.mailx.MailServiceUtil" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%  
String cp=request.getContextPath();
Permission perm=new Permission(request);
boolean isSupplier=SupplierService.isSupplier(session);
MemberApproveState memState=MemberService.getApproveState(request.getSession());
Supplier supplier = SupplierService.getCurrentSupplier(request.getSession());
SupplierApproveState  supState= (supplier==null) ? SupplierApproveState.None : supplier.getApproveState();
Member curUser = MemberService.getMember(session);
%>

<SCRIPT language=javascript src="<%=cp%>/js/menu.js"></SCRIPT>

<link href="<%=cp%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/menu.css" rel="stylesheet" type="text/css" />
<STYLE type=text/css>.style1 {
	COLOR: #00ffff
}
H3 {
	PADDING-BOTTOM: 0.3em; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}
P {
	PADDING-BOTTOM: 0.5em; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}
.pane {
	POSITION: relative; PADDING-BOTTOM: 10px; PADDING-LEFT: 20px; PADDING-RIGHT: 20px; BACKGROUND: #edf5e1; BORDER-TOP: #c4df9b 2px solid; PADDING-TOP: 10px
}
.pane .delete {
	POSITION: absolute; TOP: 10px; CURSOR: pointer; RIGHT: 10px
}
.menuTr{
	background-image:url(<%=cp%>/image/menu_files/menu_bt2.gif); background-repeat:no-repeat;
}
.menuBt{
	background-image:url(<%=cp%>/image/menu_files/menu_bt.gif);
	PADDING-LEFT: 30px;
}
</STYLE>



<table width="152" align="center"  cellpadding="0" cellspacing="0" class="left-font" bgcolor="#deebfe">
	<tr>
		<td class="left-title" height="28"><A class=menuParent onClick="" href="<%=cp%>/do/index.jsp">中心首页</A></td>
	</tr>
	<tr>
		<td class="left-title-close" id=parent1 height="28"><a class=menuParent onClick="expand(1)" href="javascript:void(0);">资料修改</a></td>  
	</tr>
	<tr style="DISPLAY: block" menuId="1">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
				<%if(memState==MemberApproveState.Register || memState==MemberApproveState.None){%>
					<td height="25" class="left-link"><a href="<%=cp%>/do/member/member_update.jsp" iref="member_others.jsp">填写会员资料</a></td>
				<%}else{%>
					<td height="25" class="left-link"><a href="<%=cp%>/do/member/member_update.jsp" iref="member_others.jsp">修改会员资料</a></td>
				<%}%>
				</tr>
				<%if(memState==MemberApproveState.Completed){
				%>
				<tr> 
					<%if(supState==SupplierApproveState.None){%>
					<td height="25" class="left-link"><a href="<%=cp%>/do/supplier/supplier_rule.jsp" iref="member_others.jsp">申请成为供应商</a></td>
					<%}else{%>
					<td height="25" class="left-link"><a  href="<%=cp%>/do/supplier/updateSupplier" iref="supplier_others.jsp">修改供应商资料</a></td>  
					<%}%>
				</tr>
				<%
				}%>
			</table>
		</td>
	</tr>    
	<tr>
		<td class="left-title" id=parent3 height="28"><a class=menuParent onclick=expand(3) href="javascript:void(0);">商品管理</a></td>
	</tr>
	
	<tr style="DISPLAY: block" menuId="3">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/product/toCreateProduct">发布商品</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/product/toProductListOn" iref="toProductListOff;searchProductListOn;searchProductListOff">商品列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/discount/discount_index.jsp" iref="listDiscount;listSelfDiscount">折扣管理</a></td>
				</tr>		
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/storage/toStorageList">库存管理</a></td>
				</tr>			
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td class="left-title" id=parent6 height="28"><A class=menuParent onclick=expand(6) href="javascript:void(0);">交易管理</A></td>
	</tr>
	
	<tr style="DISPLAY: block" menuId="6">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/queryBuyOrder.action">买入订单</a></td>
				</tr> 
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/querySoldOrder.action">卖出订单</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/addressManager/addressList.action">地址管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/groupPurchase/myGroupPurchases">团购管理</a></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="left-title" id=parent2 height="28"><A class=menuParent onclick=expand(2) href="javascript:void(0);">供应信息</A></td>
	</tr>
	
	<tr style="DISPLAY: block" menuId="2">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/info/toCreateSupplyInfo">发布供应信息</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/info/toSupplyInfoListOn">供应信息列表</a></td>
				</tr>
				<tr style="display: none;">
					<td height="25" class="left-link"><a href="<%=cp%>/do/info/toSupplyInfoMatch">供应信息匹配</a></td>
				</tr>
			</table>
		</td>
	</tr>
	  
	<%if(isSupplier && SupplierService.getCurrentSupplier(session).getSupplierType().equals("1")) {%>
	<tr>
		<td class="left-title" height="28"><A class=menuParent onClick="" href="<%=cp%>/do/voucher/listVoucher">担保名单</A></td>
	</tr>
	<% } %>
	<tr>
		<td class="left-title" id=parent4 height="28"><A class=menuParent onclick=expand(4) href="javascript:void(0);">求购信息</A></td>
	</tr>
	<tr style="DISPLAY: block" menuId="4">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/info/toCreatePurchaseInfo">发布求购信息</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/info/toPurchaseInfoListOn">求购信息列表</a></td>
				</tr>
				<tr style="display: none;">
					<td height="25" class="left-link"><a href="<%=cp%>/do/info/toPurchaseInfoMatch">求购信息匹配</a></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="left-title" id=parent7 height="28"><A class=menuParent onclick=expand(7) href="javascript:void(0);">招聘管理</A></td>
	</tr>
	<tr style="DISPLAY: block" menuId="7">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/recr/toRecruitmentList">招聘列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/recr/toCreateRecruitment">新增招聘</a></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="left-title" id=parent8 height="28"><A class=menuParent onclick=expand(8) href="javascript:void(0);">信息中心</A></td>
	</tr>
	<tr style="DISPLAY: block" menuId="8">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/infoc/toInfoCenterList">信息列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/infoc/toCreateInfoCenter">新增信息</a></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<%if(isSupplier && SupplierService.getCurrentSupplier(session).getSupplierType().equals("1")) {%>
	<tr>
		<td class="left-title" id=parent10 height="28"><A class=menuParent onclick=expand(10) href="javascript:void(0);">客户管理</A></td>
	</tr>
	<tr style="DISPLAY: block" menuId="10">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/client/getClientInfo">客户档案资料管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/client/member_in_group.jsp">客户组别管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/client/getClientServiceRecord">客户跟踪服务记录</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/client/getClientConsumeInfo">客户消费信息管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/customer/statistics/consumerTop">客户消费排行榜</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/customer/statistics/consumePower">客户消费能力变化</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/customer/statistics/productSaleTop">产品销售排行榜</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="#">客户流失分析</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/customer/statistics/satisfaction">客户满意度分析</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/customer/bizOpp/toBizOppList">商机管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/customer/bizOpp/toPriceLogList">报价管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/customer/bizOpp/toSaleSourceList">销售资料流程管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/crm/service/cServView">客户服务排程查询</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/crm/service/toCServAdd">客户服务排程新增</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/do/crm/service/cView">客户视图</a></td>
				</tr>
				<% if(curUser.getEmail() != null){ %>
				<tr>
					<td height="25" class="left-link"><a href="http://<%=MailServiceUtil.getMailWebAddress(curUser.getEmail()) %>" target="_blank">客户邮件管理</a></td>
				</tr>
				<% } %>
			</table>
		</td>
	</tr>	
	<% } %>
	
	<%if(perm.memberAdmin() || perm.supplierAdmin()){%>
	<tr>
		<td class="left-title" id=parent5 height="28"><A class=menuParent onclick=expand(5) href="javascript:void(0);">系统管理</A></td>
	</tr>
	<tr style="DISPLAY: block" menuId="5">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<%if(perm.memberAdmin()){%>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/member/listMemberByParam">会员列表</a></td>
				</tr>
				<%}%>
				<%if(perm.supplierAdmin()){%>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/supplier/listSupplier">供应商表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/geoLocManage/toView">地 区 表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/ptManage/toView">商品分类表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="#">商品列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="#">求购列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/voucher/listAllVoucher">担保列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/discount/listAdminDiscount">折扣管理</a></td>
				</tr>
				<%}%>
			</table>
		</td>
	</tr>         
	<%}%>
	
	<%if(perm.quotationAdmin()){%>
	<tr>
		<td class="left-title" height="28"><A class=menuParent href="<%=cp%>/admin/quotation/quotation-control!toView">行情管理</A></td>
	</tr>
	<% } %>
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent href="<%=cp%>/do/advert/listAdvert">广告管理</A></td>
	</tr>
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent onClick="" href="<%=cp%>/do/infoOrder/toInfoOrder">信息订阅</A></td>
	</tr>
	<tr>  
		<td class="left-title" height="28"><A class=menuParent onClick="" href="http://appsvr.aiecp.com:8080/ptnsso/changePassword.sso" target="_blank" style1>修改密码</A></td>
	</tr>
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent onClick="" href="<%=cp%>/logout?retry=yes">重新登录</A></td>
	</tr>
	
</table>


