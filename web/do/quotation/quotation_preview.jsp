<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div style="min-width: 500px; min-height: 300px; border:1px #666666 solid;">
<s:hidden name="flag" />
<s:hidden name="formAction"/> 
<s:iterator value="quoL"
	status="stat">
	<div style="border-bottom: 1px #033333 dashed; ">分隔线</div>
	<div>
	<div style="float: left"><input type="checkbox"
		name="quoInfoCodeArr"
		value="<s:property value="quotationCode"/>" checked="checked">
	</div>
	<div>
	<div><span>行情名称：</span><span><s:property
		value="quotationName" /> </span></div>
	<div><span>来 源：</span><SPAN><s:property
		value="source" /> </SPAN></div>
	<div><span>发布人：</span><SPAN><s:property
		value="releasePerson" /> </SPAN></div>
	<div><span>发布时间：</span><SPAN><s:property
		value="releaseDate" /> </SPAN></div>
	<div>
	<table>
		<s:iterator value="quoInfoStat" status="s"
			id="quoSL">
			<s:if test="#s.index == 0">
				<tr>
					<td>产品名称</td>
					<td>最高价格</td>
					<td>最低价格</td>
					<td>平均价格</td>
					<td>备注</td>
				</tr>
			</s:if>
			<tr>
				<td><s:property value="productName" /></td>
				<td><s:property value="highestPrice" /> <s:property
					value="priceUnit" />/<s:property
					value="measureUnit" /></td>
				<td><s:property value="lowestPrice" /> <s:property
					value="priceUnit" />/<s:property
					value="measureUnit" /></td>
				<td><s:property value="avgPrice" /> <s:property
					value="priceUnit" />/<s:property
					value="measureUnit" /></td>
				<td><s:property value="comments" /></td>
			</tr>
		</s:iterator>
	</table>
	</div>
	</div>
	</div>
</s:iterator></div>
<div><span><s:submit value="确认" method="doNews" action="quotation-control" /> </span><span><input
	type="button" value="取消" onclick="javascript: window.history.back();"/> </span></div>