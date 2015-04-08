<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
	String cp=request.getContextPath();
%>   
<%@ page import="com.bornsoft.asn.service.idmaker.IdMakerService"%>
<%
	// Get a new id
	long bankinfoid=IdMakerService.newId("bankinfoID");
	long licenseid=IdMakerService.newId("licenseID");	
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>供应机构资料</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<style type="text/css">
<!--
.radiocss{border:none;background-color:#e4e4e4;}
body{font-size: 12px; font-family: "新宋体"; padding: 0;margin: 0;}
.divtitle{height:25px; background-color:#e4e4e4; font-weight:700; vertical-align:middle;line-height:25px;padding-left:10px;}
-->
</style>
<script type="text/javascript">	
	function onOpen(){
		window.open("/asn/do/productType/getAllType?show=2","newwindow","height=500, width=650, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no");
	}

	// 设置表单验证
	$(document).ready(function(){
		// 定义规则，规则表参见 http://yav.sourceforge.net/en/validationrules.html
		var rules=new Array(
			"supplier.productType:拟供品种|required",
			"supplier.bizDomain:经营范围|required",
			"bankinfo.bankName:收款银行名|required",
			"bankinfo.account:收款帐号|required",
			"bankinfo.account:收款帐号|numeric",
			"bankinfo.account|mask|bankinfo.account_mask",			
			"bankinfo.ownerName:开户名称|required"
			
		);
		// 遮罩规则的详细定义
		yav.addMask('bankinfo.account_mask', '                    ', '1234567890');
		// 输入提示
		yav.addHelp("bankinfo.account", "收款帐号为0~9的数字");
		// 输入时验证
		yav.init('form1', rules);
		// 提交前验证
		$("#form1").submit(function () {
			  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
		});
	});
</script>
<LINK href="../../css/regProcess.css" type=text/css rel=stylesheet> 
</head>
<body>
<!--
		<table width="760" class="tbtitle" align="center" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="50">供应商申请与审批流程</td>
			</tr>
		</table>-->
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr><td height="4px" ></td></tr>
		<tr><td class="daohang" width="98%" height="30">供应商申请与审批流程</td></tr>
		<tr><td height="4px" ></td></tr>
		</table>
		
		<table width="760" class="tbl" style="margin-left:10px;margin-top:10px;" height="23" align="center" cellpadding="0" cellspacing="0"  style="margin-top:10px;">
			<tr align="center">
				<td class="pbyello"><span class="spw">1. 阅读规定</span>	<span class="spgray">&nbsp;</span></td>
				<td class="pbg1"><span class="spw">2. 填报资料</span><span class="spg">&nbsp;</span></td>				
				<td class="pbgray"><span class="spw">3. 相关人员审核</span><span class="spg">&nbsp;</span></td>
				<td class="pbgray"><span class="spw">4. 完成</span>	<span class="spgrayend">&nbsp;</span></td>
			</tr>
		</table>
       
		<form id="form1" name="form1" method="post" action="/asn/do/supplier/enrollGuarantee" enctype="multipart/form-data" >
		  <input type="hidden" name="supplier.supplierId" id="supplierId" value="">
          <input type="hidden" name="bankinfo.bankInfoid" id="bankInfoid" value="<%=bankinfoid %>">
          <table width="98%" align="center" style="margin-top:20px;"  cellpadding="0" cellspacing="0">
            <tr>
              <td>
              	<p class="divtitle">行业资料</p>
              	
                <table width="100%" border="0" style="padding-left:10px;" cellspacing="0" cellpadding="2">
                  <tr>
                    <td><font color="red">*</font>行政审批许可证件：</td>
                    <td>
                      <table width="100%" border="0" cellspacing="1" cellpadding="2" id="toTbl">
                      <tr>
                        <td width="18%" height="20" align="center" bgcolor="#cccccc">证件名称</td>
                        <td width="33%" align="center" bgcolor="#cccccc">许可单位</td>
                        <td width="15%" align="center" bgcolor="#cccccc">编号</td>
                        <td width="33%" align="center" bgcolor="#cccccc">扫描件</td>
                        <td width="18%" align="center" bgcolor="#cccccc">操作</td>
                        </tr>
                      <tr>
                        <td><input type="hidden" name="licensebean[0].licenseid" id="licenseid" value="<%=licenseid %>">
                        <input name="licensebean[0].certName" type="text" id="certName" size="10" /></td>
                        <td><input name="licensebean[0].permitUnit" type="text" id="permitUnit" size="20" /></td>
                        <td><input name="licensebean[0].certNumber" type="text" id="certNumber" size="10" /></td>
                        <td><input type="file" name="licensebean[0].certPhoto" size="13" id="certPhoto" /></td>
                        <td><input type="button" value="删除" class="button2"/></td>
                        </tr>
                       
                      <tr>
                      	<td><input type="button" value="新增许可证" onclick="addRow()" class="button5"/></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  
                  <tr>
                    <td nowrap="nowrap"><font color="red">*</font>拟供品种：</td>
                    <td><p><span id="tocheckboxdiv"></span>  <span id="errorsDiv_supplier.productType"></span></p>
                        <p><input type="button" value="新增品种" onclick="onOpen()" class="button5"/></p>
                        
                    </td>
                  </tr>
                  
                   <tr valign="top">
                    <td width="80"><font color="red">*</font>经营范围：</td>
                    <td><textarea name="supplier.bizDomain" id="bizDomain" cols="59" rows="4"></textarea>
                    	<span id="errorsDiv_supplier.bizDomain"></span>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>网店名称：</td>
                    <td><input type="text" name="supplier.storeName" id="storeName" size="70"/></td>
                  </tr>
				</table>
				
				
				
                <p class="divtitle">银行资料</p>
                <table width="100%" border="0" cellspacing="0" style="padding-left:10px;" cellpadding="2">
                  <tr>
                    <td width="80"><font color="red">*</font>收款银行名：</td>
                    <td><input type="text" name="bankinfo.bankName" id="bankName" size="70"/><span id="errorsDiv_bankinfo.bankName"></span></td>
                  </tr>
                  
                  <tr>
                    <td><font color="red">*</font>收款帐号：</td>
                    <td><input type="text" name="bankinfo.account" id="account" size="70"/><span id="errorsDiv_bankinfo.account"></span></td>
                  </tr>
                  
                  <tr>
                    <td><font color="red">*</font>开户人名称：</td>
                    <td><input type="text" name="bankinfo.ownerName" id="ownerName" size="70"/><span id="errorsDiv_bankinfo.ownerName"></span></td>
                  </tr>                 
                </table>
                
                 <table width="60%" bgcolor="#e4e4e4" style="border:1px #CCCCCC solid; ">
                	<tr>
                    <td nowrap="nowrap" width="120"><strong>供应商经营状态：</strong></td>
                    <td>
                    	<label for="runState_1"><input type="radio" name="supplier.runState" id="runState_1" value="Opening" class="radiocss" checked />正在营业</label>
                    	<label for="runState_2"><input type="radio" name="supplier.runState" id="runState_2" value="Suspend" class="radiocss" />暂停营业</label>
                    	<label for="runState_3"><input type="radio" name="supplier.runState" id="runState_3" value="Closed" class="radiocss" />清算退出</label>
                    </td>
                  </tr>  
                </table>
				</td>
            </tr>
          </table>     
          
          
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
			
			<tr>
				<td height="40" align="center"><input type="submit" value="填写OK了，请提交" class="button7"/></td>
			</tr>
			</table>
		              
          </form>
<br><br>
</body>
</html>
 <script type="text/javascript">
 		var count = 2;//新增的起始行数
		function addRow(){
			var numRows = $("#toTbl")[0].rows.length-1 //行数
			var newTr = $("#toTbl")[0].insertRow(numRows); //添加一行 
			//##for test
			newTr.id=count;
			//添加一列 
			var newTd0 = newTr.insertCell(0); 
			var newTd1 = newTr.insertCell(1); 
			var newTd2 = newTr.insertCell(2);  
			var newTd3 = newTr.insertCell(3); 
			var newTd4 = newTr.insertCell(4);   
			//设置列内容和属性 
			newTd0.innerHTML = "<input type='hidden' name='licensebean["+count+"].licenseid' id='licenseid' value='<%=licenseid %>'><input name='licensebean["+count+"].certName' type='text' id='certName' size='10'value='"+count+"' />";
			newTd1.innerHTML = "<input name='licensebean["+count+"].permitUnit' type='text' id='permitUnit' size='20' />";
			newTd2.innerHTML = "<input name='licensebean["+count+"].certNumber' type='text' id='certNumber' size='10' />";
			newTd3.innerHTML = "<input type='file' name='licensebean["+count+"].certPhoto' size='13' id='certPhoto' />";
			newTd4.innerHTML = "<input type='button' value='删除' onclick='delRow("+count+")' />";
			count++;
		}
	  function delRow(numRows){		 
			for(i=0;i<$("#toTbl")[0].rows.length;i++){	
				if($("#toTbl")[0].rows[i].id == numRows){
					$("#toTbl")[0].deleteRow(i);
				} 
			}
		}
</script>