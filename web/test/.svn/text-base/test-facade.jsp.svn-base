<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.bornsoft.asn.service.facade.FacadeService, com.bornsoft.asn.bean.facade.ProductFacade,java.util.List"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jspath.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-timer.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/facade-editor.js"></script>
<script type="text/javascript">
function onOpen(){
	window.open("/asn/do/productType/productType?show=3","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}

function onOpen2(){
	window.open("/asn/do/productType/productType?show=3&fldOfName=productType2&fldOfCode=productSupply.productType2","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}


$(document).ready(function(){
	// 初始化立面编辑器，参数依次是：分类号输入框、立面编辑容器、保存立面信息的目标字段的name或者ID
	facadeEditor.init("productSupply.productType", "productSupply.facadeEditor", "productSupply.facade");
	// 初始化立面编辑器，参数依次是：分类号输入框、立面编辑容器、保存立面信息的目标字段的name或者ID，现有的立面值
	facadeEditor.init("productSupply.productType2", "productSupply.facadeEditor2", "productSupply.facade2", "品牌-4OOO制茶工艺-7绿茶");
});

</script>
</head>
<body>
<form method="post" enctype="application/x-www-form-urlencoded" action="test-facade2.jsp">
<fieldset>
	<LEGEND>带立面功能新增商品例子</LEGEND> 
		<div>产品类别1：<span><input type="text" name="productType"/>
		<input type="hidden" name="productSupply.productType"/>
		<input type="button" value="选择" onclick="onOpen()" /></span><span id="errorsDiv_productSupply.productType"></span>
			<span id="productSupply.facadeEditor"></span>
			<input type="hidden" name="productSupply.facade"/>
		</div>
</fieldset>
		<br/>
<fieldset>
	<LEGEND>带立面功能修改商品例子</LEGEND> 
		<div>产品类别2：<span><input type="text" name="productType2" value="专业合作社产品-茶叶-速溶茶"/>
		<input type="hidden" name="productSupply.productType2" value="0001-0004-0007" />
		<input type="button" value="选择" onclick="onOpen2()" /></span><span id="errorsDiv_productSupply.productType"></span>
			<span id="productSupply.facadeEditor2"></span>
			<input type="hidden" name="productSupply.facade2" />
		</div>
</fieldset>
<input type="submit" value="提交">
</form>
</body>
</html>