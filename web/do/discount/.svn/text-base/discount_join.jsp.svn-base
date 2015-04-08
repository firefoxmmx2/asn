<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.service.idmaker.IdMakerService"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%> 
<%@ page import="com.bornsoft.asn.bean.discount.Discount" %>
<%@ page import="com.bornsoft.asn.service.member.*" %>
<%
	String cp=request.getContextPath();
	// Get a new id
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>参与活动</title>
<style type="text/css">
<!--
.beijing_1 {
	background-image: url(../../image/blue_bg41b.gif);
	background-repeat: repeat-x;
	background-position: left top;
}
.beijing_2 {
	background-image: url(../../image/blue_bg41.gif);
	background-repeat: repeat;
	background-position: left top;
}
.table_border{ margin-top:15px;}
.table_border td{border-top:1px #517104 solid;border-right:1px #517104 solid;}
.table_border{border-bottom:1px #517104 solid;border-left:1px #517104 solid;}
.wz14{ color:#FFFFFF; font-size:12px; font-weight:bold; padding-right:10px; text-align:right;}
.wz_w{ color:#FFFFFF;font-weight:bold;}
-->
</style>
</head>
<body>

		  <% 
				Discount d = (Discount)request.getAttribute("discount"); 
				if( d == null) d= new Discount();
			%>
		  
		  <table align="center" width="790" height="40" cellpadding="0" cellspacing="0">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="785" class="sm-title" style="font-size:14px;">供应商参与活动</td>			
			</tr>
			</table>
          
          <form action="../discount/joinDiscount?type=<%=request.getParameter("type") %>" method="post" name="form1" id="form1">
          <input type="hidden" name="activityId" id="activityId" value="<%=d.getActivityId() %>">
          
          <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>
				<td height="40" width="100" align="right">活动名称：</td>
	            <td>&nbsp;<strong><%=d.getDiscountName() %></strong></td>          	
			</tr>
			<tr>
				<td height="40" width="100" align="right">活动时间：</td>
	            <td>&nbsp;
	            	<font color="red"><strong><%=d.getBeginTime().toString().substring(0,16) %></strong></font> 至 
                  	<font color="red"><strong><%=d.getEndTime().toString().substring(0,16) %></strong></font>
	            </td>          	
			</tr>
			<tr>
				<td height="40" width="100" align="right">供应商名称：</td>
	            <td>&nbsp;<%=MemberService.getMember(session).getFullName() %></td>          	
			</tr>
			<tr>
				<td height="40" width="100" align="right">活动描述：</td>
	            <td>&nbsp;<%=d.getDiscountType() %></td>          	
			</tr>
			<tr>
				<td width="100" align="right"><font color="red">*</font>选择参与产品：</td>
	            <td><table width="100%" cellpadding="0" cellspacing="0">
	            		<tr>
	            			<td width="80" align="center" valign="top" style="border-bottom:1px #cccccc solid;font-weight:700;color:#FF0000;">已参与产品：</td>
                    
	                  		<td style="border-bottom:1px #cccccc solid">
	                  			<s:iterator id="product" value="list">
	                  				<div style="width:110px;float:left;height:20px;"><label><input type="checkbox" name="productedId" value="<s:property value="productId" />" id="productedId" style="border:0px;" checked="checked" ><s:property value="productName" /></label></div>
	                  			</s:iterator>
                  			</td>
                  		</tr>
                  		
                  		<tr>
	            			<td width="80" align="center" valign="top"><font color="red"><strong>未参与产品：</strong></font></td>
	            			<td>
	            				<s:iterator id="product" value="listProduct">
			                  		<div style="width:190px;float:left;height:20px;"><label><input type="checkbox" name="productId" value="<s:property value="productId" />" id="productId" style="border:0px;">
				                  		<s:if test="%{null!=productName&&productName.length()>13}">
				                  			<s:property value="%{productName.substring(0, 13)}" />..
				                  		</s:if>
			                  			<s:else><s:property value="productName" /></s:else>
			                  		</label>
			                  		</div>
			                  	</s:iterator>
	            			</td>
	            		</tr>
                  	</table>
	            </td>          	
			</tr>
			
			</table>
          
          <table align="center" width="790"cellpadding="0" cellspacing="0" >		
			<tr>			
	            <td height="50" align="center"><input type="submit" class="sm-submit8" value="我要参与活动">
	            <input type="button" value="返回" class="sm-submit2"  onclick="window.history.go(-1)" />&nbsp;
		        <font color="red"><strong><%= request.getAttribute("discount_msg") == null?"":request.getAttribute("discount_msg") %></strong></font>
	            </td>          	
			</tr>		
			</table>
          </form>


</body>
</html>





