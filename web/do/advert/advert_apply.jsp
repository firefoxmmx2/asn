<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@page import="com.bornsoft.asn.bean.advert.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<script type="text/javascript" src="<%=cp%>/js/jquery-ui-1.8rc3.custom.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/opendiv.js"></script>
<script type="text/javascript" src="<%=cp%>/js/butil.js"></script>
<script type="text/javascript" src="<%=cp%>/js/geoloc/geoloc.js"></script>
<style>
<!--
	.advertpadd{padding: 0 8px;}
	.checkboxcss{margin-top: -1px;margin-bottom:1px; margin-right: 2px; vertical-align: middle;}
-->
</style>
<script type="text/javascript">
<!--

function onloadPic(){
	var val = document.getElementById("onloadPic");
	if(val.checked){
		if(confirm("确定要上传效果图！")){
			openCarSelectDiv();
		}
	}
}

function applyAdvert(id){
	location.href="<%=cp%>/do/advert/insertAdvert?advertId="+id;
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
			return str.equals("A")?"<font color=blue>申请中</font>":str.equals("P")?"<font color=green>审核通过</font>":str.equals("S")?"<font color=red>已签订合同</font>":str.equals("U")?"<font color=red>审核未通过</font>":str.equals("C")?"撤销申请":"";
		}
	}
	ObjStatus obj = new ObjStatus();
	Advert adv = (Advert)request.getAttribute("advert");
	proposerAdvert pro = (proposerAdvert)request.getAttribute("proposerAdvert");

%>

		<table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>广告申请</strong></td>	
				<td width="50">[<a href="javascript:history.back();">返 回</a>]</td>	
			</tr>
		  </table>

 		<table align="center" width="790"cellpadding="0" cellspacing="0" border="0" bordercolor="#CCCCCC" style="padding-top:10px;">			
			
			<tr>
				<td width="290" height="220" align="center" style="border:1px #cccccc solid;">
				<% if(adv.getPicPath() == null){ %>
					<img src="<%=cp%>/pic/product/bnopic.jpg" width="270" height="200" />
				<% }else{ %>
					<a target="_blank" href="<%=cp%><%=adv.getPicPath().replace("/pic/product/s","/pic/product/b") %>">
						<img src="<%=cp%><%=adv.getPicPath() %>" width="270" height="200" border="0" />
					</a>
				<% } %>
				</td>
				<td width="500"><table width="100%" style="color:#333333;"> 
					<tr>
						<td height="30" align="right" width="90">广告名称：</td>						
						<td><font color="#000000"><strong><%=adv.getAdvName() %></strong></font>
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
						<td colspan="4" height="80">
							<%if(new Date().after(adv.getEndTime())){ %>
							<table width="60%" height="100%" style="background:#faf6c6;border:1px #e9d162 solid;margin-left:33px;color:#666666;">
								<tr>
									<td height="30" align="center" colspan="2" style="padding-left:10px;">该广告位已过申请期了</td>
								</tr>								            
							</table>
							
							<%}else{ %>
							<table width="60%" height="100%" style="background:#faf6c6;border:1px #e9d162 solid;margin-left:33px;color:#666666;">
								<tr>
									<td height="30" colspan="2" valign="bottom" style="padding-left:10px;">如果你对我们的广告位广告位感兴趣，还等什么？</td>
								</tr>
								<tr>
									<td style="padding-left:10px;" width="100">赶快申请吧！</td>
									<td> 
										<%if(pro == null || pro.getHandleStatus().toString().equals("C")){ %> 
										<input type="button" value="申 请 " class="sm-submit4" onclick="applyAdvert('<%=adv.getAdvertId()%>')" />
										<label><input type="checkbox" name="onloadPic" id="onloadPic" value="-1" class="checkboxcss" onclick="onloadPic();" /><font color="green">上传效果图</font></label>
										<%}else if(pro.getHandleStatus().toString().equals("A")){ %>
										<input type="button" value="撤 销 " class="sm-submit4" onclick="cancelAdvert('<%=pro.getProposerId() %>')" />
										<% } %>
									</td>              
								</tr>               
							</table>
							<% } %>					 	       
						</td>
					</tr>				
				</table></td>
			</tr>   
		  </table>	
		  
		  <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat; margin-top:10px;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>广告其它信息</strong></td>	       				
			</tr>
		  </table>  
		  
		  <table align="center" width="720"cellpadding="0" cellspacing="0" border="0" bordercolor="#CCCCCC" style="padding-top:10px;">			
			<tr>			
				<td height="30" valign="top" style="text-indent:2em"><%=adv.getDescription() %></td>
			</tr>			
		  </table>
		  
		  <% if(pro != null){  %>
		  <table align="center" width="790" height="24" cellpadding="0" cellspacing="0" style="background:url(<%=cp %>/image/comdo/dht_bg.gif) no-repeat; margin-top:10px;">
			<tr>
				<td width="5">&nbsp;</td>
				<td width="735"><strong>申请人信息</strong></td>	       				
			</tr>
		  </table>  
		  
		  <table align="center" width="770"cellpadding="0" cellspacing="0" border="0" bordercolor="#CCCCCC" style="padding-top:10px;">			
			<tr>
			<td width="120" height="120" align="center" style="border:1px #cccccc solid;">
				<% if(pro.getPicPath() == null){ %>
					<img src="<%=cp%>/pic/product/bnopic.jpg" width="100" height="100" />
				<% }else{ %>
					<a target="_blank" href="<%=cp%><%=pro.getPicPath().replace("/pic/product/s","/pic/product/b") %>">
						<img src="<%=cp%><%=pro.getPicPath() %>" width="100" height="100" border="0" />
					</a>
				<% } %>
				</td>
				<td width="500"><table width="100%" style="color:#333333;"> 
					<tr>
						<td height="30" align="right" width="90">申请人名称：</td>
						<td colspan="2"><font color="#000000"><strong><%=pro.getMember().getFullName() %></strong></font></td>  
					</tr>
					<tr>
						<td height="30" align="right" width="90">申请时间：</td>
						<td><%=new SimpleDateFormat("yyyy-MM-dd").format(pro.getApplyTime()) %></td> 
					</tr>
					<tr>
						<td height="30" align="right" width="90">办理状态：</td>
						<td><strong><%=obj.handleStatus(pro.getHandleStatus().toString()) %></strong></td> 
					</tr>
					<tr>
						<td height="30" align="right" width="90">处理时间：</td>        
						<td colspan="3"><%=pro.getHandleTime()== null?"未处理":new SimpleDateFormat("yyyy-MM-dd").format(pro.getHandleTime()) %></td>  
					</tr>									
				</table></td>
				</tr>
		  </table>
		  
		  <% } %>

<!-- *************************************
		弹出层
*************************************  -->
<div id="bgdiv" class="bgdiv"></div>
<div id="toopendiv" style="display:none;position:absolute;overflow:hidden;z-index:6553; ">

<form action="<%=cp%>/do/advert/insertAdvert" method="post" name="form1" id="form1" enctype="multipart/form-data">
<input type="hidden" name="advertId" id="advertId" value="<%=adv.getAdvertId()%>">
<table width="543" border="0" id="tablemenu" cellspacing="0" cellpadding="0" align="center"  background="<%=cp%>/image/title.gif" height="28">
  <tr> 
    <td height="28" width="513" valign="middle"><div class="move">上传效果图</div></td>
	<td align="left" width="30" ><img src="<%=cp%>/image/point_cha.gif" width="11" height="13" onclick="openBg(0);openSelect(0);" style="cursor:pointer;" alt="关闭" title="关闭" /></td>
  </tr>
</table>                    
<table width="543" border="0" id="tablecontent" cellspacing="0" cellpadding="0" align="center" class="openType_con">
   
   <tr>
    <td height="33">&nbsp;</td>
	<td class="td_w" valign="bottom">上传效果图，有利于我们对你申请的广告位更清楚的了解</td>           
  </tr>
   
   <tr>
    <td height="33" width="85" class="td_title" style="padding-top: 0;" align=left>效果图片:</td>
	<td class="td_w"><input type="file" name="advertPic" id="advertPic" size="50"></td>           
  </tr> 
  
  <tr>
    <td height="33">&nbsp;</td>
	<td class="td_w"><input type="submit" value=" 上 传 " class="sm-buttom2-2" ></td>           
  </tr> 
  <tr><td height="10" colspan="2"></td></tr>
</table>	
</form>

</div>		  
		  