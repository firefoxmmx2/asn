<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>求购信息维护</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui-1.8rc3.custom.min.js"></script>
        <!--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/lib/jquery.js"></script>-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/lib/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/lib/jquery.hotkeys.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/lib/sarissa.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/jquery.tree.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.checkbox.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.contextmenu.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.hotkeys.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.metadata.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.themeroller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.xml_flat.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsTree.v.0.9.9a2/plugins/jquery.tree.xml_nested.js"></script>
	<LINK href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>
	<SCRIPT src="${pageContext.request.contextPath}/js/yav/yav.js"></SCRIPT>
	<SCRIPT src="${pageContext.request.contextPath}/js/yav/yav-config.js"></SCRIPT>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/purchase/purchase.manage.js"></script>
    <link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
</head>
<body>
			<s:form id="psForm" action="doAction" method="post" namespace="/front/psManage" theme="simple">
			<s:hidden name="dataList"/> 
			<div id="tree" style="float:left;"></div>
			<div id="pcEditWin" style="float:left; width: 500px;">
				 <table >
					<tr>
						<td>类型编号：<td><s:textfield name="pst.typeId" readonly="readonly"/></td>
						<tr>
						<td>类型代码：<td><s:textfield  name="pst.typeCode"/><span id="errorsDiv_pst.typeCode"></span><input type="hidden" name="orgTypeCode"/> </td>
						<tr>
						<td>类型名称：<td><s:textfield name="pst.typeName"/><span id="errorsDiv_pst.typeName"></span></td>
						<tr>
						<td>父级编号：<td><s:textfield name="pst.parentId"/><span id="errorsDiv_pst.parentId"></span></td>
						<tr>
						<td>优先级：<td><input name="pst.priority"/><span id="errorsDiv_pst.priority"></span></td>
					</tr>
					<tr>
						<td colspan="4" class="btnBar2">
							<input type="button" value="新增" name="doNew"/>
							<input type="button" value="修改" name="doUpdate"/>
							<input type="button" value="删除" name="doDelete"/>
						</td>
					</tr>
				</table> 
			</div>
			</s:form>
</body>
</html>