<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@page import="com.bornsoft.asn.bean.advert.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>

<style>
<!--
	.advertpadd{padding: 0 8px;}
-->
</style>
<script type="text/javascript">
<!--
function optAdvert(val,id){
	if(confirm("你确定要执行该操作！")){
			location.href="<%=cp%>/admin/advert/updAdvertStatus?idset="+id+"&type="+val;
	}
}

function sucAdvert(id,proid){
	if(confirm("你确定成功申请该广告位！")){
			location.href="<%=cp%>/admin/advert/updAdvertHandleStatus?proposerId="+proid+"&advertId="+id;
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
	Advert adv = (Advert)request.getAttribute("advert");
	List<proposerAdvert> prolist = (List<proposerAdvert>)request.getAttribute("proposerAdvert");

%>

		<table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>广告状态信息</strong></td>	
				<td width="50">[<a href="javascript:history.back();">返 回</a>]</td>	
			</tr>
		  </table>
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="1" bordercolor="#CCCCCC" style="margin:10px 0; border-collapse:collapse;">			
			<tr>
				<td height="40" width="90" align="right">广告状态：</td>
	            <td style="color: #FF0000;">&nbsp;<strong><%=obj.status(adv.getStatus().toString())%></strong></td>
	            <td height="40" width="90" align="right">办理状态：</td>
	            <td style="color: #FF0000;">&nbsp;<strong><%=obj.handleStatus(adv.getHandleStatus().toString())%></strong></td>
			</tr>
		  </table>
		
          <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="margin-bottom:10px;background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="785"><strong>广告信息</strong></td>						
			</tr>
		  </table>
		  <table align="center" width="790"cellpadding="0" cellspacing="0" border="0" bordercolor="#CCCCCC" style="padding-top:10px;">			
			
			<tr>
				<td width="290" height="220" align="center" style="border:1px #cccccc solid;">
				<% if(adv.getPicPath() == null){ %>
					<img src="<%=cp%>/pic/product/bnopic.jpg" width="270" height="200" />
				<% }else{ %>
					<img src="<%=cp%><%=adv.getPicPath() %>" width="270" height="200" />
				<% } %>
				</td>
				<td width="500"><table width="100%" style="color:#333333;"> 
					<tr>
						<td height="30" align="right" width="90">广告名称：</td>
						<td colspan="2">
							<font color="#000000"><strong><%=adv.getAdvName() %></strong></font>
							<% if(new Date().after(adv.getEndTime())){ %>
								<font color="red"><strong>（广告已过期）</strong> </font>
							<% } %>
						</td>  
					</tr>
					<tr>
						<td height="30" align="right" width="90">广告类型：</td>
						<td><%=adv.getAdvType() %></td> 
						<td height="30" align="right" width="90">价格：</td>
						<td><font color="red"><%=adv.getQuote() %></font></td> 
					</tr>
					<tr>
						<td height="30" align="right" width="90">广告地址：</td>        
						<td colspan="3"><a href="<%=adv.getAdvAddress()%>" target="_blank"><%=adv.getAdvAddress() %></a></td>  
					</tr>
					
					<tr>
						<td height="30" align="right" width="90">开始时间：</td>
						<td><%=new SimpleDateFormat("yyyy-MM-dd ").format(adv.getStartTime())%></td>    
						<td height="30" align="right" width="90">结束时间：</td>
						<td><%=new SimpleDateFormat("yyyy-MM-dd ").format(adv.getEndTime()) %></td>   
					</tr>					
					<tr>
						<td height="30" align="right" width="90">创建时间：</td>
						<td><%=new SimpleDateFormat("yyyy-MM-dd ").format(adv.getCreateTime()) %></td>  
						<td height="30" align="right" width="90">创建人：</td>
						<td><%=adv.getCreateName() %></td> 
					</tr>	
					
					<tr>
						<td colspan="4" height="50">
							<table width="60%" height="100%" style="background:#faf6c6;border:1px #e9d162 solid;margin-left:33px;">
								<tr>
									<td align="center">
									    <%if(adv.getHandleStatus().toString().equals("C")){ %>
										<input type="button" value=" 发布 " onClick="optAdvert('publish','<%=adv.getAdvertId()%>')" class="sm-submit2" />
										<%}else if(adv.getHandleStatus().toString().equals("P")){ %>										
										<input type="button" value=" 撤销 " onClick="optAdvert('cancel','<%=adv.getAdvertId()%>')" class="sm-submit2" />     
										<% } %>
										<input type="button" value=" 关闭 " onClick="optAdvert('close','<%=adv.getAdvertId()%>')" class="sm-submit2" />      
									</td>   
								</tr>
							</table>					 	       
						</td>
					</tr>				
				</table></td>
			</tr>   
		  </table>	  
		  
		  <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="margin-top:10px;background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>客户申请信息</strong></td>	
			</tr>
		  </table>
			
		  <table width="790" border="0" cellspacing="0" cellpadding="0" style="margin:10px 0;" class="table_border">
                <tr>
                		<td height="28" align="center" width="100" bgcolor="#e8f5fb">效果图</td>
                   		<td align="center" width="90" bgcolor="#e8f5fb">客户编号</td>
						<td align="center" width="200" bgcolor="#e8f5fb">客户名称</td>
						<td align="center" width="130" bgcolor="#e8f5fb">联系电话</td>
						<td align="center" width="150" bgcolor="#e8f5fb">申请时间</td>
						<td align="center" width="120" bgcolor="#e8f5fb">操作</td>	
                </tr>
                
                <%for(int i=0; i<prolist.size();i++){
                	proposerAdvert p = prolist.get(i);
                %>               
				<tr>
					<td align="center">
						<% if(p.getPicPath() == null){ %>
						<img src="<%=cp%>/pic/product/bnopic.jpg" width="100" height="100" />
						<% }else{ %>
						<a target="_blank" href="<%=cp%><%=p.getPicPath().replace("/pic/product/s","/pic/product/b") %>"><img src="<%=cp%>/<%=p.getPicPath()%>" height="80" width="80" border="0" /></a> </td>
						<% } %>
					<td align="center"><%=p.getMemberId() %></td>
					<td class="advertpadd"><a href=""><%=p.getMember().getFullName() %></a></td>
					<td align="center"><%=p.getMember().getMobilePhone() ==null?"无":p.getMember().getMobilePhone() %>/<%=p.getMember().getFixedPhone()==null?"无":p.getMember().getFixedPhone() %></td>
					<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd ").format(p.getApplyTime()) %></td>
					<td align="center">
						<% if(adv.getHandleStatus().toString().equals("A")){ %>					
						<input type="button" value=" 申请成功 " onclick="sucAdvert('<%=p.getAdvertId()%>','<%=p.getProposerId()%>')">
						<% }else if(adv.getHandleStatus().toString().equals("P")){ %>
							<% if(p.getHandleStatus().toString().equals("P")){ %>
								<font color="green">申请成功<br/>等待签合同</font>
							<% }else{ %>
								申请失败
							<% } %>						
						<% } %>
					</td>	
				</tr>	
				
				<% } %>		
		  </table>
		  
		 