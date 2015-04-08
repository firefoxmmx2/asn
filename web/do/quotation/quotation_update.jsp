<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 新增页面</title>
<style type="text/css">
<!--
	*{ padding:0; margin:0;}
	body{font-size:12px;}
-->
</style>
</head>
<body>
		<s:hidden name="flag" id="flag" label="页面状态"/>
		<s:hidden name="quoInfo.updatePerson" label="更新人"/>
		<s:hidden name="quoInfo.updateDate" label="更新时间"/>
		<s:hidden name="quoStatDataList" />
		<div id="toControl" align="center">
			<div align="center"><s:actionmessage/></div>			
			<table width="800" style="border:1px #666 solid;margin-top:10px;">
				<tr>
					<td height="30" align="right" width="80">行情编号：</td>
					<td><s:textfield name="quoInfo.quotationCode" label="行情编号"/>
					 <input type="button" name="action:quotation-control!toUpdate2" value="确认" action="quotation-control" method="toUpdate2"/>
					 <span id="errorsDiv_quoInfo.quotationCode"></span></td>
				</tr>
				
				<tr>
					<td height="30" align="right">行情标题：</td>
					<td><s:textfield name="quoInfo.quotationName" size="30" label="行情标题"/>
					<span id="errorsDiv_quoInfo.quotationName"></span></td>
				</tr>
				
				<tr>
					<td height="30" align="right">来   源：</td>
					<td><s:textfield name="quoInfo.source" label="来源"/>
					<span id="errorsDiv_quoInfo.source"></span></td>
				</tr>
				
				<tr>
					<td colspan="2"><table>
						<tr>
							<td height="30" align="right" width="80">发布人：</td>
							<td><s:textfield name="quoInfo.releasePerson" size="10" label="发布人"/>
							<span id="errorsDiv_quoInfo.releasePerson"></span></td>
							<td align="right" width="80">发布时间：</td>
							<td><s:textfield name="quoInfo.releaseDate" size="10" label="发布时间"/>
							<span id="errorsDiv_quoInfo.releaseDate"></span></td>
						</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td height="30" align="right">行情内容：</td>
					<td><s:textarea name="quoInfo.quotationContent" cols="30" rows="3" label="行情内容"/></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<table id="quoStat">
						</table>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="left"><img src="<%=cp %>/image/add_48.png" id="newStat" title="增加价格统计"></img> </td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="button" name="action:quotation-control!doUpdate" value="更  改" action="quotation-control" method="doUpdate"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cancle" value="取  消" onclick="javascript: window.history.back();"/>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>