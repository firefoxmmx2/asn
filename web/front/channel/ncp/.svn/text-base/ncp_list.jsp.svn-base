<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
	String pubSvrUrl = "http://pubsvr.aiecp.com/asn";
%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@page import="java.util.*" %>  
<%@page import="com.bornsoft.asn.vo.ProductBean" %>   
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>  
<%@page import="com.bornsoft.asn.bean.product.Product" %>
<%@page import="com.bornsoft.asn.bean.product.SpecialProduct" %>
<link rel="stylesheet" rev="stylesheet" href="<%=cp%>/front/css/page.css" type="text/css" />  
<style type="text/css">
<!--
body {
	margin: 0px;
}
-->
</style>   

<script type="text/javascript">
			
function checkPage(){
	var totalPage = document.getElementById("totalPage").value;
	var inPage = document.getElementById("pageBox").value;
	if(isNaN(inPage)||inPage==""){
		alert("请输入数字");
		return false;
	}			
	if(parseInt(inPage) > parseInt(totalPage)){		
		document.getElementById("thePage").value=totalPage;
	}else{
		document.getElementById("thePage").value=parseInt(inPage);
	}
	return true;
}
</script>

<table width="980" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="199" valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="m10">
  <tr>
    <td height="29"><img src="<%=cp%>/image/channel/ncp/spfl.jpg" width="199" height="29" /></td>
  </tr>
  <tr>
    <td height="264" valign="top" class="border_hui">
	
	<table width="94%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
      	<td><%@include file="ncp_ptype.jsp" %> </td>
      </tr>
    </table></td>
  </tr>
</table>	
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="m10">
  <tr>
    <td height="26" class="nva_red"><span class="p10">热卖产品</span></td>
  </tr>
  <tr>
    <td height="264" valign="top" class="border_hui">
	
	<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
		<% 	List<Product> hotNcpProduct = (List<Product>) request.getAttribute("hotNcpProduct"); 
			for(int i=0; i<hotNcpProduct.size(); i++){
				Product sp = hotNcpProduct.get(i);
		%>
            <tr>
            <td colspan="2" class="xbd"><a href="<%=pubSvrUrl%>/front/channel/ncp/detailInfo?productId=<%=sp.getProductId()%>" target="_blank"><%=sp.getProductName()%></a></td>
			</tr>
		<% } %>	
		
    </table></td>
  </tr>
</table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="m10">
  <tr>
    <td height="26" class="nva_red"><span class="p10">特价产品</span></td>
  </tr>
  <tr>
    <td height="264" valign="top" class="border_hui">
	
	<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
        <% 	List<SpecialProduct> specialPriceProduct = (List<SpecialProduct>) request.getAttribute("specialPriceProduct"); 
			for(int i=0; i<specialPriceProduct.size(); i++){
				SpecialProduct sp = specialPriceProduct.get(i);
		%>
            <tr>
            <td colspan="2" class="xbd"><a href="<%=pubSvrUrl%>/front/channel/ncp/detailInfo?productId=<%=sp.getProductId()%>" target="_blank"><%=sp.getName()%></a></td>
			</tr>
		<% } %>	
		
    </table></td>
  </tr>
</table>

   </td>
    <td width="10">&nbsp;</td>
    <td valign="top">
	
	
		<%@include file="adsPage.jsp" %>

		<form action="<%=cp%>/front/channel/ncp/listNcp" method="get" name="pageform" id="pageform">
		<input type="hidden" value="<%=request.getSession().getAttribute("ptypeCode") %>" name="ptypeCode" id="ptypeCode" />
		<input type="hidden" name="type" id="type" value="<%=request.getSession().getAttribute("ncpMenuType") %>" />
		<input type="hidden" name="searchkey" id="searchkey" value="<s:property value="searchkey"/>" />		
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="35" align="left" valign="middle" class="huib p10">
				<%
				Object ncpTypeTitle = request.getSession().getAttribute("ncpMenuType");
					if(ncpTypeTitle == null || ncpTypeTitle.toString().equals("ncp")){
						out.print("农副产品");
					}else if(ncpTypeTitle.toString().equals("bjp")){
						out.print("保健品");
					}else if(ncpTypeTitle.toString().equals("syfw")){
						out.print("商业服务");
					}
				%>
				
				</td>
			</tr>
			<tr>
				<td height="35" background="<%=cp%>/image/channel/ncp/nav771.jpg">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="left" class="p10">排序方式： 热卖 特价 新品</td>
						<td align="right" class=" p_r">共：<span class="color_cs"><%=request.getSession().getAttribute("count") %> </span>条</td>
					</tr>
				</table>


				</td> 
			</tr>
			<tr>
				<td>
				<%
					List<Object> ncplist = (List<Object>) request.getAttribute("ncplist");
					List<Product> hotNcplist = (List<Product>) request.getAttribute("hotNcpProduct");
					if(ncplist != null){
					for (int i = 0; i < ncplist.size(); i++) {
						ProductBean pb = (ProductBean) ncplist.get(i);
				%>
				<div style="width: 192px; float: left;">
				<table class="w165" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center"><a
							href="<%=pubSvrUrl%>/front/channel/ncp/detailInfo?productId=<%=pb.getProduct().getProductId()%>"
							target="_blank"> <img
							src="<%=cp%><%=pb.getProduct().getBigPicPath()%>.165x165" border="0" />
						</a></td>

					</tr>
					<tr>
						<td align="center" class="huib" height="20"><a
							href="<%=pubSvrUrl%>/front/channel/ncp/detailInfo?productId=<%=pb.getProduct().getProductId()%>"
							target="_blank"><%=pb.getProduct().getProductName().length() > 14 ? pb
								.getProduct().getProductName().substring(0, 14)
								+ "..."
								: pb.getProduct().getProductName()%></a></td>

					</tr>
					<tr>
						<td align="center" class="wz_scj" height="16">市场价：<span
							class="scj">￥<%=pb.getProduct().getPrice1() == null ? "<font color=green>价格面议</font>"
								: Calculator.keepTwoDecimal(pb.getProduct()
										.getPrice1() * 1.1)%></span></td>

					</tr>
					<tr>
						<td align="center" class="wz_xsj" height="16"><a
							href="<%=pubSvrUrl%>/front/channel/ncp/detailInfo?productId=<%=pb.getProduct().getProductId()%>"
							target="_blank">销售价：￥<%=pb.getProduct().getPrice1() == null ? "<font color=green>价格面议</font>"
								: Calculator.keepTwoDecimal(pb.getProduct()
										.getPrice1())%></a></td>

					</tr>
				</table>
				</div>
				<%
					} 
				}
				%>
				</td>
			</tr>
			
			<!-- ******************分页************** -->			
			<tr>
				<td align="right" height="60"><div id="pageDiv" style="width: 680px;"><s:property	value="#request.pageBar" escape="false" /></div></td>
			</tr>
			<!-- ******************分页************** -->
		</table>

		
		</form>

		</td>
  </tr>
</table>