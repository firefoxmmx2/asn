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
	window.open("/asn/do/productType/getAllType?fldOfName=typeName&fldOfCode=purchaseInfo.type","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}

//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"purchaseInfo.title:求购信息标题|required",
		"purchaseInfo.title:求购信息标题|maxlength|30",
		"purchaseInfo.type:信息分类|required",
		"purchaseInfo.keyWord:关键词|maxlength|30",
		"purchaseInfo.detail:详细说明|required",
		"purchaseInfo.detail:详细说明|maxlength|500"
		
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
	document.getElementById("purchaseInfo.typeName").value=value;
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
			修改求购信息
			</td>
		</tr>
	</table>
	<br>
	<s:form action="/do/info/updatePurchaseInfo" method="post" enctype="multipart/form-data" id="form1">
	<div style="display: none;"><input type="text" name="purchaseInfo.infoId" value="<s:property value='purchaseInfo.infoId'/>"></input></div>
	<div style="display: none;"><input type="text" name="purchaseInfo.memberId" value="<s:property value='purchaseInfo.memberId'/>"></input></div>
		<table width="90%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>求购信息标题：</td>
                	<td><input type="text" name="purchaseInfo.title" size="38" value="<s:property value='purchaseInfo.title'/>"></input><span id="errorsDiv_purchaseInfo.title"></span></td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>信息分类：</td>
                	<td><input type="text" name="typeName" size="38" disabled="disabled" id="typeName" value="<s:property value='purchaseInfo.typeName'/>"/><input type="button" value="选择" onclick="onOpen()" /><input type="text" name="purchaseInfo.typeName" id="purchaseInfo.typeName" style="display: none;"/><input type="text" name="purchaseInfo.type" style="display: none;" value="<s:property value='purchaseInfo.type'/>"/><span id="errorsDiv_purchaseInfo.type"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left">所属地区：</td>
                	<td><input type="hidden" name="purchaseInfo.area" id="area" style="display: none;"><span id="divArea"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>详细说明：</td>
                	<td>
                	<textarea name="purchaseInfo.detail" rows="15" cols="60" id="detail"><s:property value='purchaseInfo.detail'/></textarea>
                	<span id="errorsDiv_purchaseInfo.detail"></span>
                	</td>
            	</tr>
            	<tr>
            		<td>&nbsp;</td>
            		<td><span style="color: gray">关键词总共不超过30个字，各关键词以中文，号隔开</span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >关键词：</td>
            		<td><input type="text" name="purchaseInfo.keyWord" size="38" id="keyword" value="<s:property value='purchaseInfo.keyWord'/>"></input><input type="button" value="自动抽取" onclick="getKeyword();" />
            		<span id="errorsDiv_purchaseInfo.keyWord"></span>
            		</td>
            	</tr>	
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>信息有效期：</td>
                	<td>
                	 <span id="infoValidity" style="display: none"><s:property value="purchaseInfo.infoValidity"></s:property></span>
                	<label><input type="radio" id="infoV10" name="purchaseInfo.infoValidity" value="10" class="frmrd"></input>10天</label>
					<label><input type="radio" id="infoV20" name="purchaseInfo.infoValidity" value="20" class="frmrd"></input>20天</label>
					<label><input type="radio" id="infoV30" name="purchaseInfo.infoValidity" value="30" class="frmrd"></input>1个月</label>
					<label><input type="radio" id="infoV90" name="purchaseInfo.infoValidity" value="90" checked="checked" class="frmrd"></input>3个月</label>
					<label><input type="radio" id="infoV180" name="purchaseInfo.infoValidity" value="180" class="frmrd"></input>6个月</label>
					<label><input type="radio" id="infoV360" name="purchaseInfo.infoValidity" value="360" class="frmrd"></input>12个月</label>
					<label><input type="radio" id="infoV3600" name="purchaseInfo.infoValidity" value="3600" class="frmrd"></input>长期</label>
                	<span id="errorsDiv_purchaseInfo.infoValidity"></span>
                	</td>
            	</tr>
            	<s:if test='purchaseInfo.infoStatus=="on"'>
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
               		<td>
                	<label><input type="radio" name="purchaseInfo.infoStatus" value="on" checked="checked" class="frmrd"/>是</label>
					<label><input type="radio" name="purchaseInfo.infoStatus" value="off" class="frmrd"/>否</label>
                	<span id="errorsDiv_purchaseInfo.status"></span></td>
            	</tr> 
            	</s:if>
            	<s:else>
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
               		<td>
                	<label><input type="radio" name="purchaseInfo.infoStatus" value="on" class="frmrd"/>是</label>
					<label><input type="radio" name="purchaseInfo.infoStatus" value="off" checked="checked" class="frmrd"/>否</label>
                	<span id="errorsDiv_purchaseInfo.status"></span></td>
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