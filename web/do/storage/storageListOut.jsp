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
<title>修改库存</title>
<link rel="stylesheet" href="../../css/hzx/ui.datepicker.css" type="text/css" media="screen"  charset="utf-8" />
	<style type="text/css">
		.sl{
			width:120px;
			white-space:nowrap;
			text-overflow:ellipsis; 
			overflow: hidden;
		}
		.color_g{ color:#0f6ce5; text-align:center; font-size:12px;}
		.color_g2{ color:#0048a3;  text-align:center; font-size:12px;}
		.wz-18b{ color:#112482; font-size:18px; text-align:center; padding-left:15px;}
			

		table.list tr.head{
		  background-color:#e8f5fb;
		}
		table.list td.head{
		  background-color:#000000;
		}
		table.list tr.row td{
		  background-color:#ffffff;
		}
		table.list tr.altRow td{background-color: #f3f8fb;}
		libiaobg{background:#e8f5fb; border-top:1px solid #cee2ec; height:20px; border-right:1px solid #e7e7e7; color:#112482; text-align:center;}
	</style>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/hzx/ui.datepicker.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=cp%>/js/hzx/ui.datepicker-zh-CN.js" charset="utf-8"></script>
<script type="text/javascript">
	jQuery(function($){
		$('#datepicker').datepicker({
			yearRange: '1900:2099', //取值范围.
			showOn: 'both', //输入框和图片按钮都可以使用日历控件。
			buttonImage: '../../image/hzx/calendar.gif', //日历控件的按钮
			buttonImageOnly: true,
			showButtonPanel: true
		});	 
		 
	});
	$(document).ready(function(){
		$(".amount").bind("keyup",function(event){
			if((event.keyCode>=96&&event.keyCode<=105)||(event.keyCode>=48&&event.keyCode<=57)||event.keyCode==8){
				if(this.value[0]==0){
					alert("请输入正整数"); 
					this.value="";//this是dom对象 ,$(this)是jquery对象
				}else{
			//		alert($(this).prev().val());  
			//		alert($(this).parent().next().children("input").val());    
					var a=parseInt($(this).val());
					if(isNaN(a)){   
						a=0;    
					}
					var b=parseInt($(this).prev().val()); 
					if((b-a)<0){
						alert("库存不能为负");
						this.value="";
					}else{
						$(this).parent().next().children("input").val(b-a);  
					}		 
				} 
				
			}else{
				alert("请输入正整数"); 
				this.value="";
			}
		});
	});

	function check(){
		var a=$(".amount");	
		for(var i=0;i<a.length;i++){
			if(a[i].value==""){
				alert("请填写数目");  
				return ;
			} 
		}	
		$("form").get(0).submit();
	}

</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td> 
			<td width="737">
			减小库存
			</td>
		</tr>
	</table>
	<br />
	<s:form action="insertStorageInOut">
	<div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
			<input type="hidden" name="storageInOut.billType" value="S"></input>
			<tr>
				<td width="60">单据号：</td>
				<td width="250"><input name="storageInOut.billNum" type="text" size="30"/></td>
				<td width="60">单据时间：</td>
				<td><input name="storageInOut.billTime" type="text" id="datepicker"/></td>
			</tr>
		</table>
	</div>
	<br />
	<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="20%">商品图片</td>
					<td class="libiaobg" nowrap width="20%">商品名称</td>
					<td class="libiaobg" nowrap width="20%">现库存量</td>
					<td class="libiaobg" nowrap width="20%">减小库存</td>
					<td class="libiaobg" nowrap width="20%">预期库存</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listStorage" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td class="zuo"><div id="spic"><a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'></a></div> </td>
						<td class="zuo"><s:property value="#item.productName"></s:property></td>
						<td class="zuo"><s:property value="#item.stockAmount"></s:property><s:property value="#item.unit"></s:property></td>
						<td class="zuo"><span style="color:red;">*</span>
						<input value="<s:property value="#item.stockAmount"></s:property>" type="hidden" />
						<input class="amount" type="text" size="5" name="storageMap['<s:property value="#item.productId"></s:property>']"></input>
						<s:property value="#item.unit"></s:property>
						</td>
						<td class="zuo">
						<input type="text" size="5" disabled="disabled" value="<s:property value="#item.stockAmount"></s:property>"></input>
						<input type="hidden" name="storageMap1['<s:property value="#item.productId"></s:property>']" value="<s:property value="#item.stockAmount"></s:property>"></input>
						<s:property value="#item.unit"></s:property>
						</td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator> 
			</table>
	</div>
	<div align="center" style="padding-right: 110px;">   
		<input id="sub" type="button" value="提交" onclick="check();"></input>
		<input type="button" value="返回" onclick="JavaScript:window.location.href='toStorageList'"></input>
	</div>
	</s:form>
		
	
	
</body>
</html>