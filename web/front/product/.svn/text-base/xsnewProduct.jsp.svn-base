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
.picbox{ width:100px; height:140px;float:left;padding:0 6px 3px 6px;}	
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
<body>

<div style="width:650px;float: left;">  
           
  <s:iterator value="newProduct">
              
     <div class="picbox">  
     <a href="displayDetailProduct.action?productId=<s:property value="productId"/>&template=<s:property value="template"/>" target="_blank"> 
		<img src="<%=request.getContextPath()%><s:property value="bigPicPath"/>.100x100" width="100" height="100" border="0">
	 </a>      
	 <a href="displayDetailProduct.action?productId=<s:property value="productId"/>&template=<s:property value="template"/>" target="_blank">
	 	<div class="adiv"><s:property value="productName"/></div>   
	 	<div class="pricediv"><font color="#FF7300">￥<strong><s:property value="price1"/></strong></font>元/<s:property value="productUnit"/></div>
	 </a>
	            
  	</div>
  </s:iterator>

</div>       

</body>
</html>