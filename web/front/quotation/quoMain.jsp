<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页显示行情信息</title>
<STYLE type="text/css">
.list_nav {
	background: url("../../images/bg_img.gif") repeat-x scroll 0 0
		transparent;
	float: none;
	height: 30px;
}

.list_nav .lina_left {
	background: url("../../images/bg_img.gif") no-repeat scroll 0 -38px
		transparent;
	float: left;
	height: 30px;
	width: 6px;
}

.list_nav .wid_250 {
	width: 250px;
}

.list_nav .lina_title {
	float: left;
	height: 30px;
	line-height: 30px;
}

.list_nav .lina_right {
	background: url("../../images/bg_img.gif") no-repeat scroll -16px -38px
		transparent;
	float: right;
	height: 30px;
	width: 6px;
}

.list_text {
	padding: 5px 6px 6px;
}

.list_text,.list_text1 {
	margin-bottom: 10px;
	font-size:12px;line-height:22px; color:#000000
	
}

.clr {
	clear: both;
}

<!--
背景图片需要改 -->.list_nav .lina_title .ic_bg {
	background: url("<%=cp%>/image/icqn_01.gif") no-repeat scroll 0 10px
		transparent;
	padding-left: 15px;
}

.list_nav .lina_title h3 {
	color: #FFFFFF;
	float: left;
}

.list_nav .lina_title .more {
	float: right;
	padding-right: 5px;
}


.Mark2 {
	background: url("<%=cp%>/image/dl.gif") no-repeat scroll 0 7px
		transparent;
	padding-left: 13px;
}

.class_list1 {
	line-height: 23px;
}

a:link {	
	text-decoration: none;
    color: #000000;
}
a:visited {
　　text-decoration: none;
	color: #666666;
}
a:hover {
	color: #FF0000;
	text-decoration: underline;
}

</STYLE>
</head>
<body style="margin-left: 0px; margin-top: 0px; margin-right: 0px;margin-bottom: 0px;">
<div class="list_text" style="margin: 2px; margin-top: 2px; margin-right: 2px;margin-bottom: 2px; width: 266; height: 276; overflow: hidden">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<s:iterator value="quoList" status="s">
		<tr>
			<td class="xbnjh" valign="top"><a target="_blank"
				href="<%=cp%>/front/quotation/QuotationShow?qcd=<s:property value="quotationCode"/>">
			<s:property value="quotationName" /> </a></td>
		</tr>
	</s:iterator>
</table>
</div>
<%if(request.getParameter("showNum")==null){%>
<span>条数参数showNum未指定，默认<%=request.getAttribute("showNum")%>条</span>
<%}%>
</body>
</html>