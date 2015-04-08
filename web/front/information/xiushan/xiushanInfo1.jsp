<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>供求信息</title>
<style type="text/css">
<!--

body{
	font-size:12px; 
	font-family:"新宋体"; 
	 PADDING-BOTTOM: 0px; MARGIN: 0px;
}
a:link {
	color: #313131;
	text-decoration: none;
}
a:visited {
	color: #313131;
	text-decoration: none;
}
a:hover {
	color: #ff0000;
	text-decoration:underline
}
a:active {
	color: #313131;
	text-decoration: none;
}
-->
</style>
</head>

<body>
		<table style="font-size: 12px;" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<s:iterator id="item" value="listS" status="list">
					<tr height="24">
						<td>&nbsp;<span style="color:green">[供]</span></td>
						<td>&nbsp;<a target="_blank" href="${pageContext.request.contextPath}/front/info/showSupplyInfo?template=xs&infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a></td>
					</tr>	
				</s:iterator>
			</tbody>
		</table>
</body>
</html>