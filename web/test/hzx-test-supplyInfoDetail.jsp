<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<style type="text/css">
		</style>
	</head>
	<body>
		<div>
			<s:property value="supplyInfo.title"/>
			<s:property value="#request.supplier.supplierId"/>
		</div>
	</body>
</html>