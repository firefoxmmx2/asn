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
<title>信息订阅人列表</title>
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

</script>
</head>
<body>
	<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			信息订阅人列表
			</td>
		</tr>
	</table>
	<s:form action="toInfoOrderList">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
		<tr>
			<td nowrap width="70px" align="right">会员名称：</td>
			<td width="30">
			<input type="text" name="fullName" size="20" value="<s:property value="#request.fullName"/>">
			</td>
			<td nowrap width="90px" align="right">订阅信息类别：</td>
			<td>
			<select name="infoTypeId">
				<s:if test="#request.infoTypeId=='10000'">
				<option value="all">全部</option>
				<option value="10000" selected="selected">供应信息</option>
				<option value="20000">求购信息</option>
				<option value="30000">产品信息</option>
				</s:if>
				<s:elseif test="#request.infoTypeId=='20000'">
				<option value="all">全部</option>
				<option value="10000">供应信息</option>
				<option value="20000" selected="selected">求购信息</option>
				<option value="30000">产品信息</option>
				</s:elseif>
				<s:elseif test="#request.infoTypeId=='30000'">
				<option value="all">全部</option>
				<option value="10000">供应信息</option>
				<option value="20000">求购信息</option>
				<option value="30000" selected="selected">产品信息</option>
				</s:elseif>
				<s:else>
				<option value="all" selected="selected">全部</option>
				<option value="10000">供应信息</option>
				<option value="20000">求购信息</option>
				<option value="30000">产品信息</option>
				</s:else>
			</select>
			</td>
			<td align="left"><input type="submit" value=" 查 询 " ><td>
		</tr>
		</table>
	</s:form>
	<br />
	<s:if test="listMA.size()>=1">
				<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap width="30%">会员名称</td>
					<td class="libiaobg" nowrap width="20%">订阅信息</td>
					<td class="libiaobg" nowrap width="20%">订阅email</td>
					<td class="libiaobg" nowrap width="20%">订阅时间</td>
					<td class="libiaobg" nowrap width="10%">操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listMA" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' height="50">
						<td class="zuo"><s:property value="#item.fullName"/></td>
						<td class="zuo">
							<s:if test="#item.infoTypeId=='10000'">供应信息</s:if>
							<s:elseif test="#item.infoTypeId=='20000'">求购信息</s:elseif>
							<s:elseif test="#item.infoTypeId=='30000'">产品信息</s:elseif>
							<s:else>
							<s:property value="#item.infoTypeId"/>
							</s:else>
						</td>
						<td class="zuo"><s:property value="#item.email"/></td>
						<td class="zuo">
						<s:if test="#item.modifyTime==null">
						<s:property value="#item.createTime"/>
						</s:if>
						<s:else>
						<s:property value="#item.modifyTime"/>
						</s:else>
						</td>
						<td class="zuo"><a href="JavaScript:;" onclick="if(confirm('确认要取消订阅该信息吗？')){window.location.href='setInfoOrderOff?id=<s:property value="#item.id"/>'}">取消订阅</a></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
			</table>
		</div>
		<div align="right" style="height: 50px; width: 792px;" >
			<s:form action="toInfoOrderList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
					</table>
			<input type="hidden" name="fullName" size="20" value="<s:property value="#request.fullName"/>">	
			<input type="hidden" name="infoTypeId" size="20" value="<s:property value="#request.infoTypeId"/>">		
			</s:form>&nbsp;&nbsp;
   		</div>
	</s:if>
	<s:else>
		<table>
		    <tr align="center">
			<td colspan="7" height="100" class="wz-18b" align="center"><img src="../../image/hzx/tous1.gif" /><span>暂时没有相关信息！</span></td>
			</tr>
		</table>
	</s:else>
</body>
</html>