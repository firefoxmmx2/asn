<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %> 
<%@page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType" %> 
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create product</title>
<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>    
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-timer.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/auto-complete/jquery.auto-complete.js"></script>
<script type="text/javascript" src="<%=cp%>/js/facade-editor.js"></script>
<script type="text/javascript" src="<%=cp%>/js/tiny_mce/jquery.tinymce.js"></script>

<style type="text/css"> 
.wz_left{ padding-right:10px; text-align:right; font-size:12px; color:#000000;}
body{font-size:12px;font-family:"新宋体";}

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
	var tr=table.insertRow(0);
	tr.id="tr"+count;
	var td0=tr.insertCell(0);
	var td1=tr.insertCell(1);
	var td2=tr.insertCell(2);
	td0.innerHTML='<input type="text" name="listPCP['+count+'].propertyName" size="10" maxlength="10"></input>';
	td1.innerHTML='<input type="text" name="listPCP['+count+'].propertyDetail" maxlength="20"></input>';
	td2.innerHTML='<input type="button" value="删除" onclick="deleteLine('+"'"+"tr"+count+"'"+')"></input>';
	count++;
	rowNum++;
}

function deleteLine(id){
	var tr=document.getElementById(id);
	tr.parentNode.removeChild(tr);
	rowNum--;
}

function onOpen(){
	window.open("/asn/do/productType/productType?fldOfName=productType&fldOfCode=product.productType","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}


// 设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
		"product.productNumber:商品编号|maxlength|50",
		"product.productName:商品名称|required",
		"product.productName:商品名称|maxlength|30",
		"product.productType:商品类别|required",
		"product.webOrder:是否支持网上订购|required",
		"product.productUnit:计量单位|required",
		"product.productUnit:计量单位|maxlength|10",
		"product.startOrderCount:起订量|required",
		"product.startOrderCount:起订量|numeric",
		"product.startOrderCount:起订量|maxlength|10",
		"product.startOrderCount:|mask|count_mask",
		"product.wareCount:库存量|required",
		"product.wareCount:库存量|numeric",
		"product.wareCount:库存量|maxlength|10",
		"product.wareCount:|mask|count_mask",
		"range2:区间值|required",
		"range2:区间值|numeric",
		"range2:区间值|maxlength|10",
		"range2:|mask|count_mask",
		"range4:区间值|numeric",
		"range4:区间值|maxlength|10",
		"range4:|mask|count_mask",
		"range6:区间值|numeric",
		"range6:区间值|maxlength|10",
		"range6:|mask|count_mask",
		"product.price1:商品单价|required",
		"product.price1:商品单价|double",	
		"product.price1:商品单价|maxlength|10",
		"product.price2:商品单价|double",	
		"product.price2:商品单价|maxlength|10",
		"product.price3:商品单价|double",	
		"product.price3:商品单价|maxlength|10",
		"product.productStatus:是否立即发布上网|required",
		//"product.productDetail:商品描述|maxlength|500",
		"product.wholesaleDetail:批发说明|maxlength|500",
		"product.transportDetail:运费说明|maxlength|500",
		"delivery.post:平邮价格|required",
		"delivery.post:平邮价格|double",	
		"delivery.post:平邮价格|maxlength|10",
		"delivery.express:快递价格|required",
		"delivery.express:快递价格|double",	
		"delivery.express:快递价格|maxlength|10",
		"delivery.ems:EMS价格|required",
		"delivery.ems:EMS价格|double",	
		"delivery.ems:EMS价格|maxlength|10"
	);
	// 遮罩规则的详细定义
	yav.addMask('count_mask', '      ', '1234567890');
	// 输入提示
	yav.addHelp('product.startOrderCount', '起订量应为0~9的数字');
	yav.addHelp('product.wareCount', '库存量应为0~9的数字');
	// 输入时验证
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});
	// 初始化立面编辑器，参数依次是：分类号输入框、立面编辑容器、保存立面信息的目标字段的name或者ID
	facadeEditor.init("product.productType", "facade", "product.facade",document.getElementById("facadeValue").value);
	// 初始化商品描述编辑器
	var editor=butil.element('product.productDetail');
	$(editor).tinymce({
		// Location of TinyMCE script
		script_url : '<%=cp%>/js/tiny_mce/tiny_mce.js',

		// General options
		theme : "advanced",
		language: "zh",
		//plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",
		plugins : "advhr,advimage,advlink,emotions,media,paste,fullscreen",
		
		// Theme options
		//theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons1 : ".cut,copy,paste,pastetext,pasteword,undo,redo,|,bold,italic,underline,strikethrough,|,bullist,numlist,fontsizeselect,|,forecolor,backcolor,|,link,unlink,image,cleanup,code",
		//theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_buttons2 : "",
		//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		theme_advanced_buttons3 : "",
		//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
		theme_advanced_buttons4 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		//theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,  

		// Example content CSS (should be your site CSS)
		//content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
});


function initUnit(){
	var unit=document.getElementById("product.productUnit").value;
	document.getElementById("startOrderCountUnit").innerHTML=unit;
	document.getElementById("wareCountUnit").innerHTML=unit;
	for(var i=1;i<=9;i++){
		document.getElementById("unit"+i).innerHTML=unit;
	}
}

function initValue0(){
	var value0=document.getElementById("startOrderCount").value;
	document.getElementById("range1").value=value0;
}

function initValue1(){
	var value1=document.getElementById("range2").value;
	document.getElementById("range3").value=Number(value1)+1;
	document.getElementById("range4").removeAttribute("disabled");
	document.getElementById("price2").removeAttribute("disabled");
//	showNumTip(document.getElementById("range4"), "unit5");
}

function initValue2(){
	var value1=document.getElementById("range4").value;
	document.getElementById("range5").value=Number(value1)+1;
	document.getElementById("range6").removeAttribute("disabled");
	document.getElementById("price3").removeAttribute("disabled");
//	showNumTip(document.getElementById("range6"), "unit8");
}

function checkNum(){
	var value=document.getElementById("productNumber").value;
	if(value!=null&&value!=""){
		var ret=butil.getUrl("<%=cp%>/do/product/checkProductNumber?productNumber="+value+"&supplierId=<%=MemberService.getMemberId()%>");
		if(ret!="yes"){
			alert("该编号"+value+"已存在，请另选");
			document.getElementById("productNumber").value="";
			document.getElementById("productNumber").focus();
			return false;
		}
	}
	
}

function showNumTip(elem, spanUnit){
	if(elem.value=="") {
		elem.value="以上";
		$("#"+spanUnit).css("visibility", "hidden");
		$(elem).css("color", "#999999");
	} 
}

function hideNumTip(elem, spanUnit){
	if(elem.value=="以上") elem.value=""; 
	$("#"+spanUnit).css("visibility", "visible");
	$(elem).css("color", "#000000");
}

$(document).ready(function(){
	$("#productNumber").blur(function(){
		checkNum();
	});
	$(document.getElementById("product.productUnit")).blur(function(){
		initUnit();
	});
	$("#range2").blur(function(){
		initValue1();
	});
	$("#range4").blur(function(){
		initValue2();
	});
	$("#startOrderCount").blur(function(){
		initValue0();
	});
	
});

function valueCheckBox(){
	var tradeType=document.getElementById("tradeType").innerHTML;
	if(tradeType=="0, 1"){
		var c0=document.getElementById("c0");
		c0.checked=true;
		var c1=document.getElementById("c1");
		c1.checked=true;
	}else if(tradeType=="0"){
		var c0=document.getElementById("c0");
		c0.checked=true;
	}else{
		var c1=document.getElementById("c1");
		c1.checked=true;
	}
}
function valueDelivery(){
	var deliveryType=document.getElementById("dType").innerHTML;
	if(deliveryType!="no"){
		var dt=deliveryType.split(",");
		for(var i=0;i<=dt.length-2;i++){
			var d=document.getElementById("d"+dt[i]);
			d.checked=true;
		}
	}
}

function beforeLoad(){
	valueDelivery();
}



var prodcutTypeUrl="~/do/productType/getSonType";
var proArray = butil.getJson(prodcutTypeUrl);
var firstType = proArray[0];
var secondType = proArray[1];
var thirdType = proArray[2];

function onsel(code,num){
	if(num=='1'){
		var strvalue = "";
		document.getElementById("productSecond").style.display = "none";
		document.getElementById("productThird").style.display = "none";
		document.getElementById("productTypeN2").value="";
		for(var i=0;i<firstType.length;i++){
			var productType=firstType[i]
			if(productType.ptcode==code){
				document.getElementById("s"+productType.ptid+"-1").className = "selected";
				document.getElementById("productTypeN1").value =productType.pttypeName+"-";
			}else{
				document.getElementById("s"+productType.ptid+"-1").className = "";
			}
		}
		for(var i=0;i< secondType.length;i++){
			var productType = secondType[i];				
			if(productType.ptcode.substring(0,4)==code){
				strvalue = strvalue+ "<span id='s"+productType.ptid+"-2' onmousedown=onsel('"+productType.ptcode+"','2')>"+productType.pttypeName+"</span>";
			}
		}
		if(strvalue != ""){
			document.getElementById("productSecond").style.display = "block";
			document.getElementById("productSecond").innerHTML = strvalue;
		}

	}
	if(num=='2'){
		var  strvalue = "";
		document.getElementById("productThird").style.display = "none";
		for(var i=0;i<secondType.length;i++){
			var productType=secondType[i]
			if(productType.ptcode.substring(0,4)==code.substring(0,4)){
				if(productType.ptcode==code){
					document.getElementById("s"+productType.ptid+"-2").className = "selected";
					document.getElementById("productTypeN2").value =productType.pttypeName+"-";
				}else{
					document.getElementById("s"+productType.ptid+"-2").className = "";
				}
			}
		}
		for(var i=0;i< thirdType.length;i++){
			var productType = thirdType[i];				
			if(productType.ptcode.substring(0,9)==code){
				strvalue = strvalue+ "<span id='s"+productType.ptid+"-3' onmousedown=onsel('"+productType.ptcode+"','3')>"+productType.pttypeName+"</span>";
			}
		}
		if(strvalue != ""){
			document.getElementById("productThird").style.display = "block";
			document.getElementById("productThird").innerHTML = strvalue;
		}
	}
	if(num=='3'){
		for(var i=0;i<thirdType.length;i++){
			var productType=thirdType[i]
			if(productType.ptcode.substring(0,9)==code.substring(0,9)){
				if(productType.ptcode==code){
					document.getElementById("s"+productType.ptid+"-3").className = "selected";
					document.getElementById("productType").value=code;
					document.getElementById("productTypeName1").innerHTML =document.getElementById("productTypeN1").value+document.getElementById("productTypeN2").value+productType.pttypeName;
				}else{
					document.getElementById("s"+productType.ptid+"-3").className = "";
				}
			}
		}
		
	}
	
}

function hidePost(){
	document.getElementById("post1").style.display='none';
	document.getElementById("post2").style.display='none';
	document.getElementById("post3").style.display='none';
	document.getElementById("p1").value=0;
	document.getElementById("p2").value=0;
	document.getElementById("p3").value=0;
}

function showPost(){
	document.getElementById("post1").style.display='';
	document.getElementById("post2").style.display='';
	document.getElementById("post3").style.display='';  
	document.getElementById("p1").value="";
	document.getElementById("p2").value="";
	document.getElementById("p3").value="";  
}

</script>

</head>
<body>

	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			修改商品信息
			</td>
		</tr>
	</table>
	<br>
			<div style="width:300px;height:30px;margin-left:13px; background: url(../../image/hzx/xg1.gif) no-repeat "></div>
		<table width="778" height="270" align="center" cellpadding="0" cellspacing="0">
			<tr>  
				<td width="28" align="center" style="background: url(../../image/hzx/left_bg.gif) no-repeat"></td>
				<td valign="top" height="270" background="#E5fOFF" width="710" style="background: url(../../image/hzx/mid_bg.gif) repeat-x;">   
				<div class="divscr">
					<%
						for(ProductType item:(List<ProductType>)request.getAttribute("firstType")) {
							if(item.getPtcode().substring(0,4).equals(request.getAttribute("type1"))){
					%>		
							<span class="selected" onmousedown="onsel('<%=item.getPtcode() %>','1')" id="s<%=item.getPtid() %>-1"><%=item.getPttypeName() %></span>
					<% }else{ %>  
					
					<span onmousedown="onsel('<%=item.getPtcode() %>','1')" id="s<%=item.getPtid() %>-1"><%=item.getPttypeName() %></span>
					<%} } %>   
				</div>
				<div class="divscr" style="margin-left:5px;display:block;" id="productSecond"> 
					<%	
						for(ProductType item:(List<ProductType>)request.getAttribute("secondType")) {
							if(item.getPtcode().substring(0,4).equals(request.getAttribute("type1"))){
							if(item.getPtcode().substring(0,9).equals(request.getAttribute("type2"))){
					%>		
							<span class="selected" onmousedown="onsel('<%=item.getPtcode() %>','2')" id="s<%=item.getPtid()%>-2"><%=item.getPttypeName() %></span>
					<% }else{ %>  
						<span class="" onmousedown="onsel('<%=item.getPtcode() %>','2')" id="s<%=item.getPtid()%>-2"><%=item.getPttypeName() %></span>
					<%	 } 
						} }%>  
				</div>
				<div class="divscr" style="margin-left:5px;display:block;" id="productThird"> 
					<%
						for(ProductType item:(List<ProductType>)request.getAttribute("thirdType")) {
							if(item.getPtcode().substring(0,9).equals(request.getAttribute("type2"))){
							if(item.getPtcode().equals(request.getAttribute("type3"))){
					%>		
							<span class="selected" onmousedown="onsel('<%=item.getPtcode() %>','3')" id="s<%=item.getPtid()%>-3"><%=item.getPttypeName() %></span>
					<% }else{ %>  
					<span onmousedown="onsel('<%=item.getPtcode() %>','3')" id="s<%=item.getPtid()%>-3"><%=item.getPttypeName() %></span>
					<%} 
						}} %>  
				 </div>
				<div id="length" style="display: none;"><s:property value="secondType.size()"/></div>
				<div id="length2" style="display: none;"><s:property value="thirdType.size()"/></div>
				</td>
				<td width="34" align="center" style="background: url(../../image/hzx/right_bg.gif) no-repeat"></td>   
			</tr>	    
			<tr>
				<td colspan="3"> 
					<input type="hidden" name="productTypeN1" id="productTypeN1" size="40" value="<s:property value='#request.name1'/>"/>
					<input type="hidden" name="productTypeN2" id="productTypeN2" size="40" value="<s:property value='#request.name2'/>"/>
					<span id="errorsDiv_product.productType"></span>
				</td>
			</tr>
		</table>
	
		<div style="position: relative;left: 200px; width:100px;height:30px; background: url(../../image/hzx/sxsp.gif) no-repeat"><div id="productTypeName1" style="position:relative;padding-left:110px; line-height:30px;vertical-align:middle; width:300px; color:#FB8502; font-weight:700;"><s:property value='#request.pType'/></div></div>
		<div style="position: relative;left: 380px; width:40px;height:60px; background: url(../../image/hzx/jiantou.gif) no-repeat"></div>
		<div style="width:300px;height:30px;margin-left:13px; background: url(../../image/hzx/xg2.gif) no-repeat "></div>
	
	
	
		<s:form action="/do/product/updateProduct" method="post" enctype="multipart/form-data" id="form1">
		<div style="display: none;"><input type="text" name="product.productId" value="<s:property value='product.productId'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.supplierId" value="<s:property value='product.supplierId'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.smallPicPath" value="<s:property value='product.smallPicPath'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.bigPicPath" value="<s:property value='product.bigPicPath'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.smallPicPath1" value="<s:property value='product.smallPicPath1'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.bigPicPath1" value="<s:property value='product.bigPicPath1'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.smallPicPath2" value="<s:property value='product.smallPicPath2'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.bigPicPath2" value="<s:property value='product.bigPicPath2'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.smallPicPath3" value="<s:property value='product.smallPicPath3'/>"></input></div>
		<div style="display: none;"><input type="text" name="product.bigPicPath3" value="<s:property value='product.bigPicPath3'/>"></input></div>
		<div style="display: none;"><input type="text" name="delivery.deliveryId" value="<s:property value='delivery.deliveryId'/>"></input></div>
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left" >&nbsp;&nbsp;商品编号：</td>
                	<td><input size="30" type="text" name="product.productNumber" onchange="checkNum()"  id="productNumber" value="<s:property value='product.productNumber'/>"></input><span id="errorsDiv_product.productNumber"></span></td>
            	</tr>
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>商品名称：</td>
                	<td><input size="30" type="text" name="product.productName" value="<s:property value='product.productName'/>"></input><span id="errorsDiv_product.productName"></span></td>
            	</tr>
            	<tr style="display: none;">
            		<td height="30" class="wz_left"><span style="color:red;">*</span>商品类别：</td>
                	<td><input id="productType" type="text" name="product.productType" style="display: none;" value="<s:property value='product.productType'/>"/></td>
            	</tr>
            	<tr>
            		<td>
            		<input type="hidden" name="product.facade"></input><input type="hidden" id="facadeValue" value="<s:property value='product.facade'/>"></input>
            		</td>
            	 	<td>
            	 		<div id="facade"></div>
            	 	</td>
            	</tr>
            	<tr>
            		<td>&nbsp;</td>
            		<td>
            			<table>
            				<thead>
            					<tr>
            						<td width="100px">自定义属性</td>
            						<td width="100px">自定义属性描述</td>
									<td width="250px"><input type="button" value="新增" onclick="addLine()"></td>
            					</tr>
            				</thead>
            			</table>
            		</td>
            	</tr>
            <tr>
            	<td>&nbsp;</td>
            	<td>
            		<table id="listTable">
            			<s:if test="listPCP!=null&&listPCP.size()>0">
						<input id="customSize" type="text" value='<s:property value="listPCP.size()"/>' style="display: none;"></input>
						<s:iterator id="item" value="listPCP" status="list">
						<tr id="tr<s:property value="#list.count-1"/>">
							<td><input type="text" name="listPCP[<s:property value="#list.count-1"/>].propertyName" value='<s:property value="#item.propertyName"/>' size="10"></input></td>
							<td><input type="text" name="listPCP[<s:property value="#list.count-1"/>].propertyDetail" value='<s:property value="#item.propertyDetail"/>'></input></td>
							<td><input type="button" value="删除" onclick="deleteLine('tr<s:property value="#list.count-1"/>')"></input></td>
						</tr>
						</s:iterator>
						</s:if>
				<s:else>
					<input id="customSize" type="text" value='<s:property value="1"/>' style="display: none;"></input>
					    <tr id="tr0">
            				<td width="50px"><input type="text" name="listPCP[0].propertyName" size="10" maxlength="10"></input></td>
            				<td width="50px"><input type="text" name="listPCP[0].propertyDetail" maxlength="20"></input></td>
            				<td width="50px"><input type="button" value="删除" onclick="deleteLine('tr0')"></input></td>
            			</tr>
				</s:else>
					</table>
            	</td>
            </tr>
            	<tr>
            		<td height="30" class="wz_left" >
            		<s:if test="product.smallPicPath==null">
            		<img alt="" src='${pageContext.request.contextPath}/images/photo_not_exits_small.gif'>
            		</s:if>
            		<s:else>
            		<img alt="" src='${pageContext.request.contextPath}/<s:property value="product.smallPicPath"/>'>
            		</s:else>
            		</td>
                	<td>商品图片1：<input type="file" name="originalPic"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >
            		<s:if test="product.smallPicPath1==null">
            		<img alt="" src='${pageContext.request.contextPath}/images/photo_not_exits_small.gif'>
            		</s:if>
            		<s:else>
            		<img alt="" src='${pageContext.request.contextPath}/<s:property value="product.smallPicPath1"/>'>
            		</s:else>
            		</td>
                	<td>商品图片2：<input type="file" name="originalPic1"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >
            		<s:if test="product.smallPicPath2==null">
            		<img alt="" src='${pageContext.request.contextPath}/images/photo_not_exits_small.gif'>
            		</s:if>
            		<s:else>
            		<img alt="" src='${pageContext.request.contextPath}/<s:property value="product.smallPicPath2"/>'>
            		</s:else>
            		</td>
                	<td>商品图片3：<input type="file" name="originalPic2"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >
            		<s:if test="product.smallPicPath3==null">
            		<img alt="" src='${pageContext.request.contextPath}/images/photo_not_exits_small.gif'>
            		</s:if>
            		<s:else>
            		<img alt="" src='${pageContext.request.contextPath}/<s:property value="product.smallPicPath3"/>'>
            		</s:else>
            		</td>
                	<td>商品图片4：<input type="file" name="originalPic3"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left">商品描述：</td>
                	<td>
                		<textarea name="product.productDetail" rows="15" cols="40"><s:property value='product.productDetail'/></textarea>
                		<span id="errorsDiv_product.productDetail"></span>
                	</td>
            	</tr>
            	<tr>
            		<td>&nbsp;</td>
            		<td>&nbsp;</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left">批发说明：</td>
                	<td>
                	<textarea name="product.wholesaleDetail" rows="7" cols="60"><s:property value='product.wholesaleDetail'/></textarea>
                	<span id="errorsDiv_product.wholesaleDetail"></span>
                	</td>
            	</tr>
            	<tr>
            		<td>&nbsp;</td>
            		<td>&nbsp;</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >运费说明：</td>
                	<td>
                	<textarea name="product.transportDetail" rows="7" cols="60"><s:property value='product.transportDetail'/></textarea>
                	<span id="errorsDiv_product.transportDetail"></span>
                	</td>
            	</tr>
            	<s:if test='product.webOrder=="Y"'>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>是否支持网上订购：</td>
                	<td>
                		<label><input type="radio" name="product.webOrder" value="Y" checked="checked" class="frmrd"/>支持</label>
						<label><input type="radio" name="product.webOrder" value="N" class="frmrd"/>不支持</label>
						<span id="errorsDiv_product.webOrder"></span>
					</td>
            	</tr>
            	</s:if>
            	<s:else>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>是否支持网上订购：</td>
                	<td>
                		<label><input type="radio" name="product.webOrder" value="Y" class="frmrd"/>支持</label>
						<label><input type="radio" name="product.webOrder" value="N" checked="checked" class="frmrd"/>不支持</label>
						<span id="errorsDiv_product.webOrder"></span>
					</td>
            	</tr>
            	</s:else>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>计量单位：</td>
                	<td><input id="product.productUnit" autoCompleteOptions="千克;克;个;提;袋;箱;包;卷;块;米;桶;盒;盘;双;瓶;打;罐;筐;匹;听;篮;捆;辆" type="text" name="product.productUnit" size="8" onchange="initUnit()" value="<s:property value='product.productUnit'/>"></input><span id="errorsDiv_product.productUnit"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>起订量：</td>
                	<td><input type="text" name="product.startOrderCount" size="5" id="startOrderCount" value="<s:property value='product.startOrderCount'/>"></input><span id="startOrderCountUnit"><s:property value='product.productUnit'/></span><span id="errorsDiv_product.startOrderCount"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>库存量：</td>
                	<td><input type="text" name="product.wareCount" size="5" value="<s:property value='product.wareCount'/>"></input><span id="wareCountUnit"><s:property value='product.productUnit'/></span><span id="errorsDiv_product.wareCount"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >市场价格：</td>
                	<td><input type="text" name="product.marketPrice" size="5" value="<s:property value='product.marketPrice'/>"></input>元/<span id="unit10"><s:property value='product.productUnit'/></span></td>    
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>销售价格：</td>
            		<td style="color: gray">至少填写一个价格区间，方便买家订购</td>
            	</tr>
            	<tr>
            		<td>&nbsp;</td>
					<td>
						<table>
							<tr>
								<td><span style="color:red;">*</span>
									<input type="text" name="product_price1Range" size="6" disabled="disabled" id="range1" value="<s:property value='product.startOrderCount'/>"></input>
									<span id="unit1"><s:property value='product.productUnit'/></span>～
									<input type="text" name="product.price1Range" size="6" id="range2" value="<s:property value='product.price1Range'/>"></input>
									<span id="unit2"><s:property value='product.productUnit'/></span>:&nbsp;
									<input type="text" name="product.price1" size="6" id="price1" value="<s:property value='product.price1'/>"></input>
									元/<span id="unit3"><s:property value='product.productUnit'/></span>
									<span id="errorsDiv_range2"></span><span id="errorsDiv_product.price1"></span>
								</td>
							</tr>
							<tr>
								<td><span>&nbsp;&nbsp;</span>
									<input type="text" name="product_price2Range" size="6" disabled="disabled" id="range3" value="<s:property value='%{product.price1Range+1}'/>"></input>
									<span id="unit4"><s:property value='product.productUnit'/></span>～
									<input type="text" name="product.price2Range" size="6" id="range4" value="<s:property value='product.price2Range'/>"></input>
									<span id="unit5"><s:property value='product.productUnit'/></span>:&nbsp;
									<input type="text" name="product.price2" size="6" id="price2" value="<s:property value='product.price2'/>"></input>
									元/<span id="unit6"><s:property value='product.productUnit'/></span>
									<span id="errorsDiv_range4"></span><span id="errorsDiv_product.price2"></span>
								</td>
							</tr>
							<tr>
								<td><span>&nbsp;&nbsp;</span>
									<s:if test="product.price2Range!=null">
										<input type="text" name="product_price3Range" size="6" disabled="disabled"  id="range5" value="<s:property value='%{product.price2Range+1}'/>"></input>
									</s:if>
									<s:else>
										<input type="text" name="product_price3Range" size="6" disabled="disabled"  id="range5"></input>
									</s:else>
									<span id="unit7"><s:property value='product.productUnit'/></span>～
									<input type="text" name="product.price3Range" size="6"  id="range6" value="<s:property value='product.price3Range'/>"></input>
									<span id="unit8"><s:property value='product.productUnit'/></span>:&nbsp;
									<input type="text" name="product.price3" size="6"  id="price3" value="<s:property value='product.price3'/>"></input>
									元/<span id="unit9"><s:property value='product.productUnit'/></span>
									<span id="errorsDiv_range6"></span><span id="errorsDiv_product.price3"></span>
								</td>
							</tr>				
						</table>
					</td>
            	</tr>

            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>运费：</td>
                	<td>
                	<s:if test="product.postType>1">
                	<label><input type="radio" name="product.postType" value="2" class="frmrd" checked="checked" onclick="showPost();"></input>买家承担</label>
					<label><input type="radio" name="product.postType" value="0" class="frmrd" onclick="hidePost();"></input>卖家承担</label>
					<label><input type="radio" name="product.postType" value="1" class="frmrd" onclick="hidePost();"></input>联系卖家商定</label>
                	</s:if>
                	<s:elseif test="product.postType==1">
                	<label><input type="radio" name="product.postType" value="2" class="frmrd" onclick="showPost();"></input>买家承担</label>
					<label><input type="radio" name="product.postType" value="0" class="frmrd" onclick="hidePost();"></input>卖家承担</label>
					<label><input type="radio" name="product.postType" value="1" class="frmrd" checked="checked" onclick="hidePost();"></input>联系卖家商定</label>
                	</s:elseif>
                	<s:else>
                	<label><input type="radio" name="product.postType" value="2" class="frmrd" checked="checked" onclick="showPost();"></input>买家承担</label>
					<label><input type="radio" name="product.postType" value="0" class="frmrd" checked="checked" onclick="hidePost();"></input>卖家承担</label>
					<label><input type="radio" name="product.postType" value="1" class="frmrd" onclick="hidePost();"></input>联系卖家商定</label>
                	</s:else>
					<span id="errorsDiv_postType"></span>
					</td>
            	</tr>
            	<s:if test="product.postType>1">
            	<tr id="post1" style="display: table-row;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>平邮 ：<input id="p1" type="text" name="delivery.post" size="5" value="<s:property value='delivery.post'/>">元
            		<span id="errorsDiv_delivery.post"></span>
            		</td>
            	</tr>
            	<tr id="post2" style="display: table-row;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>快递 ：<input id="p2" type="text" name="delivery.express" size="5" value="<s:property value='delivery.express'/>"></input>元
            		<span id="errorsDiv_delivery.express"></span>
            		</td>
            	</tr>
            	<tr id="post3" style="display: table-row;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>EMS：<input id="p3" type="text" name="delivery.ems" size="5" value="<s:property value='delivery.ems'/>"></input>元
            		<span id="errorsDiv_delivery.ems"></span>
            		</td>
            	</tr>
            	</s:if>
            	<s:else>
            	<tr id="post1" style="display: none;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>平邮 ：<input id="p1" type="text" name="delivery.post" size="5" value="0"></input>元
            		<span id="errorsDiv_delivery.post"></span>
            		</td>
            	</tr>
            	<tr id="post2" style="display: none;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>快递 ：<input id="p2" type="text" name="delivery.express" size="5" value="0"></input>元
            		<span id="errorsDiv_delivery.express"></span>
            		</td>
            	</tr>
            	<tr id="post3" style="display: none;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>EMS：<input id="p3" type="text" name="delivery.ems" size="5" value="0"></input>元
            		<span id="errorsDiv_delivery.ems"></span>
            		</td>
            	</tr>
            	</s:else>
            	
				<s:if test='product.productStatus=="on"'>
				<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
                	<td>
                	<label><input type="radio" name="product.productStatus" value="on" checked="checked" class="frmrd"/>是（上架）</label>
					<label><input type="radio" name="product.productStatus" value="off" class="frmrd"/>否（下架）</label>
                	<span id="errorsDiv_product.productStatus"></span></td>
           	    </tr>    
				</s:if> 
            	<s:else>
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
                	<td>
                	<label><input type="radio" name="product.productStatus" value="on"  class="frmrd"/>是（上架）</label>
					<label><input type="radio" name="product.productStatus" value="off" checked="checked" class="frmrd"/>否（下架）</label>
                	<span id="errorsDiv_product.productStatus"></span></td>
            	</tr>    
            	</s:else>
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="submit" value="提交" class="button5" />&nbsp;</td>
	        	</tr>  
			</table>
		</s:form>
	<br>
</body>
</html>