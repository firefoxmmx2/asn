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
#huzxPageDiv{float:right; height:35px; padding-top:15px; text-align:right; color:#666; font-size:12px;padding-right:200px;}
#huzxPageDiv a{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; }	
#huzxPageDiv a:link { color:#666666; text-decoration: none; font-size:12px;} 
#huzxPageDiv a:visited { color:#666666; text-decoration: none;font-size:12px;} 
#huzxPageDiv a:hover { color: #000000;  background:#ebf9df;font-size:12px;} 
#huzxPageDiv a:active { color: #FF5151; text-decoration: underline;font-size:12px;}	
#huzxPageDiv span{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; background:#ebf9df;}
-->
</style>
</head>

<body>
		<table style="font-size: 12px;" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<s:iterator id="item" value="listP" status="list">
					<tr height="16">
						<td>&nbsp;<span style="color:red">[求]</span></td>	
						<td>&nbsp;<a target="_blank" href="${pageContext.request.contextPath}/front/info/showPurchaseInfo?template=xs&infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a></td>
					</tr>	
				</s:iterator>
			</tbody>
		</table>
		<form action="${pageContext.request.contextPath}/front/info/XiuShanInfo4" method="post" name="pageform" id="pageform">		
			<s:property value="#request.pageBar" escape="false"/>
		</form>
</body>
</html>