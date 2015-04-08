<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType" %>     
<%
	String cp=request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品分类</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript">
	// get parameters
	var parameters=butil.getParameters();
	var show=parameters["show"];
	// default field names
	var fldOfName=(show=="3") ? "productType" : 'producttype';
	var fldOfCode=(show=="3") ? "productSupply.productType" : "producttypecode";
	// user specified field names
	if(parameters["fldOfName"]) fldOfName=parameters["fldOfName"];
	if(parameters["fldOfCode"]) fldOfCode=parameters["fldOfCode"];

	function onselProductType(val,code,show,typeName){

		if(show == "2"){
			//向父页面生成复选框的代码
			opener.document.getElementById("tocheckboxdiv").innerHTML = opener.document.getElementById("tocheckboxdiv").innerHTML+"<input type='checkbox' class='frmrd' name='supplier.productType' value='"+typeName+"' id='productType' checked='checked' />"+typeName;
		}else{
				//向父页面输入框填值的代码
				opener.document.getElementsByName(fldOfName)[0].value = val;
				opener.document.getElementsByName(fldOfCode)[0].value = code;
		}
				
		window.close();
	}

</script>
</head>
<style type="text/css">
<!--
body{ font-size:12px;}
a:link { color:#0066CC; text-decoration: none} 
a:visited { color:#0066CC; text-decoration: none} 
a:hover { color: #800080; background-color:#FF9900; text-decoration: underline} 
a:active { color: #800080; text-decoration: underline} 
a { display: inline-block; padding-left:5px; padding-right:5px; padding-top:2px;}  
.tds{ width:70px; padding-top:3px;}
-->
</style>
<body>
<table width="100%" cellpadding="0" cellspacing="0">
	<%
		for(ProductType item:(List<ProductType>)request.getAttribute("firstType")) {
	%>	
		
	<tr>
		<td width="100%" height="25" bgcolor="#F5F5F5" style="color:#FF9900;">
			<STRONG><%=item.getPttypeName() %></STRONG>
		</td>
	</tr>
	
	<tr>	
		<td><table width="100%" cellpadding="0" cellspacing="0">
			<%
				for(ProductType item1:(List<ProductType>)request.getAttribute("secondType")) {
					if(item1.getPtparentid() == item.getPtid()){
			%>	  
		
			<tr style="padding-top:3px;">
				<td valign="top" class="tds"><strong><%=item1.getPttypeName() %>:</strong></td>
				<td width="540">
				<%
					for(ProductType item2:(List<ProductType>)request.getAttribute("thridType")) {
						if(item2.getPtparentid() == item1.getPtid()){
				%>				
					<a href="javascript:" onclick="javascript:onselProductType('<%=item.getPttypeName() %>-<%=item1.getPttypeName() %>-<%=item2.getPttypeName() %>','<%=item2.getPtcode() %>','<%=request.getParameter("show") %>','<%=item2.getPttypeName() %>')">	<%=item2.getPttypeName() %></a>
				<% 
						}
					}
				%>																
				</td>
			</tr>
			<% 
						}
					}
			%>			
		</table></td>		
	</tr>	
	
	<% 
		}
	%>	
	
</table>

</body>
</html>
