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
#huzxPageDiv{float:right; height:35px; padding-top:15px; text-align:right; color:#666; font-size:12px;padding-right:200px;}
#huzxPageDiv a{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; }	
#huzxPageDiv a:link { color:#666666; text-decoration: none; font-size:12px;} 
#huzxPageDiv a:visited { color:#666666; text-decoration: none;font-size:12px;} 
#huzxPageDiv a:hover { color: #000000;  background:#ebf9df;font-size:12px;} 
#huzxPageDiv a:active { color: #FF5151; text-decoration: underline;font-size:12px;}	
#huzxPageDiv span{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; background:#ebf9df;}
</style>
	<script type="text/javascript">

	</script>
</head>

<body>
  <a href="<%=cp%>/front/mall/infoc/showInfoCenterList?id=1">信息中心列表</a>
</body>
</html>