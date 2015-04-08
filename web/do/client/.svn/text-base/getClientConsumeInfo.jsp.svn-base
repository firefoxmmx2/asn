<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.client.TraceMessage" %>
<%@ page import="com.bornsoft.asn.bean.order.Order" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="s" uri="/struts-tags" %>


<%

String cp=request.getContextPath();
String createTime=null,operatorTime=null;
class Locafunction{
		public String prop(Object key){
			return PropertyFactory.getProperty("member.properties", key.toString());
		}
		public String n2s(Object obj){
			return obj==null?"&nbsp;":obj.toString();
		}
	}
	List<Order> list=(List<Order>)request.getAttribute("orderList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
<!-- <link href="../../css/main.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
-->
<link type="text/css" href="../../css/jquilib/themes/base/jquery.ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<SCRIPT src="<%=cp%>/js/datetime2.js"></SCRIPT>
<script type="text/javascript">
//$(document).ready(function() {
	//$("#startTime").datepicker();
//	$("#startTime").datepicker("option", {dateFormat:"yy-mm-dd"});
	//$("#endTime").datepicker();
//	$("#endTime").datepicker("option", {dateFormat:"yy-mm-dd"});
//	$("#startTime").attr("value","${requestScope.Order.createTime}");
	//$("#endTime").attr("value","${requestScope.Order.createTime}");
//});

function sel()
{
	document.form1.action="<%=cp%>/do/client/getClientConsumeInfo";
	document.form1.submit();
}
</script>
<style type="text/css">
	.str_hidden {
	overflow: hidden;
	width: 180px;
	word-wrap: normal;
	display: block;
	white-space: nowrap;
	-o-text-overflow: ellipsis; /* opera */
	text-overflow: ellipsis; /* ie, safari (webkit) */
	-moz-binding: url '../../../css/ellipsis.xml#ellipsis'; /* firefox */ 
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jqellipsis.js"></script>
<script type="text/javascript">
	$(function()
	{
		$('.str_hidden').ellipsis();
	});
</script>
</head>
<body>
	<form id="form1" name="form1" method="post"> 
	<table align="center" width="100%" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">客户消费信息管理</td>
   	</tr>  
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:0px;" class="table_border">
				   <tr>
				   		<td colspan="8">联系人:
				   		  <input name="drawerName" type="text" id="drawerName" value="<%=request.getAttribute("drawerName")==null?"":request.getAttribute("drawerName")%>">
			   		   &nbsp;&nbsp;
			   		   下单时间:
			   		   <input type="text" name="startTime" id="startTime" size="10" onClick="SelectDate(this,'yyyy-MM-dd');" value="<%=request.getAttribute("startTime")==null?"":request.getAttribute("startTime")%>">
			   		   -
			   		   <input type="text" name="endTime" id="endTime" size="10" onClick="SelectDate(this,'yyyy-MM-dd');" value="<%=request.getAttribute("endTime")==null?"":request.getAttribute("endTime")%>">
			   		   <label>
			   		   <input type="button" name="Submit2" value="搜索" onClick="sel();">
			   		   </label></td>
				   </tr>
                   <tr>
               	  	 <td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">联系人</td>
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">联系方式</td>					
						<td align="center" bgcolor="#e8f5fb" nowrap="nowrap">地址</td>
						<td height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">下单时间</td>
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">修改时间</td> 
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">运费</td>  
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">总金额</td> 
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">留言</td>                  
                  </tr>
				  <%
				  
				  if(list!=null)
				  {
				  	  String SpecialExplain=null;
				  	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					  for(int i=0; i<list.size(); i++){
						  Order order=list.get(i);	
						  if(order.getOperatorTime()!=null)
						  {operatorTime=String.valueOf(sdf.format(order.getOperatorTime()));
						  operatorTime=operatorTime.substring(0,10);}
						  else{operatorTime="";}
						  if(String.valueOf(order.getCreateTime())!=null)
						 {createTime=String.valueOf(sdf.format(order.getCreateTime()));
						 createTime=createTime.substring(0,10);
						 }
						  else{createTime="";}
						  if(order.getSpecialExplain()==null)
						  {SpecialExplain="";}
						  else
						  {SpecialExplain=order.getSpecialExplain();}
				%>
			  	<tr>
				  	<td height="40" >&nbsp;<a href="<%=cp%>/do/member/getMemberById?id=<%=order.getMemberId() %>"><%=order.getDrawerName() %></a></td>
					<td align="center">&nbsp;<%=order.getDrawerNumber() %></td>
					<td ><div class="str_hidden" title="<%=order.getDetailAddress() %>"><%=order.getDetailAddress() %></div></td>
					<td >&nbsp;<%=createTime %></td>
					<td>&nbsp;<%=operatorTime %></td>
					<td>&nbsp;<%=order.getPostFee() %></td>
					<td>&nbsp;<%=order.getTotalAmount() %></td>
					<td>&nbsp;<%=SpecialExplain %></td>
		  		</tr>
				<%
					}}
				%>
		  </table>
		    <table width="790" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>


