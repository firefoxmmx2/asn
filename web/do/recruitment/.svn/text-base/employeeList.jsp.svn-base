<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>招聘列表</title>
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

		function delSelectBox(url,jid,status){
			var total=document.getElementById("total").value;
			var ids="";
			for(i=1;i<=total;i++){
				var idCheckBox = document.getElementById("checkBox"+i);
				if(idCheckBox.checked){
					ids+=idCheckBox.value+",";
				}
			}
			if(ids==""){
				alert("请选择要删除的应聘信息");
				return;
			}
			var r=confirm("确认要删除这些应聘信息吗？");
			if(r==true){
				window.location.href=url+"?ids="+ids+"&jid="+jid+"&status="+status;
			}
		}

</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="600">
			${tip}列表
			</td>
			<td width="137" align="right"><a href="<%=request.getContextPath()%>/do/recr/toRecruitmentList">返回职位列表</a></td>
		</tr>
	</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
				  <s:if test="#request.status==0">
				  <tr>
              <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
              <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">竞聘列表</td>
	  <td width="6" background="../../image/hzx/change_bg.gif"></td>
              <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="doRedirect('toEmployeeList?jid=${jobId}&status=1');return false;">备选列表</a></td>
	  <td width="6" background="../../image/hzx/change_bg.gif"></td>
              <td width="526" background="../../image/hzx/change_bg.gif">&nbsp;</td>
          </tr>	
				  </s:if>
				  <s:else>
				  <tr>
              <td  height="33" width="20" background="../../image/hzx/change_bg.gif"></td>
              <td width="116" align="center" valign="middle" background="../../image/hzx/change1.gif" class="color_g2"><a href="JavaScript:;" onclick="doRedirect('toEmployeeList?jid=${jobId}&status=0');return false;">竞聘列表</a></td>
	  <td width="6" background="../../image/hzx/change_bg.gif"></td>
              <td width="116" align="center" valign="middle" background="../../image/hzx/change2.gif" class="color_g">备选列表</td>
	  <td width="6" background="../../image/hzx/change_bg.gif"></td>
              <td width="526" background="../../image/hzx/change_bg.gif" >&nbsp;</td>
          </tr>	
				  </s:else>	
                  <s:if test="recruitmentList.size()<1">
                  <tr>
				    <td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>暂时没有相关招聘信息！</span></td>
				  </tr>
                  </s:if>
		</table>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
                  <s:if test="employeeList.size()<1">
                  <tr>
				    <td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>暂时没有应聘简历信息！</span></td>
				  </tr>
                  </s:if>
		</table>
		
		
		<s:if test="employeeList.size()>=1">
		<div><input id="total" type="text" value='<s:property value="employeeList.size()"/>' style="display: none;"></input></div>
	
			<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head" style="text-align: center;font: 14px solid bold;">
					<td class="libiaobg" nowrap></td> 
					<td class="libiaobg" nowrap width="70">姓名</td>
					<td class="libiaobg" nowrap width="65">出生日期</td>
					<td class="libiaobg" nowrap width="65">工作年限</td>
					<td class="libiaobg" nowrap width="24">操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="employeeList" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td width="4" class="zuo"><input type="checkbox" class="frmrd" id="checkBox<s:property value="#list.count"/>" value="<s:property value="#item.id"/>"></input></td>
						<td class="zuo" style="text-align: center;"><a href="showEmployee?eid=<s:property value="#item.id"/>"><s:property value="#item.name"></s:property></a></td>
						<td class="zuo" style="text-align: center;"><s:property value="#item.birthday"></s:property></td>
						<td class="zuo" style="text-align: center;"><s:property value="#item.workYear"></s:property></td>
						<td class="zuo" align="center">
						<a href="showEmployee?eid=<s:property value="#item.id"/>">详情</a> 
						<a href="deleteEmployee?ids=<s:property value="#item.id" />&jid=${jobId}&status=${status}" onclick="return confirm('确定要删除该应聘信息吗？')">删除</a>
						</td>
					</tr>      
				<%
				looprow ++;
				%>
				</s:iterator>
				
				<tr>
					<td colspan="3"><input type="checkbox" id="allSelect" class="frmrd" value="selectAll" onclick="checkAll()">全选</input>
					&nbsp;&nbsp;
					<input type="button" value="删除" class="button5" onclick="delSelectBox('deleteEmployee','${jobId}','${status}')"></input>
					</td>
					<td colspan="2"></td>
				</tr>
				
			</table>
		</div>
	
	
		<div align="right" width="98%">
			<s:form action="toEmployeeList">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
				</table>	
				<input type="hidden" value="${jobId}" name="jid"></input>
				<input type="hidden" value="${status}" name="status"></input>
			</s:form>&nbsp;&nbsp;
   		</div>
   		<br>
		</s:if>
	
	
</body>
</html>