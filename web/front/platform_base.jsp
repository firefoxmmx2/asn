<%@page import="com.bornsoft.asn.utils.common.PropertyFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = PropertyFactory.getDefaultProperty().getProperty("platform_base_path");
	String base = request.getContextPath() + basePath;
%>
<base href="<%=base %>"/>