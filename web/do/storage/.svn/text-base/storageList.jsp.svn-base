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
<title>库存列表</title>
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
		function submitSelectBox(url,status){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要修改的库存");
				return;
			}
			var r=confirm("确认要修改这些库存吗？");
			if(r==true){
				window.location.href=url+"?ids="+ids;
			}
		}


</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			库存列表
			</td>
		</tr>
	</table>
	<s:form action="toStorageList">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">商品名称：</td>
			<td width="30"><input type="text" name="productName" size="20" value="<s:property value="#request.productName"/>"></td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5"><td>
		</tr>
		</table>
		<br />
	</s:form>
	<s:if test="listStorage.size()<1">
		<table width="500" height="100">
				<thead>
				<tr>
				    <td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>暂时没有库存信息！</span></td>
				</tr>
				</thead>
		</table>
	</s:if>
	<s:else>
		<div><input id="total" type="text" value='<s:property value="listStorage.size()"/>' style="display: none;"></input></div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head" align="center"> 
					<td class="libiaobg" nowrap width="5%">&nbsp;</td> 
					<td class="libiaobg" nowrap width="19%">商品图片</td>
					<td class="libiaobg" nowrap width="19%">商品名称</td>
					<td class="libiaobg" nowrap width="19%">库存量</td>
					<td class="libiaobg" nowrap width="19%">修改时间</td>
					<td class="libiaobg" nowrap width="19%">明细</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listStorage" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' align="center">
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.productId"/>"></input></td>
						<td class="zuo"><div id="spic"><a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank">
						<s:if test="#item.smallPicPath==null">
						<img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}/images/photo_not_exits_small.gif'>
						</s:if>
						<s:else>
						<img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'>
						</s:else>
						</a></div> </td>
						<td class="zuo"><s:property value="#item.productName"></s:property></td>
						<td class="zuo"><s:property value="#item.stockAmount"></s:property><s:property value="#item.unit"></s:property></td>
						<td class="zuo"><s:property value="#item.modifyTime"></s:property></td>
						<td class="zuo"><a href="toStorageInOutList?id=<s:property value="#item.productId"></s:property>&pageSize=10">查看</a></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				
				<tr align="center">
					<td>
					<input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()"></input>
					</td>
					<td colspan="4" align="left">
					全选
					&nbsp;&nbsp;<input type="button" value="入库管理" class="button5" onclick="submitSelectBox('toStorageListIn')"></input>
					&nbsp;&nbsp;<input type="button" value="出库管理" class="button5" onclick="submitSelectBox('toStorageListOut')"></input>
					</td>
					<td align="center">
						<input type="button" value="查看所有" class="button5" onclick="JavaScript:window.location.href='toStorageInOutList?pageSize=10'"></input>
					</td> 
				</tr> 
			</table>
		</div>
		<div align="right" style="height: 50px; width: 792px;" >
			<s:form action="toStorageList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
					</table>
			<input type="hidden" name="productName" value="<s:property value="#request.productName"></s:property>"></input>
			</s:form>&nbsp;&nbsp;
   		</div>
   		</s:else>
</body>
</html>