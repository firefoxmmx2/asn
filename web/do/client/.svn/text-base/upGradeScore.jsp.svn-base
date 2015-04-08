<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.client.TraceMessage" %>
<%@ page import="com.bornsoft.asn.bean.member.Member" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="s" uri="/struts-tags" %>


<%
String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>

<link type="text/css" href="../../css/jquilib/themes/base/jquery.ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<SCRIPT src="<%=cp%>/js/datetime2.js"></SCRIPT>
<script type="text/javascript">


function upGradeScore()
{
	var reg=/^[0-9]+$/;
	if(document.getElementById("gradeScore").value=="")
	{
		alert("修改后的积分等级不能为空");
	}
	else if(!reg.test(document.getElementById("gradeScore").value))
	{
		alert("积分等级只能输入数字");
	}
	else
	{
		document.form1.action="<%=cp%>/do/client/upGradeScore";
		document.form1.submit();
	}
}

</script>

<%
	String gradeScore=String.valueOf(request.getAttribute("GradeScore"));
	String upId=String.valueOf(request.getAttribute("upId"));
%>

<body>
	<form id="form1" name="form1"> 
	<table align="center" width="100%" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">修改客户积分等级</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
		 <tr>
		 	<td colspan="4">积分等级:
		 	  &nbsp;&nbsp;
		 	  <label>
		 	  <input name="gradeScore" type="text" id="gradeScore" value="<%=gradeScore%>" size="10">
	 	    </label>
		 	  <label>
	 	    <input type="button" name="Submit" value="修改" onClick="upGradeScore();">
	 	    <input name="upId" type="hidden" id="upId" value="<%=upId%>">
	 	    </label></td>
		 </tr>
        </table>
		</td>
	</tr>
</table>
</form>
</body>



