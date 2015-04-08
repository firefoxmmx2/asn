<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/quotationClip/quotationClip.js"></script>
<link href="${pageContext.request.contextPath }/css/quotationClip/quotationClip.css" type="text/css" rel="stylesheet"></link>
<table cellpadding="0" cellspacing="0" border="0">
	<s:iterator value="quoList" begin="0"
		end="quoList.size() > 10 ? 10:quoList.sise()">
		<tr>
			<td nowrap="nowrap" class="quo_title" align="left" valign="top">
			<div class="str_hidden"
				>
			<div class="quot fl"></div>
			<span class="quoListName"> <a title="<s:property value="quotationName"/>" target="_blank"
				href="${pageContext.request.contextPath }/front/mall/quotation/QuotationShow?qcd=${quotationCode}"><s:property
				value="quotationName" /></a> </span>
			<i class="cl"></i>
			</div>
			</td>
		</tr>
	</s:iterator>
</table>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jqellipsis.js"></script>
<script type="text/javascript">
	$(function()
	{
		$('.str_hidden').ellipsis();
	});
</script>