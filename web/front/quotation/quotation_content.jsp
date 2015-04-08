<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.content2 {
	white-space: pre-wrap; /*css-3*/
	white-space: -moz-pre-wrap; /*Mozilla,since1999*/
	white-space: -pre-wrap; /*Opera4-6*/
	white-space: -o-pre-wrap; /*Opera7*/
	word-wrap: break-word;
	width: 570px;
}
</style>
<div><s:if test="quoInfo.quotationContent != null">
	<pre class="content2"> <s:property
		value="quoInfo.quotationContent" /></pre>
</s:if> <s:else>
	<p>
	<table>
		<s:iterator value="quoInfo.quoInfoStat" status="stat">
			<s:if test="#stat.index == 0">
				<tr>
					<td>产品名称</td>
					<td>平均价格</td>
					<td>备注</td>
				</tr>
			</s:if>
			<tr>
				<td><a
					href="${pageContext.request.contextPath }/front/mall/quotation/QuotationCurve?quoPdt.quotationPCode=<s:property value="quotationProduct.quotationPCode"/>&quoMarket.marketCode=<s:property value="quotationMarket.marketCode"/>&mode=area"
					title="点击查看趋势图"><s:property
					value="quotationProduct.quotationPName" /></a></td>
				<td><s:property value="avgPrice" /> 元/公斤</td>
				<td><s:property value="comments" /></td>
			</tr>
		</s:iterator>
	</table>
</s:else></div>