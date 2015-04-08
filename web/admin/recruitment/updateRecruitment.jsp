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
<title>update recruitment</title>
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

	var years=$.trim($("#hworkYears").val());
	var yearId="workYears"+years;
	$("#"+yearId).attr("selected","selected");

	var eduRecord=$.trim($("#heduRecord").val());
	var eduRecordId="eduRecord"+eduRecord;
	$("#"+eduRecordId).attr("selected","selected");

	var workType=$.trim($("#hworkType").val());
	var workTypeId="workType"+workType;
	$("#"+workTypeId).attr("checked","checked");

	var treatment=$.trim($("#htreatment").val());
	var treatmentId="treatment"+treatment;
	$("#"+treatmentId).attr("selected","selected");
	
	
});

</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			修改招聘信息
			</td>
		</tr>
	</table>
	<br>
	<s:form action="updateRecruitment" method="post"  theme="simple" namespace="/admin/recr" id="form1">
		<input type="hidden" value="${recruitment.id}" name="recruitment.id"></input>
		<input type="hidden" name="recruitment.status" value="${recruitment.status}" id="status"/>
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>职位名称：</td>
                	<td><input type="text" name="recruitment.jobName" size="38" value="${recruitment.jobName}"></input><span id="errorsDiv_recruitment.jobName"></span></td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>工作地点：</td>
                	<td><input type="text" name="recruitment.workPlace" size="38" value="${recruitment.workPlace}"></input><span id="errorsDiv_recruitment.workPlace"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>招聘人数：</td>
                	<td><input type="text" name="recruitment.amount" size="8" value="${recruitment.amount}"></input>人<span id="errorsDiv_recruitment.amount"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>工作年限：</td>
                	<td>
                		<select name="recruitment.workYears">
                			<option id="workYears0" value="0">不限</option>
                			<option id="workYears1" value="1">在读学生，应届毕业生</option>
                			<option id="workYears2" value="2">1年以上</option>
                			<option id="workYears3" value="3">2年以上</option>
                			<option id="workYears4" value="4">3年以上</option>
                			<option id="workYears5" value="5">4年以上</option>
                			<option id="workYears6" value="6">5年以上</option>
                			<option id="workYears7" value="7">10年以上</option>
                		</select>
                		<input type="hidden" id="hworkYears" value="${recruitment.workYears}"></input>
                		<span id="errorsDiv_recruitment.workYears"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>学历：</td>
                	<td>
                		<select name="recruitment.eduRecord">
                			<option id="eduRecord0" value="0">不限</option>
                			<option id="eduRecordcz" value="cz">初中</option>
                			<option id="eduRecordgz" value="gz">高中/中专</option>
                			<option id="eduRecorddz" value="dz">大专</option>
                			<option id="eduRecordbk" value="bk">本科</option>
                			<option id="eduRecordss" value="ss">硕士</option>
                			<option id="eduRecordbs" value="bs">博士</option>
                		</select>
                		<input type="hidden" id="heduRecord" value="${recruitment.eduRecord}" />
                		<span id="errorsDiv_recruitment.eduRecord"></span>
                	</td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>职位描述：</td>
                	<td>
                		<textarea rows="8" cols="45" name="recruitment.jobDescription">${recruitment.jobDescription}</textarea>
                		<span id="errorsDiv_recruitment.jobDescription"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>职位要求：</td>
                	<td>
                		<textarea rows="8" cols="45" name="recruitment.jobRequirement">${recruitment.jobRequirement}</textarea>
                		<span id="errorsDiv_recruitment.jobRequirement"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>工作类型：</td>
                	<td>
                		<input type="radio" id="workType0" name="recruitment.workType" value="0">全职</input>
                		<input type="radio" id="workType1" name="recruitment.workType" value="1">兼职</input>
                		<input type="radio" id="workType2" name="recruitment.workType" value="2">实习</input>
                		<input type="radio" id="workType3" name="recruitment.workType" value="3">全/兼职</input>
                		<input type="hidden" id="hworkType" value="${recruitment.workType}" />
                		<span id="errorsDiv_recruitment.workType"></span>
                	</td>
            	</tr>		
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>待遇：</td>
                	<td>
                		<select name="recruitment.treatment">
                			<option id="treatment0" value="0">面议</option>
                			<option id="treatment1" value="1">1500以下</option>
                			<option id="treatment2" value="2">1500-1999</option>
                			<option id="treatment3" value="3">2000-2999</option>
                			<option id="treatment4" value="4">3000-3999</option>
                			<option id="treatment5" value="5">4000-4999</option>
                			<option id="treatment6" value="6">5000-5999</option>
                			<option id="treatment7" value="7">6000-6999</option>
                			<option id="treatment8" value="8">7000-7999</option>
                			<option id="treatment9" value="9">8000-8999</option>
                			<option id="treatment10" value="10">9000-9999</option>
                			<option id="treatment11" value="11">1万以上</option>
                		</select>
                		<input type="hidden" id="htreatment" value="${recruitment.treatment}"></input>
                		<span id="errorsDiv_recruitment.treatment"></span>
                	</td>
            	</tr>		
            	<tr>
            		<td height="30" class="wz_left" >应聘提示：</td>
                	<td>
                		<textarea rows="8" cols="45" name="recruitment.promptMesg">${recruitment.promptMesg}</textarea>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>联系电话：</td>
                	<td><input type="text" name="recruitment.phoneNo" size="38" value="${recruitment.phoneNo}"></input><span id="errorsDiv_recruitment.phoneNo"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>联系邮箱：</td>
                	<td><input type="text" name="recruitment.mailNo" size="38" value="${recruitment.mailNo}"></input><span id="errorsDiv_recruitment.mailNo"></span></td>
            	</tr>
            	    	
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="submit" value="确定" />&nbsp;
	              	<s:if test="recruitment.status!=1">
	              	<input type="button" value="发布上网" onclick="JavaScript:document.getElementById('status').value='1';this.form.submit()"/>
	              	</s:if>
	              	</td>
	        	</tr>  
		</table>	
	</s:form>
</body>
</html>