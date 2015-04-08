<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@page import="com.bornsoft.asn.utils.common.WebContext"%>
<%
	String bodyFile=(String)request.getAttribute("tilesDetailedPage");
	String headFile=bodyFile.replace(".jsp", "_head.jsp");
%>

<t:insertDefinition name="test-map.testmap">
	<t:putAttribute name="head" value=''></t:putAttribute>
	<t:putAttribute name="body" value='<%=request.getAttribute("tilesDetailedPage")%>'></t:putAttribute>
</t:insertDefinition>
