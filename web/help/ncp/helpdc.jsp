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
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpdb.jsp" target="_self">退换货流程</a></td>
				  </tr>
				  <tr>
				    <td height="18" class="point"><a href="<%=appcp%>/help/ncp/helpdc.jsp" target="_self"><font color="red">服务保障与承诺</font></a></td>
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
			    <td height="50" style="font-size:16px;">服务保障与承诺</td>
			  </tr>
			  <tr>
			    <td align="left">
重庆农产品网交易条款<br>
重庆农产品网和您之间的契约<br>
<br>
1.重庆农产品网将尽最大努力保证您所购商品与网站上公布的价格一致，但价目表和声明并不构成要约。重庆农产品网有权在发现了其网站上显现的产品及订单的明显错误或缺货的情况下，单方面撤回。(参见下面相关条款)。<br>
重庆农产品网保留对产品订购的数量的限制权。 <br>
在下订单的同时，您也同时承认了您拥有购买这些产品的权利能力和行为能力，并且您对您在订单中提供的所有信息的真实性负责。<br>
<br>
2. 价格变化和缺货<br>
产品的价格和可获性都在重庆农产品网站上指明。这类信息将随时更改且不发任何通知。商品的价格都包含了增值税。送货费将另外结算，费用根据您选择的送货方式的不同而异。如果发生了意外情况，在确认了您的订单后，由于供应商提价，税额变化引起的价格变化，或是由于网站的错误等造成商品价格变化，您有权取消您的订单，并希望您能及时通过电子邮件或电话通知当当客户服务部。<br>
您所订购的商品，如果发生缺货，您有权取消订单。<br>
<br>
3. 邮件/短信服务<br>
重庆农产品网保留通过邮件和短信的形式，对本网站注册、购物用户发送订单信息、促销活动等告知服务的权利。如果您在重庆农产品网注册、购物，表明您已默示同意接受此项服务。<br>
如果您不想接收来自重庆农产品网的邮件和短信，请在收到短信后直接回复“N”，或在邮件下方输入您的E-mail地址自助完成退阅;<br>
您也可以向重庆农产品网客服提出退阅申请，并注明您的E-mail地址或手机号，重庆农产品网会在收到邮件后为您办理退阅。<br>
<br>
4. 送货<br>
重庆农产品网将会把产品送到您所指定的送货地址。所有在重庆农产品网站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。参考时间不代表等同于到货时间。<br>
<br>
5.退款政策<br>
退货或换货商品缺货时产生的现金款项，退回方式视支付方式的不同而不同：<br>
1) 网上支付的订单，退款退回至原支付卡;<br>
2) 银行转帐或邮局汇款支付的订单，退款退回至下订单账户的账户余额中。<br>
<br>
6. 条款的修正<br>
这些交易条件的条款适用于重庆农产品网为您提供的产品销售服务。这些条款将有可能不时的被修正。任何修正条款的发生，重庆农产品网都将会及时公布。<br>
<br>
7. 条款的可执行性<br>
如果出于任何原因，这些条款及其条件的部分不能得以执行，其他条款及其条件的有效性将不受影响。<br>
<br>
8. 适用的法律和管辖权<br>
您和重庆农产品网之间的契约将适用中华人民共和国的法律，所有的争端将诉诸于重庆农产品网所在地的人民法院。<br>
<br>
9、重庆农产品网会员制计划(VIP计划)协议的变更/终止/责任限制<br>
重庆农产品网的会员制计划(VIP计划)，本计划由重庆重庆农产品网信息技术有限公司/或其关联企业提供。以上计划条款和条件，连同计划有关的任何促销内容的相应条款和条件，构成本计划会员与重庆农产品网之间关于制度的完整协议。如果您参加计划，您就接受了这些条款、条件、限制和要求。请注意，您对重庆农产品网站的使用以及您的会员资格还受制于重庆农产品网网站上时常更新的所有条款、条件、限制和要求，请仔细阅读这些条款和条件。<br>
<br>
<br>
协议的变更<br>
重庆农产品网可以在没有特殊通知的情况下自行变更本条款、重庆农产品网的任何其它条款和条件、或您的计划会员资格的任何方面。 <br>
对这些条款的任何修改将被包含在重庆农产品网的更新的条款中。如果任何变更被认定为无效、废止或因任何原因不可执行，则该变更是可分割的，且不影响其它变更或条件的有效性或可执行性。在我们变更这些条款后，您对重庆农产品网的继续使用，构成您对变更的接受。如果您不同意本使用交易条款中的任何一条，您可以不使用重庆农产品网。<br>

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
