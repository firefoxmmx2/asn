<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.bean.shoppingCart.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bornsoft.asn.bean.shoppingCart.CartItem" %>
<%@ page import="com.bornsoft.sso.util.*"%>
<%@ page import="com.bornsoft.sso.config.*" %>
<% String cp = request.getContextPath(); %>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/front/js/bcart/bcart.js"></script>
<link rel="stylesheet" href="<%=cp%>/js/bcart/bcart.css" type="text/css" /> 
<script type="text/javascript"
					src="${pageContext.request.contextPath }/js/jqellipsis.js"></script>

<table width="980" border="0" cellspacing="0" cellpadding="0" align="center" height="26" >
  <tr>
    <td align="left" class="logo"></td>
	<!--<td align="center" width="110"></td>-->
	<td align="right">
	
<form action="${pageContext.request.contextPath}/front/prodcut/searchProduct" method="post">
	<input type="hidden" name="searchTypeID" id="searchTypeID" value="cp">
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
	  <td width="6%"><img src="${pageContext.request.contextPath}/image/channel/zys/search_48.gif" width="34" height="34" /></td>
	  <td width="13%" class="wz_search">产品搜索：</td>
        <td width="67%"><label>
          <input name="searchkey" type="text" size="62" />
        </label></td>
        <td width="14%"  align="center">
        <input type="image" src="${pageContext.request.contextPath}/image/channel/zys/sousuo.jpg" width="83" height="23"/>
        </td>
      </tr>
    </table>
    </form>
    
    </td>
  </tr> 
</table>


<table width="980" border="0" cellspacing="0" cellpadding="0" class="nav" height="39" align="center">
  <tr>
    <td width="150" class="title"><a href="${pageContext.request.contextPath }/front/channel/zys/home">专业社产品首页</a></td>
	<td width="100" class="title"><a href="${pageContext.request.contextPath}/front/mall/product/cate1?type=0001" target="_blank">专业社产品</a></td>
	<td width="95" class="title"><a href="${pageContext.request.contextPath }/front/mall/quotation/QuotationList" target="_blank">价格行情</a></td>
	<td width="95" class="title"><a href="${pageContext.request.contextPath }/front/mall/info/showSupplyInfoList1?typeId=1" target="_blank">供应信息</a></td>
	<td width="95" class="title"><a href="${pageContext.request.contextPath }/front/mall/info/showPurchaseInfoList1?typeId=1" target="_blank">求购信息</a></td>
	<td class="title" width="148"><a href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=338" target="_blank">新合作联佳连锁超市</a></td>
	<td width="83">&nbsp;</td>
	<%
		int amount = (Integer) request.getAttribute("amount");
	%>
    <td width="214" align="center"><a href="javascript:void(bcart.showCart());">购物车中有<span class="redb"><%=amount %></span>件商品</a></td>
  </tr>
</table>