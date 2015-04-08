<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*" %>
<%@page import="com.bornsoft.asn.bean.facade.ProductFacade;"%>
<% 
//最后一层分类显示其facade分类

	String urlf = (String)request.getAttribute("urlf");
	List<ProductFacade> facListf = (List<ProductFacade>)request.getAttribute("facListf");
	if(facListf != null && facListf.size() > 0){	
%>
<div>
<style>
body{font:12px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;}
ul { list-style: none; margin: 0px; padding: 0px; }
li{list-style:none;}
a{text-decoration:none;}
a:hover{text-decoration:underline;}
#ListSubCategory .SubCategoryBox {
	MARGIN-BOTTOM: 5px; PADDING-BOTTOM: 5px; OVERFLOW: hidden; WIDTH: 100%; BORDER-BOTTOM: #ccc 1px dashed; POSITION: relative
}
#ListSubCategory .SubCategoryBoxMore {
	RIGHT: 0px; POSITION: absolute; TOP: 4px
}
.mpv-nd .SubCategoryBox H5 {
	PADDING-RIGHT: 0px; MARGIN-TOP: -4px; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; PADDING-BOTTOM: 6px; LINE-HEIGHT: 24px; PADDING-TOP: 0px; BORDER-BOTTOM: #ccc 1px dashed
}
.mpv-nd .SubCategoryBox H5 A {
	FONT-WEIGHT: bold; COLOR: #666
}
.FindByHint{font-weight:bold; text-align:left; background:url(../image/point4h.gif) no-repeat;background-position:center left; line-height:26px; vertical-align:middle; padding-left:10px; }
#ListSubCategory .FindByHint {
	CLEAR: both; BACKGROUND-POSITION: -290px -223px; MARGIN-TOP: 5px; FONT-WEIGHT: normal; FONT-SIZE: 12px; TEXT-INDENT: 18px; LINE-HEIGHT: 20px; HEIGHT: 20px
}
UL.CategoryListTableLevel1 {
	PADDING-RIGHT: 0px; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none
}
UL.CategoryListTableLevel1 LI {
	FLOAT: left; MARGIN: 4px 0px; WIDTH: 185px; LINE-HEIGHT: 16px; WHITE-SPACE: nowrap
}
UL.CategoryListTableLevel1 a{color:#666;}
UL.CategoryListTableLevel1 a:hover{color:#f60;}
.HackBox {
	CLEAR: both
}
.HackBox {
	BORDER-TOP: transparent 0px solid; MARGIN-TOP: -1px! important; VISIBILITY: hidden}
</style>

<% for(ProductFacade pf : facListf) {%>
<div class="SubCategoryBox" 
	data-url=""
	data-type="款式">

<div class="FindByHint">按<strong><%=pf.getName() %></strong>选择：</div>
<ul class="CategoryListTableLevel1 hesper:expander">
	<div id="propDisp1">
	<% String values[] = pf.getValue().split(";");
		String options[] = pf.getOptions().split(";");
		for(int i=0;i<options.length;i++) {
	%>
	<li>
		<a href="<%=urlf %>&type=<%=pf.getPtCode() %>&facade=<%=values[i] %>"><%=options[i] %></a><i></i>
	</li>
	<% } %>
	
	</div>
</ul>

<div class="HackBox"></div>
</div>
<% }%>
</div>
<% } 
else {%>
<div style="margin: auto;">
	暂无子类
</div>
<% }%>