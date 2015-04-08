<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List"  %>
<%@ page import="com.bornsoft.asn.bean.discount.Discount"  %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String cp= request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看供应商参与活动详细信息</title>
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

</script>
</head>
<body>

<form action="../discount/listAdminSupplierJoinInfo?activityId=<s:property value="discount.activityId"/>" method="post" name="myform" id="myform">
<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">查看供应商参与活动详细列表</td>
   	</tr>  
	
	<tr>
		<td>
			<table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="margin-bottom:10px;">
				<tr>
					<td align="left" height="40" style="font-size:24px;border-bottom:1px solid #999999;"><strong><s:property value="discount.discountName"/></strong></td>		
				</tr>
				<tr>
					<td height="25" style="border-bottom:1px solid #999999;">活动时间：<strong><font color="red"><s:property value="discount.beginTime"/></font> 至 <font color="red"><s:property value="discount.endTime"/></font></strong></td>
				</tr>
				<tr>
					<td height="25" style="border-bottom:1px solid #999999;">折扣公式：<s:property value="discount.discountType"/></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="50%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="60%" class="color_h">
            	名称<input type="text" name="discountbean.discountName" value="<s:property value="#request.discountbean.discountName"/>">
		  	</td>
            <td width="20%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listAdminSupplierJoinInfo?pageType=sub&activityId=<s:property value="discount.activityId"/>';myform.submit();" style="cursor:pointer;" /></td>
          	<td width="20%"  align="right"><input type="button" value="返回列表" class="sm-buttom4" onclick="window.history.go(-1)"></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr class="head">
		<td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>			
					<td height="28" bgcolor="#e8f5fb"><label><input type="checkbox" name="allSelect" id="allSelect" onclick="checkAll(this)" class="cbborder"></input>编号</label></td>
					<td align="center" bgcolor="#e8f5fb" width="200">供应商名称</td>
					<td align="center" bgcolor="#e8f5fb" width="400">参与产品</td>	
  					</tr>
  
				   <% int i=0; %>
				  <s:iterator value="list" >
				  	<tr class="<%=(i%2==0)?"row":"altRow"%>" >
					<td height="50" width="60"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<s:property value="supplierId" />"><s:property value="supplierId" /></label></td>
					<td width="280" style="padding:0 10px;">
						<a href="<%=cp%>/admin/supplier/getSupplierById?id=<s:property value="supplierId" />"><s:property value="fullName" /></a></td>
					<td style="padding:0 10px;">		
						<s:iterator value="productlist"><s:property value="productName" />、	</s:iterator>		
					</td>
				  </tr>
				  <% i++; %>
				  </s:iterator>
			</table>
		</td>
	</tr>
</table>


<table width="790" align="center" border="0" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
	<s:property value="#request.pageBar" escape="false"/>
</table>	

</form>
</body>
</html>