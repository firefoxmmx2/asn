<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售信息</title>

<style type="text/css"> 
<!--
body{font-size:12px;font-family:"新宋体";}

.section_title {
	font-size: 18px;
}
-->
.wz_left{ padding-right:10px; text-align:right; font-size:12px; color:#000000;}
</style> 
<script type="text/javascript">


</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../../image/comdo/pen.png"></td>
			<td width="737">
			销售信息
			</td>
		</tr>
	</table>
	<br>
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
			<tr>
            	<td height="30" class="wz_left" >销售信息标题：</td>
                <td><input type="text" name="saleSource.title" size="38" disabled="disabled" value="${saleSource.title}"></input></td>
            </tr>
            <tr>
	            <td height="30" class="wz_left" >销售资料：</td>
	            <td>
	            <textarea name="saleSource.source" rows="15" cols="60" disabled="disabled">${saleSource.source}</textarea>
            </td>
           </tr>
           	<tr>
            	<td height="30" class="wz_left" >销售流程：</td>
                <td>
                <textarea name="saleSource.proce" rows="15" cols="60" disabled="disabled">${saleSource.proce}</textarea>
                </td>
            </tr>
            <tr>
            	<td height="30" class="wz_left" >附件：</td>
                <td>
                	<s:if test="saleSource.fileId!=null">
                		<s:property value="saleSource.fileName"></s:property>&nbsp;&nbsp;<a href="downloadFile?id=${saleSource.id}&fileId=${saleSource.fileId}" >点击下载</a>
                	</s:if>
                	<s:else>
                		暂无
                	</s:else>
                </td>
            </tr>
            <tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="button" value="修改" onclick="window.location.href='toModifySaleSource?id=${saleSource.id}'" />&nbsp;<input type="button" value="删除" onclick="if(confirm('确认删除该销售信息吗？')){window.location.href='delSaleSource?id=${saleSource.id}'}" />&nbsp;<input type="button" value="返回资料列表" onclick="window.location.href='toSaleSourceList'" /></td>
	        </tr>  	
		</table>
</body>
</html>