<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.bornsoft.asn.bean.productType.ProductType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link
	href="${pageContext.request.contextPath }/css/newPtype/newPtype.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/newPtype/newPtype.js"></script>
<%
	@SuppressWarnings("unchecked")
	List<Map<String,Object>> ptype = (List<Map<String,Object>>)request.getAttribute("ptype");
	if(ptype == null)
		ptype = new ArrayList<Map<String,Object>>();
	
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="top" class="border_bule">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="entry">
			<%
				for(Map<String,Object> first: ptype){
			%>
			<tr>
				<td height="4" colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" class="fenlei_bg wz14 extend_item"
					id="entry_<%=((ProductType)first.get("cur")).getPtid() %>"><a
					href="${pageContext.request.contextPath }<s:property value="ptypeUrl"/>?type=<%=((ProductType)first.get("cur")).getPtcode() %>"
					target="_blank"><span class="p10"><%=((ProductType)first.get("cur")).getPttypeName() %></span></a></td>
			</tr>
			<%
					@SuppressWarnings("unchecked")
					List<Map<String,Object>> sec = (List<Map<String,Object>>)first.get("sub");
					if(sec == null)
						sec = new ArrayList<Map<String,Object>>();
					
					for(int ss=0;ss<sec.size();ss++){
						if(ss <= 3){
							if(ss % 2 == 0)
								out.println("<tr>");
							%>
			<td class="triangle"><a
				href="${pageContext.request.contextPath }<s:property value="ptypeUrl"/>?type=<%=((ProductType)sec.get(ss).get("cur")).getPtcode()%>"> <%=((ProductType)sec.get(ss).get("cur")).getPttypeName()%></a></td>
			<%
							if(ss % 2 == 1)
								out.println("</tr>");
						}
						else
							break;
					%>

			<%
					}	//loop second
				%>
			<%
				}// loop first
			%>
			<tr>
				<td height="4" colspan="2" class="bottom_line"></td>
			</tr>
		</table>
		<div class="pop_subentry hidden">
		<%
			for(Map<String,Object> first: ptype){
		%>
		<div id="subentry_<%=((ProductType)first.get("cur")).getPtid()%>"
			class="hidden">
		<h4>产品分类</h4>
		<%
			@SuppressWarnings("unchecked")
			List<Map<String,Object>> sec = (List<Map<String,Object>>)first.get("sub");
			if(sec == null)
				sec = new ArrayList<Map<String,Object>>();
			for(Map<String,Object> secType : sec)
			{
			%>
		<dl class="item">
			<dt><a
				href="${pageContext.request.contextPath }<s:property value="ptypeUrl"/>?type=<%=((ProductType)secType.get("cur")).getPtcode()%>">
			<span class="second"> <%=((ProductType)secType.get("cur")).getPttypeName()%></span>
			</a></dt>
			<dd>
			<%
					@SuppressWarnings("unchecked")
					List<Map<String,Object>> third = (List<Map<String,Object>>)secType.get("sub");
					if(third == null)
						third = new ArrayList<Map<String,Object>>();
					for(Map<String,Object> thirdType : third)
					{
				%> |<a
				href="${pageContext.request.contextPath }<s:property value="ptypeUrl"/>?type=<%=((ProductType)thirdType.get("cur")).getPtcode()%>">
			<span class="third"><%=((ProductType)thirdType.get("cur")).getPttypeName()%></span></a>
			<%
					} // loop third 
				%>
			</dd>
		</dl>
		<%
			} //loop second
			%>
		</div>
		<%
			} //loop first
		%>
		</div>
		</td>
	</tr>
</table>