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
	.table_border a{font-weight:100;}
	.table_border a:link{ color:#333333 ; font-size:12px;text-decoration: none;} 
	.table_border a:visited{ color:#333333; font-size:12px;text-decoration: none} 
	.table_border a:hover{ color: #FF0000; font-size:12px;text-decoration: underline}
-->
</style>
</head>
<body>
<div id="viewarea" align="center">
	<table align="center" width="792" cellpadding="0" cellspacing="0">
		<tr>
			<td height="39" class="title">行情列表</td>
		</tr> 
		<tr>
		<td height="51" class="boder_y">
	 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td>查询条件</td>
          </tr>
        </table>
		</td>
	</tr> 
		<tr>
			<td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
				<tr>
					<td width="5%" height="28" align="center" bgcolor="#e8f5fb"><input type="checkbox" id="selectAll"/></td>
					<td width="50%" align="center" bgcolor="#e8f5fb"><strong>行情名称</strong></td>
					<td width="20%" align="center" bgcolor="#e8f5fb"><strong>来 源</strong></td>
					<td width="10%" align="center" bgcolor="#e8f5fb"><strong>发布人</strong></td>
					<td width="15%" align="center" bgcolor="#e8f5fb"><b>发布时间</b></td>
				</tr>
				<s:iterator id="list" value="quoInfoList" status="stat">
					<tr>
						<td align="center" height="30"><input type="checkbox"  name="quoInfoCodeArr" value="<s:property value="quoInfoList[#stat.index].quotationCode"/>"/></td>
						<td >&nbsp;<a href="<%=request.getContextPath() %>/admin/quotation/quotation-control!toUpdate2?quoInfo.quotationCode=<s:property value="quoInfoList[#stat.index].quotationCode"/>">
							<s:property value="quoInfoList[#stat.index].quotationName"/>
							</a>
						</td>
						<td align="center"><s:property value="quoInfoList[#stat.index].source"/> </td>
						<td align="center"><s:property value="quoInfoList[#stat.index].releasePerson"/> </td>
						<td align="center"><s:date name="quoInfoList[#stat.index].releaseDate" format="yyyy-MM-dd"/> </td>
					</tr>
				</s:iterator>
			</table>
		</td>
		</tr>
	</table>
</div>
</body>
</html>