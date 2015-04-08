<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表页面</title>
<style type="text/css">
<!--
	*{ padding:0; margin:0;}
	body{font-size:12px;}
-->
</style>
</head>
<body>
<div id="viewarea" align="center">
	<table width="800" border="1" style="border-collapse:collapse;margin-top:10px;">
		<tr>
			<td height="30" width="5%" align="center"><input type="checkbox" id="selectAll"/></td>
			<td width="30%" align="center"><strong>行情名称</strong></td>
			<td width="20%" align="center"><strong>来 源</strong></td>
			<td width="20%" align="center"><strong>发布人</strong></td>
			<td width="25%" align="center"><b>发布时间</b></td>
		</tr>
		<s:iterator id="list" value="quoInfoList" status="stat">
			<tr>
				<td align="center" height="20"><input type="checkbox"  name="quoInfoCodeArr" value="<s:property value="quoInfoList[#stat.index].quotationCode"/>"/></td>
				<td align="center"><a href="<%=request.getContextPath() %>/admin/quotation/quotation-control!toUpdate2?quoInfo.quotationCode=<s:property value="quoInfoList[#stat.index].quotationCode"/>">
					<s:property value="quoInfoList[#stat.index].quotationName"/>
					</a>
				</td>
				<td align="center"><s:property value="quoInfoList[#stat.index].source"/> </td>
				<td align="center"><s:property value="quoInfoList[#stat.index].releasePerson"/> </td>
				<td align="center"><s:property value="quoInfoList[#stat.index].releaseDate"/> </td>
			</tr>
		</s:iterator>
	</table>
</div>
</body>
</html>