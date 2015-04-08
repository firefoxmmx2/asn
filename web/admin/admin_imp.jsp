<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.utils.common.WebContext"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%
	String bodyFile=(String)request.getAttribute("tilesDetailedPage");
	String headFile=bodyFile.replace(".jsp", "_head.jsp");
%>
<t:insertDefinition name="admin">
	<%if(WebContext.fileExits(request, headFile)){%>
	<t:putAttribute name="head" value='<%=headFile%>'></t:putAttribute>
	<%}%>
	<t:putAttribute name="content" value='<%=request.getAttribute("tilesDetailedPage")%>'></t:putAttribute>
</t:insertDefinition>

