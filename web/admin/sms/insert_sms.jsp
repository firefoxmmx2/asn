<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String cp = request.getContextPath(); %>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/datetime2.js"></SCRIPT>

<style>
<!--
.bb1{display: block;}
.nn1{display: none;}
.bor{border-bottom:1px #cccccc solid;border-right:1px #cccccc solid;border-left:1px #cccccc solid;}
-->
</style>

<script type="text/javascript"> 
function checkLen(obj)  
{ 
	/*
    var maxChars = 60;//最多字符数 
    if (obj.value.length > maxChars) 
    obj.value = obj.value.substring(0,maxChars); 
    var curr = maxChars - obj.value.length; 
    document.getElementById("count").innerHTML = "<font color=green>"+curr.toString()+"</font>"; 
    */
} 

//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(		
		"smsSend.mobileNo:接收人号码|required",	
		"smsSend.sendContent:发送内容|required",	
		"smsSend.sendType:发送类型|required"
	);
	
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
});

function onSetTime(obj){
	if(obj.value == "T"){
		document.getElementById("toSetTime").className = "bb1";
	} else{
		document.getElementById("toSetTime").className = "nn1";
	}
}

function openMember(){
	var windowWidth = document.documentElement.clientWidth;     
	var windowHeight = document.documentElement.clientHeight;     
	var topH = (windowHeight-400)/2;
	var letfW = (windowWidth-500)/2;
	window.open("<%=cp%>/admin/sms/allMember","smswindow","height=350, width=500, top="+topH+", left="+letfW+", toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}
</script>


	<table align="center" width="790" cellpadding="0" cellspacing="0">
		<tr>
			<td height="39" class="title">短信发送</td>			        
		</tr>
	</table>
	
	<form action="<%=cp%>/admin/sms/insertSms" method="POST" name="form1" id="form1">
          <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>接 收 人：</td>
	            <td><table>
	            	<tr>
	            		<td>&nbsp;<font color="#666666">请输入接收人的手机号码（必须为数字）</font></td>
	            	</tr>
	            	<tr>
	            		<td>&nbsp;<input name="smsSend.mobileNo" type="text" id="mobileNo" size="40" />
	            				  <input type="button" value=" 选择.." onclick="openMember()"/>
	            				  <span id="errorsDiv_smsSend.mobileNo"></span>
	            		</td>
	            	</tr>
	            	</table>        
	            </td>          	
			</tr>
			          
			<tr>
				<td height="150" width="90" align="right"><font color="red">*</font>内&nbsp;&nbsp;&nbsp;&nbsp;容：</td>
	            <td><table>
	            	<tr>
	            		<td>&nbsp;<textarea name="smsSend.sendContent" id="sendContent" rows="10" cols="80" onkeyup="checkLen(this)"></textarea>					           
			            		  <span id="errorsDiv_smsSend.sendContent"></span>
	            		</td> 
	            	</tr>  
	            	<tr>
	            		<td  style="color:#666666;">&nbsp;<!--您还可以输入 <span id="count"><font color="green">60</font></span> 个文字-->
	            		</td>
	            	</tr>
	            	</table> 
	            </td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right"><font color="red">*</font>消息类型：</td>
	            <td>&nbsp;
		            <label><input type="radio" name="smsSend.sendType" id="sendType" checked value="N" onclick="onSetTime(this)" />即时</label>
		            <label><input type="radio" name="smsSend.sendType" id="sendType" value="T" onclick="onSetTime(this)" />定时</label>
	            <span id="errorsDiv_smsSend.sendType"></span></td>          	
			</tr>
			
			<tr>
				<td height="40" width="90" align="right">需要回复：</td>
	            <td>&nbsp;<label><input type="checkbox" name="smsSend.isReply" id="isReply" value="Y" />是</label></td>          	
			</tr>
			</table>
			<table align="center" width="790"cellpadding="0" cellspacing="0" class="bor">
			<tr id="toSetTime" class="nn1">
				<td height="40" width="90" align="right" style="border-right:1px #cccccc solid;">定时时间：</td>
	            <td>&nbsp;<input type="text" name="smsSend.setTime" readonly="readonly" size="35" id="setTime" onclick="SelectDate(this,'yyyy-MM-dd hh:mm');" /></td>          	
			</tr>			
			                
           </table> 
           
           <table align="center" width="790"cellpadding="0" cellspacing="0" >		
			<tr>			
	            <td height="50" align="center"><input type="submit" class="sm-submit4" value="发送短信">
	            <input type="button" value="存为草稿" class="sm-submit4" onClick="form1.action='<%=cp%>/admin/sms/insertSms?type=sub';form1.submit();" />&nbsp;
		        <font color="red"><strong><%= request.getAttribute("sms_msg") == null?"":request.getAttribute("sms_msg") %></strong></font>
	            </td>          	
			</tr>		
			</table>
           
          </form>