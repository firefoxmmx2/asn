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
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpab.jsp" target="_self"><font color="red">怎样下订单</font></a></td>
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
			    <td height="50" style="font-size:16px;">怎样下订单</td>
			  </tr>
			  <tr>
			    <td align="left">
订购流程<br>
<br>
1、搜索商品：<br>
重庆农产品网为您提供了方便快捷的商品搜索功能<br>
(1)您可以通过在首页输入关键字的方法来搜索您想要购买的商品。<br>
(2)您还可以通过重庆农产品网的分类导航栏来找到您想要购买的商品分类，根据分类找到您的商品。<br>
(3)观看搜索商品演示。<br>
<br>
2、放入购物车：<br>
在您想要购买的商品的详情页点击“购买”，商品会添加到您的购物车中;您还可以继续挑选商品放入购物车，一起结算。<br>
(1)在购物车中，每件商品的订购数量默认为一件，如果您想购买多件商品，可修改购买数量。<br>
(2)如果您在购物车中删除了某件商品，该商品会暂时放在下面;想重新购买这件商品，点击“恢复”，就可以将它重新放入购物车了。<br>
(3)购物车页面上方的商品是重庆农产品网根据您订购的商品为您作出的推荐，如果有您喜爱的商品，您可以直接点击“购买”。<br>
<br>
3、登陆注册：<br>
老顾客，请输入您的E-mail地址或昵称、密码、验证码，点击“登录”;新顾客，请点击“新用户注册”，按提示完成注册。<br>

4、选择订单：<br>
如果购物车中有两个以上(含两个)的商家的商品，您需要分别提交每个商家的订单。<br>
<br>
5、填写收货人信息选择送货方式选择付款方式：<br>
(1)请您填写真实的收货人姓名、所在地区、详细的收货地址、邮编和联系电话。<br>
(2)重庆农产品网提供的送货方式有普通快递送货上门、加急快递送货上门、普通邮递、特快专递;具体送货方式及价格由交易双方协商议定。<br>
(3)重庆农产品网为您提供了网上支付、货到付款、邮局汇款、银行转账等多种支付方式。<br>
<br>
6、订单确认：<br>
填写完以上信息之后，请仔细核对;确认无误后，请点击“提交订单”按钮提交订单。生成订单号后，表明您已经成功提交了订单。<br>
<br><br>
温馨提示：<br>
1、您一旦选择使用礼券并点击“确定使用”后，将无法取消使用礼券，如果您取消了该订单，礼券无法恢复。<br>
2、如果您将商品放入购物车但尚未提交订单，购物车中商品的价格、优惠政策、配送时间等信息可能发生变化。因此，您保留在购物车中的商品最终成交信息将以您成功提交订单时重庆农产品网公布的信息为准。<br>

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
