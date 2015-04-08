<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.advert.Advert" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.bornsoft.asn.utils.common.Calculator" %>
<% String cp = request.getContextPath(); %>
<style>
<!--
	.advertpadd{padding: 0 8px;}
-->
</style>

<script type="text/javascript">
<!--
function checkAll(obj){
	var checkbox=document.getElementsByName("tblistbox");
	for(var i = 0;i < checkbox.length; i++){
		if(checkbox[i].type == "checkbox")
        {
			checkbox[i].checked = obj.checked;
        }
	}
}
function optAdvert(val){
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
		alert("请选择用户！");
	}else{
		if(confirm("你确定要执行该操作！")){
			location.href="<%=cp%>/admin/advert/updAdvertStatus?idset="+value+"&type="+val;
		}
	}
	
}

//-->
</script>

<%
	class ObjStatus{
		public String status(String str){
			return str.equals("N")?"未发布":str.equals("P")?"<font color=green>已发布</font>":str.equals("C")?"<font color=blue>已撤销</font>":str.equals("S")?"<font color=red>已关闭</font>":"";
		}
		public String handleStatus(String str){
			return str.equals("N")?"未申请":str.equals("A")?"<font color=blue>申请中</font>":str.equals("P")?"<font color=green>申请成功</font>":str.equals("S")?"<font color=red>已签订合同</font>":"";
		}
	}
	ObjStatus obj = new ObjStatus();
	List<Advert> listAdvert = (List<Advert>)request.getAttribute("listAdvert");	
%>

<s:form action="listMemberByParam" name="myform" id="myform" method="post">
	<table align="center" width="792" height="51" cellpadding="0" cellspacing="0">
   	<tr>
         <td height="39" class="title">广告列表</td>
   	</tr>  
	<tr>
		<td height="51" class="boder_y">
	 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
          <tr>	  	
            <td width="17%" class="color_h">
            	<input type="text" name="advert.advName" id="advert.advName" value="<s:property value="#request.advert.advName"/>" />
            </td>           		  
            <td width="10%" align="center"><img src="../../image/comdo/button_qd.gif" width="50" height="25" onClick="myform.action='listAdvert?pageType=sub';myform.submit();" style="cursor:pointer;" /></td>
          </tr>
        </table>
		</td>
	</tr>
	
	<tr>
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" class="table_border">
                   <tr>
                   	  	<td height="28" align="center" bgcolor="#e8f5fb" width="60"><label><input type="checkbox" name="allSelect" id="allSelect" class="cbborder" onClick="checkAll(this)"></input>序号</label></td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="200">广告名称</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="80">广告类型</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="60">所需价格</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="100">开始时间</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="100">结束时间</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="60">广告状态</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="60">办理状态</td>      
						<td height="28" align="center" bgcolor="#e8f5fb" width="50">操作</td>
                  </tr>	
                  
                  <% for(int i=0; i<listAdvert.size(); i++){
                	 	Advert adv = listAdvert.get(i);   
                  %>	
				  	<tr>
						<td height="40"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=adv.getAdvertId() %>"><%=adv.getAdvertId() %></label></td>
						<td class="advertpadd"><a href="<%=cp%>/admin/advert/infoAdvert?advertId=<%=adv.getAdvertId()%>"><%=adv.getAdvName()%></a>[详情]</td>
						<td align="center"><%=adv.getAdvType() %></td>	
						<td align="center"><%=Calculator.keepTwoDecimal(adv.getQuote()) %></td>
						<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd ").format(adv.getStartTime()) %></td>
						<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd ").format(adv.getEndTime()) %></td>
						<td align="center"><%=obj.status(adv.getStatus().toString()) %></td>
						<td align="center"><%=obj.handleStatus(adv.getHandleStatus().toString()) %></td>
						<td align="center">
							<a href="<%=request.getContextPath()%>/admin/advert/toUpdateAdvert?advertId=<%=adv.getAdvertId()%>" target="_blank">修改</a>
						</td>
					  </tr>				  
				  <% } %>
		  </table>
		  
		  <table width="790" border="0" align="center" cellspacing="1" cellpadding="2" style="border-top:1px #6cbc48 solid;">
			<tr>
				<td align="left" height="40">
					<input type="button" value="新增" onClick="javascript:location.href='advert_add.jsp'" class="sm-buttom2-2" >
					<input type="button" value="发布" onClick="optAdvert('publish')" class="sm-buttom2-2" >
					<input type="button" value="撤销" onClick="optAdvert('cancel')" class="sm-buttom2-2" >
					<input type="button" value="关闭" onClick="optAdvert('close')" class="sm-buttom2-2" >
				</td>		
			</tr>
		</table>
		<table width="790" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
		</table>
		</td>
	</tr>
</table>
</s:form>