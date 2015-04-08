<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.service.idmaker.IdMakerService"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%> 
<%
	String cp=request.getContextPath();
	// Get a new id
	long id=IdMakerService.newId("activityId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加 优惠活动</title>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<script type="text/javascript">
//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"discountbean.discountName:活动名称|required",
		"discountbean.beginDate:活动开始日期|required",
		"discountbean.endDate:活动结束日期|required",		
		"discountbean.beginDate|mask|discountbean.beginDate_mask",
		"discountbean.endDate|mask|discountbean.endDate_mask",
		"discountbean.beginDate:活动开始日期|date",
		"discountbean.endDate:活动结束日期|date",
		
		"discountbean.beginTime:活动具体开始时间|required",
		"discountbean.endTime:活动具体结束时间|required",
		//"discountbean.beginTime:活动具体开始时间|date",
		//"discountbean.endTime:活动具体结束时间|date",
		"discountbean.beginTime|mask|discountbean.beginTime_mask",
		"discountbean.endTime|mask|discountbean.endTime_mask",
		"discountbean.discountType:折扣|required"	
		
	);
	// 遮罩规则的详细定义
	yav.addMask('discountbean.beginDate_mask', '    .  .  ', '1234567890');
	yav.addMask('discountbean.endDate_mask', '    .  .  ', '1234567890');
	yav.addMask('discountbean.beginTime_mask', '  :  ', '1234567890');
	yav.addMask('discountbean.endTime_mask', '  :  ', '1234567890');
	// 输入提示
	yav.addHelp("discountbean.beginDate", "例如：2010年5月13日输入20100513");
	yav.addHelp("discountbean.endDate", "例如：2010年5月13日输入20100513");
	yav.addHelp("discountbean.beginTime", "例如：12点整输入12:00");
	yav.addHelp("discountbean.endTime", "例如：12点整输入12:00");
	// 输入时验证
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
});
</script>

		<table align="center" width="790" cellpadding="0" cellspacing="0">
		<tr>
			<td height="39" class="title">新增折扣活动</td>			
		</tr>
		</table>
		
          
          <form action="../discount/insertAdminDiscount" method="post" name="form1" id="form1">
          <input type="hidden" name="discountbean.activityId" id="activityId" value="<%=id %>">
          <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>活动名称：</td>
	            <td>&nbsp;<input name="discountbean.discountName" type="text" id="discountName" size="50" /><span id="errorsDiv_discountbean.discountName"></span></td>          	
			</tr>
			<tr>
				<td height="40" align="right"><font color="red">*</font>开始日期：</td>
	            <td>&nbsp;<input name="discountbean.beginDate" type="text" id="beginDate" />时间
                  	  <input name="discountbean.beginTime" type="text" id="beginTime" size="10" />(时间如：15:30)
                      <span id="errorsDiv_discountbean.beginDate"></span>
                      <span id="errorsDiv_discountbean.beginTime"></span></td>          	
			</tr>
			<tr>
				<td height="40" align="right"><font color="red">*</font>结束时间：</td>
	            <td>&nbsp;<input name="discountbean.endDate" type="text" id="endDate"/>时间
                  	  <input name="discountbean.endTime" type="text" id="endTime" size="10" />(时间如：15:30)
                  	  <span id="errorsDiv_discountbean.endDate"></span>
                  	  <span id="errorsDiv_discountbean.endTime"></span></td>          	
			</tr>
			<tr>
				<td height="150" align="right"><font color="red">*</font>折 扣：</td>
	            <td>&nbsp;
	        		<table> 
	        			<tr>
	        				<td><textarea cols="40" rows="5" name="discountbean.discountType" id="discountType"></textarea><br><span id="errorsDiv_discountbean.discountType"></span></td>
	        				<td>( <font color="red">规定x代表原价，y代表件数。<br>九折的折扣算式：x*0.9*y; <br>八五折的折扣算式：x*0.85*y; <br>买二送一的折扣算式：var y2=(y>=2)?y*2/3 : y; x*y</font> )</td>
	        			</tr>
	        		</table>   
	            </td>          	
			</tr>
			
		</table>
		
		<table align="center" width="790"cellpadding="0" cellspacing="0" >		
		<tr>			
            <td height="50" align="center"><input type="submit" class="sm-submit8" value="填写OK了，请提交">
            <input type="button" value="返回" class="sm-submit2"  onclick="window.location.href='../discount/listAdminDiscount'" />&nbsp;
	              <font color="red"><strong><%= request.getAttribute("discount_msg") == null?"":request.getAttribute("discount_msg") %></strong></font>
            </td>          	
		</tr>		
		</table>
           
</form>
