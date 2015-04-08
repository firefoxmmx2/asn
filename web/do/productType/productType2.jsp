<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType" %> 
<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品分类</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<style type="text/css">
	.divscr{
		WIDTH:230px; 
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
			for(var i=1;i<=firstType.length;i++){
				if(i==val){
					document.getElementById("s"+i+"-1").className = "selected";
					selArray = onProduct(val,firstType);
					document.getElementById("productTypeName").value = productTypeName + selArray[0]+ "-";
				}else{
					document.getElementById("s"+i+"-1").className = "";
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
					document.getElementById("productTypeCode").value = selArray[1];
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
</script>
</head>
<body>

<table width="778" height="270" align="center" cellpadding="0" cellspacing="0" style="background: url(../../image/mid_bg.gif) repeat-x;">
	<tr>  
		<td width="34" align="center" style="background: url(../../image/left_bg.gif) no-repeat"></td>
		<td valign="top" background="#E5fOFF" width="710">   
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
		<td width="34" align="center" style="background: url(../../image/right_bg.gif) no-repeat"></td>   
	</tr>	    
	<tr>
		<td colspan="3"> 
			<input type="hidden" name="productTypeName" id="productTypeName" size="40">
			<input type="hidden" name="productTypeCode" id="productTypeCode" size="40">
		</td>
	</tr>
</table>

</body>
</html>