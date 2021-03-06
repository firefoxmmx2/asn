<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pubsvrUrl = "http://pubsvr.aiecp.com/asn"; %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.bornsoft.asn.bean.order.Order" %>
<%@page import="com.bornsoft.asn.bean.order.OrderItem" %>
<%@page import="com.bornsoft.asn.service.member.MemberService,com.bornsoft.asn.bean.member.Member"%>
<%@page import="com.bornsoft.asn.service.order.OrderService" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/css/comdo.css" type="text/css" />

<style>
<!--
.orderRightLine{border-right:1px #e4e4e4 solid;}
.orderTop1{vertical-align:top;padding-top:10px;}
.orderLine22{border-bottom: 1px #e4e4e4 solid;}
-->
</style>
<script type="text/javascript">
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

function delSelectBox(url){
	var total=document.getElementById("total").value;
	var ids="";
	for(i=1;i<=total;i++){
		var idCheckBox = document.getElementById("checkBox"+i);
		if(idCheckBox.checked){
			ids+=idCheckBox.value+",";
		}
	}
	if(ids==""){
		alert("请选择要划账的订单");
		return;
	}
	var r=confirm("确认是对这些订单划账吗？");
	if(r==true){
		window.location.href=url+"?ids="+ids;
	}
}

function baoBiaoSelectBox(url){
	var total=document.getElementById("total").value;
	var ids="";
	for(i=1;i<=total;i++){
		var idCheckBox = document.getElementById("checkBox"+i);
		if(idCheckBox.checked){
			ids+=idCheckBox.value+",";
		}
	}
	if(ids==""){
		alert("请选择要输出报表的订单");
		return;
	}
	var r=confirm("确认是输出这些订单的报表吗？");
	if(r==true){
		window.location.href=url+"?ids="+ids;
	}
}

function delSelect(url,id){  
	var r=confirm("确认要对该订单划账吗？");
	if(r==true){
		window.location.href=url+"?ids="+id+",";
	}
}
</script>

<table align="center" width="792" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">划账管理</td>
		</tr>      
	</table>
<s:form theme="simple" name="formSearch" method="post" action="toOrderList">   
<table align="center" width="792" height="51" cellpadding="0" cellspacing="0" style="margin-top: 5px;">
    
	<tr>
		<td height="51">
	 	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td class="color_h" height="30" align="right">订单号：</td>
            <td><input name="orderId" id="orderId" size="20" value="${orderId}" /></td>  
          
            <td class="color_h" height="30" width="100" align="right">商家账号：</td>
            <td><input name="ssoAccount" id="ssoAccount" size="20" value="${ssoAccount}" /></td>
            
            <td class="color_h" height="30" width="100" align="right">商家名称：</td>
            <td><input name="fullName" id="fullName" size="20" value="${fullName}" /></td>
		  	
           </tr>
           
           <tr>
            <td class="color_h" align="right" width="100">商家邮箱：</td>
            <td><input name="email" id="email" value="${email}"/></td>
                    
            <td class="color_h" height="30" width="100" align="right">商家证件号：</td>
            <td><input name="certId" id="certId" size="20" value="${certId}"/></td>	
            
            <td class="color_h" align="right" width="100">是否已划账：</td>
            <td>  
            	<s:if test='#request.isPayed=="Y"'>  
            	<input type="radio" name="isPayed" value="N" onclick="this.form.submit();"/> 否
            	<input type="radio" name="isPayed" checked="checked" value="Y"/> 是
            	</s:if>
            	<s:elseif test='#request.isPayed=="N"'>  
            	<input type="radio" name="isPayed" checked="checked"  value="N"/> 否
            	<input type="radio" name="isPayed" value="Y" onclick="this.form.submit();"/> 是  
            	</s:elseif>
            </td>	  	
           </tr>
           
           <tr>
           	            
            <td class="color_h" height="30" align="right">买家名称：</td>
            <td><input name="drawerName" id="drawerName" size="20" value="${drawerName}" /></td>  
           
            <td class="color_h" height="30" width="100" align="right">买家电话：</td>
            <td><input name="mobileNumber" id="mobileNumber" size="20" value="${mobileNumber}"/></td>
            
            <td class="color_h" height="30" align="right">收货地址：</td>
            <td><input name="detailAddress" id="detailAddress" size="30" value="${detailAddress}"/></td>   
           </tr>         
           <tr>         
            <td align="right"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="formSearch.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table> 
		</td>  
	</tr>	
</table>
</s:form>	
<table width="792" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; background: url('<%=request.getContextPath()%>/image/bg2.png') repeat-x;">
    <tr>
		<td height="31" width="80" align="center">图片</td>    
		<td align="center" width="170">货品名称</td> 
		<td align="center" width="90">单价（元）</td>
		<td align="center" width="50">数量</td>
		<td align="center" width="95">买家名称</td>  
		<td align="center" width="95">商家名称</td>
		<td align="center" width="110">应付款</td>		
		<td align="center" width="100">&nbsp;</td>                     
    </tr> 	
</table>


<% 
	List<Order> list = (List<Order>)request.getAttribute("orderList");
	for(int i=0; i<list.size(); i++){
		Order order = list.get(i);
%>
<table width="792" border="0" cellspacing="0" cellpadding="0" style="border: 1px #cce2ff solid;margin-top:8px;color:#333333;">
	<tr>
		<td height="28" colspan="5" style="padding:1px;"><table width="100%" height="50" bgcolor="#e8f2ff" border="0" cellspacing="0" cellpadding="0" style="padding-left:20px;">
				<tr><td><input type="checkbox" id="checkBox<%=i+1%>" value="<%=order.getId()%>"></input></td>
					<td width="160">订单编号：<font color="#ff5600"><%=order.getId() %></font></td>
					<td width="190">下单时间：<%=new SimpleDateFormat("yyyy-MM-dd HH:ss:mm").format(order.getCreateTime()) %></td>
					<td width="180">买家电话：<%=order.getDrawerNumber() %></td>
					<td width="252">买家地址：<%=order.getDetailAddress() %></td>
				</tr>
				<%
					Member member = MemberService.getMember(order.getSupplierId());
					if(member != null){
				%>
				<tr>
					<td>&nbsp;&nbsp;</td>
					<td>商家账号：<%=member.getSsoAccount() %></td>
					<td>商家名称：<%=member.getFullName() %></td>
					<td>商家邮箱：<%=member.getEmail() %></td>					
					<td>商家证件号：<%=member.getCertId() %></td>
				</tr>
				<% } %>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="orderRightLine" width="390"><table border="0" cellspacing="0" cellpadding="0">
			<% 	
				List<OrderItem> items= OrderService.findOrderItemByOrderId(order.getId());
				for(int j=0; j<items.size(); j++){ 
				OrderItem item = items.get(j);	
			%>
			<tr >
				<td height="80" width="80" class="orderLine22" align="center"><img src="<%=request.getContextPath()%><%=item.getPicPath() %>" width="60" height="60" /></td>
				<td width="170" class="orderLine22"><a target="_blank" href="<%=pubsvrUrl%>/front/mall/product/displayDetailProduct.action?productId=<%=item.getItemProductId() %>"><%=item.getItemProductName()%></a></td>
				<td width="90" class="orderLine22" align="center"><%=Calculator.keepTwoDecimal(item.getProPrice()) %></td>
				<td width="50" class="orderLine22" align="center"><%=item.getQuantity() %></td>
			</tr>	
				<% } %>	  
			</table>
		</td>
		<td width="95" align="center" class="orderRightLine orderTop1"><%=order.getDrawerName()%></td>
		<td width="97" align="center" class="orderRightLine orderTop1">
			<% Member supp = MemberService.getMember(order.getSupplierId()); %>			
			<a target="_blank" href="${pageContext.request.contextPath }/front/shop/supplierShopSy?supplierid=<%=order.getSupplierId()%>">
			<%=supp.getFullName() %>
			</a>
			<br />			
			<%if(supp.getQq() != null){ %>			
			<a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%=supp.getQq()%>&Exe=QQ&Site=望龙门—农业综合服务网络平台&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=3:<%=supp.getQq()%>:3 alt="和我联系"></a>
			<% }%>
		</td>
		<td width="110" align="center" class="orderRightLine orderTop1" style="color:#ff5600; ">
			<strong><%=Calculator.keepTwoDecimal(order.getTotalAmount().doubleValue()) %></strong><br>
			<font color="#666666">（含运费：<%=Calculator.keepTwoDecimal(order.getPostFee().doubleValue()) %>）</font>
		</td>
		<td width="100" align="center" class="orderRightLine orderTop1" style="color:#ff5600; ">
			<%if(order.getIsPayed().equals("Y")){ %>
	        	 已划账
	        <%} %>
	        <%if(order.getIsPayed().equals("N")){%>    
	        <input type="button" value="划账" onclick="delSelect('huaZhang','<%=order.getId() %>')"/>
			<input type="button" value="财务报表" onclick="window.location.href='downloadExcel?ids=<%=order.getId() %>,'"/>
	        <%} %>
		</td>
	</tr>
</table>
<% } %>
<s:if test='#request.isPayed=="N"'>   
<div><input id="total" type="text" value='<%=list.size()%>' style="display: none;"></input></div>
<table>
	<tr>
		<td colspan="5"><input type="checkbox" id="allSelect" value="selectAll" onclick="checkAll()">全选</input>
		&nbsp;&nbsp;
		<input type="button" value="划账" onclick="delSelectBox('huaZhang')"></input>
		<input type="button" value="财务报表" onclick="baoBiaoSelectBox('downloadExcel')"></input>
		</td>   
	</tr>
</table>  
</s:if>
<s:form theme="simple" method="post" action="toOrderList">  
<table width="790" height="40" border="0" cellspacing="1" cellpadding="2" style="text-align:right;">
	<tr>
		<td><s:property value="#request.pageBar" escape="false"/></td>
	</tr>
</table>
<input type="hidden" name="orderId" value="${orderId}"></input>
<input type="hidden" name="ssoAccount" value="${ssoAccount}"></input>
<input type="hidden" name="fullName" value="${fullName}"></input>
<input type="hidden" name="email" value="${email}"></input>
<input type="hidden" name="certId" value="${certId}"></input>
<input type="hidden" name="isPayed" value="${isPayed}"></input>
<input type="hidden" name="drawerName" value="${drawerName}"></input>
<input type="hidden" name="mobileNumber" value="${mobileNumber}"></input>
<input type="hidden" name="detailAddress" value="${detailAddress}"></input>
</s:form>
