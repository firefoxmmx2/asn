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
					alert("请选择要发布上网产品信息");
					return;
				}
				var r=confirm("确认要将这些产品信息发布上网吗？");
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
					alert("请选择要永久删除的产品信息");
					return;
				}
				var r=confirm("确认要将这些产品信息永久删除吗？");
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
		<tr><td class="daohang" width="98%">供应信息管理</td></tr>
		</table>
		
		<s:form action="searchProductSupplyListOff">
		<tr>
			<td nowrap width="70px" align="right">产品名称：</td>
			<td width="30"><input type="text" name="searchName" value="<s:property value="#request.searchName"></s:property>"></input> <td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="发布产品" class="button5" onclick="javascript:publishProduct();"><td>
		</tr>
		<tr>
			<td colspan="3">
			&nbsp;<label><input type="radio" id="a"  onclick="javascript:productOn();" class="frmrd"/>已发布上网</label>&nbsp;&nbsp;&nbsp;<label><input type="radio" id="a" checked onclick="javascript:productOff();" class="frmrd"/>已取消发布</label>
			<!--<a href="<%=path%>/do/product/toProductSupplyListOn" style="color: red;" target="_self">已发布上网</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path%>/do/product/toProductSupplyListOff" style="color: blue;">已过期</a>-->
			</td>
		</tr>
		</s:form>
		<script type="text/javascript">
			function publishProduct()
			{
				document.location="<%=path%>/do/product/toCreateProductSupply";
			}
			function productOn()
			{
				document.location="<%=path%>/do/product/toProductSupplyListOn";
			}
			function productOff()
			{
				document.location="<%=path%>/do/product/toProductSupplyListOff";
			}
		</script>

		<div><input id="total" type="text" value='<s:property value="listPS.size()"/>' style="display: none;"></input></div>
		<div>
			<table width="100%" border="0" cellspacing="1" cellpadding="2"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap>&nbsp;</td> 
					<td class="libiaobg" nowrap>产品图片</td>
					<td class="libiaobg" nowrap>信息标题</td>
					<td class="libiaobg" nowrap>产品名称</td>
					<td class="libiaobg" nowrap>价格</td>
					<td class="libiaobg" nowrap>类别</td>
					<td class="libiaobg" nowrap >到期时间</td>
					<td class="libiaobg" nowrap width="24">操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listPS" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.productId"/>"></input></td>
						<td class="zuo"><div id="spic"><img src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'></div> </td>
						<td  class="zuo" nowrap><s:property value="#item.supplyTitle"></s:property></td>
						<td  class="zuo" nowrap><s:property value="#item.productName"></s:property></td>
						<td  class="zuo"><s:property value="#item.price"></s:property></td>
						<td  class="zuo"><s:property value="#item.productType"></s:property></td>
						<td  class="zuo"><s:date name="#item.productEndDate" format="yyyy-MM-dd"></s:date></td>
						<td   class="zuo" width="10">&nbsp;<input type="button" value="修改" class="button2" onclick="doRedirect('toUpdateProductSupply?productId=<s:property value="#item.productId"></s:property>')"></input>&nbsp;</td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				<tr>
					<td colspan="3"><input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;<input type="button" value="重新发布" class="button5" onclick="submitSelectBox('setProductSupplyOn?productIds=')"></input>&nbsp;&nbsp;&nbsp;<input type="button" class="button5" value="永久删除" onclick="submitSelectBoxDel('setProductSupplyDel?productIds=')"></input>
					</td>
					<td colspan="5">&nbsp;</td>
				</tr>
			</table>
		</div>
		<div align="right" width="98%">
			<s:form action="searchProductSupplyListOff">
					<s:property value="#request.pageBar" escape="false"/>  
					<input type="hidden" name="searchName" value="<s:property value="#request.searchName"></s:property>"></input>
			</s:form> 
   		</div>
	</body>
</html>