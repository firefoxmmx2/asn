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
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
<script type="text/javascript" src="<%=cp%>/js/yav/yav.js"></script>
<script type="text/javascript" src="<%=cp%>/js/yav/yav-config.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-timer.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/facade-editor.js"></script>
<script type="text/javascript" src="<%=cp%>/js/tiny_mce/jquery.tinymce.js"></script>
<style type="text/css"> 
<!--
body{font-size:12px;font-family:"新宋体";}

.section_title {
	font-size: 18px;
}
-->
</style> 
<script type="text/javascript">
var all=0;
var count=0;
var rowNum=0;

$(document).ready(function(){
	all=document.getElementById("customSize").value;
	count=all;
	rowNum=all;
});
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
	td0.innerHTML='<input type="text" name="listPC['+count+'].propertyName" size="10" maxlength="10"></input>';
	td1.innerHTML='<input type="text" name="listPC['+count+'].propertyDetail" maxlength="20"></input>';
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
	window.open("/asn/do/productType/productType?show=3","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}



// 设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
			"productSupply.supplyTitle:供应信息标题|required",
			"productSupply.supplyTitle:供应信息标题|maxlength|30",
			"productSupply.productName:产品名称|required",
			"productSupply.productName:产品名称|maxlength|30",
			"productSupply.productType:产品类别|required",
			"productSupply.webOrder:是否支持网上订购|required",
			"productSupply.price:产品单价|required",
			"productSupply.price:产品单价|double",		
			"productSupply.priceUnit:计价单位|required",
			"productSupply.priceUnit:计价单位|maxlength|10",
			"productSupply.startOrder:最小起订|required",
			"productSupply.startOrder:最小起订|maxlength|20",
			"productSupply.startOrderUnit:单位|required",
			"productSupply.startOrderUnit:单位|maxlength|10",
			"productSupply.maxSupply:供货总量|required",
			"productSupply.maxSupply:供货总量|maxlength|20",
			"productSupply.maxSupplyUnit:单位|required",
			"productSupply.maxSupplyUnit:单位|maxlength|10",
			"productSupply.tradeType:交易方式|required",
			"productSupply.infoValidity:信息有效期|required",
			"productSupply.productStatus:是否立即发布上网|required",
			"productSupply.productDetail:产品描述|maxlength|500",
			"productSupply.wholeSaleDetail:批发说明|maxlength|500",
			"productSupply.transportDetail:运费说明|maxlength|500"
		
	);
	// 遮罩规则的详细定义
	//yav.addMask('productSupply.price_mask', '      ', '1234567890');
	// 输入提示
	//yav.addHelp("productSupply.price", "产品单价为0~9的数字");
	// 输入时验证
	yav.init('form1', rules);
	// 提交前验证
	$("#form1").submit(function () {
		  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
	});

	facadeEditor.init("productSupply.productType", "facade", "productSupply.facade",document.getElementById("facadeValue").value);

	// 初始化产品描述编辑器
	var editor=butil.element('productSupply.productDetail');
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
		content_css : "css/content.css",

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

	function valueRadio(){
		var infoValidity=document.getElementById("infoValidity").innerHTML;
		var infoV=document.getElementById("infoV"+infoValidity);
		infoV.checked=true;
	}

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

	function beforeLoad(){
		valueCheckBox();
		valueRadio();
	}
</script>
</head>
<body onload="beforeLoad()">
	<table width="98%" border="0" align="center" cellpadding="10" cellspacing="0">
	<tr><td height="2px" ></td></tr>
	<tr><td class="daohang" width="98%">修改供应信息</td></tr>
	</table>
	<br>
	<s:form action="/do/product/updateProductSupply" method="post" enctype="multipart/form-data" id="form1">
		<div style="display: none;"><input type="text" name="productSupply.productId" value="<s:property value='productSupply.productId'/>"></input></div>
		<div style="display: none;"><input type="text" name="productSupply.smallPicPath" value="<s:property value='productSupply.smallPicPath'/>"></input></div>
		<div style="display: none;"><input type="text" name="productSupply.bigPicPath" value="<s:property value='productSupply.bigPicPath'/>"></input></div>
		<table width="90%" align="center" cellpadding="10" cellspacing="0">
			<tr>
            	<td height="30" class="wz_left" width="140px"><span style="color:red;">*</span>供应信息标题：</td>
                <td width="300"><input type="text" name="productSupply.supplyTitle" size="50" value="<s:property value='productSupply.supplyTitle'/>"></input><span id="errorsDiv_productSupply.supplyTitle"></span></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left" ><span style="color:red;">*</span>产品名称：</td>
                <td><input type="text" name="productSupply.productName" value="<s:property value='productSupply.productName'/>"></input><span id="errorsDiv_productSupply.productName"></span></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left" >产品图片：</td>
                <td><input type="file" name="originalPic"/></td>
            </tr>
            <tr>
            	<td></td>
            	<td><img alt="" src='${pageContext.request.contextPath}/<s:property value="productSupply.smallPicPath"/>'></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>产品类别：</td>
                <td><input type="text" name="productType" disabled="disabled" size="38" value="<s:property value='#request.pType'/>"/><input type="button" value="选择" onclick="onOpen()" /><input type="text" name="productSupply.productType" style="display: none;" value="<s:property value='productSupply.productType'/>"/><span id="errorsDiv_productSupply.productType"></span></td>
            </tr>
                     
            <tr>
            	<td>
            	<input type="hidden" name="productSupply.facade"></input><input type="hidden" id="facadeValue" value="<s:property value='productSupply.facade'/>"></input>
            	</td>
            	 <td>
            	 	<div id="facade"></div>
            	 </td>
            </tr>
            
			<s:if test='productSupply.webOrder=="Y"'>
			<tr>
            	<td height="30" class="wz_left" ><span style="color:red;">*</span>是否支持网上订购：</td>
                <td>
                	<label><input type="radio" name="productSupply.webOrder" value="Y" checked="checked" class="frmrd"/>支持</label>
					<label><input type="radio" name="productSupply.webOrder" value="N" class="frmrd"/>不支持</label>
					<span id="errorsDiv_productSupply.webOrder"></span>
				</td>
            </tr>
			</s:if>     
			<s:else>
			<tr>
            	<td height="30" class="wz_left" ><span style="color:red;">*</span>是否支持网上订购：</td>
                <td>
                	<label><input type="radio" name="productSupply.webOrder" value="Y" class="frmrd"/>支持</label>
					<label><input type="radio" name="productSupply.webOrder" value="N" checked="checked" class="frmrd"/>不支持</label>
					<span id="errorsDiv_productSupply.webOrder"></span>
				</td>
            </tr>
			</s:else>   
			

            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>产品单价：</td>
                <td>
                <input type="text" name="productSupply.price" size="8" value="<s:property value='productSupply.price'/>"></input>元<span id="errorsDiv_productSupply.price"></span>
                <span style="color:red;">*</span>计价单位:<input type="text" name="productSupply.priceUnit" size="2" value="<s:property value='productSupply.priceUnit'/>"></input>
                <span id="errorsDiv_productSupply.priceUnit"></span>
                </td>
            </tr>
            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>最小起订：</td>
                <td>
                <input type="text" name="productSupply.startOrder" size="8" value="<s:property value='productSupply.startOrder'/>"></input><span id="errorsDiv_productSupply.startOrder"></span>
                <span style="color:red;">*</span>单位:<input type="text" name="productSupply.startOrderUnit" size="2" value="<s:property value='productSupply.startOrderUnit'/>"></input>
                <span class="span2" id="errorsDiv_productSupply.startOrderUnit"></span>
                </td>
            </tr>
            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>供货总量：</td>
                <td>
                <input type="text" name="productSupply.maxSupply" size="8" value="<s:property value='productSupply.maxSupply'/>"></input><span id="errorsDiv_productSupply.maxSupply"></span>
                <span style="color:red;">*</span>单位:<input type="text" name="productSupply.maxSupplyUnit" size="2" value="<s:property value='productSupply.maxSupplyUnit'/>"></input>
                <span class="span2" id="errorsDiv_productSupply.maxSupplyUnit"></span>
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
            			<s:if test="listPC!=null&&listPC.size()>0">
						<input id="customSize" type="text" value='<s:property value="listPC.size()"/>' style="display: none;"></input>
						<s:iterator id="item" value="listPC" status="list">
						<tr id="tr<s:property value="#list.count-1"/>">
							<td><input type="text" name="listPC[<s:property value="#list.count-1"/>].propertyName" value='<s:property value="#item.propertyName"/>' size="10"></input></td>
							<td><input type="text" name="listPC[<s:property value="#list.count-1"/>].propertyDetail" value='<s:property value="#item.propertyDetail"/>'></input></td>
							<td><input type="button" value="删除" onclick="deleteLine('tr<s:property value="#list.count-1"/>')"></input></td>
						</tr>
						</s:iterator>
						</s:if>
				<s:else>
					<input id="customSize" type="text" value='<s:property value="1"/>' style="display: none;"></input>
					    <tr id="tr0">
            				<td width="50px"><input type="text" name="listPC[0].propertyName" size="10" maxlength="10"></input></td>
            				<td width="50px"><input type="text" name="listPC[0].propertyDetail" maxlength="20"></input></td>
            				<td width="50px"><input type="button" value="删除" onclick="deleteLine('tr0')"></input></td>
            			</tr>
				</s:else>
					</table>
            	</td>
            </tr>
            
            
            <tr>
            	<td height="30" class="wz_left">产品描述：</td>
                <td>
                	<textarea name="productSupply.productDetail" rows="15" cols="40"><s:property value='productSupply.productDetail'/></textarea>
                	<span id="errorsDiv_productSupply.productDetail"></span>
                </td>
            </tr>
            <tr>
            	<td height="30" class="wz_left">批发说明：</td>
                <td>
                <textarea name="productSupply.wholeSaleDetail" rows="7" cols="40"><s:property value='productSupply.wholeSaleDetail'/></textarea>
                <span id="errorsDiv_productSupply.wholeSaleDetail"></span>
                </td>
            </tr>
            <tr>
            	<td height="30" class="wz_left" >运费说明：</td>
                <td>
                <textarea name="productSupply.transportDetail" rows="7" cols="40"><s:property value='productSupply.transportDetail'/></textarea>
                <span id="errorsDiv_productSupply.transportDetail"></span>
                </td>
            </tr>
            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>交易方式：</td>
                <td>
                <span id="tradeType" style="display: none"><s:property value="productSupply.tradeType"></s:property></span>
                <label><input type="checkbox" name="productSupply.tradeType" value="0" class="frmrd" id="c0"></input>支付宝</label>
				<label><input type="checkbox" name="productSupply.tradeType" value="1" class="frmrd" id="c1"></input>银行汇款</label>
				<span id="errorsDiv_productSupply.tradeType"></span></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>信息有效期：</td>
                <td>
                <span id="infoValidity" style="display: none"><s:property value="productSupply.infoValidity"></s:property></span>
                <label><input type="radio" id="infoV10" name="productSupply.infoValidity" value="10" class="frmrd"></input>10天</label>
				<label><input type="radio" id="infoV20" name="productSupply.infoValidity" value="20" class="frmrd"></input>20天</label>
				<label><input type="radio" id="infoV30" name="productSupply.infoValidity" value="30" class="frmrd"></input>1个月</label>
				<label><input type="radio" id="infoV90" name="productSupply.infoValidity" value="90" class="frmrd"></input>3个月</label>
				<label><input type="radio" id="infoV180" name="productSupply.infoValidity" value="180" class="frmrd"></input>6个月</label>
				<label><input type="radio" id="infoV360" name="productSupply.infoValidity" value="360" class="frmrd"></input>12个月</label>
				<label><input type="radio" id="infoV3600" name="productSupply.infoValidity" value="3600" class="frmrd"></input>长期</label>
                <span id="errorsDiv_productSupply.infoValidity"></span>
                </td>
            </tr>
			<s:if test='productSupply.productStatus=="on"'>
			<tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
                <td>
                <label><input type="radio" name="productSupply.productStatus" value="on" checked="checked" class="frmrd"/>是（上架）</label>
				<label><input type="radio" name="productSupply.productStatus" value="off" class="frmrd"/>否（下架）</label>
                <span id="errorsDiv_productSupply.productStatus"></span></td>
            </tr>    
			</s:if> 
            <s:else>
            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>是否直接发布上网：</td>
                <td>
                <label><input type="radio" name="productSupply.productStatus" value="on"  class="frmrd"/>是（上架）</label>
				<label><input type="radio" name="productSupply.productStatus" value="off" checked="checked" class="frmrd"/>否（下架）</label>
                <span id="errorsDiv_productSupply.productStatus"></span></td>
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