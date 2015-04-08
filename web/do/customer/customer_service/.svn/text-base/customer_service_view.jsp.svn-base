<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>

<%
String path=request.getContextPath();
%>

<html>
	<head>
	<link type="text/css" rel="stylesheet" href="../../../css/huzx.css"></link>
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
			<td width="55" align="center"><img src="../../../image/comdo/pen.png"></td>
			<td width="737">
				客户服务排程管理
			</td>
		</tr>
	</table>
		<s:form action="cServView" onsubmit="return checkForm();">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap align="right">服务排程名称：</td>
			<td width="30"><input type="text" name="keywordTitle"  value="<s:property value="keywordTitle"/>"></td>
			<td nowrap width="70px" align="right">状态:</td>
			<td width="30">
				<s:select name="keywordStatus" list="#attr.status" headerKey="" headerValue="--全部--"></s:select>
			</td>
			<td align="center"><input type="submit" value=" 查 询 " class="button5"><td>
			<td align="center"><input type="button" value=" 删 除 " class="button5" id="removeBtn"><td>
		</tr>
		</table>
		</s:form>
		<br />
	<s:if test="crmsPlans.size()>=1">
			<div id="crmsPlans">
			<form action="cServRemove" method="post" id="removeForm">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap><label><input type="checkbox" id="selectAll"/>全选</label> </td>
					<td class="libiaobg" nowrap>服务名称</td>
					<td class="libiaobg" nowrap>类别</td>
					<td class="libiaobg" nowrap>执行方式</td>
					<td class="libiaobg" nowrap>执行时间</td>
					<td class="libiaobg" nowrap>状态</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator value="crmsPlans" status="s"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50" <s:if test="status.equals(\"Y\")"> title="状态已执行的服务无法删除" </s:if><s:else> title="该记录可被删除"</s:else> rowData="{status:'<s:property value="status"/>'}">
						<td class="zuo"><input type="checkbox" name="crmPlanIds" value="<s:property value="id"/>" <s:if test="status.equals(\"Y\")">disabled="disabled"</s:if> /></td>
						<td class="zuo"><div id="spic"><a href="toCServModify?crmServPlan.id=<s:property value="id"/>"><s:property value="title"/> </a></div> </td>
						<td class="zuo"><s:property value="#attr.type[type]"></s:property></td>
						<td class="zuo"><s:property value="#attr.sendType[sendType]"/> </td>
						<td class="zuo"><s:date name="sendTime" format="yyyy-MM-dd"/> </td>
						<td class="zuo"><s:property value="#attr.status[status]"></s:property></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
			</table>
			</form>
		</div>
		<div align="right" style="height: 50px; width: 792px;" >
			<s:form action="cServView">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="pageBar" escape="false"/>  
					</table>
			<s:hidden name="keywordTitle"></s:hidden>
			<s:hidden name="keywordStatus"></s:hidden>
			</s:form>
   		</div>
	</s:if>
	<s:else>
		<table>
		    <tr align="center">
			<td colspan="7" height="100" class="wz-18b" align="center"><img src="../../../image/hzx/tous1.gif" /><span>暂时没有相关信息！</span></td>
			</tr>
		</table>
	</s:else>
	<script type="text/javascript" src="../../../js/hxtool.js"></script>
	<script type="text/javascript">
		$(function(){
			var crmsView = new crmServiceView();
			
		});
		
		function crmServiceView()
		{
			var _self = this;
			this.bind = function()
			{
				$('#removeBtn').click(function(){
					_self.remove();
				});
				
				$('#selectAll').selectAll($('input[name=crmPlanIds]'));
			};
			this.removeCheck = function(){
				if($('input[name=crmPlanIds]:checked').length == 0)
					return false;
				return true;
			};
			this.remove = function()
			{
				if(this.removeCheck())
					$('#removeForm').submit();
				else
					alert('请选择一个记录');
			};
			this.init = function()
			{
				_self.bind();
			};
			this.init();
		}
	</script>
	</body>
</html>