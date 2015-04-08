<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create product purchase</title>
<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/yav/yav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/yav/yav-config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<style type="text/css"> 

</style> 
<script type="text/javascript">

//设置表单验证
$(document).ready(function(){
	// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
	var rules=new Array(
			"productPurchase.purchaseTitle:求购信息标题|required",
			"productPurchase.purchaseTitle:求购信息标题|maxlength|30",
			"productPurchase.productName:求购产品名称|required",
			"productPurchase.productName:求购产品名称|maxlength|30",
			"productPurchase.productType:求购产品类别|required",
			"productPurchase.infoValidity:求购信息有效期|required",
			"productPurchase.purchaseDetail:详细说明|maxlength|500",
			"productPurchase.purchaseStatus:是否立即发布上网|required"
		
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
});


function onOpen(){
	window.open("/asn/do/productType/productType?fldOfName=productType&fldOfCode=productPurchase.productType","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
}

function valueRadio(){
	var infoValidity=document.getElementById("infoValidity").innerHTML;
	var infoV=document.getElementById("infoV"+infoValidity);
	infoV.checked=true;
}

function beforeLoad(){
	valueRadio();
}


</script>
</head>
<body onload="beforeLoad()">
	<table width="98%" border="0" align="center" cellpadding="10" cellspacing="0">
	<tr><td height="2px" ></td></tr>
	<tr><td class="daohang" width="98%">修改求购信息</td></tr>
	</table>
	<br>
	<s:form action="/do/purchase/updateProductPurchase" method="post" enctype="multipart/form-data" id="form1">
		<div style="display: none;"><input type="text" name="productPurchase.purchaseId" value="<s:property value='productPurchase.purchaseId'/>"></input></div>
		<div style="display: none;"><input type="text" name="productPurchase.smallPicPath" value="<s:property value='productPurchase.smallPicPath'/>"></input></div>
		<div style="display: none;"><input type="text" name="productPurchase.bigPicPath" value="<s:property value='productPurchase.bigPicPath'/>"></input></div>
		<table width="90%" align="center" cellpadding="10" cellspacing="0">
			<tr>
            	<td height="30" class="wz_left" width="140px"><span style="color:red;">*</span>求购信息标题:</td>
                <td width="300"><input type="text" name="productPurchase.purchaseTitle" size="50" value="<s:property value='productPurchase.purchaseTitle'/>"></input><span id="errorsDiv_productPurchase.purchaseTitle"></span></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left" width="140px"><span style="color:red;">*</span>求购产品名称:</td>
                <td width="300"><input type="text" name="productPurchase.productName" value="<s:property value='productPurchase.productName'/>"></input><span id="errorsDiv_productPurchase.productName"></span></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left" >产品图片：</td>
                <td><input type="file" name="originalPic"/></td>
            </tr>
            <tr>
            	<td></td>
            	<td><img alt="" src='${pageContext.request.contextPath}/<s:property value="productPurchase.smallPicPath"/>'></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left"><span style="color:red;">*</span>产品类别：</td>
                <td><input type="text" name="productType" disabled="disabled" size="38" value="<s:property value='#request.pType'/>"/><input type="button" value="选择" onclick="onOpen()" /><input type="text" name="productPurchase.productType" style="display: none;" value="<s:property value='productPurchase.productType'/>"/><span id="errorsDiv_productPurchase.productType"></span></td>
            </tr>
            <tr>
            	<td height="30" class="wz_left" width="140px">产品属性：</td>
                <td width="300" style="color: gray">建议从以下方面描述您的需求</td>
            </tr>
            <tr>
            	<td>&nbsp;</td>
				<td>
					<table style="background-color:#F4F4F4">
						<tr>
							<td>产品数量:<input type="text" name="productPurchase.productAmount" value="<s:property value='productPurchase.productAmount'/>" maxlength="25"></input></td>
						</tr>
						<tr>
							<td>包装说明:<input type="text" name="productPurchase.packageInfo" value="<s:property value='productPurchase.packageInfo'/>" maxlength="25"></input></td>
						</tr>
						<tr>
							<td>价格说明:<input type="text" name="productPurchase.priceInfo" value="<s:property value='productPurchase.priceInfo'/>" maxlength="25"></input></td>
						</tr>
						<tr>
							<td>产品规格:<input type="text" name="productPurchase.productSpecification" value="<s:property value='productPurchase.productSpecification'/>" maxlength="25"></input></td>
						</tr>
					</table>
				</td>
            </tr>
            <tr>
            	<td height="30" class="wz_left">详细说明：</td>
                <td>
                	<textarea name="productPurchase.purchaseDetail" rows="7" cols="40"><s:property value='productPurchase.purchaseDetail'/></textarea>
                	<span id="errorsDiv_productPurchase.purchaseDetail"></span>
                </td>
            </tr>
             <tr>
            	<td height="30" class="wz_left" width="140px"><span style="color:red;">*</span>信息有效期:</td>
                <td width="300">
                <span id="infoValidity" style="display: none"><s:property value="productPurchase.infoValidity"></s:property></span>
                <label><input id="infoV10" class="frmrd" type="radio" name="productPurchase.infoValidity" value="10"></input>10天</label>
                <label><input id="infoV20" class="frmrd" type="radio" name="productPurchase.infoValidity" value="20"></input>20天</label>
                <label><input id="infoV30" class="frmrd" type="radio" name="productPurchase.infoValidity" value="30"></input>1个月</label>
                <label><input id="infoV90" class="frmrd" type="radio" name="productPurchase.infoValidity" value="90"></input>3个月</label>
                <label><input id="infoV180" class="frmrd" type="radio" name="productPurchase.infoValidity" value="180"></input>6个月</label>
                <label><input id="infoV360" class="frmrd" type="radio" name="productPurchase.infoValidity" value="360"></input>12个月</label>
                <label><input id="infoV3600" class="frmrd" type="radio" name="productPurchase.infoValidity" value="3600"></input>长期</label>
                <span id="errorsDiv_productPurchase.infoValidity"></span>
                </td>
            </tr>
			<s:if test='productPurchase.purchaseStatus=="on"'>
				<tr>
            		<td height="30" class="wz_left" width="140px"><span style="color:red;">*</span>是否直接发布上网:</td>
                	<td width="300"><label><input class="frmrd" type="radio" name="productPurchase.purchaseStatus" value="on" checked="checked"></input>是</label><label><input type="radio" class="frmrd" name="productPurchase.purchaseStatus" value="off"></input>否</label><span id="errorsDiv_productPurchase.purchaseStatus"></span></td>
            	</tr>
			</s:if>
			<s:else>
				<tr>
            		<td height="30" class="wz_left" width="140px"><span style="color:red;">*</span>是否直接发布上网:</td>
                	<td width="300"><label><input class="frmrd" type="radio" name="productPurchase.purchaseStatus" value="on"></input>是</label><label><input type="radio" class="frmrd" name="productPurchase.purchaseStatus" value="off" checked="checked"></input>否</label><span id="errorsDiv_productPurchase.purchaseStatus"></span></td>
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