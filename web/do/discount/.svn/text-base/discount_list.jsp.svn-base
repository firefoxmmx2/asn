<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List"  %>
<%@ page import="com.bornsoft.asn.bean.discount.Discount"  %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>优惠活动列表</title>

<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
<link type="text/css" href="../../css/jquilib/themes/base/jquery.ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript">
function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }
	}
}

$(document).ready(function() {
	$("#beginDate").datepicker();
	$("#beginDate").datepicker("option", {dateFormat:"yy-mm-dd"});
	$("#endDate").datepicker();
	$("#endDate").datepicker("option", {dateFormat:"yy-mm-dd"});
	$("#beginDate").attr("value","${requestScope.discountbean.beginDate}");
	$("#endDate").attr("value","${requestScope.discountbean.endDate}");
});

function operationDiscount(){
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
	if(confirm('你确定删除?')){
		location.href="../discount/delAdminDiscount?discountIdset="+value;
	}
}

</script>
</head>
<body>

<table width="98%" border="0" align="center" cellpadding="10" cellspacing="0">
	<tr><td height="2px" ></td></tr>
	<tr><td class="daohang" width="98%">折扣活动列表</td></tr>
</table>

<form action="../discount/listAdminDiscount" method="post" name="myform" id="myform">
<table class="list" width="98%" border="0" cellspacing="1" cellpadding="2" align="center">  
  <tr>
  	<td colspan="7">
  		<table class="list" width="550" border="0" cellspacing="0" cellpadding="2">
		  <tr>
		  	<td height="40">名称<input type="text" name="discountbean.discountName" value="<s:property value="#request.discountbean.discountName"/>">
		  	开始日期<input type="text" name="discountbean.beginDate" id="beginDate" size="10" value="<s:property value="#request.discountbean.beginDate"/>">
		  	结束日期<input type="text" name="discountbean.endDate" id="endDate" size="10" value="<s:property value="#request.discountbean.endDate"/>">
		  	<input type="submit" value="查 询" onClick="myform.action='listAdminDiscount?pageType=sub';myform.submit();"></td>
		  </tr>
	  	</table>
	</td>
  </tr>
  <tr class="head">
	<td class="libiaobg" nowrap><label><input type="checkbox" name="allSelect" id="allSelect" onclick="checkAll(this)" class="cbborder"></input>编号</label></td>
	<td class="libiaobg" nowrap width="200">活动名称</td>
	<td class="libiaobg" nowrap>开始时间</td>
	<td class="libiaobg" nowrap>结束时间</td>	
	<td class="libiaobg" nowrap>折扣公式</td>
	<td class="libiaobg" nowrap>操作</td>
  </tr>

<% 
	List<Discount> list= (List<Discount>)request.getAttribute("discountList");
	if(list.size() >0){
		for(int i=0; i<list.size();i++){
			Discount d= list.get(i); 
%>
  <tr class="<%=(i%2==0)?"row":"altRow"%>" >
	<td><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=d.getActivityId() %>"><%=d.getActivityId() %></label></td>
	<td class="zuo"><%=d.getDiscountName() %></td>
	<td class="zuo" nowrap><%=d.getBeginTime().toString().substring(0,16) %></td>	
	<td class="zuo" nowrap><%=d.getEndTime().toString().substring(0,16) %></td>
	<td class="zuo" nowrap><%=d.getDiscountType() %></td>
	<td class="zuo" nowrap>
		<a href="../discount/toUpdateAdminDiscount?activityId=<%=d.getActivityId() %>">修  改</a>
		<a href="../discount/listAdminSupplierJoinInfo?activityId=<%=d.getActivityId() %>">查看详细信息</a> 
	</td>
  </tr>
  <% } 
	}
  %>
</table>

<table width="98%" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
	<tr>
		<td align="left">
			<input type="button" value="新增活动" onclick="window.location.href='../discount/discount_Admin_add.jsp'" class="button5" >
			<input type="button" value="删除" onclick="operationDiscount()" class="button5">
		</td>		
	</tr>
</table>

<table width="98%" border="0" cellspacing="1" cellpadding="2">
	<s:property value="#request.pageBar" escape="false"/>
</table>	

</form>
</body>
</html>