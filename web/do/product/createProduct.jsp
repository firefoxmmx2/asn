<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %> 
<%@ page import="com.bornsoft.asn.service.supplier.SupplierService" %> 
<%@page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType" %> 
<% String cp=request.getContextPath(); %>
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
	var v=document.getElementById();
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
	facadeEditor.init("product.productType", "facade", "product.facade");
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
	for(var i=1;i<=10;i++){     
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
	$("#order1").select(function(){
		alert("1");
	});
	$("#order2").select(function(){
		alert("2");
	});
	
});


var prodcutTypeUrl="~/do/productType/getSonType";
var proArray = butil.getJson(prodcutTypeUrl);
var firstType = proArray[0];
var secondType = proArray[1];
var thridType = proArray[2];
var sum = 0;
var sum2 = 0;

function onsel(val,n,orderID){	
	var selArray = "";	
	var productTypeName = document.getElementById("productTypeName").value; 
	if(n == "1"){	
		sum=0;		
		var strvalue = "";
		document.getElementById("productSecond").style.display = "none";
		document.getElementById("productThird").style.display = "none";
		productTypeName = ""; 
		for(var i=0;i<firstType.length;i++){
			var productType = firstType[i];
			var id=productType.ptid;
			if(id==val){
				document.getElementById("s"+val+"-1").className = "selected";
				selArray = onProduct(val,firstType);
				document.getElementById("productTypeName").value = productTypeName + selArray[0]+ "-";
			}else{
				document.getElementById("s"+productType.ptid+"-1").className = "";
			}
		}
		for(var i=0;i< secondType.length;i++){
			var productType = secondType[i];				
			if(productType.ptparentid == val){
				sum++;					
				strvalue = strvalue+ "<span id='s"+sum+"-2' onmousedown=onsel('"+productType.ptid+"','2','"+sum+"')>"+productType.pttypeName+"</span>";
			}
		}
		if(strvalue != ""){
			document.getElementById("productSecond").style.display = "block";
			document.getElementById("productSecond").innerHTML = strvalue;
		}		
	}
	
	if(n == "2"){	
		sum2 = 0;
		var  strvalue = "";		
		productTypeName = productTypeName.substring(0,productTypeName.indexOf("-")+1); 
		for(var i=1;i<= sum;i++){
			if(i==orderID){
				document.getElementById("s"+i+"-2").className = "selected";
				selArray = onProduct(val,secondType);
				document.getElementById("productTypeName").value = productTypeName + selArray[0]+ "-";
			}else{
				document.getElementById("s"+i+"-2").className = "";
			}
		}	
		for(var i=0;i< thridType.length;i++){
			var productType = thridType[i];				
			if(productType.ptparentid == val){
				sum2++;					
				strvalue = strvalue+ "<span id='s"+sum2+"-3' onmousedown=onsel('"+productType.ptid+"','3','"+sum2+"')>"+productType.pttypeName+"</span>";
			}
		}
		if(strvalue != ""){
			document.getElementById("productThird").style.display = "block";
			document.getElementById("productThird").innerHTML = strvalue;
		}	
	}
	
	if(n == "3"){
		var strSplit = productTypeName.split("-");
		productTypeName = strSplit[0]+"-"+strSplit[1]+"-"; 
		for(var i=1;i<=sum2;i++){
			if(i==orderID){
				document.getElementById("s"+i+"-3").className = "selected";
				selArray = onProduct(val,thridType);
				document.getElementById("productTypeName").value = productTypeName + selArray[0];
				document.getElementById("productTypeName1").innerHTML=productTypeName + selArray[0];
				document.getElementById("productType").value = selArray[1];
			}else{
				document.getElementById("s"+i+"-3").className = "";
			}
		}		
	}

	function onProduct(val,strArray){
		var selArray = new Array();
		for(var i=0;i< strArray.length; i++){
			var productType = strArray[i];
			if(productType.ptid == val){
				selArray[0] = productType.pttypeName;
				selArray[1] = productType.ptcode;
			}
		}
		return selArray;
	}	
}

	function createNum(){
		var now= new Date();
		var e=document.getElementById("productNumber");
		e.value=document.getElementById("sid").innerHTML+now.getTime();
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
			发布商品
			</td>
		</tr>
	</table>
	
	<br>
		<div style="width:300px;height:30px;margin-left:13px; background: url(../../image/hzx/dyb.gif) no-repeat "></div>
		<table width="778" height="270" align="center" cellpadding="0" cellspacing="0">
			<tr>  
				<td width="28" align="center" style="background: url(../../image/hzx/left_bg.gif) no-repeat"></td>
				<td valign="top" height="270" background="#E5fOFF" width="710" style="background: url(../../image/hzx/mid_bg.gif) repeat-x;">   
				<div class="divscr">
					<%
						for(ProductType item:(List<ProductType>)request.getAttribute("firstType")) {
					%>
					<span onmousedown="onsel('<%=item.getPtid() %>','1')" id="s<%=item.getPtid() %>-1"><%=item.getPttypeName() %></span>
					<% } %>   
				</div>
				<div class="divscr" style="margin-left:5px;display:none;" id="productSecond"> </div>
				<div class="divscr" style="margin-left:5px;display:none;" id="productThird">  </div>
				
				</td>
				<td width="34" align="center" style="background: url(../../image/hzx/right_bg.gif) no-repeat"></td>   
			</tr>	    
			<tr>
				<td colspan="3"> 
					<input type="hidden" name="productTypeName" id="productTypeName" size="40">
					<input type="hidden" name="productTypeCode" id="productTypeCode" size="40">
					<span id="errorsDiv_product.productType"></span>
				</td>
			</tr>
		</table>
		
		<div style="position: relative;left: 200px; width:100px;height:30px; background: url(../../image/hzx/sxsp.gif) no-repeat"><div id="productTypeName1" style="position:relative;padding-left:110px; line-height:30px;vertical-align:middle; width:300px; color:#FB8502; font-weight:700;"></div></div>
		<div style="display: none;" id="sid"><%=SupplierService.getSupplierId()%></div>
		<div style="position: relative;left: 380px; width:40px;height:60px; background: url(../../image/hzx/jiantou.gif) no-repeat"></div>
		<div style="width:300px;height:30px;margin-left:13px; background: url(../../image/hzx/deb.gif) no-repeat "></div>
		<s:form action="/do/product/createProduct" method="post" enctype="multipart/form-data" id="form1" theme="simple">
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
            		<td height="30" class="wz_left">&nbsp;&nbsp;商品编号：</td>
                	<td><input size="30" type="text" name="product.productNumber" id="productNumber"/><input style="margin-left: 5px;" type="button" onclick="createNum()" value="自动生成"/><span id="errorsDiv_product.productNumber"></span></td>
            	</tr>
				<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>商品名称：</td>
                	<td><input size="30" type="text" name="product.productName"></input><span id="errorsDiv_product.productName"></span></td>
            	</tr>
            	<tr style="display: none;">
            		<td height="30" class="wz_left">商品类别：</td>
                	<td><input type="text" name="product.productType" id="productType"/></td>
            	</tr>
            	<tr>
            		<td><input type="hidden" name="product.facade"></input></td>
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
            						<td width="100px">自定义属性名称</td>
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
            				<tr id="tr0">
            					<td width="50px"><input type="text" name="listPCP[0].propertyName" size="10" maxlength="10"></input></td>
            					<td width="50px"><input type="text" name="listPCP[0].propertyDetail" maxlength="20"></input></td>
            					<td width="50px"><input type="button" value="删除" onclick="deleteLine('tr0')"></input></td>
            				</tr>
						</table>
            		</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >商品图片1：</td>
                	<td><input type="file" name="originalPic"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >商品图片2：</td>
                	<td><input type="file" name="originalPic1"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >商品图片3：</td>
                	<td><input type="file" name="originalPic2"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >商品图片4：</td>
                	<td><input type="file" name="originalPic3"/></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left">商品描述：</td>
                	<td>
                		<textarea name="product.productDetail" rows="15" cols="40"></textarea>
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
                	<textarea name="product.wholesaleDetail" rows="7" cols="60"></textarea>
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
                	<textarea name="product.transportDetail" rows="7" cols="60"></textarea>
                	<span id="errorsDiv_product.transportDetail"></span>
                	</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" width="140"><span style="color:red;">*</span>是否支持网上订购：</td>
                	<td>
                		<label><input type="radio" name="product.webOrder" value="Y" checked="checked" class="frmrd" id="order1"/>支持</label>
						<label><input type="radio" name="product.webOrder" value="N" class="frmrd" id="order2"/>不支持</label>
						<span id="errorsDiv_product.webOrder"></span>
					</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>计量单位：</td>
                	<td><input id="product.productUnit" autoCompleteOptions="千克;克;个;提;袋;箱;包;卷;块;米;桶;盒;盘;双;瓶;打;罐;筐;匹;听;篮;捆;辆" type="text" name="product.productUnit" size="8"></input><span id="errorsDiv_product.productUnit"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>起订量：</td>
                	<td><input type="text" name="product.startOrderCount" size="5" id="startOrderCount"></input><span id="startOrderCountUnit">单位</span><span id="errorsDiv_product.startOrderCount"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" ><span style="color:red;">*</span>库存量：</td>
                	<td><input type="text" name="product.wareCount" size="5"></input><span id="wareCountUnit">单位</span><span id="errorsDiv_product.wareCount"></span></td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left" >市场价格：</td>
                	<td><input type="text" name="product.marketPrice" size="5"></input>元/<span id="unit10">单位</span></td>    
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
									<input type="text" name="product_price1Range" size="6" disabled="disabled" id="range1"></input>
									<span id="unit1">单位</span>～
									<input type="text" name="product.price1Range" size="6" id="range2"></input>
									<span id="unit2">单位</span>:&nbsp;
									<input type="text" name="product.price1" size="6" id="price1"></input>
									元/<span id="unit3">单位</span>
									<span id="errorsDiv_range2"></span><span id="errorsDiv_product.price1"></span>
								</td>
							</tr>
							<tr>
								<td><span>&nbsp;&nbsp;</span>
									<input type="text" name="product_price2Range" size="6" disabled="disabled" id="range3"></input>
									<span id="unit4">单位</span>～
									<input type="text" name="product.price2Range" size="6" disabled="disabled" id="range4"></input>
									<span id="unit5">单位</span>:&nbsp;
									<input type="text" name="product.price2" size="6" disabled="disabled" id="price2"></input>
									元/<span id="unit6">单位</span>
									<span id="errorsDiv_range4"></span><span id="errorsDiv_product.price2"></span>
								</td>
							</tr>
							<tr>
								<td><span>&nbsp;&nbsp;</span>
									<input type="text" name="product_price3Range" size="6" disabled="disabled"  id="range5"></input>
									<span id="unit7">单位</span>～
									<input type="text" name="product.price3Range" size="6" disabled="disabled"  id="range6"></input>
									<span id="unit8">单位</span>:&nbsp;
									<input type="text" name="product.price3" size="6"  disabled="disabled" id="price3"></input>
									元/<span id="unit9">单位</span>
									<span id="errorsDiv_range6"></span><span id="errorsDiv_product.price3"></span>
								</td>
							</tr>				
						</table>
					</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>运费：</td>
                	<td>
                	<label><input type="radio" name="product.postType" value="2" class="frmrd" checked="checked" onclick="showPost();"></input>买家承担</label>
					<label><input type="radio" name="product.postType" value="0" class="frmrd" onclick="hidePost();"></input>卖家承担</label>
					<label><input type="radio" name="product.postType" value="1" class="frmrd" onclick="hidePost();"></input>联系卖家商定</label>
					<span id="errorsDiv_product.postType"></span></td>
            	</tr>
            	<tr id="post1" style="display:table-row;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>平邮 ：<input id="p1" type="text" name="delivery.post" size="5"></input>元
            		<span id="errorsDiv_delivery.post"></span>
            		</td>
            	</tr>
            	<tr id="post2" style="display:table-row;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>快递 ：<input id="p2" type="text" name="delivery.express" size="5"></input>元
            		<span id="errorsDiv_delivery.express"></span>
            		</td>
            	</tr>
            	<tr id="post3" style="display:table-row;">
            		<td>&nbsp;</td>
            		<td><span style="color:red;">*</span>EMS：<input id="p3" type="text" name="delivery.ems" size="5"></input>元
            		<span id="errorsDiv_delivery.ems"></span>
            		</td>
            	</tr>
            	<tr>
            		<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
               		<td>
                	<label><input type="radio" name="product.productStatus" value="on" checked="checked" class="frmrd"/>是（上架）</label>
					<label><input type="radio" name="product.productStatus" value="off" class="frmrd"/>否（下架）</label>
                	<span id="errorsDiv_product.productStatus"></span></td>
            	</tr>  
            	<tr>
                 	<td height="40">&nbsp;</td>
	              	<td><input type="submit" value="提交" class="button5" />&nbsp;</td>
	        	</tr>  
			</table>
		</s:form>
	<br>
</body>
</html>