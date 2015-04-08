<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="<%=request.getContextPath()%>/front/css/other.css" rel="stylesheet" type="text/css" />
</head>
  <frameset cols="200,*">
    <frame src="<%=request.getContextPath()%>/plain/order/left.jsp" name="left" scrolling="no" noresize="noresize" id="_left"  frameborder="no"/>
    <frame src="frontQueryOrder.action?orderStatus=WFK" name="main" id="main"  scrolling="no" frameborder="no"/>
  </frameset>
</html>



