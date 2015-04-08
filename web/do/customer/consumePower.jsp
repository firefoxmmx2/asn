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
	%>
	
	<table align="center" width="792" height="39" cellpadding="0" cellspacing="0">
	   	<tr>
	         <td height="39" class="title">客户消费能力变化分析</td>
	   	</tr> 
	</table>    
	
	
	<form action="<%=request.getContextPath()%>/do/customer/statistics/consumePower" method="post" name="myform">
	<table class="boder_y" width="792" height="51" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><table width="500">
					<tr>
						<td align="right" height="28" width="100">客户名称：</td>
						<td colspan="3"><input type="text" name="fullName" id="fullName" value="<s:property value="#request.fullName" />" size="40"></td>					
					</tr>
					<tr>
						<td align="right" height="28" width="100">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
						<td width="300">
							从<input type="text" name="startTime" id="startTime" readonly="readonly" value="<s:property value="#request.startTime" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd');">&nbsp;到&nbsp;
							  <input type="text" name="endTime" id="endTime" readonly="readonly" value="<s:property value="#request.endTime" />" size="15" onclick="SelectDate(this,'yyyy-MM-dd');">								
						</td>
						<td align="center" width="100">
						<img src="<%=request.getContextPath()%>/image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='consumePower';myform.submit();" style="cursor:pointer;" /></td>					
					</tr>
				</table>		
			</td>
		</tr>	
	</table>
	
	<table width="792" border="0" cellspacing="0" height="33" cellpadding="0" style="margin-top:20px;background: url('<%=request.getContextPath()%>/image/hzx/change_bg.gif') repeat-x;" >
			<tr>
				<td width="20">&nbsp;</td>
				<td class="customerChange1" align="center" width="127"><a href="<%=request.getContextPath()%>/do/customer/statistics/consumerTop?statisticsType=order">消费能力分析</a></td>
				<td width="518">&nbsp;</td>
			</tr>
	</table>
	<table width="792" border="0" cellspacing="0" cellpadding="0" style="margin:0px;">
		<tr>
            <td height="28" width="100" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder"></input>序号</td>
			<td height="28" width="300" align="left" bgcolor="#e8f5fb"><strong>客户姓名</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>订单编号</strong></td>
			<td height="28" width="100" align="center" bgcolor="#e8f5fb"><strong>订单金额</strong></td>
			<td height="28" width="192" align="center" bgcolor="#e8f5fb"><strong>下单时间</strong></td>
        </tr>
        
        <%for(int i=0; i<list.size(); i++){
        	Map<String,Object> m = new HashMap<String,Object>();	
        	m = (Map)list.get(i);
       %>        
        <tr bgcolor="<%=i%2==0?"":"#e8f5fb" %>">
            <td height="28" align="center"><%=m.get("memberId") %></td>
			<td height="28"><a target="_blank" href="<%=request.getContextPath()%>/do/member/getMemberById?id=<%=m.get("memberId")%>"><%=m.get("fullName") %></a></td>
			<td height="28" align="center"><%=m.get("orderId") %></td>
			<td height="28" align="center"><font color="#ff6300"><%=Calculator.keepTwoDecimal(Float.parseFloat(m.get("totalAmount").toString()))%></font></td>	
			<td height="28" align="center"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(m.get("createTime"))%></td>				
        </tr>
        <% } %>
	
	</table>
	
	<table width="790" height="40" border="0" cellspacing="1" cellpadding="2" style="border-top: 1px #B5CEED solid;">
			<s:property value="#request.pageBar" escape="false"/>
	</table>
	</form>