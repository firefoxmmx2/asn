<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<style type="text/css">
		</style>
		<link rel="stylesheet" rev="stylesheet" href="../../css/huzx.css" type="text/css" />
		<script type="text/javascript">
		function checkPage(){
			var totalPage = document.getElementById("totalPage").value;
			var inPage = document.getElementById("page").value;
			if(isNaN(inPage)){
				alert("请输入数字");
				return false;
			}			
			if(parseInt(inPage) > parseInt(totalPage)){		
				document.getElementById("page").value = totalPage;
			}else{
				document.getElementById("page").value = parseInt(inPage);
			}
			return true;
		}
		</script>
	</head>
	<body>
		<div>
			<span style="color :red">供应信息</a></span>
			<table>
				<s:iterator id="item" value="listS" status="list"> 
					<tr>
						<td><a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.infoId"/>" target="_blank"><s:property value="#item.title"></s:property></a></td>
						<td><div><s:property value="#item.detail"></s:property></div></td>
						<td><div><s:property value="#item.keyWord"></s:property></div></td>
						<td><s:property value="#item.typeName"></s:property></td>
						<td align="center"><s:date name="#item.endDate" format="yyyy-MM-dd"></s:date></td>
					</tr>
				</s:iterator>
			</table>	
			<form action="${pageContext.request.contextPath}/do/info/showSupplyInfoList" method="post" name="pageform" id="pageform">		
			<div id="pageDiv">
				<s:property value="#request.pageBar" escape="false"/><s:property value=""/>
				第&nbsp;<input type="text" name="page" id="page" style="width:30px;" value="">&nbsp;页
				<input type="submit" value="确定" onclick="return checkPage();">  
			</div>	
			</form>
		</div>
	</body>
</html>
