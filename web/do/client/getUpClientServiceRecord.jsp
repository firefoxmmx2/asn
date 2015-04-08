<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.utils.common.PropertyFactory" %>
<%@ page import="com.bornsoft.asn.bean.client.TraceMessage" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="s" uri="/struts-tags" %>


<%

String cp=request.getContextPath();
class Locafunction{
		public String prop(Object key){
			return PropertyFactory.getProperty("member.properties", key.toString());
		}
		public String n2s(Object obj){
			return obj==null?"&nbsp;":obj.toString();
		}
	}
	Locafunction f=new Locafunction();
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



function upClientRecord()
{
	var title=document.getElementById("TITLE").value;
	var customer=document.getElementById("CUSTOMER").value;
	var content=document.getElementById("CONTENT").value;
	
	if(title==""){alert("标题不能为空！");}
	else if(customer==""){alert("客户不能为空！");}
	else if(content==""){alert("内容不能为空！");}
	else{document.form1.action="<%=cp%>/do/client/upClientServiceRecord";
		document.form1.submit();}
}





function upClientRecord()
{
	document.form1.action="<%=cp%>/do/client/upClientServiceRecord";
	document.form1.submit();
}

</script>

<%
	TraceMessage traceMessage = (TraceMessage)request.getAttribute("traceMessage");
	String title="",customer="",content="",upId="";
	
	if(traceMessage!=null)
	{
		title=traceMessage.getTitle();
		customer=traceMessage.getCustomer();
		content=traceMessage.getContent();
		upId=String.valueOf(traceMessage.getId());
	}
	
%>

<body>
	<form id="form1" name="form1" method="post"> 
	<table align="center" width="100%" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">修改客户跟踪服务记录</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
		 <tr>
		 	<td colspan="4">主题:
		 	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>
		 	  <input name="TITLE" type="text" id="TITLE" value="<%=title%>" size="70">
	 	    </label>&nbsp;&nbsp;<label>	 	    </label></td>
		 </tr>
		 <tr>
		 	<td>客户:
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>
              <input name="CUSTOMER" type="text" id="CUSTOMER" value="<%=customer%>">
            </label></td>
		 </tr>
          <tr>
            <td align="left">跟踪记录:&nbsp;
              <label>
              <textarea name="CONTENT" cols="70" id="CONTENT"><%=content%></textarea>
              <input type="button" name="Submit" value="修改" onClick="upClientRecord();">
              <input name="upId" type="hidden" id="upId" value="<%=upId%>">
            </label></td>
          </tr>
        </table>
		</td>
	</tr>
</table>
</form>
</body>



