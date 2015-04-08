<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path=request.getContextPath();
%>

<html>
	<head>
		<script type="text/javascript">
		function doRedirect(url){
			window.location.href=url;
		}

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

		function submitSelectBox(url){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要发布上网的求购信息");
				return;
			}
			var r=confirm("确认要将这些求购信息发布上网吗？");
			if(r==true){
				window.location.href=url+ids;
			}
		}

		function submitSelectBoxDel(url){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要永久删除的求购信息");
				return;
			}
			var r=confirm("确认要将这些求购信息永久删除吗？");
			if(r==true){
				window.location.href=url+ids;
			}
		}
		
		</script>		

		<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="10" cellspacing="0">
		<tr><td height="2px" ></td></tr>
		<tr><td class="daohang" width="98%">求购信息管理</td></tr>
		</table>
		
		<s:form action="searchProductPurchaseListOff">
		<tr>
			<td nowrap width="70px" align="right">产品名称：</td>
			<td width="30"><input type="text" name="searchName" size="20"></td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="发布求购信息" class="button7" onclick="javascript:publishProduct();"></td>
		</tr>
		<tr>
			<td nowrap colspan="3">&nbsp;&nbsp;<label><input type="radio" id="a"  onclick="javascript:productOn();" class="frmrd"/>已发布上网</label>&nbsp;&nbsp;&nbsp;<label><input type="radio" checked id="a" onclick="javascript:productOff();" class="frmrd"/>已取消发布</label>
			</td>
		</tr>
		</s:form>
		<script type="text/javascript">
			function publishProduct()
			{
				document.location="<%=path%>/do/purchase/toCreateProductPurchase";
			}
			function productOn()
			{
				document.location="<%=path%>/do/purchase/toProductPurchaseListOn";
			}
			function productOff()
			{
				document.location="<%=path%>/do/purchase/toProductPurchaseListOff";
			}
		</script>
		
		<div><input id="total" type="text" value='<s:property value="listPP.size()"/>' style="display: none;"></input></div>
		<div>
			<table width="100%" border="0" cellspacing="1" cellpadding="2"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap></td> 
					<td class="libiaobg" nowrap>产品图片</td>
					<td class="libiaobg" nowrap>信息标题</td>
					<td class="libiaobg" nowrap>产品名称</td>
					<td class="libiaobg" nowrap>类别</td>
					<td class="libiaobg" nowrap>到期时间</td>
					<td class="libiaobg" nowrap>操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listPP" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.purchaseId"/>"></input></td>
						<td class="zuo"><div id="spic"><img src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'></div> </td>
						<td class="zuo"><s:property value="#item.purchaseTitle"></s:property></td>
						<td class="zuo"><s:property value="#item.productName"></s:property></td>
						<td class="zuo"><s:property value="#item.productType"></s:property></td>
						<td class="zuo"><s:date name="#item.purchaseEndDate" format="yyyy-MM-dd"></s:date></td>
						<td class="zuo">&nbsp;<input type="button" value="修改" class="button2" onclick="doRedirect('toUpdateProductPurchase?purchaseId=<s:property value="#item.purchaseId"></s:property>')"></input>&nbsp;</td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				<tr>
					<td colspan="6"><input type="checkbox" class="frmrd" id="allSelect" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;<input type="button" value="重新发布" class="button5" onclick="submitSelectBox('setProductPurchaseOn?purchaseIds=')"></input>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="button5" value="永久删除" onclick="submitSelectBoxDel('setProductPurchaseDel?purchaseIds=')"></input>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<div align="right" width="98%">
			<s:form action="toProductPurchaseListOff">
					<s:property value="#request.pageBar" escape="false"/>  
			</s:form> 
   		</div>
	</body>
</html>