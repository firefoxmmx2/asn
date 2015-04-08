<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>

<%
String path=request.getContextPath();
%>

<html>
	<head>
		<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
	</head>
	<body>
		<table width="98%" style="border:0px #666 solid;" align="center" cellpadding="10" cellspacing="0">
		<tr><td height="2px" ></td></tr>
		<tr><td class="daohang">订单管理列表</td></tr>
		</table>
		<s:form action="findBackOrderList.action" theme="simple">
		<table><tr>
			<td nowrap width="70px" align="right">订单编号：</td>
			<td width="30">
			    <s:textfield name="orderCode" size="20"></s:textfield>
			</td>
			<td nowrap width="70px" align="right">订单状态：</td>
			<td width="30">
			    <s:select list="#{'':'状态','WFK':'处理'}" name="orderStatus" ></s:select>
			</td>
			<td align="left">
			    <input type="submit" value=" 查 询 " class="button5">
			</td>
		</tr>
		</table>
		</s:form>
		
			<table width="98%" border="0" cellspacing="1" cellpadding="2"  align="center" class="list" >
				<tr class="head">
					<td class="libiaobg" nowrap>序号</td> 
					<td class="libiaobg" nowrap>订单编号</td>
					<td class="libiaobg" nowrap>下单时间</td>
					<td class="libiaobg" nowrap>地址</td>
					<td class="libiaobg" nowrap>联系电话</td>
					<td class="libiaobg" nowrap>收货人姓名</td>
					<td class="libiaobg" nowrap>订单状态</td>
					<td class="libiaobg" nowrap width="4">操作</td>
				<%
				  int looprow = 0;
				%>
				<s:iterator value="backOrderList" var="rs"> 
					<tr class='<%=(looprow%2==0)?"row":"altRow"%>'>
						<td width="4" class="zuo">
						   <%=looprow+1%>
						</td>
						<td class="zuo">
						    <s:property value="id"></s:property>
					    </td>
						<td class="zuo">
						   <div id="spic">
						        <s:date name="createTime" format="yyyy-MM-dd" />
						    </div>
						</td>
						<td class="zuo"><s:property value="detailAddress"></s:property></td>
						<td class="zuo"><s:property value="drawerNumber"></s:property></td>
						<td class="zuo"><s:property value="drawerName"></s:property></td>
						<td class="zuo" width="60px" align="center">
						    <s:if test="orderStatus=='WFK'">
						                  未付款 
						    </s:if>
						    <s:elseif test="orderStatus=='YFK'">
                                                                                  已付款
						    </s:elseif>
						     <s:elseif test="orderStatus=='YQX'">
                                                                                  已取消
						    </s:elseif>
						</td>
						<td class="zuo">&nbsp;
						     <s:if test="orderStatus=='YQX'">
                                <input disabled="disabled" type="button" value="不处理" class="button2" onclick="doRedirect('toUpdateProductSupply?productId=<s:property value="#item.productId"></s:property>')"></input>&nbsp;                            
						    </s:if>
						    <s:elseif test="orderStatus=='WFK'">
                                <input type="button" value="处理" class="button2" onclick="alert('开发中....');"></input>&nbsp;                            
						    </s:elseif>
						     <s:elseif test="orderStatus!='YQX'">
                                <input type="button" value="处理123" class="button2" onclick="alert('开发中....');"></input>&nbsp;                            
						    </s:elseif>
						</td>
					</tr>
				<%
				looprow ++;
				%>
				</s:iterator>   
			</table>
			<s:form action="findBackOrderList.action">
			<table width="98%" align="right" style="border-top:1px #6cbc48 solid;">
				<tr>
					<td>					       
						<s:property value="#request.pageBar" escape="false"/>  
   					</td>
				</tr>
			</table>
			</s:form>	
		    
	</body>
	
</html>