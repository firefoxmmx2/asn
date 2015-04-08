<%@page import="org.apache.tiles.definition.Definitions"%>
<%@page import="org.apache.tiles.impl.BasicTilesContainer"%>
<%@page import="org.apache.tiles.AttributeContext"%>
<%@page import="org.apache.tiles.web.util.AttributeContextMutator"%>
<%@page import="org.apache.tiles.servlet.context.ServletUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.struts2.tiles.StrutsTilesContainerFactory"%>
<%@page import="org.apache.tiles.factory.TilesContainerFactory"%>
<%@page import="org.apache.tiles.TilesContainer"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.bornsoft.asn.utils.common.PropertyFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.utils.common.WebContext"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%
	String bodyFile=(String)request.getAttribute("tilesDetailedPage");
	String headFile=bodyFile.replace(".jsp", "_head.jsp");
	StringBuffer currentFile = request.getRequestURL();
	
	String defaultTemplate = PropertyFactory.getDefaultProperty().getProperty("platform_default_template");
	if(defaultTemplate == null || defaultTemplate.equals(""))
		defaultTemplate = currentFile.delete(0,currentFile.lastIndexOf("/")+1).toString().replaceAll("_imp.jsp","");
	String template = (String)request.getParameter("template");
	if(template == null || template.equals(""))
		template = defaultTemplate;
	else{
		//獲取當前TILES容器
		BasicTilesContainer tc = (BasicTilesContainer)config.getServletContext().getAttribute("org.apache.tiles.CONTAINER");
		//獲取容器里所有DEFINITIONS
		Definitions defines =  tc.getDefinitionsFactory().readDefinitions();
		
		template = defines.getBaseDefinitions().containsKey(template) ? template:defaultTemplate;
	}
	
%>
<t:insertDefinition name="<%=template %>">
	<%if(WebContext.fileExits(request, headFile)){%>
	<t:putAttribute name="head" value='<%=headFile%>'></t:putAttribute>
	<%}%>
	<t:putAttribute name="content" value='<%=request.getAttribute("tilesDetailedPage")%>'></t:putAttribute>
</t:insertDefinition>

