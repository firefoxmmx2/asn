<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.report.*" %>
<%@page import="com.bornsoft.asn.vo.ReportMemberBean" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>


<%String cp=request.getContextPath();%>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<SCRIPT src="<%=cp%>/js/datetime2.js"></SCRIPT>

<link href="../../css/comdo.css" rel="stylesheet" type="text/css" />
<%
	String inAccountMoney=(String)request.getAttribute("inAccountMoney");
	if(inAccountMoney==null||inAccountMoney.equals("null")){inAccountMoney="0";}
	String outAccountMoney=(String)request.getAttribute("outAccountMoney");
	if(outAccountMoney==null||outAccountMoney.equals("null")){outAccountMoney="0";}
	String unOutAccountMoney=(String)request.getAttribute("unOutAccountMoney");
	if(unOutAccountMoney==null||unOutAccountMoney.equals("null")){unOutAccountMoney="0";}
	double commision;
	String strCommision = "";
	if((String)request.getAttribute("commision")!=null)
	{
		commision=Double.parseDouble((String)request.getAttribute("commision"));
		commision=commision*0.03;
		strCommision = Calculator.keepTwoDecimal(commision);
	}
	else{commision=0;}
	String unPayedOrders=(String)request.getAttribute("unPayedOrders");
	String payedOrders=(String)request.getAttribute("payedOrders");
	String yfhOrders=(String)request.getAttribute("yfhOrders");
	String yqxOrders=(String)request.getAttribute("yqxOrders");
	String ygbOrders=(String)request.getAttribute("ygbOrders");
	String jycOrders=(String)request.getAttribute("jycOrders");
	String immediatelyOrders=(String)request.getAttribute("immediatelyOrders");
	String assureOrders=(String)request.getAttribute("assureOrders");
	String payedAssureOrders=(String)request.getAttribute("payedAssureOrders");
	String unPayedAssureOrders=(String)request.getAttribute("unPayedAssureOrders");
%>


<style type="text/css">
<!--
.STYLE4 {
	font-size: 16px;
	font-weight: bold;
}
.STYLE5 {
	font-size: 18px;
	font-weight: bold;
}
.STYLE8 {font-size: 18px; font-weight: bold; color: #003366; }
.STYLE10 {font-size: 18px; font-weight: bold; color: #FF0000; }
-->
</style>

<script type="text/javascript">
	function sel()
	{
		document.form1.action="<%=cp%>/admin/report/getReportDetail";
		document.form1.submit();
	}
</script>

<body>
<form id="form1" name="form1" method="post">
<table width=792 border="0" cellspacing="0" cellpadding="0" class="table_border" style="margin-top:0px;">
   <tr>
   		<td height="30"><span class="STYLE8">订单统计详情</span></td>
   </tr>
   <tr>
   		<td>日期:
   		  <input type="text" name="startTime" id="startTime" size="10" onClick="SelectDate(this,'yyyy-MM-dd');" value="<%=request.getAttribute("startTime")==null?"":request.getAttribute("startTime")%>" readonly="true">
   		  -
   		  <input type="text" name="endTime" id="endTime" size="10" onClick="SelectDate(this,'yyyy-MM-dd');" value="<%=request.getAttribute("endTime")==null?"":request.getAttribute("endTime")%>" readonly="true">
   		  <label>
   		  <input type="button" name="Submit" value="查询" onClick="sel();">
	  </label></td>
   </tr>
</table>
<table width=792 border="0" cellspacing="0" cellpadding="0" class="table_border" style="margin-top:0px;">
	<tr>
		<td colspan="4" height="25" bgcolor="#e8f5fb"><span class="STYLE8">订单金额统计</span></td>
	</tr>
	<tr>
		<td width="115">到账金额:</td>
		<td width="267"><%=inAccountMoney%>元</td>
		<td width="112">已支出金额:</td>
		<td width="296"><%=outAccountMoney%>元</td>
	</tr>
	<tr>
		<td>应支出金额:</td>
		<td><%=unOutAccountMoney%>元</td>
		<td>佣金:</td>
		<td><%=strCommision%>元</td>
	</tr>
</table>
<table width=792 border="0" cellspacing="0" cellpadding="0" class="table_border" style="margin-top:0px;">
	<tr>
		<td height="25" colspan="4" bgcolor="#e8f5fb"><span class="STYLE8">订单数统计</span></td>
	</tr>
	<tr>
		<td width="116">未付款订单数:</td>
		<td width="268"><%=unPayedOrders%></td>
		<td width="110">已付款订单数</td>
		<td width="296"><%=payedOrders%></td>
	</tr>
	<tr>
		<td>已发货订单数</td>
		<td><%=yfhOrders%></td>
		<td>已取消订单数</td>
		<td><%=yqxOrders%></td>
	</tr>
	<tr>
		<td>交易关闭订单数:</td>
		<td><%=ygbOrders%></td>
		<td>交易成功订单数</td>
		<td><%=jycOrders%>&nbsp;</td>
	</tr>
</table>
<table width=792 border="0" cellspacing="0" cellpadding="0" class="table_border" style="margin-top:0px;">
	<tr>
		<td height="25" colspan="4" bgcolor="#e8f5fb"><span class="STYLE8">按订单类型统计</span></td>
	</tr>
	<tr>
		<td width="115">即时订单数:</td>
		<td width="268"><%=immediatelyOrders%></td>
		<td width="111">担保订单数:</td>
		<td width="296"><%=assureOrders%></td>
	</tr>
	<tr>
		<td>已划账担保订单数:</td>
		<td><%=payedAssureOrders%></td>
		<td>未划账担保订单数:</td>
		<td><%=unPayedAssureOrders%></td>
	</tr>
</table>
 </form>
</body>

