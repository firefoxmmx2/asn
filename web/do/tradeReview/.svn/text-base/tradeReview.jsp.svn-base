<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@page import="java.util.List"%>
<%@page import="com.bornsoft.asn.bean.order.Order"%>
<%@page import="com.bornsoft.asn.service.member.MemberService"%>
<%@page import="java.text.SimpleDateFormat"%><style type="text/css">
<!--
.reviewGradeA{ width:130px; clear:both; float:left}
.reviewGradeBC{ width:160px; float:left}
.table_border{ margin-top:15px; background:#ffffff;font-size:12px; font-family:"新宋体"; color:#222222;}
.table_border td{border-top:1px #e4e4e4 solid;border-right:1px #e4e4e4 solid;}
.table_border{border-bottom:1px #e4e4e4 solid;border-left:1px #e4e4e4 solid;}
-->
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/tradeReview/tradeReview.js"></script>
<s:if test="reviewed == 0">
<s:form action="doNew" namespace="/do/tReview" theme="simple">
<table id="trTb" width="700" cellspacing="0" cellpadding="2" border="0" class="table_border" align="center">
	<tr><td height="30" colspan="6" style="background:#f3f8fb; font-weight:bold;">&nbsp;你还未评论的订单</td></tr>
	<tr>
	   <td style="font-weight:bold" align="center" height="30">订单号</td>
	   <td style="font-weight:bold" align="center">卖家</td>
	   <td style="font-weight:bold" align="center">实付款</td>
	   <td style="font-weight:bold" align="center">交易时间</td>
	   <td style="font-weight:bold" align="center">评论</td>
	</tr>
	<%
	@SuppressWarnings("unchecked")
	List<Order> orLists = (List<Order>)request.getAttribute("orList");
	%>
	<%
		for(int i=0;orLists != null && i<orLists.size();i++){
			Order or = orLists.get(i);
			String supplierName = MemberService.getMember(or.getSupplierId()).getFullName();
	%>
	<tr rowData={"tr.orderId":"<%=or.getId() %>","tr.supplierId":"<%=or.getSupplierId() %>","supplier.fullName":"<%=supplierName %>"} >
	   <td style="color:#195cad;" align="center">
               <a href="<s:property value="orderPath"/>?orderStatus=N&orderId=<%=or.getId() %>">
                <span><%= or.getId()%></span>
               </a>
	   </td>
	   <td align="center">
	    <%= supplierName %>
	   </td>
	   <td style="color:#ff7300; font-weight:bold" align="center"> 
	   	<%=or.getTotalAmount() %>
	   </td>
	   <td align="center">
	   	<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(or.getCreateTime()) %>
	   </td>
	   <td style="font-weight:bold" align="center"><label>
	     <input type="button" name="pinjia" value="评论" />
	   </label></td>
	</tr>

	<% }%>
</table>


<table id="trTb2" width="700" cellspacing="0" cellpadding="2" border="0" class="table_border" align="center">
    <tbody>
	<tr><td height="30" colspan="2" style="background:#f3f8fb; font-weight:bold;">&nbsp;商家评论</td></tr>
	<tr>
      <td align="right" height="30">供应商：</td>
      <td style="padding-left:7px;"><input type="hidden" name="tr.supplierId" value="<s:property value="tr.supplierId"/>">
          <input type="hidden" name="supplier.fullName" value="<s:property value="supplier.fullName"/>"/>
          <span><s:property value="supplier.fullName"/></span>&nbsp;
    </tr>
    <tr>
      <td align="right" height="30">订单号：</td>
      <td style="padding-left:7px;"><input type="hidden" id="orderId" name="tr.orderId" value="<s:property value="tr.orderId"/>">
          <span><s:property value="tr.orderId"/></span> </td>
    </tr>
    <tr>
      <td align="right" nowrap="nowrap" height="30">宣传和实物是否一致：</td>
      <td>
   		<div class="reviewGradeA"><label><input type="radio" id="product_5" value="5" name="tr.product" checked="checked">完全一致</label></div>
        <div class="reviewGradeBC"><label><input type="radio" id="product_2" value="2" name="tr.product">基本一致</label></div>
        <div class="reviewGradeBC"><label><input type="radio" id="product_0" value="0" name="tr.product">严重不符</label></div>
      </td>
    </tr>
    <tr>
      <td align="right" nowrap="nowrap" height="30">发货是否及时：</td>
      <td>
   		<div class="reviewGradeA"><label><input type="radio" id="delivery_5" value="5" name="tr.delivery" checked="checked">及时</label></div>
        <div class="reviewGradeBC"><label><input type="radio" id="delivery_2" value="2" name="tr.delivery">有点慢，影响不大</label></div>
        <div class="reviewGradeBC"><label><input type="radio" id="delivery_0" value="0" name="tr.delivery">拖延</label></div>
      </td>
    </tr>
    <tr>
      <td align="right" nowrap="nowrap" height="30">服务态度是否令人满意：</td>
      <td>
        <div class="reviewGradeA"><label><input type="radio" id="communication_5" value="5" name="tr.communication" checked="checked">满意</label></div>
        <div class="reviewGradeBC"><label><input type="radio" id="communication_2" value="2" name="tr.communication">一般</label></div>
        <div class="reviewGradeBC"><label><input type="radio" id="communication_0" value="0" name="tr.communication">不满意</label></div>
      </td>
    </tr>
    <tr>
      <td align="right" height="130">评语和说明：</td>
      <td style="padding-left:7px;"><textarea rows="5" cols="50" id="remark" name="tr.remark"></textarea></td>
    </tr>
    <tr>
    	<td colspan="2" align="center" height="30">
    		<a id="submit" href="javascript:void(0);" ><img style="border: 0px;" src="${pageContext.request.contextPath }/image/tjpl.gif" /></a>
    	</td>
    </tr>
  </tbody></table>
  <s:hidden name="tr.buyerId"></s:hidden>
  <s:hidden name="tr.buyerName"></s:hidden>
  <s:hidden name="tr.buyerIp"></s:hidden>
  </s:form>
  </s:if>
  <s:elseif test="reviewed == 1">
  	<center><h1>对同一订单只能评价一次</h1></center>
  </s:elseif>
  <s:elseif test="reviewed == 2">
  	<center><h1>自己不能对自己评价</h1></center>
  </s:elseif>