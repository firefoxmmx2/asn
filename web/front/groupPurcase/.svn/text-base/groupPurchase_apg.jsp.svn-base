<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseDetail" %>
<%@ page import="com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%

	String cp=request.getContextPath();
	GroupPurchaseInfo groupPurchaseInfo = (GroupPurchaseInfo)request.getAttribute("groupPurchaseInfo"); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String toid = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>团购频道</title>
<link href="<%=cp%>/css/groupPurchase/base.css" rel="stylesheet" type="text/css">
<link href="<%=cp%>/css/groupPurchase/tg.css" rel="stylesheet" type="text/css">   
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
 
 <style type="text/css">
 	.table_border{ margin-top:15px; background:#fff8e8;border-bottom:1px #000000 solid;border-left:1px #000000 solid;}
	.table_border td{border-top:1px #000000 solid;border-right:1px #000000 solid;}
 </style>
 
 <script type="text/javascript">
 var SysSecond;
 var InterValObj;
 $(document).ready(function() {
  SysSecond = parseInt($("#remainSeconds").html()); //这里我是在服务端算好了剩余的秒数，并保存到客户端，如果过期则返回0
  InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
 });
 //代理,接单的时间+1小时减去当前时间的秒数
 function SetRemainTime() {
  if (SysSecond > 0) {
   //alert(SysSecond);
   SysSecond = SysSecond - 1;
   var second = Math.floor(SysSecond % 60);             // 计算秒     
   var minite = Math.floor((SysSecond / 60) % 60);      //计算分
   var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时
   var day = Math.floor((SysSecond / 3600) / 24);        //计算天
   $("#remainTime").html(day + "天" + hour + "小时" + minite + "分" + second + "秒");
  } else {//剩余时间小于或等于0的时候，就停止间隔函数
   window.clearInterval(InterValObj);
  }
 }

</script>

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
</table>
 -->
<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
<td><img src="<%=cp%>/image/channel/ncp/logo_wssc.jpg" height="80"></td>
<td width="536"><img src="<%=cp%>/image/groupPurchase/banner01.jpg" ></td>
</tr>
</table>
<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg07.gif"></td>
<td width="805" background="<%=cp%>/image/groupPurchase/tgimg08.gif"><table width="100%" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
          <td width="110" align="center" class="picbox"><a href="#">今日团购</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
          <td width="110" align="center" class="picbox"><a href="<%=cp%>/plain/guide/groupPurchase-step.jsp?id=<%=toid%>" target="_blank">团购步骤</a></td>
<td width="10"><img src="<%=cp%>/image/groupPurchase/tgimg10.gif"></td>
          <td width="110" align="center" class="picbox"><a href="<%=cp%>/plain/guide/groupPurchase-guide.jsp?id=<%=toid%>" target="_blank">新手指引</a></td>
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
<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="720" valign="top">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td colspan="2"><img src="<%=cp%>/image/groupPurchase/tgimg13.gif"></td>
</tr>
<tr>
<td background="<%=cp%>/image/groupPurchase/tgimg14.gif" colspan="2">
<table width="100%" cellpadding="0" cellspacing="10" border="0">
<tr>
<td width="5">&nbsp;</td>
<td class="basic_buy_group"><font color="#a20027"><%=groupPurchaseInfo.getProductName() %>：</font><%=groupPurchaseInfo.getTitle()%><font color="#70081f">(时间：<%=sdf.format(groupPurchaseInfo.getStartTime())%>至<%=sdf.format(groupPurchaseInfo.getStopTime())%>)</font><br>
                  
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2"><img src="<%=cp%>/image/groupPurchase/tgimg15.gif"></td>
</tr>
<tr>
<td background="<%=cp%>/image/groupPurchase/tgimg16.gif" valign="top">
<table width="220" cellpadding="0" cellspacing="10" border="0" height="40">
<tr>
<td width="5">&nbsp;</td>
                <td style="font-size:14px;">市场价：<del style="font-weight:bold;">￥4</del>　　折扣：<font color="#d80100"><b>5</b></font>折</td>
</tr>
</table>
<table width="220" cellpadding="0" cellspacing="5" border="0" background="<%=cp%>/image/groupPurchase/tgimg18.gif" height="86">
<tr>
<td width="10">&nbsp;</td>
<td valign="bottom" style="font-size:14px;color:#fff;" height="35">最低团购价</td>
                <td rowspan="2">
                <a href="getGroupPurchaseDetail?id=<%=groupPurchaseInfo.getId()%>">
                <img src="<%=cp%>/image/groupPurchase/tgimg19.gif" width="100" height="60" border="0">
                </a>
                </td>
</tr>
<tr>
<td width="10">&nbsp;</td>
                <td class="current_price">￥2.0</td>
</tr>
</table>
<table width="100%" cellpadding="0" cellspacing="8" border="0">
<tr>
<td width="5">&nbsp;</td>
<td class="linebox1">
<table width="100%" cellpadding="0" cellspacing="0" border="0" height="55">
<tr>
<td class="f14" style="padding-left:10px;">距本次团购结束还有：
	<!-- 灵哥，这个位置，就是放值从数据库里面读出来的剩余时间，但是你要先转化成秒数，可以弄成一个隐藏字段-->
	<div id="remainSeconds" style="display:none">
	<%=(groupPurchaseInfo.getStopTime().getTime() - new Date().getTime())/1000 %>
	</div>
	<div id="remainTime"></div>
</td>
<td width="26"><img src="<%=cp%>/image/groupPurchase/tgimg20.gif"></td></tr>
</table>
</td>
</tr>
</table> 
<table width="100%" cellpadding="0" cellspacing="8" border="0">
<tr>
<td width="5">&nbsp;</td>
<td class="linebox1">
<table width="100%" cellpadding="0" cellspacing="0" border="0" height="55">
<tr>
<td height="5" colspan="2"></td>
</tr>
<tr>
<td align="center" colspan="2" height="26" class="current_1"><%=groupPurchaseInfo.getLowerLimit() %>人起团</td>
</tr>
<tr>
<td align="center" colspan="2" class="current_2" height="26">已经有<%=groupPurchaseInfo.getCurrentUsers() %>人购买</td>
</tr>
<tr>
                      <td align="center"><img src="<%=cp%>/image/groupPurchase/tgimg21.gif" width="50" height="55"></td>
                      <td align="center" style="line-height:24px;"><font color="#3e3e3e" size="3"><b>团购成功</b></font><br>
                          可继续团购
                        </td>
</tr>
</table>
</td>
</tr>
</table>
</td>
<td background="<%=cp%>/image/groupPurchase/tgimg17.gif" valign="top"><table width="500" cellpadding="0" cellspacing="0" border="0">
<tr>
                <td><img src="<%=cp%>/image/groupPurchase/pic.jpg" width="490" height="340"></td>
</tr>
</table></td>
</tr>
<tr>
<td background="<%=cp%>/image/groupPurchase/tgimg22.gif" colspan="2" height="4"></td>
</tr>
<tr>
<td background="<%=cp%>/image/groupPurchase/tgimg23.gif" colspan="2">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
<td width="20" rowspan="4">&nbsp;</td>
                <td class="font14" colspan="4" height="26">特别提示：</td>
<td width="8" rowspan="4">&nbsp;</td>
</tr>
<tr>
                <td class="font12e" height="21">·有 效 期：</td>
				<td style="color:#6c6c6c;"><%=sdf.format(groupPurchaseInfo.getStartTime())%> - <%=sdf.format(groupPurchaseInfo.getStopTime()) %></td>
				<td class="font12e">·付款方式：</td>
				<td style="color:#6c6c6c;">银行汇款（<font color="red">支付宝近期推出，敬请关注</font>）</td>
</tr>
<tr>
                <td class="font12e" height="21">·起 订 量：</td>
				<td style="color:#6c6c6c;">一箱起订</td>
				<td class="font12e">·取货方式：</td>
				<td style="color:#6c6c6c;">自提或送货上门（收取配送费）</td>
</tr>
<tr>
                <td class="font12e" height="21">·送货上门：</td>
				<td style="color:#6c6c6c;" colspan="3">根据包装规格不同收取6-9元/箱的配送费；主城区三十箱以上免费送货上门</td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2"><img src="<%=cp%>/image/groupPurchase/tgimg24.gif" height="6"></td>
</tr>
</table>
</td>
<td width="10"></td>
<td width="260" valign="top">
<table width="100%" cellpadding="0" cellspacing="10" border="0" class="linebox">
<tr>
<td colspan="2" height="22" valign="bottom" class="f14 b" style="color:#da0000;">本期团购提供商客服</td>
</tr>
<tr>
          <td height="20" width="80" class="b" style="color:#3d3d3d;">供&nbsp;货&nbsp;&nbsp;商：</td>
<td width="180">重庆市农产品集团有限公司</td>
</tr>
<tr>
          <td height="20" width="70" class="b" style="color:#3d3d3d;">在线客服：</td>
          <td style="color:#88888a;" height="40">
          	<A href="tencent://message/?uin=1637918889&amp;Site=重庆农产品网 重庆市农产品电子商务平台 www.cqncp.com&amp;Menu=yes" style="cursor:hand"><img src="<%=cp%>/image/groupPurchase/tgimg12.gif" width="80" height="24" border="0"></A>
          </td>
</tr>
<tr>
          <td height="20" width="70" class="b" style="color:#3d3d3d;">客服电话：</td>
          <td>+86 23 86312316</td>
</tr>
<tr>
          <td height="20" width="70" class="b" style="color:#3d3d3d;">服务时间：</td>
          <td>09：00—18：00</td>
</tr>
<tr>
          <td colspan="2" style="line-height:24px;">注：在线客服因为各种原因未能及时解答问题，请各位与电话客服联系</td>
        </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0" height="10">
<tr>
<td></td>        </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="10" border="0" class="linebox">
<tr>
          <td style="line-height:22px;">　　团购奉节脐橙开始了，奉节脐橙耐于贮存，在气温10摄氏度可以存放2个月左右。元旦将至，奉节脐橙是馈赠亲朋好友的佳品，建议大家采取以社区邻居、单位同事、单位发福利、亲戚朋友等方式合订，一起来享受团购的实惠吧！ 
            　<br>
            　<br>
            　　品种：奉节脐橙 　　<br>
            　　特点：奉节脐橙果皮亮红光滑，果色橙红，果肉香甜脆嫩，经常食用具有降低胆固醇、分解脂肪、减少有色金属和放射性元素在人体内积累、清火养颜，为脐橙中极品。<br>
            <br>
            　　团购货源：是从奉节无公害脐橙生产基地直接定货，果品都是自然成熟，无农药残留，从果树下枝到团购食用，相对时间较短，吃起来比较新鲜。</td>
        </tr>
</table>

</td>
</tr>
</table>
<table width="50%" align="center" cellpadding="0" cellspacing="0" border="0" height="10">
<tr>
<td></td></tr>
</table>
<table width="990" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="6"></td>
<td width="984">
<table width="100%" align="center" cellpadding="0" cellspacing="10" border="0" class="linebox2">
<tr>
          <td colspan="2"><img src="<%=cp%>/image/groupPurchase/tgimg25.gif" width="95" height="22"></td>
</tr>
<tr>
<td valign="top">
<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
              <!--DWLayoutTable-->
              <tr> 
                <td height="30" colspan="2" align="center" class="font14">产品规格</td>
              </tr>
              <tr> 
                <td width="599" height="28" align="center" valign="top"> <TABLE class=MsoNormalTable style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; MARGIN: auto auto auto 5.4pt; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none; BORDER-COLLAPSE: collapse; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext" cellSpacing=0 cellPadding=0 border=1>
                    <TBODY>
                      <TR style="HEIGHT: 23.25pt; mso-yfti-irow: 0; mso-yfti-firstrow: yes"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: windowtext 1pt solid; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: windowtext 1pt solid; WIDTH: 72pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 23.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt" vAlign=top width=96> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">规格（直径）</SPAN></P>
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">（</SPAN><SPAN lang=EN-US>mm</SPAN><SPAN style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">）</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: windowtext 1pt solid; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 23.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt" vAlign=middle width=92> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">重量(斤/箱)</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: windowtext 1pt solid; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 23.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt" vAlign=middle width=·04> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">团购价(元/箱)</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: windowtext 1pt solid; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 23.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt" vAlign=middle width=140> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">市场价(元/箱)</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: windowtext 1pt solid; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 23.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt" vAlign=middle width=104> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">配送费(元/箱)</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 13.5pt; mso-yfti-irow: 1"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: windowtext 1pt solid; WIDTH: 72pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 13.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=96 rowSpan=3> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>70--75</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 13.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>15</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 13.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>30</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 13.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>37.5</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 13.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>6</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 5.25pt; mso-yfti-irow: 2"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 5.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>20</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 5.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>40</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 5.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>50</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 5.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>8</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 11.25pt; mso-yfti-irow: 3"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>40</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>80</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>100</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>9</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 12pt; mso-yfti-irow: 4"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: windowtext 1pt solid; WIDTH: 72pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=96 rowSpan=3> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>75--80</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>15</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>35</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>45</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>6</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 11.25pt; mso-yfti-irow: 5"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>20</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>46</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>60</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 11.25pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>8</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 6pt; mso-yfti-irow: 6"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 6pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>40</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 6pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>92</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 6pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>120</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 6pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>9</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 10.5pt; mso-yfti-irow: 7"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: windowtext 1pt solid; WIDTH: 72pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=96 rowSpan=3> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>80--85</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>15</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>42</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>52.5</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>6</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 9.75pt; mso-yfti-irow: 8"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>20</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>56</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>70</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>8</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 12pt; mso-yfti-irow: 9"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>40</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>112</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>140</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>9</SPAN></P></TD>
                      </TR>
                      
                      <TR style="HEIGHT: 10.5pt; mso-yfti-irow: 7"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: windowtext 1pt solid; WIDTH: 72pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=96 rowSpan=3> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>85--90</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>15</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>48</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>67.5</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 10.5pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>6</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 9.75pt; mso-yfti-irow: 8"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>20</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>64</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>90</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 9.75pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>8</SPAN></P></TD>
                      </TR>
                      <TR style="HEIGHT: 12pt; mso-yfti-irow: 9"> 
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 54pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=72> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>40</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>128</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 90pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=120> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>180</SPAN></P></TD>
                        <TD style="BORDER-RIGHT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BORDER-TOP: #ece9d8; PADDING-LEFT: 5.4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: #ece9d8; WIDTH: 63pt; PADDING-TOP: 0cm; BORDER-BOTTOM: windowtext 1pt solid; HEIGHT: 12pt; BACKGROUND-COLOR: transparent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt" vAlign=top width=84> 
                          <P class=MsoNormal style="MARGIN: 0cm 0cm 0pt"><SPAN lang=EN-US>9</SPAN></P></TD>
                      </TR>                      
                    </TBODY>
                  </TABLE>
                  <table width="85%" cellpadding="0" cellspacing="0" border="0">
                    <tr> 
                      <td style="line-height:24px;text-align:left;"><br>
                                                     说明：<br>
                        1、规格是指单果直径大小，单果直径在80—90mm的脐橙口感最佳；<br>
						2、自提方式不需支付配送费；<br>
						3、配送目前只针对主城区范围，单位或个人团购满30箱即可免费送货上门；<br>
						4、团购报名截止后将通知提货地点和安排送货，团友<strong>凭订单号、身份证、付款证明</strong>即可收取货物；<br>
						5、收款人信息：<strong>重庆市农产品（集团）有限公司</strong>；<br>
						6、收款人开户银行及账号信息：请团友将款项付至收款人以下任一账户！<br>
					</td>
                    </tr>
                  </table>
                  <table width="85%" border="0" cellpadding="0" cellspacing="0" class="table_border">
                    
                    <tr> 
                      <td height="26" align="center">开户行</td>
                      <td align="center">账号</td>
                    </tr> 
                    
                    <tr> 
                      <td height="26" align="center">重庆农村商业银行</td>
                      <td align="center">5001 0101 2001 0004 809</td>
                    </tr>    
                    <tr> 
                      <td height="26" align="center">兴业银行重庆分行</td>
                      <td align="center">3460 1010 0100 272 500</td>
                    </tr>
                    <tr> 
                      <td height="38" bgcolor="fff8e8" align="center">重庆银行</td>
                      <td align="center" style="line-height:23px;">
                      	<!--1301 0104 0013 129<br>-->
                        0201 0104 0017 404 </td>
                    </tr>
                    <tr> 
                      <td height="26" align="center">建设银行重庆分行</td>
                      <td align="center">5000 1333 6000 5021 
                        7607</td>
                    </tr>
                  </table></td>
                <td width="3">&nbsp;</td>
              </tr>
            </table>
</td>
          <td width="350"><img src="<%=cp%>/image/groupPurchase/tgimg26.gif" width="321" height="403"></td>
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
      | <a href="http://mall.cqapg.com" target="_blank">绿优鲜网上超市 </a>| <a href="http://xs.cqncp.com" target="_blank">秀山农产品网</a> 
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


