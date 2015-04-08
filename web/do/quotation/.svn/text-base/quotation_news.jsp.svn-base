<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String cp = request.getContextPath(); %>

	<div id="news_main">
	<s:hidden name="flag" id="flag" label="页面状态"/>
		<div  style="width: 400px; min-height: 200px; border:1px #666666 solid;">
			<div  id="tt" style="float: left">
				<s:iterator value="upFiles">
					<div> <s:file name="upFiles"/></div><div id="errorsDiv_upFiles"></div>
				</s:iterator>
			</div>
			<div style="float: left; height: 44px; width: 235px">  <input type="button" name="addFiles" value="添加文件"/></div>
		</div>	
		<div> <input type="button" action="quotation-control" name="action:quotation-control!doPreview" value="预览"/> </div>
	</div>
