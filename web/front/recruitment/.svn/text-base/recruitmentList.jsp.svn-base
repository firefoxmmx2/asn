<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path=request.getContextPath();
%>
<html>
<head>
<title>r</title>
<style type="text/css">
#huzxPageDiv{float:right; height:35px; padding-top:15px; text-align:right; color:#666; font-size:12px;padding-right:200px;}
#huzxPageDiv a{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; }	
#huzxPageDiv a:link { color:#666666; text-decoration: none; font-size:12px;} 
#huzxPageDiv a:visited { color:#666666; text-decoration: none;font-size:12px;} 
#huzxPageDiv a:hover { color: #000000;  background:#ebf9df;font-size:12px;} 
#huzxPageDiv a:active { color: #FF5151; text-decoration: underline;font-size:12px;}	
#huzxPageDiv span{padding:2px 7px;border:1px #1d6e00 solid;font-size:12px;margin:0 2px; background:#ebf9df;}
</style>
<script type="text/javascript">
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
</script>

</head>

<body>
		<table>
			<tr>
				<td>职位名称</td>
				<td>学历</td>
				<td>人数</td>
				<td>发布日期</td>
			</tr>
			<s:iterator value="recruitmentList" id="item">
			<tr>
				<td><a href="<%=path%>/front/recr/showRecruitment?rid=${item.id}" target="_blank">${item.jobName}</a></td>
				<td>${item.eduRecord}</td>
				<td>${item.amount}</td>
				<td><s:date name="#item.publishedTime" format="yyyy-MM-dd"></s:date></td>
			</tr>
			</s:iterator>
		</table>
		<s:form action="showRecruitmentList" namespace="/front/recr">
		<div>${pageBar}</div>
		</s:form>
</body>
</html>