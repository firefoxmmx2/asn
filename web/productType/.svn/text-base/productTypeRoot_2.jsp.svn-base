<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.*"%>
<%@page import="com.bornsoft.asn.bean.productType.ProductType;"%>

<link href="/asn/css/main.css" rel="stylesheet" type="text/css" />

<table width="100%" height="100" cellspacing="0" cellpadding="2"
				border="0" bordercolordark="#ffffff">
				<tbody>
						<%
						int i=0;
						List list = (List)((Map)request.getAttribute("ptL")).get("ptFirstL");
						String url0 = (String)request.getAttribute("url0");
						
						if (list != null){
							for(i=0; i< list.size()/3 ; i++){
						%>
						<tr>
						<%
						for (int j = 0; j<3 && i*3 + j<list.size() ; j++) {
							ProductType item1 = (ProductType) list.get(i*3+j);
						%>
						<td align="left" class="xxx-1" valign="top">
							<table cellspacing="0" cellpadding="2" border="0" class="hsbx-1">
							<tbody>
								<tr>
									<td align="middle" width="100%" height="100%"><a
                                                                                href="<%=url0%>&type=<%=item1.getPtcode()%>" target="_blank"><img border=0
										src="${pageContext.request.contextPath }/image/type-icons/<%=item1.getPtcode()%>.jpg" style="width:91px;height:91px;"></a></td>
								</tr>
							</tbody>
						</table>
						</td>
						
						<td align="left"  class="wz-14"  width="30%" valign="top">
							<table>
								<tr>
								<td><a
							href="<%=url0%>&type=<%=item1.getPtcode()%>" target="_blank"><strong><font
							color="#ff6600"><%=item1.getPttypeName()%></font></strong></a></td>
								</tr>
								<tr>
									<table width="98%" cellspacing="0" cellpadding="0" border="0"
							xmlns="http://www.w3.org/TR/xhtml1/strict" class="wz-12">
							<tbody>
								<tr>
									<td width="98%" valign="center" height="6"></td>
								</tr>
								<%
									if (((Map) request.getAttribute("ptL")).get("ptSecL") != null)
								%>
								
								<tr>
									<td valign="center">
									<div style="clear:both;">
									<%
									for (ProductType item2 : (List<ProductType>) ((Map) request
														.getAttribute("ptL")).get("ptSecL")) {
								%>
									<%
									if (item2.getPtparentid() == item1.getPtid()) {
										String showName=item2.getPttypeName();
										if(showName.length()>4) showName=showName.substring(0, 4);
									%>
										<div style="padding-left:5px; padding-right:12px; width: 58px; overflow:hidden; float: left; white-space: nowrap ; font-size: 12px;">
										<a target="_blank" href="<%=url0%>&type=<%=item2.getPtcode()%>"><%=showName%></a>
										</div>
									<%
									} // if item2
								%>
								<%
									} // for item2
								%>
								</div>
								</td>
								</tr>
							</table>
						</td>
						
						<%
						} //for item1
					%>
					</tr>
					
					<% } 
							
						}%>
				</tbody>
			</table>
			