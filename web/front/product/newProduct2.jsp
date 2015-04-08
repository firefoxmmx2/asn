<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:0;padding:0;}
.picbox{ width:100px; height:140px;float:left;padding:0 20px 3px 22px;}	
.picbox a{width:100px; float:left;font-size:12px;}
.picbox img{padding:2px;border:1px solid #e4e4e4;}
.picbox a:link {
	color: #000000;
	text-decoration: none;
}
.picbox a:visited {
	color: #000000;
	text-decoration: none;
}
.picbox a:hover {
	color: #ff0000;
	text-decoration:underline;
}
.picbox a:active {
	color: #000000;
	text-decoration:underline;white-space:nowrap; 
}
.adiv{width: 100px; text-align: center;float:left;white-space:nowrap; overflow:hidden;text-overflow:ellipsis;padding-top:3px;}
.pricediv{width:100px;text-align: center;float:left;}
</style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" >

<div style="width:720px;float: left;border:1px solid #000000;background:#f0f4e5;">  

<%
int loopid=1;

%>
  <s:iterator value="newProduct">
<%
if(loopid<=3)
{
%>
		<div class="picbox" style="background:#f0f4e5;">  
     	<a href="product/displayDetailProduct.action?productId=<s:property value="productId"/>" target="_blank"> 
				<img src="<%=request.getContextPath()%><s:property value="smallPicPath"/>" width="100" height="100" border="0">
	 		</a>      
		 <a href="product/displayDetailProduct.action?productId=<s:property value="productId"/>" target="_blank">
		 	<div class="adiv"><%=loopid%><s:property value="productName"/></div>   
		 	<div class="pricediv"><font color="#FF7300">￥<strong><s:property value="price1"/></strong></font>元/<s:property value="productUnit"/></div>
		 </a> 
		</div>
<%
}
loopid ++;
%>
  </s:iterator>

</div>       

</body>
</html>