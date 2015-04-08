<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>帮助中心</title>
<LINK href="css/dzsw_foot.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>

<%
String appcp = (String)request.getContextPath();
String mainSite = (String)request.getParameter("mainSite");
%>

<body>

<%
if("apggw".equals(mainSite)){
%>
<iframe src="http://www.aiecp.com/TLimages/ncpjt/top.htm" width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
<%
}else if("apg".equals(mainSite)){
%>
<iframe src="http://pubsvr.aiecp.com/asn/front/channel/ncp/ncpHeader" width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
<%
}else if("ncp".equals(mainSite)){
%>
<iframe src="http://pubsvr.aiecp.com/asn/front/channel/ncp/platfromHeader" width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
<%
}else if("jjg".equals(mainSite)){
%>
<iframe src="http://www.cqjjg.com/TLimages/html/jjg_head1.htm" width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
<%
}else if("xs".equals(mainSite)){
%>
<iframe src="http://www.aiecp.com/TLimages/xs/top.htm" width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" align="center"></iframe>
<%
}
%>
<br>
<table width="980" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="191" valign="top">
	
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td height="25" class="left">帮助中心</td>
      </tr>
      <tr>
        <td class="line">
					<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <tr>
				    <td height="30" class="wz">购物指南</td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpaa.jsp" target="_self">注册条款</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpab.jsp" target="_self">怎样下订单</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpac.jsp" target="_self">新用户注册</a></td>
				  </tr>
					</table>
				</td>
      </tr>
      
      <!---->
      <tr>
        <td class="line">
					<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <tr>
				    <td height="30" class="wz">付款方式</td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpba.jsp" target="_self">网上支付常见问题</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpbb.jsp" target="_self">支付方式</a></td>
				  </tr>
					</table>
				</td>
      </tr>
      
      <!---->
      <tr>
        <td class="line">
					<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <tr>
				    <td height="30" class="wz">配送方式</td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpca.jsp" target="_self">配送时间及费用</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpcb.jsp" target="_self">配送范围</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpcc.jsp" target="_self"><font color="red">配送方式</font></a></td>
				  </tr>
				 
					</table>
				</td>
      </tr>
      
      <!---->
      <tr>
        <td class="line">
					<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <tr>
				    <td height="30" class="wz">售后服务</td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpda.jsp" target="_self">价格保护</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpdb.jsp" target="_self">退换货流程</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpdc.jsp" target="_self">服务保障与承诺</a></td>
				  </tr>
				  
					</table>
				</td>
      </tr>
      
      
      <!---->
      <tr>
        <td class="line">
					<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <tr>
				    <td height="30" class="wz">说明</td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpaboutus.jsp?mainSite=<%=mainSite%>" target="_self">关于我们</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpcopyright.jsp?mainSite=<%=mainSite%>" target="_self">版权申明</a></td>
				  </tr>
					</table>
				</td>
      </tr>
      
    	</table>
    </td>
    <td width="10">&nbsp;</td>
    <td width="779" valign="top" class="line2">
    	<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
			  <tr>
			    <td height="50" style="font-size:16px;">配送方式</td>
			  </tr>
			  <tr>
			    <td align="left"><br>
客户在重庆农产品网提交自提订单后，请关注订单状态，待显示“上门自提”时方可前往相应自提点提货(其他订单状态请勿前来自提);<br>
客户到达自提点后，请将订单编号提供给前台自提人员;<br><br>
前台自提人员找货期间，请客户到休息室等候，货物找出后前台人员会提醒客户到前台确认;<br><br>
客户在提货单上签字确认，并到付款台支付货款、开具发票;<br><br>
客户凭已付款的提货单到提货处自提货物。<br><br>
<br><br>
注意事项：<br>
自提时间：周一至周日，09:00 - 19:00(如遇国家法定节假日，则以京东商城新闻发布放假时间为准，请大家届时关注)<br>
商品到达自提点后，我们将为您保留三天，超过三天不上门提货，则视为默认取消订单;<br>
钱、货需客户当面点清，离开提货前台后京东将不再对钱、货数量负责;<br>
货物价保需客户在自提当场提出，离开提货前台后京东不再对自提货物提供价保服务;<br>
普通发票：每张订单需在自提当日开具发票，京东不提供累计开具发票的服务;<br>
增值税发票：选择POS机刷卡，不能开具增票;<br>
增票当日无法开具，需订单完成后三个工作日左右京东按订单地址将增票快递给客户，如订单中地址有误请及时通知京东客服人员。<br>
<br><br>
特殊说明：<br>
上门自提的订单，请在规定的时间内到自提点提取货物。上门自提订单原则上免收配送费用，但如果一个ID帐号在一个月内有过1次以上或一年内有过3次以上，在规定的时间内无理由不履约提货，我司将在相应的ID帐户里每单扣除50个积分做为运费;<br>
时间计算方法为：成功提交订单后向前推算30天为一个月，成功提交订单后向前推算365天为一年，不以自然月和自然年计算;<br>
对于上门自提的客户，重庆农产品网可以接受现金、支票和POS机刷卡三种付款方式。选择支票支付方式，需要客户自行将支票内容填写完整(货款在5000元或5000元以上，需要款到帐后方可提货);POS机刷卡只支持带有银联标识的银行卡。<br>


			    </td>
			  </tr>
			</table>
    </td>
  </tr>
</table>
<br>
<table width="980" border="0" cellspacing="0" cellpadding="0" align="center" height="160">
  <tr>
    <td align="center" height="10"></td>
  </tr>
   <tr>
    <td height="110" align="center" valign="top" class="wz_foot">@ 2010 版权所有 重庆市农产品(集团)有限公司<br >
地址：中国重庆市渝中区新华路216号 电话：<span class="phone_foot">+86 23 86312316 </span><br >
渝ICP备05009208号 </td>
  </tr>
</table>
</body>
</html>
