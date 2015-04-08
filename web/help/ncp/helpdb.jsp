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
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpcc.jsp" target="_self">配送方式</a></td>
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
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpdb.jsp" target="_self"><font color="red">退换货流程</font></a></td>
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
			    <td height="50" style="font-size:16px;">退换货流程</td>
			  </tr>
			  <tr>
			    <td align="left">
重庆农产品网为您提供了在线受理退换货的服务，您只需要登录您的个人帐户，在“我的返修” 页面中在线提交申请信息即可。<br>
<br>
上门取件方式的退货流程：<br>
提交申请---审核确认---上门取件---登记检测---退款<br>
<br>
上门取件方式的保修换货流程：<br>
提交申请---审核确认---上门取件---登记检测---生成新订单换货∕保修<br>
<br>
上门换新流程：<br>
提交申请---审核确认---生成新订单---京东快递上门---取件&换货<br>
<br>
邮寄方式的退货流程：<br>
提交申请---审核确认---寄回京东---登记检测---退款<br>
<br>
邮寄方式的保修换货流程：<br>
提交申请---审核确认---寄回京东---登记检测---生成新订单换货∕保修<br>


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
