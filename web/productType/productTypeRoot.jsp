<div style="width: 100%; height: 275px;">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bornsoft.asn.bean.productType.ProductType,java.util.Map" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function onstyle(val,count){
	for(var i=1;i<=count;i++){
		if(i==val){
			//document.getElementById("ontbl"+i).style.border="0px #94d27f solid";
			document.getElementById("ontbl"+i).style.background="#edf9ed";
		}else{
			//document.getElementById("ontbl"+i).style.border="0px #EFEFEF solid";
			document.getElementById("ontbl"+i).style.background="#ffffff";	
		}
	}
}

</script>
<style>
<!--
body, button, input, select, textarea {font:12px/1.5 tahoma,arial,宋体,sans-serif;}
#category .bd {height:852px;}
.box-skin-blue .bd {background:none repeat scroll 0 0 white;}
.box-skin-blue .hd, .box-skin-blue .bd {border-color:#CFDAE4;}
.box .bd {background-color:#F7F7F7;border:1px solid #CCCCCC;}
.category-list {clear:left;}
.category-item-fashion  {height:auto;}/*二级分类高度*/
.category-item-fashion h4 {height:auto;padding-top:15px;}/*二级分类高度*/
.category-item h4 {background:none repeat scroll 0 0 #F4F8FB;border-right:1px solid #F4F8FB;color:#1A397C;float:left;font-size:14px;
line-height:20px;padding-left:4px;padding-right:4px;text-align:center;width:20px;}
h1, h2, h3, h4, h5, h6 {font-size:100%;}
body, h1, h2, h3, h4, h5, h6, hr, p, blockquote, dl, dt, dd, ul, ol, li, pre, form, fieldset, legend, button, input, textarea, th, td {
margin:0;padding:0;}
h5{color:#1c6e00;}
#category .bd a {color:#013DD9;}
ul{list-style: none;}
.category-item h4 a {color:#1A397C !important;}
a {color:#3E3E3E;}
a {text-decoration:none;}
/*category-item*/
.category-item{overflow:hidden;float:left;*float:none;width:100%;border-bottom:1px dashed #ccc;}/*div宽度*/
.category-item h4{float:left;width:20px;padding-left:4px;padding-right:4px;background:#d8f0ce;border-right:1px solid #95d380;color:#000000;font-size:14px;text-align:center;line-height:23px; height:auto;}/*一级分类背景样式*/
.category-item h4 a{color:#1f6f00!important;}/*一级分类文字样式*/
.category-item h4 a:hover{color:#f60!important;}
.category-item ul{float:left;width:90%;}/*div ul宽度*/
.category-item li{width:95%;float:left;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; margin:2px 0 1px;}/*三级分类样式*/
.category-item li h5{display:inline;padding-left:10px;padding-right:9px;margin-right:-4px;font-size:14px;line-height:20px;position:relative;bottom:-1px;}/*二级分类背景色*/
.category-item li div{display:inline;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;line-height:20px;height:20px;}
.category-item li div a{padding:0 0 0 3px;margin-left:-1px;*margin-left:-3px;_margin-left:-1px;border-left:1px solid #b7d0e4;display:inline-block;}




.category-item:hover,.category-item-hover{position:relative;z-index:2;margin:-2px -2px -1px -2px;background-color:#f4f8fb;border:2px solid #7cc0e3;}
.category-item:hover h4,.category-item-hover h4{border-color:#daedfb;}
.category-item:hover ul,.category-item-hover ul{border-color:#f4f8fb;}
.category-item:hover h5,.category-item-hover h5{background-color:#f4f8fb!important;}



/*clearfix*/
.clearfix{*zoom:1;}
.clearfix:after{content:'\20';display:block;height:0;clear:both;}

/*category-item-life*/
.category-item-life ul,.category-item-sport ul,.category-item-other ul,.category-item-fashion ul{padding-top:4px;}
.h{color:#011aa8!important; letter-spacing:3px;}/*三级分类文字样式*/
.wz_2{color:#ff6600!important;}/*二级分类文字样式*/



-->
</style>
<div class="bd">
<div class="category-list">
 <!--  遍历的分类   -->
<%	 
int i=0;
List list = (List)((Map)request.getAttribute("ptL")).get("ptFirstL");
String url0 = (String)request.getAttribute("url0");
	if(((Map)request.getAttribute("ptL")).get("ptFirstL") != null)
	for(ProductType item1 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptFirstL")){
	
	i++;
%>
<div class="category-item clearfix category-item-fashion" id="ontbl<%=i%>" onmouseover="onstyle('<%=i%>','<%=list.size()%>')">
<h4><a href="<%=url0 %>&type=<%=item1.getPtcode() %>" target="top"><%=item1.getPttypeName() %> </a></h4>
<!--  2级分类  -->
<% if(((Map)request.getAttribute("ptL")).get("ptSecL") != null) %>
<% for(ProductType item2 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptSecL")) {%>
<% if(item2.getPtparentid() == item1.getPtid() ) { %>
<ul>
	<li>
	<h5>
	<a
		href="<%=url0 %>&type=<%=item2.getPtcode() %>" class="wz_2" target="top"><%=item2.getPttypeName() %> </a></h5>
	<div>
	<!-- 3级分类 -->
	<% if(((Map)request.getAttribute("ptL")).get("ptThrL") != null) %>
	<% for(ProductType item3 : (List<ProductType>)((Map)request.getAttribute("ptL")).get("ptThrL")) { %>
	<% if(item3.getPtparentid() == item2.getPtid()) { %>
	<a
		href="<%=url0 %>&type=<%=item3.getPtcode() %>" class="h" target="top"> <%=item3.getPttypeName() %> </a>
	<% } //if item3 %>
	<% } //for item3 %>  
	</div>
	</li>
</ul>
<% } // if item2 %>
<% } // for item2 %>
</div>
<% } //for item1%>
</div>
</div>
</div>