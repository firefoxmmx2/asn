<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<%@page import="java.text.SimpleDateFormat" %>

<SCRIPT src="<%=request.getContextPath()%>/js/datetime2.js"></SCRIPT>
<style>
<!--
	.customerChange1{background:url('<%=request.getContextPath()%>/image/hzx/change2.gif') no-repeat center;color:#333333;font-size:12px;font-weight:700;}
	.customerChange2{background:url('<%=request.getContextPath()%>/image/hzx/change1.gif') no-repeat center;color:#333333;font-size:12px;}
	.cus-border{border-bottom:1px #b5ceed solid;}
-->
</style>
	
	<% 
		List list = (List)request.getAttribute("list"); 
		String statisticsType = (String)request.getAttribute("statisticsType");
		if(statisticsType == null){statisticsType="product";}
	%>
	
	<table align="center" width="792" height="39" cellpadding="0" cellspacing="0">
	   	<tr>
	         <td height="39" class="title">产品分类销售排行榜</td>
	   	</tr> 
	</table>    
	
	
	<form action="<%=request.getContextPath()%>/do/customer/statistics/productSaleTop" method="post" name="myform">
	<input type="hidden" name="statisticsType" id="statisticsType" value="<%=statisticsType%>" />
	<table class="boder_y" width="792" height="51" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="51"><table width="500">
					<% if(statisticsType.equals("product")){ %>
					<tr>
						<td align="right" height="28" width="100">产品名称：</td>
						<td colspan="3"><input type="text" name="productName" id="productName" value="<s:property value="#request.productName" />" size="40"></td>					
					</tr>
					<% }else{ %>
					<tr>
						<td align="right" height="28" width="100">产品类型名称：</td>
						<td colspan="3"><input type="text" name="productTypeName" id="productTypeName" value="<s:property value="#request.productTypeName" />" size="40"></td>					
					</tr>					
					<% } %>
					<tr>
						<td align="right" height="28" width="100">时间范围：</td>
						<td width="300">
							从<input type="text" name="startTime" id="startTime" readonly="readonly" value="<s:property value="#request.startTime" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd');">&nbsp;到&nbsp;
							  <input type="text" name="endTime" id="endTime" readonly="readonly" value="<s:property value="#request.endTime" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd');">								
						</td>
						<td align="center" width="100">
						<img src="<%=request.getContextPath()%>/image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='productSaleTop';myform.submit();" style="cursor:pointer;" /></td>					
					</tr>
				</table>			
			</td>
		</tr>	
	</table>
	
	<table width="792" border="0" cellspacing="0" height="33" cellpadding="0" style="margin-top:20px;background: url('<%=request.getContextPath()%>/image/hzx/change_bg.gif') repeat-x;" >
			<tr>
				<td width="20">&nbsp;</td>
				<td class="<%=statisticsType.equals("product")?"customerChange1":"customerChange2" %>" align="center" width="127"><a href="<%=request.getContextPath()%>/do/customer/statistics/productSaleTop?statisticsType=product">按产品统计</a></td>
				<td class="<%=statisticsType.equals("product")?"customerChange2":"customerChange1" %>" align="center" width="127"><a href="<%=request.getContextPath()%>/do/customer/statistics/productSaleTop?statisticsType=classify">按分类统计</a></td>
				<td width="518">&nbsp;</td>
			</tr>
	</table>
	<%if(statisticsType.equals("product")){ %>
	<table width="792" border="0" cellspacing="0" cellpadding="0" style="margin:0px;">
		<tr>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder"></input>序号</td>
			<td height="28" width="500" align="left" bgcolor="#e8f5fb"><strong>产品名称</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>销售数量</strong></td>
			<td height="28" width="92" align="center" bgcolor="#e8f5fb"><strong>单位</strong></td>
        </tr>
        
        <%for(int i=0; i<list.size(); i++){
        	Map<String,Object> m = new HashMap<String,Object>();	
        	m = (Map)list.get(i);
       %>        
        <tr bgcolor="<%=i%2==0?"":"#e8f5fb" %>">
        	<td height="28" align="center"><%=m.get("productId") %></td>
			<td height="28"><a target="_blank" href="<%=request.getContextPath()%>#"><%=m.get("productName") %></a></td>
			<td height="28" align="center"><font color="#ff6300"><%=m.get("amount") %></font></td>
			<td height="28" align="center"><%=m.get("unit") %></td>	
        </tr>
        <% } %>
	</table>
	<% }else{ %>
    <table width="792" border="0" cellspacing="0" cellpadding="0" style="margin:0px;">
		<tr>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder"></input>序号</td>
			<td height="28" width="500" align="left" bgcolor="#e8f5fb"><strong>产品类别</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>销售数量</strong></td>
        </tr>
        
        <%for(int i=0; i<list.size(); i++){
        	Map<String,Object> m = new HashMap<String,Object>();	
        	m = (Map)list.get(i);
       %>        
        <tr bgcolor="<%=i%2==0?"":"#e8f5fb" %>">
        	<td height="28" align="center"><%=m.get("ptId") %></td>
			<td height="28"><font color="#0E3157"><%=m.get("productTypeName").toString().trim()%></font>&nbsp;<font color="#333333">[<%=m.get("parentName") %>]</font></td>
			<td height="28" align="center"><font color="#ff6300"><%=m.get("amount") %></font></td>
        </tr>
        <% } %>
	</table>    
        
    <% } %>
	
	<table width="790" height="40" border="0" cellspacing="1" cellpadding="2" style="border-top: 1px #B5CEED solid;">
			<s:property value="#request.pageBar" escape="false"/>
	</table>
	</form>