<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="keywords" content="重庆农产品,重庆农产品网,重庆市农产品电子商务平台,农产品电子商务平台，农产品现代流通,农产品,农副产品,C2B2B,F2C2B,农产品资源数据库,网上交易,产销对接,农超对接,电子农贸市场,进出口贸易,外贸出口推广,农博会,冷链物流,社区终端,连锁配送,绿色农产品网上商城，在线订购,网上支付,网上拍卖,网上典当,供求,产品，企业，行情,区县子站，专业社产品，林下产品,供销合作社,新网工程,农民专业合作社."/>
<meta name="description" content="重庆市农产品电子商务平台（www.cqncp.com）是西部一流、国内领先的农产品网上交易平台、产销及农超对接平台、电子交易市场平台及外贸出口推广平台，是农产品市场拓展、网络推广及绿色生态农产品社区终端连锁配送行业的首选门户网站及协同运营平台，将建设重庆最大、最先进的复合型第三方农产品现代流通网络服务体系为己任，以互联网、多媒体技术、C2B2B/F2C2B复合电子商务及冷链物流、社区终端配送为运营手段,专注于为三农中小客户提供全方位的农产品电子商务综合服务."/>


<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/cqncp.ico"  type="image/x-icon" />
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css" />
<t:insertAttribute name="base"></t:insertAttribute>
<t:insertAttribute name="head" ></t:insertAttribute>
<title><t:insertAttribute name="title_name"/></title> 
</head>
<body>

<!-- ****************添加的背景音乐************** 
<bgsound src="<%=request.getContextPath()%>/flash/platform/bbg.mp3" loop="-1"  />

-->

<div style="width: 980px; margin:0 auto;">
<t:insertAttribute name="top"></t:insertAttribute>
<t:insertAttribute name="content" ></t:insertAttribute>
<t:insertAttribute name="bottom"></t:insertAttribute>
</div>


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