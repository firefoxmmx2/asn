<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%
	String cp=request.getContextPath();
%>       
<%@ page import="com.bornsoft.asn.bean.bank.BankInfo" %>
<%@ page import="com.bornsoft.asn.bean.supplier.Supplier" %>
<%@ page import="com.bornsoft.asn.service.idmaker.IdMakerService"%>
<%@ page import="com.bornsoft.asn.bean.member.Member"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.utils.common.Str"%>
<%
	// Get a new id
	long licenseid=IdMakerService.newId("licenseID");	
%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改供应商资料</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<link rel="stylesheet" rev="stylesheet" href="../../css/comdo.css" type="text/css" />
<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<script type="text/javascript">	
		//初始化地区组件
		geoloc.debugOn();
		$(document).ready(function(){
			geoloc.init("divArea","- 不限省市 -", "- 不限地州市 -", "- 不限区县 -", "area");
		});
		
		// 取地区选择结果，如果没有选择，结果为null；如果选择，数据形式为：310101|黄浦区
		function showSelection(){
			var sel=geoloc.getSelection("divArea");
			if(sel==null){
				alert("没有选择");
			} else {
				alert(sel);
			}
		}


	       function chooseAddress(){
             	var rules=new Array(
         				"area:地区|required",
         				"detailAddress:详细地址|required",
         				"detailAddress:详细地址|minlength|8",
         				"zipCode:邮政编码|required",
         				"zipCode:邮政编码|numeric",
         				"zipCode|mask|member.zip_mask",			
         				"drawerNumber:电话号|required",
         				"drawerName:联系人|required"
         			);
         			// 遮罩规则的详细定义
         			yav.addMask('member.zip_mask', '      ', '1234567890');		
         			// 输入提示
         			yav.addHelp("zipCode", "邮政编码固定为6位数字");
         			// 输入时验证
         			yav.init('form1', rules);
         			// 提交前验证
         			$("#form1").submit(function () {
         				  return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
         			});
        }

        
		
</script>
<style type="text/css">
  .red{ color:#FF0000;}
</style>
</head>
<body>

		
		<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="<%=request.getContextPath()%>/image/comdo/pen.png"></td>
			<td width="737">
			         请认真对待你的地址资料
			</td>
		</tr>
	</table>
	<table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
		<tr>
			<td width="5">&nbsp;</td>
			<td width="785" class="sm-title">收货地址管理</td>			
		</tr>
	</table>
	
	<table align="center" id="toTbl" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">
		<tr>
			<td width="10%" height="30" align="center" bgcolor="#e8f5fb">收货人</td>
            <td width="15%" align="center" bgcolor="#e8f5fb">所在地区</td>
            <td width="35%" align="center" bgcolor="#e8f5fb">街道地址</td>
            <td width="10%" align="center" bgcolor="#e8f5fb">邮编</td>
            <td width="15%" align="center" bgcolor="#e8f5fb">电话/手机</td>
            <td width="10%" align="center" bgcolor="#e8f5fb">操作</td>		
		</tr>
		
        <s:iterator value="addressesInfo" id="list">
	        <tr>
	            <td height="25" align="center">
	                <s:property value="drawerName"/>
	            </td>
	            <td align="center">
	                <s:property value="city"/>
	            </td>
	            <td align="center">
	                <s:property value="detailAddress"/>
	            </td>
	            <td align="center">
	                <s:property value="zipCode"/>
	            </td>
	            <td align="center">
	                <s:property value="drawerNumber"/>
	                <s:if test="mobileNumber!=null">
	                    ,<s:property value="mobileNumber"/>
	                </s:if>
	            </td>
	            <td align="center">
	                 <a href="<%=request.getContextPath() %>/do/addressManager/findAddressById.action?addId=<s:property value="id"/>">修改|</a>
	                 <a href="<%=request.getContextPath() %>/do/addressManager/deleteAddressInfo.action?addId=<s:property value="id"/>">删除</a>
	            </td>
	        </tr>
        </s:iterator>	
		
		<!-- 
		<tr>
			<td colspan="6" height="40" style="text-align:right;">
			<input type="button" class="sm-buttom4" value="新增许可证" onclick="addRow()"></td>
		</tr>
		 -->
	</table>
	
	<form id="form1" name="form1" method="post" action="saveAddressInfo.action"  enctype="multipart/form-data" onsubmit="return chooseAddress();">
	
		<table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="785" class="sm-title">新增收货地址 </td>			
			</tr>
		</table>
	
		<table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">		
			
			<tr>
				<td height="30" width="90" align="right">收货人姓名：<em class="red">*</em>&nbsp;</td>
	            <td width="520">&nbsp;
	               <input type="text" name="drawerName" />
				</td>
				<td>
				   <span id="errorsDiv_drawerName"></span>
				</td>       	
			</tr>
			
			<tr>
				<td height="30" align="right">所在地区：<em class="red">*</em>&nbsp;</td>
	            <td>&nbsp;
	                 <input type="hidden" name="area" id="area"/>
		             <span id="divArea"></span>
	            </td>
	            <td>
				    <span id="errorsDiv_area"></span>
				</td>           	
			</tr>
					
			<tr>
				<td height="50" align="right">街道地址：<em class="red">*</em>&nbsp;</td>
	            <td>&nbsp;
	               <textarea cols="60" rows="3" name="detailAddress"></textarea>
	               <br>
	               <span>（不需要重复填写省/市/区）</span>
	            </td>
	            <td>
				   <span id="errorsDiv_detailAddress"></span>
				</td>           	
			</tr>
			
			<tr>
				<td height="30" width="20" align="right">邮政编码：<em class="red">*</em>&nbsp; </td>
	            <td>&nbsp;
	                <input type="text" name="zipCode" size="20" id="storeName"/>
	            </td>
	            <td>
				    <span id="errorsDiv_zipCode"></span>
				</td>          	
			</tr>
			
			<tr>
				<td height="30" width="20" align="right">电话号码：<em class="red">*</em>&nbsp; </td>
	            <td>&nbsp;
	                <input type="text" name="drawerNumber" size="20"/>
	            </td>
	            <td>
				    <span id="errorsDiv_drawerNumber"></span> 
				</td>           	
			</tr>
			
			<tr>
				<td height="30" width="20" align="right">移动号码：<em class="red">*</em>&nbsp; </td>
	            <td>&nbsp;
	                <input type="text" name="mobileNumber" size="20"/>
	            </td>
	            <td>
				    <!--<span id="errorsDiv_drawerNumber"></span>-->
				    &nbsp; 
				</td>           	
			</tr>
			
		</table>

		<table align="center" width="790"cellpadding="0" cellspacing="0" >
		<!--
		   <tr>
		      <td align="center">
		                         最多保存5个有效地址
		      </td>
		   </tr>
		   -->		
			<tr>			
	            <td height="50" align="center">
	                <input type="submit" class="sm-submit8" value="保存">
	            </td>          	
			</tr>
		</table>
	
</form>		
</body>
</html>
 