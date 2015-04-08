<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.strhidden {
	overflow: hidden;
	-o-text-overflow: ellipsis; /* opera */
	text-overflow: ellipsis; /* ie, safari (webkit) */
	-moz-binding: url ( '../../../css/ellipsis.xml#ellipsis' );
	/* firefox */
	white-space: nowrap;
	width: 150px;
	word-wrap: normal;
	display: block;
}

.strhidden a {
	
}
</style>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="29" class="dht_left"><span class="pl30">最新加入企业</span></td>
	</tr>
	<tr>
		<td class="line">
		<table width="96%" border="0" cellspacing="0" cellpadding="0"
			align="center" class="mt5">
			<s:iterator value="recentEnterprises" begin="0"
				end="recentEnterprises.size()-1 > 9? 9:recentEnterprises.size()-1">
				<tr>
					<td class="xbd3">
					<div class="strhidden"><a title="<s:property value="fullName"/>" target="_blank"
						href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<s:property value="supplierId"/>"><s:property
						value="fullName" /></a></div>
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