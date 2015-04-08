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

</head>

<body>
		<table>
			<tr>
				<td>招聘单位</td>
				<td>${company}</td>
			</tr>
			<tr>
				<td>职位名称</td>
				<td>${recruitment.jobName}</td>
			</tr>
			<tr>
				<td>工作地点</td>
				<td>${recruitment.workPlace}</td>
			</tr>
			<tr>
				<td>招聘人数</td>
				<td>${recruitment.amount}</td>
			</tr>
			<tr>
				<td>工作年限</td>
				<td>${recruitment.workYears}</td>
			</tr>
			<tr>
				<td>学历</td>
				<td>${recruitment.eduRecord}</td>
			</tr>
			<tr>
				<td>职位描述</td>
				<td>${recruitment.jobDescription}</td>
			</tr>
			<tr>
				<td>职位要求</td>
				<td>${recruitment.jobRequirement}</td>
			</tr>
			<tr>
				<td>工作类型</td>
				<td>${recruitment.workType}</td>
			</tr>
			<tr>
				<td>待遇</td>
				<td>${recruitment.treatment}</td>
			</tr>
			<tr>
				<td>应聘提示</td>
				<td>${recruitment.promptMesg}</td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td>${recruitment.phoneNo}</td>
			</tr>
			<tr>
				<td>联系邮箱</td>
				<td>${recruitment.mailNo}</td>
			</tr>
			<tr>
				<td>发布日期</td>
				<td><s:date name="recruitment.publishedTime" format="yyyy-MM-dd" ></s:date></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="<%=path%>/front/recr/toEmploy?rid=${recruitment.id}">我要应聘</a>
				</td>
			</tr>
		</table>		 
</body>
</html>