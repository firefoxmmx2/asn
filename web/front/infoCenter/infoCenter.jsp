<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>信息</title>
<link rel="stylesheet" rev="stylesheet" href="../../css/supplierhuzx.css" type="text/css" />

<style type="text/css">

</style>
	<script type="text/javascript">

	</script>
</head>

<body>
  	<div style="background-color: #EEE;position: relative;float: left;width: 950px; margin-left: 12px;">
		<div style="text-align: center; color: black; font-size: 16px;font-weight: 700"><s:property value="info.title"/></div>
		<div style="position: relative; float: left; width:948px;">
			<p style="text-indent: 2em;font-size: 14px; ">
				<s:property value="info.content"/>
			</p>
		</div>
		<div style="position: relative; float: right; width:935px; text-align: right; margin-right: 10px;">信息创建日期：<s:date name="info.createTime" format="yyyy-MM-dd"></s:date></div>
	</div>
</body>
</html>