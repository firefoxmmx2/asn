<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); 
   String pubSvrUrl = "http://pubsvr.aiecp.com/asn";
%>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator"%>

<% List list = (List)request.getAttribute("list"); 
	Date tsBegin = null;
	Date tsEnd = null;
	Long leftTime = 0L;
	if(list != null && list.size() > 0){
		Map<String,Object> md= (Map)list.get(0); 		
		tsBegin = (java.util.Date)md.get("beginTime");
		tsEnd = (java.util.Date)md.get("endTime");
		leftTime = tsBegin.getTime() - new java.util.Date().getTime();
	}
	
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>秒杀活动 | 重庆市农产品电子商务平台</title>
<script type="text/javascript" src="<%=cp %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/hxtool.js"></script>
<script type="text/javascript">
	$(function(){		
		$('#countDownCt').count_down(<%=leftTime%>,'sec','<span style="color:red;font-size:18px;">{dd}</span>天<span style="color:green;font-size:18px;">{hh}</span>时<span style="color:gray;font-size:16px;">{mi}</span>分<span style="color:orange;font-size:16px;">{ss}</span>秒');
	});

	function time_block(block_obj, block_toggle, callbackFunc, timems1,
			timems2, nowms) {
		var nowTime;
		var time1;
		var time2;
		var blockClass="block_time";
		var unblockClass="unblock_time";
		var interval_time=1000;
		
		time1 = new Date(timems1);
		time2 = new Date(timems2);
		nowTime = new Date(nowms);

		var interval_obj = window.setInterval(process_interval, interval_time);
		
		function process_interval() {
				nowTime.setTime(nowTime.getTime()+interval_time);
				process();
		}
		
		function process(){
			if (nowTime < time1) {
				var $block_obj = $(block_obj);
				for (i=0 ;i<= $block_obj.length;i++) {
					if ($block_obj.eq(i).hasClass(unblockClass)) {
						$block_obj.eq(i).removeClass(unblockClass);
						$block_obj.eq(i).addClass(blockClass);
						$block_obj.eq(i).unbind('click');

						if (block_toggle)
							$block_obj.eq(i).html(block_toggle.block);
					}
				}
			} else if (nowTime >= time1 && nowTime <= time2 ) {
				var $block_obj = $(block_obj);
				for (i=0 ;i<= $block_obj.length;i++) {
					var data = eval("("+$block_obj.eq(i).attr('data')+")");
					if ($block_obj.eq(i).hasClass(blockClass) && data['warecount'] > 0) {
						$block_obj.eq(i).removeClass(blockClass);
						$block_obj.eq(i).addClass(unblockClass);
						$block_obj.eq(i).click(function() {
							callbackFunc(this);
						});
						if (block_toggle)
							$block_obj.eq(i).html(block_toggle.unblock);
					}
				}
			} else {
				var $block_obj = $(block_obj);
				for (i=0 ;i<= $block_obj.length;i++) {
					if ($block_obj.eq(i).hasClass(unblockClass)) {
						$block_obj.eq(i).removeClass(unblockClass);
						$block_obj.eq(i).addClass(blockClass);
						$block_obj.eq(i).unbind('click');

						if (block_toggle)
							$block_obj.eq(i).html(block_toggle.block);
					}
				}

				window.clearInterval(interval_obj);
			}
		}
		var $block_obj = $(block_obj);
		for (i=0 ;i<= $block_obj.length;i++) {
			$block_obj.eq(i).removeClass(unblockClass);
			$block_obj.eq(i).addClass(blockClass);
			$block_obj.eq(i).unbind('click');

			if (block_toggle)
				$block_obj.eq(i).html(block_toggle.block);
		}
		
		process();
	}
	
	$(function(){
		time_block($('.secKillbtn'),{block:'<img src="<%=cp%>/image/activity/qg01.gif"/>',unblock:'<img src="<%=cp%>/image/activity/qg.gif" style=" cursor: pointer;" />'
		}, function(obj) {
			var data=eval("("+$(obj).attr('data')+")");
			var url="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=" + data['pdtId'];
			window.open(url, '_blank');
		}, new Date(2011,0,10,16).getTime(), new Date(2011,0,10,16,40).getTime(), <%=new Date().getTime()%>);
	});	
</script>
<style>
<!--
body{ font-family: Arial, Helvetica, sans-serif;           
	font-size: 14px;
	margin: 0;
	padding: 0;
}            
.seckillDiv{
	width:183px; float:left; height:335px; background:#FFFFFF;margin:4px;color:#666666;	
}
.qiaogoutime{font-size:24px;font-weight:bold;color:#fff;padding-top:30px;}
.shengyutime{font-size:12px;font-weight:bold;color:#212121;padding-bottom:20px;}
a:link {
	color: #555555;
	text-decoration: none;
}
a:visited {
	color: #555555;
	text-decoration: none;
}
a:hover {
	color: #ff0000;
	text-decoration: underline;
}
a:active {
	color: #555555;
	text-decoration: none;
}
--> 
</style>
</head>
<body>


<table width="1000" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
    <td background="<%=cp%>/image/activity/gwj_r4_c1.jpg" height="130" valign="bottom">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
		<td height="80" width="280"></td>
		<td width="495" class="qiaogoutime">抢购时间：<%=new SimpleDateFormat("yyyy/MM/dd HH:mm").format(tsBegin) %> - 
				<%=new SimpleDateFormat("HH:mm").format(tsEnd) %>
		</td>
		          <td width="225" align="center" class="shengyutime">
		          	<span id="countDownCt"></span>
		            </td>
		</tr>
	</table>
	</td>
</tr>
<tr>
<td background="<%=cp%>/image/activity/gwj_r5_c1.jpg">
	<table width="100%" cellpadding="0" cellspacing="0" border="0" height="130">
<tr>
<td width="400"></td>
          <td style="line-height:32px;color:#fff;">
          	<!--<marquee height="96" direction="up" scrolldelay="300" onmouseout="this.start()" onmouseover="this.stop()">-->
          	1、本次活动必须<b>先注册</b>成为会员才能参加秒杀活动，秒杀前必须<b>先提前</b>登录！<br>
            2、秒杀成功后需在24小时内完成付款，否则视为自动放弃<br>
            3、本次活动的解释权归重庆市农产品集团电子商务有限公司所有<br>
            4、秒杀商品请自提，地址是重庆市渝中区新华路216号（新鸥鹏大厦22楼 023 86312316）<br>
            <!--</marquee>-->
            </td>
</tr>
	</table>

</td>
</tr>
</table>


<table width="1000" align="center" cellpadding="0" cellspacing="0" border="0" bgcolor="#9E1701">
	<tr>
		<td width="968" height="100%" align="center" style="padding-left:16px;">
		 
			<%
			if(list != null && list.size() > 0){
			for(int i=0; i<list.size(); i++){ 
				Map<String,Object> m = (Map<String,Object>)list.get(i);
				Date date = new Date();
			%>
			<div class="seckillDiv">
				<table width="100%" height="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td height="160" align="center"><img src="<%=cp%><%=m.get("bigPicPath")%>" height="160"></td>
					</tr>
					<tr>
						<td height="25" align="center">
							<strong style="color:#444444;"><%=m.get("productName").toString().length()>10?m.get("productName").toString().substring(0,10)+"..":m.get("productName")%></strong>
						</td>
					</tr>
					<tr>
						<td height="25" align="center">市场价：<span style="text-decoration:line-through;">￥<%=m.get("marketPrice")==null?"":m.get("marketPrice") %>元</span></td>
					</tr>
					<tr>
						<td height="25" align="center">秒杀价：<strong>￥<font color="#C6261A"><%=m.get("secKillPrice") %></font></strong>元</td>
					</tr>
					<%
					java.math.BigDecimal marketPrice = (java.math.BigDecimal)m.get("marketPrice");
					java.math.BigDecimal salePrice = (java.math.BigDecimal)m.get("secKillPrice");
					double unpay = marketPrice.doubleValue()-salePrice.doubleValue();
					%>
					<tr>
						<td height="25" align="center">可节省：<strong>￥<font color="#C6261A"><%=Calculator.keepTwoDecimal(unpay) %></font></strong>元</td>
					</tr>
					<tr>
						<td height="25" align="center">还剩：<%=m.get("wareCount") %>/<%=m.get("productUnit") %></td>
					</tr>
					
					<tr>
						<td height="35" align="center">
						<!-- <a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=m.get("productId")%>" target="_blank">
						<img src="<%=cp%>/image/activity/qg.gif" border="0">
						</a>   
						 -->
						<% /*if(date.after((Date)m.get("beginTime")) && date.before((Date)m.get("endTime")) && Integer.parseInt(m.get("wareCount").toString()) > 0){ %>
							<a href="<%=pubSvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=m.get("productId")%>" target="_blank">
							<img src="<%=cp%>/image/activity/qg.gif" border="0">
							</a>						
						<% }else{ %>
							<img src="<%=cp%>/image/activity/qg01.gif" border="0">
						<% } */%>
						
						 <span class="secKillbtn" data="{pdtId:<%=m.get("productId")%>,warecount:<%=m.get("wareCount")%>}" ></span> 
						</td>
					</tr>
					<tr>
						<td height="15">&nbsp;</td>
					</tr>
						       
				</table>
			</div>		
			<% 		} 
				}
			%>	
			
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" height="160" style="padding-top:10px;font-size:12px;">
  
  <tr>
  	<td align="center">
    	<a href="http://www.cqapg.com" target="_blank">重庆农产品（集团）有限公司</a> | 
    	<a href="http://mall.cqapg.com" target="_blank">绿优鲜网上超市 </a>| 
    	<a href="http://xs.cqncp.com" target="_blank">秀山农产品网</a> | 
    	<a href="http://www.aiecp.com" target="_blank">望龙门—农业综合服务网络平台</a> 
    </td>
  </tr>
  <tr>
  		<td align="center">
    	<a href="http://www.aweb.com.cn" target="_blank">农博网</a> |
    	<a href="http://shop.cqcb.com" target="_blank">晨网商城 </a> |
    	<a href="http://www.b2cf.cn" target="_blank">中国农民合作社信息网 </a> 
    	</td>
  </tr>
   <tr>
    <td height="110" align="center" valign="top" class="wz_foot">@ 2010 版权所有 重庆市农产品(集团)有限公司<br >
地址：中国重庆市渝中区新华路216号 电话：<span class="phone_foot">+86 23 86312316 </span><br >
渝ICP备05009208号 </td> 
  </tr>
</table>

<!-- *********************流量统计******************************* -->
<script language="Javascript">
	document
			.write("<img src='http://124.162.23.38/counter2006/servlet/counter.counter?CID=78531518502273024&AID=-1&refer="
					+ escape(document.referrer)
					+ "&cur="
					+ escape(document.URL)
					+ "' border='0' alt='' width='0' height='0'>");
</script>

</body>
</html>