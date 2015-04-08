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
<title>明细列表</title>
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
			明细列表
			</td>
		</tr>
	</table>
	<br />
	<s:form action="toStorageInOutList">
		<input type="hidden" name="id" value="<s:property value="#request.id"/>"></input>
		<input type="hidden" name="pageSize" value="10"></input>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 5px;">
			<tr>
				<td nowrap width="70px" align="right">单据号：</td>
				<td width="30"><input type="text" name="billNum" size="20" value="<s:property value="#request.billNum"/>"></td>
				<td nowrap width="70px" align="right">单据类型：</td>
				<td width="30">
				<select name="billType">
					<s:if test='#request.billType=="I"'>
					<option value="all">全部</option>	
					<option value="I" selected="selected">入库</option>		
					<option value="O">订单出库</option>
					<option value="S">手工出库</option>
					<option value="U">修改产品</option>	
					</s:if>
					<s:elseif test='#request.billType=="O"'>
					<option value="all">全部</option>	
					<option value="I">入库</option>		
					<option value="O" selected="selected">订单出库</option>
					<option value="S">手工出库</option>
					<option value="U">修改产品</option>	
					</s:elseif>
					<s:elseif test='#request.billType=="S"'>
					<option value="all">全部</option>	
					<option value="I">入库</option>		
					<option value="O">订单出库</option>
					<option value="S" selected="selected">手工出库</option>
					<option value="U">修改产品</option>	
					</s:elseif>
					<s:elseif test='#request.billType=="U"'>
					<option value="all">全部</option>	
					<option value="I">入库</option>		
					<option value="O">订单出库</option>
					<option value="S">手工出库</option>
					<option value="U" selected="selected">修改产品</option>	
					</s:elseif>
					<s:else>
					<option value="all" selected="selected">全部</option>	
					<option value="I">入库</option>		
					<option value="O">订单出库</option>
					<option value="S">手工出库</option>
					<option value="U">修改产品</option>	
					</s:else>
				</select>
				</td>
				<td align="left"><input type="submit" value=" 查 询 " class="button5"><td>
			</tr>
			</table>
			<br />
	</s:form>
	<s:if test="listStorageInOut.size()<1">
		<table width="500" height="100">
			<thead>
				<tr>
				    <td colspan="7" height="100" class="wz-18b"><img src="../../image/hzx/tous1.gif" /><span>暂时没有相关库存记录！</span></td>
				</tr>
			</thead>
		</table>
	</s:if>
	<s:else>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center" class="list" >
				<tr class="head" align="center"> 
					<td class="libiaobg" nowrap width="19%">单据号</td>
					<td class="libiaobg" nowrap width="19%">单据时间</td>
					<td class="libiaobg" nowrap width="19%">单据类型</td>
					<td class="libiaobg" nowrap width="19%">创建时间</td>
					<td class="libiaobg" nowrap width="19%">操作</td>
				</tr>
				
				<%
				int looprow = 0;
				%>
				<s:iterator id="item" value="listStorageInOut" status="list"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>' align="center">
						<td class="zuo"><s:property value="#item.billNum"></s:property></td>
						<td class="zuo"><s:date name="#item.billTime" format="yyyy-MM-dd"></s:date></td>
						<td class="zuo"><s:property value="#item.billType"></s:property></td>
						<td class="zuo"><s:date name="#item.handleTime" format="yyyy-MM-dd"></s:date></td>
						<td class="zuo"><a href="toSee?id=<s:property value="#item.id"></s:property>" target="_blank">查看</a></td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>
			</table>
		</div>
		<div align="right" style="height: 50px; width: 792px;" >
			<s:form action="toStorageInOutList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:property value="#request.pageBar" escape="false"/>  
					</table>
			<input type="hidden" name="id" value="<s:property value="#request.id"></s:property>"></input>
			<input type="hidden" name="billNum" value="<s:property value="#request.billNum"></s:property>"></input>
			</s:form>&nbsp;&nbsp;
   		</div>
	</s:else>
</body>
</html>