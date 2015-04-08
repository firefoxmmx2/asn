<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.advert.Advert" %>
<%@page import="java.text.SimpleDateFormat" %>
<% String cp = request.getContextPath(); %>
<style>
<!--
	.advertpadd{padding: 0 8px;}
-->
</style>

<script type="text/javascript">
<!--
function optAdvert(id){
	//if(confirm("你确定需要申请该广告位！")){
			location.href="<%=cp%>/do/advert/applyAdvert?advertId="+id;
	//}
}

function cancelAdvert(id){
	if(confirm("你确定要撤销申请！")){
			location.href="<%=cp%>/do/advert/cancelProposertAdvert?advertId="+id;
	}
}
//-->
</script>

<%
	class ObjStatus{		
		public String handleStatus(String str){
			return str.equals("A")?"<font color=blue>申请中</font>":str.equals("P")?"<font color=green>审核通过</font>":str.equals("S")?"<font color=red>已签订合同</font>":str.equals("U")?"<font color=red>审核未通过</font>":str.equals("C")?"撤销申请":"未申请";
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
                   	  	<td height="28" align="center" bgcolor="#e8f5fb" width="60"><label>序号</label></td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="220">广告名称</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="80">广告类型</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="60">所需价格</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="100">开始时间</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="100">结束时间</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="60">申请状态</td>
						<td height="28" align="center" bgcolor="#e8f5fb" width="100">操作</td>
                  </tr>	
                  
                  <% for(int i=0; i<listAdvert.size(); i++){
                	 	Advert adv = listAdvert.get(i);   
                  %>	
				  	<tr>
						<td height="40"><label><input type="checkbox" name="tblistbox" id="tblistbox" class="cbborder" value="<%=adv.getAdvertId() %>"><%=adv.getAdvertId() %></label></td>
						<td class="advertpadd"><a href="<%=cp%>/do/advert/applyAdvert?advertId=<%=adv.getAdvertId()%>"><%=adv.getAdvName()%></a>[详情]</td>
						<td align="center"><%=adv.getAdvType() %></td>	
						<td align="center"><%=adv.getQuote() %></td>
						<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd ").format(adv.getStartTime()) %></td>
						<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd ").format(adv.getEndTime()) %></td>
						<td align="center"><%=adv.getProposerAdvert()!=null && adv.getProposerAdvert().getHandleStatus() != null?obj.handleStatus(adv.getProposerAdvert().getHandleStatus().toString()):"未申请" %></td>						
						<td align="center">						
							<% if(adv.getProposerAdvert() == null){ %>
								<input type="button" value="申 请" onClick="optAdvert('<%=adv.getAdvertId()%>')" class="sm-buttom2-2" >
							<%}else{ 
								if(adv.getProposerAdvert().getHandleStatus() == null || adv.getProposerAdvert().getHandleStatus().toString().equals("C")){
								%>
									<input type="button" value="申 请" onClick="optAdvert('<%=adv.getAdvertId()%>')" class="sm-buttom2-2" >									
								<%
								}								
								else if(adv.getProposerAdvert().getHandleStatus().toString().equals("A")){
								%>
									<input type="button" value="撤 销" onClick="cancelAdvert('<%=adv.getProposerAdvert().getProposerId() %>')" class="sm-buttom2-2" >								
								<%
								}else{
								%>
									该状态不能操作
								<%
								}							
							} %>
						</td>
					  </tr>				   
				  <% } %>
		  </table>		  
		 
		<table width="790" border="0" cellspacing="1" cellpadding="2">
			<s:property value="#request.pageBar" escape="false"/>
		</table>
		</td>
	</tr>
</table>
</s:form>