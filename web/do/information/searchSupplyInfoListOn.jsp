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
					alert("请选择要取消发布的供应信息");
					return;
				}
				var r=confirm("确认要取消发布这些供应信息吗？");
				if(r==true){
					window.location.href=url+ids;
				}
			}
		</script>
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
	</head>
	<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			供应信息管理
			</td>
		</tr>
	</table>
		
		<s:form action="searchSupplyInfoListOn">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">信息标题：</td>
			<td width="30"><input type="text" name="searchTitle" size="20" value="<s:property value="#request.searchTitle"></s:property>"></td>
			<td nowrap width="70px" align="right">关键词：</td>
			<td width="30"><input type="text" name="searchWord" size="20" value="<s:property value="#request.searchWord"></s:property>"></td>
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
			<td align="left"><input type="submit" value=" 查 询 " class="button5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="发布供应信息" class="button10" onclick="javascript:publishInfo();"><td>
		</tr>
		</table>
		</s:form>
		<script type="text/javascript">
			function publishInfo()
			{
				document.location="<%=path%>/do/info/toCreateSupplyInfo";
			}
			function infoOn()
			{
				document.location="<%=path%>/do/info/toSupplyInfoListOn";
			}
			function infoOff()
			{
				document.location="<%=path%>/do/info/toSupplyInfoListOff";
			}
		</script>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
                   <tr>
                      <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116"  align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">已发布上网</td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="#" onclick="javascript:infoOff();">未发布上网</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="526" background="../../image/hzx/change_bg.gif">&nbsp;</td>
                  </tr>
                  <s:if test="listS.size()<1">
                  <tr>
				    <td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>没有任何符合条件的供应信息！</span></td>
				  </tr>
                  </s:if>
		</table>
		<div><input id="total" type="text" value='<s:property value="listS.size()"/>' style="display: none;"></input></div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap></td> 
					<td class="libiaobg" nowrap width="120">供应信息标题</td>
					<td class="libiaobg" nowrap width="150">关键词</td>
					<td class="libiaobg" nowrap width="220">类别</td>
					<td class="libiaobg" nowrap width="80">到期时间</td>
					<td class="libiaobg" nowrap width="60">审核状态</td>
					<td class="libiaobg" nowrap width="24">操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listS" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.infoId"/>"></input></td>
						<td class="zuo"><a href="${pageContext.request.contextPath}/front/info/showSupplyInfo?infoId=<s:property value="#item.infoId"/>&type=<s:property value="#item.type"/>" target="_blank"><s:property value="#item.title"></s:property></a></td>
						<td class="zuo"><div class="sl"><s:property value="#item.keyWord"></s:property></div></td>
						<td class="zuo"><s:property value="#item.typeName"></s:property></td>
						<td class="zuo"><s:date name="#item.endDate" format="yyyy-MM-dd"></s:date></td>
						<s:if test="#item.censor<3">
						<td class="zuo">审核通过</td>
						</s:if>
						<s:elseif test="#item.censor<20">
						<td class="zuo">审核中</td>
						</s:elseif>
						<s:else>
						<td class="zuo">已屏蔽</td>
						</s:else>
						<td class="zuo" align="center"><input type="button" value="修改" class="button2" onclick="doRedirect('toUpdateSupplyInfo?infoId=<s:property value="#item.infoId"></s:property>')"></input></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				
				<tr>
					<td colspan="3"><input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;<input type="button" value="取消发布" class="button5" onclick="submitSelectBox('setSupplyInfoOff?infoIds=')"></input>
					</td>
					<td colspan="5"></td>
				</tr>
			</table>
		</div>
		<div align="right" width="98%">
			<s:form action="searchSupplyInfoListOn">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
				</table>	
					<input type="hidden" name="searchTitle" value="<s:property value="#request.searchTitle"></s:property>"></input>
					<input type="hidden" name="searchWord" value="<s:property value="#request.searchWord"></s:property>"></input>
					<input type="hidden" name="censor" value="<s:property value="#request.censor"></s:property>"></input>
			</s:form>&nbsp;&nbsp;
   		</div>
   		<br>
	</body>
</html>