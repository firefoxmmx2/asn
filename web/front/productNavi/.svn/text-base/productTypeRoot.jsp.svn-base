<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType,java.util.Map" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel=stylesheet type=text/css href="/asn/css/ptype/ptype.css">
<script type="text/javascript">
$(document).ready(function(){
	$("*[isTypeRow]").mouseover(function(){
		$(this).addClass("hover");
	});
	$("*[isTypeRow]").mouseout(function(){
		$(this).removeClass("hover");
	});

	var hpl=16;  // height Per Line (pixel)
	var cpl=35; //chars Per Line
	var blockWidth=220; // block width (pixel)
	$("*[catelevel=2]").each(function(){
		var size=0;;
		var list=$(this).find("li[catelevel=3]");
		for(var i=0; i<list.size(); i++){
			size+=$(list.get(i)).text().length;
		}
		if(size<=cpl*4){
			//$(this).css("height", (parseInt(size/cpl))*hpl+30+"px");
		}else{
			//$(this).css("height", (size/(cpl*2))*hpl+30+"px");
			$(this).css("width", blockWidth*2+"px");
			$(this).find("ul").css("width", blockWidth*2+"px");
		}
	});
	
	$(".HackBox").each(function(){
		var objTitle=$(this).parents("*[isTypeRow]").find("H4");
		var baseLine=$(this).offset().top-objTitle.offset().top;
		var height=parseInt(objTitle.css("font-size"))*objTitle.text().length;
		var padding=baseLine-height;
		if(padding<0) padding=0;
		objTitle.css("padding-top", padding/2);
		objTitle.css("height", baseLine-(padding/2));
	});
}); 
</script>

<!-- 类目开始 -->
<DIV id=CateContainer>
<DIV id=J_CategoryList class=category-list>
<%	 
int i=0;
List list = (List)((Map)request.getAttribute("ptL")).get("ptFirstL");
String url0 = (String)request.getAttribute("url0");
	if(((Map)request.getAttribute("ptL")).get("ptFirstL") != null)
	for(ProductType item1 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptFirstL")){
	
	i++;
%>
<!-- 一级类之二开始  -->
<DIV class=typeRow isTypeRow="yes" catelevel="1">
<H4><a href="<%=url0 %>&type=<%=item1.getPtcode() %>" target="_top"><%=item1.getPttypeName() %> </a></H4>
<UL id=cat-other>
  <!-- 二级类之一开始  -->
 <% if(((Map)request.getAttribute("ptL")).get("ptSecL") != null) %>
<% for(ProductType item2 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptSecL")) {%>
<% if(item2.getPtparentid() == item1.getPtid() ) { %>
  <LI catelevel="2"><A href="<%=url0 %>&type=<%=item2.getPtcode() %>" 
  target="_top"><%=item2.getPttypeName() %></A> 
  <UL class=CategoryListInlineSepLevel1>
    <!-- 三级类之一开始  -->
    <% if(((Map)request.getAttribute("ptL")).get("ptThrL") != null) %>
	<% for(ProductType item3 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptThrL")) { %>
	<% if(item3.getPtparentid() == item2.getPtid()) { %>
    <LI catelevel="3"><A href="<%=url0 %>&type=<%=item3.getPtcode() %>"  target="_top"><%=item3.getPttypeName() %></A> 
    </LI>
    <% } //if item3 %>
	<% } //for item3 %>  
    <!-- 三级类之一结束  -->
    </UL>
    <% } // if item2 %>
	<% } // for item2 %>
	<DIV class="HackBox"></DIV>
</LI></UL></DIV>
<!-- 一级类之二结束  -->
<% } //for item1%>
</DIV>
</DIV>
<!-- 类目表结束 -->