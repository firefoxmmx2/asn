<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String cp=request.getContextPath();
	String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>       
<%@ page import="com.bornsoft.asn.bean.bank.BankInfo" %>
<%@ page import="com.bornsoft.asn.bean.supplier.Supplier" %>
<%@ page import="com.bornsoft.asn.service.idmaker.IdMakerService"%>
<%@ page import="com.bornsoft.asn.bean.member.Member"%>
<%@ page import="com.bornsoft.asn.service.member.MemberService" %>
<%@ page import="com.bornsoft.asn.utils.common.Str"%>
<%@page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType" %> 
<%
	// Get a new id
	long licenseid=IdMakerService.newId("licenseID");	
%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改供应商资料</title>


<!--<script type="text/javascript" src="<%=cp%>/js/open-jquery.js"></script>-->
<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/opendiv.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<!-- 编辑器js -->
<script type="text/javascript" charset="utf-8" src="<%=cp %>/kindeditor/kindeditor.js"></script>
<!-- 编辑器js -->

<link rel="stylesheet" rev="stylesheet" href="<%=cp%>/css/comdo.css" type="text/css" />
<LINK href="<%=cp%>/js/yav/yav-style.css" type=text/css rel=stylesheet>
<SCRIPT src="<%=cp%>/js/yav/yav.js"></SCRIPT>
<SCRIPT src="<%=cp%>/js/yav/yav-config.js"></SCRIPT>
<style type="text/css">
a{font-weight:100;}
.radiocss{border:none;}
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
			if($("#content1")[0].value.length > 10000){
				$("#errorsDiv_content1")[0].innerHTML = "<font color=red>请在规定字数范围内填写</font>";
				return false;
			}else{
				return yav.performCheck("form1", rules, "inline");  // classic 或者 inline
			}
		});
	});

	function delLicense(id){
		location.href="/asn/do/supplier/delLicense?licenseid="+id;
	}

	// 编辑器js
	KE.show({
		id : 'content1',
		imageUploadJson : '<%=cp %>/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=cp %>/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function(id) {
			KE.event.ctrl(document, 13, function() {
				KE.util.setData(id);
				document.forms['form1'].submit();
			});
			KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
				KE.util.setData(id);
				document.forms['form1'].submit();
			});
		}
	});	
	// 编辑器js
	
	function getcharNumber(){
		var dqlength = $("#content1")[0].value.length;
		if(dqlength >10000){
			alert("填写字数超长,请控制在10000字以内");
			return false;
		}else{
			alert("当前字数："+dqlength+",  可填字数："+(10000-dqlength));
			return false;
		}
	}
</script>

       <% 
       		Supplier supplier = (Supplier)request.getAttribute("supplier");
       		BankInfo bankinfo = (BankInfo)request.getAttribute("bankinfo"); 
       		Member vouch=MemberService.getMember(new Long(supplier.getVoucherId()));
       		String vouchName=(vouch==null) ? "" : Str.get(vouch.getFullName());
		 	String notice=null;
		 	switch(supplier.getApproveState()){        
		 	case None:
		 		notice="你的供应商资料不全，需填写完整后并经过审核后才能以供应商身份进行操作。";
		 		break; 
		 	case ManualVerify:
		 		notice="你的供应商资料正在等待审核，在审核结果出来之前你还可以修改。";
		 		break;
		 	case Completed:
		 		notice="你的供应商资料已经审核通过。在修改之后，需要重新审核。";
		 		break;
		 	case Rejected:
		 		notice="你的供应商资料已经被驳回，必须重新修改提交。";
		 		break;
		 	}
       %>     
		        
		<table align="center" width="790" height="45" bgcolor="#fffced" cellpadding="0" cellspacing="0"  class="sm-ts">
		<tr>
			<td width="55" align="center"><img src="../../image/comdo/pen.png"></td>
			<td width="737">
			<%
         	if(notice!=null){
          	out.print(notice);                     
         	}
         	%> 
			</td>
		</tr>      
	</table>       
	            
	
	<form id="form1" name="form1" method="post" action="/asn/do/supplier/updateGuarantee" enctype="multipart/form-data">
		  <input type="hidden" name="supplier.supplierId" id="supplierId" value="">
          <input type="hidden" name="bankinfo.bankInfoid" id="bankInfoid" value="">  
	<table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
		<tr>
			<td width="5">&nbsp;</td>
			<td width="785" class="sm-title">行政审批许可证件</td>			
		</tr>
	</table>
	
	<table align="center" id="toTbl" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">
		<tr>
			<td width="15%" height="30" align="center" bgcolor="#e8f5fb">证件名称</td>
            <td width="20%" align="center" bgcolor="#e8f5fb">许可单位</td>
            <td width="15%" align="center" bgcolor="#e8f5fb">编号</td>
            <td width="10%" align="center" bgcolor="#e8f5fb">扫描件</td>
            <td width="30%" align="center" bgcolor="#e8f5fb">上传图片</td>
            <td width="10%" align="center" bgcolor="#e8f5fb">操作</td>		
		</tr>
		
		<% int num=0; %>
        <s:iterator value="querylist" id="list">
        <tr>
            <td height="25" align="center">
             	<input name="licensebean[<%=num %>].licensebeanid" type="hidden" id="licensebeanid" value="<s:property value="#list.licenseid"/>" />
             	<input name="licensebean[<%=num %>].certName" type="text" id="certName" size="14" value="<s:property value="#list.title"/>" />
            </td>
            <td align="center"><input name="licensebean[<%=num %>].permitUnit" type="text" id="permitUnit" size="20" value="<s:property value="#list.authority"/>" /></td>
            <td align="center"><input name="licensebean[<%=num %>].certNumber" type="text" id="certNumber" size="14" value="<s:property value="#list.serial"/>" /></td>
            <td align="center">
            	<a href="/asn/pic/member/supplier_<s:property value="#list.licenseid"/>.jpg" target="_blank">
                <img width="50" height="50" src="/asn/pic/member/sml_supplier_<s:property value="#list.licenseid"/>.jpg" border="0" /></a>
            </td>
            <td align="center"><input type="file" name="licensebean[<%=num %>].certPhoto" size="22" id="certPhoto" /></td>
            <td align="center"><a href="#" onclick="delLicense('<s:property value="#list.licenseid"/>')">删除</a></td>
           <% num++; %>
          </tr>
        </s:iterator>	       
		
		<tr>
			<td colspan="6" height="40" style="text-align:right;"><input type="button" class="sm-buttom4" value="新增许可证" onclick="addRow()"></td>
		</tr>
	</table>  
	
	<!-- ******************************************** -->
	<table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
		<tr>
			<td width="5">&nbsp;</td>
			<td width="785" class="sm-title">填写供应信息</td>			
		</tr>
	</table>
	
	<table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">		
		
		<tr>
			<td height="40" width="90" align="right">供应类型：</td>
            <td>
				<%
                    String strProduct = Str.get(supplier.getProductType());
                    String[] arryProduct = strProduct.split(",");
                    		
                    for(int i=0;i<arryProduct.length;i++){
                    	String pName=arryProduct[i];
                    	if(!pName.equals("")){
                %>
                <input type='checkbox' class='frmrd' name='supplier.productType' value='<%=arryProduct[i] %>' id='productType' checked='checked' style="border:none;" /><%=arryProduct[i] %>
               <% 
               			} 
                	}
               %>
                    <span id="tocheckboxdiv"></span>  <span id="errorsDiv_supplier.productType"></span>
					<!-- onclick="onOpen()"  -->
				<input type="button" class="sm-buttom4" value="新增种类" onclick="openCarSelectDiv();">
			</td>          	
		</tr>
		           
		<tr>
			<td height="135" align="right" valign="top">经营范围：</td>
            <td>&nbsp;<textarea name="supplier.bizDomain" id="bizDomain" cols="90" rows="7"><%=Str.get(supplier.getBizDomain()) %></textarea>
            <span id="errorsDiv_supplier.bizDomain"></span></td>          	
		</tr>
		
		<tr>
			<td height="40" width="90" align="right" style="color:green;">网店设置：</td>
            <td>&nbsp;
            	<table cellpadding="0" cellspacing="0" width="550">
            		<tr>
            			<td align="right" width="70">网店名称：</td>
            			<td colspan="4"><input type="text" name="supplier.storeName" size="45" id="storeName" value="<%=Str.get(supplier.getStoreName()) %>" /></td>
            		</tr>
            		
            		<tr>
            			<td align="right" height="25" valign="bottom">网店风格：</td>
            			<td colspan="4" valign="bottom" style="color: #666666;">如果你选择本站作为你的网店，请选择你的网店风格。</td>
            		</tr>
            		<tr>  
            			<td>&nbsp;</td>
            			<td align="center">
            				<a href="<%=request.getContextPath()%>/image/comdo/banner_blue.jpg" target="_blank">
            				<img src="<%=request.getContextPath()%>/image/comdo/banner_blue.jpg" width="100" border="0"></a></td>
            			<td align="center">
            				<a href="<%=request.getContextPath()%>/image/comdo/banner_green.jpg" target="_blank">	
            				<img src="<%=request.getContextPath()%>/image/comdo/banner_green.jpg" width="100" border="0"></a></td>
            			<td align="center">
            				<a href="<%=request.getContextPath()%>/image/comdo/banner_red.jpg" target="_blank">
            				<img src="<%=request.getContextPath()%>/image/comdo/banner_red.jpg" width="100" border="0"></a></td>
            			<td align="center">
            				<a href="<%=request.getContextPath()%>/image/comdo/banner_orange.jpg" target="_blank">
            				<img src="<%=request.getContextPath()%>/image/comdo/banner_orange.jpg" width="100" border="0"></a></td>
            		</tr>
            		<tr>   
            			<% String  strStoreStyle = Str.get(supplier.getStoreStyle());%>    
            			<td>&nbsp;</td>
            			<td height="25" align="center">
            				<label><input type="radio" name="supplier.storeStyle" id="storeStyle" <%=strStoreStyle.equals("blue")?"checked":"" %> value="blue"/><font color="blue">蓝色</font></label>
            			</td> 
            			<td align="center"> 
            				<label><input type="radio" name="supplier.storeStyle" id="storeStyle" <%=strStoreStyle.equals("green")?"checked":"" %>  value="green"/><font color="green">绿色</font></label>
            			</td>
            			<td align="center">
            				<label><input type="radio" name="supplier.storeStyle" id="storeStyle" <%=strStoreStyle.equals("red")?"checked":"" %>  value="red"/><font color="red">红色</font></label>
            			</td>
            			<td align="center">
            				<label><input type="radio" name="supplier.storeStyle" id="storeStyle" <%=strStoreStyle.equals("orange")?"checked":"" %>  value="orange"/><font color="orange">橙色</font></label>
            			</td>
            		</tr> 
            		
            	</table>
            </td>          	
		</tr>	
		
		<tr>
			<td height="60" align="right">网店网址：</td>
            <td>&nbsp;<input type="text" name="supplier.storeUrl" id="storeUrl" size="40" value="<%=Str.get(supplier.getStoreUrl()) %>"> <br/>
            &nbsp;<font color="#666666">如果你有其它的网店地址，请填写，注：必须填写正确的地址，否则后果自行负责</font></td>          	
		</tr>
			
	</table>
	<!-- ******************************************** -->
	
	<!-- ******************************************** -->
	<table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
		<tr>
			<td width="5">&nbsp;</td>
			<td width="785" class="sm-title">填写企业简介</td>			
		</tr>
	</table>
	  
	<table align="center" width="790"cellpadding="0" cellspacing="0" border="0" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">
		<tr>
            <td>
            	<textarea id="content1" name="supplier.introduction" cols="100" rows="8" style="width:790px;margin-left:5px; height:300px;visibility:hidden;"><%=htmlspecialchars(supplier.getIntroduction() != null?supplier.getIntroduction():htmlData)%></textarea>
            	( 10000字以内 )<a href="javascript" onclick="return getcharNumber()">查看当前字数</a><span id="errorsDiv_content1"></span>
			</td>          	
		</tr>
	</table>
	<!-- ******************************************** -->
	
	<table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
		<tr>
			<td width="5">&nbsp;</td>
			<td width="785" class="sm-title">填写银行资料</td>			
		</tr>
	</table>    
	
	<table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="padding-top:10px; border-collapse:collapse;">			
		<tr>
			<td height="40" width="90" align="right">收款银行名称：</td>
            <td>&nbsp;<input type="text" name="bankinfo.bankName" id="bankName" size="40" value="<%=Str.get(bankinfo.getBankName())%>" /><span id="errorsDiv_bankinfo.bankName"></span></td>          	
		</tr>
		<tr>
			<td height="40" align="right">收款账号：</td>
            <td>&nbsp;<input type="text" name="bankinfo.account" id="account" size="40" value="<%=Str.get(bankinfo.getAccount())%>" /><span id="errorsDiv_bankinfo.account"></span></td>          	
		</tr>
		<tr>
			<td height="40" align="right">收款人名称：</td>
            <td>&nbsp;<input type="text" name="bankinfo.ownerName" id="ownerName" size="40" value="<%=Str.get(bankinfo.getOwnerName())%>" /><span id="errorsDiv_bankinfo.ownerName"></span></td>          	
		</tr>
		
	</table>
	
	<table align="center" width="790" height="40" cellpadding="0" cellspacing="0" style="padding-top:10px;">
		<tr>
			<td width="5">&nbsp;</td>
			<td width="785" class="sm-title">供应商经营状态</td>			
		</tr>
	</table>
	<table align="center" width="790"cellpadding="0" cellspacing="0" >		
		<tr>			
            <td height="40">&nbsp;
				<label for="runState_1"><input type="radio" name="supplier.runState" id="runState_1" value="Opening" class="radiocss" <%=supplier.getRunState().toString()
=="Opening"?"checked":"" %> />正在营业</label>
                    	<label for="runState_2"><input type="radio" name="supplier.runState" id="runState_2" value="Suspend" class="radiocss" <%=supplier.getRunState().toString()
=="Suspend"?"checked":"" %> />暂停营业</label>
                    	<label for="runState_3"><input type="radio" name="supplier.runState" id="runState_3" value="Closed" class="radiocss" <%=supplier.getRunState().toString()
=="Closed"?"checked":"" %> />清算退出</label>            
            </td>          	
		</tr>
		
	</table>
	
	<table align="center" width="790"cellpadding="0" cellspacing="0" >		
		<tr>			
            <td height="50" align="center"><input type="submit" class="sm-submit8" value="填写ok了,我要修改"></td>          	
		</tr>
		
	</table>
</form>	

<!-- *************************************
		弹出层
*************************************  -->
<div id="bgdiv" class="bgdiv"></div>
<div id="toopendiv" style="display:none;position:absolute;overflow:hidden;z-index:6553; ">

<table width="543" border="0" id="tablemenu" cellspacing="0" cellpadding="0" align="center"  background="<%=cp%>/image/title.gif" height="28">
  <tr> 
    <td height="28" width="513" valign="middle"><div class="move">请选择产品类别</div></td>
	<td align="left" width="30" ><img src="<%=cp%>/image/point_cha.gif" width="11" height="13" onclick="openBg(0);openSelect(0);" style="cursor:pointer;" alt="关闭" title="关闭" /></td>
  </tr>
</table>                    
<table width="543" border="0" id="tablecontent" cellspacing="0" cellpadding="0" align="center" class="openType_con">
  <%                   
  	int i=1;        
  	for(ProductType item:(List<ProductType>)request.getAttribute("firstType")) { %>
  <tr <%=i%2==0?"bgcolor='#e2f0fd'":"" %> >
    <td height="25" width="85" class="td_title" align="left" valign="top"><%=item.getPttypeName() %>:</td>
	<td class="td_w" valign="middle">         
			<%
				for(ProductType sec:(List<ProductType>)request.getAttribute("secondType")) {
					if(sec.getPtparentid() == item.getPtid()){                
			%>
			<a href="javascript:" onclick="onselProductType('<%=sec.getPttypeName()%>');"><span><%=sec.getPttypeName()%></span></a>
			<% 		} 
				} 
			%>
	</td>           
  </tr>
  <% i++;} %>                                   
 
  <tr><td height="10" colspan="2"></td></tr>
</table>	
</div>
              
		
              
 <script type="text/javascript">
 		var count = $("#toTbl")[0].rows.length-1;
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
			var newTd5 = newTr.insertCell(5);   
			//设置列内容和属性 
			newTd0.innerHTML = "<input type='hidden' name='licensebean["+count+"].licenseid' id='licenseid' value='<%=licenseid %>'><input name='licensebean["+count+"].certName' type='text' id='certName' size='14' />";
			newTd1.innerHTML = "<input name='licensebean["+count+"].permitUnit' type='text' id='permitUnit' size='20' />";
			newTd2.innerHTML = "<input name='licensebean["+count+"].certNumber' type='text' id='certNumber' size='14' />";
			newTd3.innerHTML = "&nbsp;";
			newTd4.innerHTML = "<input type='file' name='licensebean["+count+"].certPhoto' size='22' id='certPhoto' />";
			newTd5.innerHTML = "<a href='#' onclick='delRow("+count+")'>删除</a>";
			count++;
		}
	  function delRow(count){		 
			for(i=0;i<$("#toTbl")[0].rows.length;i++){	
				if($("#toTbl")[0].rows[i].id == count){
					$("#toTbl")[0].deleteRow(i);
				} 
			}
		}
</script>

<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
