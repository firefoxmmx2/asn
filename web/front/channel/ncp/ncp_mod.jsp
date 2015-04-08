<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cp=request.getContextPath();
%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/cqapg.ico"  type="image/x-icon" />
<link href="<%=cp%>/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<t:insertAttribute name="head" ></t:insertAttribute>
<title>绿优鲜网上超市| mall.cqapg.com</title>
</head>
<body>

<div style="width: 980px; margin:0 auto;">
<t:insertAttribute name="top"></t:insertAttribute>
<t:insertAttribute name="content" ></t:insertAttribute>
<t:insertAttribute name="bottom"></t:insertAttribute>
</div>


<!-- *********************流量统计******************************* -->
<script language="Javascript">
	document
			.write("<img src='http://124.162.23.38/counter2006/servlet/counter.counter?CID=78250043525562368&AID=-1&refer="
					+ escape(document.referrer)
					+ "&cur="
					+ escape(document.URL)
					+ "' border='0' alt='' width='0' height='0'>");
</script>

</body>
</html>

<!-- 
<definition name="platform" template="/front/platform_mod.jsp">
    	<put-attribute name="head" value=""/>
    	<put-attribute name="top" value="/front/platform_top.jsp"/>
    	<put-attribute name="content" value=""/>
    	<put-attribute name="bottom" value="/front/platform_bottom.jsp" />
    </definition>
    
    <definition name="ncp" template="/front/channel/ncp/ncp_mod.jsp">
    	<put-attribute name="head" value=""/>
    	<put-attribute name="top" value="/front/channel/ncp/ncp_top.jsp"/>
    	<put-attribute name="content" value=""/>
    	<put-attribute name="bottom" value="/front/platform_bottom.jsp" />
    </definition>
 -->