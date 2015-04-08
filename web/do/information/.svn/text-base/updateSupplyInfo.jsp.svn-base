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
<title>create product supply</title>
<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>    
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-timer.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/facade-editor.js"></script>
<script type="text/javascript" src="<%=cp%>/js/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

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
function onOpen(){
	window.open("/asn/do/productType/getAllType?fldOfName=typeName&fldOfCode=supplyInfo.type","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}

//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"supplyInfo.title:供应信息标题|required",
		"supplyInfo.title:供应信息标题|maxlength|30",
		"supplyInfo.type:信息分类|required",
		"supplyInfo.keyWord:关键词|maxlength|30",
		"supplyInfo.detail:详细说明|required",
		"supplyInfo.detail:详细说明|maxlength|500"
		
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
function beforeSub(){
	var value=document.getElementById("typeName").value;
	document.getElementById("supplyInfo.typeName").value=value;
}
function valueRadio(){
	var infoValidity=document.getElementById("infoValidity").innerHTML;
	var infoV=document.getElementById("infoV"+infoValidity);
	infoV.checked=true;
}
function beforeLoad(){
	valueRadio();
}

//初始化地区组件
geoloc.debugOn();
$(document).ready(function(){
	geoloc.init("divArea", "- 不限省市 -", "- 不限地州市 -", "- 不限区县 -", "area","${requestScope.area }".substring(0,6));
});

// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
function showSelection(){
	var sel=geoloc.getSelection("divArea");
	if(sel==null){
		alert("没有选择");
	} else {
		alert(sel);
	}
}

function getKeyword(){
	var value=document.getElementById("detail").value;
	if(value!=null&&value!=""){
		var ret=butil.getUrl("<%=cp%>/do/info/getKeyword?source="+value);
		if(ret!="no"){
			document.getElementById("keyword").value=ret;
		}else{
			alert("抱歉，没有找到默认的关键词，请手工填写！");
		}
	}else{
		alert("请填写详细说明");
	}
}
</script>
</head>
<body onload="beforeLoad()">
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			修改供应信息
			</td>
		</tr>
	</table>
	<br>
	<s:form action="/do/info/updateSupplyInfo" method="post" enctype="multipart/form-data" id="form1">
	<div style="display: none;"><input type="text" name="supplyInfo.infoId" value="<s:property value='supplyInfo.infoId'/>"></input></div>
	<div style="display: none;"><input type="text" name="supplyInfo.supplierId" value="<s:property value='supplyInfo.supplierId'/>"></input></div>
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>供应信息标题：</td>
                	<td><input type="text" name="supplyInfo.title" size="38" value="<s:property value='supplyInfo.title'/>"></input><span id="errorsDiv_supplyInfo.title"></span></td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>信息分类：</td>
                	<td><input type="text" name="typeName" size="38" disabled="disabled" id="typeName" value="<s:property value='supplyInfo.typeName'/>"/><input type="button" value="选择" onclick="onOpen()" /><input type="text" name="supplyInfo.typeName" id="supplyInfo.typeName" style="display: none;"/><input type="text" name="supplyInfo.type" style="display: none;" value="<s:property value='supplyInfo.type'/>"/><span id="errorsDiv_supplyInfo.type"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left">所属地区：</td>
                	<td><input type="hidden" name="supplyInfo.area" id="area" style="display: none;"><span id="divArea"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>详细说明：</td>
                	<td>
                	<textarea name="supplyInfo.detail" rows="15" cols="60" id="detail"><s:property value='supplyInfo.detail'/></textarea>
                	<span id="errorsDiv_supplyInfo.detail"></span>
                	</td>
            	</tr>
            	<tr>
            		<td>&nbsp;</td>
            		<td><span style="color: gray">关键词总共不超过30个字，各关键词以中文，号隔开</span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >关键词：</td>
            		<td><input type="text" name="supplyInfo.keyWord" size="38" id="keyword" value="<s:property value='supplyInfo.keyWord'/>"></input><input type="button" value="自动抽取" onclick="getKeyword();" />
            		<span id="errorsDiv_supplyInfo.keyWord"></span>
            		</td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>信息有效期：</td>
                	<td>
                	 <span id="infoValidity" style="display: none"><s:property value="supplyInfo.infoValidity"></s:property></span>
                	<label><input type="radio" id="infoV10" name="supplyInfo.infoValidity" value="10" class="frmrd"></input>10天</label>
					<label><input type="radio" id="infoV20" name="supplyInfo.infoValidity" value="20" class="frmrd"></input>20天</label>
					<label><input type="radio" id="infoV30" name="supplyInfo.infoValidity" value="30" class="frmrd"></input>1个月</label>
					<label><input type="radio" id="infoV90" name="supplyInfo.infoValidity" value="90" checked="checked" class="frmrd"></input>3个月</label>
					<label><input type="radio" id="infoV180" name="supplyInfo.infoValidity" value="180" class="frmrd"></input>6个月</label>
					<label><input type="radio" id="infoV360" name="supplyInfo.infoValidity" value="360" class="frmrd"></input>12个月</label>
					<label><input type="radio" id="infoV3600" name="supplyInfo.infoValidity" value="3600" class="frmrd"></input>长期</label>
                	<span id="errorsDiv_supplyInfo.infoValidity"></span>
                	</td>
            	</tr>
            	<s:if test='supplyInfo.infoStatus=="on"'>
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
               		<td>
                	<label><input type="radio" name="supplyInfo.infoStatus" value="on" checked="checked" class="frmrd"/>是</label>
					<label><input type="radio" name="supplyInfo.infoStatus" value="off" class="frmrd"/>否</label>
                	<span id="errorsDiv_supplyInfo.status"></span></td>
            	</tr> 
            	</s:if>
            	<s:else>
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
               		<td>
                	<label><input type="radio" name="supplyInfo.infoStatus" value="on" class="frmrd"/>是</label>
					<label><input type="radio" name="supplyInfo.infoStatus" value="off" checked="checked" class="frmrd"/>否</label>
                	<span id="errorsDiv_supplyInfo.status"></span></td>
            	</tr> 
            	
            	</s:else>  
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="submit" value="提交" onclick="beforeSub()" class="button5" />&nbsp;</td>
	        	</tr>  
		</table>	
	</s:form>
</body>
</html>