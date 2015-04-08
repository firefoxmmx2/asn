<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>担保管理</title>
<link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" />
</head>
<body>

<table width="98%" border="0" align="center" cellpadding="10" cellspacing="0">
	<tr><td height="2px" ></td></tr>
	<tr><td class="daohang" width="98%">身份担保列表</td></tr>
</table>

<form action="listAllVoucher" method="post" name="myform" id="myform">
<table class="list" width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
	<tr>
		<td colspan="6"><table>
			<tr>
				<td>申请人名称<input type="text" name="supplierkey" id="supplierKey" value="<s:property value="#request.supplierkey"/>" size="15"></td>
				<td>担保企业名称<input type="text" name="voucherkey" id="voucherkey" value="<s:property value="#request.voucherkey"/>" size="15"></td>
				<td><input type="submit" value="查 询"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr class="head">
		<td class="libiaobg" nowrap><label><input type="checkbox" name="allSelect" id="allSelect" class="cbborder"></input>编号</label></td>
		<td class="libiaobg" width="200" nowrap>供应商名称</td>
		<td class="libiaobg" width="300" nowrap>供应产品</td>
		<td class="libiaobg" nowrap>担保企业</td> 
		<td class="libiaobg" nowrap>担保状态</td>		
  	</tr>
  	<% int i=1; %>
  	<s:iterator value="searchlist" id="list">	
  	<tr class="<%=(i%2!=0)?"row":"altRow"%>">	
  		<td><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<s:property value="supplierId" />"><s:property value="supplierId" /></label></td>
		<td class="zuo"><a href="/asn/front/supplier/searchSupplierInfo?supplierid=<s:property value="supplierId" />" target="_blank"><s:property value="fullName" /></a></td>		
		<td class="zuo"><s:property value="productType" /></td>
		<td class="zuo"><s:property value="locked" /></td>	 
		<td class="zuo" align="center">
			<s:if test="vouchState == 'None'"><font color="gray">未同意</font></s:if>
			<s:elseif test="vouchState == 'Agree'"><FONT color="red">同意担保</font></s:elseif>
			<s:elseif test="vouchState == 'Disagree'"><FONT color="blue">拒绝担保</font></s:elseif>
		</td>		
  	</tr>
  	<% i++; %>
  	</s:iterator>

</table>

<table width="98%" border="0" cellspacing="1" cellpadding="2" align="center" style="border-top:1px #6cbc48 solid;">
	<s:property value="#request.pageBar" escape="false"/>
</table>

</form>
</body>
</html>