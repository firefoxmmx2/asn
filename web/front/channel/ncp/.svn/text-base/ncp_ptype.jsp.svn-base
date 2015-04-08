<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.bornsoft.asn.bean.productType.ProductType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link
	href="${pageContext.request.contextPath }/css/newPtype/newPtype.css"
	rel="stylesheet" type="text/css">

<style>
.apg_show_type{width:600px;height:auto;position:absolute;z-index:400;}
.wzred{ color:#cc0000; font-size:12px; font-weight:bold; text-align:center; padding-top:6px;}
.wzred a:link { color:#cc0000; text-decoration: none} 
.wzred a:visited { color:#cc0000; text-decoration: none} 
.wzred a:hover { color: #800080; background-color:#FF9900; text-decoration: underline} 
.suxian{ color:#cccccc;}
.wzhei{ color:#555555; font-size:12px; line-height:20px;}
.line_bottom{border-bottom:1px solid #ffefd7; padding-bottom:8px; padding-top:8px;} 
.line_border{border:1px solid #cc3300; background:#fff9ef;}
.apg_show_type a:hover { color: #800080; background-color:#FF9900; text-decoration: underline} 

.apg_show_type a { display: inline-block; padding-left:3px; padding-right:3px; padding-top:2px;}
#apgTitle-bg{ position: absolute;z-index:400; cursor:pointer; border-left:1px solid #cc3300; border-top:1px solid #cc3300; border-bottom:1px solid #cc3300;border-right:1px solid #fff9ef;}  
.apg-bg02{border-left:1px solid #cc3300; border-top:1px solid #cc3300; border-bottom:1px solid #cc3300;}
</style>
<!-- 
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/newPtype/newPtype.js"></script> -->
	
<script type="text/javascript">
<!--
var delay_close = null;   
function showType(){	
	var _self = this;
	
	var pos = $(_self).offset(); 
	var left = parseInt(pos.left) + $(_self).width()-15;   
	var top = parseInt(pos.top);
	
	var leftBg = parseInt(pos.left);	
	var widthBg = $(_self).width()-15;
	var heightBg = $(_self).height()-1;
	
	clearTimeout(delay_close);
	$(".apg_show_type").css('left',left+'px').css('top',top+'px');
	
	$("#apgTitle-bg").css('left',leftBg+'px').css('top',(top+1)+'px').css('width',widthBg+'px').css('height',heightBg+'px');
	
	$('.apg_show_type').children().addClass('hidden');
	$('#apgTitle-bg').children().addClass('hidden');  
	
	$('table[id=subentry_' + $(_self).attr('id').split('_')[1] + ']').removeClass('hidden');
	$('.apg_show_type').removeClass('hidden');
	$('#apgTitle-bg').removeClass('hidden');
	
}

function hover_out()
{
	//var _self = this;
	
	//delay_close = setTimeout(function()
	//{
		$('.apg_show_type').addClass('hidden');
		$('#apgTitle-bg').addClass('hidden'); 
		
	//}, 10000);
}
function hover_active_pop()
{
	//clearTimeout(delay_close);
	$('.apg_show_type').removeClass('hidden');
	$('#apgTitle-bg').removeClass('hidden');
}
$(function(){	
	$(".extend_item").hover(showType,hover_out);
	$(".apg_show_type").hover(hover_active_pop,hover_out);
	$("#apgTitle-bg").hover(hover_active_pop,hover_out);
});

//-->
</script>	


	
<%
	Object ncpType = request.getSession().getAttribute("ncpMenuType");
	String ncpUrl = "/front/channel/ncp/listNcp"; 
	if(ncpType == null){
		ncpType = "male";
	}else if(ncpType.toString().equals("hot")){
		ncpUrl = "/front/channel/ncp/hotNcp"; 
	}
	@SuppressWarnings("unchecked")
	List<Map<String,Object>> ptype = (List<Map<String,Object>>)request.getAttribute("ptype");
	if(ptype == null)
		ptype = new ArrayList<Map<String,Object>>();
	
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="top" class="border_bule">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="entry">
			<%
				for(Map<String,Object> first: ptype){
			%>
			<tr>
				<td height="4" colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" class="fenlei_bg wz14 extend_item"
					id="entry_<%=((ProductType)first.get("cur")).getPtid() %>">
					<a	href="${pageContext.request.contextPath }<%=ncpUrl%>?ptypeCode=<%=((ProductType)first.get("cur")).getPtcode() %>&type=<%=ncpType%>">
					<span class="p10"><%=((ProductType)first.get("cur")).getPttypeName() %></span></a>
				</td>
			</tr>
			<%
					@SuppressWarnings("unchecked")
					List<Map<String,Object>> sec = (List<Map<String,Object>>)first.get("sub");
					if(sec == null)
						sec = new ArrayList<Map<String,Object>>();
					
					for(int ss=0;ss<sec.size();ss++){
						if(ss <= 3){
							if(ss % 2 == 0)
								out.println("<tr>");
							%>
			<td class="triangle"><a
				href="${pageContext.request.contextPath }<%=ncpUrl%>?ptypeCode=<%=((ProductType)sec.get(ss).get("cur")).getPtcode() %>&type=<%=ncpType%>"> <%=((ProductType)sec.get(ss).get("cur")).getPttypeName()%></a></td>
			<%
							if(ss % 2 == 1)
								out.println("</tr>");
						}
						else
							break;
					%>

			<%
					}	//loop second
				%>
			<%
				}// loop first
			%>
			<tr>
				<td height="4" colspan="2"></td>
			</tr>
		</table>	
		
		</td>
	</tr>
</table>



<div class="apg_show_type hidden" id="apgTypeshow">

<%
			for(Map<String,Object> first: ptype){
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="line_border item" id="subentry_<%=((ProductType)first.get("cur")).getPtid()%>">
  	<%
			@SuppressWarnings("unchecked")
			List<Map<String,Object>> sec = (List<Map<String,Object>>)first.get("sub");
			if(sec == null)
				sec = new ArrayList<Map<String,Object>>();
			for(Map<String,Object> secType : sec)
			{
	%>
  
  <tr>
       <td>
	       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="line_bottom">
             <tr>
               <td width="85" valign="top" class="wzred">
	               	<a	href="${pageContext.request.contextPath }<%=ncpUrl%>?ptypeCode=<%=((ProductType)secType.get("cur")).getPtcode() %>&type=<%=ncpType%>">
						<%=((ProductType)secType.get("cur")).getPttypeName()%>
					</a>
               </td>
               <td width="515"  class="wzhei">
               	<%
					@SuppressWarnings("unchecked")
					List<Map<String,Object>> third = (List<Map<String,Object>>)secType.get("sub");
					if(third == null)
						third = new ArrayList<Map<String,Object>>();
					for(Map<String,Object> thirdType : third)
					{
				%>
					<span class="suxian">|</span>
					<a	href="${pageContext.request.contextPath }<%=ncpUrl%>?ptypeCode=<%=((ProductType)thirdType.get("cur")).getPtcode() %>&type=<%=ncpType%>">
					<span class="third"><%=((ProductType)thirdType.get("cur")).getPttypeName()%></span></a>
				<% } %>
               </td>
               </tr>
         </table>

	   </td>
  </tr>  
  
  <% } %>
  
</table>

<% } %>

</div>

<div class="hidden" id="apgTitle-bg">

</div>
