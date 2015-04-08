<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>

<% String cp = request.getContextPath(); %>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<style>
<!--
	.customerChange1{background:url('<%=request.getContextPath()%>/image/hzx/change2.gif') no-repeat center;color:#333333;font-size:12px;font-weight:700;}
	.customerChange2{background:url('<%=request.getContextPath()%>/image/hzx/change1.gif') no-repeat center;color:#333333;font-size:12px;}
	.cus-border{border-bottom:1px #b5ceed solid;}
-->
</style>

<script type="text/javascript">
<!--
//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(		
		"orderCountDown:订单数量|numeric",
		"orderCountDown|mask|orderCountDown_mask",	
		"orderCountUp:订单数量|numeric",
		"orderCountUp|mask|orderCountUp_mask",	
		"orderMoneyDown:订单金额|numeric",
		"orderMoneyDown|mask|orderMoneyDown_mask",	
		"orderMoneyUp:订单金额|numeric",
		"orderMoneyUp|mask|orderMoneyUp_mask"		
	);
	// 遮罩规则的详细定义
	yav.addMask('orderCountDown_mask', '            ', '1234567890');	
	yav.addMask('orderCountUp_mask', '            ', '1234567890');	
	yav.addMask('orderMoneyDown_mask', '            ', '1234567890');	
	yav.addMask('orderMoneyUp_mask', '            ', '1234567890');	
	// 输入提示
	yav.addHelp("orderCountDown", "请输入数字");
	yav.addHelp("orderCountUp", "请输入数字");
	yav.addHelp("orderMoneyDown", "请输入数字");
	yav.addHelp("orderMoneyUp", "请输入数字");
	// 输入时验证
	yav.init('myform', rules);
	// 提交前验证
	$("#myform").submit(function () {
		return yav.performCheck("myform", rules, "inline");  // classic 或者 inline
	});
});

//-->
</script>

	
	<% 
		List list = (List)request.getAttribute("list"); 
		String statisticsType = (String)request.getAttribute("statisticsType");
		if(statisticsType == null){statisticsType="order";}
	%>
	
	<table align="center" width="792" height="39" cellpadding="0" cellspacing="0">
	   	<tr>
	         <td height="39" class="title">客户消费排行榜</td>
	   	</tr> 
	</table>     
	
	<form action="<%=request.getContextPath()%>/do/customer/statistics/consumerTop" method="post" name="myform" id="myform">
	<input type="hidden" name="statisticsType" id="statisticsType" value="<%=statisticsType%>" />
	<table class="boder_y" width="792" height="51" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="51"><table>
					<tr>
						<%if(statisticsType.equals("order")){ %>
						<td align="right" width="100">订单数：</td>
						<td>
							<input type="text" name="orderCountDown" id="orderCountDown" maxlength="5" size="8" value="<s:property value="#request.orderCountDown" />">&nbsp;-&nbsp;
							<input type="text" name="orderCountUp" id="orderCountUp" maxlength="5" size="8" value="<s:property value="#request.orderCountUp" />">
						</td>
						<%}else{ %>
						<td align="right" width="100">订单金额：</td> 
						<td>
							<input type="text" name="orderMoneyDown" id="orderMoneyDown" maxlength="10" size="10" value="<s:property value="#request.orderMoneyDown" />">&nbsp;-&nbsp;
							<input type="text" name="orderMoneyUp" id="orderMoneyUp" maxlength="10" size="10" value="<s:property value="#request.orderMoneyUp" />">
						</td>
						<%} %>
						<td align="center" width="100">
						<input type="submit" value=" " style="border:0; background:url('<%=request.getContextPath()%>/image/comdo/button_qd.gif') no-repeat center;cursor:pointer; width:50px;height:25px;">
							<!-- <img src="<%=request.getContextPath()%>/image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='consumerTop';myform.submit();" style="cursor:pointer;" />
							 -->
						</td>
						<td>
							<span id="errorsDiv_orderCountDown"></span>
							<span id="errorsDiv_orderCountUp"></span>
							<span id="errorsDiv_orderMoneyDown"></span>
							<span id="errorsDiv_orderMoneyUp"></span>
						</td>
					</tr>
				</table>
			</td>
		</tr>	
	</table>
	
	<table width="792" border="0" cellspacing="0" height="33" cellpadding="0" style="margin-top:20px;background: url('<%=request.getContextPath()%>/image/hzx/change_bg.gif') repeat-x;" >
			<tr>
				<td width="20">&nbsp;</td>
				<td class="<%=statisticsType.equals("money")?"customerChange2":"customerChange1" %>" align="center" width="127"><a href="<%=request.getContextPath()%>/do/customer/statistics/consumerTop?statisticsType=order">按订单数</a></td>
				<td class="<%=statisticsType.equals("money")?"customerChange1":"customerChange2" %>" align="center" width="127"><a href="<%=request.getContextPath()%>/do/customer/statistics/consumerTop?statisticsType=money">按订单金额</a></td>
				<td width="518">&nbsp;</td>
			</tr>
	</table>
	<table width="792" border="0" cellspacing="0" cellpadding="0" style="margin:0px;">
		<tr>
            <td height="28" width="100" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder"></input>序号</td>
			<td height="28" width="500" align="left" bgcolor="#e8f5fb"><strong>客户姓名</strong></td>
			<td height="28" width="192" align="center" bgcolor="#e8f5fb">
				<strong><%=statisticsType.equals("money")?"订单总额（元）":"订单总数" %></strong>			
			</td>
        </tr>
        
        <%for(int i=0; i<list.size(); i++){
        	Map<String,Object> m = new HashMap<String,Object>();	
        	m = (Map)list.get(i);
       %>        
        <tr bgcolor="<%=i%2==0?"":"#e8f5fb"%>">
            <td height="28" align="center"><%=m.get("memberId") %></td>
			<td height="28"><a target="_blank" href="<%=request.getContextPath()%>/do/member/getMemberById?id=<%=m.get("memberId")%>"><%=m.get("fullName") %></a></td>
			<td height="28" align="center"><%=statisticsType.equals("money")?Calculator.keepTwoDecimal(Float.parseFloat(m.get("amount").toString())):m.get("amount") %></td>			
        </tr>
        <% } %>
	
	</table>
	
	<table width="790" height="40" border="0" cellspacing="1" cellpadding="2" style="border-top: 1px #B5CEED solid;">
			<s:property value="#request.pageBar" escape="false"/>
	</table>
	</form>