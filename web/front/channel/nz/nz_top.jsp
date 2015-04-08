<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>	
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/front/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jqellipsis.js"></script>
<table width="980" border="0" cellspacing="0" cellpadding="0"
	align="center" height="26" class="sousuo">
	<tr>
		<td align="left" class="logo"></td>
		<!--<td align="center" width="110"></td>-->
		<td align="right">

	<form action="${pageContext.request.contextPath}/front/prodcut/searchProduct" method="post">
	<input type="hidden" name="searchTypeID" id="searchTypeID" value="cp">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="6%"><img
					src="${pageContext.request.contextPath}/image/channel/nz/search_48.gif"
					width="34" height="34" /></td>
				<td width="13%" class="wz_search">产品搜索：</td>
				<td width="67%"><label> 
				<input name="searchkey" type="text" size="62" /> </label></td>
				<td width="14%" align="center">
			<input type="image" src="${pageContext.request.contextPath}/image/channel/nz/sousuo.jpg" width="83" height="23"/></td>
			</tr>
		</table>
	    </form>
		</td>
	</tr>
</table>
<table width="980" border="0" cellspacing="0" cellpadding="0"
	align="center" class="nav" height="39">
	<tr>
		<td width="120" class="title"><a href="${pageContext.request.contextPath }/front/channel/nz/home">农资首页</a></td> 
		<td width="92" class="title"><a target="_blank" href="${pageContext.request.contextPath}/front/mall/product/cate1?type=0002">产品中心</a></td>
		<td width="92" class="title"><a href="${pageContext.request.contextPath }/front/mall/quotation/QuotationList" target="_blank">价格行情</a></td>
		<td width="92" class="title"><a href="${pageContext.request.contextPath }/front/mall/info/showSupplyInfoList1?typeId=2" target="_blank">供应信息</a></td>
		<td width="92" class="title"><a href="${pageContext.request.contextPath }/front/mall/info/showPurchaseInfoList1?typeId=2" target="_blank">求购信息</a></td>
		<td width="72" class="title"><a href="${pageContext.request.contextPath }/front/mall/supplier/searchSupplier" target="_blank">企业</a></td>
		<!--<td width="92" class="title">行业资讯</td>-->
		<td width="114">&nbsp;</td>
			<%
		int amount = (Integer) request.getAttribute("amount");
	%>
		<td width="214" class="gwc"><a href="javascript:void(bcart.showCart());">购物车中有<span class="redb"><%=amount %></span>件商品</a></td>
	</tr>
</table>