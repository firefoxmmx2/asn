<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<style type="text/css">
.picbox{margin:0;padding:0;}
.picbox{ width:110px; height:160px;float:left;padding:0 12px 3px 18px;}	
.picbox a{width:100px; float:left;font-size:12px;}
.picbox img{padding:2px;border:1px solid #e4e4e4;}
.picbox a:link {
	color: #000000;
	text-decoration: none;
}
.picbox a:visited {
	color: #000000;
	text-decoration: none;
}
.picbox a:hover {
	color: #ff0000;
	text-decoration:underline;
}
.picbox a:active {
	color: #000000;
	text-decoration:underline;white-space:nowrap; 
}
.adiv{width: 100px; text-align: center;float:left;white-space:nowrap; overflow:hidden;text-overflow:ellipsis;padding-top:3px;}
.pricediv{width:100px;text-align: center;float:left;}
</style>
<!--
<div style="width: 677px;height: 399px;">
<s:iterator id="item" value="importFruit">
<div style="float: left; width: 131px;height: 190px;margin:2px;">
	<div style="margin-top: 30px;">
	<a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank">
	<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>" width="108" height="96" />
	</a>
	</div>
	<div style="text-align: center;" class="picbox">
		<a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><s:property value="#item.productName" /></a>
	</div>
	<div class="pricediv"><font color="#FF7300">￥<strong><s:property value="#item.price1"/></strong></font>元/<s:property value="#item.productUnit"/></div>  
</div>
</s:iterator>   
</div>  -->
<table  width="100%" cellpadding="0" cellspacing="0" border="0" >
	<tr><td height="20"></td></tr>
<tr>
	<td align="center">							
	<s:iterator id="item" value="importFruit">
		<div class="picbox">
		<a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target=_blank"><img src="${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>" width="100" height="100" /></a>
		<a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target=_blank">
		<div class="adiv"><s:property value="#item.productName" /></div>
		<div class="pricediv"><font color="#FF7300">￥<strong><s:property value="#item.price1"/></strong></font>元/<s:property value="#item.productUnit"/></div>
		</a>
		</div>
	</s:iterator>								
</div>
</td>
</tr>
</table>   