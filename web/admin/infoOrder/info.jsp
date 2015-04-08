<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>信息列表</title>
	<style type="text/css">

	</style>
<script type="text/javascript">

</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="2" align="center" style="color: red;font-weight:bold">信息标题：</td>
		</tr>
		<tr>
			<td colspan="2"s><s:property value="infoOrder.infoName"/></td>
		</tr>  
		<tr>
			<td align="center" style="color: red;font-weight:bold" colspan="2">信息内容：</td>  
		</tr>
		<tr>
			<td colspan="2">
				<p style="text-indent:25px;">  
					<s:property value="infoOrder.infoContent"/>
				</p>
			</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td style="color:#F60">信息类别：</td>
			<td>
				<s:if test="infoOrder.infoTypeId=='10000'">供应信息</s:if>
				<s:elseif test="infoOrder.infoTypeId=='20000'">求购信息</s:elseif>
				<s:elseif test="infoOrder.infoTypeId=='30000'">产品信息</s:elseif>
				<s:else>
				<s:property value="infoOrder.infoTypeId"/>
				</s:else>
			</td>
		</tr>
		<tr>
			<td style="color:#F60">订阅email：</td>   
			<td><s:property value="infoOrder.receiveEmail"/></td>
		</tr>
		<tr>
			<td style="color:#F60">创建时间:</td>
			<td><s:date name="infoOrder.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>     
		</tr>
		<tr>
			<td style="color:#F60">发送时间:</td>
			<td><s:property value="infoOrder.sendTime"/></td>      
		</tr>
	</table>
</body>
</html>