<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/front/css/page.css" type="text/css" />
<script type="text/javascript">
<!--
function checkPage(){
	var totalPage = document.getElementById("totalPage").value;
	var inPage = document.getElementById("pageBox").value;
	if(isNaN(inPage)||inPage==""){
		alert("请输入数字");
		return false;
	}			
	if(parseInt(inPage) > parseInt(totalPage)){		
		document.getElementById("thePage").value=totalPage;
	}else{
		document.getElementById("thePage").value=parseInt(inPage);
	}
	return true;
}
//-->
</script>
<s:form theme="simple" action="QuotationList"
	namespace="/front/quotation" method="get">
		<div id="pageDiv" style="margin-left;50px; margin-right:50px; width: 100%;">
			<s:property value="pageBar" escape="false"/>
		</div>
</s:form>
