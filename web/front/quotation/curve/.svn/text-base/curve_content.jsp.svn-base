<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquilib/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<link
	href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function()
	{
		
		$('input[name=startDate]').datepicker({dateFormat:'yy-mm-dd'});
		$('input[name=endDate]').datepicker({dateFormat:'yy-mm-dd'});
		
	});
</script>
<link />
<div>
<table>
	<tr>
		<td>
		<form
			action="${pageContext.request.contextPath }/front/mall/quotation/QuotationCurve"
			method="post"><input type="hidden"
			name="quoPdt.quotationPCode"
			value="<s:property value="quoPdt.quotationPCode"/>" /> <input
			type="hidden" name="quoMarket.marketCode"
			value="<s:property value="quoMarket.marketCode"/>" />
		<table>
			<tr>
				<td>开始时间:</td>
				<td><input name="startDate" size="10"
					value="<s:date name="startDate" format="yyyy-MM-dd"/>"
					readonly="readonly" /></td>
				<td>结束时间:</td>
				<td><input name="endDate" size="10"
					value="<s:date name="endDate" format="yyyy-MM-dd"/>"
					readonly="readonly" /></td>
				<td>统计图类型:</td>
				<td><select name="mode">
					<option value="area" selected="selected">区域图</option>
					<option value="pie">饼图</option>
				</select></td>
				<td><input type="submit" value="生成图形"></td>
			</tr>
		</table>
		</form>

		</td>
	</tr>
	<tr>
		<td><img src="<s:property value="imagePath"/>" alt="趋势图" /></td>
	</tr>
</table>
</div>