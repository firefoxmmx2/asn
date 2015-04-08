<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path=request.getContextPath();
%>
<html>
	<head>
		<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/tipswindown.js"></script>
		<link rel="stylesheet" rev="stylesheet" href="<%=path%>/css/comdo.css" type="text/css" />
		<link rel="stylesheet" rev="stylesheet" href="<%=path%>/css/tipswindown.css" type="text/css" />
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
		$(document).ready(function(){
			$("#add1").click(function(){
				tipsWindown("","iframe:/asn/admin/spe/toAllSelectProductList?type=tuijian","800","527","true","","true","leotheme");
			});
			$("#add2").click(function(){
				tipsWindown("","iframe:/asn/admin/spe/toAllSelectProductList?type=tejia","800","527","true","","true","leotheme");
			});
			$("#add3").click(function(){
				tipsWindown("","iframe:/asn/admin/spe/toAllSelectProductList?type=xinpin","800","527","true","","true","leotheme");
			});
			$("#add4").click(function(){
				tipsWindown("","iframe:/asn/admin/spe/toAllSelectProductList?type=canzhan","800","527","true","","true","leotheme");
			});
			$("#queding").hide();
			$("#xiugai").click(
				function(){
					$(".snumber").removeAttr("disabled");
					$("#xiugai").hide();
					$("#queding").show();
				}
			);
			$("#queding").click(
					function(){
						formUpdate.submit();
					}
				);

			
		});

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
		
		function closeProduct(type){
			$("#windownbg").remove();
			$("#windown-box").fadeOut("slow",function(){$(this).remove();});
			window.location.href="toSpecialProductList?type="+type;
		}
		
		function delSelectBox(url,type){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要撤销的商品");
				return;
			}
			var r=confirm("确认要撤销这些商品吗？");
			if(r==true){
				window.location.href=url+"?ids="+ids+"&type="+type;
			}
		}

		function delSelect(url,id,type){
			var r=confirm("确认要撤销该商品吗？");
			if(r==true){
				window.location.href=url+"?ids="+id+","+"&type="+type;
			}
		}
		
		</script>
	</head>
	<body>
		<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
			<tr>
				<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
				<td width="737">
				特殊商品管理
				</td>
			</tr>
		</table>
		<s:form action="toSpecialProductList">
		<input type="hidden" name="type" value="<s:property value="#request.type"/>" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">商品名称：</td>
			<td width="30">
			<input type="text" name="name" size="20" value="<s:property value="#request.name"/>">
			</td>
			<td nowrap width="70px" align="right">商品ID：</td>
			<td width="30">
			<input type="text" name="productId" size="20" value="<s:property value="#request.productId"/>">
			</td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5"><td>
			<td align="left">
			 <s:if test="#request.type=='tuijian'">
			<input type="button" value="新增推荐商品" id="add1"/>
			</s:if>
			<s:elseif test="#request.type=='tejia'">
			<input type="button" value="新增特价商品" id="add2"/>
			</s:elseif>
			<s:elseif test="#request.type=='xinpin'">
			<input type="button" value="新增新品上市" id="add3"/>  
			</s:elseif>
			<s:else>
			<input type="button" value="新增参展商品" id="add4"/>  
			</s:else>
			<td>
		</tr>
		</table>
		</s:form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
				 <s:if test="#request.type=='tuijian'">
				  <tr>
                      <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">推荐商品</td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=tejia';return false;">特价商品</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=xinpin';return false;">新品上市</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>   
					  <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=canzhan';return false;">参展商品</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>   
                      <td width="282" background="../../image/hzx/change_bg.gif">&nbsp;</td>        
                  </tr>	     
				 </s:if>     
				 <s:elseif test="#request.type=='tejia'">
				 	 <tr>
                      <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=tuijian';return false">推荐商品</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">特价商品</td>  
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=xinpin';return false;">新品上市</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=canzhan';return false;">参展商品</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>   
                      <td width="282" background="../../image/hzx/change_bg.gif">&nbsp;</td>     
                  	</tr>	
				 </s:elseif>
				 <s:elseif test="#request.type=='xinpin'">
				 	<tr>
                      <td height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=tuijian';return false">推荐商品</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=tejia';return false;">特价商品</a></td>  
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">新品上市</td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=canzhan';return false;">参展商品</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>   
                      <td width="282" background="../../image/hzx/change_bg.gif">&nbsp;</td>     
                  	</tr>	
				 </s:elseif>
				 <s:else>
				 	<tr>
                      <td height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=tuijian';return false">推荐商品</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=tejia';return false;">特价商品</a></td>  
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
					  <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="JavaScript:window.location.href='toSpecialProductList?type=xinpin';return false;">新品上市</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">参展商品</td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>   
                      <td width="282" background="../../image/hzx/change_bg.gif">&nbsp;</td>     
                  	</tr>	
				 </s:else>
				 
                  <s:if test="specialProductList.size()<1">   
                  <tr>
				    <td colspan="8" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>暂时没有相关商品信息！</span></td>
				  </tr>  
                  </s:if>	 
		</table>
		
		<s:if test="specialProductList.size()>=1">
		<div><input id="total" type="text" value='<s:property value="specialProductList.size()"/>' style="display: none;"></input></div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head" style="text-align: center;font: 14px solid bold;">
					<td class="libiaobg" nowrap>&nbsp;</td> 
					<td class="libiaobg" nowrap>顺序号</td>
					<td class="libiaobg" nowrap>商品图片</td>
					<td class="libiaobg" nowrap>商品ID</td>
					<td class="libiaobg" nowrap>商品名称</td>
					<td class="libiaobg" nowrap>操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:form action="updateSnumber" method="post" theme="simple" namespace="/admin/spe" id="formUpdate">
				<input type="hidden" name="type" value="${type}"></input>
				<s:iterator id="item" value="specialProductList" status="list">       
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.id"/>"></input></td>
						<td width="4" class="zuo"><input type="hidden" name="specialProductList[<s:property value="#list.count-1"/>].id" value="<s:property value="#item.id"/>" /><input name="specialProductList[<s:property value="#list.count-1"/>].snumber" value="<s:property value="#item.snumber"/>" size="2" disabled="disabled" class="snumber"/></td>
						<td class="zuo" style="text-align: center;">
						<div id="spic"><a href="${pageContext.request.contextPath}/front/displayDetailProduct?productId=<s:property value="#item.productId"/>" target="_blank"><img height="80" width="80" border="0px;" src='${pageContext.request.contextPath}<s:property value="#item.smallPicPath"/>'></a></div> 
						</td>
						<td class="zuo" style="text-align: center;">
							<s:property value="#item.productId"></s:property>
						</td>
						<td class="zuo" align="center">
							<s:property value="#item.name"></s:property>
						</td>
						<td class="zuo" align="center">
							<a href="toUpdateSpecialProduct?id=<s:property value="#item.id"></s:property>">修改</a>
							<a href="JavaScript:" onclick="delSelect('deleteSpecialProduct','<s:property value="#item.id"></s:property>','<s:property value="#request.type"/>')">撤销</a>
						</td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				</s:form>
				<tr>
					<td colspan="3"><input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;
					<input type="button" value="撤销" class="button5" onclick="delSelectBox('deleteSpecialProduct','<s:property value="#request.type"/>')"></input>
					<input type="button" value="修改顺序" id="xiugai"></input>
					<input type="button" value="确定顺序" id="queding" ></input>
					</td>
					<td colspan="5"></td>
				</tr>
			</table>
		</div>
		</s:if>
		<div align="right" width="98%">
			<s:form action="toSpecialProductList">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
				</table>	
				<input type="hidden" name="name" value="<s:property value="#request.name"/>"/>
				<input type="hidden" name="type" value="<s:property value="#request.type"/>"/>
				<input type="hidden" name="productId" value="<s:property value="#request.productId"/>"/>
			</s:form>&nbsp;&nbsp;
   		</div>
   		<br>
		
	</body>
</html>