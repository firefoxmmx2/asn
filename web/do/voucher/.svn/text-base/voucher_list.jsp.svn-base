<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>担保管理</title>
<script type="text/javascript">
	function voucher(state,id){
		if(confirm("确定执行这个操作吗！"))
		window.location.href="updVouchState?vouch="+state+"&supplierId="+id;
	}
</script>
</head>
<body>

<form action="listVoucher" method="post" name="myform" id="myform">
<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">身份担保列表</td>
   	</tr> 	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                   		<td height="28" align="center" width="60" bgcolor="#e8f5fb"><label><input type="checkbox" name="allSelect" id="allSelect" class="cbborder"></input>编号</label></td>
						<td bgcolor="#e8f5fb" align="center">申请人名称</td>
						<td bgcolor="#e8f5fb" align="center">供应产品</td>
						<td bgcolor="#e8f5fb" align="center" width="70">担保状态</td>			
						<td bgcolor="#e8f5fb" align="center" width="95">操作</td>                   
                  </tr>
				 
				  	<s:iterator value="searchlist" id="list">	
				  	<tr>	
				  		<td height="40"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<s:property value="supplierId" />"><s:property value="supplierId" /></label></td>
						<td style="padding:0 10px;"><a href="/asn/front/supplier/searchSupplierInfo?supplierid=<s:property value="supplierId" />" target="_blank"><s:property value="fullName" /></a></td>		
						<td style="padding:0 10px;"><s:property value="productType" /></td>	 
						<td align="center">
							<s:if test="vouchState == 'None'"><font color="gray">未同意</font></s:if>
							<s:elseif test="vouchState == 'Agree'"><FONT color="red">同意担保</font></s:elseif>
							<s:elseif test="vouchState == 'Disagree'"><FONT color="blue">拒绝担保</font></s:elseif>
						</td>		 
						<td align="center">
							<s:if test="vouchState == 'None' || vouchState == 'Disagree'"><input type="button" value="担保" class="sm-buttom2-2" onclick="voucher('agree','<s:property value="supplierId" />')" /> </s:if>
							<s:elseif test="vouchState == 'Agree'"><input type="button" value="拒绝担保" class="sm-buttom4-2" onclick="voucher('dis','<s:property value="supplierId" />')" /></s:elseif>
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
</body>
</html>