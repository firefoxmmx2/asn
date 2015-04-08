<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.member.Permission" %>
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String cp=request.getContextPath();
Permission perm=new Permission(request);
%>
<style>
<!--
.left-title a, .left-title-close a{color:#FFFFFF;}
-->
</style>

<SCRIPT language=javascript src="<%=cp%>/js/menu.js"></SCRIPT>


<table width="152" align="center"  cellpadding="0" cellspacing="0" class="left-font" bgcolor="#deebfe">

	<tr>
		<td class="left-title-close" height="28"><a href="<%=cp%>/admin/">中心首页</a></td>  
	</tr>	
	   
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent onclick=expand(5) href="javascript:void(0);">系统管理</A></td>
	</tr>
	<tr style="DISPLAY: block" menuId="5">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<%if(perm.memberAdmin() || perm.systemAdmin()){%>
				<tr>
					<td height="25" class="left-link">
					<a href="<%=cp%>/admin/member/listMemberByParam" iref="adminCheckMember">会员列表</a></td>
				</tr>
				<%}%>
				<%if(perm.supplierAdmin() || perm.systemAdmin()){%>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/supplier/listSupplier">供应商表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/geoLocManage/toView">地 区 表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/ck/toCensorTable">敏感词表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/ck/toKeywordTable">关键字表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/ptManage/toView">商品分类表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/pro/toAllProductList">商品列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/spe/toSpecialProductList">特殊商品表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/info/toAllSupplyInfoList">供应列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/info/toAllPurchaseInfoList">求购列表</a></td>
				</tr>				
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/voucher/listAllVoucher">担保列表</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/discount/listAdminDiscount">折扣管理</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/advert/listAdvert">广告管理</a></td>
				</tr>
				
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/groupPurchase/listGroupPurchase">团购管理</a></td>
				</tr>
				<%}%>
			</table>
		</td>
	</tr>         
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent onclick=expand(6) href="javascript:void(0);">综合查询</A></td>
	</tr>
	<tr style="DISPLAY: block" menuId="6">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/member/generalListMember">会员列表</a></td>
				</tr>	
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/supplier/generalListSupplier">供应商表</a></td>
				</tr>			
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/order/queryOrderAll?searchType=search">订单查询</a></td>
				</tr>
			</table> 
		</td>
	</tr>
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent onclick=expand(7) href="javascript:void(0);">行情管理</A></td>
	</tr>
	
	<tr style="DISPLAY: block" menuId="7">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/quotation-control!toView">行情列表</a></td>
				</tr> 
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/quotation-control!toNew">新增行情</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/quotation-control!toNews">EXCEL导入</a></td>
				</tr>
                                <tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/initMarketView">行情市场列表</a></td>
				</tr>
                                <tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/toAddMarket">新增行情市场</a></td>
				</tr>
                                <tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/toQuoPdtView">行情产品列表</a></td>
				</tr>
                                <tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/toAddQuoPdt">新增行情产品</a></td>
				</tr>
                                <tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/toQuoPTView">行情产品类型列表</a></td>
				</tr>
                                <tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/quotation/toAddQuoPT">新增行情产品类型</a></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent onclick=expand(9) href="javascript:void(0);">短信管理</A></td>
	</tr>
	
	<tr style="DISPLAY: block" menuId="9">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/sms/insert_sms.jsp">短信发送</a></td>
				</tr> 
				<tr>     
					<td height="25" class="left-link"><a href="<%=cp%>/admin/sms/listDraft">草稿箱</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/sms/listSend">发件箱</a></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent onclick=expand(10) href="javascript:void(0);">信息订阅管理</A></td>
	</tr>
		<tr style="DISPLAY: block" menuId="10">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
			<tr>
				<td height="25" class="left-link"><a href="<%=cp%>/admin/infoOrder/toInfoOrderList">信息订阅人列表</a></td>
			</tr>
			<tr>
				<td height="25" class="left-link"><a href="<%=cp%>/admin/infoOrder/toInfoList">信息列表</a></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="left-title" height="28"><A class=menuParent onclick=expand(11) href="<%=cp%>/admin/huazhang/toOrderList">划账管理</A></td>  
	</tr>
	
	<!--
	<tr>
		<td class="left-title" height="28"><A class=menuParent onclick=expand(8) href="javascript:void(0);">招聘管理</A></td>
	</tr>
	
	<tr style="DISPLAY: block" menuId="8">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="#">招聘列表</a></td>
				</tr> 
				<tr>
					<td height="25" class="left-link"><a href="#">新增招聘</a></td>
				</tr>
			</table>
		</td>
	</tr>
	 -->
	
	
	
	
	
	<tr>
		<td class="left-title" id=parent6 height="28"><A class=menuParent onclick=expand(6) href="javascript:void(0);">业务统计</A></td>
	</tr>
	
	<tr style="DISPLAY: block" menuId="6">
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#deebfe">
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/report/getM.action">会员统计</a></td>
				</tr> 
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/report/getC.action">产品点击率统计</a></td>
				</tr>
				<tr>
					<td height="25" class="left-link"><a href="<%=cp%>/admin/report/getT.action">产品成交统计</a></td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent href="http://appsvr.aiecp.com:8080/ptnsso/changePassword.sso">修改密码</A></td>
	</tr>
	
	<tr>
		<td class="left-title" height="28"><A class=menuParent href="<%=cp%>/logout?retry=yes">重新登录</A></td>
	</tr>

</table>

