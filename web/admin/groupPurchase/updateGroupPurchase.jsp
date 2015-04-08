<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create groupPurchase</title>
<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>    
<link type="text/css" href="<%=cp%>/css/hzx/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/hzx/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/hzx/timepicker.js"></script>  

<style type="text/css"> 
	body{font-size:12px;font-family:"新宋体";}
	.wz_left{ padding-right:10px; text-align:right; font-size:12px; color:#000000;}
	.section_title {
		font-size: 18px;
	}

	.divscr{
		WIDTH:225px; 
		HEIGHT:250px; 
		OVERFLOW: scroll; 
		border:1px #c7deff solid;
		margin-top:5px;	
		font-family:"宋体";
		font-size:12px; 
		float:left;
		padding-top:5px;		
	}
	.divscr span{
		float:left;
		width:185px;
		cursor:pointer; 
		height:18px;
		padding-top:5px;
		padding-left:5px;
		margin-left:5px;
		background:url(../../image/point3.gif) right center no-repeat;
	}
	.divscr span.selected{
		background-color:#e7f4d4;
		border:1px solid #5ba515;
		color: #0045df;
	}
</style> 
<script type="text/javascript">
var count=1;
var rowNum=0;
function addLine(){
	if(rowNum>99){
		alert("自定义属性数量太大");
		return;
	}
	if(rowNum==0){
		count=document.getElementById("customSize").value;
	}
	var table=document.getElementById("listTable");
	var tr=table.insertRow(1);  
	tr.id="tr"+count;
	var td0=tr.insertCell(0);
	var td1=tr.insertCell(1);
	var td2=tr.insertCell(2);
	var td3=tr.insertCell(3);
	var td4=tr.insertCell(4);
	var td5=tr.insertCell(5);  
	var td6=tr.insertCell(6);  
	td6.align="center";      
	td0.innerHTML='<input size="20" type="text" name="listGPD['+count+'].specs" value=""></input>';   
	td1.innerHTML='<input size="5" type="text" name="listGPD['+count+'].weight" class="amount"></input>';
	td2.innerHTML='<input size="5" type="text" name="listGPD['+count+'].unit" value="箱"></input>';  
	td3.innerHTML='<input size="9" type="text" name="listGPD['+count+'].marketPrice" class="amount"></input>';
	td4.innerHTML='<input size="9" type="text" name="listGPD['+count+'].groupPrice" class="amount"></input>';
	td5.innerHTML='<input size="5" type="text" name="listGPD['+count+'].fee" class="amount"></input>';
	td6.innerHTML='<a href="#" onclick="deleteLine('+"'"+"tr"+count+"'"+')">删除</a>';  
	count++;  
	rowNum++;
}

function deleteLine(id){
	var tr=document.getElementById(id);
	tr.parentNode.removeChild(tr);
	rowNum--;
}

$(function() {
    $('#datetime1').datepicker({
    	duration: '',
        showTime: true,
        constrainInput: false
     });

    $('#datetime2').datepicker({
    	duration: '',
        showTime: true,
        constrainInput: false
     });
});  


function hideTime(){
	document.getElementById("time1").style.display='none';
	document.getElementById("time2").style.display='none';
	document.getElementById("datetime1").value="0";  
	document.getElementById("datetime2").value="0";    
}
function showTime(){
	document.getElementById("time1").style.display='';
	document.getElementById("time2").style.display='';  
	document.getElementById("datetime1").value="";  
	document.getElementById("datetime2").value="";  
}

$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"groupPurchaseInfo.title:团购标题|required",
		"groupPurchaseInfo.title:团购标题|maxlength|200",
		"groupPurchaseInfo.productName:团购商品|required",
		"groupPurchaseInfo.productName:团购商品|maxlength|50",
		"groupPurchaseInfo.lowerLimit:组团人数下限|required",
		"startTime:开始时间|required",
		"stopTime:结束时间|required"
		  
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

	$(".amount").bind("keyup",function(event){  
		if((event.keyCode>=96&&event.keyCode<=105)||(event.keyCode>=48&&event.keyCode<=57)||event.keyCode==8||event.keyCode==110||event.keyCode==190){
			if(this.value[0]=="."){
				alert("请输入正数"); 
				this.value="";
			}else{ 
				var a=parseFloat($(this).val());
				if(isNaN(a)){   
					alert("请输入正数"); 
					this.value="";    
				}  
			} 
			
		}else{
			alert("请输入正数"); 
			this.value="";
		}
	});
	
});	

</script>

</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>  
			<td width="737">
			修改团购商品  
			</td>
		</tr>
	</table>
	  
	<br />
		
		<s:form action="/admin/groupPurchase/modifyGroupPurchase" method="post" enctype="multipart/form-data" id="form1" theme="simple">
			<input type="hidden" name="groupPurchaseInfo.id" value="${groupPurchaseInfo.id}"></input>
			<input type="hidden" name="groupPurchaseInfo.currentUsers" value="${groupPurchaseInfo.currentUsers}"></input>
			<input type="hidden" name="groupPurchaseInfo.totalCount" value="${groupPurchaseInfo.totalCount}"></input>
			<input type="hidden" name="groupPurchaseInfo.pageAddress" value="${groupPurchaseInfo.pageAddress}"></input>
			<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0">
							<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>团购标题：</td>
                	<td><input size="100" type="text" name="groupPurchaseInfo.title" value="${groupPurchaseInfo.title}"></input><span id="errorsDiv_groupPurchaseInfo.title"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>团购描述：</td>
                	<td>
                		<textarea name="groupPurchaseInfo.content" rows="5" cols="80%">${groupPurchaseInfo.content}</textarea>
                		<!--<input size="30" type="text" name="groupPurchaseInfo.content" value="${groupPurchaseInfo.content}"></input>--><span id="errorsDiv_groupPurchaseInfo.content"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>团购商品名称：</td>
                	<td><input size="30" type="text" name="groupPurchaseInfo.productName" value="${groupPurchaseInfo.productName}"></input><span id="errorsDiv_groupPurchaseInfo.productName"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" align="center">  </td>
            		<td>
            			<table align="left" id="listTable">          
            				<tr id="tr">  
            					<td width="160" align="center">规格名称</td>
            					<td width="70" align="center">重量（斤）</td>  
            					<td width="70" align="center">单位</td>  
            					<td width="95" align="center">市场价（元/箱）</td>     
            					<td width="95" align="center">团购价（元/箱）</td>   
            					<td width="70" align="center">运费（元）</td>        
            					<td width="75" align="center"><a href="#" onclick="addLine();">新增</a></td>    
            				</tr>
            				<s:if test="listGPD!=null&&listGPD.size()>0">
            					<input id="customSize" type="text" value='<s:property value="listGPD.size()"/>' style="display: none;"></input>
            					<s:iterator id="item" value="listGPD" status="list">
								<tr id="tr<s:property value="#list.count-1"/>">  
								<td><input size="20" type="text" name="listGPD[<s:property value="#list.count-1"/>].specs" value='<s:property value="#item.specs"/>'></input></td>
            					<td><input size="5" type="text" name="listGPD[<s:property value="#list.count-1"/>].weight" class="amount" value='<s:property value="#item.weight"/>'></input></td>  
            					<td><input size="5" type="text" name="listGPD[<s:property value="#list.count-1"/>].unit" value='<s:property value="#item.unit"/>'></input></td>
            					<td><input size="9" type="text" name="listGPD[<s:property value="#list.count-1"/>].marketPrice" class="amount" value='<s:property value="#item.marketPrice"/>'></input></td>  
            					<td><input size="9" type="text" name="listGPD[<s:property value="#list.count-1"/>].groupPrice" class="amount" value='<s:property value="#item.groupPrice"/>'></input></td>  
            					<td><input size="5" type="text" name="listGPD[<s:property value="#list.count-1"/>].fee" class="amount" value='<s:property value="#item.fee"/>'></input></td>    
            					<td align="center"><a href="#" onclick="deleteLine('tr<s:property value="#list.count-1"/>')">删除</a></td>     
								</tr>
								</s:iterator>
            				</s:if>
            				<s:else>
            				<input id="customSize" type="text" value='<s:property value="1"/>' style="display: none;"></input>
            				<tr id="tr0">  
            					<td><input size="20" type="text" name="listGPD[0].specs"></input></td>
            					<td><input size="5" type="text" class="amount" name="listGPD[0].weight"></input></td>  
            					<td><input size="5" type="text" name="listGPD[0].unit"></input></td>
            					<td><input size="9" type="text" class="amount" name="listGPD[0].marketPrice"></input></td>  
            					<td><input size="9" type="text" class="amount" name="listGPD[0].groupPrice"></input></td>  
            					<td><input size="5" type="text" class="amount" name="listGPD[0].fee"></input></td>    
            					<td align="center"><a href="#" onclick="deleteLine('tr0')">删除</a></td>      
            				</tr>  
            				</s:else>
            			</table>
            		</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >组团人数上限：</td>  
                	<td><input size="5" type="text" name="groupPurchaseInfo.upperLimit" value="${groupPurchaseInfo.upperLimit}"></input>人</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>组团人数下限：</td>
                	<td><input size="5" type="text" name="groupPurchaseInfo.lowerLimit" value="${groupPurchaseInfo.lowerLimit}"></input>人&nbsp;<span id="errorsDiv_groupPurchaseInfo.lowerLimit"></td>
            	</tr>
            	<s:if test='groupPurchaseInfo.isTimeLimit=="Y"'>  
            	<tr>
            		<td height="30" class="wz_left" >时间限制：</td>
                	<td>
                		<label><input type="radio" value="Y" name="groupPurchaseInfo.isTimeLimit" checked="checked" onclick="showTime();"/>限制</label> 
                  <!--  <label><input type="radio" value="N" name="groupPurchaseInfo.isTimeLimit" onclick="hideTime();"/>不限制 </label>   -->     
                	</td>
            	</tr>
            	<tr id="time1">  
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>开始时间：</td>
                	<td><input size="30" type="text" name="startTime" id="datetime1" value="${startTime}"></input><span id="errorsDiv_startTime"></span></td>
            	</tr>
            	<tr id="time2">
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>截止时间：</td>
                	<td><input size="30" type="text" name="stopTime" id="datetime2" value="${stopTime}"></input><span id="errorsDiv_stopTime"></span></td>  
            	</tr>
            	</s:if>
            	<s:else>
            	<tr>
            	<td height="30" class="wz_left" >时间限制：</td>
                	<td>
                		<label><input type="radio" value="Y" name="groupPurchaseInfo.isTimeLimit" onclick="showTime();"/>限制</label> 
                		<label><input type="radio" value="N" name="groupPurchaseInfo.isTimeLimit" onclick="hideTime();" checked="checked"/>不限制 </label>  
                	</td>
            	</tr>
            	<tr id="time1" style="display: none;">  
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>开始时间：</td>
                	<td><input size="30" type="text" name="startTime" id="datetime1" value="${startTime}"></input><span id="errorsDiv_startTime"></span></td>
            	</tr>
            	<tr id="time2" style="display: none;">
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>截止时间：</td>
                	<td><input size="30" type="text" name="stopTime" id="datetime2" value="${stopTime}"></input><span id="errorsDiv_stopTime"></span></td>  
            	</tr>
            	</s:else>
            	<tr>
            		<td height="30" class="wz_left" >发货中心：</td>
                	<td><input size="50" type="text" name="groupPurchaseInfo.goodsCenter" value="${groupPurchaseInfo.goodsCenter}"></input></td>  
            	</tr>
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td>
	              	<input type="submit" value=" 发 布 " id="fb"/>&nbsp;<input type="hidden" name="groupPurchaseInfo.status" value="Y" id="status"/>
	              	<input type="submit" value="暂不发布" onclick="JavaScript:document.getElementById('status').value='N';document.getElementById('fb').click();"/>
	              	<input type="button" onclick="window.location.href='listGroupPurchase'" value=" 返 回 " />    
	              	</td>
	        	</tr>  
			</table>
		</s:form>
	<br>
</body>
</html>