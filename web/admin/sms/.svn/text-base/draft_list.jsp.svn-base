<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.bornsoft.sms.bean.SmsSend" %>
<%@ page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<% String cp = request.getContextPath(); %>

<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<SCRIPT src="<%=cp%>/js/datetime2.js"></SCRIPT>
<style>
<!--
	.advertpadd{padding: 0 8px;}
	.doCon{padding: 0 10px; width: 220px;}
-->
</style>

<script type="text/javascript">
<!--
function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }
	}
}
function optAdvert(){
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
	if(value == ""){
		alert("请选择需要发送信息的用户！");
	}else{
		if(confirm("你确定要向这些用户发送信息！")){
			location.href="<%=cp%>/admin/sms/RepeatSend2?id="+value;
		}
	}
	
}

function delDraft(){
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
	if(value == ""){
		alert("请选择需要发送信息的用户！");
	}else{
		if(confirm("你确定要删除这些草稿信息！")){
			location.href="<%=cp%>/admin/sms/delDraftSms?id="+value;
		}
	}
	
}
//-->
</script>
	
	<% List<SmsSend> listSend = (List<SmsSend>)request.getAttribute("listSmsSend");  %>
    <s:form action="listDraft" name="myform" id="myform" method="post">
	<table align="center" width="792" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">草稿箱</td>
   	</tr>  
	<tr>
		<td class="boder_y">
	 	 <table width="80%" border="0" cellspacing="0" cellpadding="0">
          <tr>	
          	<td width="100" align="right" height="30">手机号码：</td>  	
            <td width="150">
            	<input type="text" name="smsSend.mobileNo" id="mobileNo" size="30" value="<s:property value="#request.smsSend.mobileNo"/>" />
            </td> 
          </tr>
          <tr>
          	<td width="100" align="right" height="30">状态选择：</td>
            <td width="300">
            	<s:select list="#{'':'发送方式','N':'即时','T':'定时'}" name="smsSend.sendType" id="sendType"></s:select>&nbsp;          
            	<s:select list="#{'':'是否回复','N':'否','Y':'是'}" name="smsSend.isReply" id="isReply"></s:select>
            </td> 
            <td>&nbsp;</td>    
          </tr>
          
          <tr>
          	<td width="100" align="right" height="30">创建时间：</td>
          	<td colspan="2">
          		从<input type="text" name="startTime" readonly="readonly" size="20" id="startTime" value="<s:property value="#request.startTime" />" onclick="SelectDate(this,'yyyy-MM-dd');" />
          		&nbsp;到&nbsp;
          		<input type="text" name="endTime" readonly="readonly" size="20" id="endTime" value="<s:property value="#request.endTime" />" onclick="SelectDate(this,'yyyy-MM-dd');" />
          	</td>      		  
            <td align="left" width="100"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listDraft?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                   	  	<td height="28" align="center" bgcolor="#e8f5fb" width="60"><label><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>序号</label></td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="80">手机号码</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="250">内容</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="90">创建时间</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="50">发送方式</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="100">定时时间</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="60">是否回复</td>      
                  </tr>	
                  
                  <% for(int i=0;i<listSend.size(); i++){ 
                  		SmsSend send = listSend.get(i);
                  %>
                 <tr>
					<td height="40"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=send.getId() %>"><%=send.getId()%></label></td>
					<td align="center"><%=send.getMobileNo() %></td>
					<td class="doCon"><%=send.getSendContent().length()>35?send.getSendContent().substring(0,35)+"...":send.getSendContent() %></td>
					<td align="center"><%=send.getCreateTime() %></td>
					<td align="center"><%=send.getSendType().equals("N")?"<font color=green>即时</font>":"<font color=red>定时</font>" %></td>
					<td align="center"><%=send.getSetTime()==null?"无":new SimpleDateFormat("yyyy-MM-dd HH:mm").format(send.getSetTime()) %></td>
					<td align="center"><%=send.getIsReply().equals("N")?"否":"是" %></td>
				</tr>
				<% } %>
		  </table>
		  
		  <table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
			<tr>
				<td align="left" height="40">
					<input type="button" value="批量发送" onclick="optAdvert()" class="sm-buttom4-2" >
					<input type="button" value="批量删除" onclick="delDraft()" class="sm-buttom4-2" >
				</td>		
			</tr>
		</table>
		<table width="790" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
		</table>
		</td>
	</tr>
</table>
</s:form>