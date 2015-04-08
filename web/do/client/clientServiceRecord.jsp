<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
		List<TraceMessage> list=(List<TraceMessage>)request.getAttribute("traceMessageList");
		//String pFile="member.properties";
		//PropertyFactory.getPropertiesByFileName("member.properties");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<!-- <link href="../../css/main.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
-->
<link type="text/css" href="../../css/jquilib/themes/base/jquery.ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<SCRIPT src="<%=cp%>/js/datetime2.js"></SCRIPT>
<script type="text/javascript">


//$(document).ready(function() {
	//$("#startTime").datepicker();
//	$("#startTime").datepicker("option", {dateFormat:"yy-mm-dd"});
//	$("#endTime").datepicker();
//	$("#endTime").datepicker("option", {dateFormat:"yy-mm-dd"});
//	$("#startTime").attr("value","${requestScope.TraceMessage.createTime}");
//	$("#endTime").attr("value","${requestScope.TraceMessage.createTime}");
//});


function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }
	}
}

function addClientRecord()
{
	var title=document.getElementById("TITLE").value;
	var customer=document.getElementById("CUSTOMER").value;
	var content=document.getElementById("CONTENT").value;
	
	if(title==""){alert("标题不能为空！");}
	else if(customer==""){alert("客户不能为空！");}
	else if(content==""){alert("内容不能为空！");}
	else{document.form1.action="<%=cp%>/do/client/addClientServiceRecord";
		document.form1.submit();}
}

function sel()
{
	document.form1.action="<%=cp%>/do/client/getClientServiceRecord";
	document.form1.submit();
}

function del()
{
	if(confirm('确定删除选中的客户跟踪记录吗？'))
	{
		document.form1.action="<%=cp%>/do/client/delClientServiceRecord";
		document.form1.submit();
	}
}

function operation(){
	var checkboxArray = document.getElementsByName("tblistbox");
	var value = "";
	for(var i = 0;i < checkboxArray.length; i++){
		if(checkboxArray[i].checked)
        {
			if(value == ""){
				value += checkboxArray[i].value;
			}else{
				value += ","+checkboxArray[i].value;
			} 
        }
	}
	document.getElementById("delId").value=value;
}

function upClientServiceRecord(id)
{
	location.href = "<%=cp%>/do/client/getUpClientServiceRecord?upId="+id;
}

</script>
<body>
	<form id="form1" name="form1" method="post"> 
	<table align="center" width="100%" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">客户跟踪服务记录</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
		 <tr>
		 	<td colspan="4">主题:&nbsp;
		 	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>
		 	  <input name="TITLE" type="text" id="TITLE" size="30">
	 	    </label>&nbsp;&nbsp;客户:
	 	    <label>
	 	    <input name="CUSTOMER" type="text" id="CUSTOMER" size="30">
	 	    </label></td>
		 </tr>
          <tr>
            <td align="left">跟踪记录: &nbsp;
              <textarea name="CONTENT" cols="50" id="CONTENT"></textarea>
              <input type="button" name="Submit" value="提交" onClick="addClientRecord();">
              <input name="delId" type="hidden" id="delId">
            </td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:0px;" class="table_border">
				   <tr>
				   		<td colspan="7">主题:
				   		  <input name="selTitle" type="text" id="selTitle" value="<%=request.getAttribute("selTitle")==null?"":request.getAttribute("selTitle")%>">
			   		   &nbsp;&nbsp;涉及客户:
			   		   <input name="selCustomer" type="text" id="selCustomer" value="<%=request.getAttribute("selCustomer")==null?"":request.getAttribute("selCustomer")%>">
			   		   录入时间:
			   		   <input type="text" name="startTime" id="startTime" size="10" onClick="SelectDate(this,'yyyy-MM-dd');" value="<%=request.getAttribute("startTime")==null?"":request.getAttribute("startTime")%>">
			   		   -
			   		   <input type="text" name="endTime" id="endTime" size="10" onClick="SelectDate(this,'yyyy-MM-dd');" value="<%=request.getAttribute("endTime")==null?"":request.getAttribute("endTime")%>">
			   		   <label>
			   		   <input type="button" name="Submit2" value="搜索" onClick="sel();">
			   		   <input type="button" name="Submit3" value="删除" onClick="del();">
			   		   </label></td>
				   </tr>
                   <tr>
               	  	 <td height="28" align="center" bgcolor="#e8f5fb"><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>序号</td>
						<td   height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">主题</td>
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">涉及客户</td>					
						<td height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">录入时间</td>
						<td height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">修改时间</td>
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">内容</td> 
						<td  height="28" align="center" bgcolor="#e8f5fb" nowrap="nowrap">修改</td>                   
                  </tr>
				  <%
				  if(list!=null)
				  {
				  	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					  for(int i=0; i<list.size(); i++){
						  TraceMessage tm=list.get(i);	 
						  
				%>
			  	<tr>
					<td height="40"><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=tm.getId()%>" onClick="operation();"><%=tm.getId()%></td>
					<td>&nbsp;<%=tm.getTitle()%></td>
					<td align="center">&nbsp;<%=tm.getCustomer()%></td>
					<td >&nbsp;<%=sdf.format(tm.getCreateTime()).substring(0,10)%></td>
					<td >&nbsp;<%=sdf.format(tm.getModifyTime()).substring(0,10)%></td>
					<td>&nbsp;<%=tm.getContent()%></td>
					<td>&nbsp;
					  <label>
					  <input type="button" name="upBtn" value="修改" id="<%=tm.getId()%>" onClick="upClientServiceRecord(<%=tm.getId()%>);">
				    </label></td>
		  		</tr>
				<%
					}}
				%>
		  </table>
		    <table width="790" border="0" cellspacing="1" cellpadding="2">
				<s:property value="#request.pageBar" escape="false"/>
			</table>
		</td>
	</tr>
</table>
</form>
</body>



