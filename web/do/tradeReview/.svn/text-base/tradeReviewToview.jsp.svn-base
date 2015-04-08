<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui-1.8rc3.custom.min.js"></script>

<div>
<table height="51" align="center" width="792" cellspacing="0"
	cellpadding="0">
	<tbody>
		<tr>
			<td height="39" class="title">系统参数配置表</td>
		</tr>

		<tr>
			<td height="51" class="boder_y">
				有<s:property value="trList.size"/>条,对你的评论。
			</td>
		</tr>

		<tr>
			<td>
			<table border="0" width="100%" cellspacing="0" cellpadding="0"
				class="table_border" style="margin-top: 20px;">
				<tr>
					<td  bgcolor="#e8f5fb" align="center" width="200">评价分数</td>
					<td bgcolor="#e8f5fb" align="center" width="200">订单号</td>
					<td bgcolor="#e8f5fb" align="center" width="200">评价留言</td>
					<td bgcolor="#e8f5fb" align="center" width="200">评价人</td>
					<td bgcolor="#e8f5fb" align="center" width="200">操作</td>
				</tr>
				<!-- 评价内容 -->
				<s:iterator value="trList" status="s">
					<tr>
						<td height="30">${(product + delivery + communication) / 3 }</td>
						<td><s:property value="orderId"/></td>
						<td><s:property value="remark" /></td>
						<td><s:property value="buyerName" /></td>
						<td>暂无</td>
					</tr>
				</s:iterator>
			</table>

<!--<table border="0" align="center" width="790" cellspacing="1" cellpadding="2">
						<tbody><tr align="right"><td align="right" width="98%"><a href="#">首   页</a>&nbsp;<a href="#">上一页</a>&nbsp;<a href="#">下一页</a>&nbsp;<a href="#">末  页</a>&nbsp;&nbsp; 共2条记录  每页<select onchange="this.form.page.value=1;this.form.pageSize.value=this.value;this.form.submit();" name="pagesize" size="1"><option value="5">5</option><option selected="" value="10">10</option><option value="20">20</option><option value="50">50</option><option value="100">100</option></select>条 分1页显示 转到<select onchange="this.form.page.value=this.value;this.form.submit();"><option selected="" value="1">1</option></select>页<input type="hidden" id="thePage" name="page" value="1"> <input type="hidden" id="thePageSize" name="pageSize" value="10"> <input type="button" style="display: none;" onclick="this.form.submit()" id="pageButton"></td></tr>
					</tbody></table>-->
</td>
</tr>
</tbody>
</table>

</div>