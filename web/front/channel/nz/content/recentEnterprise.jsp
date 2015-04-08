<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.strhidden {
	overflow: hidden;
	-o-text-overflow: ellipsis; /* opera */
	text-overflow: ellipsis; /* ie, safari (webkit) */
	-moz-binding: url '../../../css/ellipsis.xml#ellipsis'; /* firefox */
	white-space: nowrap;
	width: 195px;
	word-wrap: normal;
	display: block;
}
</style>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	height="80" class="mt10">
	<tr>
		<td><img
			src="${pageContext.request.contextPath}/image/channel/nz/ncpjtgg.jpg" /></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"
	class="mt10">
	<tr>
		<td><img
			src="${pageContext.request.contextPath}/image/channel/nz/zxjrqy.jpg"
			width="211" height="30" /></td>
	</tr>
	<tr>
		<td height="252" valign="top" class="line">
		<table width="94%" border="0" cellspacing="0" cellpadding="0"
			align="center" class="mt5">
			<s:iterator value="recentEnterprises">
				<tr>
					<td class="xbd3">
					<div class="strhidden"><a target="_blank"
						title="<s:property value="fullName"/>"
						href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<s:property value="supplierId"/>">
					<span><s:property value="fullName" /></span></a></div>
					</td>
				</tr>
			</s:iterator>
		</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
	$(function()
	{
		$('.strhidden').ellipsis();
	});
</script>