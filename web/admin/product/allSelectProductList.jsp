<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path=request.getContextPath();
%>
<html>
	<head>
	<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/js/yav/yav-style.css" type=text/css rel=stylesheet>    
	<script type="text/javascript" src="<%=path%>/js/yav/yav.js"></script>
	<script type="text/javascript" src="<%=path%>/js/yav/yav-config.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
	<link rel="stylesheet" rev="stylesheet" href="<%=path%>/css/comdo.css" type="text/css" />
		<style type="text/css">
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
		
		<script type="text/javascript">
		function checkAll(){
			var total=document.getElementById("total").value;
			var box=document.getElementById("allSelect");
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(box.checked){
		            if (!idCheckBox.checked) {              
		                idCheckBox.checked = true;
		            }
		        } else {
		            if (idCheckBox.checked) {               
		                idCheckBox.checked = false;
		            }
		        }
			}
		}
		function tj(id,type){
			$.post("addSpecialProduct",{"productIds":id+",","type":type},function()
			{
				parent.closeProduct(type);
			});
		}

		$(document).ready(function(){
			
			// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
			var rules=new Array(
				"sid:|mask|count_mask",
				"pid:|mask|count_mask"
			);
			// 遮罩规则的详细定义
			yav.addMask('count_mask', '      ', '1234567890');
			yav.init('form1', rules);
		});

		function doRedirect(url){
			window.location.href=url;
		}

		function submitSelectBox(type){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择商品");
				return;
			}
			var r=confirm("确认是这些商品吗？");
			if(r==true){
				$.post("addSpecialProduct",{"productIds":ids,"type":type},function()
				{
					parent.closeProduct(type);
				});
			}
		}
		
		</script>
	</head>
	<body>
		<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
			<tr>
				<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
				<td width="737">
				商品选择
				</td>
			</tr>
		</table>
		<s:form action="toAllSelectProductList" id="form1">
		<input id="curCensor" type="hidden" value="<s:property value="#request.censor"></s:property>" name="censor"/>
		<input type="hidden" value="<s:property value="#request.type"></s:property>" name="type"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="75px" align="right">供应商ID号：</td>
			<td width="30"><input id="sid" type="text" name="supplierId" size="20" value="<s:property value="#request.supplierId"></s:property>"></td>
			<td nowrap width="80px" align="right">供应商名称：</td>
			<td width="30"><input type="text" name="supplierName" size="20" value="<s:property value="#request.supplierName"></s:property>"></td>
			<td align="left">&nbsp;</td>
		</tr>
		<tr>
			<td nowrap width="75px" align="right">商品ID号：</td>
			<td width="30"><input id="pid" type="text" name="searchId" size="20" value="<s:property value="#request.searchId"></s:property>"></td>
			<td nowrap width="80px" align="right">商品名称：</td>
			<td width="30"><input type="text" name="searchName" size="20" value="<s:property value="#request.searchName"></s:property>"></td>
			<td align="left"><input type="submit" value=" 查 询 "></td>
		</tr>
		</table>
		</s:form>	

		<div><input id="total" type="text" value='<s:property value="listP.size()"/>' style="display: none;"></input></div>
		<table width="98%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="25">&nbsp;</td> 
					<td class="libiaobg" nowrap width="100">商品图片</td>
					<td class="libiaobg" nowrap width="60">商品 ID</td>
					<td class="libiaobg" nowrap width="150">商品名称</td>
					<td class="libiaobg" nowrap width="370">详细说明</td>
					<td class="libiaobg" nowrap width="24">操作</td>
				</tr>
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listP" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.productId"/>"></input></td>
						<td class="zuo"><div id="spic"><a target="_blank" href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>"><img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'></a></div> </td>
						<td class="zuo"><s:property value="#item.productId"></s:property></td>
						<td class="zuo"><s:property value="#item.productName"></s:property></td>
						<td class="zuo"><s:property value="#item.productDetail"></s:property></td>
						<td class="zuo">
						<a href="JavaScript:;" onclick="tj('<s:property value="#item.productId"></s:property>','${type}');">选择</a>
						</td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				<tr>
					<td colspan="3"><input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;
					<input type="button" value="确定" class="button5" onclick="submitSelectBox('${type}')"></input>
					</td>
					<td colspan="3"></td>
				</tr>
		</table>
		<div align="right" style="height: 50px; width: 792px; margin-top: 5px;" >
			<s:form action="toAllSelectProductList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
					</table>
			<input type="hidden" value="<s:property value="#request.censor"></s:property>" name="censor"/>
			<input type="hidden" value="<s:property value="#request.searchName"></s:property>" name="searchName"/>
			<input type="hidden" value="<s:property value="#request.searchId"></s:property>" name="searchId"/>
			<input type="hidden" value="<s:property value="#request.supplierId"></s:property>" name="supplierId"/>	
			<input type="hidden" value="<s:property value="#request.supplierName"></s:property>" name="supplierName"/>
			<input type="hidden" value="<s:property value="#request.type"></s:property>" name="type"/>
			</s:form>&nbsp;&nbsp;
   		</div>
   		<br>

	</body>
</html>