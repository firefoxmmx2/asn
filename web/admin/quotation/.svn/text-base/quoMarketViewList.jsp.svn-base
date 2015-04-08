<%-- 
    Document   : quoMarketViewList
    Created on : 2010/06/21, 10:12:40
    Author     : hooxin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>行情市场列表</title>
        <style type="text/css">
<!--
	*{ padding:0; margin:0;}
	body{font-size:12px;}
	.table_border a{font-weight:100;}
	.table_border a:link{ color:#333333 ; font-size:12px;text-decoration: none;}
	.table_border a:visited{ color:#333333; font-size:12px;text-decoration: none}
	.table_border a:hover{ color: #FF0000; font-size:12px;text-decoration: underline}
-->
</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hxtool.js"></script>
	<SCRIPT type="text/javascript" src="${pageContext.request.contextPath }/js/jquilib/ui/jquery-ui-1.8.custom.js"></SCRIPT>
<link href="${pageContext.request.contextPath}/css/jquilib/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/quotation/quoMarket.js"></script>
    </head>
    <body>
        <table align="center" width="792" cellpadding="0" cellspacing="0">
		<tr>
			<td height="39" class="title">市场列表</td>
		</tr>
		<tr>
		<td height="51" class="boder_y">
		<form name="findForm" action="${pageContext.request.contextPath }<s:property value="formAction2"/> " method="post">
	 	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td>市场编号：</td><td><s:textfield name="qm.marketCode"></s:textfield></td>
          	<td>市场名称：</td><td><s:textfield name="qm.marketName"></s:textfield> </td>
          	<td>地区：</td><td><s:textfield name="qm.area"></s:textfield></td>
          	<td><input type="button" name="action:findMarketView" value="查询" class="button"/></td>
          </tr>
        </table>
        </form>
		</td>
	</tr>
		<tr>
                    <td><form action="${pageContext.request.contextPath}/admin/quotation/delMarket" method="post" name="delForm">
                    <s:hidden name="mode"></s:hidden>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                                <tr>
                                    <td align="right">
                                        <input type="button" value="删除" class="button-2 button" name="action:delMarket"/>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
				<tr>
					<td width="5%" height="28" align="center" bgcolor="#e8f5fb"><input type="checkbox" id="selectAll"/></td>
					<td width="50%" align="center" bgcolor="#e8f5fb"><strong>市场名称</strong></td>
					<td width="20%" align="center" bgcolor="#e8f5fb"><strong>地区</strong></td>
					<td width="10%" align="center" bgcolor="#e8f5fb"><strong>维护人</strong></td>
					<td width="15%" align="center" bgcolor="#e8f5fb"><b>维护时间</b></td>
				</tr>
				<s:iterator id="list" value="marketList" status="stat">
					<tr>
						<td align="center" height="30"><input type="checkbox"  name="codes" value="<s:property value="marketCode"/>"/></td>
                                                <td >&nbsp;<a href="<%=request.getContextPath() %><s:property value="modMarketAction"/>?qm.marketCode=<s:property value="marketCode"/>">
							<s:property value="marketName"/>
							</a>
						</td>
						<td align="center"><s:property value="area"/> </td>
						<td align="center"><s:property value="updatePerson"/> </td>
                                                <td align="center"><s:date name="updateTime" format="yyyy-MM-dd hh:mm"/> </td>
					</tr>
				</s:iterator>
			</table>
                            </form>
		</td>
		</tr>
	</table>
        <table align="center" width="792" cellpadding="0" cellspacing="0">
        	<tr>
        		<td align="right">
					<s:property value="pageBar" escape="false"/>
        		</td>
        	</tr>
        </table>
