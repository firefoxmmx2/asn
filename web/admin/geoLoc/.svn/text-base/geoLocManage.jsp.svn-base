<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>地区表维护</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/geoloc/geoloc.manage.js"></script>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
</head>
<body>
<s:form action="doUpdate" namespace="/admin/geoLocManage" theme="simple">
	<div id="geoLocManage">
		<div class="title">
			<span style="font-size:16pt">地区表维护</span>
		</div>
		<div style="clear: both; float: right">
			<span style="color:navy"><a href="http://www.stats.gov.cn/tjbz/xzqhdm/index.htm" target="_blank">原始数据来自于国家统计局</a></span>
			<span style="color:red">   警告：</span><span>重要数据，谨慎操作，注意格式。</span>
		</div>
		<div class="contt"  style="clear: both;">
			<s:textarea  name="geoLocData" rows="16" cols="66" style="width:100%" ></s:textarea>
		</div>
		<div class="btn"><s:submit value="更改"/>&nbsp;<s:reset value="重置"/></div>
	</div>
</s:form>
</body>
</html>