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
	width: 205px;
	word-wrap: normal;
	display: block;
}
</style>
<table width="226" border="0" cellspacing="0" cellpadding="0"
	class="mt10">
	<tr>
		<td class="dht_left">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="80%"><span class="wz_title">最新加入企业</span></td>
				<td width="20%"><a target="_blank" href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<s:property value="supplierId"/>">更多</a>&gt;&gt;</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="253" valign="top" class="line">
		<table width="94%" border="0" cellspacing="0" cellpadding="0"
			align="center" class="mt5">
			<s:iterator value="recentEnterprises">
				<tr>
					<td class="xbd3">
					<div class="strhidden">
					<a title="<s:property value="fullName"/>" target="_blank"
						href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<s:property value="supplierId"/>">
					<span><s:property value="fullName" /></span></a>
					</div>
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