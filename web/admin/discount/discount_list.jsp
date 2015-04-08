<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List"  %>
<%@ page import="com.bornsoft.asn.bean.discount.Discount"  %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>优惠活动列表</title>


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



<form action="../discount/listAdminDiscount" method="post" name="myform" id="myform">
	
	<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">折扣列表</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="85%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="80%" class="color_h">
            	名称<input type="text" name="discountbean.discountName" value="<s:property value="#request.discountbean.discountName"/>">
			  	开始日期<input type="text" name="discountbean.beginDate" id="beginDate" size="10" value="<s:property value="#request.discountbean.beginDate"/>">
			  	结束日期<input type="text" name="discountbean.endDate" id="endDate" size="10" value="<s:property value="#request.discountbean.endDate"/>">
		  	</td>
            <td width="20%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listAdminDiscount?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                   		<td height="28" align="center" bgcolor="#e8f5fb"><label><input type="checkbox" name="allSelect" id="allSelect" onclick="checkAll(this)" class="cbborder"></input>编号</label></td>
						<td align="center" bgcolor="#e8f5fb" width="200">活动名称</td>
						<td align="center" bgcolor="#e8f5fb">开始时间</td>
						<td align="center" bgcolor="#e8f5fb">结束时间</td>	
						<td align="center" bgcolor="#e8f5fb">折扣公式</td>
						<td align="center" bgcolor="#e8f5fb">操作</td>
                  </tr>
				 
				  	<% 
						List<Discount> list= (List<Discount>)request.getAttribute("discountList");
						if(list.size() >0){
							for(int i=0; i<list.size();i++){
								Discount d= list.get(i); 
					%>
					  <tr>
						<td height="40"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=d.getActivityId() %>"><%=d.getActivityId() %></label></td>
						<td>&nbsp;<a href="<%=cp%>/admin/discount/listAdminSupplierJoinInfo?activityId=<%=d.getActivityId() %>"><%=d.getDiscountName() %></a></td>
						<td align="center"><%=d.getBeginTime().toString().substring(0,16) %></td>	
						<td align="center"><%=d.getEndTime().toString().substring(0,16) %></td>
						<td>&nbsp;<%=d.getDiscountType() %></td>
						<td align="center">
							<input type="button" class="sm-buttom2-2" value="修改" onclick="location.href='<%=cp%>/admin/discount/toUpdateAdminDiscount?activityId=<%=d.getActivityId() %>'">
						</td>
					  </tr>
					  <% } 
						}
					  %>
					</table>
					
					<table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
						<tr>
							<td align="left">
								<input type="button" value="新增活动" onclick="window.location.href='../discount/discount_Admin_add.jsp'" class="sm-buttom4-2" >
								<input type="button" value="删除" onclick="operationDiscount()" class="sm-buttom2-2">
							</td>		
						</tr>
					</table>

					<table width="790" border="0" cellspacing="1" cellpadding="2" align="center">
						<s:property value="#request.pageBar" escape="false"/>
					</table>
		</td>
	</tr>
</table>

</form>
