<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<style type="text/css">
		</style>
		<title>临时供求主页</title>
	</head>
	<body>
		<div>
			<span><a href="${pageContext.request.contextPath}/front/info/showSupplyInfoList">供应信息</a></span>
			<span><a href="${pageContext.request.contextPath}/front/info/showPurchaseInfoList">求购信息</a></span>
			<span><a href="${pageContext.request.contextPath}/front/info/showInfoMain">供求主页</a></span>
			<span><a href="${pageContext.request.contextPath}/front/info/showInfo1">供求DIV1</a></span>
			<span><a href="${pageContext.request.contextPath}/front/info/showInfo2">供求DIV2</a></span>
		</div>
	</body>
</html>