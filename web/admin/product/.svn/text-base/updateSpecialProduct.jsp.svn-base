<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update sp</title>
<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>    
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>

<style type="text/css"> 
<!--
body{font-size:12px;font-family:"新宋体";}

.section_title {
	font-size: 18px;
}
-->
.wz_left{ padding-right:10px; text-align:right; font-size:12px; color:#000000;}
</style> 
<script type="text/javascript">
//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"specialProduct.name:商品名称|required",
		"specialProduct.newPrice:商品单价|double",	
		//"specialProduct.newPrice:商品现价|required",
		"specialProduct.newPrice:商品单价|maxlength|10"
	);
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
	
});

</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			修改推荐商品
			</td>
		</tr>
	</table>
	<br>
	<s:form action="updateSpecialProduct" method="post" enctype="multipart/form-data" theme="simple" namespace="/admin/spe" id="form1">
		<input type="hidden" name="specialProduct.id" value="${specialProduct.id}"></input>
		<input type="hidden" name="specialProduct.smallPicPath" value="${specialProduct.smallPicPath}"></input>
		<input type="hidden" name="specialProduct.bigPicPath" value="${specialProduct.bigPicPath}"></input>
		<input type="hidden" name="specialProduct.unit" value="${specialProduct.unit}"></input>
		<input type="hidden" name="specialProduct.originalPrice" value="${specialProduct.originalPrice}"></input>
		<input type="hidden" name="specialProduct.productId" value="${specialProduct.productId}"></input>
		<input type="hidden" name="specialProduct.type" value="${specialProduct.type}"></input>
		<input type="hidden" name="specialProduct.supplierId" value="${specialProduct.supplierId}"></input>
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>商品名称：</td>
                	<td><input type="text" name="specialProduct.name" size="38" value="${specialProduct.name}"></input><span id="errorsDiv_specialProduct.name"></span></td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left" >商品顺序号：</td>
                	<td><input type="text" name="specialProduct.snumber" size="5" value="${specialProduct.snumber}"></input></td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left" ><img width="80" height="80" alt="" src='${pageContext.request.contextPath}/<s:property value="specialProduct.smallPicPath"/>'></td>
                	<td>商品图片：<input type="file" name="originalPic"/></td>
            	</tr>  
            	<tr>
            		<td height="30" class="wz_left" >商品原价：</td>
                	<td><input type="text" size="10" value="${specialProduct.originalPrice}" disabled="disabled"></input>元/${specialProduct.unit}</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>商品现价：</td>
                	<td><input type="text" name="specialProduct.newPrice" size="10" value="${specialProduct.newPrice}"></input>元/${specialProduct.unit}<span id="errorsDiv_specialProduct.newPrice"></span></td>
            	</tr>	
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="submit" value="确定" />&nbsp;
	              	<input type="button" value="返回" onclick="JavaScript:window.location.href='toSpecialProductList?type=${specialProduct.type}'" />
	              	</td>
	        	</tr>  
		</table>	
	</s:form>
</body>
</html>