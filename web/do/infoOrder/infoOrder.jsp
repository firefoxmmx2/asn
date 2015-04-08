<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<% String cp=request.getContextPath(); %>
<html>
	<head>
		<title>信息订阅</title>
		<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>  
		<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
		<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
		<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#email2").hide();
		});

		//设置表单验证
		$(document).ready(function(){
			// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
			var rules=new Array(
				"newEmail:邮件地址|required"
			);
			yav.init('form2', rules);
			// 提交前验证
			$("#form2").submit(function () {
				  return yav.performCheck("form2", rules, "inline");  // classic 或者 inline
			});
		});	
		</script>
	</head>
	<body>
		
		<table align="center" width="790" border="0" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
				<td width="737">
					信息订阅
				</td>
			</tr>
		</table>
		
		<br>
		
		<div style="position:relative; left: 700px;"><a href="<%=cp%>/do/infoOrder/setAllCancel">取消全部订阅</a></div><br>
		<s:if test="#request.notOrder=='notOrder'">
		<table align="center" width="700" height="45" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<s:iterator id="item" value="listT">
					<td width="50"><img src='${pageContext.request.contextPath}<s:property value="#item.unsubscribeIco"></s:property>'></img></td>
					<td width="80"><a href="<%=cp%>/do/infoOrder/InfoOrder?typeId=<s:property value="#item.id"></s:property>&type=0&email=<s:property value="#request.email"/>">&nbsp;订阅</a></td>
					<td>&nbsp;</td><!--
					<td>&nbsp;</td>
					<td>&nbsp;</td>-->
				</s:iterator>
				</tr>
		</table>
		</s:if>
		<s:else>
			<table align="center" width="700" height="45" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<s:iterator id="item" value="listT">
					<%boolean b=true; %>
					<s:iterator id="item1" value="#request.ids">
						<s:if test="#item.id==#item1">
							<%b=false; %>
							<td width="50"><img src='${pageContext.request.contextPath}<s:property value="#item.subscribeIco"></s:property>'></img></td>
							<td width="80"><a href="<%=cp%>/do/infoOrder/InfoOrder?typeId=<s:property value="#item.id"></s:property>&type=1">&nbsp;取消订阅</a></td>
						</s:if>
					</s:iterator>
					<%if(b){%>
							<td width="50"><img src='${pageContext.request.contextPath}<s:property value="#item.unsubscribeIco"></s:property>'></img></td>
							<td width="80"><a href="<%=cp%>/do/infoOrder/InfoOrder?typeId=<s:property value="#item.id"></s:property>&type=0">&nbsp;订阅</a></td>			
					<%}%>
					<td>&nbsp;</td><!--
					<td>&nbsp;</td>
					<td>&nbsp;</td>-->
				</s:iterator>
				</tr>
			</table>
		</s:else>
		<br><br>
		<table align="center" width="700" height="45" border="0" cellpadding="0" cellspacing="0">
			<tr id="email1">
				<td align="right">你订阅的email：</td>
				<td>&nbsp;<input type="text" disabled="disabled" value='<s:property value="#request.email"/>'>&nbsp;</input><input id="xiugai" type="button" value="修改"></input></td>
			</tr>
			<tr id="email2">
				<td>email：</td>
				<td>
					<s:form action="InfoOrderEmail" method="post" id="form2" theme="simple" namespace="/do/infoOrder">
						<input name="newEmail" type="text" value="<s:property value="#request.email"/>"></input><input id="queding" type="submit" value="确定"></input><span id="errorsDiv_newEmail"></span>
					</s:form>
				</td>
			</tr>
		</table>
			<script type="text/javascript">
			$("#xiugai").bind("click",function(event){
				$("#email1").hide();$("#email2").show();
			});
			</script>
	</body>

</html>