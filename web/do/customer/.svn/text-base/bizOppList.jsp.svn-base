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
			商机管理
			</td>
		</tr>
	</table>
		<s:form action="toBizOppList">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">商品名称：</td>
			<td width="30"><input type="text" name="name" size="20" value="<s:property value="#request.name"/>"></td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5"><td>
		</tr>
		</table>
		</s:form>
		<br />
	<s:if test="listBO.size()>=1">
				<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="10%" align="center">商品图片</td>
					<td class="libiaobg" nowrap width="30%" align="center">商品名称</td>
					<td class="libiaobg" nowrap width="35%" align="center">匹配求购信息</td>
					<td class="libiaobg" nowrap width="25%" align="center">类别</td>    
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listBO" status="list">     
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td class="zuo" align="center"><div id="spic">
						<a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank">
						<s:if test="#item.picPath==null">
						<img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}/images/photo_not_exits_small.gif'>  
						</s:if>
						<s:else>
						<img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}<s:property value="#item.picPath"/>'>   
						</s:else>
						</a></div> </td>
						<td class="zuo" align="center"><a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><s:property value="#item.productName"></s:property></a></td>
						<td class="zuo" align="center"><a target="_blank" href="${pageContext.request.contextPath}/front/info/showPurchaseInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>"><s:property value="#item.title"></s:property></a></td>
						<td class="zuo" align="center"><s:property value="#item.typeName"></s:property></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
			</table>
		</div>
		<div align="right" style="height: 50px; width: 792px;" >
			<s:form action="toBizOppList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
					</table>
			<input type="hidden" name="name" size="20" value="<s:property value="#request.name"/>">		
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