<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath(); 
	String toid = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新手指引|重庆农产品网|重庆市农产品电子商务平台</title>
<link href="<%=cp%>/css/groupPurchase/base.css" rel="stylesheet" type="text/css">
<link href="<%=cp%>/css/groupPurchase/tg.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--
<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" height="25" background="<%=cp%>/image/groupPurchase/tgimg01.gif">
<tr>
<td width="49%">&nbsp;</td>
<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg02.gif"></td>
    <td class="font12" width="6%"><a href="#">会员登录</a></td>
	<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg03.gif" width="20" height="20"></td>
    <td class="font12" width="6%"><a href="#">新用户注册</a></td>
	<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg04.gif" width="20" height="20"></td>
    <td class="font12" width="10%"><a href="#">购物车有(0)件商品</a></td>
	<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg05.gif" width="10" height="10"></td>
    <td class="font12" width="3%"><a href="#">结算</a></td>
	<td width="2%"><img src="<%=cp%>/image/groupPurchase/tgimg06.gif" width="20" height="20"></td>
    <td class="font12" width="6%"><a href="#">我的订单</a></td>
	<td width="10%">&nbsp;</td>
</tr>
</table>-->

<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
<td><img src="<%=cp%>/image/groupPurchase/logo.jpg"></td>
<td width="536"><img src="<%=cp%>/image/groupPurchase/banner01.jpg"></td>
</tr>
</table>
<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg07.gif"></td>
<td width="805" background="<%=cp%>/image/groupPurchase/tgimg08.gif"><table width="100%" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
          <td width="110" align="center" class="picbox"><a href="<%=cp%>/front/groupPurchase/getGroupPurchaseInfoById?id=<%=toid%>">今日团购</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
          <td width="110" align="center" class="picbox"><a href="<%=cp%>/plain/guide/groupPurchase-step.jsp?id=<%=toid%>" >团购步骤</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
          <td width="110" align="center" class="picbox"><a href="<%=cp%>/plain/guide/groupPurchase-guide.jsp?id=<%=toid%>" >新手指引</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
<td width="445">&nbsp;</td>
</tr>
</table></td>
<td width="175"><img src="<%=cp%>/image/groupPurchase/tgimg09.gif"></td>

</tr>
</table>
<table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="5">
<tr>
<td></td></tr>
</table>
<table width="990" align="center" cellpadding="0" cellspacing="0" border="0" height="51" background="<%=cp%>/image/groupPurchase/tg_help01.gif">
  <tr>
    <td width="128" valign="bottom"><img src="<%=cp%>/image/groupPurchase/tg_help03.gif" width="128" height="39"></td>
	<td width="128" valign="bottom"><img src="<%=cp%>/image/groupPurchase/tg_help04.gif" width="128" height="39"></td>
	<td width="734">&nbsp;</td>
  </tr>
</table>
<table width="990" align="center" cellpadding="0" cellspacing="0" border="0" class="help_linebox1">
<tr>
    <td>
	<table width="98%" align="center" cellpadding="0" cellspacing="0" border="0">
	<tr>
	<td height="10"></td>
	</tr>
	<tr>
	      <td style="line-height:24px;">
	      
	      
	      <ol start=1 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>今天的团购看起来不错，怎么购买？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>只需在团购截止时间之前点击<span lang=EN-US>&quot;</span>购买<span
lang=EN-US>&quot;</span>按钮，根据提示下订单付费购买即可。如果参加团购人数达到最低人数下限，则团购成交。</span></p>

<ol start=2 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>有哪些支付方式？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>目前只支持银行汇款。</span></p>

<ol start=3 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>团购成交后，我还能购买么？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>团购成交后，仍可以继续购买。团购人数没有上限。</span></p>

<ol start=4 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>如果参加团购人数不足，怎么办？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>如果参加团购人数不足，则该次团购取消。我们会立即退款。您不会有任何损失，但失去了以超低折扣价享受精品消费的机会。如果您很希望这次团购成交，邀请您的朋友一起来购买吧<span
lang=EN-US>~</span></span></p>

<ol start=5 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>购买成功且成团了，但我不想要购买的货品，能退款吗？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>非常抱歉，成团是不能退款的，因为我们做的是新鲜的农产品，有保质期。但您可以将已购买的货品转让给亲戚或朋友。</span></p>

<ol start=6 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>我没有去银行付款，可以去商家那付款吗？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>团购是需要先到银行付款，才能团购成功。</span></p>

<ol start=7 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>团购上的商品是否有质量保障？我能放心购买吗？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>农产品电子商务公司都是以各区县专业合作社，种养大户直接订货。从田间地头，果树上直接到你家，时间不超过<span
lang=EN-US>2</span>天。公司在挑选合作方已经进行多重的、严格的筛选，与我们合作的商家信誉非常好，并且性价比也比较高，请您放心购买。</span></p>

<ol start=8 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>消费团购产品，需要提前预约吗？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>是否需要提前预约视具体团购产品要求所定，我们会在团购的“特别提示”及“详情”里有具体说明，敬请关注。</span></p>

<ol start=9 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>什么是团购凭证，怎么使用？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>团购凭证是指团购成功后，您进行线下消费的依据。</span></p>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>团购凭证是自动产生的订单号和<b>身份证的组合</b>，使用方法为：</span></p>

<ol start=9 type=1>
 <ol start=1 type=1>
  <li class=MsoNormal style='text-align:left'><span style='font-size:12.0pt;
      font-family:宋体'>先短信通知，告诉团购成功，发送订单号。</span></li>
  <li class=MsoNormal style='text-align:left'><span style='font-size:12.0pt;
      font-family:宋体'>到银行付款。<span lang=EN-US> </span></span></li>
  <li class=MsoNormal style='text-align:left'><span style='font-size:12.0pt;
      font-family:宋体'>在发出提货通知后，请在有效期内直接携带购买团购时所登记的身份证、订单号和付款凭证，出示给商家核对无误后即可进行消费。<span
      lang=EN-US> </span></span></li>
 </ol>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>使用团购凭证时，能同时享用其他优惠么？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>一般不可以。如果可以，我们会在团购提示里特别说明。</span></p>

<ol start=11 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>我购买的团购凭证，可以给其他人使用么？</span></b></li>
 <ol start=1 type=1>
  <li class=MsoNormal style='text-align:left'><span style='font-size:12.0pt;
      font-family:宋体'>不能，因为需要你身份证验证。</span></li>
 </ol>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>如果遇到商家停业、搬家或是其他情况，造成无法消费的情况怎么办？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>我们会挑选经营状况良好的商家作为特约商家，一般不会出现这种情况，我们是重庆农产品集团作担保。如果出现了，我们保证全额退款。</span></p>

<ol start=13 type=1>
 <li class=MsoNormal style='text-align:left'><b><span style='font-size:12.0pt;
     font-family:宋体'>团购成功后，商家在发货时，是商家还是用户支付运费？</span></b></li>
</ol>

<p class=MsoNormal align=left style='margin-left:36.0pt;text-align:left'><span
style='font-size:12.0pt;font-family:宋体'>原则上自提方式无配送费，送货上门因我们和第<span lang=EN-US>3</span>方物流公司签约，产品的已经非常让利消费者，价格非常低，省去了很多中间环节，所以需要用户承担一定的配送费。</span></p>
	      
	      
	      
	      </td>
	</tr>
	</table>
		</td>
  </tr>
</table>
<table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="10">
<tr>
<td></td></tr>
</table>
<table width="980" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
  	<td align="center" height="24"> <a href="http://www.cqapg.com" target="_blank">重庆农产品（集团）有限公司</a> 
      | <a href="http://mall.cqapg.com" target="_blank">绿优鲜网上超市</a>| <a href="http://xs.cqncp.com" target="_blank">秀山农产品网</a> 
      | <a href="http://www.aiecp.com" target="_blank">望龙门—农业综合服务网络平台</a> | <a href="http://www.aweb.com.cn" target="_blank">农博网</a> 
      | <a href="http://shop.cqcb.com" target="_blank">晨网商城 </a> | <a href="http://www.b2cf.cn" target="_blank">中国农民合作社信息网</a></td>
  </tr>
   <tr>
    <td height="60" align="center" valign="top" style="line-height:24px;">@ 2010 版权所有 重庆市农产品(集团)有限公司<br >
      地址：中国重庆市渝中区新华路216号 电话：+86 23 86312316 </td> 
  </tr>
</table>

</body>
</html>