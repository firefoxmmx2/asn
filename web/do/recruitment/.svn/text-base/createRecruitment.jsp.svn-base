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
<title>create recruitment</title>
<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>    
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>

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
//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"recruitment.jobName:职位名称|required",
		"recruitment.workPlace:工作地点|required",
		"recruitment.amount:招聘人数|required",
		"recruitment.amount:招聘人数|numeric",
		"recruitment.jobDescription:职位描述|required",
		"recruitment.jobRequirement:职位要求|required",
		"recruitment.phoneNo:联系电话|required",
		"recruitment.mailNo:联系邮箱|required"
	);
	// 遮罩规则的详细定义
	//yav.addMask('count_mask', '      ', '1234567890');
	// 输入提示
	//yav.addHelp('product.startOrderCount', '起订量应为0~9的数字');
	//yav.addHelp('product.wareCount', '库存量应为0~9的数字');
	// 输入时验证
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
});	
</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			新增招聘信息
			</td>
		</tr>
	</table>
	<br>
	<s:form action="createRecruitment" method="post"  theme="simple" namespace="/do/recr" id="form1">
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>职位名称：</td>
                	<td><input type="text" name="recruitment.jobName" size="38"></input><span id="errorsDiv_recruitment.jobName"></span></td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>工作地点：</td>
                	<td><input type="text" name="recruitment.workPlace" size="38"></input><span id="errorsDiv_recruitment.workPlace"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>招聘人数：</td>
                	<td><input type="text" name="recruitment.amount" size="8"></input>人<span id="errorsDiv_recruitment.amount"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>工作年限：</td>
                	<td>
                		<select name="recruitment.workYears">
                			<option value="0">不限</option>
                			<option value="1">在读学生，应届毕业生</option>
                			<option value="2">1年以上</option>
                			<option value="3">2年以上</option>
                			<option value="4">3年以上</option>
                			<option value="5">4年以上</option>
                			<option value="6">5年以上</option>
                			<option value="7">10年以上</option>
                		</select>
                		<span id="errorsDiv_recruitment.workYears"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>学历：</td>
                	<td>
                		<select name="recruitment.eduRecord">
                			<option value="0">不限</option>
                			<option value="cz">初中</option>
                			<option value="gz">高中/中专</option>
                			<option value="dz">大专</option>
                			<option value="bk">本科</option>
                			<option value="ss">硕士</option>
                			<option value="bs">博士</option>
                		</select>
                		<span id="errorsDiv_recruitment.eduRecord"></span>
                	</td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>职位描述：</td>
                	<td>
                		<textarea rows="8" cols="45" name="recruitment.jobDescription"></textarea>
                		<span id="errorsDiv_recruitment.jobDescription"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>职位要求：</td>
                	<td>
                		<textarea rows="8" cols="45" name="recruitment.jobRequirement"></textarea>
                		<span id="errorsDiv_recruitment.jobRequirement"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>工作类型：</td>
                	<td>
                		<input type="radio" name="recruitment.workType" value="0" checked="checked">全职</input>
                		<input type="radio" name="recruitment.workType" value="1">兼职</input>
                		<input type="radio" name="recruitment.workType" value="2">实习</input>
                		<input type="radio" name="recruitment.workType" value="3">全/兼职</input>
                		<span id="errorsDiv_recruitment.workType"></span>
                	</td>
            	</tr>		
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>待遇：</td>
                	<td>
                		<select name="recruitment.treatment">
                			<option value="0">面议</option>
                			<option value="1">1500以下</option>
                			<option value="2">1500-1999</option>
                			<option value="3">2000-2999</option>
                			<option value="4">3000-3999</option>
                			<option value="5">4000-4999</option>
                			<option value="6">5000-5999</option>
                			<option value="7">6000-6999</option>
                			<option value="8">7000-7999</option>
                			<option value="9">8000-8999</option>
                			<option value="10">9000-9999</option>
                			<option value="11">1万以上</option>
                		</select>
                		<span id="errorsDiv_recruitment.treatment"></span>
                	</td>
            	</tr>		
            	<tr>
            		<td height="30" class="wz_left" >应聘提示：</td>
                	<td>
                		<textarea rows="8" cols="45" name="recruitment.promptMesg"></textarea>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>联系电话：</td>
                	<td><input type="text" name="recruitment.phoneNo" size="38"></input><span id="errorsDiv_recruitment.phoneNo"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>联系邮箱：</td>
                	<td><input type="text" name="recruitment.mailNo" size="38"></input><span id="errorsDiv_recruitment.mailNo"></span></td>
            	</tr>
            	    	
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="submit" value="发布" id="fb"/>&nbsp;
	              		<input type="hidden" name="recruitment.status" value="1" id="status"/>
	              		<input type="button" value="保存为草稿" onclick="JavaScript:document.getElementById('status').value='3';document.getElementById('fb').click();"/>
	              	</td>
	        	</tr>  
		</table>	
	</s:form>
</body>
</html>