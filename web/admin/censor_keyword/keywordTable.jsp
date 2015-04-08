<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String cp=request.getContextPath();
%>
<html>
	<head>
		<style type="text/css">
			
		</style>
		<script type="text/javascript">
			function reset(){
				document.location="<%=cp%>/admin/ck/toKeywordTable";
			}
		</script>
	</head>
	<body>
		<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
			<tr>
				<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
				<td width="737">
				关键词维护表
				</td>
			</tr>
		</table>
		<div style="color: red;font-size: 16px; text-align: center;"><s:property value="#request.tip"></s:property></div>
		<div style="width: 790px;">
			<s:form action="/admin/ck/updateKeyword" method="post" theme="simple">
				<div>
				<textarea rows="20" cols="96" name="keyword"><s:property value="keyword"/></textarea>
				</div>
				<div style="text-align: center;">
				<input type="submit" value="确定"/>
				<input type="button" onclick="reset();"  value="重置"/>
				</div>
			</s:form>
		</div>
	</body>
</html>