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
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpba.jsp" target="_self"><font color="red">网上支付常见问题</font></a></td>
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
			    <td height="50" style="font-size:16px;">支付常见问题</td>
			  </tr>
			  <tr>
			    <td align="left"><br>
1、重庆农产品网提供的网上支付方式<br>
我们为您提供银行卡在线支付（工商银行、招商银行、建设银行、深圳发展银行、农业银行）、银联支付、财付通支付、快钱网上支付、快钱信用卡支付、由首信支付平台支持的国外信用卡支付网上支付方式。<br>
银行卡在线支付所支持的卡种有：<br>
<table border="1">
	<tr>
		<td>银行名称</td>
		<td>支持网上支付的银行卡名称</td>
	</tr>
	<tr>
		<td>招商银行</td>
		<td>一卡通、信用卡</td>
	</tr>
	<tr>
		<td>中国工商银行</td>
		<td>借记卡、信用卡</td>
	</tr>
	<tr>
		<td>中国建设银行</td>
		<td>龙卡储蓄卡</td>
	</tr>
	<tr>
		<td>中国农业银行</td>
		<td>借记卡、准贷记卡</td>
	</tr>
	<tr>
		<td>深圳发展银行</td>
		<td>借记卡、信用卡</td>
	</tr>
</table>
<br>
网上支付平台所支持的银行卡种有：<br>
支付平台名称：<br>
财付通支付 <br>
快钱网上支付<br>
快钱信用卡支付 <br>
国外信用卡支付<br><br>


温馨提示：<br>
1）目前使用快钱网上支付单笔支付金额最高可达到1万元（不同的银行的支付金额不同）<br> 
2）快钱网上大金额支付支持的银行有：工商银行、招商银行、建设银行、农业银行、广东发展银行、兴业银行  <br>

2、银行卡的开通手续<br>
因各地银行政策不同，建议您在网上支付前拨打所在地银行电话，咨询该行可供网上支付的银行卡种类及开通手续。<br>
<table border="1">
	<tr>
		<td>银行名称</td>
		<td>服务热线</td>
		<td>银行名称</td>
		<td>服务热线</td>
		<td>银行名称</td>
		<td>服务热线</td>
	</tr>
	<tr>
		<td>招商银行</td>
		<td>95555</td>
		<td>中国银行</td>
		<td>95566</td>
		<td>交通银行</td>
		<td>95559</td>
	</tr>
	<tr>
		<td>中国工商银行</td>
		<td>95588</td>
		<td>北京银行</td>
		<td>96169</td>
		<td>光大银行</td>
		<td>95595</td>
	</tr>
	<tr>
		<td>中国建设银行</td>
		<td>95533</td>
		<td>中国农业银行</td>
		<td>95599</td>
		<td>深圳发展银行</td>
		<td>95501</td>
	</tr>
	<tr>
		<td>上海浦东发展银行</td>
		<td>95528</td>
		<td>广东发展银行</td>
		<td>95508</td>
		<td>中国邮政</td>
		<td>11185</td>
	</tr>
	<tr>
		<td>民生银行</td>
		<td>95568</td>
		<td>华夏银行</td>
		<td>95577</td>
		<td>中信银行</td>
		<td>86668888</td>
	</tr>
</table>
																
<br><br>
3、支付金额上限 <br>
目前各银行对于网上支付均有一定金额的限制，由于各银行政策不同，建议您在申请网上支付功能时向银行咨询相关事宜。  <br>
<br>
4、怎样判断网上支付是否成功？<br>
1)当您完成网上在线支付过程后，系统应提示支付成功；如果系统没有提示支付失败或成功，您可通过电话、ATM 、柜台或登录网上银行等各种方式查询银行卡余额，如果款项已被扣除，说明您已支付成功。<br>
2)如果出现信用卡超额透支、存折余额不足、意外断线等导致支付不成功，请您登录重庆农产品网 “我的帐户”，找到该张未支付成功的订单，重新完成支付。<br>
<br>
5、造成“支付被拒绝”的原因有哪些？<br>
1）所持银行卡尚未开通网上在线支付功能；<br>
2）所持银行卡已过期、作废、挂失；<br>
3）所持银行卡内余额不足； <br>
4）输入银行卡卡号或密码不符；<br>
5）输入证件号不符； <br>
6）银行系统数据传输出现异常； <br>
7）网络中断。<br>



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
