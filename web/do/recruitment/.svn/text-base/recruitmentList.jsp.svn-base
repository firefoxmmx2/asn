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
<title>招聘列表</title>
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
				alert("请选择要取消发布的招聘信息");
				return;
			}
			var r=confirm("确认要取消发布这些招聘信息吗？");
			if(r==true){
				window.location.href=url+"?status="+status+"&ids="+ids;
			}
		}

		function delSelectBox(url,status){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要删除的招聘信息");
				return;
			}
			var r=confirm("确认要删除这些招聘信息吗？");
			if(r==true){
				window.location.href=url+"?status="+status+"&ids="+ids;
			}
		}

		function submitSelectBox1(url,status){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要发布的招聘信息");
				return;
			}
			var r=confirm("确认要发布这些招聘信息吗？");
			if(r==true){
				window.location.href=url+"?status="+status+"&ids="+ids;
			}
		}
</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			招聘列表
			</td>
		</tr>
	</table>
		
		<s:form action="toRecruitmentList">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">职位名称：</td>
			<td width="30"><input type="text" name="jobName" size="20" value="<s:property value="#request.jobName"/>"><input type="hidden" name="status" value="<s:property value="#request.status"/>"/></td>
			<td align="left"><input type="submit" value=" 查 询 " class="button5"><td>
		</tr>
		</table>
		</s:form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
				  <s:if test="#request.status==2">
				  <tr>
                      <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116"  align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="javascript:;" onclick="doRedirect('toRecruitmentList?status=1');return false;">已发布上网</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">已取消发布</td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="javascript:;" onclick="doRedirect('toRecruitmentList?status=3');return false;">草稿箱</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="404" background="../../image/hzx/change_bg.gif">&nbsp;</td>
                  </tr>
				  </s:if>
				  <s:elseif test="#request.status==3">
				  <tr>
                      <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116"  align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="javascript:;" onclick="doRedirect('toRecruitmentList?status=1');return false;">已发布上网</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="javascript:;" onclick="doRedirect('toRecruitmentList?status=2');return false;">已取消发布</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">草稿箱</td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="404" background="../../image/hzx/change_bg.gif">&nbsp;</td>
                  </tr>
				  </s:elseif>
				  <s:else>
				  <tr>
                      <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>  
                      <td width="116"  align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">已发布上网</td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="javascript:;" onclick="doRedirect('toRecruitmentList?status=2');return false;">已取消发布</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="javascript:;" onclick="doRedirect('toRecruitmentList?status=3');return false;">草稿箱</a></td>
					  <td width="6" background="../../image/hzx/change_bg.gif"></td>
                      <td width="404" background="../../image/hzx/change_bg.gif">&nbsp;</td>   
                  </tr>
				  </s:else>
                  <s:if test="recruitmentList.size()<1">
                  <tr>
				    <td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>暂时没有相关招聘信息！</span></td>
				  </tr>
                  </s:if>
		</table>
		<s:if test="recruitmentList.size()>=1">
		<div><input id="total" type="text" value='<s:property value="recruitmentList.size()"/>' style="display: none;"></input></div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head" style="text-align: center;font: 12px solid bold;">
					<td class="libiaobg" nowrap width="6%" height="20"></td> 
					<td class="libiaobg" nowrap width="34%">职位名称</td>
					<td class="libiaobg" nowrap width="20%">创建时间</td>
					<td class="libiaobg" nowrap width="20%">操作</td>
					<td class="libiaobg" nowrap width="20%">查看</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="recruitmentList" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.id"/>"></input></td>
						<td class="zuo" style="text-align: center;"><a target="_blank" href="<%=cp%>/front/recr/showRecruitment?rid=<s:property value="#item.id" />"><s:property value="#item.jobName"></s:property></a></td>
						<td class="zuo" style="text-align: center;"><s:date name="#item.createTime" format="yyyy-MM-dd"></s:date></td>
						<td class="zuo" align="center">
						<a href="toUpdateRecruitment?id=<s:property value="#item.id" />">修改</a>
						</td>
						<td class="zuo" align="center">
						<a href="toEmployeeList?jid=<s:property value="#item.id" />&status=0" >应聘简历列表</a>
						</td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
				
				<tr>
					<td colspan="3"><input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;
					<s:if test="#request.status==2">
					<input type="button" value="重新发布" class="button5" onclick="submitSelectBox1('setRecruitmentStatus','1')"></input>
					<input type="button" value="删除" class="button5" onclick="delSelectBox('setRecruitmentStatus','0')"></input>
					</s:if>
					<s:elseif test="#request.status==3">
					<input type="button" value="发布上网" class="button5" onclick="submitSelectBox1('setRecruitmentStatus','1')"></input>
					<input type="button" value="删除" class="button5" onclick="delSelectBox('setRecruitmentStatus','0')"></input>
					</s:elseif>
					<s:else>
					<input type="button" value="取消发布" class="button5" onclick="submitSelectBox('setRecruitmentStatus','2')"></input>
					</s:else>
					</td>
					<td colspan="5"></td>
				</tr>
			</table>
		</div>
		<div align="right" width="98%">
			<s:form action="toRecruitmentList">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
				</table>	
				<input type="hidden" name="jobName" value="<s:property value="#request.jobName"/>"/>
				<input type="hidden" name="status" value="<s:property value="#request.status"/>"/>
			</s:form>&nbsp;&nbsp;
   		</div>
   		<br>
		</s:if>
	
	
</body>
</html>