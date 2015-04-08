<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>

<%
String path=request.getContextPath();
%>

<html>
	<head>
		<script type="text/javascript">
		</script>
	<style type="text/css">
		.sl{
			width:120px;
			white-space:nowrap;
			text-overflow:ellipsis; 
			overflow: hidden;
		}
		.color_g{ color:#0f6ce5; text-align:center; font-size:12px;}
		.color_g2{ color:#0048a3;  text-align:center; font-size:12px;}
		.wz-18b{ color:#112482; font-size:18px; text-align:center; padding-left:15px;}
			

		table.list tr.head{
		  background-color:#e8f5fb;
		}
		table.list td.head{
		  background-color:#000000;
		}
		table.list tr.row td{
		  background-color:#ffffff;
		}
		table.list tr.altRow td{background-color: #f3f8fb;}
		libiaobg{background:#e8f5fb; border-top:1px solid #cee2ec; height:20px; border-right:1px solid #e7e7e7; color:#112482; text-align:center;}
		
		
	</style>
	</head>
	<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../../image/comdo/pen.png"></td>
			<td width="737">
			销售资料与过程管理
			</td>
		</tr>
	</table>
		<s:form action="toSaleSourceList">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">标题：</td>
			<td width="30"><input type="text" name="title" size="20" value="<s:property value="#request.title"/>"></td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5"><td>
			<td align="right"><input type="button" value="新增销售信息" class="button10" onclick="JavaScript:window.location.href='toCreateSaleSource'"></td>
		</tr>
		</table>
		</s:form>
		<br />
	<s:if test="listss.size()>=1">
				<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="20%" align="center">标题</td>
					<td class="libiaobg" nowrap width="40%" align="center">内容</td>
					<td class="libiaobg" nowrap width="20%" align="center">创建时间</td>
					<td class="libiaobg" nowrap width="20%" align="center">操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listss" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td class="zuo" align="center"><s:property value="#item.title"/></td>
						<td class="zuo" align="center"><s:property value="#item.source"/></td>
						<td class="zuo" align="center"><s:date name="#item.createTime" format="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="zuo" align="center"><a href="viewSaleSource?id=<s:property value="#item.id"/>">查看</a></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
			</table>
		</div>
		<div align="right" style="height: 50px; width: 792px;" >
			<s:form action="toSaleSourceList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
					</table>
			<input type="hidden" name="title" size="20" value="<s:property value="#request.title"/>">		
			</s:form>&nbsp;&nbsp;
   		</div>
	</s:if>
	<s:else>
		<table>
		    <tr align="center">
			<td colspan="7" height="100" class="wz-18b" align="center"><img src="../../../image/hzx/tous1.gif" /><span>暂时没有相关信息！</span></td>
			</tr>
		</table>
	</s:else>
	</body>
</html>