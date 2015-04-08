<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存记录</title>
<link rel="stylesheet" href="../../css/hzx/ui.datepicker.css" type="text/css" media="screen"  charset="utf-8" />
	<style type="text/css">
		.sl{
			width:120px;
			white-space:nowrap;
			text-overflow:ellipsis; 
			overflow: hidden;
		}
		.color_g{ color:#0f6ce5; text-align:center; font-size:12px;}
		.color_g2{ color:#0048a3;  text-align:center; font-size:12px;}
		.wz-18b{ color:#112482; font-size:18px; text-align:center; padding-left:15px;}
			

		table.list tr.head{
		  background-color:#e8f5fb;
		}
		table.list td.head{
		  background-color:#000000;
		}
		table.list tr.row td{
		  background-color:#ffffff;
		}
		table.list tr.altRow td{background-color: #f3f8fb;}
		libiaobg{background:#e8f5fb; border-top:1px solid #cee2ec; height:20px; border-right:1px solid #e7e7e7; color:#112482; text-align:center;}
	</style>
<script type="text/javascript">
</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td> 
			<td width="737">
			库存变更记录
			</td>
		</tr>
	</table>
	<br />
	<div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
			<tr>
				<td width="60">单据号：</td>
				<td width="250"><s:property value="storageInOut.billNum"></s:property>&nbsp;</td>
				<td width="60">单据时间：</td>
				<td><s:date name="storageInOut.billTime" format="yyyy-MM-dd"></s:date>&nbsp;</td>
			</tr>
		</table>
	</div>
	<br />
	<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="20%">商品图片</td>
					<td class="libiaobg" nowrap width="20%">商品名称</td>
					<s:if test='storageInOut.billType=="I"'>
						<td class="libiaobg" nowrap width="20%">新增库存数量</td>
					</s:if>
					<s:elseif test='storageInOut.billType=="S"'>
						<td class="libiaobg" nowrap width="20%">减小库存数量</td>
					</s:elseif>
					<s:elseif test='storageInOut.billType=="O"'>
						<td class="libiaobg" nowrap width="20%">订单出库数量</td>
					</s:elseif>
					<s:elseif test='storageInOut.billType=="U"'>
						<td class="libiaobg" nowrap width="20%">产品数量修改为</td>
					</s:elseif>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listStorageInOutDetail" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td class="zuo"><div id="spic"><a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'></a></div></td>
						<td class="zuo"><s:property value="#item.productName"></s:property></td>
						<td class="zuo"><s:property value="#item.billAmount"></s:property></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator> 
			</table>
	</div>
		
	
	
</body>
</html>