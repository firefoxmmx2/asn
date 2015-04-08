<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"  %>
<%@ page import="com.bornsoft.asn.bean.discount.Discount"  %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>已参与优惠活动列表</title>

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

function delActivity(){
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
	if(value == ""){
		alert("请选择需要退出的活动！");
	}else{
		if(confirm("确定退出该活动!")){
			location.href="../discount/delselfDiscount?discountIdset="+value;
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

<form action="../discount/listSelfDiscount" method="post" name="myform" id="myform">
<input type="hidden" name="supplierActivity" id="supplierActivity" value="<%=request.getAttribute("supplierActivity") %>">
<input type="hidden" name="getDate" id="getDate" value="<%=request.getAttribute("getDate") %>">
<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">所有折扣活动列表</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="85%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70%" class="color_h">
            	名称<input type="text" name="discountbean.discountName" value="<s:property value="#request.discountbean.discountName"/>">
		  	开始日期<input type="text" name="discountbean.beginDate" id="beginDate" size="10" value="<s:property value="#request.discountbean.beginDate"/>">
		  	结束日期<input type="text" name="discountbean.endDate" id="endDate" size="10" value="<s:property value="#request.discountbean.endDate"/>">
		  	</td>
            <td width="10%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listSelfDiscount?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>
          	<td width="20%" align="right">[ <a href="../discount/listDiscount?supplierActivity=supplier">查看全部的活动</a> ]
	</td>
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
						<td align="center" bgcolor="#e8f5fb">参与产品</td>
						<td align="center" bgcolor="#e8f5fb">操作</td>
                  </tr>
				 
				  <s:iterator value="list" >
				  <tr >
						<td  height="50" width="55"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<s:property value="activityId" />"><s:property value="activityId" /></label></td>
						<td style="padding:0 10px;">
							<a href="../discount/toJoinDiscount?activityId=<s:property value="activityId" />&type=self" target="_blank"><s:property value="discountName" /></a>
						</td>
						<td align="center" width="130"><s:property value="beginTime" /></td>	
						<td align="center" width="130"><s:property value="endTime" /></td>
						<td style="padding:0 10px;">		
							<s:iterator value="productlist"><s:property value="productName" />、	</s:iterator>		
						</td>
						<td align="center" width="70"><input type="button" value="修改" class="sm-buttom2-2" onclick="location.href='../discount/toJoinDiscount?activityId=<s:property value="activityId" />&type=self'"></td>
					  </tr>
				 	</s:iterator>
					</table>
					
					<table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
						<tr>
							<td align="left">
								<input type="button" value="退出活动" onClick="delActivity()" class="sm-buttom4-2" >
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
</body>
</html>