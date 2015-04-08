<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>担保管理</title>
<!-- <link rel="stylesheet" rev="stylesheet" href="../../css/common.css" type="text/css" /> -->

<form action="listAllVoucher" method="post" name="myform" id="myform">

<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">担保列表</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="17%" class="color_h">
            	申请人名称<input type="text" name="supplierkey" id="supplierKey" value="<s:property value="#request.supplierkey"/>" size="15">
		  	</td>
		  	
            <td width="17%" class="color_h">
            	担保企业名称<input type="text" name="voucherkey" id="voucherkey" value="<s:property value="#request.voucherkey"/>" size="15">
            </td>
            <td width="10%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listAllVoucher';myform.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                   		<td height="28" align="center" bgcolor="#e8f5fb"><label><input type="checkbox" name="allSelect" id="allSelect" class="cbborder"></input>编号</label></td>
						<td align="center" bgcolor="#e8f5fb" width="200">申请人名称</td>
						<td align="center" bgcolor="#e8f5fb" width="300">供应产品</td>
						<td align="center" bgcolor="#e8f5fb">担保企业</td> 
						<td align="center" bgcolor="#e8f5fb">担保状态</td>                   		
                  </tr>
				 
				  	<s:iterator value="searchlist" id="list">	
				  	<tr>	
				  		<td height="60" width="55"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<s:property value="supplierId" />"><s:property value="supplierId" /></label></td>
						<td>&nbsp;<a href="<%=cp%>/admin/supplier/getSupplierById?id=<s:property value="supplierId" />" target="_blank"><s:property value="fullName" /></a></td>		
						<td style="padding:0 10px;"><s:property value="productType" /></td>
						<td>&nbsp;<s:property value="locked" /></td>	 
						<td align="center" width="67">
							<s:if test="vouchState == 'None'"><font color="gray">未同意</font></s:if>
							<s:elseif test="vouchState == 'Agree'"><FONT color="red">同意担保</font></s:elseif>
							<s:elseif test="vouchState == 'Disagree'"><FONT color="blue">拒绝担保</font></s:elseif>
						</td>		
				  	</tr>				  	
				  	</s:iterator>
					</table>
					
					<table width="790" border="0" cellspacing="1" cellpadding="2" align="center">
						<s:property value="#request.pageBar" escape="false"/>
					</table>
		</td>
	</tr>
</table>

</form>


