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
<title>新增销售信息</title>
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
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"saleSource.title:销售信息标题|required",
		"saleSource.source:销售资料|required",
		"saleSource.source:销售资料|maxlength|500"
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
			<td width="55" align="center"><img src="../../../image/comdo/pen.png"></td>
			<td width="737">
			新增销售信息
			</td>
		</tr>
	</table>
	<br>
	<s:form action="/do/customer/bizOpp/createSaleSource" method="post" id="form1" enctype="multipart/form-data">
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
			<tr>
            	<td height="30" class="wz_left" ><span style="color:red;">*</span>销售信息标题：</td>
                <td><input type="text" name="saleSource.title" size="38"></input><span id="errorsDiv_saleSource.title"></span></td>
            </tr>
            <tr>
	            <td height="30" class="wz_left" ><span style="color:red;">*</span>销售资料：</td>
	            <td>
	            <textarea name="saleSource.source" rows="15" cols="60"></textarea>
	            <span id="errorsDiv_saleSource.source"></span>
            </td>
           </tr>
           <tr>
           	<td colspan="2">&nbsp;</td>
           </tr>
           	<tr>
            	<td height="30" class="wz_left" >销售流程：</td>
                <td>
                <textarea name="saleSource.proce" rows="15" cols="60"></textarea>
                </td>
            </tr>

            <tr>
            	<td height="30" class="wz_left" >附件：</td>
                <td>
                	<input type="file" name="file"/><span style="color:gray;">&nbsp;附件最大支持20M</span>
                </td>
            </tr>
            <tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="submit" value="提交"/>&nbsp;&nbsp;<input type="button" value="返回资料列表" onclick="window.location.href='toSaleSourceList'" /></td>
	        </tr>  	
		</table>
	</s:form>
</body>
</html>