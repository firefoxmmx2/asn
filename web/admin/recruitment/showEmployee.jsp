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
<title>show employee</title>
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


</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			简历详情
			</td>
		</tr>
	</table>
	<br>
	<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
        <tbody><tr> 
          <td bgcolor="#FFFBE7"> <strong>基本资料</strong></td>
        </tr>
        <tr> 
          <td align="right"> <table width="98%" border="0" cellpadding="2" cellspacing="0">
              <tbody><tr> 
                <td width="38%">姓　　名：${employee.name}</td>
                <td width="38%">性　　别：${employee.sex}</td>
              </tr>
              <tr> 
                <td>出生日期：${employee.birthday}</td>
                <td>工作年限：${employee.workYear}</td>
              </tr>
              <tr> 
                <td>证件类型：${employee.certType}</td>
                <td>证件号码：${employee.certNo}</td>
              </tr>
              <tr> 
                <td>居住地：${employee.address}</td>
                <td>目前年薪：${employee.curYearlySalary} 元</td>
              </tr>
              <tr> 
                <td>联系电话：${employee.phoneNo}&nbsp;</td>
                <td>联系邮箱：${employee.mailBox}</td>
              </tr>
              <tr> 
                  <td colspan="2">&nbsp;</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
          <td bgcolor="#FFFBE7"><strong>教育历程</strong></td>
        </tr>
        <tr> 
          <td align="right"> 
            
            <table width="98%" border="0" cellpadding="2" cellspacing="0">
              <tbody><tr> 
                  <td colspan="2"> ${edu.eduTimes} &nbsp; <strong>${edu.schoolName}</strong></td>
                  <td width="50%">学历：${edu.educationalBackground}
				  专业：${edu.discripline}</td>
              </tr>
              
              <tr> 
                  <td width="11%" valign="top">专业描述：</td>
                <td colspan="2">${edu.discriplineDescription}</td>
              </tr>
              <tr>
              <td colspan="3">海外学习经历：${edu.studyAbroad}</td>
              </tr>
              
            </tbody></table>
            
          </td>
        </tr>
        <tr> 
          <td bgcolor="#FFFBE7"><strong>工作经验</strong></td>
        </tr>
		<tr> 
          <td align="right"> 
            
            <table width="98%" border="0" cellpadding="2" cellspacing="0">
              <tbody><tr> 
                  <td colspan="2"> ${experience.workTimes} &nbsp; <strong>${experience.company}</strong></td>
                  <td width="50%">职位：${experience.position}
				  部门：${experience.department}</td>
              </tr>
              
              <tr> 
                <td>公司性质：${experience.jobNature}</td>
                <td>公司规模：${experience.companySize}</td>
                <td>行 业:${experience.trade}</td>
              </tr>
              <tr> 
                <td>工作地点：${experience.workPlace}</td>
                <td>工作性质：${experience.jobNature}</td>
                <td>海外工作经历:${experience.studyAbroad}</td>
              </tr>
              <tr>
              	<td colspan="3">
              		工作职责与业绩:${experience.jobDuty}
              	</td>
              </tr>
              
            </tbody></table>
            
          </td>
        </tr>
        
        <tr> 
          <td bgcolor="#FFFBE7"><strong>求职意向</strong></td>
        </tr>
        <tr> 
          <td align="right"> <table width="98%" border="0" cellpadding="2" cellspacing="0">
                <tbody><tr> 
                  <td width="50%" valign="top">
                    期望薪资: ${purpose.expectedSalary}<br>
                  </td>
                  <td>
                    到岗时间：${purpose.dutyTime}
                  </td>  
                </tr>
              </tbody></table></td> 
        </tr>
        <tr> 
          <td bgcolor="#FFFBE7"><strong>自我评价</strong></td>
        </tr>
        <tr> 
          <td align="right"> <table width="98%" border="0" cellpadding="2" cellspacing="0">
              <tbody><tr> 
                <td height="60">${purpose.selfEvaluation}</td>
              </tr>
            </tbody></table></td>
        </tr>
      </tbody></table>
</body>
</html>