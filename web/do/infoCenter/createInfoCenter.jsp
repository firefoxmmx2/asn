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
<title>create info</title>
<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>    
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-timer.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/facade-editor.js"></script>
<script type="text/javascript" src="<%=cp%>/js/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

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
		"info.title:信息标题|required",
		"info.title:信息标题|maxlength|30",
		"info.content:信息正文|required",
		"info.content:信息正文|maxlength|500"
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
			新建信息
			</td>
		</tr>
	</table>
	<br>
	<s:form action="/do/infoc/createInfoCenter" method="post" id="form1" theme="simple">
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>信息标题：</td>
                	<td><input type="text" name="info.title" size="38"></input><span id="errorsDiv_info.title"></span></td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>信息正文：</td>
                	<td>
                	<textarea name="info.content" rows="15" cols="60"></textarea>
                	<span id="errorsDiv_info.content"></span>
                	</td>
            	</tr>
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td>
	              	<input type="submit" value="发布" class="button5" id="fb" />&nbsp; 
	              	<input type="hidden" name="info.status" value="Y" id="status"/>
	              	<input type="button" value="保存为草稿" onclick="JavaScript:document.getElementById('status').value='N';document.getElementById('fb').click();"/>
	              	</td>
	        	</tr>  
		</table>	
	</s:form>
</body>
</html>