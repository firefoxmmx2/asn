<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.Enumeration"
    pageEncoding="UTF-8"%>
It's in tiles!
<%=request.getAttribute("message")%>

<%
for(Enumeration e = request.getAttributeNames(); e.hasMoreElements(); ){
		String attName = (String)e.nextElement();
		out.println("<br/>" + attName+"="+request.getAttribute(attName));
	}
%>