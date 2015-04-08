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
					alert("请选择要上架的商品");
					return;
				}
				var r=confirm("确认要将这些商品上架吗？");
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
					alert("请选择要永久删除的商品");
					return;
				}
				var r=confirm("确认要将这些商品永久删除吗？");
				if(r==true){
					window.location.href=url+ids;
				}
			}
		</script>
		<style type="text/css">
		.color_g{ color:#0f6ce5; text-align:center; font-size:12px;}
		.color_g2{ color:#0048a3;text-align:center; font-size:12px;}
		.wz-18b{ color:#112482; font-size:18px;text-align:center; padding-left:15px;}
		
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
	</head>
	<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			商品管理
			</td>
		</tr>
	</table>
		
		<s:form action="searchProductListOff">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">商品编号：</td>
			<td width="30"><input type="text" name="searchNumber" size="20" value="<s:property value="#request.searchNumber"></s:property>"></td>
			<td nowrap width="70px" align="right">商品名称：</td>
			<td width="30"><input type="text" name="searchName" size="20" value="<s:property value="#request.searchName"></s:property>"></td>
			<td nowrap width="70px" align="right">审核状态：</td>
			<td width="30">
			<select name="censor">	
				<s:if test="#request.censor=='pass'">
				<option value="all">全部</option>	
				<option value="pass" selected="selected">审核通过</option>
				<option value="in">审核中</option>
				<option value="over">已屏蔽</option>		
				</s:if>
				<s:elseif test="#request.censor=='in'">
				<option value="all">全部</option>	
				<option value="pass">审核通过</option>
				<option value="in" selected="selected">审核中</option>
				<option value="over">已屏蔽</option>		
				</s:elseif>
				<s:elseif test="#request.censor=='over'">
				<option value="all">全部</option>	
				<option value="pass">审核通过</option>
				<option value="in">审核中</option>
				<option value="over" selected="selected">已屏蔽</option>		
				</s:elseif>
				<s:else>
				<option value="all" selected="selected">全部</option>	
				<option value="pass">审核通过</option>
				<option value="in">审核中</option>
				<option value="over">已屏蔽</option>		
				</s:else>
			</select>
			</td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="发布商品" class="button5" onclick="javascript:publishProduct();"></td>
		</tr>
		</table>
		</s:form>
		<script type="text/javascript">
			function publishProduct()
			{
				document.location="<%=path%>/do/product/toCreateProduct";
			}
			function productOn()
			{
				document.location="<%=path%>/do/product/toProductListOn";
			}
			function productOff()
			{
				document.location="<%=path%>/do/product/toProductListOff";
			}
		</script>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
        	<tr>
            	<td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                <td width="116"  align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="#" onclick="javascript:productOn();">已上架销售的商品</a></td>
				<td width="6" background="../../image/hzx/change_bg.gif"></td>
                <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">未上架的商品</td>
				<td width="6" background="../../image/hzx/change_bg.gif"></td>
                <td width="526" background="../../image/hzx/change_bg.gif">&nbsp;</td>
            </tr>
            <s:if test="listP.size()<1">
            <tr>
			<td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>没有符合条件的商品下架！</span></td>
			</tr>
            </s:if>
		</table>
		<div><input id="total" type="text" value='<s:property value="listP.size()"/>' style="display: none;"></input></div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="5%"></td> 
					<td class="libiaobg" nowrap width="15%">商品图片</td>
					<td class="libiaobg" nowrap width="15%">商品编号</td>
					<td class="libiaobg" nowrap width="15%">商品名称</td>
					<td class="libiaobg" nowrap width="15%">价格</td>
					<td class="libiaobg" nowrap width="20%">类别</td>
					<td class="libiaobg" nowrap width="10%">审核状态</td>
					<td class="libiaobg" nowrap width="5%">操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listP" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.productId"/>"></input></td>
						<td class="zuo">
						<div id="spic">
						<a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank">
							<s:if test="#item.smallPicPath==null">
							<img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}/images/photo_not_exits_small.gif'>
							</s:if>
							<s:else>
							<img width="80" height="80" border="0px;" src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'>
							</s:else>
						</a>
						</div> 
						</td>
						<td class="zuo"><a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><s:property value="#item.productNumber"></s:property></a></td>
						<td class="zuo">
						<s:property value="#item.productName"></s:property></td>
						<td class="zuo">
						<s:if test="#item.price3!=null">
							<s:property value="#item.price3"/>元～
						</s:if>
						<s:elseif test="#item.price2!=null">
							<s:property value="#item.price2"/>元～
						</s:elseif>
						<s:property value="#item.price1"></s:property>元
						</td>
						<td class="zuo"><s:property value="#item.productType"></s:property></td>
						<s:if test="#item.censor<3">
						<td class="zuo">审核通过</td>
						</s:if>
						<s:elseif test="#item.censor<20">
						<td class="zuo">审核中</td>
						</s:elseif>
						<s:else>
						<td class="zuo">已屏蔽</td>
						</s:else>
						<td class="zuo"><input type="button" value="修改" class="button2" onclick="doRedirect('toUpdateProduct?productId=<s:property value="#item.productId"></s:property>')"></input></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				
				<tr>
					<td colspan="3"><input type="checkbox" class="frmrd" id="allSelect" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;<input type="button" value="上架" class="button5" onclick="submitSelectBox('setProductOn?productIds=')"></input>&nbsp;&nbsp;&nbsp;<input type="button" class="button5" value="永久删除" onclick="submitSelectBoxDel('setProductDel?productIds=')"></input>
					</td>
					<td colspan="5"></td>
				</tr>
			</table>
		</div>
		<div align="right" width="98%">
			<s:form action="searchProductListOff">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<s:property value="#request.pageBar" escape="false"/>  
				</table>
				<input type="hidden" name="searchName" value="<s:property value="#request.searchName"></s:property>"></input>
				<input type="hidden" name="searchNumber" value="<s:property value="#request.searchNumber"></s:property>"></input>
				<input type="hidden" name="censor" value="<s:property value="#request.censor"></s:property>"></input>
			</s:form>&nbsp;&nbsp;
   		</div>
   		<br>
	</body>
</html>