<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<% String cp = request.getContextPath(); %>

<style>
<!--
.button-2{width:66px; height:32px;color:#8a4243;font-weight:700; text-align:center; border:0;background:url('<%=cp%>/image/comdo/text2.gif');cursor:pointer; }
.button-5{width:92px; height: 32px;color:#8a4243;font-weight:700; border:0;background:url('<%=cp%>/image/comdo/text4.gif');cursor:pointer; }
-->
</style>

<input type="button" value="列表" class="button-2" method="toView" name="action:quotation-control!toView" action="quotation-control"/>
<input type="button" value=" 在线录入" class="button-5" method="toNew" name="action:quotation-control!toNew" action="quotation-control"/>
<input type="button" value=" EXCEL导入" class="button-5" method="toNews" name="action:quotation-control!toNews" action="quotation-control"/>
<input type="button" value="修改" class="button-2" method="toUpdate" name="action:quotation-control!toUpdate" action="quotation-control"/>
<input type="button" value="删除" class="button-2" method="doDelete" action="quotation-control" name="action:quotation-control!doDelete"/>
