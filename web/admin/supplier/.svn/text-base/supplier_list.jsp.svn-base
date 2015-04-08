<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bornsoft.asn.bean.supplier.*" %>
<%@ page import="com.bornsoft.asn.utils.common.AsnConstLib" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="com.bornsoft.asn.utils.common.Str"%>
<% String cp=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>供应商列表</title>
<script type="text/javascript" src="<%=cp%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>

<script type="text/javascript">
function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }
	}
}
function operationMember(val,operation){
	var checkboxArray = document.getElementsByName("tblistbox");
	var value = "";
	for(var i = 0;i < checkboxArray.length; i++){
		if(checkboxArray[i].checked)
        {
			if(value == ""){
				value += checkboxArray[i].value;
			}else{
				value += ","+checkboxArray[i].value;
			} 
        }
	}
	if(value == ""){
		alert("请选择供应商！");
	}else{
		if(operation == "check"){
			if(confirm('你确定审核该供应商?')){
				location.href="<%=cp%>/admin/supplier/adminCheckSupplier?supplierIdset="+value+"&checktype="+val;
			}
		}else if(operation == "del"){
			if(confirm('你确定删除该供应商?')){
				location.href="<%=cp%>/admin/supplier/delSupplierInfo?supplierIdset="+value;
			}
		}else if(operation == "promise"){
			if(confirm('你确定执行该操作?')){
				location.href="<%=cp%>/admin/supplier/updPromiseState?supplierIdset="+value+"&promisetype="+val;
			}
		}else if(operation == "lock"){
			if(confirm('你确定冻结该供应商?')){
				location.href="<%=cp%>/admin/supplier/updSupplierLocked?supplierIdset="+value+"&lock="+val;
			}
		}
		else if(operation == "unlock"){
			if(confirm('你确定恢复该供应商?')){
				location.href="<%=cp%>/admin/supplier/updSupplierLocked?supplierIdset="+value+"&lock="+val;
			}
		}
	}
	
}

</script>

<s:form action="listSupplier" name="myform" id="myform" method="post">
	<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">供应商列表</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="60%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="6%" class="color_h">
            	<input type="text" name="member.fullName" id="fullName" value="<s:property value="#request.member.fullName"/>" size="15">
		  	</td>
		  	
            <td width="17%" class="color_h">                      
            	<select name="supplier.supplierType">
				  		<option value="">供应商类型</option>
				  		<option value="1" <s:if test='supplier.supplierType == "1"'>selected</s:if> >机构</option>
				  		<option value="2" <s:if test='supplier.supplierType == "2"'>selected</s:if> >个人</option>
				  	</select>
            </td>
            <% Supplier s = (Supplier)request.getAttribute("supplier"); if(s==null)s = new Supplier(); %>
            <td width="17%" class="color_h">
            	<select name="supplier.approveState">
				  		<option value="">供应商状态</option>
				  		<option value="ManualVerify" <%=s.getApproveState()==AsnConstLib.SupplierApproveState.ManualVerify?"selected":"" %> >人工审核</option>
				  		<option value="Completed" <%=s.getApproveState()==AsnConstLib.SupplierApproveState.Completed?"selected":"" %> >审核完成</option>
				  		<option value="Rejected" <%=s.getApproveState()==AsnConstLib.SupplierApproveState.Rejected?"selected":"" %> >审核拒绝</option>
		  			</select>
            </td>
		  	<td width="17%" class="color_h">
		  		<select name="supplier.runState">
				  		<option value="">运营状态</option>
				  		<option value="Opening" <%=s.getRunState()==AsnConstLib.SupplierRunState.Opening?"selected":"" %> >正在营业</option>
				  		<option value="Suspend" <%=s.getRunState()==AsnConstLib.SupplierRunState.Suspend?"selected":"" %> >暂停营业</option>
				  		<option value="Closed" <%=s.getRunState()==AsnConstLib.SupplierRunState.Closed?"selected":"" %> >清算退出</option>
		  			</select></td>
            <td width="10%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listSupplier?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                   		<td height="28" align="center" bgcolor="#e8f5fb"><label><input type="checkbox" name="allSelect" id="allSelect" onclick="checkAll(this)" class="cbborder"></input>编号</label></td>
						<td align="center" bgcolor="#e8f5fb">供应商名称</td>
						<td align="center" bgcolor="#e8f5fb" width="40">类型</td>
						<td align="center" bgcolor="#e8f5fb">网店</td>	
						<!-- <td align="center" bgcolor="#e8f5fb">开户行名称</td>
						<td align="center" bgcolor="#e8f5fb">账户</td>
						<td align="center" bgcolor="#e8f5fb">开户人名称</td> -->
						<td align="center" bgcolor="#e8f5fb">担保状态</td>
						<td align="center" bgcolor="#e8f5fb">审核状态</td>	
						<td align="center" bgcolor="#e8f5fb">运营状态</td>
						<td align="center" bgcolor="#e8f5fb" width="50">诚信承诺</td>
						<td align="center" bgcolor="#e8f5fb">锁定状态</td>
                  </tr>             	
                  	
                  	<% List list = (List)request.getAttribute("searchlist"); 
                  	   for(int i=0; i<list.size(); i++){
                  		   Map<String,Object> m = new HashMap<String,Object>(); 
                  		   m = (Map)list.get(i);
                  	%>
                  		<tr>
						<td height="40"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=m.get("supplierId")%>"><%=m.get("supplierId")%></label></td>
						<td>&nbsp;<a href="<%=cp %>/admin/supplier/getSupplierById?id=<%=m.get("supplierId")%>"><%=m.get("fullName")%></a>
							<% if(m.get("supplierId") == "ManualVerify"){ %><IMG src="<%=cp%>/image/new-green.gif" /><% } %>
						</td>
						<td align="center"><%=m.get("supplierType").toString().equals("1")?"企业":"个人" %></td>	
						<td>&nbsp;<%=Str.get(m.get("storeName")) %></td>
						<td align="center">
							<%=	Str.get(m.get("vouchState")).equals("None")?"<font color=gray>未同意</font>":
								Str.get(m.get("vouchState")).equals("Agree")?"<FONT color=red>同意担保</font>":
								Str.get(m.get("vouchState")).equals("Disagree")?"<FONT color=blue>拒绝担保</font>":"&nbsp;" %>	
						</td>
						<td align="center">
							<%=	Str.get(m.get("approveState")).equals("Completed")?"<font color=red>审核完成</font>":
								Str.get(m.get("approveState")).equals("ManualVerify")?"<font color=blue>人工审核</font>":
								Str.get(m.get("approveState")).equals("Rejected")?"<font color=gary>已被拒绝</font>":"&nbsp;" %>	</td>
						
						<td align="center">
							<% if(!Str.get(m.get("approveState")).equals("ManualVerify")){ %>
								<%=	Str.get(m.get("runState")).equals("Opening")?"<font color=red>正在营业</font>":
									Str.get(m.get("runState")).equals("Suspend")?"<font color=blue>暂停营业</font>":
										Str.get(m.get("runState")).equals("Closed")?"<font color=gary>清算退出</font>":"&nbsp;" %>
							<% }else{ %>
								&nbsp;
							<% } %>							
						</td>
						       
						<td align="center">	
							<% if(Str.get(m.get("approveState")).equals("ManualVerify")){ %>		
								<img src="<%=cp%>/image/16_4.gif" alt="诚信承诺" title="诚信承诺" style="cursor:pointer;" />
							<% }else{ %>
								&nbsp;
							<% } %>				
						</td>
						
						<td align="center">
							<%=Str.get(m.get("locked")).equals("Locked")?"<font color=red>冻结</font>":"<font color=blue>自由</font>" %>
						</td>
					  </tr>
                  	
                  	<% } %>					
					</table>
					
					<table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
						<tr>
							<td align="left" height="40">
								<input type="button" value="审核通过" onclick="operationMember('1','check')" class="sm-buttom4-2" >
								<input type="button" value="审核不通过" onclick="operationMember('2','check')" class="sm-buttom5-2">
								<input type="button" value="删除" onclick="operationMember('0','del')" class="sm-buttom2-2" >
								<input type="button" value="冻结" onClick="operationMember('Locked','lock')" class="sm-buttom2-2" >
								<input type="button" value="恢复" onClick="operationMember('Unlocked','unlock')" class="sm-buttom2-2" >
								<input type="button" value="诚信承诺" onclick="operationMember('1','promise')" class="sm-buttom4-2" >
								<input type="button" value="取消诚信" onclick="operationMember('2','promise')" class="sm-buttom4-2" >
							</td>		
						</tr>     
					</table>        
					
					<table width="790" border="0" cellspacing="1" cellpadding="2" align="center">
						<s:property value="#request.pageBar" escape="false"/>
					</table>
		</td>
	</tr>
</table>
</s:form>
